@interface FBSystemService
+ (NSString)currentOpenApplicationInstance;
+ (id)_sharedInstanceCreatingIfNecessary:(uint64_t)a1;
+ (id)sharedInstance;
+ (id)sharedInstanceIfExists;
+ (void)currentOpenApplicationInstance;
- (BOOL)_isAllowListedLaunchSuspendedApp:(id)a3;
- (BOOL)_isTrustedRequest:(id)a3 forCaller:(id)a4 fromClient:(id)a5 forBundleInfo:(id)a6 withOptions:(id)a7 fatalError:(id *)a8;
- (BOOL)_shouldPendRequestForClientSequenceNumber:(unint64_t)a3 clientCacheGUID:(id)a4 ourSequenceNumber:(unint64_t)a5 ourCacheGUID:(id)a6;
- (BOOL)isPendingExit;
- (FBSApplicationInfoProvider)_applicationInfoProvider;
- (FBSSerialQueue)queue;
- (FBSystemService)init;
- (FBSystemService)initWithQueue:(id)a3;
- (FBSystemServiceDelegate)delegate;
- (unint64_t)_mapShutdownOptionsToOptions:(id)a3;
- (void)_activateBundleID:(id)a3 requestID:(id)a4 isTrusted:(BOOL)a5 options:(id)a6 serviceInstance:(id)a7 source:(id)a8 originalSource:(id)a9 withResult:(id)a10;
- (void)_performExitTasksForRelaunch:(BOOL)a3;
- (void)_reallyActivateApplication:(id)a3 requestID:(id)a4 options:(id)a5 serviceInstance:(id)a6 source:(id)a7 originalSource:(id)a8 isTrusted:(BOOL)a9 sequenceNumber:(unint64_t)a10 cacheGUID:(id)a11 ourSequenceNumber:(unint64_t)a12 ourCacheGUID:(id)a13 withResult:(id)a14;
- (void)_setInfoProvider;
- (void)_terminateProcesses:(id)a3 forReason:(int64_t)a4 andReport:(BOOL)a5 withDescription:(id)a6 completion:(id)a7;
- (void)canOpenApplication:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)exitAndRelaunch:(BOOL)a3;
- (void)exitAndRelaunch:(BOOL)a3 withOptions:(unint64_t)a4;
- (void)handleActions:(id)a3 source:(id)a4 withResult:(id)a5;
- (void)isPasscodeLockedOrBlockedWithResult:(id)a3;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)openApplication:(id)a3 withOptions:(id)a4 originator:(id)a5 requestID:(id)a6 completion:(id)a7;
- (void)prepareDisplaysForExit;
- (void)prepareForExitAndRelaunch:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setPendingExit:(BOOL)a3;
- (void)setSystemIdleSleepDisabled:(BOOL)a3 forReason:(id)a4;
- (void)shutdownAndReboot:(BOOL)a3;
- (void)shutdownUsingOptions:(id)a3;
- (void)shutdownWithOptions:(id)a3 origin:(id)a4;
- (void)shutdownWithOptions:(unint64_t)a3;
- (void)shutdownWithOptions:(unint64_t)a3 forSource:(int64_t)a4;
- (void)terminateApplication:(id)a3 forReason:(int64_t)a4 andReport:(BOOL)a5 withDescription:(id)a6 completion:(id)a7;
- (void)terminateApplicationGroup:(int64_t)a3 forReason:(int64_t)a4 andReport:(BOOL)a5 withDescription:(id)a6 completion:(id)a7;
@end

@implementation FBSystemService

uint64_t __61__FBSystemService_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

void __79__FBSystemService_openApplication_withOptions_originator_requestID_completion___block_invoke_216(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 96);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 72);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __79__FBSystemService_openApplication_withOptions_originator_requestID_completion___block_invoke_2_217;
  v9[3] = &unk_1E5C4A258;
  uint64_t v8 = *(void *)(a1 + 80);
  id v10 = *(id *)(a1 + 88);
  [v1 _activateBundleID:v2 requestID:v4 isTrusted:v3 options:v5 serviceInstance:v6 source:v7 originalSource:v8 withResult:v9];
}

- (void)_activateBundleID:(id)a3 requestID:(id)a4 isTrusted:(BOOL)a5 options:(id)a6 serviceInstance:(id)a7 source:(id)a8 originalSource:(id)a9 withResult:(id)a10
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v61 = a6;
  id v54 = a7;
  id v63 = a8;
  id v18 = a9;
  id v19 = a10;
  v55 = self;
  [(FBSSerialQueue *)self->_queue assertOnQueue];
  if (!v16)
  {
    v47 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"bundleID != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSystemService _activateBundleID:requestID:isTrusted:options:serviceInstance:source:originalSource:withResult:]();
    }
    }
    [v47 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6306CE0);
  }
  if (!v17)
  {
    v48 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"requestID != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSystemService _activateBundleID:requestID:isTrusted:options:serviceInstance:source:originalSource:withResult:]();
    }
    }
    [v48 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6306D44);
  }
  v58 = v17;
  if (!v63)
  {
    v49 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"sourceToken != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSystemService _activateBundleID:requestID:isTrusted:options:serviceInstance:source:originalSource:withResult:]();
    }
    }
    [v49 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6306DA8);
  }
  if (!v18)
  {
    v50 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"originalSourceToken != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSystemService _activateBundleID:requestID:isTrusted:options:serviceInstance:source:originalSource:withResult:].cold.4();
    }
    }
    [v50 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6306E0CLL);
  }
  if (!v19)
  {
    v51 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"resultBlock != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSystemService _activateBundleID:requestID:isTrusted:options:serviceInstance:source:originalSource:withResult:].cold.5();
    }
    }
    [v51 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6306E70);
  }
  v20 = v16;
  v21 = FBSystemAppBundleID();
  int v22 = [v16 isEqualToString:v21];

  if (v22)
  {
    v23 = FBLogCommon();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v17;
      _os_log_impl(&dword_1A62FC000, v23, OS_LOG_TYPE_DEFAULT, "[FBSystemService][%{public}@] Open request is targeting the system app itself; swizzling bundleID to nil.",
        buf,
        0xCu);
    }

    v20 = 0;
  }
  v24 = [v61 dictionary];
  v25 = [v24 objectForKey:*MEMORY[0x1E4F62698]];
  [v25 doubleValue];
  double v27 = v26;
  double v28 = CACurrentMediaTime();
  BOOL v29 = v27 <= 0.0 || v25 == 0;
  int v30 = v29;
  double v31 = fmin(v27, 30.0);
  if (v29) { {
    double v32 = -0.0;
  }
  }
  else {
    double v32 = v31;
  }
  if (v29) { {
    double v33 = v27;
  }
  }
  else {
    double v33 = v31;
  }
  v60 = [v24 objectForKey:*MEMORY[0x1E4F62638]];
  v65 = [v24 objectForKey:*MEMORY[0x1E4F62630]];
  double v34 = v28 + v32;
  v53 = v25;
  if (v65)
  {
    uint64_t v35 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v65];
    v36 = (void *)v35;
    if (v60) { {
      int v37 = v30;
    }
    }
    else {
      int v37 = 0;
    }
    if (v37 == 1 && v35)
    {
      double v33 = fmin(fmax(v33, 0.0), 2.0);
      double v34 = v34 + v33;
      uint64_t v57 = 0x3FE0000000000000;
      goto LABEL_32;
    }
  }
  else
  {
    v36 = 0;
  }
  uint64_t v57 = 0x4000000000000000;
  if (v30)
  {
    v38 = v24;
    char v39 = 0;
    goto LABEL_35;
  }
LABEL_32:
  v40 = FBLogCommon();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    *(void *)&buf[4] = v58;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v20;
    *(_WORD *)&buf[22] = 2048;
    v86 = *(uint64_t (**)(uint64_t, uint64_t))&v33;
    LOWORD(v87) = 2048;
    *(void *)((char *)&v87 + 2) = v57;
    _os_log_impl(&dword_1A62FC000, v40, OS_LOG_TYPE_DEFAULT, "[FBSystemService][%{public}@] Activation request for %{public}@ will wait %.2fs for app availability, with retry every %.2fs.", buf, 0x2Au);
  }

  v38 = v24;
  char v39 = 1;
LABEL_35:
  v83[0] = 0;
  v83[1] = v83;
  v83[2] = 0x2020000000;
  char v84 = 0;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v86 = __Block_byref_object_copy__2;
  *(void *)&long long v87 = __Block_byref_object_dispose__2;
  *((void *)&v87 + 1) = 0;
  v66[0] = MEMORY[0x1E4F143A8];
  v66[1] = 3221225472;
  v66[2] = __114__FBSystemService__activateBundleID_requestID_isTrusted_options_serviceInstance_source_originalSource_withResult___block_invoke;
  v66[3] = &unk_1E5C4A050;
  v66[4] = v55;
  id v52 = v20;
  id v67 = v52;
  v76 = v83;
  v77 = buf;
  id v56 = v58;
  id v68 = v56;
  id v59 = v61;
  id v69 = v59;
  id v62 = v54;
  id v70 = v62;
  id v64 = v63;
  id v71 = v64;
  id v41 = v18;
  id v72 = v41;
  BOOL v81 = a5;
  id v42 = v60;
  id v73 = v42;
  id v43 = v36;
  id v74 = v43;
  char v82 = v39;
  double v78 = v28;
  double v79 = v34;
  uint64_t v80 = v57;
  id v44 = v19;
  id v75 = v44;
  uint64_t v45 = [v66 copy];
  v46 = *(void **)(*(void *)&buf[8] + 40);
  *(void *)(*(void *)&buf[8] + 40) = v45;

  (*(void (**)(void))(*(void *)(*(void *)&buf[8] + 40) + 16))();
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(v83, 8);
}

