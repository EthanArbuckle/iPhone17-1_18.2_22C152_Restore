@interface IDSRegistrationKeychainReader
+ (id)keychainAccessGroupForVersion:(unint64_t)a3;
+ (id)keychainAccountForVersion:(unint64_t)a3;
+ (id)keychainServiceForVersion:(unint64_t)a3;
+ (id)sharedInstance;
- (IDSRegistrationKeychainReader)init;
- (id)registrationData;
- (id)registrationWithServiceType:(id)a3 accountType:(int)a4 isTemporary:(BOOL)a5 value:(id)a6;
- (void)_flush;
- (void)_reloadFromDictionaryLocked:(id)a3;
- (void)_reloadFromKeychainLocked;
- (void)_setPurgeTimer;
- (void)dealloc;
- (void)flushCache;
@end

@implementation IDSRegistrationKeychainReader

+ (id)sharedInstance
{
  if (qword_1EB2BB718 != -1) {
    dispatch_once(&qword_1EB2BB718, &unk_1EEFCD4F8);
  }
  v2 = (void *)qword_1EB2BB768;
  return v2;
}

- (IDSRegistrationKeychainReader)init
{
  v25.receiver = self;
  v25.super_class = (Class)IDSRegistrationKeychainReader;
  v2 = [(IDSRegistrationKeychainReader *)&v25 init];
  if (v2)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v2);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = sub_19DA1C528;
    v21[3] = &unk_1E5973C90;
    objc_copyWeak(&v23, &location);
    v3 = v2;
    v22 = v3;
    uint64_t v7 = objc_msgSend_copy(v21, v4, v5, v6);
    id purgeCancelBlock = v3->_purgeCancelBlock;
    v3->_id purgeCancelBlock = (id)v7;

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_19DA1C588;
    v18[3] = &unk_1E5973C90;
    objc_copyWeak(&v20, &location);
    v9 = v3;
    v19 = v9;
    uint64_t v13 = objc_msgSend_copy(v18, v10, v11, v12);
    id purgeEnqueueBlock = v9->_purgeEnqueueBlock;
    v9->_id purgeEnqueueBlock = (id)v13;

    pthread_mutex_lock(&stru_1E944DB58);
    registrationData = v9->_registrationData;
    v9->_registrationData = 0;

    pthread_mutex_unlock(&stru_1E944DB58);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v9, (CFNotificationCallback)sub_19DA1C688, @"__kIDSRegistrationKeychainChangedNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  pthread_mutex_lock(&stru_1E944DB58);
  pthread_mutex_unlock(&stru_1E944DB58);
  v3.receiver = self;
  v3.super_class = (Class)IDSRegistrationKeychainReader;
  [(IDSRegistrationKeychainReader *)&v3 dealloc];
}

+ (id)keychainServiceForVersion:(unint64_t)a3
{
  if (a3)
  {
    v4 = @"com.apple.facetime";
  }
  else
  {
    v4 = @"com.apple.iChat.VeniceRegistrationAgent";
  }
  return v4;
}

+ (id)keychainAccountForVersion:(unint64_t)a3
{
  if (a3)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"%@V%d", v3, @"registration", a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = @"VeniceInfo";
  }
  return v4;
}

+ (id)keychainAccessGroupForVersion:(unint64_t)a3
{
  return @"apple";
}

- (void)_flush
{
  double v3 = im_primary_queue();
  dispatch_async(v3, self->_purgeCancelBlock);

  pthread_mutex_lock(&stru_1E944DB58);
  registrationData = self->_registrationData;
  self->_registrationData = 0;

  v8 = objc_msgSend_keychainManager(MEMORY[0x1E4F6C3B8], v5, v6, v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_19D9BE000, v8, OS_LOG_TYPE_DEFAULT, "Purged keychain reader", v9, 2u);
  }

  pthread_mutex_unlock(&stru_1E944DB58);
}

- (void)flushCache
{
}

- (void)_setPurgeTimer
{
  double v3 = im_primary_queue();
  dispatch_async(v3, self->_purgeEnqueueBlock);
}

