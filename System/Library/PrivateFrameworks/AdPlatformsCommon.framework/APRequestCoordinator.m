@interface APRequestCoordinator
+ (BOOL)canShareConnection;
+ (id)machService;
+ (id)sharedCoordinator;
- (APRequestCoordinator)init;
- (APUnfairLock)lock;
- (BOOL)attemptRetryMessageForBox:(id)a3;
- (NSMutableDictionary)managerToRetryBoxMap;
- (id)exportedInterface;
- (id)proxyURLForRequester:(id)a3;
- (id)remoteObjectInterface;
- (void)_addBox:(id)a3;
- (void)_removeBox:(id)a3;
- (void)beginSessionForID:(id)a3;
- (void)connectionInterrupted;
- (void)connectionInvalidated;
- (void)connectionSeveredForBox:(id)a3;
- (void)contentResponses:(id)a3 requester:(id)a4;
- (void)extendCollectionClassesForExportedInterface:(id)a3;
- (void)extendCollectionClassesForRemoteInterface:(id)a3;
- (void)finishedWithRequestsForID:(id)a3;
- (void)preWarm:(id)a3 forRequester:(id)a4;
- (void)proxyURLForRequester:(id)a3 withCompletionHandler:(id)a4;
- (void)requestPromotedContentWithBox:(id)a3;
- (void)requestPromotedContentWithContents:(id)a3 forRequester:(id)a4 completionHandler:(id)a5;
- (void)requestProxyWithBox:(id)a3;
- (void)requestRankingWithBox:(id)a3;
- (void)sendAndRankContent:(id)a3 forRequester:(id)a4 forContext:(id)a5 placement:(unint64_t)a6 completionHandler:(id)a7;
- (void)setLock:(id)a3;
- (void)setManagerToRetryBoxMap:(id)a3;
@end

@implementation APRequestCoordinator

- (APRequestCoordinator)init
{
  v14.receiver = self;
  v14.super_class = (Class)APRequestCoordinator;
  v6 = [(APXPCActionRequester *)&v14 init];
  if (v6)
  {
    uint64_t v9 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v2, v3, v4, v5, v7, v8);
    managerToRetryBoxMap = v6->_managerToRetryBoxMap;
    v6->_managerToRetryBoxMap = (NSMutableDictionary *)v9;

    v11 = (APUnfairLock *)objc_alloc_init(MEMORY[0x263F20B90]);
    lock = v6->_lock;
    v6->_lock = v11;
  }
  return v6;
}

- (void)beginSessionForID:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x263EFF980];
  id v5 = a3;
  objc_msgSend_array(v4, v6, v7, v8, v9, v10, v11);
  id v49 = (id)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend_lock(self, v12, v13, v14, v15, v16, v17);
  objc_msgSend_lock(v18, v19, v20, v21, v22, v23, v24);

  v31 = objc_msgSend_managerToRetryBoxMap(self, v25, v26, v27, v28, v29, v30);
  objc_msgSend_setObject_forKey_(v31, v32, (uint64_t)v49, (uint64_t)v5, v33, v34, v35);

  v42 = objc_msgSend_lock(self, v36, v37, v38, v39, v40, v41);
  objc_msgSend_unlock(v42, v43, v44, v45, v46, v47, v48);
}

- (APUnfairLock)lock
{
  return self->_lock;
}

- (NSMutableDictionary)managerToRetryBoxMap
{
  return self->_managerToRetryBoxMap;
}

+ (id)sharedCoordinator
{
  if (qword_26AB0B1A0 != -1) {
    dispatch_once(&qword_26AB0B1A0, &unk_26D9FF260);
  }
  v2 = (void *)qword_26AB0B1A8;
  return v2;
}

