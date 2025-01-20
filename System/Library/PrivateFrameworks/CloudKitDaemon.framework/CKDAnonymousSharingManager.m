@interface CKDAnonymousSharingManager
- (CKDAnonymousSharingManager)initWithContainer:(id)a3;
- (CKDContainer)container;
- (CKDZonePCSData)zonePCSData;
- (OS_dispatch_queue)synchronizeQueue;
- (id)_generateHashIdentifierForAnonymousShareTuple:(id)a3;
- (id)pcsCache;
- (void)_lockedFetchSystemZonePCSDataWithCompletion:(id)a3;
- (void)_locked_decryptShareTuple:(id)a3 withCompletionBlock:(id)a4;
- (void)_locked_encryptShareTuples:(id)a3 withCompletionBlock:(id)a4;
- (void)addAnonymousSharesToSharedDB:(id)a3 operation:(id)a4 withCompletionBlock:(id)a5;
- (void)decryptShareTuple:(id)a3 withCompletionBlock:(id)a4;
- (void)encryptShareTuples:(id)a3 withCompletionBlock:(id)a4;
- (void)removeAnonymousSharesFromSharedDB:(id)a3 operation:(id)a4 withCompletionBlock:(id)a5;
- (void)setZonePCSData:(id)a3;
@end

@implementation CKDAnonymousSharingManager

- (CKDAnonymousSharingManager)initWithContainer:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CKDAnonymousSharingManager;
  v5 = [(CKDAnonymousSharingManager *)&v20 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_container, v4);
    v7 = NSString;
    v10 = objc_msgSend_containerID(v4, v8, v9);
    objc_msgSend_stringWithFormat_(v7, v11, @"%s.%@", "com.apple.cloudkit.anonymousSharingManager.queue", v10);
    id v12 = objc_claimAutoreleasedReturnValue();
    v15 = (const char *)objc_msgSend_UTF8String(v12, v13, v14);
    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v17 = dispatch_queue_create(v15, v16);
    synchronizeQueue = v6->_synchronizeQueue;
    v6->_synchronizeQueue = (OS_dispatch_queue *)v17;

    dispatch_queue_set_specific((dispatch_queue_t)v6->_synchronizeQueue, "com.apple.cloudkit.anonymousSharingManager.queue", (void *)1, 0);
  }

  return v6;
}

- (id)_generateHashIdentifierForAnonymousShareTuple:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v7 = objc_msgSend_zoneID(v4, v5, v6);
  v10 = objc_msgSend_zoneName(v7, v8, v9);

  v13 = objc_msgSend_zoneID(v4, v11, v12);
  v16 = objc_msgSend_ownerName(v13, v14, v15);

  v19 = objc_msgSend_zoneID(v4, v17, v18);

  v22 = objc_msgSend_anonymousCKUserID(v19, v20, v21);

  v24 = objc_msgSend_stringWithFormat_(NSString, v23, @"%@-%@-%@", v10, v16, v22);
  if ((unint64_t)objc_msgSend_length(v22, v25, v26) <= 0x41)
  {
    *(_OWORD *)md = 0u;
    long long v55 = 0u;
    v38 = objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x1E4F1C9B8], v27, (uint64_t)md, 32, 0);
    v41 = (const void *)objc_msgSend_UTF8String(v24, v39, v40);
    CC_LONG v43 = objc_msgSend_lengthOfBytesUsingEncoding_(v24, v42, 4);
    CC_SHA256(v41, v43, md);
    v46 = objc_msgSend_CKLowercaseHexStringWithoutSpaces(v38, v44, v45);
    v37 = objc_msgSend_stringByAppendingString_(@"+", v47, (uint64_t)v46);

    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v48 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v51 = v37;
      __int16 v52 = 2112;
      v53 = v22;
      _os_log_debug_impl(&dword_1C4CFF000, v48, OS_LOG_TYPE_DEBUG, "Generated anonymousShareTupleHash: %@ for anonymousUserID: %@", buf, 0x16u);
    }
  }
  else
  {
    v29 = objc_msgSend_zonePCSData(self, v27, v28);
    objc_msgSend_zoneishPCS(v29, v30, v31);

    v33 = objc_msgSend_dataUsingEncoding_(v24, v32, 4);
    v34 = (void *)PCSFPCreateDerivedDataFromMasterKey();
    v37 = objc_msgSend_CKLowercaseHexStringWithoutSpaces(v34, v35, v36);
  }
  return v37;
}

