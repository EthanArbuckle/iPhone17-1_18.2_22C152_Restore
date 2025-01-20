@interface FBWorkspaceDomain
+ (id)debugDescription;
+ (id)endpoint;
+ (id)sharedInstance;
+ (void)startListener;
- (BOOL)allowsDirectConnections;
- (BOOL)monitorAllSuspendableProcesses;
- (BOOL)selfAssertRuntime;
- (FBWorkspaceDomain)init;
- (NSString)description;
- (char)_init;
- (char)assertionAttributesForLaunchIntent:(char *)a1;
- (char)assertionAttributesForWorkspaceState:(char *)a1;
- (id)_listener;
- (id)endpoint;
- (id)endpointInjectorTargetingProcess:(uint64_t)a1;
- (id)nullEndpoint;
- (id)reconnectableWorkspaces;
- selfAssertionAttributesForWorkspaceState:(uint64_t)a1;
- (id)startListener;
- (uint64_t)defaultSceneInterruptionPolicy;
- (uint64_t)defaultWorkspace;
- (uint64_t)machName;
- (uint64_t)preregisteredWorkspaces;
- (void)_ensureAttributes;
- (void)_init;
- (void)dealloc;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
@end

@implementation FBWorkspaceDomain

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_4 != -1) { {
    dispatch_once(&sharedInstance_onceToken_4, &__block_literal_global_9);
  }
  }
  v0 = (void *)sharedInstance___sharedInstance_1;

  return v0;
}

- (id)reconnectableWorkspaces
{
  if (a1)
  {
    v1 = (void *)MEMORY[0x1E4F1CAD0];
    if (*(void *)(a1 + 208))
    {
      v2 = [*(id *)(a1 + 24) allKeys];
      v3 = [v1 setWithArray:v2];
    }
    else
    {
      v3 = [MEMORY[0x1E4F1CAD0] set];
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void __63__FBWorkspaceDomain_listener_didReceiveConnection_withContext___block_invoke_201(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = +[FBProcessManager sharedInstance];
  v3 = *(void **)(a1 + 32);
  if (v3) { {
    [v3 realToken];
  }
  }
  else {
    memset(v10, 0, sizeof(v10));
  }
  v4 = [v2 registerProcessForAuditToken:v10];

  if (v4)
  {
    v5 = [v4 workspace];
    v6 = FBLogCommon();
    v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v8 = [v4 workspace];
        *(_DWORD *)buf = 134218242;
        v12 = v8;
        __int16 v13 = 2114;
        v14 = v4;
        _os_log_impl(&dword_1A62FC000, v7, OS_LOG_TYPE_INFO, "FBWorkspaceDomain: Assigning new workspace connection to workspace (%p) owned by process: %{public}@", buf, 0x16u);
      }
      -[FBWorkspace _setIncomingConnection:]((uint64_t)v5, *(void **)(a1 + 40));
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) { {
        __63__FBWorkspaceDomain_listener_didReceiveConnection_withContext___block_invoke_201_cold_2();
      }
      }

      [*(id *)(a1 + 40) invalidate];
    }
  }
  else
  {
    v9 = FBLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) { {
      __63__FBWorkspaceDomain_listener_didReceiveConnection_withContext___block_invoke_201_cold_1(a1, (void *)(a1 + 32), v9);
    }
    }

    [*(id *)(a1 + 40) invalidate];
  }
}

- (BOOL)selfAssertRuntime
{
  if (result) { {
    return *(void *)(result + 16) != 0;
  }
  }
  return result;
}

- (id)endpointInjectorTargetingProcess:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = -[FBWorkspaceDomain _listener]((id *)a1);
    if (*(unsigned char *)(a1 + 10))
    {
      v5 = [v3 identity];
      v6 = [MEMORY[0x1E4F96408] identityOfCurrentProcess];
      int v7 = [v5 isEqual:v6];

      if (v7)
      {
        v8 = (void *)MEMORY[0x1E4F62B08];
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __54__FBWorkspaceDomain_endpointInjectorTargetingProcess___block_invoke;
        v21[3] = &unk_1E5C4A3A8;
        v22 = v4;
        [v8 _registerBlockForWorkspaceCreation:v21];
        a1 = 0;
        v9 = v22;
      }
      else
      {
        uint64_t v10 = [v3 pid];
        if ((int)v10 < 1)
        {
          v9 = FBLogProcessWorkspace();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) { {
            -[FBWorkspaceDomain endpointInjectorTargetingProcess:]();
          }
          }
          a1 = 0;
        }
        else
        {
          uint64_t v11 = v10;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __54__FBWorkspaceDomain_endpointInjectorTargetingProcess___block_invoke_2;
          block[3] = &unk_1E5C49AE0;
          v20 = v4;
          if (endpointInjectorTargetingProcess__onceToken != -1) { {
            dispatch_once(&endpointInjectorTargetingProcess__onceToken, block);
          }
          }
          -[FBWorkspaceDomain _ensureAttributes](a1);
          id v12 = objc_alloc(MEMORY[0x1E4F96318]);
          __int16 v13 = [MEMORY[0x1E4F96478] targetWithPid:v11];
          a1 = [v12 initWithExplanation:@"workspace-endpoint-injection" target:v13 attributes:*(void *)(a1 + 192)];

          id v18 = 0;
          LODWORD(v12) = [(id)a1 acquireWithError:&v18];
          id v14 = v18;
          uint64_t v15 = v14;
          if (!v12 || v14)
          {
            v16 = FBLogProcessWorkspace();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) { {
              -[FBWorkspaceDomain endpointInjectorTargetingProcess:]();
            }
            }
          }
          v9 = v20;
        }
      }
    }
    else
    {
      a1 = 0;
    }
  }

  return (id)a1;
}