void __79__FBSystemService_openApplication_withOptions_originator_requestID_completion___block_invoke_198(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if (([v6 isEqualToString:*MEMORY[0x1E4F62620]] & 1) != 0
    || ([v6 isEqualToString:*MEMORY[0x1E4F626B0]] & 1) != 0
    || ([v6 isEqualToString:*MEMORY[0x1E4F62668]] & 1) != 0
    || ([v6 isEqualToString:*MEMORY[0x1E4F62608]] & 1) != 0
    || ([v6 isEqualToString:*MEMORY[0x1E4F62610]] & 1) != 0
    || [v6 hasSuffix:@"4LS"])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (void)openApplication:(id)a3 withOptions:(id)a4 originator:(id)a5 requestID:(id)a6 completion:(id)a7
{
  uint64_t v162 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = [MEMORY[0x1E4F62880] currentContext];
  id v17 = [v16 remoteProcess];

  if (!v13 || ([v17 hasEntitlement:*MEMORY[0x1E4F625C8]] & 1) == 0)
  {
    id v18 = v17;

    id v13 = v18;
  }
  if (!v11)
  {
    FBSystemAppBundleID();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v19 = +[FBProcessManager sharedInstance];
  v117 = [v19 registerProcessForHandle:v13];

  v20 = FBSProcessPrettyDescription();
  id v21 = objc_alloc_init(MEMORY[0x1E4F627E8]);
  v142[0] = MEMORY[0x1E4F143A8];
  v142[1] = 3221225472;
  v142[2] = __79__FBSystemService_openApplication_withOptions_originator_requestID_completion___block_invoke;
  v142[3] = &unk_1E5C4A1B8;
  id v116 = v21;
  id v143 = v116;
  id v22 = v14;
  id v144 = v22;
  id v23 = v11;
  id v145 = v23;
  id v24 = v12;
  id v146 = v24;
  id v25 = v20;
  id v147 = v25;
  id v115 = v15;
  id v148 = v115;
  double v26 = (void (**)(void, void, void))MEMORY[0x1AD0B8C50](v142);
  if (v13 && ([v13 isValid] & 1) != 0)
  {
    uint64_t v138 = 0;
    v139 = &v138;
    uint64_t v140 = 0x2020000000;
    char v141 = 0;
    double v27 = [v24 dictionary];
    v137[0] = MEMORY[0x1E4F143A8];
    v137[1] = 3221225472;
    v137[2] = __79__FBSystemService_openApplication_withOptions_originator_requestID_completion___block_invoke_198;
    v137[3] = &unk_1E5C4A1E0;
    v137[4] = &v138;
    [v27 enumerateKeysAndObjectsUsingBlock:v137];

    if (*((unsigned char *)v139 + 24) && ([v17 hasEntitlement:*MEMORY[0x1E4F625C8]] & 1) == 0)
    {
      char v39 = FBSOpenApplicationErrorCreate();
      ((void (**)(void, uint64_t, void *))v26)[2](v26, 4, v39);
LABEL_74:

      _Block_object_dispose(&v138, 8);
      goto LABEL_75;
    }
    v112 = [v24 url];
    double v28 = [v17 auditToken];
    BOOL v29 = [v13 auditToken];
    char v30 = [v28 isEqual:v29];

    if (v30)
    {
      if (v112)
      {
        double v31 = FBLogCommon();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          id v32 = [v112 scheme];
          double v33 = [v112 resourceSpecifier];
          *(_DWORD *)buf = 138544387;
          id v151 = v22;
          __int16 v152 = 2114;
          uint64_t v153 = (uint64_t)v23;
          __int16 v154 = 2114;
          uint64_t v155 = (uint64_t)v32;
          __int16 v156 = 2117;
          uint64_t v157 = (uint64_t)v33;
          __int16 v158 = 2114;
          id v159 = v25;
          _os_log_impl(&dword_1A62FC000, v31, OS_LOG_TYPE_DEFAULT, "[FBSystemService][%{public}@] Received request to open \"%{public}@\" with url \"%{public}@:%{sensitive}@\" from %{public}@.", buf, 0x34u);
        }
      }
      else
      {
        double v31 = FBLogCommon();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          id v151 = v22;
          __int16 v152 = 2114;
          uint64_t v153 = (uint64_t)v23;
          __int16 v154 = 2114;
          uint64_t v155 = (uint64_t)v25;
          _os_log_impl(&dword_1A62FC000, v31, OS_LOG_TYPE_DEFAULT, "[FBSystemService][%{public}@] Received request to open \"%{public}@\" from %{public}@.", buf, 0x20u);
        }
      }
    }
    else if (v112)
    {
      double v31 = FBLogCommon();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        id v35 = [v112 scheme];
        id v36 = [v112 resourceSpecifier];
        uint64_t v37 = FBSProcessPrettyDescription();
        *(_DWORD *)buf = 138544643;
        id v151 = v22;
        __int16 v152 = 2114;
        uint64_t v153 = (uint64_t)v23;
        __int16 v154 = 2114;
        v110 = v35;
        uint64_t v155 = (uint64_t)v35;
        __int16 v156 = 2117;
        uint64_t v157 = (uint64_t)v36;
        __int16 v158 = 2114;
        id v159 = v25;
        __int16 v160 = 2114;
        v38 = (void *)v37;
        uint64_t v161 = v37;
        _os_log_impl(&dword_1A62FC000, v31, OS_LOG_TYPE_DEFAULT, "[FBSystemService][%{public}@] Received request to open \"%{public}@\" with url \"%{public}@:%{sensitive}@\" from %{public}@ on behalf of %{public}@.", buf, 0x3Eu);
      }
    }
    else
    {
      double v31 = FBLogCommon();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v40 = FBSProcessPrettyDescription();
        *(_DWORD *)buf = 138544130;
        id v151 = v22;
        __int16 v152 = 2114;
        uint64_t v153 = (uint64_t)v23;
        __int16 v154 = 2114;
        uint64_t v155 = (uint64_t)v25;
        __int16 v156 = 2114;
        uint64_t v157 = (uint64_t)v40;
        _os_log_impl(&dword_1A62FC000, v31, OS_LOG_TYPE_DEFAULT, "[FBSystemService][%{public}@] Received request to open \"%{public}@\" from %{public}@ on behalf of %{public}@.", buf, 0x2Au);
      }
    }

    v111 = [v24 actions];
    if ([v111 count])
    {
      id v41 = FBLogCommon();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        id v42 = objc_msgSend(v111, "fbs_singleLineDescriptionOfBSActions");
        *(_DWORD *)buf = 138543618;
        id v151 = v22;
        __int16 v152 = 2114;
        uint64_t v153 = (uint64_t)v42;
        _os_log_impl(&dword_1A62FC000, v41, OS_LOG_TYPE_DEFAULT, "[FBSystemService][%{public}@] Request contains action(s): %{public}@", buf, 0x16u);
      }
    }
    id v43 = [v24 dictionary];
    uint64_t v44 = *MEMORY[0x1E4F625D8];
    uint64_t v45 = [v43 objectForKey:*MEMORY[0x1E4F625D8]];
    BOOL v46 = v45 == 0;

    if (v46)
    {
LABEL_54:
      if (!v112) { {
        goto LABEL_62;
      }
      }
      double v79 = [v13 auditToken];
      uint64_t v80 = v79;
      if (v79)
      {
        [v79 realToken];
      }
      else
      {
        long long v135 = 0u;
        long long v136 = 0u;
      }
      BOOL v81 = sandbox_check_by_audit_token() == 0;

      if (v81)
      {
LABEL_62:
        v85 = [v24 dictionary];
        uint64_t v107 = [v85 objectForKey:*MEMORY[0x1E4F62638]];
        uint64_t v86 = [v85 objectForKey:*MEMORY[0x1E4F62630]];
        v109 = v85;
        v105 = (void *)v86;
        if ((v107 != 0) == (v86 != 0))
        {
          if (v86)
          {
            uint64_t v88 = FBLogCommon();
            if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138544130;
              id v151 = v22;
              __int16 v152 = 2114;
              uint64_t v153 = (uint64_t)v23;
              __int16 v154 = 2114;
              uint64_t v155 = (uint64_t)v105;
              __int16 v156 = 2114;
              uint64_t v157 = v107;
              _os_log_impl(&dword_1A62FC000, v88, OS_LOG_TYPE_DEFAULT, "[FBSystemService][%{public}@] Activation request for %{public}@ contained LSCacheGUID %{public}@ and LSSequenceNumber %{public}@.", buf, 0x2Au);
            }
          }
          v89 = [MEMORY[0x1E4F62880] currentContext];
          v102 = [v89 instance];

          id v90 = objc_alloc(MEMORY[0x1E4F627C8]);
          v91 = (void *)MEMORY[0x1E4F627D0];
          v133[0] = MEMORY[0x1E4F143A8];
          v133[1] = 3221225472;
          v133[2] = __79__FBSystemService_openApplication_withOptions_originator_requestID_completion___block_invoke_214;
          v133[3] = &unk_1E5C4A208;
          v92 = v26;
          id v134 = v92;
          v93 = [v91 responderWithHandler:v133];
          v94 = (void *)[v90 initWithInfo:0 responder:v93];

          v130[0] = MEMORY[0x1E4F143A8];
          v130[1] = 3221225472;
          v130[2] = __79__FBSystemService_openApplication_withOptions_originator_requestID_completion___block_invoke_2;
          v130[3] = &unk_1E5C4A230;
          v132 = v92;
          id v101 = v94;
          id v131 = v101;
          v95 = (void *)MEMORY[0x1AD0B8C50](v130);
          v96 = [(FBSystemService *)self _applicationInfoProvider];
          v118[0] = MEMORY[0x1E4F143A8];
          v118[1] = 3221225472;
          v118[2] = __79__FBSystemService_openApplication_withOptions_originator_requestID_completion___block_invoke_3;
          v118[3] = &unk_1E5C4A2A8;
          id v97 = v96;
          id v119 = v97;
          id v120 = v23;
          id v121 = v22;
          id v122 = v105;
          v123 = self;
          id v124 = v17;
          id v125 = v13;
          id v126 = v109;
          id v127 = v24;
          id v87 = v102;
          id v128 = v87;
          id v114 = v95;
          id v129 = v114;
          v98 = (void (**)(void))MEMORY[0x1AD0B8C50](v118);
          if (objc_opt_respondsToSelector()) { {
            [v97 synchronize:v98];
          }
          }
          else {
            v98[2](v98);
          }
        }
        else
        {
          FBSOpenApplicationErrorCreate();
          id v87 = (id)objc_claimAutoreleasedReturnValue();
          ((void (**)(void, uint64_t, id))v26)[2](v26, 4, v87);
        }

        char v84 = (void *)v107;
      }
      else
      {
        char v82 = FBLogCommon();
        if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
        {
          v83 = FBSProcessPrettyDescription();
          *(_DWORD *)buf = 138543618;
          id v151 = v22;
          __int16 v152 = 2114;
          uint64_t v153 = (uint64_t)v83;
          _os_log_impl(&dword_1A62FC000, v82, OS_LOG_TYPE_DEFAULT, "[FBSystemService][%{public}@] Caller \"%{public}@\" has a sandbox that does not allow opening URL's.", buf, 0x16u);
        }
        v109 = FBSProcessPrettyDescription();
        char v84 = FBSOpenApplicationErrorCreate();
        ((void (**)(void, uint64_t, void *))v26)[2](v26, 4, v84);
      }

      char v39 = v112;
      goto LABEL_74;
    }
    v47 = [v24 dictionary];
    v106 = [v47 objectForKey:v44];

    v48 = [v117 applicationInfo];
    v108 = [v48 advertisingAttributionReportEndpoint];

    if (!v108)
    {
      v58 = FBLogCommon();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) { {
        -[FBSystemService openApplication:withOptions:originator:requestID:completion:]((uint64_t)v22, v58, v59, v60, v61, v62, v63, v64);
      }
      }

      [v24 _updateOption:0 forKey:v44];
      goto LABEL_53;
    }
    v49 = [v106 eventMessage];
    v104 = v49;
    v50 = v49;
    if (v49)
    {
      uint64_t v51 = [v49 originIdentifier];
      uint64_t v52 = [v50 context];
      if (v51 != 0xC181BADB23D8497BLL || v52)
      {
        v65 = FBLogCommon();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
        {
          uint64_t v103 = [v104 originIdentifier];
          uint64_t v99 = [v104 context];
          *(_DWORD *)buf = 138543874;
          id v151 = v22;
          __int16 v152 = 2048;
          uint64_t v153 = v103;
          __int16 v154 = 2048;
          uint64_t v155 = v99;
          _os_log_error_impl(&dword_1A62FC000, v65, OS_LOG_TYPE_ERROR, "[FBSystemService][%{public}@] Ignoring click attribution with invalid origin (%llx) or context (%llx).", buf, 0x20u);
        }
      }
      else
      {
        unint64_t v53 = [v104 timestamp];
        if (v53 <= openApplication_withOptions_originator_requestID_completion__sLastSeenBackBoardTimestamp)
        {
          v65 = FBLogCommon();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) { {
            -[FBSystemService openApplication:withOptions:originator:requestID:completion:].cold.4((uint64_t)v22, v65, v72, v73, v74, v75, v76, v77);
          }
          }
        }
        else
        {
          openApplication_withOptions_originator_requestID_completion__sLastSeenBackBoardTimestamp = v53;
          id v54 = [MEMORY[0x1E4F4F2A0] sharedInstance];
          uint64_t v55 = [v54 authenticateMessage:v104];

          if ((v55 & 0xFFFFFFFFFFFFFFFELL) == 2)
          {
            id v56 = FBLogCommon();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              id v151 = v22;
              _os_log_impl(&dword_1A62FC000, v56, OS_LOG_TYPE_DEFAULT, "[FBSystemService][%{public}@] Request contains valid click attribution.", buf, 0xCu);
            }

            uint64_t v57 = [v106 clickAttributionWithReportEndpoint:v108];
            [v24 _updateOption:v57 forKey:v44];

            goto LABEL_52;
          }
          v65 = FBLogCommon();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
          {
            double v78 = NSStringFromBKSHIDEventAuthenticationStatus();
            -[FBSystemService openApplication:withOptions:originator:requestID:completion:]((uint64_t)v22, v78, v149, v65);
          }
        }
      }
    }
    else
    {
      v65 = FBLogCommon();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) { {
        -[FBSystemService openApplication:withOptions:originator:requestID:completion:]((uint64_t)v22, v65, v66, v67, v68, v69, v70, v71);
      }
      }
    }

    [v24 _updateOption:0 forKey:v44];
LABEL_52:

LABEL_53:
    goto LABEL_54;
  }
  v100 = FBSProcessPrettyDescription();
  double v34 = FBSOpenApplicationErrorCreate();
  ((void (**)(void, uint64_t, void *))v26)[2](v26, 4, v34);

LABEL_75:
}

