@interface CKDXPCConnection
- (BOOL)canRunGivenAvailabilityState:(unint64_t)a3;
- (BOOL)systemAvailabilityChanged:(unint64_t)a3;
- (CKDProcessScopedClientProxy)processScopedClientProxy;
- (CKDXPCConnection)initWithXPCConnection:(id)a3;
- (NSDate)connectionDate;
- (NSHashTable)containerProxies;
- (NSHashTable)sharedContainers;
- (NSMutableDictionary)logicalDeviceScopedClientProxiesByDeviceReference;
- (NSOperationQueue)systemAvailableQueue;
- (NSString)description;
- (NSXPCConnection)xpcConnection;
- (id)CKStatusReportArray;
- (id)containerProxyFromSetupInfo:(id)a3 containerScopedClientProxy:(id)a4 outError:(id *)a5;
- (id)logicalDeviceScopedClientProxyForDeviceContext:(id)a3;
- (id)redactedDescription;
- (void)CKDescribePropertiesUsing:(id)a3;
- (void)dealloc;
- (void)enumerateContainersUsingBlock:(id)a3;
- (void)enumerateContainersWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)getContainerScopedDaemonProxyCreatorForSetupInfo:(id)a3 containerScopedClientProxy:(id)a4 completionHandler:(id)a5;
- (void)getDaemonTestServerManagerProxyCreatorWithCompletionHandler:(id)a3;
- (void)getLogicalDeviceScopedClientProxyCreatorForTestDeviceReference:(id)a3 synchronous:(BOOL)a4 completionHandler:(id)a5;
- (void)getLogicalDeviceScopedDaemonProxyCreatorForTestDeviceReferenceProtocol:(id)a3 completionHandler:(id)a4;
- (void)getProcessScopedClientProxyCreatorSynchronous:(BOOL)a3 completionHandler:(id)a4;
- (void)getProcessScopedDaemonProxyCreatorWithCompletionHandler:(id)a3;
- (void)invalidate;
- (void)noteClientProcessScopedMetadata:(id)a3;
- (void)setLogicalDeviceScopedClientProxiesByDeviceReference:(id)a3;
- (void)setProcessScopedClientProxy:(id)a3;
- (void)setSystemAvailableQueue:(id)a3;
- (void)setXpcConnection:(id)a3;
@end

@implementation CKDXPCConnection

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (NSHashTable)sharedContainers
{
  return self->_sharedContainers;
}

- (CKDProcessScopedClientProxy)processScopedClientProxy
{
  return self->_processScopedClientProxy;
}

- (CKDXPCConnection)initWithXPCConnection:(id)a3
{
  id v5 = a3;
  v35.receiver = self;
  v35.super_class = (Class)CKDXPCConnection;
  v6 = [(CKDXPCConnection *)&v35 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_xpcConnection, a3);
    uint64_t v10 = objc_msgSend_now(MEMORY[0x1E4F1C9C8], v8, v9);
    connectionDate = v7->_connectionDate;
    v7->_connectionDate = (NSDate *)v10;

    v12 = [CKDProcessScopedClientProxy alloc];
    uint64_t v14 = objc_msgSend_initWithClientConnection_(v12, v13, (uint64_t)v7);
    processScopedClientProxy = v7->_processScopedClientProxy;
    v7->_processScopedClientProxy = (CKDProcessScopedClientProxy *)v14;

    uint64_t v16 = objc_opt_new();
    logicalDeviceScopedClientProxiesByDeviceReference = v7->_logicalDeviceScopedClientProxiesByDeviceReference;
    v7->_logicalDeviceScopedClientProxiesByDeviceReference = (NSMutableDictionary *)v16;

    uint64_t v20 = objc_msgSend_weakObjectsHashTable(MEMORY[0x1E4F28D30], v18, v19);
    sharedContainers = v7->_sharedContainers;
    v7->_sharedContainers = (NSHashTable *)v20;

    uint64_t v24 = objc_msgSend_weakObjectsHashTable(MEMORY[0x1E4F28D30], v22, v23);
    containerProxies = v7->_containerProxies;
    v7->_containerProxies = (NSHashTable *)v24;

    uint64_t v26 = objc_opt_new();
    systemAvailableQueue = v7->_systemAvailableQueue;
    v7->_systemAvailableQueue = (NSOperationQueue *)v26;

    objc_msgSend_setSuspended_(v7->_systemAvailableQueue, v28, 1);
    objc_msgSend_setMaxConcurrentOperationCount_(v7->_systemAvailableQueue, v29, 1);
    v32 = objc_msgSend_sharedMonitor(CKDSystemAvailabilityMonitor, v30, v31);
    objc_msgSend_registerWatcher_(v32, v33, (uint64_t)v7);
  }
  return v7;
}

