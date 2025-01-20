@interface CKDProcessScopedClientProxy
- (BOOL)canOpenFileAtURL:(id)a3;
- (BOOL)hasValidatedEntitlements;
- (BOOL)isClientMainBundleAppleExecutable;
- (BOOL)isSandboxed;
- (BOOL)processIsAttached;
- (CKDProcessScopedClientProxy)initWithClientConnection:(id)a3;
- (CKDXPCConnection)clientConnection;
- (CKEntitlements)clientEntitlements;
- (CKXPCProcessScopedClient)processScopedClientProxyCreator;
- (NSDictionary)connectionEntitlements;
- (NSString)procName;
- (NSString)processBinaryName;
- (id)CKPropertiesDescription;
- (id)description;
- (id)getFileMetadataWithFileHandle:(id)a3 openInfo:(id)a4 error:(id *)a5;
- (id)issueSandboxExtensionForItem:(id)a3 error:(id *)a4;
- (int)pid;
- (int64_t)hasValidatedEntitlementsTernary;
- (unsigned)clientSDKVersion;
- (void)_getProcessScopedClientProxyCreatorSynchronous:(BOOL)a3 completionHandler:(id)a4;
- (void)getProcessScopedClientProxySynchronous:(BOOL)a3 errorHandler:(id)a4 clientProxyHandler:(id)a5;
- (void)handleSignificantIssueBehavior:(unint64_t)a3 reason:(id)a4;
- (void)noteSystemIsAvailable;
- (void)setClientConnection:(id)a3;
- (void)setClientSDKVersion:(unsigned int)a3;
- (void)setConnectionEntitlements:(id)a3;
- (void)setHasValidatedEntitlementsTernary:(int64_t)a3;
- (void)setIsClientMainBundleAppleExecutable:(BOOL)a3;
- (void)setProcessScopedClientProxyCreator:(id)a3;
@end

@implementation CKDProcessScopedClientProxy

- (CKEntitlements)clientEntitlements
{
  return self->_clientEntitlements;
}

- (id)issueSandboxExtensionForItem:(id)a3 error:(id *)a4
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  v6 = objc_msgSend_path(a3, a2, (uint64_t)a3);
  objc_msgSend_fileSystemRepresentation(v6, v7, v8);
  v11 = objc_msgSend_clientConnection(self, v9, v10);
  v14 = objc_msgSend_xpcConnection(v11, v12, v13);
  v17 = v14;
  if (v14) {
    objc_msgSend_auditToken(v14, v15, v16);
  }
  v18 = (char *)sandbox_extension_issue_file_to_process();

  if (!v18)
  {
    v29 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v30 = *MEMORY[0x1E4F19DD8];
    v31 = objc_msgSend_clientEntitlements(self, v19, v20);
    v34 = objc_msgSend_applicationBundleID(v31, v32, v33);
    v37 = objc_msgSend_CKSanitizedPath(v6, v35, v36);
    uint64_t v38 = *__error();
    v39 = __error();
    v40 = strerror(*v39);
    objc_msgSend_errorWithDomain_code_path_format_(v29, v41, v30, 1000, v6, @"Failed to issue sandbox extension for \"%@\" at %@: %d (%s)", v34, v37, v38, v40);
    id v28 = (id)objc_claimAutoreleasedReturnValue();

    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v42 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      v56 = v42;
      v59 = objc_msgSend_clientEntitlements(self, v57, v58);
      v62 = objc_msgSend_applicationBundleID(v59, v60, v61);
      v65 = objc_msgSend_CKSanitizedPath(v6, v63, v64);
      *(_DWORD *)buf = 138412802;
      v77 = v62;
      __int16 v78 = 2112;
      v79 = v65;
      __int16 v80 = 2112;
      id v81 = v28;
      _os_log_error_impl(&dword_1C4CFF000, v56, OS_LOG_TYPE_ERROR, "Failed to issue sandbox extension for applicationBundleID=%@ and path=%@: %@", buf, 0x20u);

      if (a4) {
        goto LABEL_14;
      }
    }
    else if (a4)
    {
LABEL_14:
      id v28 = v28;
      v27 = 0;
      *a4 = v28;
      goto LABEL_21;
    }
