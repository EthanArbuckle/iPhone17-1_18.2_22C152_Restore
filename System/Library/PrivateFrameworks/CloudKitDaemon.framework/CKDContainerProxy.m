@interface CKDContainerProxy
+ (Class)class;
- (BOOL)beginContentAccess;
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)isContentDiscarded;
- (BOOL)isKindOfClass:(Class)a3;
- (BOOL)isMemberOfClass:(Class)a3;
- (CKContainerOptions)options;
- (CKDAppContainerTuple)appContainerTuple;
- (CKDContainer)container;
- (CKDContainerProxy)initWithAppContainerTuple:(id)a3 entitlements:(id)a4 options:(id)a5 distantContainer:(id)a6 connection:(id)a7;
- (CKDXPCConnection)connection;
- (CKEntitlements)entitlements;
- (CKXPCContainerScopedClient)distantContainer;
- (Class)class;
- (id)CKStatusReportArray;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)beginContentAccess:(id)a3;
- (void)dealloc;
- (void)discardContentIfPossible;
- (void)endContentAccess;
- (void)forwardInvocation:(id)a3;
- (void)handleMemoryPressure:(int64_t)a3;
- (void)handleMemoryPressure:(int64_t)a3 completionHandler:(id)a4;
- (void)handleMemoryPressureNotification:(id)a3;
- (void)isContentDiscarded:(id)a3;
@end

@implementation CKDContainerProxy

- (id)methodSignatureForSelector:(SEL)a3
{
  objc_method_description MethodDescription = protocol_getMethodDescription((Protocol *)&unk_1F20D7420, a3, 1, 1);
  name = (void *)MethodDescription.name;
  if (MethodDescription.name)
  {
    name = objc_msgSend_signatureWithObjCTypes_(MEMORY[0x1E4F1CA38], MethodDescription.types, (uint64_t)MethodDescription.types);
  }
  return name;
}