- (void)invalidate
{
  objc_msgSend_enumerateContainersWithOptions_usingBlock_(self, a2, 4, &unk_1F2044210);
  objc_msgSend_enumerateContainersWithOptions_usingBlock_(self, v3, 4, &unk_1F2044230);
  processScopedClientProxy = self->_processScopedClientProxy;
  objc_msgSend_invalidate(processScopedClientProxy, v4, v5);
}

- (void)dealloc
{
  objc_msgSend_setSuspended_(self->_systemAvailableQueue, a2, 0);
  v3.receiver = self;
  v3.super_class = (Class)CKDXPCConnection;
  [(CKDXPCConnection *)&v3 dealloc];
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  id v4 = a3;
  objc_msgSend_processScopedClientProxy(self, v5, v6);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = objc_msgSend_procName(v11, v7, v8);
  objc_msgSend_addProperty_value_shouldRedact_(v4, v10, @"client", v9, 0);
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKDXPCConnection *, char *))MEMORY[0x1F4181798])(self, sel_CKUnredactedDescription);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKDXPCConnection *, char *))MEMORY[0x1F4181798])(self, sel_CKRedactedDescription);
}

- (void)enumerateContainersUsingBlock:(id)a3
{
  uint64_t v5 = (const char *)a3;
  uint64_t v9 = (char *)v5;
  if (v5)
  {
    objc_msgSend_enumerateContainersWithOptions_usingBlock_(self, v5, 0, v5);
  }
  else
  {
    v7 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], 0, v6);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v7, v8, (uint64_t)a2, self, @"CKDXPCConnection.m", 98, @"Invalid parameter not satisfying: %@", @"block");

    objc_msgSend_enumerateContainersWithOptions_usingBlock_(self, 0, 0, 0);
  }
}

- (void)enumerateContainersWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  id v9 = a4;
  if (!v9)
  {
    v28 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v7, v8);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v28, v29, (uint64_t)a2, self, @"CKDXPCConnection.m", 103, @"Invalid parameter not satisfying: %@", @"block");
  }
  if ((a3 & 4) != 0)
  {
    uint64_t v20 = objc_msgSend_sharedContainers(self, v7, v8);
    objc_sync_enter(v20);
    uint64_t v23 = objc_msgSend_sharedContainers(self, v21, v22);
    uint64_t v16 = objc_msgSend_allObjects(v23, v24, v25);

    objc_sync_exit(v20);
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = sub_1C4F1B268;
    v32[3] = &unk_1E64F6388;
    v17 = &v33;
    id v33 = v9;
    id v26 = v9;
    objc_msgSend_enumerateObjectsWithOptions_usingBlock_(v16, v27, a3, v32);
  }
  else
  {
    uint64_t v10 = objc_msgSend_containerProxies(self, v7, v8);
    objc_sync_enter(v10);
    v13 = objc_msgSend_containerProxies(self, v11, v12);
    uint64_t v16 = objc_msgSend_allObjects(v13, v14, v15);

    objc_sync_exit(v10);
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = sub_1C4F1B27C;
    v30[3] = &unk_1E64F63B0;
    v17 = &v31;
    id v31 = v9;
    id v18 = v9;
    objc_msgSend_enumerateObjectsWithOptions_usingBlock_(v16, v19, a3, v30);
  }
}