- (char)assertionAttributesForWorkspaceState:(char *)a1
{
  if (a1)
  {
    id v3 = a1;
    -[FBWorkspaceDomain _ensureAttributes]((uint64_t)a1);
    a1 = 0;
    uint64_t v4 = 112;
    switch(a2)
    {
      case 0u:
        break;
      case 1u:
        goto LABEL_12;
      case 2u:
        uint64_t v4 = 120;
        goto LABEL_12;
      case 3u:
        uint64_t v4 = 128;
        goto LABEL_12;
      case 4u:
        uint64_t v4 = 136;
        goto LABEL_12;
      case 5u:
        uint64_t v4 = 144;
        goto LABEL_12;
      case 6u:
        uint64_t v4 = 152;
        goto LABEL_12;
      case 7u:
        uint64_t v4 = 160;
        goto LABEL_12;
      case 8u:
        uint64_t v4 = 168;
        goto LABEL_12;
      case 9u:
        uint64_t v4 = 176;
        goto LABEL_12;
      case 0xAu:
        uint64_t v4 = 184;
LABEL_12:
        a1 = (char *)*(id *)&v3[v4];
        break;
      default:
        v6 = NSString;
        int v7 = NSStringFromFBWorkspaceAssertionState(a2);
        v8 = [v6 stringWithFormat:@"requested attributes for FBWorkspaceAssertionState %@", v7];

        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
          -[FBWorkspaceDomain assertionAttributesForWorkspaceState:]();
        }
        }
        [v8 UTF8String];
        result = (char *)_bs_set_crash_log_message();
        __break(0);
        return result;
    }
  }

  return a1;
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  v9 = [v7 remoteToken];
  uint64_t v10 = v9;
  if (v9 && ![v9 isInvalid])
  {
    if ([v8 decodeBoolForKey:@"targetsClientEndpoint"])
    {
      BOOL allowsDirectConnections = self->_allowsDirectConnections;
      __int16 v13 = FBLogCommon();
      uint64_t v11 = v13;
      if (!allowsDirectConnections)
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) { {
          -[FBWorkspaceDomain listener:didReceiveConnection:withContext:]();
        }
        }
        goto LABEL_5;
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v25 = v10;
        _os_log_impl(&dword_1A62FC000, v11, OS_LOG_TYPE_INFO, "FBWorkspaceDomain: Registering new direct workspace connection with remoteToken=%{public}@", buf, 0xCu);
      }

      id v14 = (void *)MEMORY[0x1E4F62B08];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __63__FBWorkspaceDomain_listener_didReceiveConnection_withContext___block_invoke;
      v22[3] = &unk_1E5C4A3A8;
      id v23 = v7;
      [v14 _registerBlockForWorkspaceCreation:v22];
      uint64_t v15 = v23;
    }
    else
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __63__FBWorkspaceDomain_listener_didReceiveConnection_withContext___block_invoke_201;
      v19[3] = &unk_1E5C497A0;
      id v20 = v10;
      id v21 = v7;
      v16 = (void (**)(void))MEMORY[0x1AD0B8C50](v19);
      v17 = +[FBProcessManager sharedInstanceIfExists];

      if (v17)
      {
        v16[2](v16);
      }
      else
      {
        id v18 = dispatch_get_global_queue(33, 0);
        dispatch_async(v18, v16);
      }
      uint64_t v15 = v20;
    }

    goto LABEL_18;
  }
  uint64_t v11 = FBLogCommon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) { {
    -[FBWorkspaceDomain listener:didReceiveConnection:withContext:]();
  }
  }
LABEL_5:

  [v7 invalidate];
LABEL_18:
}

- (BOOL)monitorAllSuspendableProcesses
{
  if (result) { {
    return *(unsigned char *)(result + 12) != 0;
  }
  }
  return result;
}