- (void)forwardInvocation:(id)a3
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_msgSend_retainArguments(v4, v5, v6);
  v7 = CKCurrentPersonaID();
  v10 = objc_msgSend_appContainerTuple(self, v8, v9);
  v13 = objc_msgSend_personaID(v10, v11, v12);
  char v14 = CKObjectsAreBothNilOrEqual();

  v17 = (void *)MEMORY[0x1E4F1A550];
  v18 = (os_log_t *)MEMORY[0x1E4F1A500];
  if ((v14 & 1) == 0)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    os_log_t v19 = *v18;
    if (os_log_type_enabled(*v18, OS_LOG_TYPE_ERROR))
    {
      v66 = v19;
      v69 = (const char *)objc_msgSend_selector(v4, v67, v68);
      v70 = NSStringFromSelector(v69);
      v73 = objc_msgSend_appContainerTuple(self, v71, v72);
      v76 = objc_msgSend_ckShortDescription(v73, v74, v75);
      *(_DWORD *)buf = 138412802;
      v81 = v70;
      __int16 v82 = 2112;
      v83 = v76;
      __int16 v84 = 2112;
      v85 = v7;
      _os_log_error_impl(&dword_1C4CFF000, v66, OS_LOG_TYPE_ERROR, "Incorrect persona for invocation -%@ for container %@: %@", buf, 0x20u);
    }
    if (*MEMORY[0x1E4F1A4E0])
    {
      v22 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v20, *MEMORY[0x1E4F19C40], 5, @"Incorrect persona for container");
      objc_msgSend_CKInvokeAndNilOutReplyBlockWithError_forProtocol_(v4, v23, (uint64_t)v22, &unk_1F20D7420);
      goto LABEL_14;
    }
    v24 = NSString;
    v25 = (const char *)objc_msgSend_selector(v4, v20, v21);
    v26 = NSStringFromSelector(v25);
    v29 = objc_msgSend_appContainerTuple(self, v27, v28);
    v32 = objc_msgSend_ckShortDescription(v29, v30, v31);
    v34 = objc_msgSend_stringWithFormat_(v24, v33, @"Incorrect persona for invocation -%@ for container %@: %@", v26, v32, v7);

    v37 = objc_msgSend_connection(self, v35, v36);
    v40 = objc_msgSend_processScopedClientProxy(v37, v38, v39);
    objc_msgSend_handleSignificantIssueBehavior_reason_(v40, v41, 1, v34);
  }
  v22 = objc_msgSend_container(self, v15, v16);
  if (*v17 != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  os_log_t v42 = *v18;
  if (os_log_type_enabled(*v18, OS_LOG_TYPE_DEBUG))
  {
    v58 = v42;
    v61 = (const char *)objc_msgSend_selector(v4, v59, v60);
    v62 = NSStringFromSelector(v61);
    v65 = objc_msgSend_ckShortDescription(v22, v63, v64);
    *(_DWORD *)buf = 138412546;
    v81 = v62;
    __int16 v82 = 2112;
    v83 = v65;
    _os_log_debug_impl(&dword_1C4CFF000, v58, OS_LOG_TYPE_DEBUG, "Forwarding -%@ to container: %@", buf, 0x16u);
  }
  v45 = objc_msgSend_methodSignature(v4, v43, v44);
  v48 = objc_msgSend_CK_indexesOfBlockArguments(v45, v46, v47);

  v77[0] = MEMORY[0x1E4F143A8];
  v77[1] = 3221225472;
  v77[2] = sub_1C4D0AA14;
  v77[3] = &unk_1E64F43A8;
  id v49 = v4;
  id v78 = v49;
  v79 = self;
  objc_msgSend_enumerateIndexesUsingBlock_(v48, v50, (uint64_t)v77);
  objc_msgSend_setTarget_(v49, v51, (uint64_t)v22);
  objc_msgSend_beginContentAccess(self, v52, v53);
  objc_msgSend_invoke(v49, v54, v55);
  objc_msgSend_endContentAccess(self, v56, v57);

LABEL_14:
}

- (CKDContainer)container
{
  v2 = self;
  objc_sync_enter(v2);
  WeakRetained = objc_loadWeakRetained((id *)&v2->_container);
  if (!WeakRetained)
  {
    uint64_t v6 = objc_msgSend_connection(v2, v3, v4);
    if (v6)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v7 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
      {
        v31[0] = 0;
        _os_log_debug_impl(&dword_1C4CFF000, v7, OS_LOG_TYPE_DEBUG, "Creating proxied container", (uint8_t *)v31, 2u);
      }
      v10 = objc_msgSend_appContainerTuple(v2, v8, v9);
      v13 = objc_msgSend_processScopedClientProxy(v6, v11, v12);
      if (v2) {
        logicalDeviceScopedClientProxy = v2->_logicalDeviceScopedClientProxy;
      }
      else {
        logicalDeviceScopedClientProxy = 0;
      }
      v15 = logicalDeviceScopedClientProxy;
      v18 = objc_msgSend_entitlements(v2, v16, v17);
      uint64_t v21 = objc_msgSend_options(v2, v19, v20);
      v24 = objc_msgSend_sharedContainers(v6, v22, v23);
      WeakRetained = objc_msgSend_containerWithAppContainerTuple_processScopedClientProxy_logicalDeviceScopedClientProxy_containerEntitlements_containerOptions_sharedContainerTable_(CKDContainer, v25, (uint64_t)v10, v13, v15, v18, v21, v24);

      uint64_t v28 = objc_msgSend_distantContainer(v2, v26, v27);
      objc_msgSend_linkWithClientContainer_(WeakRetained, v29, (uint64_t)v28);

      objc_storeWeak((id *)&v2->_container, WeakRetained);
    }
    else
    {
      WeakRetained = 0;
    }
  }
  objc_sync_exit(v2);

  return (CKDContainer *)WeakRetained;
}

