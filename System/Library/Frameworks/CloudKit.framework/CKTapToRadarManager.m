@interface CKTapToRadarManager
+ (id)sharedManager;
- (CKTapToRadarManager)init;
- (NSMutableDictionary)lastPromptDateByMessageHash;
- (NSUserDefaults)userDefaults;
- (OS_dispatch_queue)alertQueue;
- (id)_hashForMessage:(id)a3;
- (id)_lastPromptDateForMessage:(id)a3;
- (id)initInternal;
- (void)_launchTTRWithRequest:(id)a3;
- (void)_lockedTriggerTapToRadarWithRequest:(id)a3;
- (void)_notePromptAttemptForMessage:(id)a3;
- (void)setAlertQueue:(id)a3;
- (void)setLastPromptDateByMessageHash:(id)a3;
- (void)setUserDefaults:(id)a3;
- (void)triggerTapToRadarWithRequest:(id)a3;
@end

@implementation CKTapToRadarManager

- (CKTapToRadarManager)init
{
  v6 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, v2, v3);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v6, v7, (uint64_t)a2, (uint64_t)self, @"CKTapToRadarManager.m", 32, @"Please use +[CKTapToRadarManager sharedManager]");

  return 0;
}

- (id)initInternal
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v36.receiver = self;
  v36.super_class = (Class)CKTapToRadarManager;
  uint64_t v2 = [(CKTapToRadarManager *)&v36 init];
  if (v2)
  {
    uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.cloudkit.taptoradar.alertQueue", v4);
    alertQueue = v2->_alertQueue;
    v2->_alertQueue = (OS_dispatch_queue *)v5;

    uint64_t v7 = objc_opt_new();
    lastPromptDateByMessageHash = v2->_lastPromptDateByMessageHash;
    v2->_lastPromptDateByMessageHash = (NSMutableDictionary *)v7;

    id v9 = objc_alloc(MEMORY[0x1E4F1CB18]);
    uint64_t v12 = objc_msgSend_initWithSuiteName_(v9, v10, @"com.apple.cloudd", v11);
    userDefaults = v2->_userDefaults;
    v2->_userDefaults = (NSUserDefaults *)v12;

    v16 = objc_msgSend_objectForKey_(v2->_userDefaults, v14, @"LastTTRPromptDates", v15);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      v20 = objc_msgSend_allKeys(v16, v17, v18, v19, 0);
      uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v32, (uint64_t)v37, 16);
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v33;
        do
        {
          uint64_t v25 = 0;
          do
          {
            if (*(void *)v33 != v24) {
              objc_enumerationMutation(v20);
            }
            uint64_t v26 = *(void *)(*((void *)&v32 + 1) + 8 * v25);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v29 = objc_msgSend_objectForKeyedSubscript_(v16, v27, v26, v28);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                objc_msgSend_setObject_forKeyedSubscript_(v2->_lastPromptDateByMessageHash, v30, (uint64_t)v29, v26);
              }
            }
            ++v25;
          }
          while (v23 != v25);
          uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v27, (uint64_t)&v32, (uint64_t)v37, 16);
        }
        while (v23);
      }
    }
  }
  return v2;
}

+ (id)sharedManager
{
  if (qword_1EB279F98 != -1) {
    dispatch_once(&qword_1EB279F98, &unk_1ED7EF738);
  }
  uint64_t v2 = (void *)qword_1EB279F90;

  return v2;
}

- (id)_hashForMessage:(id)a3
{
  v4 = NSString;
  uint64_t v5 = objc_msgSend_hash(a3, a2, (uint64_t)a3, v3);
  return (id)objc_msgSend_stringWithFormat_(v4, v6, @"%lu", v7, v5);
}

- (id)_lastPromptDateForMessage:(id)a3
{
  id v4 = a3;
  v8 = objc_msgSend_alertQueue(self, v5, v6, v7);
  dispatch_assert_queue_V2(v8);

  uint64_t v12 = objc_msgSend_lastPromptDateByMessageHash(self, v9, v10, v11);
  uint64_t v15 = objc_msgSend__hashForMessage_(self, v13, (uint64_t)v4, v14);

  uint64_t v18 = objc_msgSend_objectForKeyedSubscript_(v12, v16, (uint64_t)v15, v17);

  if (!v18)
  {
    uint64_t v18 = objc_msgSend_distantPast(MEMORY[0x1E4F1C9C8], v19, v20, v21);
  }

  return v18;
}

