@interface CKDModifySubscriptionsURLRequest
- (BOOL)requiresCKAnonymousUserIDs;
- (CKDModifySubscriptionsURLRequest)initWithOperation:(id)a3 subscriptionsToSave:(id)a4 subscriptionIDsToDelete:(id)a5;
- (CKRecordZoneID)zoneID;
- (NSArray)subscriptionIDsToDelete;
- (NSArray)subscriptionsToSave;
- (NSMutableDictionary)subscriptionIDByRequestID;
- (id)generateRequestOperations;
- (id)requestDidParseProtobufObject:(id)a3;
- (id)requestOperationClasses;
- (id)subscriptionModifiedBlock;
- (id)zoneIDsToLock;
- (void)fillOutEquivalencyPropertiesBuilder:(id)a3;
- (void)fillOutRequestProperties:(id)a3;
- (void)requestDidParseNodeFailure:(id)a3;
- (void)setSubscriptionIDByRequestID:(id)a3;
- (void)setSubscriptionIDsToDelete:(id)a3;
- (void)setSubscriptionModifiedBlock:(id)a3;
- (void)setSubscriptionsToSave:(id)a3;
- (void)setZoneID:(id)a3;
@end

@implementation CKDModifySubscriptionsURLRequest

- (CKDModifySubscriptionsURLRequest)initWithOperation:(id)a3 subscriptionsToSave:(id)a4 subscriptionIDsToDelete:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CKDModifySubscriptionsURLRequest;
  v11 = [(CKDURLRequest *)&v16 initWithOperation:a3];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_subscriptionsToSave, a4);
    objc_storeStrong((id *)&v12->_subscriptionIDsToDelete, a5);
    uint64_t v13 = objc_opt_new();
    subscriptionIDByRequestID = v12->_subscriptionIDByRequestID;
    v12->_subscriptionIDByRequestID = (NSMutableDictionary *)v13;
  }
  return v12;
}

- (void)fillOutEquivalencyPropertiesBuilder:(id)a3
{
  v21.receiver = self;
  v21.super_class = (Class)CKDModifySubscriptionsURLRequest;
  id v4 = a3;
  [(CKDURLRequest *)&v21 fillOutEquivalencyPropertiesBuilder:v4];
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  v8 = objc_msgSend_subscriptionsToSave(self, v6, v7, v21.receiver, v21.super_class);
  id v10 = objc_msgSend_CKMap_(v8, v9, (uint64_t)&unk_1F2043710);
  v12 = objc_msgSend_setWithArray_(v5, v11, (uint64_t)v10);

  objc_msgSend_setObject_forKeyedSubscript_(v4, v13, (uint64_t)v12, @"modifyIDs");
  v14 = (void *)MEMORY[0x1E4F1CAD0];
  v17 = objc_msgSend_subscriptionIDsToDelete(self, v15, v16);
  v19 = objc_msgSend_setWithArray_(v14, v18, (uint64_t)v17);

  objc_msgSend_setObject_forKeyedSubscript_(v4, v20, (uint64_t)v19, @"deleteIDs");
}

- (void)fillOutRequestProperties:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_opt_new();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v8 = objc_msgSend_subscriptionsToSave(self, v6, v7);
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v23, v27, 16);
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v8);
        }
        v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v18 = objc_msgSend_zoneID(v14, v15, v16);
          if (!v18) {
            goto LABEL_12;
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          v18 = objc_msgSend_zoneID(v14, v19, v20);
        }
        objc_msgSend_addObject_(v5, v17, (uint64_t)v18);
LABEL_12:
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v19, (uint64_t)&v23, v27, 16);
    }
    while (v11);
  }

  objc_msgSend_setModifySubscriptionRecordZoneIDs_(v4, v21, (uint64_t)v5);
  v22.receiver = self;
  v22.super_class = (Class)CKDModifySubscriptionsURLRequest;
  [(CKDURLRequest *)&v22 fillOutRequestProperties:v4];
}