- (void)_reloadFromDictionaryLocked:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v7 = objc_msgSend_objectForKey_(v4, v5, @"data", v6);
  v10 = objc_msgSend_objectForKey_(v4, v8, @"save-identifier", v9);

  v14 = (NSMutableArray *)objc_msgSend_mutableCopy(v7, v11, v12, v13);
  registrationData = self->_registrationData;
  self->_registrationData = v14;

  int v19 = objc_msgSend_count(self->_registrationData, v16, v17, v18);
  id v23 = objc_msgSend_keychainManager(MEMORY[0x1E4F6C3B8], v20, v21, v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24[0] = 67109378;
    v24[1] = v19;
    __int16 v25 = 2112;
    v26 = v10;
    _os_log_impl(&dword_19D9BE000, v23, OS_LOG_TYPE_DEFAULT, "Loaded keychain dictionary, %d entries, saveIdentifier %@", (uint8_t *)v24, 0x12u);
  }
}

- (id)registrationData
{
  pthread_mutex_lock(&stru_1E944DB58);
  registrationData = self->_registrationData;
  if (!registrationData)
  {
    objc_msgSend__reloadFromKeychainLocked(self, v3, v4, v5);
    registrationData = self->_registrationData;
  }
  double v7 = objc_msgSend_copy(registrationData, v3, v4, v5);
  pthread_mutex_unlock(&stru_1E944DB58);
  objc_msgSend__setPurgeTimer(self, v8, v9, v10);
  return v7;
}

- (void)_reloadFromKeychainLocked
{
  id v3 = 0;
  unint64_t v4 = 0;
  uint64_t v153 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = 2;
  while (1)
  {
    double v6 = v3;
    double v7 = objc_opt_class();
    double v10 = objc_msgSend_keychainServiceForVersion_(v7, v8, v5, v9);
    uint64_t v11 = objc_opt_class();
    v14 = objc_msgSend_keychainAccountForVersion_(v11, v12, v5, v13);
    v15 = objc_opt_class();
    double v18 = objc_msgSend_keychainAccessGroupForVersion_(v15, v16, v5, v17);
    int v146 = 0;
    double v22 = objc_msgSend_keychainManager(MEMORY[0x1E4F6C3B8], v19, v20, v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)v148 = v5;
      *(_WORD *)&v148[4] = 2112;
      *(void *)&v148[6] = v10;
      __int16 v149 = 2112;
      id v150 = v14;
      __int16 v151 = 2112;
      v152 = v18;
      _os_log_impl(&dword_19D9BE000, v22, OS_LOG_TYPE_INFO, "Attempting to load V%d keychain blob from service: %@   account: %@   accessGroup: %@", buf, 0x26u);
    }

    v145[1] = v6;
    int v23 = IMGetKeychainData();
    id v3 = v6;

    if (v23)
    {
      if (v3) {
        break;
      }
    }

    ++v4;
    --v5;
    if (v4 > 2)
    {
      uint64_t v5 = 0;
      goto LABEL_12;
    }
  }
  v30 = objc_msgSend_keychainManager(MEMORY[0x1E4F6C3B8], v24, v25, v26);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v148 = v5;
    _os_log_impl(&dword_19D9BE000, v30, OS_LOG_TYPE_INFO, "  => Found V%d keychain blob", buf, 8u);
  }

