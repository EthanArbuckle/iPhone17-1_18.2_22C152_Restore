@interface CKDShareAccessRequestOperation
+ (id)nameForState:(unint64_t)a3;
- (BOOL)_shareAccessRequest;
- (BOOL)isEmail:(id)a3;
- (BOOL)isPhoneNumber:(id)a3;
- (BOOL)makeStateTransition;
- (CKDShareAccessRequestOperation)initWithOperationInfo:(id)a3 container:(id)a4;
- (NSMutableArray)shareURLsToRequestAccessFor;
- (id)activityCreate;
- (id)shareAccessRequestCompletionBlock;
- (int)operationType;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)_handleShareAccessRequestedForURL:(id)a3 responseCode:(id)a4;
- (void)_performCallbackForURL:(id)a3 error:(id)a4;
- (void)main;
- (void)setShareAccessRequestCompletionBlock:(id)a3;
- (void)setShareURLsToRequestAccessFor:(id)a3;
@end

@implementation CKDShareAccessRequestOperation

- (CKDShareAccessRequestOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CKDShareAccessRequestOperation;
  v7 = [(CKDDatabaseOperation *)&v24 initWithOperationInfo:v6 container:a4];
  if (v7)
  {
    uint64_t v8 = objc_opt_new();
    shareURLsToRequestAccessFor = v7->_shareURLsToRequestAccessFor;
    v7->_shareURLsToRequestAccessFor = (NSMutableArray *)v8;

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v12 = objc_msgSend_shareURLsToRequestAccessFor(v6, v10, v11, 0);
    uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v20, v25, 16);
    if (v14)
    {
      uint64_t v16 = v14;
      uint64_t v17 = *(void *)v21;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v21 != v17) {
            objc_enumerationMutation(v12);
          }
          objc_msgSend_addObject_(v7->_shareURLsToRequestAccessFor, v15, *(void *)(*((void *)&v20 + 1) + 8 * v18++));
        }
        while (v16 != v18);
        uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v20, v25, 16);
      }
      while (v16);
    }
  }
  return v7;
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_1C4CFF000, "daemon/share-access-request", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (BOOL)makeStateTransition
{
  uint64_t v4 = objc_msgSend_state(self, a2, v2);
  if (v4 == 2)
  {
    uint64_t v8 = objc_msgSend_shareURLsToRequestAccessFor(self, v5, v6);
    uint64_t v11 = objc_msgSend_count(v8, v9, v10);

    if (!v11) {
      return 0;
    }
    BOOL v13 = 1;
    objc_msgSend_setState_(self, v12, 1);
    return v13;
  }
  if (v4 != 1) {
    return 1;
  }
  objc_msgSend_setState_(self, v5, 2);
  return MEMORY[0x1F4181798](self, sel__shareAccessRequest, v7);
}

+ (id)nameForState:(unint64_t)a3
{
  if (a3 == 2)
  {
    v5 = @"Requesting Access to Shares";
  }
  else
  {
    uint64_t v8 = v3;
    uint64_t v9 = v4;
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___CKDShareAccessRequestOperation;
    objc_msgSendSuper2(&v7, sel_nameForState_);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)_performCallbackForURL:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v10 = objc_msgSend_shareURLsToRequestAccessFor(self, v8, v9);
  objc_msgSend_removeObject_(v10, v11, (uint64_t)v6);

  uint64_t v14 = objc_msgSend_callbackQueue(self, v12, v13);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4D4441C;
  block[3] = &unk_1E64F0120;
  block[4] = self;
  id v18 = v6;
  id v19 = v7;
  id v15 = v7;
  id v16 = v6;
  dispatch_async(v14, block);
}

- (void)_handleShareAccessRequestedForURL:(id)a3 responseCode:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_code(v7, v8, v9) == 1)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v12 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v49 = v6;
      _os_log_impl(&dword_1C4CFF000, v12, OS_LOG_TYPE_INFO, "Sucessfully requested access for share with URL %@", buf, 0xCu);
    }
    objc_msgSend__performCallbackForURL_error_(self, v13, (uint64_t)v6, 0);
  }
  else
  {
    uint64_t v14 = objc_msgSend_error(v7, v10, v11);
    uint64_t v17 = objc_msgSend_clientError(v14, v15, v16);
    int v20 = objc_msgSend_type(v17, v18, v19);

    long long v21 = (void *)*MEMORY[0x1E4F1A548];
    uint64_t v22 = *MEMORY[0x1E4F1A550];
    if (v20 == 7)
    {
      if (v22 != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v21);
      }
      long long v23 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v49 = v6;
        _os_log_impl(&dword_1C4CFF000, v23, OS_LOG_TYPE_INFO, "Zone busy failure for share with url %@.", buf, 0xCu);
      }
    }
    else
    {
      if (v22 != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v21);
      }
      objc_super v24 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
      {
        v25 = v24;
        v28 = objc_msgSend_error(v7, v26, v27);
        v31 = objc_msgSend_errorDescription(v28, v29, v30);
        *(_DWORD *)buf = 138412546;
        id v49 = v6;
        __int16 v50 = 2114;
        v51 = v31;
        _os_log_impl(&dword_1C4CFF000, v25, OS_LOG_TYPE_INFO, "Error requesting access for share with URL %@: %{public}@", buf, 0x16u);
      }
      v32 = (void *)MEMORY[0x1E4F1A280];
      uint64_t v33 = *MEMORY[0x1E4F19DD8];
      uint64_t v34 = sub_1C4E94D98(v7);
      v37 = objc_msgSend_request(self, v35, v36);
      v38 = sub_1C4E940D0(v37, v7);
      v41 = objc_msgSend_error(v7, v39, v40);
      v44 = objc_msgSend_errorDescription(v41, v42, v43);
      v46 = objc_msgSend_errorWithDomain_code_userInfo_format_(v32, v45, v33, v34, v38, @"Error requesting access to share %@: %@", v6, v44);

      objc_msgSend__performCallbackForURL_error_(self, v47, (uint64_t)v6, v46);
    }
  }
}