- (void)requestPromotedContentWithContents:(id)a3 forRequester:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  double v11 = [APCoordinatedAdRequestBox alloc];
  uint64_t v15 = objc_msgSend_initWithDelegate_contents_handler_(v11, v12, (uint64_t)v9, (uint64_t)v10, (uint64_t)v8, v13, v14);

  objc_msgSend__addBox_(self, v16, (uint64_t)v15, v17, v18, v19, v20);
  uint64_t v27 = objc_msgSend_clientInfo(v10, v21, v22, v23, v24, v25, v26);

  if (!v27)
  {
    uint64_t v33 = APLogForCategory();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v34 = 0;
      _os_log_impl(&dword_226303000, v33, OS_LOG_TYPE_DEFAULT, "No client info was available for an ad request.", v34, 2u);
    }
  }
  objc_msgSend_requestPromotedContentWithBox_(self, v28, (uint64_t)v15, v29, v30, v31, v32);
}

- (void)sendAndRankContent:(id)a3 forRequester:(id)a4 forContext:(id)a5 placement:(unint64_t)a6 completionHandler:(id)a7
{
  id v11 = a7;
  id v12 = a4;
  id v13 = a3;
  double v14 = [APCoordinatedRankRequestBox alloc];
  id v28 = (id)objc_msgSend_initWithDelegate_contents_placement_handler_(v14, v15, (uint64_t)v12, (uint64_t)v13, a6, v16, v17, v11);

  objc_msgSend__addBox_(self, v18, (uint64_t)v28, v19, v20, v21, v22);
  objc_msgSend_requestRankingWithBox_(self, v23, (uint64_t)v28, v24, v25, v26, v27);
}

- (void)finishedWithRequestsForID:(id)a3
{
  id v4 = a3;
  id v11 = objc_msgSend_remoteObjectProxy(self, v5, v6, v7, v8, v9, v10);
  objc_msgSend_finishedWithRequestsForRequester_(v11, v12, (uint64_t)v4, v13, v14, v15, v16);

  objc_msgSend_lock(self, v17, v18, v19, v20, v21, v22);
  id v67 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v67, v23, v24, v25, v26, v27, v28);
  double v35 = objc_msgSend_managerToRetryBoxMap(self, v29, v30, v31, v32, v33, v34);
  objc_msgSend_removeObjectForKey_(v35, v36, (uint64_t)v4, v37, v38, v39, v40);

  double v47 = objc_msgSend_managerToRetryBoxMap(self, v41, v42, v43, v44, v45, v46);
  uint64_t v54 = objc_msgSend_count(v47, v48, v49, v50, v51, v52, v53);

  objc_msgSend_unlock(v67, v55, v56, v57, v58, v59, v60);
  if (!v54) {
    objc_msgSend_finished(self, v61, v62, v63, v64, v65, v66);
  }
}

- (id)proxyURLForRequester:(id)a3
{
  id v4 = a3;
  id v5 = [APCoordinatedRetryBox alloc];
  double v10 = objc_msgSend_initWithType_delegate_(v5, v6, -1, (uint64_t)v4, v7, v8, v9);
  objc_msgSend_setCanRetry_(v10, v11, 0, v12, v13, v14, v15);
  objc_msgSend__addBox_(self, v16, (uint64_t)v10, v17, v18, v19, v20);
  uint64_t v38 = 0;
  double v39 = &v38;
  uint64_t v40 = 0x3032000000;
  double v41 = sub_22630E4B0;
  uint64_t v42 = sub_22630E4C0;
  id v43 = 0;
  uint64_t v25 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v21, (uint64_t)&unk_26D9FF300, v22, v23, COERCE_DOUBLE(0x3032000000), v24);
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = sub_22630E528;
  v37[3] = &unk_26479BA28;
  v37[4] = &v38;
  objc_msgSend_proxyURLWithCompletionHandler_(v25, v26, (uint64_t)v37, v27, v28, COERCE_DOUBLE(3221225472), v29);
  objc_msgSend__removeBox_(self, v30, (uint64_t)v10, v31, v32, v33, v34);
  id v35 = (id)v39[5];

  _Block_object_dispose(&v38, 8);
  return v35;
}

- (void)proxyURLForRequester:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [APCoordinatedProxyUrlRequestBox alloc];
  id v23 = (id)objc_msgSend_initWithDelegate_handler_(v8, v9, (uint64_t)v7, (uint64_t)v6, v10, v11, v12);

  objc_msgSend__addBox_(self, v13, (uint64_t)v23, v14, v15, v16, v17);
  objc_msgSend_requestProxyWithBox_(self, v18, (uint64_t)v23, v19, v20, v21, v22);
}

