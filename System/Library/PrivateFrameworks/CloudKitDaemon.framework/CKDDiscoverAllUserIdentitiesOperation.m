@interface CKDDiscoverAllUserIdentitiesOperation
+ (BOOL)adopterProvidedLookupInfos;
- (CKDDiscoverAllUserIdentitiesOperation)initWithOperationInfo:(id)a3 container:(id)a4;
- (NSMutableDictionary)contactIdentifiersByLookupInfo;
- (void)_discoverIdentitiesBatched:(id)a3;
- (void)_handleDiscoveredIdentity:(id)a3 lookupInfo:(id)a4 responseCode:(id)a5;
- (void)_populateFakeUnitTestLookupInfos:(id)a3;
- (void)_populateRealUserIdentityLookupInfos;
- (void)_populateUserIdentityLookupInfos;
- (void)main;
- (void)setContactIdentifiersByLookupInfo:(id)a3;
@end

@implementation CKDDiscoverAllUserIdentitiesOperation

- (CKDDiscoverAllUserIdentitiesOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)CKDDiscoverAllUserIdentitiesOperation;
  return [(CKDDiscoverUserIdentitiesOperation *)&v5 initWithOperationInfo:a3 container:a4];
}

+ (BOOL)adopterProvidedLookupInfos
{
  return 0;
}

- (void)_discoverIdentitiesBatched:(id)a3
{
  id v4 = a3;
  unint64_t v7 = objc_msgSend_count(v4, v5, v6);
  if (v7 >= 0x15E)
  {
    unint64_t v9 = 350;
    objc_msgSend_subarrayWithRange_(v4, v8, 0, 350);
  }
  else
  {
    unint64_t v9 = v7;
    objc_msgSend_subarrayWithRange_(v4, v8, 0, v7);
  v10 = };
  unint64_t v15 = objc_msgSend_count(v4, v11, v12);
  v16 = 0;
  if (v9 < v15)
  {
    uint64_t v17 = objc_msgSend_count(v4, v13, v14);
    v16 = objc_msgSend_subarrayWithRange_(v4, v18, v9, v17 - v9);
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = sub_1C4DF7738;
  v21[3] = &unk_1E64F0680;
  v21[4] = self;
  id v22 = v16;
  id v19 = v16;
  objc_msgSend__discoverIdentitiesWithLookupInfos_completionBlock_(self, v20, (uint64_t)v10, v21);
}

- (void)_populateFakeUnitTestLookupInfos:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  objc_msgSend_lookupInfosWithEmails_(MEMORY[0x1E4F1A488], a2, (uint64_t)a3);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v4, (uint64_t)&v28, v32, 16);
  if (v5)
  {
    uint64_t v8 = v5;
    uint64_t v9 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v12 = (void *)MEMORY[0x1E4F1CA80];
        v13 = NSString;
        uint64_t v14 = objc_msgSend_emailAddress(v11, v6, v7);
        v16 = objc_msgSend_stringWithFormat_(v13, v15, @"FakeContactIdentifier-%@", v14);
        v18 = objc_msgSend_setWithObject_(v12, v17, (uint64_t)v16);
        v21 = objc_msgSend_contactIdentifiersByLookupInfo(self, v19, v20);
        objc_msgSend_setObject_forKeyedSubscript_(v21, v22, (uint64_t)v18, v11);
      }
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v28, v32, 16);
    }
    while (v8);
  }
  objc_msgSend_setUserIdentityLookupInfos_(self, v6, (uint64_t)obj);
  v25 = objc_msgSend_userIdentityLookupInfos(self, v23, v24);
  objc_msgSend__discoverIdentitiesBatched_(self, v26, (uint64_t)v25);
}