- (void)_notePromptAttemptForMessage:(id)a3
{
  id v4 = a3;
  v8 = objc_msgSend_alertQueue(self, v5, v6, v7);
  dispatch_assert_queue_V2(v8);

  uint64_t v12 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v9, v10, v11);
  v16 = objc_msgSend_lastPromptDateByMessageHash(self, v13, v14, v15);
  uint64_t v19 = objc_msgSend__hashForMessage_(self, v17, (uint64_t)v4, v18);

  objc_msgSend_setObject_forKeyedSubscript_(v16, v20, (uint64_t)v12, (uint64_t)v19);
  objc_msgSend_userDefaults(self, v21, v22, v23);
  id v29 = (id)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend_lastPromptDateByMessageHash(self, v24, v25, v26);
  objc_msgSend_setObject_forKey_(v29, v28, (uint64_t)v27, @"LastTTRPromptDates");
}

- (void)_launchTTRWithRequest:(id)a3
{
  id v80 = a3;
  uint64_t v3 = NSString;
  id v4 = CKBuildVersion();
  v8 = objc_msgSend_title(v80, v5, v6, v7);
  uint64_t v11 = objc_msgSend_stringWithFormat_(v3, v9, @"%@: Tap-To-Radar: \"%@\"", v10, v4, v8);

  if ((unint64_t)objc_msgSend_length(v11, v12, v13, v14) >= 0xF0)
  {
    uint64_t v18 = objc_msgSend_substringToIndex_(v11, v15, 239, v17);

    uint64_t v11 = (void *)v18;
  }
  uint64_t v19 = objc_msgSend_componentID(v80, v15, v16, v17);

  if (!v19) {
    objc_msgSend_setComponentID_(v80, v20, @"552485", v22);
  }
  uint64_t v23 = objc_msgSend_componentName(v80, v20, v21, v22);

  if (!v23) {
    objc_msgSend_setComponentName_(v80, v24, @"CloudKit", v26);
  }
  v27 = objc_msgSend_componentVersion(v80, v24, v25, v26);

  if (!v27) {
    objc_msgSend_setComponentVersion_(v80, v28, @"All", v30);
  }
  v31 = objc_msgSend_radarDescription(v80, v28, v29, v30);

  if (!v31)
  {
    long long v35 = objc_msgSend_title(v80, v32, v33, v34);
    objc_msgSend_setRadarDescription_(v80, v36, (uint64_t)v35, v37);
  }
  uint64_t v38 = NSString;
  v39 = objc_msgSend_componentID(v80, v32, v33, v34);
  v43 = objc_msgSend_componentName(v80, v40, v41, v42);
  v47 = objc_msgSend_componentVersion(v80, v44, v45, v46);
  v51 = objc_msgSend_radarDescription(v80, v48, v49, v50);
  v58 = objc_msgSend_relatedRadar(v80, v52, v53, v54);
  if (v58) {
    v59 = @"\n";
  }
  else {
    v59 = &stru_1ED7F5C98;
  }
  uint64_t v60 = objc_msgSend_relatedRadar(v80, v55, v56, v57);
  v63 = (void *)v60;
  if (v60) {
    objc_msgSend_stringWithFormat_(v38, v61, @"tap-to-radar://new?Title=%@&ComponentID=%@&ComponentName=%@&ComponentVersion=%@&Classification=Serious Bug&Description=%@%@%@&Reproducibility=I Didn't Try", v62, v11, v39, v43, v47, v51, v59, v60);
  }
  else {
  v64 = objc_msgSend_stringWithFormat_(v38, v61, @"tap-to-radar://new?Title=%@&ComponentID=%@&ComponentName=%@&ComponentVersion=%@&Classification=Serious Bug&Description=%@%@%@&Reproducibility=I Didn't Try", v62, v11, v39, v43, v47, v51, v59, &stru_1ED7F5C98);
  }

  v68 = objc_msgSend_URLQueryAllowedCharacterSet(MEMORY[0x1E4F28B88], v65, v66, v67);
  v71 = objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(v64, v69, (uint64_t)v68, v70);

  v74 = objc_msgSend_URLWithString_(MEMORY[0x1E4F1CB10], v72, (uint64_t)v71, v73);
  v78 = objc_msgSend_defaultWorkspace(MEMORY[0x1E4F223E0], v75, v76, v77);
  objc_msgSend_openURL_configuration_completionHandler_(v78, v79, (uint64_t)v74, 0, 0);
}

