@interface CKDPDSClient
+ (id)sharedClient;
- (BOOL)_unregisterRegistration:(id)a3 forDSID:(id)a4 outError:(id *)a5;
- (BOOL)ensureRegistrationForContainer:(id)a3 outError:(id *)a4;
- (BOOL)unregisterAllTokensForAccountID:(id)a3 outError:(id *)a4;
- (BOOL)unregisterTokenForContainer:(id)a3 outError:(id *)a4;
- (NSMutableDictionary)registrationsByDSID;
- (OS_dispatch_queue)queue;
- (PDSRegistrar)registrar;
- (char)_pdsPushEnvironmentFromAPSEnvironmentString:(id)a3;
- (id)_pdsQualifierFromContainerID:(id)a3;
- (id)_pdsTopicFromBundleIdentifier:(id)a3 withContainerID:(id)a4;
- (id)_registrationForAppContainerAccountTuple:(id)a3 pushBundleIdentifier:(id)a4 pdsPushEnvironment:(char)a5;
- (id)_registrationForContainer:(id)a3;
- (id)initInternal;
- (id)inlock_registrar;
- (id)inlock_registrationsForDSID:(id)a3;
- (void)_expungeStaleDSIDs;
- (void)unregisterAllTokens;
@end

@implementation CKDPDSClient

- (id)initInternal
{
  v12.receiver = self;
  v12.super_class = (Class)CKDPDSClient;
  v2 = [(CKDPDSClient *)&v12 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    registrationsByDSID = v2->_registrationsByDSID;
    v2->_registrationsByDSID = (NSMutableDictionary *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.cloudkit.pdsclient", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    v8 = v2->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1C4FB8AE0;
    block[3] = &unk_1E64F05C8;
    v11 = v2;
    dispatch_async(v8, block);
  }
  return v2;
}

+ (id)sharedClient
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4FB8C0C;
  block[3] = &unk_1E64F1B50;
  void block[4] = a1;
  if (qword_1EBBD0040 != -1) {
    dispatch_once(&qword_1EBBD0040, block);
  }
  v2 = (void *)qword_1EBBD0038;
  return v2;
}

- (id)inlock_registrar
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend_queue(self, a2, v2);
  dispatch_assert_queue_V2(v4);

  registrar = self->_registrar;
  if (!registrar)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F83B60]);
    id v13 = 0;
    v8 = (PDSRegistrar *)objc_msgSend_initWithClientID_error_(v6, v7, @"com.apple.cloudkit.cloudd", &v13);
    id v9 = v13;
    v10 = self->_registrar;
    self->_registrar = v8;

    if (!self->_registrar)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v11 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = v9;
        _os_log_error_impl(&dword_1C4CFF000, v11, OS_LOG_TYPE_ERROR, "Error creating PDSRegistrar: %@", buf, 0xCu);
      }
    }

    registrar = self->_registrar;
  }
  return registrar;
}

- (id)inlock_registrationsForDSID:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v7 = objc_msgSend_queue(self, v5, v6);
  dispatch_assert_queue_V2(v7);

  v10 = objc_msgSend_registrationsByDSID(self, v8, v9);
  objc_super v12 = objc_msgSend_objectForKeyedSubscript_(v10, v11, (uint64_t)v4);

  if (!v12)
  {
    id v15 = objc_msgSend_inlock_registrar(self, v13, v14);
    v17 = objc_msgSend_userWithDSID_(MEMORY[0x1E4F83B70], v16, (uint64_t)v4);
    id v33 = 0;
    v19 = objc_msgSend_currentRegistrationsForUser_error_(v15, v18, (uint64_t)v17, &v33);
    id v20 = v33;

    uint64_t v22 = (uint64_t)v19;
    if (!v19)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v23 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v35 = v20;
        _os_log_error_impl(&dword_1C4CFF000, v23, OS_LOG_TYPE_ERROR, "Error getting current registrations: %@", buf, 0xCu);
      }
      uint64_t v22 = MEMORY[0x1E4F1CBF0];
    }
    v24 = objc_msgSend_setWithArray_(MEMORY[0x1E4F1CA80], v21, v22);
    v27 = objc_msgSend_registrationsByDSID(self, v25, v26);
    objc_msgSend_setObject_forKeyedSubscript_(v27, v28, (uint64_t)v24, v4);
  }
  v29 = objc_msgSend_registrationsByDSID(self, v13, v14);
  v31 = objc_msgSend_objectForKeyedSubscript_(v29, v30, (uint64_t)v4);

  return v31;
}

- (char)_pdsPushEnvironmentFromAPSEnvironmentString:(id)a3
{
  return objc_msgSend_compare_options_(a3, a2, *MEMORY[0x1E4F4E1C8], 1) == 0;
}