void __114__FBSystemService__activateBundleID_requestID_isTrusted_options_serviceInstance_source_originalSource_withResult___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _applicationInfoProvider];
  uint64_t v3 = [v2 applicationInfoForBundleIdentifier:*(void *)(a1 + 40)];

  uint64_t v4 = [v3 sequenceNumber];
  BOOL v29 = v3;
  uint64_t v5 = [v3 cacheGUID];
  id v6 = (void *)v5;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 112) + 8) + 24))
  {
    uint64_t v7 = [MEMORY[0x1E4F223B8] applicationProxyForIdentifier:*(void *)(a1 + 40)];
    uint64_t v27 = [v7 sequenceNumber];
    uint64_t v8 = [v7 cacheGUID];

    double v28 = (void *)v8;
  }
  else
  {
    uint64_t v27 = v4;
    double v28 = (void *)v5;
  }
  id v9 = objc_alloc(MEMORY[0x1E4F627C8]);
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __114__FBSystemService__activateBundleID_requestID_isTrusted_options_serviceInstance_source_originalSource_withResult___block_invoke_2;
  v41[3] = &unk_1E5C4A000;
  v41[4] = *(void *)(a1 + 120);
  id v10 = [MEMORY[0x1E4F627D0] responderWithHandler:v41];
  id v11 = (void *)[v9 initWithInfo:0 responder:v10];

  uint64_t v25 = *(void *)(a1 + 40);
  double v26 = *(void **)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 56);
  uint64_t v24 = *(void *)(a1 + 48);
  uint64_t v13 = *(void *)(a1 + 64);
  uint64_t v14 = *(void *)(a1 + 72);
  char v15 = *(unsigned char *)(a1 + 152);
  uint64_t v16 = *(void *)(a1 + 80);
  uint64_t v17 = [*(id *)(a1 + 88) unsignedIntegerValue];
  uint64_t v18 = *(void *)(a1 + 96);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __114__FBSystemService__activateBundleID_requestID_isTrusted_options_serviceInstance_source_originalSource_withResult___block_invoke_3;
  v30[3] = &unk_1E5C4A028;
  id v31 = v11;
  char v40 = *(unsigned char *)(a1 + 153);
  id v32 = *(id *)(a1 + 48);
  id v19 = *(id *)(a1 + 40);
  uint64_t v20 = *(void *)(a1 + 32);
  id v33 = v19;
  uint64_t v34 = v20;
  uint64_t v39 = *(void *)(a1 + 144);
  long long v21 = *(_OWORD *)(a1 + 128);
  int8x16_t v37 = vextq_s8(*(int8x16_t *)(a1 + 112), *(int8x16_t *)(a1 + 112), 8uLL);
  long long v38 = v21;
  id v35 = *(id *)(a1 + 72);
  id v36 = *(id *)(a1 + 104);
  id v22 = v11;
  LOBYTE(v23) = v15;
  [v26 _reallyActivateApplication:v25 requestID:v24 options:v12 serviceInstance:v13 source:v14 originalSource:v16 isTrusted:v23 sequenceNumber:v17 cacheGUID:v18 ourSequenceNumber:v27 ourCacheGUID:v28 withResult:v30];
}

- (void)_reallyActivateApplication:(id)a3 requestID:(id)a4 options:(id)a5 serviceInstance:(id)a6 source:(id)a7 originalSource:(id)a8 isTrusted:(BOOL)a9 sequenceNumber:(unint64_t)a10 cacheGUID:(id)a11 ourSequenceNumber:(unint64_t)a12 ourCacheGUID:(id)a13 withResult:(id)a14
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v20 = a4;
  id v64 = a5;
  id v21 = a6;
  id v63 = a8;
  id v22 = a11;
  id v65 = a13;
  uint64_t v23 = (void (**)(id, void *))a14;
  uint64_t v24 = [(FBSystemService *)self _applicationInfoProvider];
  uint64_t v25 = [v24 applicationInfoForBundleIdentifier:v19];

  if (!v19 || !v22) { {
    goto LABEL_10;
  }
  }
  id v26 = v21;
  uint64_t v27 = FBLogCommon();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    [v22 UUIDString];
    uint64_t v61 = v23;
    id v28 = v22;
    BOOL v29 = self;
    char v30 = v25;
    v32 = id v31 = v20;
    *(_DWORD *)buf = 138544642;
    id v87 = v31;
    __int16 v88 = 2112;
    id v89 = v19;
    __int16 v90 = 2114;
    *(void *)v91 = v32;
    *(_WORD *)&v91[8] = 2048;
    unint64_t v92 = a10;
    __int16 v93 = 2114;
    unint64_t v94 = (unint64_t)v65;
    __int16 v95 = 2048;
    unint64_t v96 = a12;
    _os_log_impl(&dword_1A62FC000, v27, OS_LOG_TYPE_DEFAULT, "[FBSystemService][%{public}@] Attempting activation of %@ with {UUID: %{public}@, Sequence: %lu} vs {UUID: %{public}@, Sequence: %lu}", buf, 0x3Eu);

    id v20 = v31;
    uint64_t v25 = v30;
    self = v29;
    id v22 = v28;
    uint64_t v23 = v61;
  }

  id v21 = v26;
  if (![(FBSystemService *)self _shouldPendRequestForClientSequenceNumber:a10 clientCacheGUID:v22 ourSequenceNumber:a12 ourCacheGUID:v65])
  {
LABEL_10:
    if (v19 && !v25)
    {
      id v36 = FBSOpenApplicationErrorCreate();
      v23[2](v23, v36);
LABEL_22:
      int8x16_t v37 = v63;
      goto LABEL_23;
    }
    if (([v25 _isInstalling] & 1) != 0
      || ([v25 _isUninstalling] & 1) != 0
      || [v25 _isPendingUninstall] && (objc_msgSend(v25, "_isTentativeUninstall") & 1) == 0)
    {
      BOOL v46 = v23;
      v47 = FBLogCommon();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        id v48 = v21;
        id v49 = v20;
        int v50 = [v25 _isInstalling];
        int v51 = [v25 _isUninstalling];
        int v52 = [v25 _isPendingUninstall];
        *(_DWORD *)buf = 138544386;
        id v87 = v49;
        __int16 v88 = 2112;
        id v89 = v19;
        __int16 v90 = 1024;
        *(_DWORD *)v91 = v50;
        id v20 = v49;
        id v21 = v48;
        *(_WORD *)&v91[4] = 1024;
        *(_DWORD *)&v91[6] = v51;
        LOWORD(v92) = 1024;
        *(_DWORD *)((char *)&v92 + 2) = v52;
        _os_log_impl(&dword_1A62FC000, v47, OS_LOG_TYPE_DEFAULT, "[FBSystemService][%{public}@] Application \"%@\" is installing (%d), uninstalling (%d), or pending uninstall (%d) and cannot be launched.", buf, 0x28u);
      }

      id v36 = FBSOpenApplicationErrorCreate();
      uint64_t v23 = v46;
      v46[2](v46, v36);
      goto LABEL_22;
    }
    id v36 = [(FBSystemService *)self delegate];
    int8x16_t v37 = v63;
    if (!v36)
    {
      FBSOpenApplicationErrorCreate();
      uint64_t v45 = (FBSystemServiceOpenApplicationRequest *)objc_claimAutoreleasedReturnValue();
      v23[2](v23, v45);
      goto LABEL_33;
    }
    uint64_t v60 = v21;
    id v62 = v22;
    if (objc_opt_respondsToSelector())
    {
      long long v38 = [[FBSystemServiceOpenApplicationRequest alloc] initWithBundleId:v19];
      [(FBSystemServiceOpenApplicationRequest *)v38 setTrusted:a9];
      [(FBSystemServiceOpenApplicationRequest *)v38 setOptions:v64];
      +[FBProcessManager sharedInstance];
      id v39 = v19;
      char v40 = v23;
      id v41 = v25;
      v43 = id v42 = v20;
      uint64_t v44 = [v43 registerProcessForHandle:v63];
      [(FBSystemServiceOpenApplicationRequest *)v38 setClientProcess:v44];

      id v20 = v42;
      uint64_t v25 = v41;
      uint64_t v23 = v40;
      id v19 = v39;
      v81[0] = MEMORY[0x1E4F143A8];
      v81[1] = 3221225472;
      v81[2] = __179__FBSystemService__reallyActivateApplication_requestID_options_serviceInstance_source_originalSource_isTrusted_sequenceNumber_cacheGUID_ourSequenceNumber_ourCacheGUID_withResult___block_invoke;
      v81[3] = &unk_1E5C4A078;
      id v82 = v36;
      v83 = self;
      char v84 = v38;
      v85 = v23;
      uint64_t v45 = v38;
      id v21 = v60;
      FBOpenAppSystemServiceExecuteCallOut(v60, v81);

      id v22 = v62;
LABEL_33:

      goto LABEL_23;
    }
    uint64_t v53 = [v64 url];
    uint64_t v59 = (FBSystemServiceOpenApplicationRequest *)v53;
    if (a9)
    {
      if (objc_opt_respondsToSelector())
      {
        v74[0] = MEMORY[0x1E4F143A8];
        v74[1] = 3221225472;
        v74[2] = __179__FBSystemService__reallyActivateApplication_requestID_options_serviceInstance_source_originalSource_isTrusted_sequenceNumber_cacheGUID_ourSequenceNumber_ourCacheGUID_withResult___block_invoke_2;
        v74[3] = &unk_1E5C4A0C8;
        id v75 = v36;
        uint64_t v76 = self;
        id v77 = v19;
        id v78 = v64;
        id v79 = v63;
        id v54 = v23;
        uint64_t v80 = v23;
        FBOpenAppSystemServiceExecuteCallOut(v21, v74);

        uint64_t v55 = v75;
LABEL_32:

        uint64_t v23 = v54;
        uint64_t v45 = v59;
        goto LABEL_33;
      }
    }
    else
    {
      id v56 = (void *)v53;
      if (v53 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        v66[0] = MEMORY[0x1E4F143A8];
        v66[1] = 3221225472;
        v66[2] = __179__FBSystemService__reallyActivateApplication_requestID_options_serviceInstance_source_originalSource_isTrusted_sequenceNumber_cacheGUID_ourSequenceNumber_ourCacheGUID_withResult___block_invoke_4;
        v66[3] = &unk_1E5C4A0F0;
        id v67 = v36;
        uint64_t v68 = self;
        id v69 = v56;
        id v70 = v19;
        id v71 = v64;
        id v72 = v63;
        id v54 = v23;
        uint64_t v73 = v23;
        FBOpenAppSystemServiceExecuteCallOut(v21, v66);

        uint64_t v55 = v67;
        goto LABEL_32;
      }
    }
    uint64_t v57 = FBSOpenApplicationErrorCreate();
    v58 = v23;
    uint64_t v55 = (void *)v57;
    id v54 = v58;
    v58[2](v58, (void *)v57);
    goto LABEL_32;
  }
  id v33 = v25;
  uint64_t v34 = v23;
  id v35 = FBLogCommon();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544386;
    id v87 = v20;
    __int16 v88 = 2114;
    id v89 = v22;
    __int16 v90 = 2048;
    *(void *)v91 = a10;
    *(_WORD *)&v91[8] = 2114;
    unint64_t v92 = (unint64_t)v65;
    __int16 v93 = 2048;
    unint64_t v94 = a12;
    _os_log_impl(&dword_1A62FC000, v35, OS_LOG_TYPE_DEFAULT, "[FBSystemService][%{public}@] Pending activate request due to LS value mismatch.\n\tClient LS values: {%{public}@, %lu}\n\t Our LS values: {%{public}@, %lu}", buf, 0x34u);
  }

  id v36 = FBSOpenApplicationErrorCreate();
  uint64_t v23 = v34;
  v34[2](v34, v36);
  int8x16_t v37 = v63;
  uint64_t v25 = v33;
LABEL_23:
}

- (FBSApplicationInfoProvider)_applicationInfoProvider
{
  p_defaultInfoProviderLock = &self->_defaultInfoProviderLock;
  os_unfair_lock_lock(&self->_defaultInfoProviderLock);
  uint64_t v4 = self->_lock_defaultInfoProvider;
  os_unfair_lock_unlock(p_defaultInfoProviderLock);

  return v4;
}

- (FBSystemServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FBSystemServiceDelegate *)WeakRetained;
}

