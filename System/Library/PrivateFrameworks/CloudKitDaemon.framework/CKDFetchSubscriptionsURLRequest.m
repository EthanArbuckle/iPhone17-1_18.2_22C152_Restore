@interface CKDFetchSubscriptionsURLRequest
- (BOOL)requiresCKAnonymousUserIDs;
- (CKDFetchSubscriptionsURLRequest)initWithOperation:(id)a3 subscriptionIDs:(id)a4;
- (NSArray)subscriptionIDs;
- (NSMutableArray)subscriptions;
- (NSMutableDictionary)subscriptionIDByRequestID;
- (id)errorFetchingAllSubscriptionsBlock;
- (id)generateRequestOperations;
- (id)requestDidParseProtobufObject:(id)a3;
- (id)requestOperationClasses;
- (id)subscriptionFetchedBlock;
- (id)zoneIDsToLock;
- (void)fillOutEquivalencyPropertiesBuilder:(id)a3;
- (void)requestDidParseNodeFailure:(id)a3;
- (void)setErrorFetchingAllSubscriptionsBlock:(id)a3;
- (void)setSubscriptionFetchedBlock:(id)a3;
- (void)setSubscriptionIDByRequestID:(id)a3;
- (void)setSubscriptionIDs:(id)a3;
- (void)setSubscriptions:(id)a3;
@end

@implementation CKDFetchSubscriptionsURLRequest

- (CKDFetchSubscriptionsURLRequest)initWithOperation:(id)a3 subscriptionIDs:(id)a4
{
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CKDFetchSubscriptionsURLRequest;
  v8 = [(CKDURLRequest *)&v17 initWithOperation:a3];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_subscriptionIDs, a4);
    uint64_t v12 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v10, v11);
    subscriptions = v9->_subscriptions;
    v9->_subscriptions = (NSMutableArray *)v12;

    uint64_t v14 = objc_opt_new();
    subscriptionIDByRequestID = v9->_subscriptionIDByRequestID;
    v9->_subscriptionIDByRequestID = (NSMutableDictionary *)v14;
  }
  return v9;
}

- (void)fillOutEquivalencyPropertiesBuilder:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CKDFetchSubscriptionsURLRequest;
  id v4 = a3;
  [(CKDURLRequest *)&v12 fillOutEquivalencyPropertiesBuilder:v4];
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  v8 = objc_msgSend_subscriptionIDs(self, v6, v7, v12.receiver, v12.super_class);
  v10 = objc_msgSend_setWithArray_(v5, v9, (uint64_t)v8);

  objc_msgSend_setObject_forKeyedSubscript_(v4, v11, (uint64_t)v10, @"ids");
}

- (id)zoneIDsToLock
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend_defaultRecordZone(MEMORY[0x1E4F1A310], a2, v2);
  v6 = objc_msgSend_zoneID(v3, v4, v5);
  v10[0] = v6;
  v8 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v7, (uint64_t)v10, 1);

  return v8;
}

- (BOOL)requiresCKAnonymousUserIDs
{
  return 0;
}

- (id)requestOperationClasses
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = objc_opt_class();
  v3 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v2, (uint64_t)v5, 1);
  return v3;
}