LABEL_20:
    v27 = 0;
    goto LABEL_21;
  }
  v21 = (void *)MEMORY[0x1E4F1A550];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v22 = (os_log_t *)MEMORY[0x1E4F1A500];
  v23 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    v46 = v23;
    v49 = objc_msgSend_clientEntitlements(self, v47, v48);
    v52 = objc_msgSend_applicationBundleID(v49, v50, v51);
    v55 = objc_msgSend_CKSanitizedPath(v6, v53, v54);
    *(_DWORD *)buf = 138543618;
    v77 = v52;
    __int16 v78 = 2112;
    v79 = v55;
    _os_log_debug_impl(&dword_1C4CFF000, v46, OS_LOG_TYPE_DEBUG, "Issued sandbox extension token for \"%{public}@\" at %@", buf, 0x16u);
  }
  id v24 = [NSString alloc];
  size_t v25 = strlen(v18);
  v27 = objc_msgSend_initWithBytesNoCopy_length_encoding_freeWhenDone_(v24, v26, (uint64_t)v18, v25, 4, 1);
  if (!v27)
  {
    if (*v21 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    os_log_t v43 = *v22;
    if (os_log_type_enabled(*v22, OS_LOG_TYPE_ERROR))
    {
      v66 = v43;
      v69 = objc_msgSend_clientEntitlements(self, v67, v68);
      v72 = objc_msgSend_applicationBundleID(v69, v70, v71);
      v75 = objc_msgSend_CKSanitizedPath(v6, v73, v74);
      *(_DWORD *)buf = 138543618;
      v77 = v72;
      __int16 v78 = 2112;
      v79 = v75;
      _os_log_error_impl(&dword_1C4CFF000, v66, OS_LOG_TYPE_ERROR, "Failed to allocate string for sandbox extension for applicationBundleID=%{public}@ and path=%@", buf, 0x16u);
    }
    free(v18);
    id v28 = 0;
    goto LABEL_20;
  }
  id v28 = 0;
LABEL_21:
  id v44 = v27;

  return v44;
}

- (CKDXPCConnection)clientConnection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clientConnection);
  return (CKDXPCConnection *)WeakRetained;
}

- (BOOL)isClientMainBundleAppleExecutable
{
  return self->_isClientMainBundleAppleExecutable;
}

- (unsigned)clientSDKVersion
{
  return self->_clientSDKVersion;
}

- (BOOL)processIsAttached
{
  uint64_t v3 = objc_msgSend_pid(self, a2, v2);
  return MEMORY[0x1F40D6408](v3);
}

- (int)pid
{
  return self->_pid;
}

- (NSString)procName
{
  return self->_procName;
}

- (id)CKPropertiesDescription
{
  uint64_t v3 = objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], a2, 2);
  v4 = NSString;
  v7 = objc_msgSend_procName(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v4, v8, @"name=%@", v7);
  objc_msgSend_addObject_(v3, v10, (uint64_t)v9);

  if (objc_msgSend_isSandboxed(self, v11, v12))
  {
    v14 = objc_msgSend_stringWithFormat_(NSString, v13, @"flags=sandboxed");
    objc_msgSend_addObject_(v3, v15, (uint64_t)v14);
  }
  uint64_t v16 = objc_msgSend_componentsJoinedByString_(v3, v13, @", ");

  return v16;
}