- (BOOL)_isTrustedRequest:(id)a3 forCaller:(id)a4 fromClient:(id)a5 forBundleInfo:(id)a6 withOptions:(id)a7 fatalError:(id *)a8
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = [v18 objectForKey:*MEMORY[0x1E4F62618]];

  if (!v19)
  {
    if (([v16 hasEntitlement:@"com.apple.frontboard.launchapplications"] & 1) == 0
      && ([v16 hasEntitlement:@"com.apple.backboardd.launchapplications"] & 1) == 0
      && ([v16 hasEntitlement:@"com.apple.springboard.launchapplications"] & 1) == 0
      && ([v16 hasEntitlement:@"com.apple.frontboard.debugapplications"] & 1) == 0
      && ([v16 hasEntitlement:@"com.apple.backboardd.debugapplications"] & 1) == 0
      && ![v16 hasEntitlement:@"com.apple.springboard.debugapplications"])
    {
LABEL_20:
      if (objc_msgSend(v18, "bs_BOOLForKey:", *MEMORY[0x1E4F62628]))
      {
        if ([v16 hasEntitlement:@"com.apple.springboard.opensensitiveurl"])
        {
          uint64_t v23 = FBLogCommon();
          if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) { {
            goto LABEL_16;
          }
          }
          uint64_t v24 = FBSProcessPrettyDescription();
          *(_DWORD *)buf = 138543618;
          id v45 = v14;
          __int16 v46 = 2114;
          v47 = v24;
          uint64_t v25 = "[FBSystemService][%{public}@] Trusting legacy sensitive URL request from %{public}@.";
          goto LABEL_15;
        }
        if (([v15 hasEntitlement:*MEMORY[0x1E4F625C8]] & 1) == 0)
        {
          uint64_t v20 = FBSOpenApplicationErrorCreate();
          if (v20) { {
            goto LABEL_6;
          }
          }
        }
      }
      if (objc_msgSend(v18, "bs_BOOLForKey:", *MEMORY[0x1E4F625F8]))
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) { {
          id v28 = v17;
        }
        }
        else {
          id v28 = 0;
        }
        id v29 = v28;
        char v30 = [v17 bundleIdentifier];
        BOOL v31 = [(FBSystemService *)self _isAllowListedLaunchSuspendedApp:v30];

        if (v29 && (unint64_t)[v29 type] <= 1) { {
          int v32 = [v29 hasViewServicesEntitlement];
        }
        }
        else {
          int v32 = 0;
        }
        char v22 = v31 | v32;
        if ((v31 | v32) == 1)
        {
          id v33 = FBLogCommon();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v34 = FBSProcessPrettyDescription();
            *(_DWORD *)buf = 138543618;
            id v45 = v14;
            __int16 v46 = 2114;
            v47 = v34;
            _os_log_impl(&dword_1A62FC000, v33, OS_LOG_TYPE_DEFAULT, "[FBSystemService][%{public}@] Trusting allow-listed background activation from %{public}@.", buf, 0x16u);
          }
          id v21 = 0;
        }
        else
        {
          id v21 = FBSOpenApplicationErrorCreate();
        }
      }
      else
      {
        char v22 = 0;
        id v21 = 0;
      }
      if ((v22 & 1) != 0 || v21)
      {
LABEL_55:
        if (!v21)
        {
          char v26 = 1;
          if (!a8) { {
            goto LABEL_19;
          }
          }
          goto LABEL_18;
        }
        goto LABEL_56;
      }
      id v35 = objc_msgSend(v18, "bs_safeURLForKey:", *MEMORY[0x1E4F62678]);
      id v36 = v35;
      if (v35)
      {
        if ([v35 isFileURL]
          && (objc_msgSend(v18, "bs_BOOLForKey:", *MEMORY[0x1E4F62620]) & 1) == 0)
        {
          id v21 = FBSOpenApplicationErrorCreate();
          if (v21)
          {
LABEL_54:

            goto LABEL_55;
          }
LABEL_50:
          id v21 = FBSOpenApplicationErrorCreate();
          goto LABEL_54;
        }
      }
      else
      {
        char v37 = objc_msgSend(v18, "bs_BOOLForKey:", *MEMORY[0x1E4F626B0]);
        int v38 = objc_msgSend(v18, "bs_BOOLForKey:", *MEMORY[0x1E4F62668]);
        if ((v37 & 1) == 0 && !v38) { {
          goto LABEL_50;
        }
        }
      }
      id v39 = FBLogCommon();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        char v40 = FBSProcessPrettyDescription();
        *(_DWORD *)buf = 138543618;
        id v45 = v14;
        __int16 v46 = 2114;
        v47 = v40;
        _os_log_impl(&dword_1A62FC000, v39, OS_LOG_TYPE_DEFAULT, "[FBSystemService][%{public}@] Allowing un-trusted request from %{public}@.", buf, 0x16u);
      }
      id v21 = 0;
      goto LABEL_54;
    }
LABEL_13:
    uint64_t v23 = FBLogCommon();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
LABEL_16:
      id v21 = 0;
      char v26 = 1;
      char v22 = 1;
      goto LABEL_17;
    }
    uint64_t v24 = FBSProcessPrettyDescription();
    *(_DWORD *)buf = 138543618;
    id v45 = v14;
    __int16 v46 = 2114;
    v47 = v24;
    uint64_t v25 = "[FBSystemService][%{public}@] Trusting entitled client %{public}@.";
LABEL_15:
    _os_log_impl(&dword_1A62FC000, v23, OS_LOG_TYPE_DEFAULT, v25, buf, 0x16u);

    goto LABEL_16;
  }
  if (([v16 hasEntitlement:@"com.apple.frontboard.debugapplications"] & 1) != 0
    || ([v16 hasEntitlement:@"com.apple.backboardd.debugapplications"] & 1) != 0
    || ([v16 hasEntitlement:@"com.apple.springboard.debugapplications"] & 1) != 0)
  {
    goto LABEL_13;
  }
  uint64_t v20 = FBSOpenApplicationErrorCreate();
  if (!v20) { {
    goto LABEL_20;
  }
  }
LABEL_6:
  id v21 = (void *)v20;
  char v22 = 0;
LABEL_56:
  uint64_t v23 = FBLogCommon();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    id v43 = FBSProcessPrettyDescription();
    uint64_t v41 = [v21 succinctDescription];
    *(_DWORD *)buf = 138543874;
    id v45 = v14;
    __int16 v46 = 2114;
    v47 = v43;
    __int16 v48 = 2114;
    uint64_t v49 = v41;
    id v42 = (void *)v41;
    _os_log_error_impl(&dword_1A62FC000, v23, OS_LOG_TYPE_ERROR, "[FBSystemService][%{public}@] Request from %{public}@ is denied: %{public}@", buf, 0x20u);
  }
  char v26 = 0;
LABEL_17:

  if (a8) { {
LABEL_18:
  }
  }
    *a8 = v21;
LABEL_19:

  return v26 & v22;
}

void __61__FBSystemService_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x1E4F629E8];
  id v4 = a2;
  uint64_t v5 = [v3 serviceQuality];
  [v4 setServiceQuality:v5];

  id v6 = +[FBSystemAppProxyServiceServer targetQueue];
  [v4 setTargetDispatchingQueue:v6];

  uint64_t v7 = [MEMORY[0x1E4F629E8] interface];
  [v4 setInterface:v7];

  [v4 setInterfaceTarget:*(void *)(a1 + 32)];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__FBSystemService_listener_didReceiveConnection_withContext___block_invoke_2;
  v8[3] = &unk_1E5C4A140;
  id v9 = *(id *)(a1 + 40);
  [v4 setInvalidationHandler:v8];
}

+ (id)sharedInstanceIfExists
{
  uint64_t v2 = +[FBServiceFacilityServer sharedInstanceDomain];
  uint64_t v3 = +[FBSystemService _sharedInstanceCreatingIfNecessary:]((uint64_t)FBSystemService, v2 != 0);

  return v3;
}

+ (id)_sharedInstanceCreatingIfNecessary:(uint64_t)a1
{
  uint64_t v3 = (objc_class *)self;
  os_unfair_lock_lock((os_unfair_lock_t)&_sharedInstanceCreatingIfNecessary____lock);
  id v4 = (id)_sharedInstanceCreatingIfNecessary____sharedInstance;
  if (v4) { {
    BOOL v5 = 1;
  }
  }
  else {
    BOOL v5 = a2 == 0;
  }
  if (!v5)
  {
    id v6 = [v3 alloc];
    uint64_t v7 = [MEMORY[0x1E4F62AC8] mainDispatchQueue];
    uint64_t v8 = (void *)[v6 initWithQueue:v7];
    id v9 = (void *)_sharedInstanceCreatingIfNecessary____sharedInstance;
    _sharedInstanceCreatingIfNecessary____sharedInstance = (uint64_t)v8;

    id v4 = v8;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedInstanceCreatingIfNecessary____lock);

  return v4;
}

void __114__FBSystemService__activateBundleID_requestID_isTrusted_options_serviceInstance_source_originalSource_withResult___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [*(id *)(a1 + 32) invalidate];
  id v4 = [v3 domain];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4F625D0]];

  if (v5)
  {
    unint64_t v6 = [v3 code];
    if (v6 <= 9)
    {
      unint64_t v7 = v6;
      if (((1 << v6) & 0x250) != 0)
      {
        if (*(unsigned char *)(a1 + 120))
        {
          uint64_t v8 = FBLogCommon();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v9 = *(void *)(a1 + 40);
            uint64_t v10 = *(void *)(a1 + 48);
            id v11 = FBSOpenApplicationErrorCodeToString();
            int v23 = 138543874;
            uint64_t v24 = v9;
            __int16 v25 = 2114;
            uint64_t v26 = v10;
            __int16 v27 = 2114;
            id v28 = v11;
            _os_log_impl(&dword_1A62FC000, v8, OS_LOG_TYPE_DEFAULT, "[FBSystemService][%{public}@] Retry attempt failed for %{public}@ with reason \"%{public}@\"", (uint8_t *)&v23, 0x20u);
          }
          double v12 = CACurrentMediaTime();
          if (*(double *)(a1 + 96) >= v12 || v12 >= *(double *)(a1 + 104))
          {
            if (v7 != 9 || *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24))
            {
              uint64_t v13 = FBLogCommon();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v14 = *(void *)(a1 + 40);
                uint64_t v15 = *(void *)(a1 + 48);
                id v16 = FBSProcessPrettyDescription();
                int v23 = 138543874;
                uint64_t v24 = v14;
                __int16 v25 = 2114;
                uint64_t v26 = v15;
                __int16 v27 = 2114;
                id v28 = v16;
                _os_log_impl(&dword_1A62FC000, v13, OS_LOG_TYPE_DEFAULT, "[FBSystemService][%{public}@] Exhausted retry attempts for opening application: %{public}@ from source: %{public}@", (uint8_t *)&v23, 0x20u);
              }
              goto LABEL_14;
            }
            id v19 = FBLogCommon();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v20 = *(void *)(a1 + 40);
              uint64_t v21 = *(void *)(a1 + 48);
              char v22 = FBSProcessPrettyDescription();
              int v23 = 138543874;
              uint64_t v24 = v20;
              __int16 v25 = 2114;
              uint64_t v26 = v21;
              __int16 v27 = 2114;
              id v28 = v22;
              _os_log_impl(&dword_1A62FC000, v19, OS_LOG_TYPE_DEFAULT, "[FBSystemService][%{public}@] Attempting final launch request of: %{public}@ from source: %{public}@", (uint8_t *)&v23, 0x20u);
            }
            *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 1;
          }
          [*(id *)(*(void *)(a1 + 56) + 8) performAfter:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) withBlock:*(double *)(a1 + 112)];
          goto LABEL_15;
        }
      }
    }
  }
LABEL_14:
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  uint64_t v17 = *(void *)(*(void *)(a1 + 80) + 8);
  id v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = 0;

LABEL_15:
}

uint64_t __79__FBSystemService_openApplication_withOptions_originator_requestID_completion___block_invoke_2_217(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 != 0, a2);
}

uint64_t __79__FBSystemService_openApplication_withOptions_originator_requestID_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 invalidate];
}

