@interface APControllerRequesterCoordinator
+ (BOOL)canShareConnection;
+ (id)machService;
+ (id)requestCoordinator;
- (APControllerRequesterCoordinator)init;
- (APUnfairRecursiveLock)lock;
- (NSMutableDictionary)requestDelegates;
- (id)exportedInterface;
- (id)proxyURLForRequester:(id)a3;
- (id)remoteObjectInterface;
- (void)_addDelegate:(id)a3 withID:(id)a4;
- (void)connectionInterrupted;
- (void)connectionInvalidated;
- (void)contentResponses:(id)a3 requester:(id)a4;
- (void)extendCollectionClassesForExportedInterface:(id)a3;
- (void)extendCollectionClassesForRemoteInterface:(id)a3;
- (void)finishedWithRequestsForID:(id)a3;
- (void)preWarm:(id)a3 forRequester:(id)a4;
- (void)proxyURLForRequester:(id)a3 withCompletionHandler:(id)a4;
- (void)requestPromotedContentOfTypes:(id)a3 forRequester:(id)a4 forContext:(id)a5 completionHandler:(id)a6;
- (void)sendAndRankContent:(id)a3 forContext:(id)a4 placement:(unint64_t)a5 completionHandler:(id)a6;
- (void)setLock:(id)a3;
- (void)setRequestDelegates:(id)a3;
@end

@implementation APControllerRequesterCoordinator

- (APControllerRequesterCoordinator)init
{
  v14.receiver = self;
  v14.super_class = (Class)APControllerRequesterCoordinator;
  v6 = [(APXPCActionRequester *)&v14 init];
  if (v6)
  {
    uint64_t v9 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v2, v3, v4, v5, v7, v8);
    requestDelegates = v6->_requestDelegates;
    v6->_requestDelegates = (NSMutableDictionary *)v9;

    v11 = (APUnfairRecursiveLock *)objc_alloc_init(MEMORY[0x263F20B98]);
    lock = v6->_lock;
    v6->_lock = v11;
  }
  return v6;
}

- (void)extendCollectionClassesForRemoteInterface:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263EFFA08];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  objc_msgSend_setWithObjects_(v3, v7, v5, v8, v9, v10, v11, v6, 0);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v12, (uint64_t)v15, (uint64_t)sel_sendAndRankContent_forContext_placement_completionHandler_, 0, v13, v14, 1);
}

- (void)extendCollectionClassesForExportedInterface:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263EFFA08];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  objc_msgSend_setWithObjects_(v3, v7, v5, v8, v9, v10, v11, v6, 0);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v12, (uint64_t)v15, (uint64_t)sel_contentResponses_requester_, 0, v13, v14, 0);
}

+ (id)requestCoordinator
{
  if (qword_26AB0B2B0 != -1) {
    dispatch_once(&qword_26AB0B2B0, &unk_26D9FF220);
  }
  v2 = (void *)qword_26AB0B2B8;
  return v2;
}

- (void)preWarm:(id)a3 forRequester:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v14 = objc_msgSend_requesterID(v6, v8, v9, v10, v11, v12, v13);
  objc_msgSend__addDelegate_withID_(self, v15, (uint64_t)v6, (uint64_t)v14, v16, v17, v18);

  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v19, (uint64_t)&unk_26D9FF2E0, v20, v21, v22, v23);
  id v29 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_preWarm_(v29, v24, (uint64_t)v7, v25, v26, v27, v28);
}

- (void)_addDelegate:(id)a3 withID:(id)a4
{
  id v44 = a3;
  id v6 = a4;
  double v13 = objc_msgSend_lock(self, v7, v8, v9, v10, v11, v12);
  objc_msgSend_lock(v13, v14, v15, v16, v17, v18, v19);
  uint64_t v26 = objc_msgSend_requestDelegates(self, v20, v21, v22, v23, v24, v25);
  v32 = objc_msgSend_objectForKey_(v26, v27, (uint64_t)v6, v28, v29, v30, v31);

  if (!v32)
  {
    v39 = objc_msgSend_requestDelegates(self, v33, v34, v35, v36, v37, v38);
    objc_msgSend_setObject_forKey_(v39, v40, (uint64_t)v44, (uint64_t)v6, v41, v42, v43);
  }
  objc_msgSend_unlock(v13, v33, v34, v35, v36, v37, v38);
}

