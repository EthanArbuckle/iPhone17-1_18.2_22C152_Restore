@interface IMURLRequestSession
+ (IMURLRequestSession)sessionWithConfiguration:(id)a3 queue:(id)a4 requiresIDSHost:(BOOL)a5;
+ (IMURLRequestSession)sharedSession;
+ (IMURLRequestSession)sharedSessionRequiringIDSHost;
- (IMURLRequestSession)initWithConfiguration:(id)a3 queue:(id)a4 requiresIDSHost:(BOOL)a5;
- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)finishTasksAndInvalidate;
- (void)performRequest:(id)a3 completionBlock:(id)a4;
- (void)performRequest:(id)a3 completionBlockWithTimingData:(id)a4;
@end

@implementation IMURLRequestSession

+ (IMURLRequestSession)sharedSession
{
  if (qword_1E92DB830 != -1) {
    dispatch_once(&qword_1E92DB830, &unk_1EE22FD38);
  }
  v2 = (void *)qword_1E92DB828;
  return (IMURLRequestSession *)v2;
}

+ (IMURLRequestSession)sharedSessionRequiringIDSHost
{
  if (qword_1E92DB840 != -1) {
    dispatch_once(&qword_1E92DB840, &unk_1EE230938);
  }
  v2 = (void *)qword_1E92DB838;
  return (IMURLRequestSession *)v2;
}

+ (IMURLRequestSession)sessionWithConfiguration:(id)a3 queue:(id)a4 requiresIDSHost:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc((Class)a1);
  v12 = objc_msgSend_initWithConfiguration_queue_requiresIDSHost_(v10, v11, (uint64_t)v9, (uint64_t)v8, v5);

  return (IMURLRequestSession *)v12;
}

- (IMURLRequestSession)initWithConfiguration:(id)a3 queue:(id)a4 requiresIDSHost:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v19.receiver = self;
  v19.super_class = (Class)IMURLRequestSession;
  id v10 = [(IMURLRequestSession *)&v19 init];
  uint64_t v11 = (uint64_t)v10;
  if (v10)
  {
    v10->_requireIDSHost = a5;
    objc_storeStrong((id *)&v10->_sessionQueue, a4);
    id v12 = objc_alloc_init(MEMORY[0x1E4F28F08]);
    objc_msgSend_setUnderlyingQueue_(v12, v13, *(void *)(v11 + 16), v14);
    uint64_t v16 = objc_msgSend_sessionWithConfiguration_delegate_delegateQueue_(MEMORY[0x1E4F290E0], v15, (uint64_t)v8, v11, v12);
    v17 = *(void **)(v11 + 8);
    *(void *)(v11 + 8) = v16;
  }
  return (IMURLRequestSession *)v11;
}

- (void)finishTasksAndInvalidate
{
  objc_msgSend_finishTasksAndInvalidate(self->_session, a2, v2, v3);
}

- (void)performRequest:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1918CD850;
  v9[3] = &unk_1E57242A0;
  id v10 = v6;
  id v7 = v6;
  objc_msgSend_performRequest_completionBlockWithTimingData_(self, v8, (uint64_t)a3, (uint64_t)v9);
}

