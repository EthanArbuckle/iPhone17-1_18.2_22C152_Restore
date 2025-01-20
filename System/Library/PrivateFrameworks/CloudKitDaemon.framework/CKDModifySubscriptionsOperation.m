@interface CKDModifySubscriptionsOperation
+ (int64_t)isPredominatelyDownload;
- (BOOL)isOperationType:(int)a3;
- (CKDModifySubscriptionsOperation)initWithOperationInfo:(id)a3 container:(id)a4;
- (NSArray)subscriptionIDsToDelete;
- (NSArray)subscriptionsToSave;
- (NSMutableDictionary)subscriptionsByServerID;
- (id)activityCreate;
- (id)deleteCompletionBlock;
- (id)saveCompletionBlock;
- (int)operationType;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)_handleSubscriptionDeleted:(id)a3 responseCode:(id)a4;
- (void)_handleSubscriptionSaved:(id)a3 error:(id)a4;
- (void)_handleSubscriptionSaved:(id)a3 responseCode:(id)a4;
- (void)main;
- (void)setDeleteCompletionBlock:(id)a3;
- (void)setSaveCompletionBlock:(id)a3;
- (void)setSubscriptionIDsToDelete:(id)a3;
- (void)setSubscriptionsByServerID:(id)a3;
- (void)setSubscriptionsToSave:(id)a3;
@end

@implementation CKDModifySubscriptionsOperation

- (CKDModifySubscriptionsOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v39.receiver = self;
  v39.super_class = (Class)CKDModifySubscriptionsOperation;
  v9 = [(CKDDatabaseOperation *)&v39 initWithOperationInfo:v6 container:a4];
  if (v9)
  {
    uint64_t v10 = objc_msgSend_subscriptionsToSave(v6, v7, v8);
    subscriptionsToSave = v9->_subscriptionsToSave;
    v9->_subscriptionsToSave = (NSArray *)v10;

    v9->_hasSubscriptionsToSave = objc_msgSend_count(v9->_subscriptionsToSave, v12, v13) != 0;
    uint64_t v16 = objc_msgSend_subscriptionIDsToDelete(v6, v14, v15);
    subscriptionIDsToDelete = v9->_subscriptionIDsToDelete;
    v9->_subscriptionIDsToDelete = (NSArray *)v16;

    v9->_hasSubscriptionsToDelete = objc_msgSend_count(v9->_subscriptionIDsToDelete, v18, v19) != 0;
    uint64_t v20 = objc_opt_new();
    subscriptionsByServerID = v9->_subscriptionsByServerID;
    v9->_subscriptionsByServerID = (NSMutableDictionary *)v20;

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v22 = v9->_subscriptionsToSave;
    uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v35, v40, 16);
    if (v24)
    {
      uint64_t v27 = v24;
      uint64_t v28 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v36 != v28) {
            objc_enumerationMutation(v22);
          }
          v30 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          v31 = v9->_subscriptionsByServerID;
          v32 = objc_msgSend_subscriptionID(v30, v25, v26, (void)v35);
          objc_msgSend_setObject_forKeyedSubscript_(v31, v33, (uint64_t)v30, v32);
        }
        uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v25, (uint64_t)&v35, v40, 16);
      }
      while (v27);
    }
  }
  return v9;
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_1C4CFF000, "daemon/modify-subscriptions", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (void)_handleSubscriptionSaved:(id)a3 responseCode:(id)a4
{
  id v26 = a3;
  id v6 = a4;
  if (objc_msgSend_code(v6, v7, v8) == 1)
  {
    uint64_t v10 = 0;
    objc_msgSend__handleSubscriptionSaved_error_(self, v9, (uint64_t)v26, 0);
  }
  else
  {
    v11 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v12 = *MEMORY[0x1E4F19DD8];
    uint64_t v13 = sub_1C4E94D98(v6);
    uint64_t v16 = objc_msgSend_request(self, v14, v15);
    v17 = sub_1C4E940D0(v16, v6);
    uint64_t v20 = objc_msgSend_error(v6, v18, v19);
    v23 = objc_msgSend_errorDescription(v20, v21, v22);
    uint64_t v10 = objc_msgSend_errorWithDomain_code_userInfo_format_(v11, v24, v12, v13, v17, @"Error saving record subscription with id %@ to server: %@", v26, v23);

    objc_msgSend__handleSubscriptionSaved_error_(self, v25, (uint64_t)v26, v10);
  }
}