- (id)_pdsQualifierFromContainerID:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_environment(v3, v4, v5) == 2) {
    v8 = @"_S";
  }
  else {
    v8 = @"_P";
  }
  uint64_t v9 = objc_msgSend_containerIdentifier(v3, v6, v7);

  v11 = objc_msgSend_stringByAppendingString_(v9, v10, (uint64_t)v8);

  return v11;
}

- (id)_pdsTopicFromBundleIdentifier:(id)a3 withContainerID:(id)a4
{
  id v5 = a3;
  if (objc_msgSend_specialContainerType(a4, v6, v7) == 4
    && (objc_msgSend_hasPrefix_(v5, v8, @"clouddocs") & 1) == 0)
  {
    objc_msgSend_stringWithFormat_(NSString, v8, @"%@%@.%@", @"com.apple.icloud-container.", @"clouddocs", v5);
  }
  else
  {
    objc_msgSend_stringWithFormat_(NSString, v8, @"%@%@", @"com.apple.icloud-container.", v5);
  uint64_t v9 = };

  return v9;
}

- (id)_registrationForContainer:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v7 = objc_msgSend_containerID(v4, v5, v6);
  v10 = objc_msgSend_apsEnvironmentString(v4, v8, v9);
  uint64_t v13 = objc_msgSend_applicationBundleIdentifierForPush(v4, v11, v12);
  uint64_t v14 = (void *)v13;
  if (v10 && v13 && v7)
  {
    id v15 = objc_alloc(MEMORY[0x1E4F83B68]);
    v17 = objc_msgSend__pdsTopicFromBundleIdentifier_withContainerID_(self, v16, (uint64_t)v14, v7);
    v19 = objc_msgSend__pdsQualifierFromContainerID_(self, v18, (uint64_t)v7);
    uint64_t v21 = objc_msgSend__pdsPushEnvironmentFromAPSEnvironmentString_(self, v20, (uint64_t)v10);
    v23 = objc_msgSend_initWithTopic_qualifier_pushEnvironment_(v15, v22, (uint64_t)v17, v19, v21);
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v24 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      int v26 = 138412290;
      id v27 = v4;
      _os_log_error_impl(&dword_1C4CFF000, v24, OS_LOG_TYPE_ERROR, "Can't register an incomplete container %@, skipping", (uint8_t *)&v26, 0xCu);
    }
    v23 = 0;
  }

  return v23;
}

- (id)_registrationForAppContainerAccountTuple:(id)a3 pushBundleIdentifier:(id)a4 pdsPushEnvironment:(char)a5
{
  uint64_t v5 = a5;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v12 = objc_msgSend_appContainerTuple(v8, v10, v11);
  uint64_t v15 = objc_msgSend_containerID(v12, v13, v14);
  uint64_t v16 = (void *)v15;
  if (v9 && v15)
  {
    id v17 = objc_alloc(MEMORY[0x1E4F83B68]);
    v19 = objc_msgSend__pdsTopicFromBundleIdentifier_withContainerID_(self, v18, (uint64_t)v9, v16);
    uint64_t v21 = objc_msgSend__pdsQualifierFromContainerID_(self, v20, (uint64_t)v16);
    v23 = objc_msgSend_initWithTopic_qualifier_pushEnvironment_(v17, v22, (uint64_t)v19, v21, v5);
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v24 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      int v26 = 138412802;
      id v27 = v8;
      __int16 v28 = 2114;
      id v29 = v9;
      __int16 v30 = 2112;
      v31 = v16;
      _os_log_error_impl(&dword_1C4CFF000, v24, OS_LOG_TYPE_ERROR, "Can't register tuple %@ missing push bundle identifier %{public}@ and/or containerID %@", (uint8_t *)&v26, 0x20u);
    }
    v23 = 0;
  }

  return v23;
}