- (id)nullEndpoint
{
  if (a1)
  {
    a1 = (id *)a1[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (char)assertionAttributesForLaunchIntent:(char *)a1
{
  if (a1)
  {
    uint64_t v4 = a1;
    -[FBWorkspaceDomain _ensureAttributes]((uint64_t)a1);
    if ((unint64_t)(a2 - 1) > 4) { {
      a1 = 0;
    }
    }
    else {
      a1 = (char *)*(id *)&v4[qword_1A6386468[a2 - 1]];
    }
    uint64_t v2 = vars8;
  }
  return a1;
}

- (void)_ensureAttributes
{
  if (a1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__FBWorkspaceDomain__ensureAttributes__block_invoke;
    block[3] = &unk_1E5C49AE0;
    void block[4] = a1;
    if (_ensureAttributes_onceToken != -1) { {
      dispatch_once(&_ensureAttributes_onceToken, block);
    }
    }
  }
}

- (id)endpoint
{
  if (a1)
  {
    uint64_t v1 = -[FBWorkspaceDomain _listener](a1);
    uint64_t v2 = [v1 endpoint];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

- (id)_listener
{
  if (a1)
  {
    uint64_t v2 = a1;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __30__FBWorkspaceDomain__listener__block_invoke;
    block[3] = &unk_1E5C49AE0;
    void block[4] = a1;
    if (_listener_onceToken != -1) { {
      dispatch_once(&_listener_onceToken, block);
    }
    }
    a1 = (id *)v2[7];
    uint64_t v1 = block[8];
  }
  return a1;
}

- (FBWorkspaceDomain)init
{
  uint64_t v4 = [NSString stringWithFormat:@"init is not allowed on FBWorkspaceDomain"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v5 = NSStringFromSelector(a2);
    v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    uint64_t v10 = v5;
    __int16 v11 = 2114;
    id v12 = v7;
    __int16 v13 = 2048;
    id v14 = self;
    __int16 v15 = 2114;
    v16 = @"FBWorkspaceDomain.m";
    __int16 v17 = 1024;
    int v18 = 89;
    __int16 v19 = 2114;
    id v20 = v4;
    _os_log_error_impl(&dword_1A62FC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (FBWorkspaceDomain *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (char)_init
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  if (!a1) { {
    return 0;
  }
  }
  v96.receiver = a1;
  v96.super_class = (Class)FBWorkspaceDomain;
  uint64_t v1 = (char *)objc_msgSendSuper2(&v96, sel_init);
  if (v1)
  {
    uint64_t v2 = [MEMORY[0x1E4F963E8] currentProcess];
    int v3 = objc_msgSend(v2, "fb_canTaskSuspend");
    uint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
    if (!v3) { {
      uint64_t v4 = 0;
    }
    }
    *((void *)v1 + 2) = v4;

    v5 = [MEMORY[0x1E4F628B8] bootstrapConfiguration];
    v6 = [MEMORY[0x1E4F62848] environmentAliases];
    id v7 = [MEMORY[0x1E4F62888] defaultShellMachName];
    id v8 = [v6 resolveMachService:v7];

    int v9 = [MEMORY[0x1E4F62B38] identifier];
    uint64_t v10 = [v5 domainsContainingServiceIdentifier:v9];
    if (![v10 count])
    {
      id v21 = [v5 domainForMachName:v8];

      if (v21)
      {
        v75 = [NSString stringWithFormat:@"if we own the defaultShellMachName (%@) then %@ must be registered there", v8, v9];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
          -[FBWorkspaceDomain _init]();
        }
        }
        [v75 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x1A6340098);
      }
      *((_WORD *)v1 + 4) = 0;
      v22 = (void *)*((void *)v1 + 25);
      *((void *)v1 + 25) = @"com.apple.frontboard.workspace-service.fallback";

      id v23 = (void *)*((void *)v1 + 26);
      *((void *)v1 + 26) = 0;

      *(_DWORD *)(v1 + 10) = 1;
      v24 = (void *)*((void *)v1 + 4);
      *((void *)v1 + 4) = 0;

      uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionary];
      uint64_t v26 = (void *)*((void *)v1 + 3);
      *((void *)v1 + 3) = v25;

      v27 = [MEMORY[0x1E4F28B50] mainBundle];
      v28 = [v27 infoDictionary];
      v29 = [v28 objectForKey:@"FBWorkspaceDynamicDomainOption_SelfAssertRuntime"];

      if (objc_opt_respondsToSelector())
      {
        [v29 BOOLValue];
        *((void *)v1 + 2) = BSSettingFlagForBool();
      }
      goto LABEL_53;
    }
    if ([v10 count] != 1)
    {
      v73 = [NSString stringWithFormat:@"must have one and only one domain specify %@ : domains=%@", v9, v10];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBWorkspaceDomain _init]();
      }
      }
      [v73 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A633FFE0);
    }
    __int16 v11 = [v10 anyObject];
    uint64_t v12 = [v5 domainForMachName:v8];
    if (v12 && (void *)v12 != v11)
    {
      v74 = [NSString stringWithFormat:@"if we own the defaultShellMachName (%@) then %@ must be registered there", v8, v9];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBWorkspaceDomain _init]();
      }
      }
      [v74 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A634003CLL);
    }
    v82 = (void *)v12;
    char v13 = 1;
    v1[8] = 1;
    v1[9] = v12 != 0;
    id v14 = [v11 identifier];
    uint64_t v15 = [v14 copy];
    v16 = (void *)*((void *)v1 + 25);
    *((void *)v1 + 25) = v15;

    __int16 v17 = [v11 machName];
    uint64_t v18 = [v17 copy];
    __int16 v19 = (void *)*((void *)v1 + 26);
    *((void *)v1 + 26) = v18;

    v86 = v11;
    v87 = [v11 serviceForIdentifier:v9];
    v84 = [v87 optionForKey:@"InjectEndpoint"];
    if (objc_opt_respondsToSelector()) { {
      char v13 = [v84 BOOLValue];
    }
    }
    v1[10] = v13;
    id v20 = [v87 optionForKey:@"AssertVisibility"];
    v85 = v20;
    if (objc_opt_respondsToSelector())
    {
      v1[11] = [v20 BOOLValue];
    }
    else
    {
      v30 = [MEMORY[0x1E4F627F0] tokenForCurrentProcess];
      v1[11] = [v30 hasEntitlement:@"com.apple.runningboard.primitiveattribute"];
    }
    v31 = [v87 optionForKey:@"SelfAssertRuntime"];
    if (objc_opt_respondsToSelector())
    {
      [v31 BOOLValue];
      *((void *)v1 + 2) = BSSettingFlagForBool();
    }
    v81 = v31;
    v1[12] = v1[9];
    v32 = [v11 loadRBSLaunchIdentifiers];
    char v33 = [v32 containsObject:*MEMORY[0x1E4F62700]];

    v1[13] = v33;
    v34 = [v87 optionForKey:@"DefaultWorkspace"];
    objc_opt_class();
    v80 = v34;
    if (objc_opt_isKindOfClass())
    {
      if ([v34 isEqualToString:@"FBSceneManager"])
      {
        v35 = (void *)*((void *)v1 + 4);
        *((void *)v1 + 4) = @"FBSceneManager";
      }
      else
      {
        uint64_t v36 = [v34 copy];
        v35 = (void *)*((void *)v1 + 4);
        *((void *)v1 + 4) = v36;
      }
    }
    else
    {
      v35 = (void *)*((void *)v1 + 4);
      *((void *)v1 + 4) = 0;
    }
    v37 = v85;

    v38 = [v87 optionForKey:@"RegisterWorkspaces"];
    if (!v38)
    {
      v38 = [v87 optionForKey:@"ReconnectWorkspaces"];
      if (!v38)
      {
        if (v1[9])
        {
          v63 = +[FBWorkspaceRegistration registrationWithIdentifier:@"FBSceneManager" options:0];
          uint64_t v70 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:");
          v71 = (void *)*((void *)v1 + 3);
          *((void *)v1 + 3) = v70;
        }
        else
        {
          uint64_t v72 = [MEMORY[0x1E4F1C9E8] dictionary];
          v63 = (void *)*((void *)v1 + 3);
          *((void *)v1 + 3) = v72;
        }
LABEL_52:

        v29 = v86;
LABEL_53:

        uint64_t v64 = [MEMORY[0x1E4F62888] nullEndpointForService:v9 instance:0];
        v65 = (void *)*((void *)v1 + 5);
        *((void *)v1 + 5) = v64;

        if (*((void *)v1 + 2))
        {
          v66 = FBLogProcessWorkspace();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
          {
            int IsYes = BSSettingFlagIsYes();
            *(_DWORD *)buf = 67109120;
            int v98 = IsYes;
            _os_log_impl(&dword_1A62FC000, v66, OS_LOG_TYPE_DEFAULT, "This process will acquire workspace self-assertions (enhanced: %{BOOL}u)", buf, 8u);
          }
        }
        if (*((void *)v1 + 26)) { {
          id v68 = -[FBWorkspaceDomain _listener]((id *)v1);
        }
        }

        return v1;
      }
    }
    v39 = [MEMORY[0x1E4F1CA60] dictionary];
    objc_opt_class();
    v83 = v38;
    if (objc_opt_isKindOfClass())
    {
      v76 = v10;
      v77 = v9;
      v78 = v8;
      v79 = v5;
      long long v94 = 0u;
      long long v95 = 0u;
      long long v92 = 0u;
      long long v93 = 0u;
      id v40 = v38;
      uint64_t v41 = [v40 countByEnumeratingWithState:&v92 objects:v100 count:16];
      if (v41)
      {
        uint64_t v42 = v41;
        uint64_t v43 = *(void *)v93;
        do
        {
          for (uint64_t i = 0; i != v42; ++i)
          {
            if (*(void *)v93 != v43) { {
              objc_enumerationMutation(v40);
            }
            }
            v45 = +[FBWorkspaceRegistration registrationWithIdentifier:*(void *)(*((void *)&v92 + 1) + 8 * i) options:0];
            v46 = v45;
            if (v45)
            {
              v47 = [v45 identifier];
              [v39 setObject:v46 forKey:v47];
            }
          }
          uint64_t v42 = [v40 countByEnumeratingWithState:&v92 objects:v100 count:16];
        }
        while (v42);
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) { {
        goto LABEL_48;
      }
      }
      v76 = v10;
      v77 = v9;
      v78 = v8;
      v79 = v5;
      long long v90 = 0u;
      long long v91 = 0u;
      long long v88 = 0u;
      long long v89 = 0u;
      id v48 = v38;
      uint64_t v49 = [v48 countByEnumeratingWithState:&v88 objects:v99 count:16];
      if (v49)
      {
        uint64_t v50 = v49;
        uint64_t v51 = *(void *)v89;
        do
        {
          for (uint64_t j = 0; j != v50; ++j)
          {
            if (*(void *)v89 != v51) { {
              objc_enumerationMutation(v48);
            }
            }
            uint64_t v53 = *(void *)(*((void *)&v88 + 1) + 8 * j);
            v54 = [v48 objectForKey:v53];
            v55 = +[FBWorkspaceRegistration registrationWithIdentifier:v53 options:v54];
            v56 = v55;
            if (v55)
            {
              v57 = [v55 identifier];
              [v39 setObject:v56 forKey:v57];
            }
          }
          uint64_t v50 = [v48 countByEnumeratingWithState:&v88 objects:v99 count:16];
        }
        while (v50);
      }
    }

    id v8 = v78;
    v5 = v79;
    uint64_t v10 = v76;
    int v9 = v77;
    v37 = v85;
LABEL_48:
    if (*((void *)v1 + 4))
    {
      v58 = objc_msgSend(v39, "objectForKey:");

      if (!v58)
      {
        v59 = +[FBWorkspaceRegistration registrationWithIdentifier:*((void *)v1 + 4) options:0];
        v60 = [v59 identifier];
        [v39 setObject:v59 forKey:v60];

        v37 = v85;
      }
    }
    uint64_t v61 = [v39 copy];
    v62 = (void *)*((void *)v1 + 3);
    *((void *)v1 + 3) = v61;

    v63 = v83;
    goto LABEL_52;
  }
  return v1;
}