void __79__FBSystemService_openApplication_withOptions_originator_requestID_completion___block_invoke(uint64_t a1, NSObject *a2, void *a3)
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([*(id *)(a1 + 32) signal])
  {
    unint64_t v6 = [v5 domain];
    int v7 = [v6 isEqualToString:*MEMORY[0x1E4F625D0]];

    if (a2)
    {
      uint64_t v8 = +[FBSystemService sharedInstance];
      uint64_t v9 = [v8 delegate];
      uint64_t v10 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v10);

      double v12 = (void *)MEMORY[0x1E4F28588];
      if (a2 == 1)
      {
        if (v7)
        {
          id v18 = [v5 userInfo];
          id v19 = [v18 objectForKey:*v12];

          uint64_t v20 = NSString;
          [v5 code];
          uint64_t v21 = FBSOpenApplicationErrorCodeToString();
          char v22 = (void *)v21;
          if (v19)
          {
            int v23 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
            uint64_t v24 = [v19 stringByTrimmingCharactersInSet:v23];
            uint64_t v17 = [v20 stringWithFormat:@"The request was denied by service delegate (%@) for reason: %@ (\"%@\"", v11, v22, v24];

            double v12 = (void *)MEMORY[0x1E4F28588];
          }
          else
          {
            uint64_t v17 = [v20 stringWithFormat:@"The request was denied by service delegate (%@) for reason: %@.", v11, v21];
          }
        }
        else
        {
          uint64_t v17 = [NSString stringWithFormat:@"The request was denied by service delegate (%@).", v11];
        }
      }
      else if (a2 == 2)
      {
        uint64_t v13 = NSString;
        uint64_t v14 = [MEMORY[0x1E4F28F80] processInfo];
        uint64_t v15 = [v14 processName];
        id v16 = [v13 stringWithFormat:@"This is probably a bug in %@.", v15];

        uint64_t v17 = [NSString stringWithFormat:@"The request was ignored by service delegate (%@). %@", v11, v16];
      }
      else
      {
        uint64_t v17 = 0;
      }
      __int16 v25 = [MEMORY[0x1E4F1CA60] dictionary];
      uint64_t v26 = [NSString stringWithFormat:@"The request to open \"%@\" failed.", *(void *)(a1 + 48)];
      objc_msgSend(v25, "bs_setSafeObject:forKey:", v26, *MEMORY[0x1E4F28568]);

      objc_msgSend(v25, "bs_setSafeObject:forKey:", v17, *v12);
      objc_msgSend(v25, "bs_setSafeObject:forKey:", v5, *MEMORY[0x1E4F28A50]);
      __int16 v27 = FBSOpenApplicationServiceErrorCodeToString();
      objc_msgSend(v25, "bs_setSafeObject:forKey:", v27, *MEMORY[0x1E4F624F0]);

      objc_msgSend(v25, "bs_setSafeObject:forKey:", *(void *)(a1 + 40), @"FBSOpenApplicationRequestID");
      a2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F626B8] code:a2 userInfo:v25];
    }
    char v28 = v7 ^ 1;
    if (v5) { {
      int v29 = v7 ^ 1;
    }
    }
    else {
      int v29 = 0;
    }
    if (v28)
    {
      if (!v29)
      {
LABEL_28:
        uint64_t v34 = FBLogCommon();
        BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
        if (a2)
        {
          if (v35)
          {
            uint64_t v36 = *(void *)(a1 + 40);
            uint64_t v37 = *(void *)(a1 + 48);
            uint64_t v38 = *(void *)(a1 + 64);
            id v39 = [a2 descriptionWithMultilinePrefix:0];
            *(_DWORD *)buf = 138544130;
            uint64_t v53 = v36;
            __int16 v54 = 2114;
            uint64_t v55 = v37;
            __int16 v56 = 2114;
            uint64_t v57 = v38;
            __int16 v58 = 2114;
            uint64_t v59 = v39;
            _os_log_impl(&dword_1A62FC000, v34, OS_LOG_TYPE_DEFAULT, "[FBSystemService][%{public}@] Open \"%{public}@\" request from %{public}@ failed with error: %{public}@", buf, 0x2Au);
          }
        }
        else if (v35)
        {
          uint64_t v40 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 138543362;
          uint64_t v53 = v40;
          _os_log_impl(&dword_1A62FC000, v34, OS_LOG_TYPE_DEFAULT, "[FBSystemService][%{public}@] Request complete; no error reported.",
            buf,
            0xCu);
        }

        if (*(void *)(a1 + 72))
        {
          uint64_t v41 = +[FBProcess _currentProcess];
          if ([v41 isApplicationProcess])
          {
            id v42 = [v41 bundleIdentifier];
            char v43 = [v42 isEqualToString:*(void *)(a1 + 48)];

            if (v43) { {
              goto LABEL_38;
            }
            }
          }
          uint64_t v44 = +[FBProcessManager sharedInstance];
          id v45 = [v44 processesForBundleIdentifier:*(void *)(a1 + 48)];
          id v46 = [v45 firstObject];

          if (v41)
          {
            if (!v46) { {
LABEL_38:
            }
            }
              id v46 = v41;
          }
          uint64_t v47 = *(void *)(a1 + 72);
          __int16 v48 = [v46 handle];
          (*(void (**)(uint64_t, void *, NSObject *))(v47 + 16))(v47, v48, a2);
        }
        goto LABEL_40;
      }
    }
    else
    {
      if (([v5 code] & 0xFFFFFFFFFFFFFFFELL) == 4) { {
        char v30 = 1;
      }
      }
      else {
        char v30 = v29;
      }
      if ((v30 & 1) == 0) { {
        goto LABEL_28;
      }
      }
    }
    BOOL v31 = [*(id *)(a1 + 56) dictionary];
    char v32 = objc_msgSend(v31, "bs_BOOLForKey:", *MEMORY[0x1E4F625F8]);

    if ((v32 & 1) == 0)
    {
      id v33 = dispatch_get_global_queue(21, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __79__FBSystemService_openApplication_withOptions_originator_requestID_completion___block_invoke_191;
      block[3] = &unk_1E5C497A0;
      id v50 = *(id *)(a1 + 56);
      id v51 = *(id *)(a1 + 48);
      dispatch_async(v33, block);
    }
    goto LABEL_28;
  }
  a2 = FBLogCommon();
  if (os_log_type_enabled(a2, OS_LOG_TYPE_ERROR)) { {
    __79__FBSystemService_openApplication_withOptions_originator_requestID_completion___block_invoke_cold_1(a1, a2);
  }
  }
LABEL_40:
}

+ (NSString)currentOpenApplicationInstance
{
  id v3 = [MEMORY[0x1E4F29060] currentThread];
  id v4 = [v3 threadDictionary];

  if (!v4)
  {
    uint64_t v10 = NSString;
    id v11 = [MEMORY[0x1E4F29060] currentThread];
    double v12 = [v10 stringWithFormat:@"missing thread-local storage on %@", v11];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      +[FBSystemService currentOpenApplicationInstance]();
    }
    }
    [v12 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
LABEL_16:
    JUMPOUT(0x1A631EAB4);
  }
  id v5 = [v4 objectForKey:@"FBOpenAppSystemServiceInstance"];
  unint64_t v6 = v5;
  if (!v5) { {
    goto LABEL_5;
  }
  }
  id v7 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v13 = NSString;
    uint64_t v14 = (objc_class *)[v7 classForCoder];
    if (!v14) { {
      uint64_t v14 = (objc_class *)objc_opt_class();
    }
    }
    uint64_t v15 = NSStringFromClass(v14);
    id v16 = (objc_class *)objc_opt_class();
    uint64_t v17 = NSStringFromClass(v16);
    id v18 = [v13 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"instance", v15, v17];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      +[FBSystemService currentOpenApplicationInstance](a2);
    }
    }
    [v18 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    goto LABEL_16;
  }

  id v8 = v7;
LABEL_5:

  return (NSString *)v6;
}

uint64_t __179__FBSystemService__reallyActivateApplication_requestID_options_serviceInstance_source_originalSource_isTrusted_sequenceNumber_cacheGUID_ourSequenceNumber_ourCacheGUID_withResult___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) systemService:*(void *)(a1 + 40) handleOpenApplicationRequest:*(void *)(a1 + 48) withCompletion:*(void *)(a1 + 56)];
}

void __114__FBSystemService__activateBundleID_requestID_isTrusted_options_serviceInstance_source_originalSource_withResult___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 error];
  uint64_t v4 = [v3 code];

  if (v4 == 1)
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    unint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = 0;
  }
}

void __79__FBSystemService_openApplication_withOptions_originator_requestID_completion___block_invoke_214(uint64_t a1, void *a2)
{
  id v3 = [a2 error];
  uint64_t v4 = [v3 code];

  if (v4 == 1)
  {
    uint64_t v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v5();
  }
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6 = a4;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __61__FBSystemService_listener_didReceiveConnection_withContext___block_invoke;
  id v11 = &unk_1E5C4A168;
  double v12 = self;
  id v13 = v6;
  id v7 = v6;
  [v7 _configureConnection:&v8];
  objc_msgSend(v7, "activate", v8, v9, v10, v11, v12);
}

void __79__FBSystemService_openApplication_withOptions_originator_requestID_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) applicationInfoForBundleIdentifier:*(void *)(a1 + 40)];
  if (!v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || ([*(id *)(a1 + 32) placeholderWithBundleIdentifier:*(void *)(a1 + 40)],
          (uint64_t v2 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      id v3 = FBLogCommon();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v4 = *(void *)(a1 + 48);
        uint64_t v5 = (objc_class *)objc_opt_class();
        id v6 = NSStringFromClass(v5);
        uint64_t v7 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543874;
        uint64_t v32 = v4;
        __int16 v33 = 2112;
        uint64_t v34 = v6;
        __int16 v35 = 2114;
        uint64_t v36 = v7;
        _os_log_impl(&dword_1A62FC000, v3, OS_LOG_TYPE_DEFAULT, "[FBSystemService][%{public}@] Application info provider (%@) returned nil for \"%{public}@\"", buf, 0x20u);
      }
      if (!*(void *)(a1 + 56))
      {
        id v19 = (objc_class *)objc_opt_class();
        uint64_t v20 = NSStringFromClass(v19);
        uint64_t v2 = FBSOpenApplicationErrorCreate();

        (*(void (**)(void, uint64_t, void *))(*(void *)(a1 + 112) + 16))(*(void *)(a1 + 112), 4, v2);
        goto LABEL_12;
      }
      uint64_t v2 = 0;
    }
  }
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = *(void **)(a1 + 64);
  uint64_t v10 = *(void *)(a1 + 72);
  uint64_t v11 = *(void *)(a1 + 80);
  uint64_t v12 = *(void *)(a1 + 88);
  id v30 = 0;
  char v13 = [v9 _isTrustedRequest:v8 forCaller:v10 fromClient:v11 forBundleInfo:v2 withOptions:v12 fatalError:&v30];
  id v14 = v30;
  if (v30)
  {
    (*(void (**)(void, uint64_t, id))(*(void *)(a1 + 112) + 16))(*(void *)(a1 + 112), 4, v30);
  }
  else
  {
    char v15 = v13;
    uint64_t v16 = *(void *)(a1 + 64);
    uint64_t v17 = *(void **)(v16 + 8);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __79__FBSystemService_openApplication_withOptions_originator_requestID_completion___block_invoke_216;
    v21[3] = &unk_1E5C4A280;
    v21[4] = v16;
    id v22 = *(id *)(a1 + 40);
    id v23 = *(id *)(a1 + 48);
    char v29 = v15;
    id v24 = *(id *)(a1 + 96);
    id v25 = *(id *)(a1 + 104);
    id v26 = *(id *)(a1 + 72);
    id v27 = *(id *)(a1 + 80);
    id v28 = *(id *)(a1 + 112);
    id v18 = 0;
    [v17 performAsync:v21];
  }
LABEL_12:
}

+ (id)sharedInstance
{
  return +[FBSystemService _sharedInstanceCreatingIfNecessary:]((uint64_t)FBSystemService, 1);
}

- (FBSystemService)initWithQueue:(id)a3
{
  id v5 = a3;
  v33.receiver = self;
  v33.super_class = (Class)FBSystemService;
  id v6 = [(FBSystemService *)&v33 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    uint64_t v8 = +[FBServiceFacilityServer sharedInstance];
    uint64_t v9 = [v8 domain];
    uint64_t v10 = [MEMORY[0x1E4F629E8] identifier];
    uint64_t v11 = [v9 serviceForIdentifier:v10];

    if (v11 && [v11 isDerived])
    {
      uint64_t v12 = (void *)MEMORY[0x1E4F628A0];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __33__FBSystemService_initWithQueue___block_invoke;
      v29[3] = &unk_1E5C49ED0;
      id v30 = v8;
      id v31 = v11;
      char v13 = v7;
      uint64_t v32 = v13;
      uint64_t v14 = [v12 listenerWithConfigurator:v29];
      legacyOpenServiceListener = v13->_legacyOpenServiceListener;
      v13->_legacyOpenServiceListener = (BSServiceConnectionListener *)v14;
    }
    v7->_defaultInfoProviderLock._os_unfair_lock_opaque = 0;
    [(FBSystemService *)v7 _setInfoProvider];
    [(BSServiceConnectionListener *)v7->_legacyOpenServiceListener activate];
    if ([MEMORY[0x1E4F628D8] isServerProcess])
    {
      uint64_t v16 = (void *)MEMORY[0x1E4F14428];
      id v17 = MEMORY[0x1E4F14428];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __33__FBSystemService_initWithQueue___block_invoke_2;
      v27[3] = &unk_1E5C49EF8;
      id v18 = v7;
      id v28 = v18;
      id v19 = v16;
      uint64_t v20 = v27;
      uint64_t v35 = 0;
      uint64_t v36 = &v35;
      uint64_t v37 = 0x2020000000;
      uint64_t v21 = getAKSEventsRegisterSymbolLoc_ptr;
      uint64_t v38 = getAKSEventsRegisterSymbolLoc_ptr;
      if (!getAKSEventsRegisterSymbolLoc_ptr)
      {
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __getAKSEventsRegisterSymbolLoc_block_invoke;
        v34[3] = &unk_1E5C496D8;
        v34[4] = &v35;
        __getAKSEventsRegisterSymbolLoc_block_invoke((uint64_t)v34);
        uint64_t v21 = (void *)v36[3];
      }
      _Block_object_dispose(&v35, 8);
      if (!v21) { {
        -[FBSystemService initWithQueue:]();
      }
      }
      id v22 = (void *)MEMORY[0x1E4F14428];
      uint64_t v23 = ((uint64_t (*)(void, void *))v21)(MEMORY[0x1E4F14428], v20);

      v18->_aksEvent = (_AKSEvent *)v23;
    }
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __33__FBSystemService_initWithQueue___block_invoke_24;
    v25[3] = &unk_1E5C49AE0;
    id v26 = v7;
    atexit_b(v25);
  }
  return v7;
}

