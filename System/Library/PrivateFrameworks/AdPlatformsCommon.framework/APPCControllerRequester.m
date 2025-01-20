@interface APPCControllerRequester
- (APControllerRequesterCoordinator)requestCoordinator;
- (APPCControllerRequester)initWithDeliveryBlock:(id)a3;
- (APUnfairLock)lock;
- (BOOL)invalid;
- (NSError)lastError;
- (NSMutableDictionary)requestCompletionBlockByRequestID;
- (NSUUID)requesterID;
- (id)_preprocessHandler:(id)a3;
- (id)newPromotedContentsDeliveryBlock;
- (id)proxyURL;
- (void)_invalidateAndfulfillAllRequestsWithError:(id)a3;
- (void)connectionSevered;
- (void)contentResponses:(id)a3;
- (void)endRequests;
- (void)handleCompletionOfRequest:(id)a3;
- (void)preWarm:(id)a3;
- (void)proxyURLWithCompletionHandler:(id)a3;
- (void)requestPromotedContentOfTypes:(id)a3 forContext:(id)a4 completionHandler:(id)a5;
- (void)sendAndRankContent:(id)a3 forContext:(id)a4 placement:(unint64_t)a5 responseHandler:(id)a6 completionHandler:(id)a7;
- (void)setInvalid:(BOOL)a3;
- (void)setLastError:(id)a3;
- (void)setLock:(id)a3;
- (void)setNewPromotedContentsDeliveryBlock:(id)a3;
- (void)setRequestCompletionBlockByRequestID:(id)a3;
- (void)setRequestCoordinator:(id)a3;
- (void)setRequesterID:(id)a3;
@end

@implementation APPCControllerRequester

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestCoordinator, 0);
  objc_storeStrong((id *)&self->_requesterID, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_requestCompletionBlockByRequestID, 0);
  objc_storeStrong((id *)&self->_lastError, 0);
  objc_storeStrong(&self->_newPromotedContentsDeliveryBlock, 0);
}

- (void)preWarm:(id)a3
{
  id v4 = a3;
  objc_msgSend_requestCoordinator(self, v5, v6, v7, v8, v9, v10);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_preWarm_forRequester_(v15, v11, (uint64_t)v4, (uint64_t)self, v12, v13, v14);
}

- (void)endRequests
{
  objc_msgSend__invalidateAndfulfillAllRequestsWithError_(self, a2, 0, v2, v3, v4, v5);
  objc_msgSend_lock(self, v7, v8, v9, v10, v11, v12);
  id v49 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v49, v13, v14, v15, v16, v17, v18);
  objc_msgSend_setInvalid_(self, v19, 1, v20, v21, v22, v23);
  objc_msgSend_unlock(v49, v24, v25, v26, v27, v28, v29);
  v36 = objc_msgSend_requestCoordinator(self, v30, v31, v32, v33, v34, v35);
  v43 = objc_msgSend_requesterID(self, v37, v38, v39, v40, v41, v42);
  objc_msgSend_finishedWithRequestsForID_(v36, v44, (uint64_t)v43, v45, v46, v47, v48);
}

- (APControllerRequesterCoordinator)requestCoordinator
{
  return self->_requestCoordinator;
}

- (void)setInvalid:(BOOL)a3
{
  self->_invalid = a3;
}

- (APPCControllerRequester)initWithDeliveryBlock:(id)a3
{
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)APPCControllerRequester;
  double v5 = [(APPCControllerRequester *)&v42 init];
  double v12 = v5;
  if (v5)
  {
    v5->_invalid = 0;
    uint64_t v13 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v6, v7, v8, v9, v10, v11);
    requestCompletionBlockByRequestID = v12->_requestCompletionBlockByRequestID;
    v12->_requestCompletionBlockByRequestID = (NSMutableDictionary *)v13;

    uint64_t v15 = MEMORY[0x22A64D220](v4);
    id newPromotedContentsDeliveryBlock = v12->_newPromotedContentsDeliveryBlock;
    v12->_id newPromotedContentsDeliveryBlock = (id)v15;

    id v17 = objc_alloc(MEMORY[0x263F20B90]);
    uint64_t v23 = objc_msgSend_initWithOptions_(v17, v18, 1, v19, v20, v21, v22);
    lock = v12->_lock;
    v12->_lock = (APUnfairLock *)v23;

    uint64_t v31 = objc_msgSend_UUID(MEMORY[0x263F08C38], v25, v26, v27, v28, v29, v30);
    requesterID = v12->_requesterID;
    v12->_requesterID = (NSUUID *)v31;

    uint64_t v39 = objc_msgSend_requestCoordinator(APControllerRequesterCoordinator, v33, v34, v35, v36, v37, v38);
    requestCoordinator = v12->_requestCoordinator;
    v12->_requestCoordinator = (APControllerRequesterCoordinator *)v39;
  }
  return v12;
}