LABEL_12:
  if (objc_msgSend_length(v3, v27, v28, v29))
  {
    v145[0] = 0;
    objc_msgSend_propertyListWithData_options_format_error_(MEMORY[0x1E4F28F98], v32, (uint64_t)v3, v33, 0, 0, v145);
    id v34 = (id)objc_claimAutoreleasedReturnValue();
    id v35 = v145[0];
    v39 = v35;
    if (!v34)
    {
      v47 = objc_msgSend_keychainManager(MEMORY[0x1E4F6C3B8], v36, v37, v38);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v148 = v39;
        _os_log_impl(&dword_19D9BE000, v47, OS_LOG_TYPE_DEFAULT, "Unable to parse property list: %@", buf, 0xCu);
      }

      v48 = objc_opt_class();
      v51 = objc_msgSend_keychainServiceForVersion_(v48, v49, v5, v50);
      v52 = objc_opt_class();
      objc_msgSend_keychainAccountForVersion_(v52, v53, v5, v54);
      id v55 = (id)objc_claimAutoreleasedReturnValue();
      v59 = objc_msgSend_keychainManager(MEMORY[0x1E4F6C3B8], v56, v57, v58);
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v148 = v5;
        *(_WORD *)&v148[4] = 2112;
        *(void *)&v148[6] = v51;
        __int16 v149 = 2112;
        id v150 = v55;
        _os_log_impl(&dword_19D9BE000, v59, OS_LOG_TYPE_DEFAULT, "Removing invalid keychain data (V%d) for service: %@   account: %@", buf, 0x1Cu);
      }

      int v146 = 0;
      if ((IMRemoveKeychainData() & 1) == 0)
      {
        v63 = objc_msgSend_keychainManager(MEMORY[0x1E4F6C3B8], v60, v61, v62);
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v148 = v146;
          _os_log_impl(&dword_19D9BE000, v63, OS_LOG_TYPE_DEFAULT, "  => Unable to remove invalid keychain blob (error: %d)", buf, 8u);
        }
      }
      id v34 = 0;
      goto LABEL_76;
    }

    v42 = objc_msgSend_objectForKey_(v34, v40, @"version", v41);
    v39 = v42;
    if (v42) {
      unint64_t v46 = objc_msgSend_unsignedIntegerValue(v42, v43, v44, v45);
    }
    else {
      unint64_t v46 = 0;
    }
    if (v46 >= 2) {
      goto LABEL_77;
    }
    v64 = objc_msgSend_keychainManager(MEMORY[0x1E4F6C3B8], v43, v44, v45);
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v148 = v46;
      _os_log_impl(&dword_19D9BE000, v64, OS_LOG_TYPE_DEFAULT, "Keychain dictionary V%d needs upgrade", buf, 8u);
    }

    id v55 = v34;
    if (!objc_msgSend_count(v55, v65, v66, v67))
    {
      id v34 = 0;
LABEL_75:
      v51 = v55;
LABEL_76:

LABEL_77:
      objc_msgSend__reloadFromDictionaryLocked_(self, v142, (uint64_t)v34, v143);
      goto LABEL_78;
    }
    id v68 = v55;
    v144 = objc_msgSend_objectForKey_(v68, v69, @"version", v70);
    unint64_t v74 = objc_msgSend_unsignedIntegerValue(v144, v71, v72, v73);
    v78 = objc_msgSend_keychainManager(MEMORY[0x1E4F6C3B8], v75, v76, v77);
    v79 = v78;
    if (v74 > 2)
    {
      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v148 = v74;
        *(_WORD *)&v148[4] = 1024;
        *(_DWORD *)&v148[6] = 2;
        _os_log_impl(&dword_19D9BE000, v79, OS_LOG_TYPE_DEFAULT, "Invalid keychain dict version (%d) -- current is %d", buf, 0xEu);
      }

      id v34 = 0;