void __33__FBSystemService_initWithQueue___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v7 = a2;
  uint64_t v4 = [v3 domain];
  id v5 = [v4 identifier];
  [v7 setDomain:v5];

  id v6 = [*(id *)(a1 + 40) identifier];
  [v7 setService:v6];

  [v7 setDelegate:*(void *)(a1 + 48)];
}

void __33__FBSystemService_initWithQueue___block_invoke_2(uint64_t a1, int a2)
{
  if (a2 == 5)
  {
    id v3 = FBLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) { {
      __33__FBSystemService_initWithQueue___block_invoke_2_cold_1(v3);
    }
    }

    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F62AF0]) initWithReason:@"SEP idle reboot"];
    [v4 setRebootType:1];
    [*(id *)(a1 + 32) shutdownUsingOptions:v4];
  }
}

void __33__FBSystemService_initWithQueue___block_invoke_24(uint64_t a1)
{
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    id v6 = +[FBSystemService sharedInstance];
    [v6 prepareForExitAndRelaunch:1];
  }
  else
  {
    dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
    id v3 = *(void **)(*(void *)(a1 + 32) + 8);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __33__FBSystemService_initWithQueue___block_invoke_2_26;
    v7[3] = &unk_1E5C49AE0;
    dispatch_semaphore_t v8 = v2;
    uint64_t v4 = v2;
    [v3 performAsync:v7];
    dispatch_time_t v5 = dispatch_time(0, 1000000000);
    dispatch_semaphore_wait(v4, v5);
  }
}

intptr_t __33__FBSystemService_initWithQueue___block_invoke_2_26(uint64_t a1)
{
  dispatch_semaphore_t v2 = +[FBSystemService sharedInstance];
  [v2 prepareForExitAndRelaunch:1];

  id v3 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v3);
}

- (FBSystemService)init
{
  uint64_t v4 = [NSString stringWithFormat:@"init is not allowed on FBSystemService"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    dispatch_time_t v5 = NSStringFromSelector(a2);
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    uint64_t v10 = v5;
    __int16 v11 = 2114;
    uint64_t v12 = v7;
    __int16 v13 = 2048;
    uint64_t v14 = self;
    __int16 v15 = 2114;
    uint64_t v16 = @"FBSystemService.m";
    __int16 v17 = 1024;
    int v18 = 214;
    __int16 v19 = 2114;
    uint64_t v20 = v4;
    _os_log_error_impl(&dword_1A62FC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (FBSystemService *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)dealloc
{
  uint64_t v4 = [NSString stringWithFormat:@"%s should NEVER be deallocated: %@", "-[FBSystemService dealloc]", self];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    dispatch_time_t v5 = NSStringFromSelector(a2);
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    *(_DWORD *)buf = 138544642;
    int v9 = v5;
    __int16 v10 = 2114;
    __int16 v11 = v7;
    __int16 v12 = 2048;
    __int16 v13 = self;
    __int16 v14 = 2114;
    __int16 v15 = @"FBSystemService.m";
    __int16 v16 = 1024;
    int v17 = 219;
    __int16 v18 = 2114;
    __int16 v19 = v4;
    _os_log_error_impl(&dword_1A62FC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
  }
  [v4 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  dispatch_time_t v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    [(FBSystemService *)self _setInfoProvider];
    dispatch_time_t v5 = obj;
  }
}

- (void)shutdownAndReboot:(BOOL)a3
{
  id v3 = (FBSystemService *)[(FBSystemService *)self shutdownWithOptions:a3 forSource:0];
  [(FBSystemService *)v3 shutdownWithOptions:v5 forSource:v6];
}

- (void)shutdownWithOptions:(unint64_t)a3 forSource:(int64_t)a4
{
  char v5 = a3;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F62AF0]) initWithReason:@"GenericSystemService"];
  dispatch_semaphore_t v8 = v7;
  if ((v5 & 2) != 0) { {
    uint64_t v9 = 2;
  }
  }
  else {
    uint64_t v9 = v5 & 1;
  }
  [v7 setRebootType:v9];
  [v8 setSource:a4];
  __int16 v10 = (FBSystemService *)[(FBSystemService *)self shutdownWithOptions:v8 origin:0];
  [(FBSystemService *)v10 shutdownUsingOptions:v12];
}

- (void)shutdownUsingOptions:(id)a3
{
  id v3 = (FBSystemService *)[(FBSystemService *)self shutdownWithOptions:a3 origin:0];
  [(FBSystemService *)v3 shutdownWithOptions:v5 origin:v6];
}

- (void)shutdownWithOptions:(id)a3 origin:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 rebootType];
  int v9 = [v6 isReboot];
  [(FBSystemService *)self setPendingExit:1];
  if (![v6 isShutdown])
  {
    +[FBAsynchronousShutdownTask startTaskWithName:@"NotifyNearField" timeout:&__block_literal_global_68 workItem:1.0];
    goto LABEL_5;
  }
  uint64_t v10 = [v6 LPEMOption];
  if (v10) { {
    int v11 = v10 == 2;
  }
  }
  else {
    int v11 = [v6 isUserInitiated] ^ 1;
  }
  __int16 v13 = FBLogCommon();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&uint8_t buf[4] = v11;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = [v6 isUserInitiated];
    _os_log_impl(&dword_1A62FC000, v13, OS_LOG_TYPE_DEFAULT, "Performing shutdown for low power: %{BOOL}u; userInitiated: %{BOOL}u",
      buf,
      0xEu);
  }

  if ((v11 & 1) == 0) { {
    +[FBAsynchronousShutdownTask startTaskWithName:@"NotifyNearField" timeout:&__block_literal_global_7 workItem:1.0];
  }
  }
  uint64_t v38 = 0;
  id v39 = &v38;
  uint64_t v40 = 0x2020000000;
  __int16 v14 = (uint64_t *)getCBControllerLowPowerModeCompletionTimeoutSecondsSymbolLoc_ptr;
  uint64_t v41 = getCBControllerLowPowerModeCompletionTimeoutSecondsSymbolLoc_ptr;
  if (!getCBControllerLowPowerModeCompletionTimeoutSecondsSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getCBControllerLowPowerModeCompletionTimeoutSecondsSymbolLoc_block_invoke;
    char v43 = &unk_1E5C496D8;
    uint64_t v44 = &v38;
    __int16 v15 = (void *)CoreBluetoothLibrary();
    __int16 v16 = dlsym(v15, "CBControllerLowPowerModeCompletionTimeoutSeconds");
    *(void *)(v44[1] + 24) = v16;
    getCBControllerLowPowerModeCompletionTimeoutSecondsSymbolLoc_ptr = *(void *)(v44[1] + 24);
    __int16 v14 = (uint64_t *)v39[3];
  }
  _Block_object_dispose(&v38, 8);
  if (v14)
  {
    double v17 = (double)*v14;
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __46__FBSystemService_shutdownWithOptions_origin___block_invoke_3;
    v36[3] = &__block_descriptor_33_e56_v24__0__NSObject_OS_dispatch_queue__8___v____NSError__16l;
    char v37 = v11;
    +[FBAsynchronousShutdownTask startTaskWithName:@"NotifyBluetooth" timeout:v36 workItem:v17];
    uint64_t v38 = 0;
    id v39 = &v38;
    uint64_t v40 = 0x2020000000;
    __int16 v18 = (double *)getkNISystemShutdownCompletionTimeoutSecondsSymbolLoc_ptr;
    uint64_t v41 = getkNISystemShutdownCompletionTimeoutSecondsSymbolLoc_ptr;
    if (!getkNISystemShutdownCompletionTimeoutSecondsSymbolLoc_ptr)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getkNISystemShutdownCompletionTimeoutSecondsSymbolLoc_block_invoke;
      char v43 = &unk_1E5C496D8;
      uint64_t v44 = &v38;
      __int16 v19 = (void *)NearbyInteractionLibrary();
      uint64_t v20 = dlsym(v19, "kNISystemShutdownCompletionTimeoutSeconds");
      *(void *)(v44[1] + 24) = v20;
      getkNISystemShutdownCompletionTimeoutSecondsSymbolLoc_ptr = *(void *)(v44[1] + 24);
      __int16 v18 = (double *)v39[3];
    }
    _Block_object_dispose(&v38, 8);
    if (v18)
    {
      double v21 = *v18;
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __46__FBSystemService_shutdownWithOptions_origin___block_invoke_5;
      v33[3] = &unk_1E5C49F88;
      char v35 = v11;
      id v34 = v6;
      +[FBAsynchronousShutdownTask startTaskWithName:@"NotifyNearbyInteraction" timeout:v33 workItem:v21];

LABEL_5:
      id v12 = [(FBSystemService *)self delegate];
      if (objc_opt_respondsToSelector())
      {
        [v12 systemService:self prepareForShutdownWithOptions:v6 origin:v7];
      }
      else if (objc_opt_respondsToSelector())
      {
        objc_msgSend(v12, "systemServicePrepareForShutdown:withOptions:", self, -[FBSystemService _mapShutdownOptionsToOptions:](self, "_mapShutdownOptionsToOptions:", v6));
      }
      BOOL v22 = v8 == 2;
      [(FBSystemService *)self _performExitTasksForRelaunch:0];
      uint64_t v23 = objc_alloc_init(_FBDarkBootHelper);
      id v24 = v23;
      if (v22) { {
        [(_FBDarkBootHelper *)v23 setNextBootDark];
      }
      }
      id v25 = FBLogCommon();
      BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
      if (v9)
      {
        if (v26)
        {
          BOOL v27 = [(_FBDarkBootHelper *)v24 isBootingDark];
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v6;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v27;
          _os_log_impl(&dword_1A62FC000, v25, OS_LOG_TYPE_DEFAULT, "Rebooting... options:%@ darkBootGotSet:%{BOOL}u", buf, 0x12u);
        }
      }
      else if (v26)
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v6;
        _os_log_impl(&dword_1A62FC000, v25, OS_LOG_TYPE_DEFAULT, "Shutting Down... options:%@", buf, 0xCu);
      }

      +[FBAsynchronousShutdownTask waitForTasks];
      if (reboot3()) { {
        int v28 = -1;
      }
      }
      else {
        int v28 = 0;
      }
      exit(v28);
    }
    id v31 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v32 = [NSString stringWithUTF8String:"NSTimeInterval getkNISystemShutdownCompletionTimeoutSeconds(void)"];
    objc_msgSend(v31, "handleFailureInFunction:file:lineNumber:description:", v32, @"FBSystemService.m", 81, @"%s", dlerror());
  }
  else
  {
    char v29 = [MEMORY[0x1E4F28B00] currentHandler];
    id v30 = [NSString stringWithUTF8String:"const NSInteger getCBControllerLowPowerModeCompletionTimeoutSeconds(void)"];
    objc_msgSend(v29, "handleFailureInFunction:file:lineNumber:description:", v30, @"FBSystemService.m", 70, @"%s", dlerror());
  }
  __break(1u);
}

void __46__FBSystemService_shutdownWithOptions_origin___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  SEL v4 = [getNFHardwareManagerClass() sharedHardwareManager];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__FBSystemService_shutdownWithOptions_origin___block_invoke_2;
  v6[3] = &unk_1E5C498D8;
  id v7 = v3;
  id v5 = v3;
  [v4 actOnUserInitiatedSystemShutDown:2 completion:v6];
}