- (id)containerProxyFromSetupInfo:(id)a3 containerScopedClientProxy:(id)a4 outError:(id *)a5
{
  uint64_t v224 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v208 = a4;
  v213 = v6;
  v209 = objc_msgSend_containerID(v6, v7, v8);
  id v11 = objc_msgSend_processScopedClientProxy(self, v9, v10);
  v214 = objc_msgSend_clientEntitlements(v11, v12, v13);

  uint64_t v16 = objc_msgSend_containerOptions(v6, v14, v15);
  uint64_t v19 = objc_msgSend_fakeEntitlements(v16, v17, v18);
  uint64_t v22 = objc_msgSend_count(v19, v20, v21);

  if (!v22)
  {
LABEL_8:
    objc_msgSend_applicationBundleID(v214, v23, v24);
    goto LABEL_9;
  }
  if (!objc_msgSend_hasAllowFakeEntitlementsEntitlement(v214, v23, v24))
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    objc_super v35 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v220 = self;
      _os_log_error_impl(&dword_1C4CFF000, v35, OS_LOG_TYPE_ERROR, "Client Proxy \"%@\" is not entitled to use fake entitlements.", buf, 0xCu);
    }
    goto LABEL_8;
  }
  v27 = objc_msgSend_containerOptions(v213, v25, v26);
  v30 = objc_msgSend_fakeEntitlements(v27, v28, v29);
  v32 = objc_msgSend_entitlementsByAddingOverlay_(v214, v31, (uint64_t)v30);

  v214 = v32;
  objc_msgSend_applicationBundleID(v32, v33, v34);
  v36 = LABEL_9:;

  if (v36)
  {
    v39 = [CKDApplicationID alloc];
    v42 = objc_msgSend_applicationBundleID(v214, v40, v41);
    v45 = objc_msgSend_containerOptions(v213, v43, v44);
    v48 = objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(v45, v46, v47);
    v51 = objc_msgSend_containerOptions(v213, v49, v50);
    v54 = objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(v51, v52, v53);
    v57 = objc_msgSend_containerOptions(v213, v55, v56);
    v60 = objc_msgSend_applicationBundleIdentifierOverrideForPushTopicGeneration(v57, v58, v59);
    v63 = objc_msgSend_containerOptions(v213, v61, v62);
    v66 = objc_msgSend_applicationBundleIdentifierOverrideForTCC(v63, v64, v65);
    v211 = objc_msgSend_initWithApplicationBundleIdentifier_applicationBundleIdentifierOverrideForContainerAccess_applicationBundleIdentifierOverrideForNetworkAttribution_applicationBundleIdentifierOverrideForPushTopicGeneration_applicationBundleIdentifierOverrideForTCC_(v39, v67, (uint64_t)v42, v48, v54, v60, v66);
  }
  else
  {
    v211 = 0;
  }
  v68 = objc_msgSend_processScopedClientProxy(self, v37, v38);
  uint64_t v71 = objc_msgSend_clientSDKVersion(v68, v69, v70);
  char v73 = objc_msgSend_validateEntitlementsWithSDKVersion_error_(v214, v72, v71, a5);

  if ((v73 & 1) == 0)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v87 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v220 = self;
      _os_log_error_impl(&dword_1C4CFF000, v87, OS_LOG_TYPE_ERROR, "Connection %@ has invalid client entitlements.", buf, 0xCu);
    }
LABEL_25:
    v86 = 0;
    goto LABEL_113;
  }
  v76 = objc_msgSend_currentProcess(CKDDaemonProcess, v74, v75);
  if (objc_msgSend_processType(v76, v77, v78) == 1)
  {
    char hasSystemLaunchDaemonEntitlement = objc_msgSend_hasSystemLaunchDaemonEntitlement(v214, v79, v80);

    if ((hasSystemLaunchDaemonEntitlement & 1) == 0)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v84 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v220 = self;
        _os_log_error_impl(&dword_1C4CFF000, v84, OS_LOG_TYPE_ERROR, "Connection %@ is not allowed to use the system cloudd.", buf, 0xCu);
      }
      if (a5)
      {
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v85, *MEMORY[0x1E4F19C40], 8, @"Connection %@ is not allowed to use the system cloudd.", self);
        v86 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_113;
      }
      goto LABEL_25;
    }
  }
  else
  {
  }
  v206 = objc_msgSend_accountOverrideInfo(v213, v82, v83);
  if (!*MEMORY[0x1E4F1A4E0] && v206 && (objc_msgSend_hasCustomAccountsEntitlement(v214, v88, v89) & 1) == 0)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v173 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v220 = self;
      _os_log_error_impl(&dword_1C4CFF000, v173, OS_LOG_TYPE_ERROR, "The application on the other end of %@ is trying to use a custom account but it doesn't have the right entitlement. Denying connection.", buf, 0xCu);
    }
    if (a5)
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v174, *MEMORY[0x1E4F19C40], 8, @"Connection %@ is not allowed to set custom account info", self);
      id v175 = (id)objc_claimAutoreleasedReturnValue();