- (void)addAnonymousSharesToSharedDB:(id)a3 operation:(id)a4 withCompletionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v13 = objc_msgSend_synchronizeQueue(self, v11, v12);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1C4E7C964;
  v17[3] = &unk_1E64F4648;
  id v18 = v8;
  v19 = self;
  id v20 = v9;
  id v21 = v10;
  id v14 = v9;
  id v15 = v10;
  id v16 = v8;
  dispatch_async(v13, v17);
}

- (void)removeAnonymousSharesFromSharedDB:(id)a3 operation:(id)a4 withCompletionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v13 = objc_msgSend_synchronizeQueue(self, v11, v12);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1C4E7CFA0;
  v17[3] = &unk_1E64F4648;
  id v18 = v8;
  v19 = self;
  id v20 = v9;
  id v21 = v10;
  id v14 = v9;
  id v15 = v10;
  id v16 = v8;
  dispatch_async(v13, v17);
}

- (void)encryptShareTuples:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v10 = objc_msgSend_synchronizeQueue(self, v8, v9);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4E7D6E4;
  block[3] = &unk_1E64F0FA0;
  block[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(v10, block);
}

- (void)_locked_encryptShareTuples:(id)a3 withCompletionBlock:(id)a4
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  id v10 = objc_msgSend_synchronizeQueue(self, v8, v9);
  dispatch_assert_queue_V2(v10);

  v13 = objc_msgSend_zonePCSData(self, v11, v12);

  if (v13)
  {
    v67 = (void (**)(void, id, void *))v7;
    id v69 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v72 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    id v68 = v6;
    id obj = v6;
    uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v74, v80, 16);
    if (!v15) {
      goto LABEL_23;
    }
    uint64_t v17 = v15;
    uint64_t v18 = *(void *)v75;
    uint64_t v70 = *MEMORY[0x1E4F19C40];
    while (1)
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v75 != v18) {
          objc_enumerationMutation(obj);
        }
        id v20 = *(void **)(*((void *)&v74 + 1) + 8 * v19);
        id v21 = objc_msgSend__generateHashIdentifierForAnonymousShareTuple_(self, v16, (uint64_t)v20, v67);
        objc_msgSend_setCkAnonymousShareHashIdentifier_(v20, v22, (uint64_t)v21);

        v25 = objc_msgSend_ckAnonymousShareHashIdentifier(v20, v23, v24);

        if (v25)
        {
          id v73 = 0;
          v27 = objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E4F28DB0], v26, (uint64_t)v20, 1, &v73);
          id v28 = v73;
          objc_msgSend_dataUsingEncoding_(@"CKDAnonymousShareTuple", v29, 4);
          v32 = objc_msgSend_zonePCSData(self, v30, v31);
          objc_msgSend_zoneishPCS(v32, v33, v34);
          v35 = (void *)PCSFPCopyEncryptedData();

          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          v44 = (void *)*MEMORY[0x1E4F1A500];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
          {
            v49 = v44;
            __int16 v52 = objc_msgSend_zonePCSData(self, v50, v51);
            uint64_t v55 = objc_msgSend_pcs(v52, v53, v54);
            *(_DWORD *)buf = 138412290;
            uint64_t v79 = v55;
            _os_log_debug_impl(&dword_1C4CFF000, v49, OS_LOG_TYPE_DEBUG, "Encrypted data with zone PCS %@:", buf, 0xCu);
          }
          v47 = objc_msgSend_ckAnonymousShareHashIdentifier(v20, v45, v46);
          objc_msgSend_setObject_forKey_(v69, v48, (uint64_t)v35, v47);

          goto LABEL_20;
        }
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        uint64_t v36 = *MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1C4CFF000, v36, OS_LOG_TYPE_DEBUG, "Error generating ckAnonymousShareHashIdentifier for CKDAnonymousShareTuple", buf, 2u);
        }
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v37, v70, 1000, @"Error generating ckAnonymousShareHashIdentifier for CKDAnonymousShareTuple.");
        id v28 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v40 = objc_msgSend_shareID(v20, v38, v39);

        if (v40)
        {
          v27 = objc_msgSend_shareID(v20, v41, v42);
          objc_msgSend_setObject_forKeyedSubscript_(v72, v43, (uint64_t)v28, v27);
LABEL_20:
        }
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v16, (uint64_t)&v74, v80, 16);
      if (!v17)
      {
LABEL_23:

        if (objc_msgSend_count(v72, v56, v57))
        {
          v60 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v58, v59);
          objc_msgSend_setObject_forKeyedSubscript_(v60, v61, (uint64_t)v72, *MEMORY[0x1E4F19CD8]);
          v63 = objc_msgSend_errorWithDomain_code_userInfo_format_(MEMORY[0x1E4F1A280], v62, *MEMORY[0x1E4F19DD8], 1011, v60, @"Failed to encrypt some anonymous share tuples.");
        }
        else
        {
          v63 = 0;
        }
        id v7 = (void (**)(id, void, void *))v67;
        id v6 = v68;
        v66 = v69;
        if (v67) {
          v67[2](v67, v69, v63);
        }

        goto LABEL_35;
      }
    }
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v64 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1C4CFF000, v64, OS_LOG_TYPE_DEBUG, "_encryptShareTuple zonePCSData is still not available. Terminating without additional retry.", buf, 2u);
  }
  v66 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v65, *MEMORY[0x1E4F19C40], 1000, @"_locked_encryptShareTuples zonePCSData is still not available. Terminating without additional retry.");
  if (v7) {
    v7[2](v7, 0, v66);
  }