- (void)finishedWithRequestsForID:(id)a3
{
  id v4 = a3;
  double v11 = objc_msgSend_remoteObjectProxy(self, v5, v6, v7, v8, v9, v10);
  objc_msgSend_finishedWithRequestsForRequester_(v11, v12, (uint64_t)v4, v13, v14, v15, v16);

  objc_msgSend_lock(self, v17, v18, v19, v20, v21, v22);
  id v67 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v67, v23, v24, v25, v26, v27, v28);
  uint64_t v35 = objc_msgSend_requestDelegates(self, v29, v30, v31, v32, v33, v34);
  objc_msgSend_removeObjectForKey_(v35, v36, (uint64_t)v4, v37, v38, v39, v40);

  v47 = objc_msgSend_requestDelegates(self, v41, v42, v43, v44, v45, v46);
  uint64_t v54 = objc_msgSend_count(v47, v48, v49, v50, v51, v52, v53);

  objc_msgSend_unlock(v67, v55, v56, v57, v58, v59, v60);
  if (!v54) {
    objc_msgSend_finished(self, v61, v62, v63, v64, v65, v66);
  }
}

- (NSMutableDictionary)requestDelegates
{
  return self->_requestDelegates;
}

- (APUnfairRecursiveLock)lock
{
  return self->_lock;
}

- (id)exportedInterface
{
  return &unk_26DA089A8;
}

+ (id)machService
{
  return @"com.apple.ap.promotedcontent.pcinterface";
}

- (id)remoteObjectInterface
{
  return &unk_26DA0AC00;
}

+ (BOOL)canShareConnection
{
  return 0;
}

- (void)requestPromotedContentOfTypes:(id)a3 forRequester:(id)a4 forContext:(id)a5 completionHandler:(id)a6
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a3;
  uint64_t v20 = objc_msgSend_requesterID(v10, v14, v15, v16, v17, v18, v19);
  objc_msgSend__addDelegate_withID_(self, v21, (uint64_t)v10, (uint64_t)v20, v22, v23, v24);

  uint64_t v31 = objc_msgSend_activeClientInfo(MEMORY[0x263F20B50], v25, v26, v27, v28, v29, v30);
  if (!v31)
  {
    uint64_t v32 = APLogForCategory();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v58) = 0;
      _os_log_impl(&dword_226303000, v32, OS_LOG_TYPE_DEFAULT, "No client info was available for an ad request.", (uint8_t *)&v58, 2u);
    }
  }
  double v33 = APLogForCategory();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    double v40 = objc_msgSend_identifier(v11, v34, v35, v36, v37, v38, v39);
    int v58 = 138543362;
    double v59 = v40;
    _os_log_impl(&dword_226303000, v33, OS_LOG_TYPE_INFO, "Requesting ad from promotedcontentd for context %{public}@", (uint8_t *)&v58, 0xCu);
  }
  v47 = objc_msgSend_remoteObjectProxy(self, v41, v42, v43, v44, v45, v46);
  uint64_t v54 = objc_msgSend_requesterID(v10, v48, v49, v50, v51, v52, v53);
  objc_msgSend_requestPromotedContentOfTypes_forRequester_forContext_withClientInfo_deliverEntireBatch_completionHandler_(v47, v55, (uint64_t)v13, (uint64_t)v54, (uint64_t)v11, v56, v57, v31, 0, v12);
}

- (void)sendAndRankContent:(id)a3 forContext:(id)a4 placement:(unint64_t)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  double v19 = objc_msgSend_remoteObjectProxy(self, v13, v14, v15, v16, v17, v18);
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = sub_226309594;
  v24[3] = &unk_26479B9E0;
  id v25 = v10;
  id v20 = v10;
  objc_msgSend_sendAndRankContent_forContext_placement_completionHandler_(v19, v21, (uint64_t)v12, (uint64_t)v11, a5, v22, v23, v24);
}

- (void)contentResponses:(id)a3 requester:(id)a4
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v14 = objc_msgSend_lock(self, v8, v9, v10, v11, v12, v13);
  objc_msgSend_lock(v14, v15, v16, v17, v18, v19, v20);
  uint64_t v27 = objc_msgSend_requestDelegates(self, v21, v22, v23, v24, v25, v26);
  double v33 = objc_msgSend_objectForKey_(v27, v28, (uint64_t)v7, v29, v30, v31, v32);

  objc_msgSend_unlock(v14, v34, v35, v36, v37, v38, v39);
  if (v33)
  {
    objc_msgSend_contentResponses_(v33, v40, (uint64_t)v6, v41, v42, v43, v44);
  }
  else
  {
    double v45 = APLogForCategory();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      double v46 = (objc_class *)objc_opt_class();
      v47 = NSStringFromClass(v46);
      int v48 = 138412546;
      uint64_t v49 = v47;
      __int16 v50 = 2112;
      id v51 = v7;
      _os_log_impl(&dword_226303000, v45, OS_LOG_TYPE_DEFAULT, "[%@] The requester for %@ is no longer stored. Dropping response.", (uint8_t *)&v48, 0x16u);
    }
  }
}