LABEL_95:
      v86 = 0;
      *a5 = v175;
      goto LABEL_112;
    }
LABEL_106:
    v86 = 0;
    goto LABEL_112;
  }
  if (objc_msgSend_hasMasqueradingEntitlement(v214, v88, v89))
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v92 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v220 = self;
      _os_log_impl(&dword_1C4CFF000, v92, OS_LOG_TYPE_INFO, "Giving %@ blanket access to any container", buf, 0xCu);
    }
    goto LABEL_63;
  }
  v95 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v90, v91);
  v98 = objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(v211, v96, v97);

  if (v98)
  {
    v101 = objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(v211, v99, v100);
    objc_msgSend_addObject_(v95, v102, (uint64_t)v101);
  }
  v103 = objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(v211, v99, v100);

  if (v103)
  {
    v106 = objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(v211, v104, v105);
    objc_msgSend_addObject_(v95, v107, (uint64_t)v106);
  }
  v108 = objc_msgSend_applicationBundleIdentifierOverrideForPushTopicGeneration(v211, v104, v105);

  if (v108)
  {
    v111 = objc_msgSend_applicationBundleIdentifierOverrideForPushTopicGeneration(v211, v109, v110);
    objc_msgSend_addObject_(v95, v112, (uint64_t)v111);
  }
  v113 = objc_msgSend_applicationBundleIdentifierOverrideForTCC(v211, v109, v110);

  if (v113)
  {
    v116 = objc_msgSend_applicationBundleIdentifierOverrideForTCC(v211, v114, v115);
    objc_msgSend_addObject_(v95, v117, (uint64_t)v116);
  }
  v118 = objc_msgSend_clientPrefixEntitlement(v214, v114, v115);
  long long v217 = 0u;
  long long v218 = 0u;
  long long v215 = 0u;
  long long v216 = 0u;
  id obj = v95;
  uint64_t v122 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v119, (uint64_t)&v215, v223, 16);
  if (!v122) {
    goto LABEL_62;
  }
  uint64_t v123 = *(void *)v216;
  uint64_t v124 = *MEMORY[0x1E4F19BF0];
  v125 = (dispatch_once_t *)MEMORY[0x1E4F1A550];
  while (2)
  {
    uint64_t v126 = 0;
    do
    {
      if (*(void *)v216 != v123) {
        objc_enumerationMutation(obj);
      }
      v127 = *(void **)(*((void *)&v215 + 1) + 8 * v126);
      v128 = NSString;
      v129 = objc_msgSend_applicationBundleID(v214, v120, v121);
      v131 = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(v128, v130, v124, @"%@", 0, v129);

      if (objc_msgSend_isEqualToString_(v131, v132, (uint64_t)v127))
      {
        if (*v125 != -1) {
          dispatch_once(v125, (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v135 = *MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v220 = self;
          v136 = v135;
          v137 = "Giving %@ access to container because it's a data repair proxy";
          uint32_t v138 = 12;
LABEL_59:
          _os_log_impl(&dword_1C4CFF000, v136, OS_LOG_TYPE_INFO, v137, buf, v138);
          goto LABEL_60;
        }
        goto LABEL_60;
      }
      if (!objc_msgSend_length(v118, v133, v134))
      {
        if (*v125 != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v178 = *MEMORY[0x1E4F1A500];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_FAULT)) {
          goto LABEL_103;
        }
        *(_DWORD *)buf = 138412546;
        v220 = self;
        __int16 v221 = 2114;
        v222 = v127;
        v179 = "Connection \"%@\" specified bundle identifier override '%{public}@', but it has no prefix entitlement";
        goto LABEL_118;
      }
      if (!objc_msgSend_hasPrefix_(v127, v139, (uint64_t)v118))
      {
        if (*v125 != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v178 = *MEMORY[0x1E4F1A500];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_FAULT)) {
          goto LABEL_103;
        }
        *(_DWORD *)buf = 138412546;
        v220 = self;
        __int16 v221 = 2114;
        v222 = v127;
        v179 = "Connection \"%@\" specified bundle identifier override '%{public}@', but it didn't match the prefix";
LABEL_118:
        _os_log_fault_impl(&dword_1C4CFF000, v178, OS_LOG_TYPE_FAULT, v179, buf, 0x16u);
LABEL_103:

        if (a5)
        {
          objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v180, *MEMORY[0x1E4F19C40], 8, @"Connection %@ is not allowed to set its application bundle identifier without the %@ entitlement", self, *MEMORY[0x1E4F1A568]);
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }

        goto LABEL_106;
      }
      if (*v125 != -1) {
        dispatch_once(v125, (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v140 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v220 = self;
        __int16 v221 = 2114;
        v222 = v127;
        v136 = v140;
        v137 = "Allowing %@ to override bundle identifier '%{public}@' due to matching prefix";
        uint32_t v138 = 22;
        goto LABEL_59;
      }
LABEL_60:

      ++v126;
    }
    while (v122 != v126);
    uint64_t v122 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v120, (uint64_t)&v215, v223, 16);
    if (v122) {
      continue;
    }
    break;
  }