- (void)endContentAccess
{
  if (self) {
    coalescer = self->_coalescer;
  }
  else {
    coalescer = 0;
  }
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = sub_1C4D0C834;
  v3[3] = &unk_1E64F05C8;
  v3[4] = self;
  objc_msgSend_coalesce_(coalescer, a2, (uint64_t)v3);
}

- (BOOL)beginContentAccess
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  if (self) {
    coalescer = self->_coalescer;
  }
  else {
    coalescer = 0;
  }
  uint64_t v4 = coalescer;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1C4D0C568;
  v8[3] = &unk_1E64F43D0;
  v8[4] = self;
  v8[5] = &v9;
  objc_msgSend_coalesce_(v4, v5, (uint64_t)v8);

  char v6 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (CKContainerOptions)options
{
  return self->_options;
}

- (CKEntitlements)entitlements
{
  return self->_entitlements;
}

- (CKXPCContainerScopedClient)distantContainer
{
  return self->_distantContainer;
}

- (CKDXPCConnection)connection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  return (CKDXPCConnection *)WeakRetained;
}

- (CKDAppContainerTuple)appContainerTuple
{
  return self->_appContainerTuple;
}

- (CKDContainerProxy)initWithAppContainerTuple:(id)a3 entitlements:(id)a4 options:(id)a5 distantContainer:(id)a6 connection:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v60 = a6;
  id v15 = a7;
  v18 = (CKDAppContainerTuple *)objc_msgSend_copy(v12, v16, v17);
  appContainerTuple = self->_appContainerTuple;
  self->_appContainerTuple = v18;

  v22 = (CKEntitlements *)objc_msgSend_copy(v13, v20, v21);
  entitlements = self->_entitlements;
  self->_entitlements = v22;

  v26 = (CKContainerOptions *)objc_msgSend_copy(v14, v24, v25);
  options = self->_options;
  self->_options = v26;

  objc_storeStrong((id *)&self->_distantContainer, a6);
  objc_storeWeak((id *)&self->_connection, v15);
  v30 = objc_msgSend_testDeviceReferenceProtocol(v14, v28, v29);
  v32 = objc_msgSend_deviceContextForTestDeviceReference_(CKDLogicalDeviceContext, v31, (uint64_t)v30);
  objc_msgSend_logicalDeviceScopedClientProxyForDeviceContext_(v15, v33, (uint64_t)v32);
  v34 = (CKDLogicalDeviceScopedClientProxy *)objc_claimAutoreleasedReturnValue();
  logicalDeviceScopedClientProxy = self->_logicalDeviceScopedClientProxy;
  self->_logicalDeviceScopedClientProxy = v34;

  objc_initWeak(&location, self);
  v38 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v36, v37);
  objc_msgSend_containerProxyInactiveTimeoutWithDefaultValue_(v38, v39, v40, 60.0);
  double v42 = v41;

  id v43 = objc_alloc(MEMORY[0x1E4F19EA0]);
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = sub_1C4E66940;
  v61[3] = &unk_1E64F4358;
  objc_copyWeak(&v62, &location);
  v45 = (CKCoalescer *)objc_msgSend_initWithActivityDelay_maxActivityDelay_coalescingInterval_processingDelay_notifyBlock_(v43, v44, (unint64_t)(v42 * 1000000000.0), 0, 0, 0, v61);
  coalescer = self->_coalescer;
  self->_coalescer = v45;

  id v49 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v47, v48);
  v52 = objc_msgSend_memoryInfo(MEMORY[0x1E4F1A140], v50, v51);
  objc_msgSend_addObserver_selector_name_object_(v49, v53, (uint64_t)self, sel_handleMemoryPressureNotification_, *MEMORY[0x1E4F19CB8], v52);

  v56 = objc_msgSend_memoryInfo(MEMORY[0x1E4F1A140], v54, v55);
  self->_memoryPressure = objc_msgSend_memoryPressure(v56, v57, v58) != 0;

  objc_destroyWeak(&v62);
  objc_destroyWeak(&location);

  return self;
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (self && self->_accessCount)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v4 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      unint64_t accessCount = self->_accessCount;
      *(_DWORD *)buf = 134217984;
      unint64_t v10 = accessCount;
      _os_log_error_impl(&dword_1C4CFF000, v4, OS_LOG_TYPE_ERROR, "Deallocating proxy without being discardable (%tu)", buf, 0xCu);
    }
  }
  v5 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], a2, v2);
  objc_msgSend_removeObserver_(v5, v6, (uint64_t)self);

  v8.receiver = self;
  v8.super_class = (Class)CKDContainerProxy;
  [(CKDContainerProxy *)&v8 dealloc];
}