- (void)performRequest:(id)a3 completionBlockWithTimingData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = sub_1918CD9A0;
  v26 = sub_1918CD9B0;
  id v27 = 0;
  session = self->_session;
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  v18 = sub_1918CD9B8;
  objc_super v19 = &unk_1E57242C8;
  v21 = &v22;
  id v9 = v7;
  id v20 = v9;
  uint64_t v11 = objc_msgSend_dataTaskWithRequest_completionHandler_(session, v10, (uint64_t)v6, (uint64_t)&v16);
  id v12 = (void *)v23[5];
  v23[5] = v11;

  objc_msgSend_resume((void *)v23[5], v13, v14, v15, v16, v17, v18, v19);
  _Block_object_dispose(&v22, 8);
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  if (v8)
  {
    id v9 = objc_msgSend_URLLoading(IMIDSLog, v5, v6, v7);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412546;
      uint64_t v11 = self;
      __int16 v12 = 2112;
      id v13 = v8;
      _os_log_impl(&dword_191892000, v9, OS_LOG_TYPE_DEFAULT, "URLSession:didBecomeInvalidWithError: called with error {self: %@, error: %@}", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  uint64_t v151 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = (void (**)(id, uint64_t, void))a5;
  __int16 v12 = objc_msgSend_URLLoading(IMIDSLog, v9, v10, v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v135 = objc_msgSend_protectionSpace(v7, v13, v14, v15);
    v136 = self;
    objc_super v19 = objc_msgSend_realm(v135, v16, v17, v18);
    objc_msgSend_protectionSpace(v7, v20, v21, v22);
    v23 = v137 = v8;
    id v27 = objc_msgSend_host(v23, v24, v25, v26);
    v31 = objc_msgSend_protectionSpace(v7, v28, v29, v30);
    v35 = objc_msgSend_protocol(v31, v32, v33, v34);
    v39 = objc_msgSend_protectionSpace(v7, v36, v37, v38);
    v43 = objc_msgSend_authenticationMethod(v39, v40, v41, v42);
    v47 = objc_msgSend_proposedCredential(v7, v44, v45, v46);
    *(_DWORD *)buf = 138413314;
    *(void *)v144 = v19;
    *(_WORD *)&v144[8] = 2112;
    *(void *)&v144[10] = v27;
    __int16 v145 = 2112;
    v146 = v35;
    __int16 v147 = 2112;
    v148 = v43;
    __int16 v149 = 2112;
    v150 = v47;
    _os_log_impl(&dword_191892000, v12, OS_LOG_TYPE_DEFAULT, "Received authentication challenge:\n  ---->Protection Space: <Realm: %@, Host: %@, Protocol: %@, Method: %@>\n  ---->Proposed Credential: %@\n  Performing default handling.", buf, 0x34u);

    id v8 = v137;
    self = v136;
  }
  if (qword_1EB2737A0 != -1) {
    dispatch_once(&qword_1EB2737A0, &unk_1EE22FEF8);
  }
  if (byte_1EB273798 != 1 || !IMGetDomainBoolForKey(@"com.apple.ids", @"disableCertPinning"))
  {
    if (!self->_requireIDSHost) {
      goto LABEL_19;
    }
    v52 = objc_msgSend_protectionSpace(v7, v48, v49, v50);
    v56 = objc_msgSend_authenticationMethod(v52, v53, v54, v55);
    char isEqualToString = objc_msgSend_isEqualToString_(v56, v57, *MEMORY[0x1E4F28988], v58);

    if ((isEqualToString & 1) == 0)
    {
LABEL_24:
      v8[2](v8, 1, 0);
      goto LABEL_39;
    }
    v63 = objc_msgSend_protectionSpace(v7, v60, v61, v62);
    v67 = objc_msgSend_host(v63, v64, v65, v66);

    if (!v67)
    {
      v122 = objc_msgSend_URLLoading(IMIDSLog, v68, v69, v70);
      if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_191892000, v122, OS_LOG_TYPE_DEFAULT, "No hostname override - perform default handling", buf, 2u);
      }

      v8[2](v8, 1, 0);
      goto LABEL_38;
    }
    unint64_t __buf = 0xAAAAAAAAAAAAAAAALL;
    arc4random_buf(&__buf, 8uLL);
    v74 = objc_msgSend_URLLoading(IMIDSLog, v71, v72, v73);
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)v144 = v67;
      *(_WORD *)&v144[8] = 2048;
      *(void *)&v144[10] = __buf;
      _os_log_impl(&dword_191892000, v74, OS_LOG_TYPE_DEFAULT, "Validating server trust using designated hostname: %@ {identifier: %llu}", buf, 0x16u);
    }

    id v75 = objc_alloc(MEMORY[0x1E4F1CA48]);
    v78 = objc_msgSend_initWithCapacity_(v75, v76, 1, v77);
    v82 = objc_msgSend_sharedInstance(IMLockdownManager, v79, v80, v81);
    objc_msgSend_isInternalInstall(v82, v83, v84, v85);
    AppleIDSServiceContext = (const void *)SecPolicyCreateAppleIDSServiceContext();

    if (AppleIDSServiceContext)
    {
      objc_msgSend_addObject_(v78, v87, (uint64_t)AppleIDSServiceContext, v89);
      v93 = objc_msgSend_protectionSpace(v7, v90, v91, v92);
      v97 = (__SecTrust *)objc_msgSend_serverTrust(v93, v94, v95, v96);
      OSStatus v98 = SecTrustSetPolicies(v97, v78);

      if (!v98)
      {
        v123 = objc_msgSend_protectionSpace(v7, v99, v100, v101);
        v127 = (__SecTrust *)objc_msgSend_serverTrust(v123, v124, v125, v126);
        sessionQueue = self->_sessionQueue;
        result[0] = MEMORY[0x1E4F143A8];
        result[1] = 3221225472;
        result[2] = sub_1918CE298;
        result[3] = &unk_1E57242F0;
        unint64_t v141 = __buf;
        v129 = v8;
        id v140 = v129;
        id v139 = v7;
        OSStatus v130 = SecTrustEvaluateAsyncWithError(v127, sessionQueue, result);

        CFRelease(AppleIDSServiceContext);
        if (v130)
        {
          v134 = objc_msgSend_URLLoading(IMIDSLog, v131, v132, v133);
          if (os_log_type_enabled(v134, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)v144 = v130;
            *(_WORD *)&v144[4] = 2048;
            *(void *)&v144[6] = __buf;
            _os_log_impl(&dword_191892000, v134, OS_LOG_TYPE_DEFAULT, "SecTrustEvaluateAsyncWithError() failed to start status=%d {identifier: %llu}", buf, 0x12u);
          }

          v129[2](v129, 2, 0);
        }

        goto LABEL_37;
      }
      v102 = objc_msgSend_URLLoading(IMIDSLog, v99, v100, v101);
      if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v144 = v98;
        *(_WORD *)&v144[4] = 2048;
        *(void *)&v144[6] = __buf;
        v103 = "Unable to set policies %d {identifier: %llu}";
        v104 = v102;
        uint32_t v105 = 18;
LABEL_30:
        _os_log_impl(&dword_191892000, v104, OS_LOG_TYPE_DEFAULT, v103, buf, v105);
      }
    }
    else
    {
      v102 = objc_msgSend_URLLoading(IMIDSLog, v87, v88, v89);
      if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)v144 = __buf;
        v103 = "Unable to create SecPolicyRef {identifier: %llu}";
        v104 = v102;
        uint32_t v105 = 12;
        goto LABEL_30;
      }
    }

    v8[2](v8, 2, 0);
LABEL_37:

LABEL_38:
    goto LABEL_39;
  }
  v51 = objc_msgSend_URLLoading(IMIDSLog, v48, v49, v50);
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_191892000, v51, OS_LOG_TYPE_DEFAULT, "*********** Disable certificate pinning switch is ON !! ***********", buf, 2u);
  }

LABEL_19:
  v106 = objc_msgSend_URLLoading(IMIDSLog, v48, v49, v50);
  if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_191892000, v106, OS_LOG_TYPE_DEFAULT, "We do not require IDS host, allowing through", buf, 2u);
  }

  if (byte_1EB273798 != 1
    || !objc_msgSend_trustAnyCredential(IMUserDefaults, v107, v108, v109))
  {
    goto LABEL_24;
  }
  v113 = (void *)MEMORY[0x1E4F29098];
  v114 = objc_msgSend_protectionSpace(v7, v110, v111, v112);
  uint64_t v118 = objc_msgSend_serverTrust(v114, v115, v116, v117);
  v121 = objc_msgSend_credentialForTrust_(v113, v119, v118, v120);
  ((void (**)(id, uint64_t, void *))v8)[2](v8, 0, v121);

LABEL_39:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionQueue, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end