LABEL_62:

LABEL_63:
  v141 = objc_msgSend_cloudServices(v214, v93, v94);
  if (objc_msgSend_containsObject_(v141, v142, *MEMORY[0x1E4F1A590]))
  {

    goto LABEL_66;
  }
  v146 = objc_msgSend_cloudServices(v214, v143, v144);
  char v148 = objc_msgSend_containsObject_(v146, v147, *MEMORY[0x1E4F1A588]);

  if ((v148 & 1) == 0)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v176 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v220 = self;
      _os_log_error_impl(&dword_1C4CFF000, v176, OS_LOG_TYPE_ERROR, "Connection %@ is not entitled to use CloudKit", buf, 0xCu);
    }
    if (a5)
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v177, *MEMORY[0x1E4F19C40], 8, @"Connection %@ is not entitled to use CloudKit", self);
      id v175 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_95;
    }
    goto LABEL_106;
  }
LABEL_66:
  uint64_t v149 = objc_msgSend_containerEnvironmentForContainerID_entitlements_(MEMORY[0x1E4F19EC8], v145, (uint64_t)v209, v214);
  id v150 = objc_alloc(MEMORY[0x1E4F19ED8]);
  v153 = objc_msgSend_containerIdentifier(v209, v151, v152);
  v155 = objc_msgSend_initWithContainerIdentifier_environment_(v150, v154, (uint64_t)v153, v149);

  if (!v211)
  {
    if (a5)
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v156, *MEMORY[0x1E4F19C40], 8, @"Trying to initialize a container without an application ID");
      v86 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v86 = 0;
    }
    goto LABEL_111;
  }
  v157 = CKCurrentPersonaID();
  v160 = objc_msgSend_containerOptions(v213, v158, v159);
  uint64_t v163 = objc_msgSend_personaIdentifier(v160, v161, v162);
  v164 = (void *)v163;
  if (v163) {
    v165 = (void *)v163;
  }
  else {
    v165 = v157;
  }
  id v166 = v165;

  if ((CKShouldAdoptPersona(v166) & 1) == 0)
  {

    id v166 = 0;
  }
  v167 = [CKDAppContainerTuple alloc];
  v169 = objc_msgSend_initWithApplicationID_containerID_personaID_(v167, v168, (uint64_t)v211, v155, v166);
  if (!v166 || (CKObjectsAreBothNilOrEqual() & 1) != 0)
  {
LABEL_109:
    v189 = [CKDContainerProxy alloc];
    v192 = objc_msgSend_containerOptions(v213, v190, v191);
    v86 = objc_msgSend_initWithAppContainerTuple_entitlements_options_distantContainer_connection_(v189, v193, (uint64_t)v169, v214, v192, v208, self);

    v196 = objc_msgSend_containerProxies(self, v194, v195);
    objc_sync_enter(v196);
    v199 = objc_msgSend_containerProxies(self, v197, v198);
    objc_msgSend_addObject_(v199, v200, (uint64_t)v86);

    objc_sync_exit(v196);
    goto LABEL_110;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v170 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
  {
    v202 = v170;
    objc_msgSend_ckShortDescription(v169, v203, v204);
    v205 = (CKDXPCConnection *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v220 = v205;
    __int16 v221 = 2112;
    v222 = v157;
    _os_log_error_impl(&dword_1C4CFF000, v202, OS_LOG_TYPE_ERROR, "Invalid persona for container %@: %@", buf, 0x16u);
  }
  if (!*MEMORY[0x1E4F1A4E0])
  {
    v181 = NSString;
    v182 = objc_msgSend_ckShortDescription(v169, v171, v172);
    v184 = objc_msgSend_stringWithFormat_(v181, v183, @"Invalid persona for container %@: %@", v182, v157);

    v187 = objc_msgSend_processScopedClientProxy(self, v185, v186);
    objc_msgSend_handleSignificantIssueBehavior_reason_(v187, v188, 1, v184);

    goto LABEL_109;
  }
  if (a5)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v171, *MEMORY[0x1E4F19C40], 5, @"Incorrect persona for container");
    v86 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v86 = 0;
  }