- (BOOL)ensureRegistrationForContainer:(id)a3 outError:(id *)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v9 = objc_msgSend_account(v6, v7, v8);
  uint64_t v12 = objc_msgSend_accountType(v9, v10, v11);

  if (!v12)
  {
    id v17 = objc_msgSend_account(v6, v13, v14);
    id v20 = objc_msgSend_accountID(v17, v18, v19);

    v23 = objc_msgSend_deviceContext(v6, v21, v22);
    int v26 = objc_msgSend_metadataCache(v23, v24, v25);
    __int16 v28 = objc_msgSend_cachedDSIDForAccountID_(v26, v27, (uint64_t)v20);

    if (v28)
    {
      uint64_t v32 = objc_msgSend__registrationForContainer_(self, v29, (uint64_t)v6);
      if (v32)
      {
        uint64_t v43 = 0;
        v44 = &v43;
        uint64_t v45 = 0x2020000000;
        char v46 = 1;
        *(void *)&long long buf = 0;
        *((void *)&buf + 1) = &buf;
        uint64_t v48 = 0x3032000000;
        v49 = sub_1C4FB98C0;
        v50 = sub_1C4FB98D0;
        id v51 = 0;
        id v33 = objc_msgSend_queue(self, v30, v31);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = sub_1C4FB98D8;
        block[3] = &unk_1E64F7FA8;
        void block[4] = self;
        id v39 = v28;
        id v40 = v32;
        p_long long buf = &buf;
        v42 = &v43;
        dispatch_sync(v33, block);

        if (a4)
        {
          v34 = *(void **)(*((void *)&buf + 1) + 40);
          if (v34) {
            *a4 = v34;
          }
        }
        BOOL v16 = *((unsigned char *)v44 + 24) != 0;

        _Block_object_dispose(&buf, 8);
        _Block_object_dispose(&v43, 8);
      }
      else if (a4)
      {
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v30, *MEMORY[0x1E4F19DD8], 1017, @"Invalid container at PDS registration time");
        BOOL v16 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v16 = 0;
      }

      goto LABEL_22;
    }
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v35 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v20;
      _os_log_error_impl(&dword_1C4CFF000, v35, OS_LOG_TYPE_ERROR, "Can't register a push token for an account id (%@) without a dsid", (uint8_t *)&buf, 0xCu);
      if (a4) {
        goto LABEL_17;
      }
    }
    else if (a4)
    {
LABEL_17:
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v36, *MEMORY[0x1E4F19DD8], 1017, @"No DSID at push registration time");
      BOOL v16 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:

      goto LABEL_23;
    }
    BOOL v16 = 0;
    goto LABEL_22;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v15 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1C4CFF000, v15, OS_LOG_TYPE_INFO, "Not registering push via PDS, it requires a logged-in iCloud account, and this container is using a not-logged-in account", (uint8_t *)&buf, 2u);
  }
  BOOL v16 = 0;
LABEL_23:

  return v16;
}

- (void)_expungeStaleDSIDs
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v3 = objc_msgSend_queue(self, a2, v2);
  dispatch_assert_queue_V2(v3);

  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  id v4 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1C4CFF000, v4, OS_LOG_TYPE_INFO, "Expunging stale users", buf, 2u);
  }
  uint64_t v7 = objc_msgSend_inlock_registrar(self, v5, v6);
  id v51 = 0;
  id v9 = objc_msgSend_activeUsersWithError_(v7, v8, (uint64_t)&v51);
  id v10 = v51;

  if (v9)
  {
    uint64_t v13 = objc_msgSend_sharedAccountStore(CKDAccountStore, v11, v12);
    BOOL v16 = objc_msgSend_accountStore(v13, v14, v15);

    uint64_t v43 = v16;
    v42 = objc_msgSend_aa_appleAccounts(v16, v17, v18);
    id v20 = objc_msgSend_CKCompactMap_(v42, v19, (uint64_t)&unk_1F2044730);
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    v44 = v9;
    id v21 = v9;
    uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v47, v56, 16);
    if (v23)
    {
      uint64_t v26 = v23;
      uint64_t v27 = *(void *)v48;
      do
      {
        uint64_t v28 = 0;
        do
        {
          if (*(void *)v48 != v27) {
            objc_enumerationMutation(v21);
          }
          id v29 = *(void **)(*((void *)&v47 + 1) + 8 * v28);
          if (objc_msgSend_userType(v29, v24, v25) == 1)
          {
            __int16 v30 = objc_msgSend_userID(v29, v24, v25);
            char v32 = objc_msgSend_containsObject_(v20, v31, (uint64_t)v30);

            if ((v32 & 1) == 0)
            {
              if (*MEMORY[0x1E4F1A550] != -1) {
                dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
              }
              id v33 = *MEMORY[0x1E4F1A500];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)long long buf = 138412290;
                id v53 = v29;
                _os_log_error_impl(&dword_1C4CFF000, v33, OS_LOG_TYPE_ERROR, "Removing orphaned PDSUser for unknown user %@", buf, 0xCu);
              }
              uint64_t v36 = objc_msgSend_inlock_registrar(self, v34, v35);
              id v46 = v10;
              char v38 = objc_msgSend_removeAllRegistrationsFromUser_error_(v36, v37, (uint64_t)v29, &v46);
              id v39 = v46;

              if ((v38 & 1) == 0)
              {
                if (*MEMORY[0x1E4F1A550] != -1) {
                  dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
                }
                id v40 = *MEMORY[0x1E4F1A500];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)long long buf = 138412546;
                  id v53 = v29;
                  __int16 v54 = 2112;
                  id v55 = v39;
                  _os_log_error_impl(&dword_1C4CFF000, v40, OS_LOG_TYPE_ERROR, "Unable to remove all registrations for user %@: %@", buf, 0x16u);
                }
              }
              id v10 = v39;
            }
          }
          ++v28;
        }
        while (v26 != v28);
        uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v47, v56, 16);
      }
      while (v26);
    }

    id v9 = v44;
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v41 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v53 = v10;
      _os_log_error_impl(&dword_1C4CFF000, v41, OS_LOG_TYPE_ERROR, "Unable to iterate active users: %@", buf, 0xCu);
    }
  }
}