- (Class)class
{
  v3 = self;
  objc_sync_enter(v3);
  id WeakRetained = objc_loadWeakRetained((id *)&v3->_container);
  if (WeakRetained)
  {
    uint64_t v2 = objc_opt_class();
  }

  objc_sync_exit(v3);
  if (!WeakRetained)
  {
    uint64_t v2 = objc_opt_class();
  }
  return (Class)v2;
}

- (BOOL)isKindOfClass:(Class)a3
{
  uint64_t v4 = self;
  objc_sync_enter(v4);
  id WeakRetained = objc_loadWeakRetained((id *)&v4->_container);
  if (WeakRetained) {
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  objc_sync_exit(v4);
  if (!WeakRetained)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

- (BOOL)isMemberOfClass:(Class)a3
{
  v5 = self;
  objc_sync_enter(v5);
  id WeakRetained = objc_loadWeakRetained((id *)&v5->_container);
  objc_super v8 = WeakRetained;
  if (WeakRetained) {
    char isMemberOfClass = objc_msgSend_isMemberOfClass_(WeakRetained, v7, (uint64_t)a3);
  }

  objc_sync_exit(v5);
  if (v8) {
    return isMemberOfClass & 1;
  }
  unint64_t v10 = objc_opt_class();
  return objc_msgSend_isMemberOfClass_(v10, v11, (uint64_t)a3);
}

- (BOOL)conformsToProtocol:(id)a3
{
  id v5 = a3;
  char v6 = self;
  objc_sync_enter(v6);
  id WeakRetained = objc_loadWeakRetained((id *)&v6->_container);
  uint64_t v9 = WeakRetained;
  if (WeakRetained) {
    char v3 = objc_msgSend_conformsToProtocol_(WeakRetained, v8, (uint64_t)v5);
  }

  objc_sync_exit(v6);
  if (!v9)
  {
    unint64_t v10 = objc_opt_class();
    char v3 = objc_msgSend_conformsToProtocol_(v10, v11, (uint64_t)v5);
  }

  return v3 & 1;
}

+ (Class)class
{
  return (Class)objc_opt_class();
}

- (void)handleMemoryPressureNotification:(id)a3
{
  uint64_t v4 = objc_msgSend_memoryInfo(MEMORY[0x1E4F1A140], a2, (uint64_t)a3);
  uint64_t v7 = objc_msgSend_memoryPressure(v4, v5, v6);

  objc_msgSend_handleMemoryPressure_(self, v8, v7);
}

- (void)handleMemoryPressure:(int64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  id v5 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v10 = a3;
    _os_log_debug_impl(&dword_1C4CFF000, v5, OS_LOG_TYPE_DEBUG, "Handling memory pressure event: %zd", buf, 0xCu);
    if (self) {
      goto LABEL_5;
    }
LABEL_8:
    coalescer = 0;
    goto LABEL_6;
  }
  if (!self) {
    goto LABEL_8;
  }
LABEL_5:
  coalescer = self->_coalescer;
LABEL_6:
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1C4E6715C;
  v8[3] = &unk_1E64F1998;
  v8[4] = self;
  v8[5] = a3;
  objc_msgSend_mutate_(coalescer, v6, (uint64_t)v8);
}

- (void)handleMemoryPressure:(int64_t)a3 completionHandler:(id)a4
{
  id v12 = a4;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_super v8 = objc_msgSend_memoryInfo(MEMORY[0x1E4F1A140], v6, v7);
    a3 = objc_msgSend_memoryPressure(v8, v9, v10);
  }
  objc_msgSend_handleMemoryPressure_(self, v6, a3);
  uint64_t v11 = v12;
  if (v12)
  {
    (*((void (**)(id, void))v12 + 2))(v12, 0);
    uint64_t v11 = v12;
  }
}