- (id)description
{
  return (id)((uint64_t (*)(CKDProcessScopedClientProxy *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (CKDProcessScopedClientProxy)initWithClientConnection:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v61.receiver = self;
  v61.super_class = (Class)CKDProcessScopedClientProxy;
  v5 = [(CKDProcessScopedClientProxy *)&v61 init];
  uint64_t v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_clientConnection, v4);
    long long v59 = 0u;
    long long v60 = 0u;
    v9 = objc_msgSend_xpcConnection(v4, v7, v8);
    uint64_t v12 = v9;
    if (v9)
    {
      objc_msgSend_auditToken(v9, v10, v11);
    }
    else
    {
      long long v59 = 0u;
      long long v60 = 0u;
    }

    v15 = objc_msgSend_xpcConnection(v4, v13, v14);
    v6->_uint64_t pid = objc_msgSend_processIdentifier(v15, v16, v17);

    id v18 = objc_alloc(MEMORY[0x1E4F1A008]);
    uint64_t pid = v6->_pid;
    long long buffer = v59;
    long long v65 = v60;
    uint64_t v21 = objc_msgSend_initWithAuditToken_pid_(v18, v20, (uint64_t)&buffer, pid);
    clientEntitlements = v6->_clientEntitlements;
    v6->_clientEntitlements = (CKEntitlements *)v21;

    long long buffer = v59;
    long long v65 = v60;
    v6->_sandboxed = sandbox_check_by_audit_token() != 0;
    v6->_hasValidatedEntitlementsTernary = -1;
    if (proc_name(v6->_pid, &buffer, 0x40u) >= 1)
    {
      id v23 = [NSString alloc];
      uint64_t v25 = objc_msgSend_initWithCString_encoding_(v23, v24, (uint64_t)&buffer, 4);
      processBinaryName = v6->_processBinaryName;
      v6->_processBinaryName = (NSString *)v25;
    }
    id v27 = [NSString alloc];
    v29 = (__CFString *)v6->_processBinaryName;
    if (!v29) {
      v29 = @"???";
    }
    uint64_t v30 = objc_msgSend_initWithFormat_(v27, v28, @"%@(%d)", v29, v6->_pid);
    procName = v6->_procName;
    v6->_procName = (NSString *)v30;

    v34 = objc_msgSend_clientEntitlements(v6, v32, v33);
    int hasVFSOpenByIDEntitlement = objc_msgSend_hasVFSOpenByIDEntitlement(v34, v35, v36);

    v40 = (void *)MEMORY[0x1E4F1A550];
    v41 = (os_log_t *)MEMORY[0x1E4F1A500];
    if (hasVFSOpenByIDEntitlement)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v42 = *v41;
      if (os_log_type_enabled(*v41, OS_LOG_TYPE_INFO))
      {
        os_log_t v43 = v6->_procName;
        *(_DWORD *)buf = 138543362;
        v63 = v43;
        _os_log_impl(&dword_1C4CFF000, v42, OS_LOG_TYPE_INFO, "Client \"%{public}@\" has entitlement to use openByID", buf, 0xCu);
      }
    }
    id v44 = objc_msgSend_clientEntitlements(v6, v38, v39);
    int hasAllowAccessDuringBuddyEntitlement = objc_msgSend_hasAllowAccessDuringBuddyEntitlement(v44, v45, v46);

    if (hasAllowAccessDuringBuddyEntitlement)
    {
      if (*v40 != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v50 = *v41;
      if (os_log_type_enabled(*v41, OS_LOG_TYPE_INFO))
      {
        uint64_t v51 = v6->_procName;
        *(_DWORD *)buf = 138543362;
        v63 = v51;
        _os_log_impl(&dword_1C4CFF000, v50, OS_LOG_TYPE_INFO, "Client \"%{public}@\" has entitlement to allow access during buddy.", buf, 0xCu);
      }
    }
    v52 = objc_msgSend_clientEntitlements(v6, v48, v49);
    int hasAllowPackagesEntitlement = objc_msgSend_hasAllowPackagesEntitlement(v52, v53, v54);

    if (hasAllowPackagesEntitlement)
    {
      if (*v40 != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v56 = *v41;
      if (os_log_type_enabled(*v41, OS_LOG_TYPE_INFO))
      {
        v57 = v6->_procName;
        *(_DWORD *)buf = 138543362;
        v63 = v57;
        _os_log_impl(&dword_1C4CFF000, v56, OS_LOG_TYPE_INFO, "Client \"%{public}@\" has entitlement to use packages. Good luck!", buf, 0xCu);
      }
    }
  }

  return v6;
}

- (void)getProcessScopedClientProxySynchronous:(BOOL)a3 errorHandler:(id)a4 clientProxyHandler:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1C4D5E810;
  v13[3] = &unk_1E64F0AC0;
  BOOL v16 = v6;
  id v14 = v9;
  id v15 = v8;
  id v10 = v8;
  id v11 = v9;
  objc_msgSend__getProcessScopedClientProxyCreatorSynchronous_completionHandler_(self, v12, v6, v13);
}

- (void)_getProcessScopedClientProxyCreatorSynchronous:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  BOOL v6 = (void (**)(id, void *, void))a4;
  id v9 = objc_msgSend_processScopedClientProxyCreator(self, v7, v8);

  if (v9)
  {
    uint64_t v12 = objc_msgSend_processScopedClientProxyCreator(self, v10, v11);
    v6[2](v6, v12, 0);
  }
  else
  {
    uint64_t v13 = objc_msgSend_clientConnection(self, v10, v11);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = sub_1C4D5E9CC;
    v15[3] = &unk_1E64F0AE8;
    v15[4] = self;
    BOOL v16 = v6;
    objc_msgSend_getProcessScopedClientProxyCreatorSynchronous_completionHandler_(v13, v14, v4, v15);
  }
}