LABEL_35:
}

- (void)decryptShareTuple:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v10 = objc_msgSend_synchronizeQueue(self, v8, v9);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4E7DFB0;
  block[3] = &unk_1E64F0FA0;
  block[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(v10, block);
}

- (void)_locked_decryptShareTuple:(id)a3 withCompletionBlock:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  id v10 = objc_msgSend_synchronizeQueue(self, v8, v9);
  dispatch_assert_queue_V2(v10);

  v13 = objc_msgSend_zonePCSData(self, v11, v12);

  id v15 = (void *)MEMORY[0x1E4F1A550];
  id v16 = (os_log_t *)MEMORY[0x1E4F1A500];
  if (v13)
  {
    CFTypeRef cf = 0;
    objc_msgSend_dataUsingEncoding_(@"CKDAnonymousShareTuple", v14, 4);
    uint64_t v19 = (void *)PCSFPCopyTruncatedKeyIDFromEncryptedData();
    id v20 = (dispatch_block_t *)MEMORY[0x1E4F1A548];
    if (!v19)
    {
      if (*v15 != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      id v21 = *v16;
      if (os_log_type_enabled(*v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v45 = (uint64_t)v6;
        __int16 v46 = 2112;
        CFTypeRef v47 = cf;
        _os_log_error_impl(&dword_1C4CFF000, v21, OS_LOG_TYPE_ERROR, "Failed to get keyID from encrypted data %@. PCS error: %@.", buf, 0x16u);
      }
    }
    v22 = objc_msgSend_zonePCSData(self, v17, v18);
    objc_msgSend_zoneishPCS(v22, v23, v24);
    v25 = (void *)PCSFPCopyDecryptedData();

    if (*v15 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], *v20);
    }
    os_log_t v28 = *v16;
    if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEBUG))
    {
      v35 = v28;
      v38 = objc_msgSend_zonePCSData(self, v36, v37);
      uint64_t v41 = objc_msgSend_pcs(v38, v39, v40);
      *(_DWORD *)buf = 138412290;
      uint64_t v45 = v41;
      _os_log_debug_impl(&dword_1C4CFF000, v35, OS_LOG_TYPE_DEBUG, "Decrypted data with zone PCS %@:", buf, 0xCu);
    }
    if (v25)
    {
      v29 = (void *)MEMORY[0x1E4F28DC0];
      uint64_t v30 = objc_opt_class();
      uint64_t v42 = 0;
      v32 = objc_msgSend_unarchivedObjectOfClass_fromData_error_(v29, v31, v30, v25, &v42);
      if (v7) {
        v7[2](v7, v32, 0);
      }
    }
    else
    {
      if (*v15 != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], *v20);
      }
      v33 = *v16;
      if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1C4CFF000, v33, OS_LOG_TYPE_DEBUG, "_locked_decryptShareTuple Unable to decrypt share tuple data.", buf, 2u);
      }
      v32 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v34, *MEMORY[0x1E4F19C40], 1000, @"_locked_decryptShareTuple Unable to decrypt share tuple data.");
      if (v7) {
        ((void (**)(id, void *, void *))v7)[2](v7, 0, v32);
      }
    }
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v26 = *v16;
    if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C4CFF000, v26, OS_LOG_TYPE_DEBUG, "_locked_decryptShareTuple zonePCSData is still not available. Terminating without additional retry.", buf, 2u);
    }
    uint64_t v19 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v27, *MEMORY[0x1E4F19C40], 1000, @"_locked_decryptShareTuple zonePCSData is still not available. Terminating without additional retry.");
    if (v7) {
      ((void (**)(id, void *, void *))v7)[2](v7, 0, v19);
    }
  }
}