- (void)_invalidateAndfulfillAllRequestsWithError:(id)a3
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v11 = objc_msgSend_lock(self, v5, v6, v7, v8, v9, v10);
  objc_msgSend_lock(v11, v12, v13, v14, v15, v16, v17);

  objc_msgSend_setLastError_(self, v18, (uint64_t)v4, v19, v20, v21, v22);
  double v29 = objc_msgSend_requestCompletionBlockByRequestID(self, v23, v24, v25, v26, v27, v28);
  uint64_t v36 = objc_msgSend_allValues(v29, v30, v31, v32, v33, v34, v35);

  v43 = objc_msgSend_requestCompletionBlockByRequestID(self, v37, v38, v39, v40, v41, v42);
  objc_msgSend_removeAllObjects(v43, v44, v45, v46, v47, v48, v49);

  v56 = objc_msgSend_lock(self, v50, v51, v52, v53, v54, v55);
  objc_msgSend_unlock(v56, v57, v58, v59, v60, v61, v62);

  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id v63 = v36;
  uint64_t v67 = objc_msgSend_countByEnumeratingWithState_objects_count_(v63, v64, (uint64_t)&v76, (uint64_t)v80, 16, v65, v66);
  if (v67)
  {
    uint64_t v68 = v67;
    uint64_t v69 = *(void *)v77;
    do
    {
      uint64_t v70 = 0;
      do
      {
        if (*(void *)v77 != v69) {
          objc_enumerationMutation(v63);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v76 + 1) + 8 * v70++) + 16))();
      }
      while (v68 != v70);
      uint64_t v68 = objc_msgSend_countByEnumeratingWithState_objects_count_(v63, v71, (uint64_t)&v76, (uint64_t)v80, 16, v72, v73);
    }
    while (v68);
  }

  v74 = APLogForCategory();
  if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v75 = 0;
    _os_log_impl(&dword_226303000, v74, OS_LOG_TYPE_INFO, "XPC connection is closed.", v75, 2u);
  }
}

- (APUnfairLock)lock
{
  return self->_lock;
}

- (NSMutableDictionary)requestCompletionBlockByRequestID
{
  return self->_requestCompletionBlockByRequestID;
}

- (void)setLastError:(id)a3
{
}

- (NSUUID)requesterID
{
  return self->_requesterID;
}

- (void)requestPromotedContentOfTypes:(id)a3 forContext:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v16 = objc_msgSend__preprocessHandler_(self, v11, (uint64_t)v10, v12, v13, v14, v15);
  if (v16)
  {
    objc_initWeak(&location, self);
    uint64_t v23 = objc_msgSend_requestCoordinator(self, v17, v18, v19, v20, v21, v22);
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = sub_226309E54;
    v27[3] = &unk_26479BA50;
    objc_copyWeak(&v29, &location);
    id v28 = v16;
    objc_msgSend_requestPromotedContentOfTypes_forRequester_forContext_completionHandler_(v23, v24, (uint64_t)v8, (uint64_t)self, (uint64_t)v9, v25, v26, v27);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }
}