LABEL_110:

LABEL_111:
LABEL_112:

LABEL_113:
  return v86;
}

- (BOOL)canRunGivenAvailabilityState:(unint64_t)a3
{
  char v3 = a3;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if ((a3 & 1) != 0
    || (objc_msgSend_processScopedClientProxy(self, a2, a3),
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_clientEntitlements(v5, v6, v7),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        char hasAllowAccessDuringBuddyEntitlement = objc_msgSend_hasAllowAccessDuringBuddyEntitlement(v8, v9, v10),
        v8,
        v5,
        (hasAllowAccessDuringBuddyEntitlement & 1) != 0))
  {
    BOOL result = 1;
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v22 = (void *)*MEMORY[0x1E4F1A500];
    BOOL v23 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (v23)
    {
      uint64_t v24 = v22;
      v27 = objc_msgSend_processScopedClientProxy(self, v25, v26);
      v30 = objc_msgSend_procName(v27, v28, v29);
      int v31 = 138543362;
      v32 = v30;
      _os_log_impl(&dword_1C4CFF000, v24, OS_LOG_TYPE_DEFAULT, "Connection from %{public}@ not active. Device is not past buddy and it lacks the entitlement to bypass.", (uint8_t *)&v31, 0xCu);

      BOOL result = 0;
    }
  }
  if ((v3 & 2) == 0)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v13 = (void *)*MEMORY[0x1E4F1A500];
    BOOL v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (v14)
    {
      uint64_t v15 = v13;
      uint64_t v18 = objc_msgSend_processScopedClientProxy(self, v16, v17);
      uint64_t v21 = objc_msgSend_procName(v18, v19, v20);
      int v31 = 138543362;
      v32 = v21;
      _os_log_impl(&dword_1C4CFF000, v15, OS_LOG_TYPE_DEFAULT, "Connection from %{public}@ not active yet because device hasn't been unlocked since boot.", (uint8_t *)&v31, 0xCu);

      return 0;
    }
  }
  return result;
}

- (BOOL)systemAvailabilityChanged:(unint64_t)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v7 = objc_msgSend_systemAvailableQueue(v4, v5, v6);
  int isSuspended = objc_msgSend_isSuspended(v7, v8, v9);

  if (isSuspended && objc_msgSend_canRunGivenAvailabilityState_(v4, v11, a3))
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v13 = (id)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = objc_msgSend_processScopedClientProxy(v4, v14, v15);
      uint64_t v19 = objc_msgSend_procName(v16, v17, v18);
      *(_DWORD *)buf = 138543362;
      v36 = v19;
      _os_log_impl(&dword_1C4CFF000, v13, OS_LOG_TYPE_INFO, "Connection from client %{public}@ is now active", buf, 0xCu);
    }
    uint64_t v22 = objc_msgSend_systemAvailableQueue(v4, v20, v21);
    objc_msgSend_setSuspended_(v22, v23, 0);

    uint64_t v26 = objc_msgSend_processScopedClientProxy(v4, v24, v25);
  }
  else
  {
    uint64_t v26 = 0;
  }
  v27 = objc_msgSend_systemAvailableQueue(v4, v11, v12);
  char v30 = objc_msgSend_isSuspended(v27, v28, v29);

  objc_sync_exit(v4);
  if (v26)
  {
    int v31 = dispatch_get_global_queue(17, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1C4F1C6D8;
    block[3] = &unk_1E64F05C8;
    id v34 = v26;
    dispatch_async(v31, block);
  }
  return v30;
}