- (void)beginContentAccess:(id)a3
{
  id v8 = a3;
  uint64_t v6 = objc_msgSend_beginContentAccess(self, v4, v5);
  uint64_t v7 = v8;
  if (v8)
  {
    (*((void (**)(id, uint64_t, void))v8 + 2))(v8, v6, 0);
    uint64_t v7 = v8;
  }
}

- (void)isContentDiscarded:(id)a3
{
  if (a3)
  {
    id v8 = a3;
    uint64_t isContentDiscarded = objc_msgSend_isContentDiscarded(self, v5, v6);
    (*((void (**)(id, uint64_t, void))a3 + 2))(v8, isContentDiscarded, 0);
  }
}

- (void)discardContentIfPossible
{
  if (self) {
    coalescer = self->_coalescer;
  }
  else {
    coalescer = 0;
  }
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = sub_1C4E6739C;
  v3[3] = &unk_1E64F05C8;
  v3[4] = self;
  objc_msgSend_mutate_(coalescer, a2, (uint64_t)v3);
}

- (BOOL)isContentDiscarded
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  if (self) {
    coalescer = self->_coalescer;
  }
  else {
    coalescer = 0;
  }
  char v12 = 0;
  uint64_t v4 = coalescer;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1C4E67490;
  v8[3] = &unk_1E64F43D0;
  v8[4] = self;
  v8[5] = &v9;
  objc_msgSend_mutate_(v4, v5, (uint64_t)v8);

  char v6 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (id)CKStatusReportArray
{
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  if (self) {
    coalescer = self->_coalescer;
  }
  else {
    coalescer = 0;
  }
  uint64_t v28 = 0;
  uint64_t v4 = coalescer;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = sub_1C4E676DC;
  v24[3] = &unk_1E64F1BC0;
  v24[4] = self;
  v24[5] = &v25;
  objc_msgSend_mutate_(v4, v5, (uint64_t)v24);

  char v6 = self;
  objc_sync_enter(v6);
  id WeakRetained = objc_loadWeakRetained((id *)&v6->_container);
  objc_sync_exit(v6);

  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v9 = NSString;
  char v12 = objc_msgSend_appContainerTuple(v6, v10, v11);
  id v15 = objc_msgSend_applicationID(v12, v13, v14);
  uint64_t v17 = objc_msgSend_stringWithFormat_(v9, v16, @"\n \"%@\"(accessCount: %tu)", v15, v26[3]);
  objc_msgSend_addObject_(v8, v18, (uint64_t)v17);

  if (WeakRetained)
  {
    uint64_t v21 = objc_msgSend_CKStatusReportArray(WeakRetained, v19, v20);
    objc_msgSend_addObjectsFromArray_(v8, v22, (uint64_t)v21);
  }
  _Block_object_dispose(&v25, 8);
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coalescer, 0);
  objc_storeStrong((id *)&self->_logicalDeviceScopedClientProxy, 0);
  objc_storeStrong((id *)&self->_strongContainer, 0);
  objc_destroyWeak((id *)&self->_connection);
  objc_storeStrong((id *)&self->_distantContainer, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_entitlements, 0);
  objc_storeStrong((id *)&self->_appContainerTuple, 0);
  objc_destroyWeak((id *)&self->_container);
}

@end