LABEL_74:

      goto LABEL_75;
    }
    if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v148 = 2;
      _os_log_impl(&dword_19D9BE000, v79, OS_LOG_TYPE_INFO, "Updating keychain dict to current version (%d)", buf, 8u);
    }

    v83 = objc_msgSend_keychainManager(MEMORY[0x1E4F6C3B8], v80, v81, v82);
    if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v148 = v68;
      _os_log_impl(&dword_19D9BE000, v83, OS_LOG_TYPE_INFO, "Keychain dictionary before upgrade : %@", buf, 0xCu);
    }

    if (v74 >= 2)
    {
LABEL_71:
      v141 = objc_msgSend_keychainManager(MEMORY[0x1E4F6C3B8], v84, v85, v86);
      if (os_log_type_enabled(v141, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v148 = v68;
        _os_log_impl(&dword_19D9BE000, v141, OS_LOG_TYPE_INFO, "Keychain dictionary after upgrade : %@", buf, 0xCu);
      }

      id v34 = v68;
      id v68 = v34;
      goto LABEL_74;
    }
    while (1)
    {
      if (v74 == 1)
      {
        v92 = objc_msgSend_keychainManager(MEMORY[0x1E4F6C3B8], v84, v85, v86);
        if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19D9BE000, v92, OS_LOG_TYPE_INFO, "  => Updating from V1 to V2", buf, 2u);
        }
        unint64_t v74 = 2;
        goto LABEL_70;
      }
      v87 = objc_msgSend_keychainManager(MEMORY[0x1E4F6C3B8], v84, v85, v86);
      if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D9BE000, v87, OS_LOG_TYPE_INFO, "  => Updating from V0 to V1", buf, 2u);
      }

      v88 = v68;
      v92 = v88;
      if (!v88 || !objc_msgSend_count(v88, v89, v90, v91))
      {
        v96 = objc_msgSend_keychainManager(MEMORY[0x1E4F6C3B8], v89, v90, v91);
        if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19D9BE000, v96, OS_LOG_TYPE_DEFAULT, "Unable to upgrade an empty keychain data from V0 to V1", buf, 2u);
        }
        id v68 = 0;
        goto LABEL_69;
      }
      objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v89, v90, v91);
      id v68 = (id)objc_claimAutoreleasedReturnValue();
      v96 = objc_msgSend_mutableCopy(v92, v93, v94, v95);
      v100 = (__CFDictionary *)objc_msgSend_mutableCopy(v92, v97, v98, v99);
      v103 = objc_msgSend_objectForKey_(v92, v101, @"type", v102);
      int v107 = objc_msgSend_intValue(v103, v104, v105, v106);

      if (!v107) {
        break;
      }
      if (v107 == 1)
      {
        v110 = objc_msgSend_objectForKey_(v92, v108, @"phone-number", v109);
        if (v110) {
          CFDictionarySetValue((CFMutableDictionaryRef)v96, @"main-id", v110);
        }

        v113 = objc_msgSend_objectForKey_(v92, v111, @"phone-number", v112);
        if (v113) {
          CFDictionarySetValue(v100, @"main-id", v113);
        }

        v116 = objc_msgSend_objectForKey_(v92, v114, @"user-id", v115);
        if (v116) {
          CFDictionarySetValue((CFMutableDictionaryRef)v96, @"profile-id", v116);
        }

        v119 = objc_msgSend_objectForKey_(v92, v117, @"user-id", v118);
        if (v119)
        {
          v120 = v100;
          v121 = @"profile-id";
          goto LABEL_66;
        }
        goto LABEL_67;
      }
LABEL_68:
      CFDictionarySetValue((CFMutableDictionaryRef)v96, @"migrated-v0-dictionary", v92);
      CFDictionarySetValue(v100, @"migrated-v0-dictionary", v92);
      v125 = _StringForIDSRegistrationServiceType(@"FaceTime");
      objc_msgSend_setObject_forKey_(v96, v126, (uint64_t)v125, v127, @"service");

      v128 = _StringForIDSRegistrationServiceType(@"iMessage");
      objc_msgSend_setObject_forKey_(v100, v129, (uint64_t)v128, v130, @"service");

      v133 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v131, 1, v132);
      objc_msgSend_setObject_forKey_(v68, v134, (uint64_t)v133, v135, @"version");

      v138 = objc_msgSend_arrayWithObjects_(MEMORY[0x1E4F1C978], v136, (uint64_t)v96, v137, v100, 0);
      objc_msgSend_setObject_forKey_(v68, v139, (uint64_t)v138, v140, @"data");

LABEL_69:
      unint64_t v74 = 1;
LABEL_70:

      if (v74 >= 2) {
        goto LABEL_71;
      }
    }
    v122 = objc_msgSend_objectForKey_(v92, v108, @"phone-number", v109);
    if (v122) {
      CFDictionarySetValue((CFMutableDictionaryRef)v96, @"main-id", v122);
    }

    v119 = objc_msgSend_objectForKey_(v92, v123, @"phone-number", v124);
    if (v119)
    {
      v120 = v100;
      v121 = @"main-id";
LABEL_66:
      CFDictionarySetValue(v120, v121, v119);
    }