- (void)_handleSubscriptionSaved:(id)a3 error:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v10 = objc_msgSend_subscriptionsByServerID(self, v8, v9);
  uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(v10, v11, (uint64_t)v6);

  if (v12)
  {
    uint64_t v15 = objc_msgSend_callbackQueue(self, v13, v14);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1C4E61678;
    block[3] = &unk_1E64F0120;
    block[4] = self;
    id v18 = v6;
    id v19 = v7;
    dispatch_async(v15, block);
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v16 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v6;
      _os_log_error_impl(&dword_1C4CFF000, v16, OS_LOG_TYPE_ERROR, "Got a response for subscription with ID %@, but we didn't try to put that subscription.", buf, 0xCu);
    }
  }
}

- (void)_handleSubscriptionDeleted:(id)a3 responseCode:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v10 = objc_msgSend_code(v7, v8, v9);
  v11 = (void *)*MEMORY[0x1E4F1A548];
  uint64_t v12 = *MEMORY[0x1E4F1A550];
  if (v10 == 1)
  {
    if (v12 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v11);
    }
    uint64_t v13 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v39 = v6;
      _os_log_impl(&dword_1C4CFF000, v13, OS_LOG_TYPE_INFO, "Subscription %@ was successfully deleted from the server", buf, 0xCu);
    }
    uint64_t v16 = 0;
  }
  else
  {
    if (v12 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v11);
    }
    v17 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v39 = v7;
      __int16 v40 = 2112;
      id v41 = v6;
      _os_log_impl(&dword_1C4CFF000, v17, OS_LOG_TYPE_INFO, "Error %@ when deleting subscription %@ from the server", buf, 0x16u);
    }
    id v18 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v19 = *MEMORY[0x1E4F19DD8];
    uint64_t v20 = sub_1C4E94D98(v7);
    v23 = objc_msgSend_request(self, v21, v22);
    uint64_t v24 = sub_1C4E940D0(v23, v7);
    uint64_t v27 = objc_msgSend_error(v7, v25, v26);
    v30 = objc_msgSend_errorDescription(v27, v28, v29);
    uint64_t v16 = objc_msgSend_errorWithDomain_code_userInfo_format_(v18, v31, v19, v20, v24, @"Error deleting subscription %@: %@", v6, v30);
  }
  v32 = objc_msgSend_callbackQueue(self, v14, v15);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4E619B8;
  block[3] = &unk_1E64F0120;
  block[4] = self;
  id v36 = v6;
  id v37 = v16;
  id v33 = v16;
  id v34 = v6;
  dispatch_async(v32, block);
}

+ (int64_t)isPredominatelyDownload
{
  return 0;
}