- (id)startListener
{
  if (result) { {
    return (id *)-[FBWorkspaceDomain _listener](result);
  }
  }
  return result;
}

- (void)dealloc
{
  uint64_t v4 = [NSString stringWithFormat:@"dealloc is not allowed on FBWorkspaceDomain"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v5 = NSStringFromSelector(a2);
    v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v8 = 138544642;
    int v9 = v5;
    __int16 v10 = 2114;
    __int16 v11 = v7;
    __int16 v12 = 2048;
    char v13 = self;
    __int16 v14 = 2114;
    uint64_t v15 = @"FBWorkspaceDomain.m";
    __int16 v16 = 1024;
    int v17 = 227;
    __int16 v18 = 2114;
    __int16 v19 = v4;
    _os_log_error_impl(&dword_1A62FC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
  }
  [v4 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

void __35__FBWorkspaceDomain_sharedInstance__block_invoke()
{
  v0 = -[FBWorkspaceDomain _init]([FBWorkspaceDomain alloc]);
  uint64_t v1 = (void *)sharedInstance___sharedInstance_1;
  sharedInstance___sharedInstance_1 = (uint64_t)v0;
}

- (uint64_t)defaultSceneInterruptionPolicy
{
  if (result)
  {
    if (*(unsigned char *)(result + 9)) { {
      return 3;
    }
    }
    else {
      return 1;
    }
  }
  return result;
}

- (BOOL)allowsDirectConnections
{
  if (result) { {
    return *(unsigned char *)(result + 13) != 0;
  }
  }
  return result;
}

void __54__FBWorkspaceDomain_endpointInjectorTargetingProcess___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 endpoint];
  [v3 _registerSourceEndpoint:v4];
}

void __54__FBWorkspaceDomain_endpointInjectorTargetingProcess___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = [*(id *)(a1 + 32) endpoint];
  uint64_t v2 = FBLogProcessWorkspace();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [v1 targetDescription];
    int v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1A62FC000, v2, OS_LOG_TYPE_DEFAULT, "FBWorkspaceDomain: registering saved endowment for workspace endpoint : %{public}@", (uint8_t *)&v5, 0xCu);
  }
  id v4 = [MEMORY[0x1E4F62B38] identifier];
  [v1 saveAsInjectorEndowmentForKey:v4];
}