- (void)sendAndRankContent:(id)a3 forContext:(id)a4 placement:(unint64_t)a5 responseHandler:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  double v21 = objc_msgSend__preprocessHandler_(self, v16, (uint64_t)v15, v17, v18, v19, v20);
  if (v21)
  {
    objc_initWeak(&location, self);
    id v28 = objc_msgSend_requestCoordinator(self, v22, v23, v24, v25, v26, v27);
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = sub_22630A040;
    v32[3] = &unk_26479BA78;
    id v34 = v14;
    objc_copyWeak(&v35, &location);
    id v33 = v21;
    objc_msgSend_sendAndRankContent_forContext_placement_completionHandler_(v28, v29, (uint64_t)v12, (uint64_t)v13, a5, v30, v31, v32);

    objc_destroyWeak(&v35);
    objc_destroyWeak(&location);
  }
  else if (v14)
  {
    (*((void (**)(id, void, void))v14 + 2))(v14, 0, 0);
  }
}

- (void)connectionSevered
{
  v17[3] = *MEMORY[0x263EF8340];
  uint64_t v5 = *MEMORY[0x263F08338];
  v16[0] = *MEMORY[0x263F08320];
  v16[1] = v5;
  v17[0] = @"PCController requester was invalidated.";
  v17[1] = @"The user asked to invalidate the requester.";
  v16[2] = *MEMORY[0x263F08348];
  v17[2] = @"Create a new PCController requester and try again.";
  uint64_t v6 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, a2, (uint64_t)v17, (uint64_t)v16, 3, v2, v3);
  id v10 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v7, @"APPCControllerRequesterErrorDomain", 5003, (uint64_t)v6, v8, v9);
  objc_msgSend__invalidateAndfulfillAllRequestsWithError_(self, v11, (uint64_t)v10, v12, v13, v14, v15);
}

- (void)contentResponses:(id)a3
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v11 = objc_msgSend_lock(self, v5, v6, v7, v8, v9, v10);
  objc_msgSend_lock(v11, v12, v13, v14, v15, v16, v17);

  uint64_t v24 = objc_msgSend_newPromotedContentsDeliveryBlock(self, v18, v19, v20, v21, v22, v23);
  if (v24)
  {
    double v31 = (void *)v24;
    char v32 = objc_msgSend_invalid(self, v25, v26, v27, v28, v29, v30);

    if ((v32 & 1) == 0)
    {
      id v33 = APLogForCategory();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        int v69 = 134217984;
        uint64_t v70 = objc_msgSend_count(v4, v34, v35, v36, v37, v38, v39);
        _os_log_impl(&dword_226303000, v33, OS_LOG_TYPE_INFO, "Received promoted contents: %lu", (uint8_t *)&v69, 0xCu);
      }

      objc_msgSend_newPromotedContentsDeliveryBlock(self, v40, v41, v42, v43, v44, v45);
      uint64_t v46 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
      ((void (**)(void, id))v46)[2](v46, v4);
    }
  }
  uint64_t v47 = objc_msgSend_newPromotedContentsDeliveryBlock(self, v25, v26, v27, v28, v29, v30);

  if (!v47)
  {
    double v54 = APLogForCategory();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v69) = 0;
      _os_log_impl(&dword_226303000, v54, OS_LOG_TYPE_ERROR, "Promoted contents are discarded due to missing delivery block.", (uint8_t *)&v69, 2u);
    }
  }
  if (objc_msgSend_invalid(self, v48, v49, v50, v51, v52, v53))
  {
    double v61 = APLogForCategory();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v69) = 0;
      _os_log_impl(&dword_226303000, v61, OS_LOG_TYPE_ERROR, "Promoted contents are discarded because the requester is invalid.", (uint8_t *)&v69, 2u);
    }
  }
  double v62 = objc_msgSend_lock(self, v55, v56, v57, v58, v59, v60);
  objc_msgSend_unlock(v62, v63, v64, v65, v66, v67, v68);
}

- (id)proxyURL
{
  uint64_t v8 = objc_msgSend_requestCoordinator(self, a2, v2, v3, v4, v5, v6);
  uint64_t v14 = objc_msgSend_proxyURLForRequester_(v8, v9, (uint64_t)self, v10, v11, v12, v13);

  return v14;
}

- (void)proxyURLWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_msgSend_requestCoordinator(self, v5, v6, v7, v8, v9, v10);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_proxyURLForRequester_withCompletionHandler_(v15, v11, (uint64_t)self, (uint64_t)v4, v12, v13, v14);
}