- (void)noteClientProcessScopedMetadata:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_clientSDKVersion(v4, v5, v6);
  uint64_t v10 = objc_msgSend_processScopedClientProxy(self, v8, v9);
  objc_msgSend_setClientSDKVersion_(v10, v11, v7);

  uint64_t isClientMainBundleAppleExecutable = objc_msgSend_isClientMainBundleAppleExecutable(v4, v12, v13);
  uint64_t v17 = objc_msgSend_processScopedClientProxy(self, v15, v16);
  objc_msgSend_setIsClientMainBundleAppleExecutable_(v17, v18, isClientMainBundleAppleExecutable);

  uint64_t v19 = objc_opt_new();
  uint64_t v22 = objc_msgSend_frameworkFingerprint(v4, v20, v21);
  char isLikelyEqual = objc_msgSend_isLikelyEqual_(v22, v23, (uint64_t)v19);

  if ((isLikelyEqual & 1) == 0)
  {
    v27 = NSString;
    v28 = objc_msgSend_frameworkFingerprint(v4, v25, v26);
    char v30 = objc_msgSend_stringWithFormat_(v27, v29, @"Client and daemon processes have different versions of CloudKit.framework in memory: <%@> vs. <%@>", v28, v19);

    int v31 = CKGetGlobalQueue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1C4F1C868;
    block[3] = &unk_1E64F0948;
    void block[4] = self;
    id v34 = v30;
    id v32 = v30;
    dispatch_async(v31, block);

    CKHandleSignificantIssueBehavior();
  }
}

- (void)getContainerScopedDaemonProxyCreatorForSetupInfo:(id)a3 containerScopedClientProxy:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  uint64_t v13 = objc_msgSend_systemAvailableQueue(self, v11, v12);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_1C4F1CA14;
  v18[3] = &unk_1E64F24A0;
  objc_copyWeak(&v22, &location);
  id v14 = v8;
  id v19 = v14;
  id v15 = v9;
  id v20 = v15;
  id v16 = v10;
  id v21 = v16;
  objc_msgSend_addOperationWithBlock_(v13, v17, (uint64_t)v18);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

- (void)getLogicalDeviceScopedDaemonProxyCreatorForTestDeviceReferenceProtocol:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v10 = objc_msgSend_systemAvailableQueue(self, v8, v9);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1C4F1CB9C;
  v14[3] = &unk_1E64F0E18;
  id v15 = v6;
  id v16 = v7;
  id v11 = v7;
  id v12 = v6;
  objc_msgSend_addOperationWithBlock_(v10, v13, (uint64_t)v14);
}

- (void)getProcessScopedDaemonProxyCreatorWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend_systemAvailableQueue(self, v5, v6);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1C4F1CCC8;
  v10[3] = &unk_1E64F0790;
  v10[4] = self;
  id v11 = v4;
  id v8 = v4;
  objc_msgSend_addOperationWithBlock_(v7, v9, (uint64_t)v10);
}

- (void)getDaemonTestServerManagerProxyCreatorWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend_currentProcess(CKDDaemonProcess, v5, v6);
  uint64_t v10 = objc_msgSend_processType(v7, v8, v9);

  if (v10 == 2)
  {
    uint64_t v13 = objc_msgSend_systemAvailableQueue(self, v11, v12);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = sub_1C4F1CE58;
    v15[3] = &unk_1E64F0A80;
    id v16 = v4;
    objc_msgSend_addOperationWithBlock_(v13, v14, (uint64_t)v15);
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

- (id)logicalDeviceScopedClientProxyForDeviceContext:(id)a3
{
  v38[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v7 = objc_msgSend_testDeviceReference(v4, v5, v6);
  uint64_t v10 = objc_msgSend_deviceID(v7, v8, v9);
  uint64_t v13 = (void *)v10;
  id v14 = @"NO_DEVICE_ID";
  if (v10) {
    id v14 = (__CFString *)v10;
  }
  v38[0] = v14;
  id v15 = objc_msgSend_testDeviceReference(v4, v11, v12);
  uint64_t v18 = objc_msgSend_serverReferenceProtocol(v15, v16, v17);
  id v22 = objc_msgSend_dataDirectory(v18, v19, v20);
  BOOL v23 = v22;
  if (!v22)
  {
    BOOL v23 = objc_msgSend_fileURLWithPath_(MEMORY[0x1E4F1CB10], v21, @"/dev/null");
  }
  v38[1] = v23;
  uint64_t v24 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v21, (uint64_t)v38, 2);
  if (!v22) {

  }
  uint64_t v25 = self;
  objc_sync_enter(v25);
  v28 = objc_msgSend_logicalDeviceScopedClientProxiesByDeviceReference(v25, v26, v27);
  char v30 = objc_msgSend_objectForKeyedSubscript_(v28, v29, (uint64_t)v24);

  if (!v30)
  {
    int v31 = [CKDLogicalDeviceScopedClientProxy alloc];
    char v30 = objc_msgSend_initWithClientConnection_deviceContext_(v31, v32, (uint64_t)v25, v4);
    objc_super v35 = objc_msgSend_logicalDeviceScopedClientProxiesByDeviceReference(v25, v33, v34);
    objc_msgSend_setObject_forKeyedSubscript_(v35, v36, (uint64_t)v30, v24);
  }
  objc_sync_exit(v25);

  return v30;
}

- (void)getProcessScopedClientProxyCreatorSynchronous:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1C4F1D240;
  aBlock[3] = &unk_1E64F63D8;
  id v7 = v6;
  id v15 = v7;
  id v8 = _Block_copy(aBlock);
  uint64_t v9 = sub_1C4F1D258(self, v4, v8);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1C4F1D3BC;
  v12[3] = &unk_1E64F6400;
  id v13 = v7;
  id v10 = v7;
  objc_msgSend_getProcessScopedClientProxyCreatorWithCompletionHandler_(v9, v11, (uint64_t)v12);
}