- (BOOL)requiresCKAnonymousUserIDs
{
  return 0;
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

- (id)requestOperationClasses
{
  v3 = objc_opt_new();
  v6 = objc_msgSend_subscriptionsToSave(self, v4, v5);
  uint64_t v9 = objc_msgSend_count(v6, v7, v8);

  if (v9)
  {
    uint64_t v12 = objc_opt_class();
    objc_msgSend_addObject_(v3, v13, v12);
  }
  v14 = objc_msgSend_subscriptionIDsToDelete(self, v10, v11);
  uint64_t v17 = objc_msgSend_count(v14, v15, v16);

  if (v17)
  {
    uint64_t v18 = objc_opt_class();
    objc_msgSend_addObject_(v3, v19, v18);
  }
  return v3;
}

- (id)generateRequestOperations
{
  uint64_t v129 = *MEMORY[0x1E4F143B8];
  id v115 = (id)objc_opt_new();
  long long v121 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  objc_msgSend_subscriptionsToSave(self, v3, v4);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v121, v128, 16);
  if (v6)
  {
    uint64_t v8 = v6;
    id v113 = *(id *)v122;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(id *)v122 != v113) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v121 + 1) + 8 * v9);
        uint64_t v11 = objc_msgSend_operationRequestWithType_(self, v7, 300);
        uint64_t v12 = objc_opt_new();
        objc_msgSend_setSubscriptionCreateRequest_(v11, v13, (uint64_t)v12);

        uint64_t v16 = objc_msgSend_translator(self, v14, v15);
        id v120 = 0;
        uint64_t v18 = objc_msgSend_pSubscriptionFromSubscription_error_(v16, v17, (uint64_t)v10, &v120);
        id v19 = v120;
        objc_super v22 = objc_msgSend_subscriptionCreateRequest(v11, v20, v21);
        objc_msgSend_setSubscription_(v22, v23, (uint64_t)v18);

        long long v26 = objc_msgSend_subscriptionCreateRequest(v11, v24, v25);
        v29 = objc_msgSend_subscription(v26, v27, v28);

        if (v29)
        {
          objc_msgSend_addObject_(v115, v30, (uint64_t)v11);
          v33 = objc_msgSend_subscriptionID(v10, v31, v32);
          objc_msgSend_subscriptionIDByRequestID(self, v34, v35);
          v36 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend_request(v11, v37, v38);
          v42 = objc_msgSend_operationUUID(v39, v40, v41);
          objc_msgSend_setObject_forKeyedSubscript_(v36, v43, (uint64_t)v33, v42);

LABEL_14:
          goto LABEL_15;
        }
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v44 = *MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v127 = v19;
          _os_log_error_impl(&dword_1C4CFF000, v44, OS_LOG_TYPE_ERROR, "Failed to convert subscription: %@", buf, 0xCu);
        }
        v47 = objc_msgSend_subscriptionModifiedBlock(self, v45, v46);

        if (v47)
        {
          v33 = objc_opt_new();
          objc_msgSend_setCode_(v33, v48, 3);
          v49 = objc_opt_new();
          objc_msgSend_setError_(v33, v50, (uint64_t)v49);

          v51 = objc_opt_new();
          v54 = objc_msgSend_error(v33, v52, v53);
          objc_msgSend_setClientError_(v54, v55, (uint64_t)v51);

          v58 = objc_msgSend_error(v33, v56, v57);
          v61 = objc_msgSend_clientError(v58, v59, v60);
          objc_msgSend_setType_(v61, v62, 7);

          v65 = objc_msgSend_error(v33, v63, v64);
          objc_msgSend_setErrorKey_(v65, v66, @"Invalid subscription");

          v67 = NSString;
          v70 = objc_msgSend_localizedDescription(v19, v68, v69);
          v72 = objc_msgSend_stringWithFormat_(v67, v71, @"The subscription could not be converted because it is invalid: %@", v70);
          v75 = objc_msgSend_error(v33, v73, v74);
          objc_msgSend_setErrorDescription_(v75, v76, (uint64_t)v72);

          objc_msgSend_subscriptionModifiedBlock(self, v77, v78);
          v36 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend_subscriptionID(v10, v79, v80);
          ((void (**)(void, void *, void *))v36)[2](v36, v39, v33);
          goto LABEL_14;
        }