- (id)generateRequestOperations
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  v6 = objc_msgSend_subscriptionIDs(self, v4, v5);
  uint64_t v9 = objc_msgSend_count(v6, v7, v8);

  if (v9)
  {
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    objc_msgSend_subscriptionIDs(self, v10, v11);
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v12, (uint64_t)&v51, v55, 16);
    if (v13)
    {
      uint64_t v16 = v13;
      uint64_t v17 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v52 != v17) {
            objc_enumerationMutation(obj);
          }
          v19 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          uint64_t v20 = objc_msgSend_operationType(self, v14, v15);
          v22 = objc_msgSend_operationRequestWithType_(self, v21, v20);
          v23 = objc_opt_new();
          objc_msgSend_setSubscriptionRetrieveRequest_(v22, v24, (uint64_t)v23);

          v27 = objc_msgSend_CKDPIdentifier_Subscription(v19, v25, v26);
          v30 = objc_msgSend_subscriptionRetrieveRequest(v22, v28, v29);
          objc_msgSend_setIdentifier_(v30, v31, (uint64_t)v27);

          objc_msgSend_addObject_(v3, v32, (uint64_t)v22);
          v35 = objc_msgSend_subscriptionIDByRequestID(self, v33, v34);
          v38 = objc_msgSend_request(v22, v36, v37);
          v41 = objc_msgSend_operationUUID(v38, v39, v40);
          objc_msgSend_setObject_forKeyedSubscript_(v35, v42, (uint64_t)v19, v41);
        }
        uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v51, v55, 16);
      }
      while (v16);
    }
  }
  else
  {
    uint64_t v43 = objc_msgSend_operationType(self, v10, v11);
    v45 = objc_msgSend_operationRequestWithType_(self, v44, v43);
    v46 = objc_opt_new();
    objc_msgSend_setSubscriptionRetrieveRequest_(v45, v47, (uint64_t)v46);

    objc_msgSend_addObject_(v3, v48, (uint64_t)v45);
  }
  return v3;
}

- (id)requestDidParseProtobufObject:(id)a3
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend_hasSubscriptionRetrieveResponse(v4, v5, v6))
  {
    long long v87 = 0u;
    long long v88 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    v83 = v4;
    uint64_t v9 = objc_msgSend_subscriptionRetrieveResponse(v4, v7, v8);
    objc_super v12 = objc_msgSend_subscriptions(v9, v10, v11);

    uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v85, v93, 16);
    if (!v14)
    {
      id v19 = 0;
      goto LABEL_25;
    }
    uint64_t v18 = v14;
    id v19 = 0;
    uint64_t v20 = *(void *)v86;
    *(void *)&long long v17 = 138543618;
    long long v82 = v17;
    while (1)
    {
      uint64_t v21 = 0;
      do
      {
        v22 = v19;
        if (*(void *)v86 != v20) {
          objc_enumerationMutation(v12);
        }
        uint64_t v23 = *(void *)(*((void *)&v85 + 1) + 8 * v21);
        v24 = objc_msgSend_translator(self, v15, v16, v82);
        id v84 = v19;
        uint64_t v26 = objc_msgSend_subscriptionFromPSubscription_error_(v24, v25, v23, &v84);
        id v19 = v84;

        if (v26)
        {
          objc_msgSend_addObject_(self->_subscriptions, v27, (uint64_t)v26);
          v30 = objc_msgSend_subscriptionFetchedBlock(self, v28, v29);

          if (!v30) {
            goto LABEL_14;
          }
          objc_msgSend_subscriptionFetchedBlock(self, v31, v32);
          v33 = (void (**)(id, void *, void *, void *))objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend_subscriptionID(v26, v34, v35);
          v39 = objc_msgSend_result(v83, v37, v38);
          v33[2](v33, v26, v36, v39);

          goto LABEL_10;
        }
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        uint64_t v40 = (void *)*MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
        {
          v33 = v40;
          v36 = objc_msgSend_localizedDescription(v19, v41, v42);
          *(_DWORD *)buf = v82;
          v90 = v36;
          __int16 v91 = 2112;
          uint64_t v92 = v23;
          _os_log_error_impl(&dword_1C4CFF000, (os_log_t)v33, OS_LOG_TYPE_ERROR, "Unable to read subscription object, discarding: %{public}@: %@", buf, 0x16u);
LABEL_10:
        }
LABEL_14:

        ++v21;
      }
      while (v18 != v21);
      uint64_t v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v85, v93, 16);
      uint64_t v18 = v43;
      if (!v43)
      {
LABEL_25:

        id v4 = v83;
        goto LABEL_29;
      }
    }
  }
  v44 = objc_msgSend_result(v4, v7, v8);
  int hasError = objc_msgSend_hasError(v44, v45, v46);

  if (hasError)
  {
    v50 = objc_msgSend_subscriptionIDs(self, v48, v49);
    uint64_t v53 = objc_msgSend_count(v50, v51, v52);

    if (v53)
    {
      uint64_t v56 = objc_msgSend_subscriptionIDByRequestID(self, v54, v55);
      v59 = objc_msgSend_response(v4, v57, v58);
      v62 = objc_msgSend_operationUUID(v59, v60, v61);
      v64 = objc_msgSend_objectForKeyedSubscript_(v56, v63, (uint64_t)v62);

      v67 = objc_msgSend_subscriptionFetchedBlock(self, v65, v66);

      if (v67)
      {
        objc_msgSend_subscriptionFetchedBlock(self, v68, v69);
        v70 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
        v73 = objc_msgSend_result(v4, v71, v72);
        ((void (**)(void, void, void *, void *))v70)[2](v70, 0, v64, v73);
      }
    }
    else
    {
      v74 = objc_msgSend_errorFetchingAllSubscriptionsBlock(self, v54, v55);

      if (v74)
      {
        objc_msgSend_errorFetchingAllSubscriptionsBlock(self, v75, v76);
        v77 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
        v80 = objc_msgSend_result(v4, v78, v79);
        ((void (**)(void, void *))v77)[2](v77, v80);
      }
    }
  }
  id v19 = 0;