- (void)main
{
  uint64_t v140 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  v4 = [CKDProtocolTranslator alloc];
  val = self;
  id v7 = objc_msgSend_container(self, v5, v6);
  uint64_t v10 = objc_msgSend_databaseScope(self, v8, v9);
  uint64_t v12 = objc_msgSend_initWithContainer_databaseScope_requireContainerScopedUserID_(v4, v11, (uint64_t)v7, v10, 0);

  long long v132 = 0u;
  long long v133 = 0u;
  long long v130 = 0u;
  long long v131 = 0u;
  uint64_t v15 = objc_msgSend_subscriptionsToSave(self, v13, v14);
  uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v130, v139, 16);
  if (v18)
  {
    uint64_t v19 = *(void *)v131;
    uint64_t v20 = *MEMORY[0x1E4F19DD8];
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v131 != v19) {
          objc_enumerationMutation(v15);
        }
        uint64_t v22 = *(void **)(*((void *)&v130 + 1) + 8 * i);
        id v129 = 0;
        v23 = objc_msgSend_pSubscriptionFromSubscription_error_(v12, v17, (uint64_t)v22, &v129);
        id v24 = v129;

        if (v23)
        {
          objc_msgSend_addObject_(v3, v25, (uint64_t)v22);
        }
        else
        {
          if (!v24)
          {
            objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v25, v20, 1017, @"Subscription fails conversion: %@", v22);
            id v24 = (id)objc_claimAutoreleasedReturnValue();
          }
          uint64_t v27 = objc_msgSend_subscriptionID(v22, v25, v26);
          objc_msgSend__handleSubscriptionSaved_error_(val, v28, (uint64_t)v27, v24);
        }
      }
      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v17, (uint64_t)&v130, v139, 16);
    }
    while (v18);
  }

  objc_msgSend_setSubscriptionsToSave_(val, v29, (uint64_t)v3);
  v32 = objc_msgSend_container(val, v30, v31);
  if (objc_msgSend_adopterProcessType(v32, v33, v34) == 2)
  {
  }
  else
  {
    id v37 = objc_msgSend_container(val, v35, v36);
    BOOL v40 = objc_msgSend_adopterProcessType(v37, v38, v39) == 3;

    if (!v40)
    {
      v43 = v3;
      goto LABEL_28;
    }
  }
  v43 = objc_opt_new();

  long long v127 = 0u;
  long long v128 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  v46 = objc_msgSend_subscriptionsToSave(val, v44, v45);
  uint64_t v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v47, (uint64_t)&v125, v138, 16);
  if (v50)
  {
    uint64_t v51 = *(void *)v126;
    uint64_t v52 = *MEMORY[0x1E4F19DD8];
    do
    {
      for (uint64_t j = 0; j != v50; ++j)
      {
        if (*(void *)v126 != v51) {
          objc_enumerationMutation(v46);
        }
        v54 = *(void **)(*((void *)&v125 + 1) + 8 * j);
        v55 = objc_msgSend_notificationInfo(v54, v48, v49);
        BOOL v56 = v55 == 0;

        if (v56)
        {
          v58 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v57, v52, 1017, @"Subscription with a nil notificationInfo: %@", v54);
          v61 = objc_msgSend_subscriptionID(v54, v59, v60);
          objc_msgSend__handleSubscriptionSaved_error_(val, v62, (uint64_t)v61, v58);
        }
        else
        {
          objc_msgSend_addObject_(v43, v57, (uint64_t)v54);
        }
      }
      uint64_t v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v48, (uint64_t)&v125, v138, 16);
    }
    while (v50);
  }

  objc_msgSend_setSubscriptionsToSave_(val, v63, (uint64_t)v43);