- (int)operationType
{
  return 219;
}

- (BOOL)isEmail:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28F60];
  id v4 = a3;
  id v6 = objc_msgSend_predicateWithFormat_(v3, v5, @"SELF MATCHES %@", @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}");
  char v8 = objc_msgSend_evaluateWithObject_(v6, v7, (uint64_t)v4);

  return v8;
}

- (BOOL)isPhoneNumber:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28F60];
  id v4 = a3;
  id v6 = objc_msgSend_predicateWithFormat_(v3, v5, @"SELF MATCHES %@", @"^\\+?[0-9]{6,15}$");
  char v8 = objc_msgSend_evaluateWithObject_(v6, v7, (uint64_t)v4);

  return v8;
}

- (BOOL)_shareAccessRequest
{
  uint64_t v146 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend_shareURLsToRequestAccessFor(self, a2, v2);
  uint64_t v6 = objc_msgSend_count(v3, v4, v5);

  if (v6)
  {
    uint64_t v9 = objc_msgSend_container(self, v7, v8);
    v12 = objc_msgSend_account(v9, v10, v11);

    BOOL v116 = v12 != 0;
    if (v12)
    {
      v115 = objc_msgSend_container(self, v13, v14);
      v124 = objc_opt_new();
      long long v132 = 0u;
      long long v133 = 0u;
      long long v134 = 0u;
      long long v135 = 0u;
      objc_msgSend_shareURLsToRequestAccessFor(self, v15, v16);
      id obj = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v125 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v132, v145, 16);
      if (v125)
      {
        uint64_t v123 = *(void *)v133;
        do
        {
          uint64_t v18 = 0;
          do
          {
            if (*(void *)v133 != v123) {
              objc_enumerationMutation(obj);
            }
            uint64_t v19 = *(void *)(*((void *)&v132 + 1) + 8 * v18);
            int v20 = objc_opt_new();
            id v21 = objc_alloc(MEMORY[0x1E4F29088]);
            long long v23 = objc_msgSend_initWithURL_resolvingAgainstBaseURL_(v21, v22, v19, 0);
            uint64_t v26 = objc_msgSend_path(v23, v24, v25);
            v29 = objc_msgSend_lastPathComponent(v26, v27, v28);
            v31 = objc_msgSend_substringFromIndex_(v29, v30, 3);

            memset(md, 0, sizeof(md));
            uint64_t v34 = (const void *)objc_msgSend_UTF8String(v31, v32, v33);
            CC_LONG v36 = objc_msgSend_lengthOfBytesUsingEncoding_(v31, v35, 4);
            CC_SHA256(v34, v36, (unsigned __int8 *)md);
            v38 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v37, (uint64_t)md, 32);
            objc_msgSend_setShortTokenHash_(v20, v39, (uint64_t)v38);

            v42 = objc_msgSend_path(v23, v40, v41);
            v45 = objc_msgSend_lastPathComponent(v42, v43, v44);
            v47 = objc_msgSend_substringToIndex_(v45, v46, 3);
            objc_msgSend_setRoutingKey_(v20, v48, (uint64_t)v47);

            id v49 = objc_alloc_init(CKDPUserInformationRequestAccess);
            __int16 v50 = objc_alloc_init(CKDPContactInformation);
            v53 = objc_msgSend_fullName(v12, v51, v52);
            v56 = objc_msgSend_givenName(v53, v54, v55);
            objc_msgSend_setFirstName_(v50, v57, (uint64_t)v56);

            v60 = objc_msgSend_fullName(v12, v58, v59);
            v63 = objc_msgSend_familyName(v60, v61, v62);
            objc_msgSend_setLastName_(v50, v64, (uint64_t)v63);

            v67 = objc_msgSend_username(v12, v65, v66);
            LODWORD(v63) = objc_msgSend_isEmail_(self, v68, (uint64_t)v67);

            if (v63)
            {
              v71 = objc_msgSend_username(v12, v69, v70);
              objc_msgSend_setEmailAddress_(v50, v72, (uint64_t)v71);
            }
            v73 = objc_msgSend_username(v12, v69, v70, v115);
            int isPhoneNumber = objc_msgSend_isPhoneNumber_(self, v74, (uint64_t)v73);

            if (isPhoneNumber)
            {
              v78 = objc_msgSend_username(v12, v76, v77);
              objc_msgSend_setPhoneNumber_(v50, v79, (uint64_t)v78);
            }
            v80 = objc_msgSend_accountID(v12, v76, v77);
            objc_msgSend_setContainerScopedUserId_(v50, v81, (uint64_t)v80);

            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            v82 = (void *)*MEMORY[0x1E4F1A500];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
            {
              log = v82;
              v121 = objc_msgSend_fullName(v12, v88, v89);
              v118 = objc_msgSend_givenName(v121, v90, v91);
              v120 = objc_msgSend_fullName(v12, v92, v93);
              v117 = objc_msgSend_familyName(v120, v94, v95);
              v98 = objc_msgSend_username(v12, v96, v97);
              v101 = objc_msgSend_accountID(v12, v99, v100);
              *(_DWORD *)buf = 138413058;
              v137 = v118;
              __int16 v138 = 2112;
              v139 = v117;
              __int16 v140 = 2112;
              v141 = v98;
              __int16 v142 = 2112;
              v143 = v101;
              _os_log_debug_impl(&dword_1C4CFF000, log, OS_LOG_TYPE_DEBUG, "Account info for requester. First Name: %@ Family Name: %@ Username: %@ AccountID %@", buf, 0x2Au);
            }
            objc_msgSend_setContactInformation_(v49, v83, (uint64_t)v50);
            objc_msgSend_setUserInformationRequestAccess_(v20, v84, (uint64_t)v49);
            objc_msgSend_setShareURL_(v20, v85, v19);
            objc_msgSend_addObject_(v124, v86, (uint64_t)v20);

            ++v18;
          }
          while (v125 != v18);
          uint64_t v125 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v87, (uint64_t)&v132, v145, 16);
        }
        while (v125);
      }

      v102 = [CKDShareAccessRequestURLRequest alloc];
      v104 = objc_msgSend_initWithOperation_shareMetadatasToRequestAccess_(v102, v103, (uint64_t)self, v124);
      objc_initWeak((id *)buf, self);
      objc_initWeak((id *)md, v104);
      v107 = objc_msgSend_stateTransitionGroup(self, v105, v106);
      dispatch_group_enter(v107);

      v130[0] = MEMORY[0x1E4F143A8];
      v130[1] = 3221225472;
      v130[2] = sub_1C4D450E0;
      v130[3] = &unk_1E64F0148;
      objc_copyWeak(&v131, (id *)buf);
      objc_msgSend_setShareAccessRequestedBlock_(v104, v108, (uint64_t)v130);
      v127[0] = MEMORY[0x1E4F143A8];
      v127[1] = 3221225472;
      v127[2] = sub_1C4D45158;
      v127[3] = &unk_1E64F0170;
      objc_copyWeak(&v128, (id *)buf);
      objc_copyWeak(&v129, (id *)md);
      objc_msgSend_setCompletionBlock_(v104, v109, (uint64_t)v127);
      objc_msgSend_setRequest_(self, v110, (uint64_t)v104);
      objc_msgSend_performRequest_(v115, v111, (uint64_t)v104);
      objc_destroyWeak(&v129);
      objc_destroyWeak(&v128);
      objc_destroyWeak(&v131);
      objc_destroyWeak((id *)md);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v113 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C4CFF000, v113, OS_LOG_TYPE_INFO, "User does not have a valid account to request access for", buf, 2u);
      }
    }
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v112 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C4CFF000, v112, OS_LOG_TYPE_INFO, "No share URLs to request access for", buf, 2u);
    }
    return 0;
  }
  return v116;
}

- (void)main
{
  id v4 = objc_msgSend_shareURLsToRequestAccessFor(self, a2, v2);
  BOOL v7 = objc_msgSend_count(v4, v5, v6) == 0;

  objc_msgSend_makeStateTransition_(self, v8, v7);
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4 = a3;
  objc_msgSend_setShareAccessRequestCompletionBlock_(self, v5, 0);
  v6.receiver = self;
  v6.super_class = (Class)CKDShareAccessRequestOperation;
  [(CKDOperation *)&v6 _finishOnCallbackQueueWithError:v4];
}

- (id)shareAccessRequestCompletionBlock
{
  return self->_shareAccessRequestCompletionBlock;
}

- (void)setShareAccessRequestCompletionBlock:(id)a3
{
}

- (NSMutableArray)shareURLsToRequestAccessFor
{
  return self->_shareURLsToRequestAccessFor;
}

- (void)setShareURLsToRequestAccessFor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareURLsToRequestAccessFor, 0);
  objc_storeStrong(&self->_shareAccessRequestCompletionBlock, 0);
}

@end