- (void)_lockedTriggerTapToRadarWithRequest:(id)a3
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v8 = objc_msgSend_alertQueue(self, v5, v6, v7);
  dispatch_assert_queue_V2(v8);

  uint64_t v12 = objc_msgSend_title(v4, v9, v10, v11);

  if (v12)
  {
    uint64_t v16 = objc_msgSend_sharedOptions(CKBehaviorOptions, v13, v14, v15);
    int isAppleInternalInstall = objc_msgSend_isAppleInternalInstall(v16, v17, v18, v19);

    if (isAppleInternalInstall)
    {
      uint64_t v24 = objc_msgSend_title(v4, v21, v22, v23);
      v27 = objc_msgSend__lastPromptDateForMessage_(self, v25, (uint64_t)v24, v26);
      objc_msgSend_timeIntervalSinceNow(v27, v28, v29, v30);
      double v32 = fabs(v31);

      objc_super v36 = objc_msgSend_sharedOptions(CKBehaviorOptions, v33, v34, v35);
      objc_msgSend_minTTRPromptInterval(v36, v37, v38, v39);
      double v41 = v40;

      if (v32 >= v41)
      {
        if (ck_log_initialization_predicate != -1) {
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        }
        v48 = (void *)ck_log_facility_ck;
        if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v76 = v48;
          id v80 = objc_msgSend_title(v4, v77, v78, v79);
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v80;
          _os_log_debug_impl(&dword_18AF10000, v76, OS_LOG_TYPE_DEBUG, "Creating a TTR prompt for \"%@\"", buf, 0xCu);
        }
        v52 = objc_msgSend_title(v4, v49, v50, v51);
        objc_msgSend__notePromptAttemptForMessage_(self, v53, (uint64_t)v52, v54);

        uint64_t v55 = *MEMORY[0x1E4F1D990];
        v82[0] = @"Tap-To-Radar";
        uint64_t v56 = *MEMORY[0x1E4F1D9A8];
        v81[0] = v55;
        v81[1] = v56;
        uint64_t v57 = NSString;
        v61 = objc_msgSend_matterhornName(CKContainer, v58, v59, v60);
        v65 = objc_msgSend_title(v4, v62, v63, v64);
        v68 = objc_msgSend_stringWithFormat_(v57, v66, @"A problem has been detected with your %@ account:\n\n\"%@\"\n\nWould you mind filing a Radar?", v67, v61, v65);
        uint64_t v69 = *MEMORY[0x1E4F1D9E0];
        v82[1] = v68;
        v82[2] = @"File a Radar";
        uint64_t v70 = *MEMORY[0x1E4F1D9D0];
        v81[2] = v69;
        v81[3] = v70;
        v82[3] = @"Not Now";
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v71, (uint64_t)v82, (uint64_t)v81, 4);
        CFDictionaryRef v72 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

        uint64_t v73 = CFUserNotificationCreate(0, 0.0, 3uLL, 0, v72);
        *(void *)buf = 0;
        CFUserNotificationReceiveResponse(v73, 86400.0, (CFOptionFlags *)buf);
        if ((buf[0] & 3) == 0) {
          objc_msgSend__launchTTRWithRequest_(self, v74, (uint64_t)v4, v75);
        }
        if (v73) {
          CFRelease(v73);
        }
      }
      else
      {
        if (ck_log_initialization_predicate != -1) {
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        }
        uint64_t v42 = (void *)ck_log_facility_ck;
        if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
        {
          v43 = v42;
          v47 = objc_msgSend_title(v4, v44, v45, v46);
          *(_DWORD *)buf = 134218242;
          *(double *)&buf[4] = v32;
          __int16 v84 = 2112;
          v85 = v47;
          _os_log_debug_impl(&dword_18AF10000, v43, OS_LOG_TYPE_DEBUG, "Not creating a TTR notification because it hasn't been long enough since the last prompt (%0.1fs) for message \"%@\"", buf, 0x16u);
        }
      }
    }
  }
}

- (void)triggerTapToRadarWithRequest:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v8 = objc_msgSend_alertQueue(self, v5, v6, v7);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_18B1B0E9C;
  block[3] = &unk_1E5461AE8;
  objc_copyWeak(&v12, &location);
  id v11 = v4;
  id v9 = v4;
  dispatch_async(v8, block);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (OS_dispatch_queue)alertQueue
{
  return self->_alertQueue;
}

- (void)setAlertQueue:(id)a3
{
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
}

- (NSMutableDictionary)lastPromptDateByMessageHash
{
  return self->_lastPromptDateByMessageHash;
}

- (void)setLastPromptDateByMessageHash:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastPromptDateByMessageHash, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);

  objc_storeStrong((id *)&self->_alertQueue, 0);
}

@end