- (void)preWarm:(id)a3 forRequester:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [APCoordinatedRetryBox alloc];
  id v39 = (id)objc_msgSend_initWithType_delegate_(v8, v9, -1, (uint64_t)v6, v10, v11, v12);

  objc_msgSend_setCanRetry_(v39, v13, 0, v14, v15, v16, v17);
  objc_msgSend__addBox_(self, v18, (uint64_t)v39, v19, v20, v21, v22);
  uint64_t v28 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v23, (uint64_t)&unk_26D9FF320, v24, v25, v26, v27);
  objc_msgSend_preWarm_(v28, v29, (uint64_t)v7, v30, v31, v32, v33);

  objc_msgSend__removeBox_(self, v34, (uint64_t)v39, v35, v36, v37, v38);
}

- (void)requestPromotedContentWithBox:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v82[0] = 0;
  v82[1] = v82;
  v82[2] = 0x2020000000;
  v82[3] = 0;
  v77 = objc_msgSend_remoteObjectProxy(self, v5, v6, v7, v8, COERCE_DOUBLE(0x2020000000), v9);
  double v16 = objc_msgSend_requestContents(v4, v10, v11, v12, v13, v14, v15);
  v76 = objc_msgSend_contentTypes(v16, v17, v18, v19, v20, v21, v22);
  v75 = objc_msgSend_requesterID(v4, v23, v24, v25, v26, v27, v28);
  uint64_t v35 = objc_msgSend_requestContents(v4, v29, v30, v31, v32, v33, v34);
  uint64_t v42 = objc_msgSend_apContext(v35, v36, v37, v38, v39, v40, v41);
  uint64_t v49 = objc_msgSend_requestContents(v4, v43, v44, v45, v46, v47, v48);
  uint64_t v56 = objc_msgSend_clientInfo(v49, v50, v51, v52, v53, v54, v55);
  uint64_t v63 = objc_msgSend_requestContents(v4, v57, v58, v59, v60, v61, v62);
  uint64_t v70 = objc_msgSend_deliverEntireBatch(v63, v64, v65, v66, v67, v68, v69);
  v78[0] = MEMORY[0x263EF8330];
  v78[1] = 3221225472;
  v78[2] = sub_22630E910;
  v78[3] = &unk_26479BB18;
  v80 = v82;
  objc_copyWeak(&v81, &location);
  id v71 = v4;
  id v79 = v71;
  objc_msgSend_requestPromotedContentOfTypes_forRequester_forContext_withClientInfo_deliverEntireBatch_completionHandler_(v77, v72, (uint64_t)v76, (uint64_t)v75, (uint64_t)v42, v73, v74, v56, v70, v78);

  objc_destroyWeak(&v81);
  _Block_object_dispose(v82, 8);
  objc_destroyWeak(&location);
}

- (void)requestRankingWithBox:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v11 = objc_msgSend_remoteObjectProxy(self, v5, v6, v7, v8, v9, v10);
  uint64_t v18 = objc_msgSend_contentDatas(v4, v12, v13, v14, v15, v16, v17);
  uint64_t v25 = objc_msgSend_context(v4, v19, v20, v21, v22, v23, v24);
  uint64_t v32 = objc_msgSend_placement(v4, v26, v27, v28, v29, v30, v31);
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = sub_22630EB2C;
  v37[3] = &unk_26479BB40;
  objc_copyWeak(&v39, &location);
  id v33 = v4;
  id v38 = v33;
  objc_msgSend_sendAndRankContent_forContext_placement_completionHandler_(v11, v34, (uint64_t)v18, (uint64_t)v25, v32, v35, v36, v37);

  objc_destroyWeak(&v39);
  objc_destroyWeak(&location);
}