LABEL_28:
  if (!objc_msgSend_count(v43, v41, v42)
    && (objc_msgSend_subscriptionIDsToDelete(val, v64, v65),
        v66 = objc_claimAutoreleasedReturnValue(),
        BOOL v69 = objc_msgSend_count(v66, v67, v68) == 0,
        v66,
        v69))
  {
    objc_msgSend_finishWithError_(val, v70, 0);
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v71 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      v74 = v71;
      v77 = objc_msgSend_subscriptionsToSave(val, v75, v76);
      uint64_t v80 = objc_msgSend_count(v77, v78, v79);
      v83 = objc_msgSend_subscriptionIDsToDelete(val, v81, v82);
      uint64_t v86 = objc_msgSend_count(v83, v84, v85);
      *(_DWORD *)buf = 134218240;
      uint64_t v135 = v80;
      __int16 v136 = 2048;
      uint64_t v137 = v86;
      _os_log_impl(&dword_1C4CFF000, v74, OS_LOG_TYPE_INFO, "Saving %ld, deleting %ld subscriptions on the server.", buf, 0x16u);
    }
    if (objc_msgSend_count(v43, v72, v73))
    {
      v89 = objc_msgSend_subscriptionsToSave(val, v87, v88);
      v92 = objc_msgSend_firstObject(v89, v90, v91);

      if (objc_msgSend_subscriptionType(v92, v93, v94) == 2 || objc_msgSend_subscriptionType(v92, v95, v96) == 1)
      {
        v97 = objc_msgSend_subscriptionsToSave(val, v95, v96);
        v100 = objc_msgSend_firstObject(v97, v98, v99);
        v103 = objc_msgSend_zoneID(v100, v101, v102);
      }
      else
      {
        v103 = 0;
      }
    }
    else
    {
      v103 = 0;
    }
    v104 = [CKDModifySubscriptionsURLRequest alloc];
    v107 = objc_msgSend_subscriptionIDsToDelete(val, v105, v106);
    v109 = objc_msgSend_initWithOperation_subscriptionsToSave_subscriptionIDsToDelete_(v104, v108, (uint64_t)val, v43, v107);

    objc_msgSend_setZoneID_(v109, v110, (uint64_t)v103);
    objc_initWeak((id *)buf, val);
    objc_initWeak(&location, v109);
    v122[0] = MEMORY[0x1E4F143A8];
    v122[1] = 3221225472;
    v122[2] = sub_1C4E62154;
    v122[3] = &unk_1E64F41A8;
    objc_copyWeak(&v123, (id *)buf);
    objc_msgSend_setSubscriptionModifiedBlock_(v109, v111, (uint64_t)v122);
    v119[0] = MEMORY[0x1E4F143A8];
    v119[1] = 3221225472;
    v119[2] = sub_1C4E6220C;
    v119[3] = &unk_1E64F0170;
    objc_copyWeak(&v120, (id *)buf);
    objc_copyWeak(&v121, &location);
    objc_msgSend_setCompletionBlock_(v109, v112, (uint64_t)v119);
    objc_msgSend_setRequest_(val, v113, (uint64_t)v109);
    v116 = objc_msgSend_container(val, v114, v115);
    objc_msgSend_performRequest_(v116, v117, (uint64_t)v109);

    objc_destroyWeak(&v121);
    objc_destroyWeak(&v120);
    objc_destroyWeak(&v123);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v8 = objc_msgSend_subscriptionsToSave(self, v6, v7);
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v27, v31, 16);
  if (v10)
  {
    uint64_t v13 = v10;
    uint64_t v14 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(v8);
        }
        uint64_t v16 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if (objc_msgSend_subscriptionType(v16, v11, v12) != 2
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          if (objc_msgSend_subscriptionType(v16, v11, v12) != 1) {
            continue;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
        }
        uint64_t v17 = objc_msgSend_zoneID(v16, v11, v12);
        if (v17)
        {
          uint64_t v18 = (void *)v17;
          objc_msgSend_addObject_(v5, v11, v17);
        }
      }
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v27, v31, 16);
    }
    while (v13);
  }

  if (objc_msgSend_count(v5, v19, v20))
  {
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = sub_1C4E624C0;
    v25[3] = &unk_1E64F1D18;
    id v26 = v5;
    objc_msgSend_updateCloudKitMetrics_(self, v22, (uint64_t)v25);
  }
  objc_msgSend_setSaveCompletionBlock_(self, v21, 0);
  objc_msgSend_setDeleteCompletionBlock_(self, v23, 0);
  v24.receiver = self;
  v24.super_class = (Class)CKDModifySubscriptionsOperation;
  [(CKDOperation *)&v24 _finishOnCallbackQueueWithError:v4];
}

- (int)operationType
{
  if (self->_hasSubscriptionsToSave && !self->_hasSubscriptionsToDelete) {
    return 300;
  }
  else {
    return 302;
  }
}

- (BOOL)isOperationType:(int)a3
{
  if (a3 == 300)
  {
    v3 = &OBJC_IVAR___CKDModifySubscriptionsOperation__hasSubscriptionsToSave;
    return *((unsigned char *)&self->super.super.super.super.isa + *v3) != 0;
  }
  if (a3 == 302)
  {
    v3 = &OBJC_IVAR___CKDModifySubscriptionsOperation__hasSubscriptionsToDelete;
    return *((unsigned char *)&self->super.super.super.super.isa + *v3) != 0;
  }
  return 0;
}

- (id)saveCompletionBlock
{
  return self->_saveCompletionBlock;
}

- (void)setSaveCompletionBlock:(id)a3
{
}

- (id)deleteCompletionBlock
{
  return self->_deleteCompletionBlock;
}

- (void)setDeleteCompletionBlock:(id)a3
{
}

- (NSArray)subscriptionsToSave
{
  return self->_subscriptionsToSave;
}

- (void)setSubscriptionsToSave:(id)a3
{
}

- (NSArray)subscriptionIDsToDelete
{
  return self->_subscriptionIDsToDelete;
}

- (void)setSubscriptionIDsToDelete:(id)a3
{
}

- (NSMutableDictionary)subscriptionsByServerID
{
  return self->_subscriptionsByServerID;
}

- (void)setSubscriptionsByServerID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionsByServerID, 0);
  objc_storeStrong((id *)&self->_subscriptionIDsToDelete, 0);
  objc_storeStrong((id *)&self->_subscriptionsToSave, 0);
  objc_storeStrong(&self->_deleteCompletionBlock, 0);
  objc_storeStrong(&self->_saveCompletionBlock, 0);
}

@end