- selfAssertionAttributesForWorkspaceState:(uint64_t)a1
{
  v13[1] = *MEMORY[0x1E4F143B8];
  if (!a1) { {
    goto LABEL_8;
  }
  }
  if (!a2)
  {
    int v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"inoutState != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspaceDomain selfAssertionAttributesForWorkspaceState:]();
    }
    }
    [v9 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A63405A8);
  }
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
    __int16 v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_selfAssertRuntime != BSSettingFlagNo"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspaceDomain selfAssertionAttributesForWorkspaceState:]();
    }
    }
    [v10 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A634060CLL);
  }
  if (*a2)
  {
    if (v3 == 1)
    {
      if (FBWorkspaceAssertionStateIsForeground(*a2))
      {
        id v4 = [MEMORY[0x1E4F96358] attributeWithDomain:@"com.apple.frontboard" name:@"Workspace-ForegroundActive-NoSuspend"];
        v13[0] = v4;
        char v5 = 5;
        v6 = (void **)v13;
      }
      else
      {
        id v4 = [MEMORY[0x1E4F96358] attributeWithDomain:@"com.apple.frontboard" name:@"Workspace-BackgroundActive-NoSuspend"];
        __int16 v12 = v4;
        char v5 = 2;
        v6 = &v12;
      }
    }
    else
    {
      id v4 = [MEMORY[0x1E4F96358] attributeWithDomain:@"com.apple.common" name:@"FinishTaskInterruptable"];
      __int16 v11 = v4;
      char v5 = 2;
      v6 = &v11;
    }
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];

    *a2 = v5;
  }
  else
  {
LABEL_8:
    uint64_t v7 = 0;
  }

  return v7;
}

+ (id)debugDescription
{
  uint64_t v2 = +[FBWorkspaceDomain sharedInstance]();
  uint64_t v3 = [v2 description];

  return v3;
}

+ (void)startListener
{
  uint64_t v2 = (id *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    id v4 = v2;
    id v3 = -[FBWorkspaceDomain _listener](v2);
    uint64_t v2 = v4;
  }
}