- (void)requestProxyWithBox:(id)a3
{
  id v4 = a3;
  uint64_t v11 = objc_msgSend_remoteObjectProxy(self, v5, v6, v7, v8, v9, v10);
  objc_initWeak(&location, self);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_22630ECC8;
  v18[3] = &unk_26479BB68;
  objc_copyWeak(&v20, &location);
  id v12 = v4;
  id v19 = v12;
  objc_msgSend_proxyURLWithCompletionHandler_(v11, v13, (uint64_t)v18, v14, v15, v16, v17);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

- (void)contentResponses:(id)a3 requester:(id)a4
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v14 = objc_msgSend_lock(self, v8, v9, v10, v11, v12, v13);
  objc_msgSend_lock(v14, v15, v16, v17, v18, v19, v20);
  uint64_t v27 = objc_msgSend_managerToRetryBoxMap(self, v21, v22, v23, v24, v25, v26);
  id v33 = objc_msgSend_objectForKey_(v27, v28, (uint64_t)v7, v29, v30, v31, v32);

  double v40 = objc_msgSend_firstObject(v33, v34, v35, v36, v37, v38, v39);
  double v47 = objc_msgSend_requestDelegate(v40, v41, v42, v43, v44, v45, v46);

  objc_msgSend_unlock(v14, v48, v49, v50, v51, v52, v53);
  if (v47)
  {
    objc_msgSend_contentResponses_(v47, v54, (uint64_t)v6, v55, v56, v57, v58);
  }
  else
  {
    uint64_t v59 = APLogForCategory();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v60 = (objc_class *)objc_opt_class();
      double v61 = NSStringFromClass(v60);
      int v62 = 138478083;
      uint64_t v63 = v61;
      __int16 v64 = 2114;
      id v65 = v7;
      _os_log_impl(&dword_226303000, v59, OS_LOG_TYPE_DEFAULT, "[%{private}@] The requester for %{public}@ is no longer stored. Dropping response.", (uint8_t *)&v62, 0x16u);
    }
  }
}

- (void)_addBox:(id)a3
{
  id v73 = a3;
  uint64_t v10 = objc_msgSend_lock(self, v4, v5, v6, v7, v8, v9);
  objc_msgSend_lock(v10, v11, v12, v13, v14, v15, v16);

  uint64_t v23 = objc_msgSend_managerToRetryBoxMap(self, v17, v18, v19, v20, v21, v22);
  uint64_t v30 = objc_msgSend_requesterID(v73, v24, v25, v26, v27, v28, v29);
  uint64_t v36 = objc_msgSend_objectForKey_(v23, v31, (uint64_t)v30, v32, v33, v34, v35);

  if (v36)
  {
    if ((objc_msgSend_containsObject_(v36, v37, (uint64_t)v73, v38, v39, v40, v41) & 1) == 0) {
      objc_msgSend_addObject_(v36, v42, (uint64_t)v73, v44, v45, v46, v47);
    }
  }
  else
  {
    uint64_t v36 = objc_msgSend_arrayWithObject_(MEMORY[0x263EFF980], v37, (uint64_t)v73, v38, v39, v40, v41);
  }
  double v48 = objc_msgSend_managerToRetryBoxMap(self, v42, v43, v44, v45, v46, v47);
  uint64_t v55 = objc_msgSend_requesterID(v73, v49, v50, v51, v52, v53, v54);
  objc_msgSend_setObject_forKey_(v48, v56, (uint64_t)v36, (uint64_t)v55, v57, v58, v59);

  uint64_t v66 = objc_msgSend_lock(self, v60, v61, v62, v63, v64, v65);
  objc_msgSend_unlock(v66, v67, v68, v69, v70, v71, v72);
}