- (void)_populateRealUserIdentityLookupInfos
{
  v31[2] = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  id v4 = objc_opt_new();
  id v5 = objc_alloc(MEMORY[0x1E4F1B908]);
  uint64_t v6 = *MEMORY[0x1E4F1AEE0];
  v31[0] = *MEMORY[0x1E4F1ADC8];
  v31[1] = v6;
  uint64_t v8 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v7, (uint64_t)v31, 2);
  v10 = objc_msgSend_initWithKeysToFetch_(v5, v9, (uint64_t)v8);

  objc_msgSend_setUnifyResults_(v10, v11, 0);
  id v28 = 0;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = sub_1C4DF7BA8;
  v25[3] = &unk_1E64F34A8;
  id v12 = v3;
  id v26 = v12;
  v27 = self;
  char Request_error_usingBlock = objc_msgSend_enumerateContactsWithFetchRequest_error_usingBlock_(v4, v13, (uint64_t)v10, &v28, v25);
  id v15 = v28;
  if ((Request_error_usingBlock & 1) == 0)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v16 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v15;
      _os_log_error_impl(&dword_1C4CFF000, v16, OS_LOG_TYPE_ERROR, "Error fetching contacts: %@", buf, 0xCu);
    }
  }

  id v19 = objc_msgSend_allObjects(v12, v17, v18);
  objc_msgSend_setUserIdentityLookupInfos_(self, v20, (uint64_t)v19);

  v23 = objc_msgSend_userIdentityLookupInfos(self, v21, v22);
  objc_msgSend__discoverIdentitiesBatched_(self, v24, (uint64_t)v23);
}

- (void)_populateUserIdentityLookupInfos
{
  v3 = objc_opt_new();
  objc_msgSend_setContactIdentifiersByLookupInfo_(self, v4, (uint64_t)v3);

  if (CKIsRunningInSyncBubble())
  {
    objc_msgSend_userIdentityLookupInfos(self, v5, v6);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend__discoverIdentitiesBatched_(self, v7, (uint64_t)v13);
  }
  else
  {
    if (*MEMORY[0x1E4F1A4E0])
    {
      uint64_t v8 = objc_msgSend_unitTestOverrides(self, v5, v6);
      objc_msgSend_objectForKeyedSubscript_(v8, v9, @"ContactsDatabaseEmails");
      id v14 = (id)objc_claimAutoreleasedReturnValue();

      v10 = v14;
    }
    else
    {
      v10 = 0;
    }
    id v13 = v10;
    if (objc_msgSend_count(v10, v5, v6)) {
      objc_msgSend__populateFakeUnitTestLookupInfos_(self, v11, (uint64_t)v13);
    }
    else {
      objc_msgSend__populateRealUserIdentityLookupInfos(self, v11, v12);
    }
  }
}

- (void)main
{
}

- (void)_handleDiscoveredIdentity:(id)a3 lookupInfo:(id)a4 responseCode:(id)a5
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v11 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v45 = v8;
    _os_log_impl(&dword_1C4CFF000, v11, OS_LOG_TYPE_INFO, "Found user identity %@", buf, 0xCu);
  }
  if (objc_msgSend_code(v10, v12, v13) == 1)
  {
    if (v8)
    {
      objc_msgSend_setLookupInfo_(v8, v14, 0);
      uint64_t v17 = objc_msgSend_contactIdentifiersByLookupInfo(self, v15, v16);
      id v19 = objc_msgSend_objectForKeyedSubscript_(v17, v18, (uint64_t)v9);
      uint64_t v22 = objc_msgSend_allObjects(v19, v20, v21);
      objc_msgSend_setContactIdentifiers_(v8, v23, (uint64_t)v22);

      id v26 = objc_msgSend_callbackQueue(self, v24, v25);
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = sub_1C4DF8238;
      v42[3] = &unk_1E64F0948;
      v42[4] = self;
      id v43 = v8;
      dispatch_async(v26, v42);
    }
  }
  else
  {
    v27 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v28 = *MEMORY[0x1E4F19DD8];
    uint64_t v29 = sub_1C4E94D98(v10);
    v32 = objc_msgSend_request(self, v30, v31);
    uint64_t v33 = sub_1C4E940D0(v32, v10);
    v35 = objc_msgSend_errorWithDomain_code_userInfo_format_(v27, v34, v28, v29, v33, @"Error discovering user identities");
    objc_msgSend_setError_(self, v36, (uint64_t)v35);

    v39 = objc_msgSend_request(self, v37, v38);
    objc_msgSend_cancel(v39, v40, v41);
  }
}

- (NSMutableDictionary)contactIdentifiersByLookupInfo
{
  return self->_contactIdentifiersByLookupInfo;
}

- (void)setContactIdentifiersByLookupInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end