- (id)pcsCache
{
  v3 = objc_msgSend_container(self, a2, v2);
  id v6 = objc_msgSend_pcsCache(v3, v4, v5);

  return v6;
}

- (void)_lockedFetchSystemZonePCSDataWithCompletion:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v7 = objc_msgSend_synchronizeQueue(self, v5, v6);
  dispatch_assert_queue_V2(v7);

  objc_initWeak(&location, self);
  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x3032000000;
  v53[3] = sub_1C4E7EA28;
  v53[4] = sub_1C4E7EA38;
  id v54 = 0;
  id v10 = objc_msgSend_defaultConvenienceOperationConfiguration(MEMORY[0x1E4F1A208], v8, v9);
  id v11 = objc_opt_new();
  objc_msgSend_setRequestOriginator_(v11, v12, 1);
  objc_msgSend_setResolvedConfiguration_(v11, v13, (uint64_t)v10);
  objc_msgSend_setDatabaseScope_(v11, v14, 2);
  id v15 = [CKDDatabaseOperation alloc];
  uint64_t v18 = objc_msgSend_container(self, v16, v17);
  id v20 = objc_msgSend_initWithOperationInfo_container_(v15, v19, (uint64_t)v11, v18);

  v23 = objc_msgSend_systemRecordZone(MEMORY[0x1E4F1A310], v21, v22);
  uint64_t v26 = objc_msgSend_zoneID(v23, v24, v25);

  v29 = objc_msgSend_container(v20, v27, v28);
  v32 = objc_msgSend_options(v29, v30, v31);
  int v35 = objc_msgSend_useZoneWidePCS(v32, v33, v34);

  if (v35) {
    uint64_t v36 = 8;
  }
  else {
    uint64_t v36 = 0;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v37 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v45 = &stru_1F2044F30;
    if (v35) {
      uint64_t v45 = @"zoneish ";
    }
    *(_DWORD *)buf = 138543618;
    uint64_t v57 = v45;
    __int16 v58 = 2112;
    uint64_t v59 = v26;
    _os_log_debug_impl(&dword_1C4CFF000, v37, OS_LOG_TYPE_DEBUG, "Fetching %{public}@PCS data for zone %@", buf, 0x16u);
  }
  uint64_t v40 = objc_msgSend_pcsCache(self, v38, v39);
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = sub_1C4E7EA40;
  v46[3] = &unk_1E64F46C0;
  objc_copyWeak(&v52, &location);
  id v41 = v20;
  id v47 = v41;
  uint64_t v48 = self;
  id v42 = v26;
  id v49 = v42;
  uint64_t v51 = v53;
  id v43 = v4;
  id v50 = v43;
  objc_msgSend_fetchPCSForZoneWithID_forOperation_options_withCompletionHandler_(v40, v44, (uint64_t)v42, v41, v36, v46);

  objc_destroyWeak(&v52);
  _Block_object_dispose(v53, 8);

  objc_destroyWeak(&location);
}

- (CKDContainer)container
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_container);
  return (CKDContainer *)WeakRetained;
}

- (CKDZonePCSData)zonePCSData
{
  return self->_zonePCSData;
}

- (void)setZonePCSData:(id)a3
{
}

- (OS_dispatch_queue)synchronizeQueue
{
  return self->_synchronizeQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synchronizeQueue, 0);
  objc_storeStrong((id *)&self->_zonePCSData, 0);
  objc_destroyWeak((id *)&self->_container);
}

@end