- (void)_removeBox:(id)a3
{
  id v74 = a3;
  uint64_t v10 = objc_msgSend_lock(self, v4, v5, v6, v7, v8, v9);
  objc_msgSend_lock(v10, v11, v12, v13, v14, v15, v16);

  uint64_t v23 = objc_msgSend_managerToRetryBoxMap(self, v17, v18, v19, v20, v21, v22);
  uint64_t v30 = objc_msgSend_requesterID(v74, v24, v25, v26, v27, v28, v29);
  uint64_t v36 = objc_msgSend_objectForKey_(v23, v31, (uint64_t)v30, v32, v33, v34, v35);

  if (v36)
  {
    objc_msgSend_removeObject_(v36, v37, (uint64_t)v74, v39, v40, v41, v42);
    uint64_t v49 = objc_msgSend_managerToRetryBoxMap(self, v43, v44, v45, v46, v47, v48);
    uint64_t v56 = objc_msgSend_requesterID(v74, v50, v51, v52, v53, v54, v55);
    objc_msgSend_setObject_forKey_(v49, v57, (uint64_t)v36, (uint64_t)v56, v58, v59, v60);
  }
  else
  {
    uint64_t v49 = objc_msgSend_diagnosticReportPayload(v74, v37, v38, v39, v40, v41, v42);
    CreateDiagnosticReport();
  }

  uint64_t v67 = objc_msgSend_lock(self, v61, v62, v63, v64, v65, v66);
  objc_msgSend_unlock(v67, v68, v69, v70, v71, v72, v73);
}

- (id)remoteObjectInterface
{
  return &unk_26DA0AC00;
}

- (void)connectionInterrupted
{
  uint64_t v154 = *MEMORY[0x263EF8340];
  uint64_t v3 = APLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226303000, v3, OS_LOG_TYPE_ERROR, "XPC Connection interrupted", buf, 2u);
  }

  uint64_t v10 = objc_msgSend_lock(self, v4, v5, v6, v7, v8, v9);
  objc_msgSend_lock(v10, v11, v12, v13, v14, v15, v16);
  uint64_t v23 = objc_msgSend_managerToRetryBoxMap(self, v17, v18, v19, v20, v21, v22);
  uint64_t v30 = objc_msgSend_copy(v23, v24, v25, v26, v27, v28, v29);

  uint64_t v37 = objc_msgSend_managerToRetryBoxMap(self, v31, v32, v33, v34, v35, v36);
  objc_msgSend_removeAllObjects(v37, v38, v39, v40, v41, v42, v43);

  v130 = v10;
  objc_msgSend_unlock(v10, v44, v45, v46, v47, v48, v49);
  long long v142 = 0u;
  long long v143 = 0u;
  long long v140 = 0u;
  long long v141 = 0u;
  id obj = v30;
  uint64_t v132 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v50, (uint64_t)&v140, (uint64_t)v153, 16, v51, v52);
  if (v132)
  {
    uint64_t v131 = *(void *)v141;
    uint64_t v57 = 138478595;
    do
    {
      uint64_t v58 = 0;
      do
      {
        if (*(void *)v141 != v131) {
          objc_enumerationMutation(obj);
        }
        uint64_t v134 = v58;
        double v59 = objc_msgSend_objectForKey_(obj, v53, *(void *)(*((void *)&v140 + 1) + 8 * v58), v54, v55, *(double *)&v57, v56);
        long long v136 = 0u;
        long long v137 = 0u;
        long long v138 = 0u;
        long long v139 = 0u;
        uint64_t v62 = objc_msgSend_countByEnumeratingWithState_objects_count_(v59, v60, (uint64_t)&v136, (uint64_t)v152, 16, 0.0, v61);
        if (v62)
        {
          uint64_t v69 = v62;
          uint64_t v70 = *(void *)v137;
          do
          {
            uint64_t v71 = 0;
            uint64_t v135 = v69;
            do
            {
              if (*(void *)v137 != v70) {
                objc_enumerationMutation(v59);
              }
              double v72 = *(void **)(*((void *)&v136 + 1) + 8 * v71);
              if (objc_msgSend_requestType(v72, v63, v64, v65, v66, v67, v68) == -1) {
                goto LABEL_21;
              }
              int v78 = objc_msgSend_attemptRetryMessageForBox_(self, v73, (uint64_t)v72, v74, v75, v76, v77);
              id v79 = APLogForCategory();
              v80 = v79;
              if (!v78)
              {
                if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
                {
                  v104 = (objc_class *)objc_opt_class();
                  v105 = NSStringFromClass(v104);
                  v112 = objc_msgSend_requestID(v72, v106, v107, v108, v109, v110, v111);
                  uint64_t v119 = objc_msgSend_requestType(v72, v113, v114, v115, v116, v117, v118);
                  objc_msgSend_requesterID(v72, v120, v121, v122, v123, v124, v125);
                  uint64_t v126 = v70;
                  v127 = self;
                  v129 = v128 = v59;
                  *(_DWORD *)buf = 138478595;
                  v145 = v105;
                  __int16 v146 = 2114;
                  v147 = v112;
                  __int16 v148 = 2050;
                  uint64_t v149 = v119;
                  __int16 v150 = 2114;
                  v151 = v129;
                  _os_log_impl(&dword_226303000, v80, OS_LOG_TYPE_ERROR, "[%{private}@] Unable to retry request %{public}@ of type %{public}ld for requester %{public}@", buf, 0x2Au);

                  double v59 = v128;
                  self = v127;
                  uint64_t v70 = v126;
                  uint64_t v69 = v135;
                }
LABEL_21:
                objc_msgSend_connectionSeveredForBox_(self, v73, (uint64_t)v72, v74, v75, v76, v77);
                goto LABEL_22;
              }
              if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
              {
                id v81 = (objc_class *)objc_opt_class();
                v82 = NSStringFromClass(v81);
                v89 = objc_msgSend_requestID(v72, v83, v84, v85, v86, v87, v88);
                uint64_t v96 = objc_msgSend_requestType(v72, v90, v91, v92, v93, v94, v95);
                v103 = objc_msgSend_requesterID(v72, v97, v98, v99, v100, v101, v102);
                *(_DWORD *)buf = 138478595;
                v145 = v82;
                __int16 v146 = 2114;
                v147 = v89;
                __int16 v148 = 2050;
                uint64_t v149 = v96;
                __int16 v150 = 2114;
                v151 = v103;
                _os_log_impl(&dword_226303000, v80, OS_LOG_TYPE_DEFAULT, "[%{private}@] Request %{public}@ of type %{public}ld is attempting to retry for requester %{public}@", buf, 0x2Au);
              }
LABEL_22:
              ++v71;
            }
            while (v69 != v71);
            uint64_t v69 = objc_msgSend_countByEnumeratingWithState_objects_count_(v59, v63, (uint64_t)&v136, (uint64_t)v152, 16, v67, v68);
          }
          while (v69);
        }

        uint64_t v58 = v134 + 1;
      }
      while (v134 + 1 != v132);
      uint64_t v132 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v53, (uint64_t)&v140, (uint64_t)v153, 16, *(double *)&v57, v56);
    }
    while (v132);
  }
}