+ (id)endpoint
{
  uint64_t v2 = (id *)objc_claimAutoreleasedReturnValue();
  id v3 = -[FBWorkspaceDomain endpoint](v2);

  return v3;
}

void __30__FBWorkspaceDomain__listener__block_invoke(uint64_t a1)
{
  v24[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 8))
  {
    id v3 = (void *)MEMORY[0x1E4F628B8];
    uint64_t v23 = *(void *)(v2 + 200);
    v21[0] = @"Start";
    v21[1] = @"Services";
    v22[0] = @"ManualSession";
    id v4 = [MEMORY[0x1E4F62B38] identifier];
    __int16 v19 = v4;
    uint64_t v20 = MEMORY[0x1E4F1CC08];
    char v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    v22[1] = v5;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
    v24[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    uint64_t v8 = [v3 registerDynamicDomainsFromPlist:v7];
    uint64_t v9 = *(void *)(a1 + 32);
    __int16 v10 = *(void **)(v9 + 48);
    *(void *)(v9 + 48) = v8;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __30__FBWorkspaceDomain__listener__block_invoke_2;
  v18[3] = &unk_1E5C49CC8;
  v18[4] = v2;
  uint64_t v11 = [MEMORY[0x1E4F628A0] listenerWithConfigurator:v18];
  uint64_t v12 = *(void *)(a1 + 32);
  char v13 = *(void **)(v12 + 56);
  *(void *)(v12 + 56) = v11;

  [*(id *)(*(void *)(a1 + 32) + 56) activate];
  uint64_t v14 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v14 + 8))
  {
    uint64_t v15 = [MEMORY[0x1E4F628B8] activateManualDomain:*(void *)(v14 + 200)];
    uint64_t v16 = *(void *)(a1 + 32);
    int v17 = *(void **)(v16 + 64);
    *(void *)(v16 + 64) = v15;
  }
}

void __30__FBWorkspaceDomain__listener__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 200);
  id v5 = a2;
  [v5 setDomain:v3];
  id v4 = [MEMORY[0x1E4F62B38] identifier];
  [v5 setService:v4];

  [v5 setDelegate:*(void *)(a1 + 32)];
}