- (void)getLogicalDeviceScopedClientProxyCreatorForTestDeviceReference:(id)a3 synchronous:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1C4F1D510;
  aBlock[3] = &unk_1E64F63D8;
  id v9 = v8;
  id v18 = v9;
  id v10 = a3;
  id v11 = _Block_copy(aBlock);
  uint64_t v12 = sub_1C4F1D258(self, v5, v11);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1C4F1D528;
  v15[3] = &unk_1E64F6428;
  id v16 = v9;
  id v13 = v9;
  objc_msgSend_getLogicalDeviceScopedClientProxyCreatorForTestDeviceReferenceProtocol_completionHandler_(v12, v14, (uint64_t)v10, v15);
}

- (id)CKStatusReportArray
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  BOOL v4 = NSString;
  id v7 = objc_msgSend_connectionDate(self, v5, v6);
  id v9 = objc_msgSend_stringWithFormat_(v4, v8, @"\n connected since: %@", v7);
  objc_msgSend_addObject_(v3, v10, (uint64_t)v9);

  objc_msgSend_addObject_(v3, v11, @"------ Containers -------");
  id v14 = objc_msgSend_containerProxies(self, v12, v13);
  objc_sync_enter(v14);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v17 = objc_msgSend_containerProxies(self, v15, v16);
  uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v27, v31, 16);
  if (v21)
  {
    uint64_t v22 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v28 != v22) {
          objc_enumerationMutation(v17);
        }
        uint64_t v24 = objc_msgSend_CKStatusReportArray(*(void **)(*((void *)&v27 + 1) + 8 * i), v19, v20);
        objc_msgSend_addObject_(v3, v25, (uint64_t)v24);
      }
      uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v19, (uint64_t)&v27, v31, 16);
    }
    while (v21);
  }

  objc_sync_exit(v14);
  return v3;
}

- (void)setXpcConnection:(id)a3
{
}

- (NSDate)connectionDate
{
  return self->_connectionDate;
}

- (void)setProcessScopedClientProxy:(id)a3
{
}

- (NSMutableDictionary)logicalDeviceScopedClientProxiesByDeviceReference
{
  return self->_logicalDeviceScopedClientProxiesByDeviceReference;
}

- (void)setLogicalDeviceScopedClientProxiesByDeviceReference:(id)a3
{
}

- (NSHashTable)containerProxies
{
  return self->_containerProxies;
}

- (NSOperationQueue)systemAvailableQueue
{
  return self->_systemAvailableQueue;
}

- (void)setSystemAvailableQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemAvailableQueue, 0);
  objc_storeStrong((id *)&self->_containerProxies, 0);
  objc_storeStrong((id *)&self->_logicalDeviceScopedClientProxiesByDeviceReference, 0);
  objc_storeStrong((id *)&self->_sharedContainers, 0);
  objc_storeStrong((id *)&self->_processScopedClientProxy, 0);
  objc_storeStrong((id *)&self->_connectionDate, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end