- (void)connectionInvalidated
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  double v8 = objc_msgSend_lock(self, a2, v2, v3, v4, v5, v6);
  objc_msgSend_lock(v8, v9, v10, v11, v12, v13, v14);
  double v21 = objc_msgSend_managerToRetryBoxMap(self, v15, v16, v17, v18, v19, v20);
  double v28 = objc_msgSend_copy(v21, v22, v23, v24, v25, v26, v27);

  double v35 = objc_msgSend_managerToRetryBoxMap(self, v29, v30, v31, v32, v33, v34);
  objc_msgSend_removeAllObjects(v35, v36, v37, v38, v39, v40, v41);

  objc_msgSend_unlock(v8, v42, v43, v44, v45, v46, v47);
  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id v48 = v28;
  uint64_t v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v49, (uint64_t)&v77, (uint64_t)v82, 16, v50, v51);
  if (v52)
  {
    uint64_t v58 = v52;
    uint64_t v59 = *(void *)v78;
    do
    {
      uint64_t v60 = 0;
      do
      {
        if (*(void *)v78 != v59) {
          objc_enumerationMutation(v48);
        }
        double v61 = objc_msgSend_objectForKey_(v48, v53, *(void *)(*((void *)&v77 + 1) + 8 * v60), v54, v55, v56, v57);
        long long v73 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        long long v76 = 0u;
        uint64_t v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(v61, v62, (uint64_t)&v73, (uint64_t)v81, 16, 0.0, v63);
        if (v64)
        {
          uint64_t v70 = v64;
          uint64_t v71 = *(void *)v74;
          do
          {
            uint64_t v72 = 0;
            do
            {
              if (*(void *)v74 != v71) {
                objc_enumerationMutation(v61);
              }
              objc_msgSend_connectionSeveredForBox_(self, v65, *(void *)(*((void *)&v73 + 1) + 8 * v72++), v66, v67, v68, v69);
            }
            while (v70 != v72);
            uint64_t v70 = objc_msgSend_countByEnumeratingWithState_objects_count_(v61, v65, (uint64_t)&v73, (uint64_t)v81, 16, v68, v69);
          }
          while (v70);
        }

        ++v60;
      }
      while (v60 != v58);
      uint64_t v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v53, (uint64_t)&v77, (uint64_t)v82, 16, v56, v57);
    }
    while (v58);
  }
}