LABEL_29:

  return v19;
}

- (void)requestDidParseNodeFailure:(id)a3
{
  id v35 = a3;
  uint64_t v6 = objc_msgSend_subscriptionIDs(self, v4, v5);
  uint64_t v9 = objc_msgSend_count(v6, v7, v8);

  if (!v9)
  {
    v30 = objc_msgSend_errorFetchingAllSubscriptionsBlock(self, v10, v11);

    if (!v30) {
      goto LABEL_8;
    }
    objc_msgSend_errorFetchingAllSubscriptionsBlock(self, v31, v32);
    uint64_t v20 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v35, v33, v34);
    uint64_t v26 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
    v20[2](v20, v26);
    goto LABEL_6;
  }
  objc_super v12 = objc_msgSend_subscriptionIDByRequestID(self, v10, v11);
  uint64_t v15 = objc_msgSend_response(v35, v13, v14);
  uint64_t v18 = objc_msgSend_operationUUID(v15, v16, v17);
  objc_msgSend_objectForKeyedSubscript_(v12, v19, (uint64_t)v18);
  uint64_t v20 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();

  uint64_t v23 = objc_msgSend_subscriptionFetchedBlock(self, v21, v22);

  if (v23)
  {
    objc_msgSend_subscriptionFetchedBlock(self, v24, v25);
    uint64_t v26 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v29 = objc_msgSend_result(v35, v27, v28);
    ((void (**)(void, void, void (**)(void, void), void *))v26)[2](v26, 0, v20, v29);

LABEL_6:
  }

LABEL_8:
}

- (NSMutableArray)subscriptions
{
  return self->_subscriptions;
}

- (void)setSubscriptions:(id)a3
{
}

- (id)subscriptionFetchedBlock
{
  return self->_subscriptionFetchedBlock;
}

- (void)setSubscriptionFetchedBlock:(id)a3
{
}

- (id)errorFetchingAllSubscriptionsBlock
{
  return self->_errorFetchingAllSubscriptionsBlock;
}

- (void)setErrorFetchingAllSubscriptionsBlock:(id)a3
{
}

- (NSArray)subscriptionIDs
{
  return self->_subscriptionIDs;
}

- (void)setSubscriptionIDs:(id)a3
{
}

- (NSMutableDictionary)subscriptionIDByRequestID
{
  return self->_subscriptionIDByRequestID;
}

- (void)setSubscriptionIDByRequestID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionIDByRequestID, 0);
  objc_storeStrong((id *)&self->_subscriptionIDs, 0);
  objc_storeStrong(&self->_errorFetchingAllSubscriptionsBlock, 0);
  objc_storeStrong(&self->_subscriptionFetchedBlock, 0);
  objc_storeStrong((id *)&self->_subscriptions, 0);
}

@end