void __38__FBWorkspaceDomain__ensureAttributes__block_invoke(uint64_t a1)
{
  v115[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F96308] attributeWithCompletionPolicy:1];
  uint64_t v3 = [MEMORY[0x1E4F96358] attributeWithDomain:@"com.apple.frontboard" name:@"Visibility"];
  uint64_t v4 = [MEMORY[0x1E4F96358] attributeWithDomain:@"com.apple.frontboard" name:@"Bootstrap-Foreground"];
  long long v89 = (void *)v4;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 11))
  {
    v115[0] = v4;
    v115[1] = v3;
    id v5 = (void *)MEMORY[0x1E4F1C978];
    v6 = v115;
    uint64_t v7 = 2;
  }
  else
  {
    uint64_t v114 = v4;
    id v5 = (void *)MEMORY[0x1E4F1C978];
    v6 = &v114;
    uint64_t v7 = 1;
  }
  uint64_t v8 = [v5 arrayWithObjects:v6 count:v7];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 72), v8);

  uint64_t v9 = [MEMORY[0x1E4F96358] attributeWithDomain:@"com.apple.frontboard" name:@"Bootstrap-ForegroundSupport"];
  long long v88 = (void *)v9;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 11))
  {
    v113[0] = v9;
    v113[1] = v3;
    __int16 v10 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v11 = v113;
    uint64_t v12 = 2;
  }
  else
  {
    uint64_t v112 = v9;
    __int16 v10 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v11 = &v112;
    uint64_t v12 = 1;
  }
  char v13 = [v10 arrayWithObjects:v11 count:v12];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 80), v13);

  uint64_t v14 = [MEMORY[0x1E4F96358] attributeWithDomain:@"com.apple.frontboard" name:@"Bootstrap-BackgroundUserInitiated"];
  v111 = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v111 count:1];
  uint64_t v16 = *(void *)(a1 + 32);
  int v17 = *(void **)(v16 + 88);
  *(void *)(v16 + 88) = v15;

  __int16 v18 = [MEMORY[0x1E4F96358] attributeWithDomain:@"com.apple.frontboard" name:@"Bootstrap-Background"];
  v110 = v18;
  uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v110 count:1];
  uint64_t v20 = *(void *)(a1 + 32);
  id v21 = *(void **)(v20 + 96);
  *(void *)(v20 + 96) = v19;

  v22 = [MEMORY[0x1E4F96358] attributeWithDomain:@"com.apple.frontboard" name:@"Bootstrap-Utility"];
  v109[0] = v22;
  uint64_t v23 = [MEMORY[0x1E4F96368] attributeWithDuration:1 warningDuration:1 startPolicy:60.0 endPolicy:1.0];
  v109[1] = v23;
  uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v109 count:2];
  uint64_t v25 = *(void *)(a1 + 32);
  uint64_t v26 = *(void **)(v25 + 104);
  *(void *)(v25 + 104) = v24;

  v27 = [MEMORY[0x1E4F96358] attributeWithDomain:@"com.apple.frontboard" name:@"Workspace-BackgroundUtility"];
  v108 = v27;
  uint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v108 count:1];
  uint64_t v29 = *(void *)(a1 + 32);
  v30 = *(void **)(v29 + 112);
  *(void *)(v29 + 112) = v28;

  v31 = [MEMORY[0x1E4F96358] attributeWithDomain:@"com.apple.frontboard" name:@"Workspace-BackgroundActive"];
  v107 = v31;
  uint64_t v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v107 count:1];
  uint64_t v33 = *(void *)(a1 + 32);
  v34 = *(void **)(v33 + 120);
  *(void *)(v33 + 120) = v32;

  uint64_t v35 = [MEMORY[0x1E4F96358] attributeWithDomain:@"com.apple.frontboard" name:@"Workspace-ForegroundSuspendable"];
  v87 = (void *)v35;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 11))
  {
    v106[0] = v35;
    v106[1] = v3;
    uint64_t v36 = (void *)MEMORY[0x1E4F1C978];
    v37 = v106;
    uint64_t v38 = 2;
  }
  else
  {
    uint64_t v105 = v35;
    uint64_t v36 = (void *)MEMORY[0x1E4F1C978];
    v37 = &v105;
    uint64_t v38 = 1;
  }
  v39 = [v36 arrayWithObjects:v37 count:v38];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 128), v39);

  uint64_t v40 = [MEMORY[0x1E4F96358] attributeWithDomain:@"com.apple.frontboard" name:@"Workspace-ForegroundUtility"];
  v86 = (void *)v40;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 11))
  {
    v104[0] = v40;
    v104[1] = v3;
    uint64_t v41 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v42 = v104;
    uint64_t v43 = 2;
  }
  else
  {
    uint64_t v103 = v40;
    uint64_t v41 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v42 = &v103;
    uint64_t v43 = 1;
  }
  v44 = [v41 arrayWithObjects:v42 count:v43];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 136), v44);

  uint64_t v45 = [MEMORY[0x1E4F96358] attributeWithDomain:@"com.apple.frontboard" name:@"Workspace-ForegroundActive"];
  v85 = (void *)v45;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 11))
  {
    v102[0] = v45;
    v102[1] = v2;
    v102[2] = v3;
    v46 = (void *)MEMORY[0x1E4F1C978];
    v47 = v102;
    uint64_t v48 = 3;
  }
  else
  {
    v101[0] = v45;
    v101[1] = v2;
    v46 = (void *)MEMORY[0x1E4F1C978];
    v47 = v101;
    uint64_t v48 = 2;
  }
  uint64_t v49 = [v46 arrayWithObjects:v47 count:v48];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 144), v49);

  uint64_t v50 = [MEMORY[0x1E4F96358] attributeWithDomain:@"com.apple.frontboard" name:@"Workspace-ForegroundFocal"];
  uint64_t v83 = v50;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 11))
  {
    v100[0] = v50;
    v100[1] = v2;
    v100[2] = v3;
    uint64_t v51 = (void *)MEMORY[0x1E4F1C978];
    v52 = v100;
    uint64_t v53 = 3;
  }
  else
  {
    v99[0] = v50;
    v99[1] = v2;
    uint64_t v51 = (void *)MEMORY[0x1E4F1C978];
    v52 = v99;
    uint64_t v53 = 2;
  }
  v54 = objc_msgSend(v51, "arrayWithObjects:count:", v52, v53, v83);
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 152), v54);

  uint64_t v55 = [MEMORY[0x1E4F96358] attributeWithDomain:@"com.apple.frontboard" name:@"Workspace-ForegroundSupportSuspendable"];
  v56 = (void *)v55;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 11))
  {
    v98[0] = v55;
    v98[1] = v3;
    v57 = (void *)MEMORY[0x1E4F1C978];
    v58 = v98;
    uint64_t v59 = 2;
  }
  else
  {
    uint64_t v97 = v55;
    v57 = (void *)MEMORY[0x1E4F1C978];
    v58 = &v97;
    uint64_t v59 = 1;
  }
  v60 = [v57 arrayWithObjects:v58 count:v59];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 160), v60);

  uint64_t v61 = [MEMORY[0x1E4F96358] attributeWithDomain:@"com.apple.frontboard" name:@"Workspace-ForegroundSupportUtility"];
  v62 = (void *)v61;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 11))
  {
    v96[0] = v61;
    v96[1] = v3;
    v63 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v64 = v96;
    uint64_t v65 = 2;
  }
  else
  {
    uint64_t v95 = v61;
    v63 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v64 = &v95;
    uint64_t v65 = 1;
  }
  v66 = [v63 arrayWithObjects:v64 count:v65];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 168), v66);

  uint64_t v67 = [MEMORY[0x1E4F96358] attributeWithDomain:@"com.apple.frontboard" name:@"Workspace-ForegroundSupportActive"];
  id v68 = (void *)v67;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 11))
  {
    v94[0] = v67;
    v94[1] = v2;
    v94[2] = v3;
    v69 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v70 = v94;
    uint64_t v71 = 3;
  }
  else
  {
    v93[0] = v67;
    v93[1] = v2;
    v69 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v70 = v93;
    uint64_t v71 = 2;
  }
  uint64_t v72 = [v69 arrayWithObjects:v70 count:v71];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 176), v72);

  uint64_t v73 = [MEMORY[0x1E4F96358] attributeWithDomain:@"com.apple.frontboard" name:@"Workspace-ForegroundSupportFocal"];
  v74 = (void *)v73;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 11))
  {
    v92[0] = v73;
    v92[1] = v2;
    v92[2] = v3;
    v75 = (void *)MEMORY[0x1E4F1C978];
    v76 = v92;
    uint64_t v77 = 3;
  }
  else
  {
    v91[0] = v73;
    v91[1] = v2;
    v75 = (void *)MEMORY[0x1E4F1C978];
    v76 = v91;
    uint64_t v77 = 2;
  }
  v78 = [v75 arrayWithObjects:v76 count:v77];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 184), v78);

  v79 = [MEMORY[0x1E4F96358] attributeWithDomain:@"com.apple.frontboard" name:@"WorkspaceEndpointInjection"];
  v90[0] = v79;
  v90[1] = v2;
  uint64_t v80 = [MEMORY[0x1E4F1C978] arrayWithObjects:v90 count:2];
  uint64_t v81 = *(void *)(a1 + 32);
  v82 = *(void **)(v81 + 192);
  *(void *)(v81 + 192) = v80;
}