- (id)getFileMetadataWithFileHandle:(id)a3 openInfo:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v42 = 0;
  os_log_t v43 = &v42;
  uint64_t v44 = 0x3032000000;
  v45 = sub_1C4D5F04C;
  uint64_t v46 = sub_1C4D5F05C;
  id v47 = 0;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  uint64_t v39 = sub_1C4D5F04C;
  v40 = sub_1C4D5F05C;
  id v41 = 0;
  id v10 = dispatch_group_create();
  dispatch_group_enter(v10);
  uint64_t v11 = (void *)MEMORY[0x1C8789E70]();
  voucher_copy_without_importance();
  voucher_adopt();
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = sub_1C4D5F064;
  v33[3] = &unk_1E64F06A8;
  v35 = &v42;
  v34 = v10;
  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  v26 = sub_1C4D5F0C4;
  id v27 = &unk_1E64F0B38;
  id v12 = v8;
  id v28 = v12;
  id v13 = v9;
  id v29 = v13;
  v31 = &v36;
  v32 = &v42;
  id v14 = v34;
  uint64_t v30 = v14;
  objc_msgSend_getProcessScopedClientProxySynchronous_errorHandler_clientProxyHandler_(self, v15, 0, v33, &v24);

  dispatch_time_t v16 = dispatch_time(0, 150000000000);
  if (dispatch_group_wait(v14, v16))
  {
    uint64_t v18 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v17, *MEMORY[0x1E4F19DD8], 1000, @"Daemon timed out waiting for adopter process to get metadata for %@", v13, v24, v25, v26, v27);
    v19 = (void *)v43[5];
    v43[5] = v18;

    id v20 = 0;
    if (a5) {
      *a5 = (id) v43[5];
    }
  }
  else
  {
    if (!v37[5])
    {
      if (!v43[5])
      {
        uint64_t v21 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v17, *MEMORY[0x1E4F19DD8], 1000, @"Adopter failed to fetch metadata for %@", v13, v24, v25, v26, v27);
        v22 = (void *)v43[5];
        v43[5] = v21;
      }
      if (a5) {
        *a5 = (id) v43[5];
      }
    }
    id v20 = (id)v37[5];
  }

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);

  return v20;
}

- (void)handleSignificantIssueBehavior:(unint64_t)a3 reason:(id)a4
{
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1C4D5F2BC;
  v9[3] = &unk_1E64F0B80;
  id v10 = v6;
  unint64_t v11 = a3;
  id v7 = v6;
  objc_msgSend_getProcessScopedClientProxySynchronous_errorHandler_clientProxyHandler_(self, v8, 1, &unk_1F2042970, v9);
}