- (BOOL)_unregisterRegistration:(id)a3 forDSID:(id)a4 outError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v29 = 0;
  __int16 v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 1;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = sub_1C4FB98C0;
  uint64_t v27 = sub_1C4FB98D0;
  id v28 = 0;
  uint64_t v12 = objc_msgSend_queue(self, v10, v11);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4FBA17C;
  block[3] = &unk_1E64F7FA8;
  void block[4] = self;
  id v13 = v9;
  id v19 = v13;
  id v14 = v8;
  id v20 = v14;
  id v21 = &v23;
  uint64_t v22 = &v29;
  dispatch_sync(v12, block);

  if (a5)
  {
    uint64_t v15 = (void *)v24[5];
    if (v15) {
      *a5 = v15;
    }
  }
  char v16 = *((unsigned char *)v30 + 24);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v16;
}

- (BOOL)unregisterTokenForContainer:(id)a3 outError:(id *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v9 = objc_msgSend_account(v6, v7, v8);
  uint64_t v12 = objc_msgSend_accountID(v9, v10, v11);

  uint64_t v15 = objc_msgSend_deviceContext(v6, v13, v14);
  uint64_t v18 = objc_msgSend_metadataCache(v15, v16, v17);
  id v20 = objc_msgSend_cachedDSIDForAccountID_(v18, v19, (uint64_t)v12);

  if (!v20)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v25 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      int v28 = 138412290;
      uint64_t v29 = v12;
      _os_log_error_impl(&dword_1C4CFF000, v25, OS_LOG_TYPE_ERROR, "Can't unregister a push token for an account id (%@) without a dsid", (uint8_t *)&v28, 0xCu);
      if (a4) {
        goto LABEL_8;
      }
    }
    else if (a4)
    {
LABEL_8:
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v26, *MEMORY[0x1E4F19DD8], 1017, @"No DSID at push unregister time");
      char v24 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    char v24 = 0;
    goto LABEL_13;
  }
  uint64_t v23 = objc_msgSend__registrationForContainer_(self, v21, (uint64_t)v6);
  if (v23)
  {
    char v24 = objc_msgSend__unregisterRegistration_forDSID_outError_(self, v22, (uint64_t)v23, v20, a4);
  }
  else if (a4)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v22, *MEMORY[0x1E4F19DD8], 1017, @"Invalid container at PDS unregistration time");
    char v24 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v24 = 0;
  }

LABEL_13:
  return v24;
}

- (BOOL)unregisterAllTokensForAccountID:(id)a3 outError:(id *)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v9 = objc_msgSend_defaultContext(CKDLogicalDeviceContext, v7, v8);
  uint64_t v12 = objc_msgSend_metadataCache(v9, v10, v11);

  char v16 = objc_msgSend_cachedDSIDForAccountID_(v12, v13, (uint64_t)v6);
  if (v16)
  {
    uint64_t v27 = 0;
    int v28 = &v27;
    uint64_t v29 = 0x2020000000;
    char v30 = 1;
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v32 = 0x3032000000;
    id v33 = sub_1C4FB98C0;
    v34 = sub_1C4FB98D0;
    id v35 = 0;
    uint64_t v17 = objc_msgSend_queue(self, v14, v15);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1C4FBA8DC;
    block[3] = &unk_1E64F7FA8;
    void block[4] = self;
    id v23 = v16;
    p_long long buf = &buf;
    uint64_t v26 = &v27;
    id v24 = v6;
    dispatch_sync(v17, block);

    if (a4)
    {
      uint64_t v18 = *(void **)(*((void *)&buf + 1) + 40);
      if (v18) {
        *a4 = v18;
      }
    }
    BOOL v19 = *((unsigned char *)v28 + 24) != 0;

    _Block_object_dispose(&buf, 8);
    _Block_object_dispose(&v27, 8);
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v20 = *MEMORY[0x1E4F1A500];
    BOOL v19 = 1;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_1C4CFF000, v20, OS_LOG_TYPE_INFO, "Skipping token unregistration for account %@, which has no dsid", (uint8_t *)&buf, 0xCu);
    }
  }

  return v19;
}

- (void)unregisterAllTokens
{
  id v4 = objc_msgSend_queue(self, a2, v2);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4FBAB54;
  block[3] = &unk_1E64F05C8;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (NSMutableDictionary)registrationsByDSID
{
  return self->_registrationsByDSID;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (PDSRegistrar)registrar
{
  return self->_registrar;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registrar, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_registrationsByDSID, 0);
}

@end