uint64_t __46__FBSystemService_shutdownWithOptions_origin___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __46__FBSystemService_shutdownWithOptions_origin___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = *(unsigned __int8 *)(a1 + 32);
  uint64_t v18 = 0;
  __int16 v19 = &v18;
  uint64_t v20 = 0x2050000000;
  uint64_t v8 = (void *)getCBControllerClass_softClass;
  uint64_t v21 = getCBControllerClass_softClass;
  if (!getCBControllerClass_softClass)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __getCBControllerClass_block_invoke;
    v17[3] = &unk_1E5C496D8;
    v17[4] = &v18;
    __getCBControllerClass_block_invoke((uint64_t)v17);
    uint64_t v8 = (void *)v19[3];
  }
  if (v7) { {
    uint64_t v9 = 1;
  }
  }
  else {
    uint64_t v9 = 2;
  }
  uint64_t v10 = v8;
  _Block_object_dispose(&v18, 8);
  id v11 = objc_alloc_init(v10);
  [v11 setDispatchQueue:v5];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __46__FBSystemService_shutdownWithOptions_origin___block_invoke_4;
  v14[3] = &unk_1E5C49F40;
  id v15 = v11;
  id v16 = v6;
  id v12 = v6;
  id v13 = v11;
  [v13 setLowPowerModeWithReason:v9 completion:v14];
}

void __46__FBSystemService_shutdownWithOptions_origin___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 invalidate];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __46__FBSystemService_shutdownWithOptions_origin___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (*(unsigned char *)(a1 + 40))
  {
    uint64_t v7 = 1;
  }
  else if ([*(id *)(a1 + 32) isUserInitiated])
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = 2;
  }
  id v8 = v6;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v9 = (void (*)(uint64_t, id))getNINotifySystemShutdownWithReasonSymbolLoc_ptr;
  __int16 v14 = getNINotifySystemShutdownWithReasonSymbolLoc_ptr;
  if (!getNINotifySystemShutdownWithReasonSymbolLoc_ptr)
  {
    uint64_t v10 = (void *)NearbyInteractionLibrary();
    v12[3] = (uint64_t)dlsym(v10, "NINotifySystemShutdownWithReason");
    getNINotifySystemShutdownWithReasonSymbolLoc_ptr = (_UNKNOWN *)v12[3];
    uint64_t v9 = (void (*)(uint64_t, id))v12[3];
  }
  _Block_object_dispose(&v11, 8);
  if (!v9) { {
    __46__FBSystemService_shutdownWithOptions_origin___block_invoke_5_cold_1();
  }
  }
  v9(v7, v8);
}

void __46__FBSystemService_shutdownWithOptions_origin___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  id v4 = [getNFHardwareManagerClass() sharedHardwareManager];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__FBSystemService_shutdownWithOptions_origin___block_invoke_7;
  v6[3] = &unk_1E5C498D8;
  id v7 = v3;
  id v5 = v3;
  [v4 actOnUserInitiatedSystemShutDown:4 completion:v6];
}

uint64_t __46__FBSystemService_shutdownWithOptions_origin___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)shutdownWithOptions:(unint64_t)a3
{
  id v3 = (FBSystemService *)[(FBSystemService *)self shutdownWithOptions:a3 forSource:0];
  [(FBSystemService *)v3 exitAndRelaunch:v5];
}

- (void)exitAndRelaunch:(BOOL)a3
{
}

- (void)prepareForExitAndRelaunch:(BOOL)a3
{
}

- (void)setSystemIdleSleepDisabled:(BOOL)a3 forReason:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  id v6 = +[FBSystemShell sharedInstance];
  [v6 _setSystemIdleSleepDisabled:v4 forReason:v5];
}

- (void)prepareDisplaysForExit
{
  id v2 = [MEMORY[0x1E4F39D28] serverIfRunning];
  [v2 removeAllDisplays];
}

- (BOOL)isPendingExit
{
  return BSAtomicGetFlag();
}

- (void)setPendingExit:(BOOL)a3
{
}

- (void)exitAndRelaunch:(BOOL)a3 withOptions:(unint64_t)a4
{
  char v4 = a4;
  BOOL v5 = a3;
  if ([(FBSystemService *)self isPendingExit]) { {
    return;
  }
  }
  [(FBSystemService *)self setPendingExit:1];
  id v7 = FBLogCommon();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      __int16 v13 = 0;
      uint64_t v9 = "Exiting...";
      uint64_t v10 = (uint8_t *)&v13;
LABEL_7:
      _os_log_impl(&dword_1A62FC000, v7, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
    }
  }
  else if (v8)
  {
    LOWORD(v12) = 0;
    uint64_t v9 = "Tearing Down...";
    uint64_t v10 = (uint8_t *)&v12;
    goto LABEL_7;
  }

  uint64_t v11 = [(FBSystemService *)self delegate];
  if (objc_opt_respondsToSelector()) { {
    [v11 systemServicePrepareForExit:self andRelaunch:v5];
  }
  }
  -[FBSystemService _performExitTasksForRelaunch:](self, "_performExitTasksForRelaunch:", v5, v12);
  if (!v5) { {
    BKSHIDServicesSetBacklightFactorWithFadeDuration();
  }
  }
  if ((v4 & 2) == 0) { {
    exit(0);
  }
  }
}

- (void)_terminateProcesses:(id)a3 forReason:(int64_t)a4 andReport:(BOOL)a5 withDescription:(id)a6 completion:(id)a7
{
  BOOL v9 = a5;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v25 = a6;
  uint64_t v12 = (void (**)(void))a7;
  id v24 = v11;
  if ([v11 count])
  {
    *(void *)buf = 0;
    char v37 = buf;
    uint64_t v38 = 0x2020000000;
    uint64_t v39 = 0;
    __int16 v13 = (void *)MEMORY[0x1E4F627F8];
    uint64_t v14 = [v11 count];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __86__FBSystemService__terminateProcesses_forReason_andReport_withDescription_completion___block_invoke;
    v33[3] = &unk_1E5C49FB0;
    char v35 = buf;
    id v34 = v12;
    id v15 = [v13 sentinelWithSignalCount:v14 signalHandler:v33];
    uint64_t v23 = v12;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v16 = v11;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v29 objects:v40 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v30 != v18) { {
            objc_enumerationMutation(v16);
          }
          }
          uint64_t v20 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          if ([v20 isCurrentProcess])
          {
            [v15 signal];
          }
          else
          {
            v26[0] = MEMORY[0x1E4F143A8];
            v26[1] = 3221225472;
            v26[2] = __86__FBSystemService__terminateProcesses_forReason_andReport_withDescription_completion___block_invoke_81;
            v26[3] = &unk_1E5C49FD8;
            int v28 = buf;
            id v27 = v15;
            [v20 _killForReason:a4 andReport:v9 withDescription:v25 completion:v26];
          }
        }
        uint64_t v17 = [v16 countByEnumeratingWithState:&v29 objects:v40 count:16];
      }
      while (v17);
    }

    _Block_object_dispose(buf, 8);
    uint64_t v21 = v23;
  }
  else
  {
    BOOL v22 = FBLogCommon();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A62FC000, v22, OS_LOG_TYPE_DEFAULT, "[FBSystemService] Found no processes to terminate.", buf, 2u);
    }

    uint64_t v21 = v12;
    if (v12)
    {
      v12[2]();
      uint64_t v21 = v12;
    }
  }
}

uint64_t __86__FBSystemService__terminateProcesses_forReason_andReport_withDescription_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t result = [a2 isComplete];
  if (result)
  {
    char v4 = FBLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      int v6 = 134217984;
      uint64_t v7 = v5;
      _os_log_impl(&dword_1A62FC000, v4, OS_LOG_TYPE_DEFAULT, "[FBSystemService] Completed termination of %lu process(es)", (uint8_t *)&v6, 0xCu);
    }

    uint64_t result = *(void *)(a1 + 32);
    if (result) { {
      return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) != 0);
    }
    }
  }
  return result;
}

uint64_t __86__FBSystemService__terminateProcesses_forReason_andReport_withDescription_completion___block_invoke_81(uint64_t a1)
{
  return [*(id *)(a1 + 32) signal];
}

- (void)terminateApplication:(id)a3 forReason:(int64_t)a4 andReport:(BOOL)a5 withDescription:(id)a6 completion:(id)a7
{
  uint64_t v9 = a5;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  id v15 = +[FBProcessManager sharedInstance];
  id v16 = [v15 applicationProcessesForBundleIdentifier:v12];

  if ([v16 count])
  {
    uint64_t v17 = v16;
  }
  else
  {
    id v29 = v14;
    long long v30 = self;
    id v31 = v13;
    int64_t v32 = a4;
    unsigned int v33 = v9;
    uint64_t v17 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v18 = (void *)MEMORY[0x1E4F96438];
    id v34 = v12;
    __int16 v19 = [MEMORY[0x1E4F96430] predicateMatchingBundleIdentifier:v12];
    uint64_t v20 = [v18 statesForPredicate:v19 withDescriptor:0 error:0];

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v21 = v20;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v37;
      do
      {
        uint64_t v25 = 0;
        do
        {
          if (*(void *)v37 != v24) { {
            objc_enumerationMutation(v21);
          }
          }
          BOOL v26 = [*(id *)(*((void *)&v36 + 1) + 8 * v25) process];
          if (v26)
          {
            id v27 = +[FBProcessManager sharedInstance];
            [v26 auditToken];
            int v28 = [v27 registerProcessForAuditToken:v35];

            if (v28) { {
              [v17 addObject:v28];
            }
            }
          }
          ++v25;
        }
        while (v23 != v25);
        uint64_t v23 = [v21 countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v23);
    }

    id v12 = v34;
    uint64_t v9 = v33;
    id v13 = v31;
    a4 = v32;
    id v14 = v29;
    self = v30;
  }
  [(FBSystemService *)self _terminateProcesses:v17 forReason:a4 andReport:v9 withDescription:v13 completion:v14];
}

- (void)terminateApplicationGroup:(int64_t)a3 forReason:(int64_t)a4 andReport:(BOOL)a5 withDescription:(id)a6 completion:(id)a7
{
  BOOL v22 = a5;
  int64_t v21 = a4;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  id v11 = a7;
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v13 = +[FBProcessManager sharedInstance];
  id v14 = [v13 allApplicationProcesses];

  uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v24;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v24 != v17) { {
          objc_enumerationMutation(v14);
        }
        }
        uint64_t v19 = *(void *)(*((void *)&v23 + 1) + 8 * v18);
        if (a3 || [*(id *)(*((void *)&v23 + 1) + 8 * v18) isForeground]) { {
          objc_msgSend(v12, "addObject:", v19, v21);
        }
        }
        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v16);
  }

  uint64_t v20 = [v12 allObjects];
  [(FBSystemService *)self _terminateProcesses:v20 forReason:v21 andReport:v22 withDescription:v10 completion:v11];
}

- (BOOL)_shouldPendRequestForClientSequenceNumber:(unint64_t)a3 clientCacheGUID:(id)a4 ourSequenceNumber:(unint64_t)a5 ourCacheGUID:(id)a6
{
  int v8 = [a4 isEqual:a6] ^ 1;
  if (a5 == a3) { {
    return v8;
  }
  }
  else {
    return 1;
  }
}

void __179__FBSystemService__reallyActivateApplication_requestID_options_serviceInstance_source_originalSource_isTrusted_sequenceNumber_cacheGUID_ourSequenceNumber_ourCacheGUID_withResult___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = [*(id *)(a1 + 56) dictionary];
  int v6 = [*(id *)(a1 + 64) auditToken];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __179__FBSystemService__reallyActivateApplication_requestID_options_serviceInstance_source_originalSource_isTrusted_sequenceNumber_cacheGUID_ourSequenceNumber_ourCacheGUID_withResult___block_invoke_3;
  v7[3] = &unk_1E5C4A0A0;
  id v8 = *(id *)(a1 + 72);
  [v2 systemService:v3 handleOpenApplicationRequest:v4 options:v5 origin:v6 withResult:v7];
}

void __179__FBSystemService__reallyActivateApplication_requestID_options_serviceInstance_source_originalSource_isTrusted_sequenceNumber_cacheGUID_ourSequenceNumber_ourCacheGUID_withResult___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  FBSOpenApplicationErrorCodeToString();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = FBSOpenApplicationErrorCreate();
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);
}

void __179__FBSystemService__reallyActivateApplication_requestID_options_serviceInstance_source_originalSource_isTrusted_sequenceNumber_cacheGUID_ourSequenceNumber_ourCacheGUID_withResult___block_invoke_4(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  int v6 = [*(id *)(a1 + 64) dictionary];
  uint64_t v7 = [*(id *)(a1 + 72) auditToken];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __179__FBSystemService__reallyActivateApplication_requestID_options_serviceInstance_source_originalSource_isTrusted_sequenceNumber_cacheGUID_ourSequenceNumber_ourCacheGUID_withResult___block_invoke_5;
  v8[3] = &unk_1E5C4A0A0;
  id v9 = *(id *)(a1 + 80);
  [v2 systemService:v3 handleOpenURLRequest:v4 application:v5 options:v6 origin:v7 withResult:v8];
}