- (void)noteSystemIsAvailable
{
}

- (BOOL)hasValidatedEntitlements
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (self->_hasValidatedEntitlementsTernary == -1)
  {
    BOOL v4 = objc_msgSend_clientConnection(self, a2, v2);
    id v7 = objc_msgSend_xpcConnection(v4, v5, v6);
    id v10 = v7;
    if (v7) {
      objc_msgSend_auditToken(v7, v8, v9);
    }
    else {
      memset(&v15, 0, sizeof(v15));
    }
    unint64_t v11 = SecTaskCreateWithAuditToken(0, &v15);

    if (v11)
    {
      self->_hasValidatedEntitlementsTernary = SecTaskEntitlementsValidated();
      if (!CKBoolFromCKTernary()) {
        self->_hasValidatedEntitlementsTernary = (~SecTaskGetCodeSignStatus(v11) & 0x24000001) == 0;
      }
      if ((CKBoolFromCKTernary() & 1) == 0)
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        id v13 = *MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v17 = self;
          _os_log_impl(&dword_1C4CFF000, v13, OS_LOG_TYPE_INFO, "Binary has invalid entitlements for %@", buf, 0xCu);
        }
      }
      CFRelease(v11);
    }
    else
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      id v12 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1C4CFF000, v12, OS_LOG_TYPE_ERROR, "Unable to get SecTask for connection to determine entitlement validity", buf, 2u);
      }
    }
  }
  return CKBoolFromCKTernary();
}

- (BOOL)canOpenFileAtURL:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend_clientConnection(self, v5, v6);
  id v10 = objc_msgSend_xpcConnection(v7, v8, v9);

  if (v10
    && objc_msgSend_isFileURL(v4, v11, v12)
    && (objc_msgSend_path(v4, v13, v14),
        audit_token_t v15 = objc_claimAutoreleasedReturnValue(),
        uint64_t v18 = objc_msgSend_length(v15, v16, v17),
        v15,
        v18))
  {
    objc_msgSend_auditToken(v10, v19, v20);
    objc_msgSend_path(v4, v21, v22);
    id v23 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_fileSystemRepresentation(v23, v24, v25);
    BOOL v26 = sandbox_check_by_audit_token() == 0;
  }
  else
  {
    BOOL v26 = 0;
  }

  return v26;
}

- (NSString)processBinaryName
{
  return self->_processBinaryName;
}

- (BOOL)isSandboxed
{
  return self->_sandboxed;
}

- (void)setClientConnection:(id)a3
{
}

- (void)setClientSDKVersion:(unsigned int)a3
{
  self->_clientSDKVersion = a3;
}

- (void)setIsClientMainBundleAppleExecutable:(BOOL)a3
{
  self->_isClientMainBundleAppleExecutable = a3;
}

- (CKXPCProcessScopedClient)processScopedClientProxyCreator
{
  return (CKXPCProcessScopedClient *)objc_getProperty(self, a2, 56, 1);
}

- (void)setProcessScopedClientProxyCreator:(id)a3
{
}

- (NSDictionary)connectionEntitlements
{
  return self->_connectionEntitlements;
}

- (void)setConnectionEntitlements:(id)a3
{
}

- (int64_t)hasValidatedEntitlementsTernary
{
  return self->_hasValidatedEntitlementsTernary;
}

- (void)setHasValidatedEntitlementsTernary:(int64_t)a3
{
  self->_hasValidatedEntitlementsTernary = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionEntitlements, 0);
  objc_storeStrong((id *)&self->_processScopedClientProxyCreator, 0);
  objc_storeStrong((id *)&self->_clientEntitlements, 0);
  objc_destroyWeak((id *)&self->_clientConnection);
  objc_storeStrong((id *)&self->_procName, 0);
  objc_storeStrong((id *)&self->_processBinaryName, 0);
}

@end