- (id)proxyURLForRequester:(id)a3
{
  id v4 = a3;
  uint64_t v11 = objc_msgSend_requesterID(v4, v5, v6, v7, v8, v9, v10);
  objc_msgSend__addDelegate_withID_(self, v12, (uint64_t)v4, (uint64_t)v11, v13, v14, v15);

  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  double v31 = sub_226309854;
  double v32 = sub_226309864;
  id v33 = 0;
  double v20 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v16, (uint64_t)&unk_26D9FF2C0, v17, v18, COERCE_DOUBLE(0x3032000000), v19);
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = sub_2263098CC;
  v27[3] = &unk_26479BA28;
  v27[4] = &v28;
  objc_msgSend_proxyURLWithCompletionHandler_(v20, v21, (uint64_t)v27, v22, v23, COERCE_DOUBLE(3221225472), v24);
  id v25 = (id)v29[5];

  _Block_object_dispose(&v28, 8);
  return v25;
}

- (void)proxyURLForRequester:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v14 = objc_msgSend_requesterID(v7, v8, v9, v10, v11, v12, v13);
  objc_msgSend__addDelegate_withID_(self, v15, (uint64_t)v7, (uint64_t)v14, v16, v17, v18);

  objc_msgSend_remoteObjectProxy(self, v19, v20, v21, v22, v23, v24);
  id v30 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_proxyURLWithCompletionHandler_(v30, v25, (uint64_t)v6, v26, v27, v28, v29);
}

- (void)connectionInterrupted
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  uint64_t v8 = objc_msgSend_lock(self, a2, v2, v3, v4, v5, v6);
  objc_msgSend_lock(v8, v9, v10, v11, v12, v13, v14);
  uint64_t v21 = objc_msgSend_requestDelegates(self, v15, v16, v17, v18, v19, v20);
  double v28 = objc_msgSend_copy(v21, v22, v23, v24, v25, v26, v27);

  uint64_t v35 = objc_msgSend_requestDelegates(self, v29, v30, v31, v32, v33, v34);
  objc_msgSend_removeAllObjects(v35, v36, v37, v38, v39, v40, v41);

  objc_msgSend_unlock(v8, v42, v43, v44, v45, v46, v47);
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v48 = v28;
  uint64_t v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v49, (uint64_t)&v68, (uint64_t)v72, 16, v50, v51);
  if (v52)
  {
    uint64_t v58 = v52;
    uint64_t v59 = *(void *)v69;
    do
    {
      uint64_t v60 = 0;
      do
      {
        if (*(void *)v69 != v59) {
          objc_enumerationMutation(v48);
        }
        v61 = objc_msgSend_objectForKey_(v48, v53, *(void *)(*((void *)&v68 + 1) + 8 * v60), v54, v55, v56, v57, (void)v68);
        objc_msgSend_connectionSevered(v61, v62, v63, v64, v65, v66, v67);

        ++v60;
      }
      while (v58 != v60);
      uint64_t v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v53, (uint64_t)&v68, (uint64_t)v72, 16, v56, v57);
    }
    while (v58);
  }
}

- (void)connectionInvalidated
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  uint64_t v8 = objc_msgSend_lock(self, a2, v2, v3, v4, v5, v6);
  objc_msgSend_lock(v8, v9, v10, v11, v12, v13, v14);
  uint64_t v21 = objc_msgSend_requestDelegates(self, v15, v16, v17, v18, v19, v20);
  double v28 = objc_msgSend_requestDelegates(self, v22, v23, v24, v25, v26, v27);
  objc_msgSend_removeAllObjects(v28, v29, v30, v31, v32, v33, v34);

  objc_msgSend_unlock(v8, v35, v36, v37, v38, v39, v40);
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v41 = v21;
  uint64_t v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v42, (uint64_t)&v61, (uint64_t)v65, 16, v43, v44);
  if (v45)
  {
    uint64_t v51 = v45;
    uint64_t v52 = *(void *)v62;
    do
    {
      uint64_t v53 = 0;
      do
      {
        if (*(void *)v62 != v52) {
          objc_enumerationMutation(v41);
        }
        uint64_t v54 = objc_msgSend_objectForKey_(v41, v46, *(void *)(*((void *)&v61 + 1) + 8 * v53), v47, v48, v49, v50, (void)v61);
        objc_msgSend_connectionSevered(v54, v55, v56, v57, v58, v59, v60);

        ++v53;
      }
      while (v51 != v53);
      uint64_t v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v46, (uint64_t)&v61, (uint64_t)v65, 16, v49, v50);
    }
    while (v51);
  }
}

- (void)setRequestDelegates:(id)a3
{
}

- (void)setLock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_requestDelegates, 0);
}

@end