- (NSString)description
{
  uint64_t v3 = [MEMORY[0x1E4F62810] builderWithObject:self];
  [v3 appendString:self->_identifier withName:@"identifier"];
  [v3 appendString:self->_machName withName:@"machName" skipIfEmpty:1];
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __32__FBWorkspaceDomain_description__block_invoke;
  __int16 v10 = &unk_1E5C497A0;
  id v11 = v3;
  uint64_t v12 = self;
  id v4 = v3;
  [v4 appendBodySectionWithName:0 multilinePrefix:0 block:&v7];
  id v5 = objc_msgSend(v4, "build", v7, v8, v9, v10);

  return (NSString *)v5;
}

id __32__FBWorkspaceDomain_description__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = NSStringFromFBSSceneInterruptionPolicy();
  [v2 appendString:v3 withName:@"defaultSceneInterruptionPolicy"];

  id v4 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 10) withName:@"injectorEnabled"];
  id v5 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 11) withName:@"assertsVisibility"];
  id v6 = (id)[*(id *)(a1 + 32) appendFlag:*(void *)(*(void *)(a1 + 40) + 16) withName:@"selfAssertRuntime"];
  [*(id *)(a1 + 32) appendString:*(void *)(*(void *)(a1 + 40) + 32) withName:@"defaultWorkspace"];
  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = [*(id *)(*(void *)(a1 + 40) + 24) allValues];
  [v7 appendArraySection:v8 withName:@"preregisteredWorkspaces" skipIfEmpty:1];

  return (id)[*(id *)(a1 + 32) appendPointer:*(void *)(*(void *)(a1 + 40) + 56) withName:@"listener"];
}

uint64_t __63__FBWorkspaceDomain_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _registerSourcePeer:*(void *)(a1 + 32)];
}

- (uint64_t)machName
{
  if (result) { {
    return *(void *)(result + 208);
  }
  }
  return result;
}

- (uint64_t)preregisteredWorkspaces
{
  if (result) { {
    return *(void *)(result + 24);
  }
  }
  return result;
}

- (uint64_t)defaultWorkspace
{
  if (result) { {
    return *(void *)(result + 32);
  }
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preregisteredWorkspaces, 0);
}

- (void)_init
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)endpointInjectorTargetingProcess:.cold.1()
{
}

- (void)endpointInjectorTargetingProcess:.cold.2()
{
}

- (void)assertionAttributesForWorkspaceState:.cold.1()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)selfAssertionAttributesForWorkspaceState:.cold.1()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)selfAssertionAttributesForWorkspaceState:.cold.2()
{
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)listener:didReceiveConnection:withContext:.cold.1()
{
  OUTLINED_FUNCTION_8(&dword_1A62FC000, v0, v1, "FBWorkspaceDomain: Unable to assign new incoming connection to a process because the remote was unknown : connection=%@", v2, v3, v4, v5, v6);
}

- (void)listener:didReceiveConnection:withContext:.cold.2()
{
  OUTLINED_FUNCTION_8(&dword_1A62FC000, v0, v1, "FBWorkspaceDomain: Unable to register new direct workspace connection with remoteToken=%{public}@ because the service doesn't declare support for direct connections", v2, v3, v4, v5, v6);
}

void __63__FBWorkspaceDomain_listener_didReceiveConnection_withContext___block_invoke_201_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = *(void *)(a1 + 40);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = *a2;
  OUTLINED_FUNCTION_8_1(&dword_1A62FC000, (uint64_t)a2, a3, "FBWorkspaceDomain: Unable to assign new incoming connection to a process because a process was unable to be found or created for connection=%@ with remoteToken=%@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

void __63__FBWorkspaceDomain_listener_didReceiveConnection_withContext___block_invoke_201_cold_2()
{
  OUTLINED_FUNCTION_8(&dword_1A62FC000, v0, v1, "FBWorkspaceDomain: Unable to assign new incoming connection to a process because its server was unable to be found for process=%@", v2, v3, v4, v5, v6);
}

@end