+ (BOOL)canShareConnection
{
  return 0;
}

+ (id)machService
{
  return @"com.apple.ap.promotedcontent.pcinterface";
}

- (id)exportedInterface
{
  return &unk_26DA089A8;
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

- (BOOL)attemptRetryMessageForBox:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_canRetry(v4, v5, v6, v7, v8, v9, v10))
  {
    uint64_t v17 = objc_msgSend_requestDelegate(v4, v11, v12, v13, v14, v15, v16);

    if (v17)
    {
      objc_msgSend_setCanRetry_(v4, v18, 0, v19, v20, v21, v22);
      objc_msgSend__addBox_(self, v23, (uint64_t)v4, v24, v25, v26, v27);
      uint64_t v34 = objc_msgSend_requestType(v4, v28, v29, v30, v31, v32, v33);
      if (v34 == 2)
      {
        objc_msgSend_requestProxyWithBox_(self, v35, (uint64_t)v4, v36, v37, v38, v39);
        goto LABEL_10;
      }
      if (v34 == 1)
      {
        objc_msgSend_requestRankingWithBox_(self, v35, (uint64_t)v4, v36, v37, v38, v39);
        goto LABEL_10;
      }
      LOBYTE(v17) = 0;
      if (!v34)
      {
        objc_msgSend_requestPromotedContentWithBox_(self, v35, (uint64_t)v4, v36, v37, v38, v39);
LABEL_10:
        LOBYTE(v17) = 1;
      }
    }
  }
  else
  {
    LOBYTE(v17) = 0;
  }

  return (char)v17;
}

- (void)connectionSeveredForBox:(id)a3
{
  v41[3] = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = *MEMORY[0x263F08338];
  v40[0] = *MEMORY[0x263F08320];
  v40[1] = v4;
  v41[0] = @"APRequestCoordinator was invalidated.";
  v41[1] = @"The user asked to invalidate the requester, or connection was interrupted.";
  v40[2] = *MEMORY[0x263F08348];
  v41[2] = @"Retry failed request again.";
  uint64_t v8 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v5, (uint64_t)v41, (uint64_t)v40, 3, v6, v7);
  uint64_t v12 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v9, @"APPCControllerRequesterErrorDomain", 5003, (uint64_t)v8, v10, v11);
  uint64_t v19 = objc_msgSend_requestDelegate(v3, v13, v14, v15, v16, v17, v18);

  if (v19)
  {
    double v26 = objc_msgSend_requestDelegate(v3, v20, v21, v22, v23, v24, v25);
    objc_msgSend_connectionSeveredWithError_(v26, v27, (uint64_t)v12, v28, v29, v30, v31);
  }
  uint64_t v32 = objc_msgSend_requestType(v3, v20, v21, v22, v23, v24, v25);
  if (v32 == 2)
  {
    if (v3)
    {
LABEL_9:
      objc_msgSend_completionHandler(v3, v33, v34, v35, v36, v37, v38);
      double v39 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v39[2]();
LABEL_12:
    }
  }
  else if (v32 == 1)
  {
    if (v3)
    {
      objc_msgSend_completionHandler(v3, v33, v34, v35, v36, v37, v38);
      double v39 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      ((void (*)(void (**)(void), void, void *))v39[2])(v39, 0, v12);
      goto LABEL_12;
    }
  }
  else if (!v32 && v3)
  {
    goto LABEL_9;
  }
}

- (void)setManagerToRetryBoxMap:(id)a3
{
}

- (void)setLock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_managerToRetryBoxMap, 0);
}

@end