LABEL_67:

    goto LABEL_68;
  }
  id v34 = 0;
  objc_msgSend__reloadFromDictionaryLocked_(self, v32, 0, v33);
LABEL_78:
}

- (id)registrationWithServiceType:(id)a3 accountType:(int)a4 isTemporary:(BOOL)a5 value:(id)a6
{
  BOOL v7 = a5;
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v52 = a3;
  id v50 = a6;
  pthread_mutex_lock(&stru_1E944DB58);
  if (a4 == 2)
  {
    double v13 = objc_msgSend_keychainManager(MEMORY[0x1E4F6C3B8], v10, v11, v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v13, OS_LOG_TYPE_INFO, "Ignoring keychain registration request for local account", buf, 2u);
    }

    id v14 = 0;
  }
  else
  {
    if (!self->_registrationData) {
      objc_msgSend__reloadFromKeychainLocked(self, v10, v11, v12);
    }
    v15 = objc_msgSend_keychainManager(MEMORY[0x1E4F6C3B8], v10, v11, v12);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = _StringForIDSRegistrationServiceType(v52);
      uint64_t v17 = _StringForIDSAccountType(a4);
      double v18 = (void *)v17;
      int v19 = @"NO";
      *(_DWORD *)buf = 138413058;
      v59 = v16;
      if (v7) {
        int v19 = @"YES";
      }
      __int16 v60 = 2112;
      uint64_t v61 = v17;
      __int16 v62 = 2112;
      v63 = v19;
      __int16 v64 = 2112;
      id v65 = v50;
      _os_log_impl(&dword_19D9BE000, v15, OS_LOG_TYPE_INFO, "Looking up registration with service type: %@  account type: %@  temporary: %@  value: %@", buf, 0x2Au);
    }
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    obj = self->_registrationData;
    uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v20, (uint64_t)&v53, v21, v57, 16);
    if (v22)
    {
      uint64_t v25 = v22;
      v49 = self;
      if (v7) {
        unsigned int v26 = 2;
      }
      else {
        unsigned int v26 = 0;
      }
      uint64_t v27 = *(void *)v54;
      if (a4) {
        uint64_t v28 = 1;
      }
      else {
        uint64_t v28 = v26;
      }
      while (2)
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v54 != v27) {
            objc_enumerationMutation(obj);
          }
          v30 = *(void **)(*((void *)&v53 + 1) + 8 * i);
          v31 = objc_msgSend_objectForKey_(v30, v23, @"type", v24, v49);
          int v35 = objc_msgSend_intValue(v31, v32, v33, v34);

          double v38 = objc_msgSend_objectForKey_(v30, v36, @"service", v37);
          _IDSRegistrationServiceTypeForString(v38);
          id v39 = (id)objc_claimAutoreleasedReturnValue();

          if (v35 == v28
            && (v39 == v52 || objc_msgSend_isEqualToString_(v39, v40, (uint64_t)v52, v41)))
          {
            v42 = objc_msgSend_objectForKey_(v30, v40, (uint64_t)off_1E5973CD8[v28], v41);
            if (objc_msgSend_isEqualToString_(v42, v43, (uint64_t)v50, v44))
            {
              id v14 = v30;

              goto LABEL_30;
            }
          }
        }
        uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v23, (uint64_t)&v53, v24, v57, 16);
        if (v25) {
          continue;
        }
        break;
      }
      id v14 = 0;
LABEL_30:
      self = v49;
    }
    else
    {
      id v14 = 0;
    }

    pthread_mutex_unlock(&stru_1E944DB58);
    objc_msgSend__setPurgeTimer(self, v45, v46, v47);
  }

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_purgeEnqueueBlock, 0);
  objc_storeStrong(&self->_purgeCancelBlock, 0);
  objc_storeStrong((id *)&self->_purgeTimer, 0);
  objc_storeStrong((id *)&self->_registrationData, 0);
}

@end