- (void)handleCompletionOfRequest:(id)a3
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v11 = objc_msgSend_lock(self, v5, v6, v7, v8, v9, v10);
  objc_msgSend_lock(v11, v12, v13, v14, v15, v16, v17);

  uint64_t v24 = objc_msgSend_requestCompletionBlockByRequestID(self, v18, v19, v20, v21, v22, v23);
  objc_msgSend_objectForKey_(v24, v25, (uint64_t)v4, v26, v27, v28, v29);
  double v30 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();

  uint64_t v37 = objc_msgSend_requestCompletionBlockByRequestID(self, v31, v32, v33, v34, v35, v36);
  objc_msgSend_removeObjectForKey_(v37, v38, (uint64_t)v4, v39, v40, v41, v42);

  uint64_t v49 = objc_msgSend_lock(self, v43, v44, v45, v46, v47, v48);
  objc_msgSend_unlock(v49, v50, v51, v52, v53, v54, v55);

  if (v30)
  {
    v30[2](v30, 0);
  }
  else
  {
    uint64_t v56 = APLogForCategory();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      id v63 = objc_msgSend_lastError(self, v57, v58, v59, v60, v61, v62);
      int v64 = 138543362;
      uint64_t v65 = v63;
      _os_log_impl(&dword_226303000, v56, OS_LOG_TYPE_ERROR, "Request completion block was triggered due to %{public}@.", (uint8_t *)&v64, 0xCu);
    }
  }
}

- (id)_preprocessHandler:(id)a3
{
  v82[3] = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void *))a3;
  uint64_t v11 = objc_msgSend_lock(self, v5, v6, v7, v8, v9, v10);
  objc_msgSend_lock(v11, v12, v13, v14, v15, v16, v17);

  if (objc_msgSend_invalid(self, v18, v19, v20, v21, v22, v23))
  {
    double v30 = APLogForCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v80 = 0;
      _os_log_impl(&dword_226303000, v30, OS_LOG_TYPE_ERROR, "Invalid requester cannot request promoted content.", v80, 2u);
    }

    uint64_t v31 = *MEMORY[0x263F08338];
    v81[0] = *MEMORY[0x263F08320];
    v81[1] = v31;
    v82[0] = @"PCController requester was invalidated.";
    v82[1] = @"The user asked to invalidate the requester.";
    v81[2] = *MEMORY[0x263F08348];
    v82[2] = @"Create a new PCController requester and try again.";
    double v35 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v32, (uint64_t)v82, (uint64_t)v81, 3, v33, v34);
    uint64_t v39 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v36, @"APPCControllerRequesterErrorDomain", 5003, (uint64_t)v35, v37, v38);
    v4[2](v4, v39);

    uint64_t v46 = objc_msgSend_lock(self, v40, v41, v42, v43, v44, v45);
    objc_msgSend_unlock(v46, v47, v48, v49, v50, v51, v52);

    uint64_t v53 = 0;
  }
  else
  {
    uint64_t v53 = objc_msgSend_UUID(MEMORY[0x263F08C38], v24, v25, v26, v27, v28, v29);
    uint64_t v60 = objc_msgSend_requestCompletionBlockByRequestID(self, v54, v55, v56, v57, v58, v59);
    double v61 = (void *)MEMORY[0x22A64D220](v4);

    objc_msgSend_setObject_forKey_(v60, v62, (uint64_t)v61, (uint64_t)v53, v63, v64, v65);
    double v72 = objc_msgSend_lock(self, v66, v67, v68, v69, v70, v71);
    objc_msgSend_unlock(v72, v73, v74, v75, v76, v77, v78);
  }
  return v53;
}

- (id)newPromotedContentsDeliveryBlock
{
  return self->_newPromotedContentsDeliveryBlock;
}

- (void)setNewPromotedContentsDeliveryBlock:(id)a3
{
}

- (BOOL)invalid
{
  return self->_invalid;
}

- (NSError)lastError
{
  return self->_lastError;
}

- (void)setRequestCompletionBlockByRequestID:(id)a3
{
}

- (void)setLock:(id)a3
{
}

- (void)setRequesterID:(id)a3
{
}

- (void)setRequestCoordinator:(id)a3
{
}

@end