void __179__FBSystemService__reallyActivateApplication_requestID_options_serviceInstance_source_originalSource_isTrusted_sequenceNumber_cacheGUID_ourSequenceNumber_ourCacheGUID_withResult___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  FBSOpenApplicationErrorCodeToString();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = FBSOpenApplicationErrorCreate();
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);
}

- (void)isPasscodeLockedOrBlockedWithResult:(id)a3
{
  uint64_t v5 = (void (**)(id, void))a3;
  [(FBSSerialQueue *)self->_queue assertOnQueue];
  uint64_t v4 = [(FBSystemService *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [v4 systemService:self isPasscodeLockedOrBlockedWithResult:v5];
  }
  else if (v5)
  {
    v5[2](v5, 0);
  }
}

- (void)handleActions:(id)a3 source:(id)a4 withResult:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(FBSSerialQueue *)self->_queue assertOnQueue];
  uint64_t v27 = MEMORY[0x1E4F143A8];
  uint64_t v28 = 3221225472;
  id v29 = __51__FBSystemService_handleActions_source_withResult___block_invoke;
  long long v30 = &unk_1E5C4A118;
  id v11 = v8;
  id v31 = v11;
  id v12 = v10;
  id v32 = v12;
  id v13 = (void (**)(void, void))MEMORY[0x1AD0B8C50](&v27);
  id v14 = [(FBSystemService *)self delegate];
  if (([v9 hasEntitlement:@"com.apple.frontboard.launchapplications"] & 1) == 0
    && ([v9 hasEntitlement:@"com.apple.backboardd.launchapplications"] & 1) == 0
    && ([v9 hasEntitlement:@"com.apple.springboard.launchapplications"] & 1) == 0)
  {
    uint64_t v17 = FBLogCommon();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = @"com.apple.frontboard.launchapplications";
      _os_log_impl(&dword_1A62FC000, v17, OS_LOG_TYPE_DEFAULT, "[FBSystemService] Entitlement %@ is required to send actions to the system app.", buf, 0xCu);
    }
    uint64_t v26 = 3;
    goto LABEL_14;
  }
  char v15 = objc_opt_respondsToSelector();
  uint64_t v16 = FBLogCommon();
  uint64_t v17 = v16;
  if ((v15 & 1) == 0)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) { {
      -[FBSystemService handleActions:source:withResult:](v17, v19, v20, v21, v22, v23, v24, v25);
    }
    }
    uint64_t v26 = 8;
LABEL_14:

    v13[2](v13, v26);
    goto LABEL_15;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v11, "fbs_singleLineDescriptionOfBSActions");
    uint64_t v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    id v34 = v18;
    _os_log_impl(&dword_1A62FC000, v17, OS_LOG_TYPE_DEFAULT, "[FBSystemService] Received action(s): %{public}@", buf, 0xCu);
  }
  [v14 systemService:self handleActions:v11 origin:v9 withResult:v13];
LABEL_15:
}

uint64_t __51__FBSystemService_handleActions_source_withResult___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v4 = FBLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) { {
      __51__FBSystemService_handleActions_source_withResult___block_invoke_cold_1(a1, a2, v4);
    }
    }
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) { {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  }
  return result;
}

- (void)canOpenApplication:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, id))a4;
  if (v7)
  {
    if (v6)
    {
      id v8 = [MEMORY[0x1E4F62880] currentContext];
      id v9 = [v8 remoteProcess];

      if (v9)
      {
        id v10 = [(FBSystemService *)self _applicationInfoProvider];
        id v11 = [v10 applicationInfoForBundleIdentifier:v6];

        id v25 = 0;
        [(FBSystemService *)self _isTrustedRequest:@"(CanOpen)" forCaller:v9 fromClient:v9 forBundleInfo:v11 withOptions:0 fatalError:&v25];
        id v12 = v25;
        if (v12)
        {
          v7[2](v7, v12);
        }
        else
        {
          id v14 = [(FBSystemService *)self delegate];
          if (v14 && (objc_opt_respondsToSelector() & 1) != 0)
          {
            char v15 = [MEMORY[0x1E4F62880] currentContext];
            uint64_t v16 = [v15 instance];

            uint64_t v17 = [(FBSystemService *)self queue];
            v19[0] = MEMORY[0x1E4F143A8];
            v19[1] = 3221225472;
            v19[2] = __49__FBSystemService_canOpenApplication_completion___block_invoke;
            v19[3] = &unk_1E5C4A190;
            id v20 = v16;
            id v21 = v14;
            uint64_t v22 = self;
            id v23 = v6;
            uint64_t v24 = v7;
            id v18 = v16;
            [v17 performAsync:v19];
          }
          else
          {
            FBSOpenApplicationErrorCreate();
            id v18 = (id)objc_claimAutoreleasedReturnValue();
            v7[2](v7, v18);
          }
        }
      }
      else
      {
        id v13 = FBSOpenApplicationErrorCreate();
        v7[2](v7, v13);
      }
    }
    else
    {
      id v9 = FBSOpenApplicationErrorCreate();
      v7[2](v7, v9);
    }
  }
}

void __49__FBSystemService_canOpenApplication_completion___block_invoke(uint64_t a1)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__FBSystemService_canOpenApplication_completion___block_invoke_2;
  v6[3] = &unk_1E5C4A078;
  id v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void **)(a1 + 56);
  id v7 = v3;
  uint64_t v8 = v4;
  id v9 = v5;
  id v10 = *(id *)(a1 + 64);
  FBOpenAppSystemServiceExecuteCallOut(v2, v6);
}

void __49__FBSystemService_canOpenApplication_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__FBSystemService_canOpenApplication_completion___block_invoke_3;
  v4[3] = &unk_1E5C4A0A0;
  uint64_t v3 = *(void *)(a1 + 48);
  id v5 = *(id *)(a1 + 56);
  [v1 systemService:v2 canActivateApplication:v3 withResult:v4];
}

void __49__FBSystemService_canOpenApplication_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    FBSOpenApplicationErrorCreate();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v5);
  }
  else
  {
    uint64_t v3 = *(void (**)(uint64_t))(v2 + 16);
    uint64_t v4 = *(void *)(a1 + 32);
    v3(v4);
  }
}

void __79__FBSystemService_openApplication_withOptions_originator_requestID_completion___block_invoke_191(uint64_t a1)
{
  id v3 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  uint64_t v2 = [*(id *)(a1 + 32) url];
  [v3 _LSFailedToOpenURL:v2 withBundle:*(void *)(a1 + 40)];
}

- (void)_setInfoProvider
{
  p_defaultInfoProviderLock = &self->_defaultInfoProviderLock;
  os_unfair_lock_lock(&self->_defaultInfoProviderLock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([WeakRetained systemServiceApplicationInfoProvider:self],
        (uint64_t v4 = (FBSApplicationInfoProvider *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v4 = (FBSApplicationInfoProvider *)objc_alloc_init(MEMORY[0x1E4F62990]);
  }
  lock_defaultInfoProvider = self->_lock_defaultInfoProvider;
  self->_lock_defaultInfoProvider = v4;

  os_unfair_lock_unlock(p_defaultInfoProviderLock);
}

- (void)_performExitTasksForRelaunch:(BOOL)a3
{
  if ([MEMORY[0x1E4F628D8] isServerProcess]) { {
    [MEMORY[0x1E4F628D8] synchronize];
  }
  }
  uint64_t v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v4 synchronize];

  CFPreferencesSynchronize((CFStringRef)*MEMORY[0x1E4F1D3B8], (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  if (!a3)
  {
    signal(15, (void (__cdecl *)(int))1);
  }
}

- (BOOL)_isAllowListedLaunchSuspendedApp:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (_isAllowListedLaunchSuspendedApp__onceToken != -1)
  {
    dispatch_once(&_isAllowListedLaunchSuspendedApp__onceToken, &__block_literal_global_244);
    if (v4) { {
      goto LABEL_3;
    }
    }
LABEL_5:
    char v5 = 0;
    goto LABEL_6;
  }
  if (!v3) { {
    goto LABEL_5;
  }
  }
LABEL_3:
  char v5 = [(id)_isAllowListedLaunchSuspendedApp____allowListedLaunchSuspendedApps containsObject:v4];
LABEL_6:

  return v5;
}

void __52__FBSystemService__isAllowListedLaunchSuspendedApp___block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"com.apple.Music", @"com.apple.mobilemail", @"com.apple.AdSheetPhone", @"com.apple.AdSheetPad", @"com.apple.DataActivation", 0);
  uint64_t v1 = (void *)_isAllowListedLaunchSuspendedApp____allowListedLaunchSuspendedApps;
  _isAllowListedLaunchSuspendedApp____allowListedLaunchSuspendedApps = v0;
}

- (unint64_t)_mapShutdownOptionsToOptions:(id)a3
{
  uint64_t v3 = [a3 rebootType];
  if (v3 == 1) { {
    return 1;
  }
  }
  else {
    return 2 * (v3 == 2);
  }
}

- (FBSSerialQueue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)initWithQueue:.cold.1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = objc_msgSend(NSString, "stringWithUTF8String:", "AKSEvent *soft_AKSEventsRegister(__strong dispatch_queue_t, void (^__strong)(AKSEventType, CFDictionaryRef))");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"FBSystemService.m", 55, @"%s", dlerror());

  __break(1u);
}

void __33__FBSystemService_initWithQueue___block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A62FC000, log, OS_LOG_TYPE_ERROR, "Received device inactivity notification. Rebooting...", v1, 2u);
}

+ (void)currentOpenApplicationInstance
{
  uint64_t v1 = NSStringFromSelector(a1);
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v3, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, v5, v6, v7, 2u);
}

void __46__FBSystemService_shutdownWithOptions_origin___block_invoke_5_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = objc_msgSend(NSString, "stringWithUTF8String:", "void soft_NINotifySystemShutdownWithReason(NISystemShutdownReason, void (^__strong)(NSError * _Nullable __strong))");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"FBSystemService.m", 80, @"%s", dlerror());

  __break(1u);
}

- (void)_activateBundleID:requestID:isTrusted:options:serviceInstance:source:originalSource:withResult:.cold.1()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_10();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_activateBundleID:requestID:isTrusted:options:serviceInstance:source:originalSource:withResult:.cold.2()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_10();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_activateBundleID:requestID:isTrusted:options:serviceInstance:source:originalSource:withResult:.cold.3()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_10();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_activateBundleID:requestID:isTrusted:options:serviceInstance:source:originalSource:withResult:.cold.4()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_10();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_activateBundleID:requestID:isTrusted:options:serviceInstance:source:originalSource:withResult:.cold.5()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_10();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)handleActions:(uint64_t)a3 source:(uint64_t)a4 withResult:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __51__FBSystemService_handleActions_source_withResult___block_invoke_cold_1(uint64_t a1, int a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = FBSOpenApplicationErrorCodeToString();
  OUTLINED_FUNCTION_11_0();
  __int16 v7 = 1024;
  int v8 = a2;
  _os_log_error_impl(&dword_1A62FC000, a3, OS_LOG_TYPE_ERROR, "[FBSystemService] Error handling sent actions %{public}@: %{public}@ (%d)", v6, 0x1Cu);
}

- (void)openApplication:(uint64_t)a3 withOptions:(uint64_t)a4 originator:(uint64_t)a5 requestID:(uint64_t)a6 completion:(uint64_t)a7 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)openApplication:(uint64_t)a3 withOptions:(uint64_t)a4 originator:(uint64_t)a5 requestID:(uint64_t)a6 completion:(uint64_t)a7 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)openApplication:(uint8_t *)buf withOptions:(os_log_t)log originator:requestID:completion:.cold.3(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1A62FC000, log, OS_LOG_TYPE_ERROR, "[FBSystemService][%{public}@] Ignoring click attribution that failed authentication: %{public}@.", buf, 0x16u);
}

- (void)openApplication:(uint64_t)a3 withOptions:(uint64_t)a4 originator:(uint64_t)a5 requestID:(uint64_t)a6 completion:(uint64_t)a7 .cold.4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __79__FBSystemService_openApplication_withOptions_originator_requestID_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F28F80] processInfo];
  uint64_t v4 = [v3 processName];
  OUTLINED_FUNCTION_11_0();
  _os_log_error_impl(&dword_1A62FC000, a2, OS_LOG_TYPE_ERROR, "[%{public}@] %{public}@ called open application completion more than once. Ignoring.", v5, 0x16u);
}

@end