LABEL_15:

        ++v9;
      }
      while (v8 != v9);
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v121, v128, 16);
    }
    while (v8);
  }

  long long v118 = 0u;
  long long v119 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  objc_msgSend_subscriptionIDsToDelete(self, v81, v82);
  id v114 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v84 = objc_msgSend_countByEnumeratingWithState_objects_count_(v114, v83, (uint64_t)&v116, v125, 16);
  if (v84)
  {
    uint64_t v86 = v84;
    uint64_t v87 = *(void *)v117;
    do
    {
      for (uint64_t i = 0; i != v86; ++i)
      {
        if (*(void *)v117 != v87) {
          objc_enumerationMutation(v114);
        }
        v89 = *(void **)(*((void *)&v116 + 1) + 8 * i);
        v90 = objc_msgSend_operationRequestWithType_(self, v85, 302);
        v91 = objc_opt_new();
        objc_msgSend_setSubscriptionDeleteRequest_(v90, v92, (uint64_t)v91);

        v95 = objc_msgSend_CKDPIdentifier_Subscription(v89, v93, v94);
        v98 = objc_msgSend_subscriptionDeleteRequest(v90, v96, v97);
        objc_msgSend_setIdentifier_(v98, v99, (uint64_t)v95);

        objc_msgSend_addObject_(v115, v100, (uint64_t)v90);
        v103 = objc_msgSend_subscriptionIDByRequestID(self, v101, v102);
        v106 = objc_msgSend_request(v90, v104, v105);
        v109 = objc_msgSend_operationUUID(v106, v107, v108);
        objc_msgSend_setObject_forKeyedSubscript_(v103, v110, (uint64_t)v89, v109);
      }
      uint64_t v86 = objc_msgSend_countByEnumeratingWithState_objects_count_(v114, v85, (uint64_t)&v116, v125, 16);
    }
    while (v86);
  }

  return v115;
}

- (id)requestDidParseProtobufObject:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_subscriptionIDByRequestID(self, v5, v6);
  uint64_t v10 = objc_msgSend_response(v4, v8, v9);
  uint64_t v13 = objc_msgSend_operationUUID(v10, v11, v12);
  uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(v7, v14, (uint64_t)v13);

  uint64_t v18 = objc_msgSend_subscriptionModifiedBlock(self, v16, v17);

  if (v18)
  {
    objc_msgSend_subscriptionModifiedBlock(self, v19, v20);
    uint64_t v21 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    long long v24 = objc_msgSend_result(v4, v22, v23);
    ((void (**)(void, void *, void *))v21)[2](v21, v15, v24);
  }
  return 0;
}

- (void)requestDidParseNodeFailure:(id)a3
{
  id v24 = a3;
  uint64_t v6 = objc_msgSend_subscriptionIDByRequestID(self, v4, v5);
  uint64_t v9 = objc_msgSend_response(v24, v7, v8);
  uint64_t v12 = objc_msgSend_operationUUID(v9, v10, v11);
  v14 = objc_msgSend_objectForKeyedSubscript_(v6, v13, (uint64_t)v12);

  uint64_t v17 = objc_msgSend_subscriptionModifiedBlock(self, v15, v16);

  if (v17)
  {
    objc_msgSend_subscriptionModifiedBlock(self, v18, v19);
    uint64_t v20 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v23 = objc_msgSend_result(v24, v21, v22);
    ((void (**)(void, void *, void *))v20)[2](v20, v14, v23);
  }
}

- (CKRecordZoneID)zoneID
{
  return self->_zoneID;
}

- (void)setZoneID:(id)a3
{
}

- (id)subscriptionModifiedBlock
{
  return self->_subscriptionModifiedBlock;
}

- (void)setSubscriptionModifiedBlock:(id)a3
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
  objc_storeStrong((id *)&self->_subscriptionIDsToDelete, 0);
  objc_storeStrong((id *)&self->_subscriptionsToSave, 0);
  objc_storeStrong(&self->_subscriptionModifiedBlock, 0);
  objc_storeStrong((id *)&self->_zoneID, 0);
}

@end