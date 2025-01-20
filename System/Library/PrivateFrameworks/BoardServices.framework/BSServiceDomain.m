@interface BSServiceDomain
- (BSServiceDomain)init;
- (id)_activate;
- (id)_debugDescriptionWithMultilinePrefix:(uint64_t)a1;
- (id)_initWithSpecification:(BSService *)a1;
- (id)debugDescription;
- (id)registerListener:(uint64_t)a1;
- (os_unfair_lock_s)listenerEndpoint;
- (void)_enforceListenerRegistrationForReason:(uint64_t)a1;
- (void)_invalidate;
- (void)listenerEndpointOneshot;
@end

@implementation BSServiceDomain

void __42__BSServiceDomain__initWithSpecification___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  uint64_t v4 = -[BSXPCServiceConnection peer](v3);
  v5 = (void *)v4;
  if (v4) {
    v6 = *(void **)(v4 + 32);
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  v8 = NSString;
  v9 = [v7 name];
  v10 = v9;
  if (!v9)
  {
    v10 = [v7 bundleIdentifier];
  }
  v11 = [v8 stringWithFormat:@"%@:%d", v10, objc_msgSend(v7, "pid")];
  if (!v9) {

  }
  v12 = BSServiceLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = [*(id *)(a1 + 32) identifier];
    *(_DWORD *)buf = 138543618;
    v22 = v13;
    __int16 v23 = 2114;
    id v24 = v11;
    _os_log_impl(&dword_19C754000, v12, OS_LOG_TYPE_DEFAULT, "[BSServiceDomain-%{public}@] Incoming connection from %{public}@", buf, 0x16u);
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __42__BSServiceDomain__initWithSpecification___block_invoke_104;
  v17[3] = &unk_1E58FC8C8;
  id v14 = v11;
  id v18 = v14;
  id v19 = *(id *)(a1 + 32);
  id v20 = *(id *)(a1 + 40);
  -[BSXPCServiceConnection configure:]((uint64_t)v3, (uint64_t)v17);
  v15 = BSServiceLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = [*(id *)(a1 + 32) identifier];
    *(_DWORD *)buf = 138543618;
    v22 = v16;
    __int16 v23 = 2114;
    id v24 = v14;
    _os_log_impl(&dword_19C754000, v15, OS_LOG_TYPE_DEFAULT, "[BSServiceDomain-%{public}@] Activating incoming root connection for %{public}@", buf, 0x16u);
  }
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 16));
  [*(id *)(*(void *)(a1 + 40) + 48) addObject:v3];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 16));
  -[BSXPCServiceConnection activateNowOrWhenReady:]((uint64_t)v3, 0);
}

void __42__BSServiceDomain__initWithSpecification___block_invoke_104(id *a1, void *a2)
{
  v3 = a2;
  uint64_t v4 = [NSString stringWithFormat:@"BSXPCRootIn:%@", a1[4]];
  v5 = v4;
  if (v3)
  {
    uint64_t v6 = [v4 copy];
    id v7 = (void *)v3[18];
    v3[18] = v6;
  }
  v8 = +[BSServiceQuality userInteractive];
  v9 = v8;
  if (v3)
  {
    uint64_t v10 = [v8 copy];
    v11 = (void *)v3[21];
    v3[21] = v10;

    uint64_t v12 = [&__block_literal_global_6 copy];
    v9 = (void *)v3[10];
    v3[10] = v12;
  }

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __42__BSServiceDomain__initWithSpecification___block_invoke_3;
  v22[3] = &unk_1E58FC940;
  id v23 = a1[5];
  id v24 = a1[6];
  if (v3)
  {
    uint64_t v13 = [v22 copy];
    id v14 = (void *)v3[8];
    v3[8] = v13;
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __42__BSServiceDomain__initWithSpecification___block_invoke_112;
  v18[3] = &unk_1E58FC968;
  id v19 = a1[5];
  id v20 = a1[4];
  id v15 = a1[6];
  id v21 = v15;
  if (v3)
  {
    uint64_t v16 = [v18 copy];
    v17 = (void *)v3[11];
    v3[11] = v16;

    id v15 = v21;
  }
}

void __42__BSServiceDomain__initWithSpecification___block_invoke_112(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = BSServiceLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [*(id *)(a1 + 32) identifier];
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = [v6 succinctDescription];
    int v11 = 138543874;
    uint64_t v12 = v8;
    __int16 v13 = 2114;
    uint64_t v14 = v9;
    __int16 v15 = 2114;
    uint64_t v16 = v10;
    _os_log_impl(&dword_19C754000, v7, OS_LOG_TYPE_DEFAULT, "[BSServiceDomain-%{public}@] Error on connection from %{public}@: %{public}@", (uint8_t *)&v11, 0x20u);
  }
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 48) + 16));
  [*(id *)(*(void *)(a1 + 48) + 48) removeObjectIdenticalTo:v5];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 48) + 16));
  [v5 invalidate];
}

void __42__BSServiceDomain__initWithSpecification___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a3;
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    uint64_t v5 = *(void *)(v5 + 56);
  }
  id v6 = +[BSServiceConnection _connectionFromIncomingConnection:requiresMessagingAfterHandshake:]((uint64_t)BSServiceConnection, v4, v5 == 2);
  id v7 = v6;
  if (v6)
  {
    v8 = [v6 service];
    uint64_t v9 = [*(id *)(*(void *)(a1 + 40) + 40) objectForKey:v8];
    if (!v9)
    {
      __int16 v15 = BSServiceLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v26 = [*(id *)(a1 + 32) identifier];
        *(_DWORD *)buf = 138543618;
        v32 = v26;
        __int16 v33 = 2114;
        v34 = v8;
        _os_log_error_impl(&dword_19C754000, v15, OS_LOG_TYPE_ERROR, "[BSServiceDomain-%{public}@] Unknown service \"%{public}@\" for incoming connection. Invalidating the connection.", buf, 0x16u);
      }
      [v7 invalidate];
      goto LABEL_28;
    }
    id v10 = v7;
    int v11 = [v10 instance];
    os_unfair_lock_lock((os_unfair_lock_t)(v9 + 24));
    uint64_t v12 = *(void **)(v9 + 32);
    if (v12) {
      BOOL v13 = 1;
    }
    else {
      BOOL v13 = v11 == 0;
    }
    if (v13)
    {
      id v16 = v12;
    }
    else
    {
      id v16 = [*(id *)(v9 + 40) objectForKey:v11];
    }
    uint64_t v17 = v16;
    if (v16)
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(v9 + 24));
      id v18 = [v17 object];
      id v19 = v18;
      if (v18)
      {
        [v18 didReceiveConnection:v10];
      }
      else
      {
        id v23 = BSServiceBootstrapLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v30 = [*(id *)(v9 + 8) identifier];
          [*(id *)(v9 + 16) identifier];
          *(_DWORD *)buf = 138413058;
          v32 = v11;
          __int16 v33 = 2112;
          v34 = v30;
          v36 = __int16 v35 = 2112;
          __int16 v37 = 2112;
          id v38 = v10;
          v29 = (void *)v36;
          _os_log_error_impl(&dword_19C754000, v23, OS_LOG_TYPE_ERROR, "invalidating connection to instance %@ of service %@ of domain %@ because the listener has gone away : %@", buf, 0x2Au);
        }
        [v10 invalidate];
        id v19 = 0;
      }
    }
    else
    {
      id v20 = *(void **)(v9 + 48);
      if (!v20)
      {
        os_unfair_lock_unlock((os_unfair_lock_t)(v9 + 24));
        id v24 = BSServiceBootstrapLog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          v27 = [*(id *)(v9 + 8) identifier];
          v28 = [*(id *)(v9 + 16) identifier];
          *(_DWORD *)buf = 138413058;
          v32 = v11;
          __int16 v33 = 2112;
          v34 = v27;
          __int16 v35 = 2112;
          uint64_t v36 = (uint64_t)v28;
          __int16 v37 = 2112;
          id v38 = v10;
          _os_log_error_impl(&dword_19C754000, v24, OS_LOG_TYPE_ERROR, "invalidating connection to instance %@ of service %@ of domain %@ because there is no listener to handle it : %@", buf, 0x2Au);
        }
        [v10 invalidate];
        goto LABEL_27;
      }
      [v20 addObject:v10];
      os_unfair_lock_unlock((os_unfair_lock_t)(v9 + 24));
      id v19 = BSServiceBootstrapLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        id v21 = [*(id *)(v9 + 8) identifier];
        v22 = [*(id *)(v9 + 16) identifier];
        *(_DWORD *)buf = 138413058;
        v32 = v11;
        __int16 v33 = 2112;
        v34 = v21;
        __int16 v35 = 2112;
        uint64_t v36 = (uint64_t)v22;
        __int16 v37 = 2112;
        id v38 = v10;
        _os_log_debug_impl(&dword_19C754000, v19, OS_LOG_TYPE_DEBUG, "pending connection to instance %@ of service %@ of domain %@ because there is no listener to handle it : %@", buf, 0x2Au);
      }
    }

LABEL_27:
LABEL_28:

    goto LABEL_29;
  }
  uint64_t v14 = BSServiceLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    uint64_t v25 = [*(id *)(a1 + 32) identifier];
    *(_DWORD *)buf = 138412546;
    v32 = v25;
    __int16 v33 = 2112;
    v34 = v4;
    _os_log_error_impl(&dword_19C754000, v14, OS_LOG_TYPE_ERROR, "failed to wrap raw connection to domain %@ : %@", buf, 0x16u);
  }
  [(os_unfair_lock_s *)v4 invalidate];
LABEL_29:
}

- (BSServiceDomain)init
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [NSString stringWithFormat:@"init is not available on BSServiceDomain"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    id v10 = v5;
    __int16 v11 = 2114;
    uint64_t v12 = v7;
    __int16 v13 = 2048;
    uint64_t v14 = self;
    __int16 v15 = 2114;
    id v16 = @"BSServiceDomain.m";
    __int16 v17 = 1024;
    int v18 = 278;
    __int16 v19 = 2114;
    id v20 = v4;
    _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (BSServiceDomain *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)_initWithSpecification:(BSService *)a1
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  v70 = v4;
  if (!a1) {
    goto LABEL_8;
  }
  id v5 = v4;
  v72 = v5;
  NSClassFromString(&cfstr_Bsservicedomai_8.isa);
  if (!v5)
  {
    v60 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__initWithSpecification_);
      id v61 = (id)objc_claimAutoreleasedReturnValue();
      v62 = (objc_class *)objc_opt_class();
      v63 = NSStringFromClass(v62);
      *(_DWORD *)v88 = 138544642;
      *(void *)&v88[4] = v61;
      *(_WORD *)&v88[12] = 2114;
      *(void *)&v88[14] = v63;
      __int16 v89 = 2048;
      v90 = a1;
      __int16 v91 = 2114;
      v92 = @"BSServiceDomain.m";
      __int16 v93 = 1024;
      int v94 = 283;
      __int16 v95 = 2114;
      v96 = v60;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v88, 0x3Au);
    }
    [v60 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C78E118);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v64 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:BSServiceDomainSpecificationClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__initWithSpecification_);
      id v65 = (id)objc_claimAutoreleasedReturnValue();
      v66 = (objc_class *)objc_opt_class();
      v67 = NSStringFromClass(v66);
      *(_DWORD *)v88 = 138544642;
      *(void *)&v88[4] = v65;
      *(_WORD *)&v88[12] = 2114;
      *(void *)&v88[14] = v67;
      __int16 v89 = 2048;
      v90 = a1;
      __int16 v91 = 2114;
      v92 = @"BSServiceDomain.m";
      __int16 v93 = 1024;
      int v94 = 283;
      __int16 v95 = 2114;
      v96 = v64;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v88, 0x3Au);
    }
    [v64 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C78E21CLL);
  }

  v86.receiver = a1;
  v86.super_class = (Class)BSServiceDomain;
  id v6 = (id *)[(BSService *)&v86 init];
  if (v6)
  {
    v73 = v6;
    v76 = (char *)(v6 + 1);
    objc_storeStrong(v6 + 1, a2);
    *((_DWORD *)v73 + 4) = 0;
    id v7 = [v5 machName];
    v68 = v7;
    if (v5[7] == 3)
    {
      -[BSServiceDomainSpecification _xpcSubserviceName]((id *)v5);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      if (v8) {
        +[BSXPCServiceConnectionListener XPCServiceListenerWithSubserviceName:]((uint64_t)BSXPCServiceConnectionListener, v8);
      }
      else {
      uint64_t v9 = +[BSXPCServiceConnectionListener XPCServiceListener]();
      }
      id v13 = v73[3];
      v73[3] = (id)v9;

      uint64_t v14 = [v5 machName];
      __int16 v15 = __xpcInstance();
      uint64_t v16 = BSServiceConnectionEndpointTargetDescriptionForServiceListener(v14, v15);
      id v17 = v73[4];
      v73[4] = (id)v16;
    }
    else if (v7)
    {
      uint64_t v10 = +[BSXPCServiceConnectionListener listenerWithServiceName:]((uint64_t)BSXPCServiceConnectionListener, v7);
      id v11 = v73[3];
      v73[3] = (id)v10;

      uint64_t v12 = __escaped(v68);
      id v8 = v73[4];
      v73[4] = (id)v12;
    }
    else
    {
      uint64_t v18 = +[BSXPCServiceConnectionListener listener]();
      id v19 = v73[3];
      v73[3] = (id)v18;

      id v8 = [v5 identifier];
      uint64_t v20 = BSServiceConnectionEndpointTargetDescriptionForAnonymousDomain(v8);
      id v21 = v73[4];
      v73[4] = (id)v20;
    }
    uint64_t v22 = (uint64_t)v73[3];
    v83[0] = MEMORY[0x1E4F143A8];
    v83[1] = 3221225472;
    v83[2] = __42__BSServiceDomain__initWithSpecification___block_invoke;
    v83[3] = &unk_1E58FC9B8;
    v71 = v73;
    v84 = v71;
    id v23 = v72;
    v85 = v23;
    -[BSXPCServiceConnectionListener configure:](v22, (uint64_t)v83);
    id v69 = v23[6];
    v77 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v69, "count"));
    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    id obj = v69;
    uint64_t v24 = [obj countByEnumeratingWithState:&v79 objects:v87 count:16];
    if (v24)
    {
      uint64_t v75 = *(void *)v80;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v80 != v75) {
            objc_enumerationMutation(obj);
          }
          v26 = *(void **)(*((void *)&v79 + 1) + 8 * i);
          v27 = [BSService alloc];
          v28 = *(void **)v76;
          id v29 = v26;
          id v78 = v28;
          if (v27)
          {
            id v30 = v29;
            NSClassFromString(&cfstr_Bsservicespeci.isa);
            if (!v30)
            {
              v44 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
              {
                NSStringFromSelector(sel__initWithServiceSpecification_domainSpecification_);
                id v45 = (id)objc_claimAutoreleasedReturnValue();
                v46 = (objc_class *)objc_opt_class();
                v47 = NSStringFromClass(v46);
                *(_DWORD *)v88 = 138544642;
                *(void *)&v88[4] = v45;
                *(_WORD *)&v88[12] = 2114;
                *(void *)&v88[14] = v47;
                __int16 v89 = 2048;
                v90 = v27;
                __int16 v91 = 2114;
                v92 = @"BSServiceDomain.m";
                __int16 v93 = 1024;
                int v94 = 69;
                __int16 v95 = 2114;
                v96 = v44;
                _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v88, 0x3Au);
              }
              [v44 UTF8String];
              _bs_set_crash_log_message();
              __break(0);
              JUMPOUT(0x19C78DCFCLL);
            }
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v48 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:BSServiceSpecificationClass]"];
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
              {
                NSStringFromSelector(sel__initWithServiceSpecification_domainSpecification_);
                id v49 = (id)objc_claimAutoreleasedReturnValue();
                v50 = (objc_class *)objc_opt_class();
                v51 = NSStringFromClass(v50);
                *(_DWORD *)v88 = 138544642;
                *(void *)&v88[4] = v49;
                *(_WORD *)&v88[12] = 2114;
                *(void *)&v88[14] = v51;
                __int16 v89 = 2048;
                v90 = v27;
                __int16 v91 = 2114;
                v92 = @"BSServiceDomain.m";
                __int16 v93 = 1024;
                int v94 = 69;
                __int16 v95 = 2114;
                v96 = v48;
                _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v88, 0x3Au);
              }
              [v48 UTF8String];
              _bs_set_crash_log_message();
              __break(0);
              JUMPOUT(0x19C78DE04);
            }

            id v31 = v78;
            NSClassFromString(&cfstr_Bsservicedomai_8.isa);
            if (!v31)
            {
              v52 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
              {
                NSStringFromSelector(sel__initWithServiceSpecification_domainSpecification_);
                id v53 = (id)objc_claimAutoreleasedReturnValue();
                v54 = (objc_class *)objc_opt_class();
                v55 = NSStringFromClass(v54);
                *(_DWORD *)v88 = 138544642;
                *(void *)&v88[4] = v53;
                *(_WORD *)&v88[12] = 2114;
                *(void *)&v88[14] = v55;
                __int16 v89 = 2048;
                v90 = v27;
                __int16 v91 = 2114;
                v92 = @"BSServiceDomain.m";
                __int16 v93 = 1024;
                int v94 = 70;
                __int16 v95 = 2114;
                v96 = v52;
                _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v88, 0x3Au);
              }
              [v52 UTF8String];
              _bs_set_crash_log_message();
              __break(0);
              JUMPOUT(0x19C78DF0CLL);
            }
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v56 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:BSServiceDomainSpecificationClass]"];
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
              {
                NSStringFromSelector(sel__initWithServiceSpecification_domainSpecification_);
                id v57 = (id)objc_claimAutoreleasedReturnValue();
                v58 = (objc_class *)objc_opt_class();
                v59 = NSStringFromClass(v58);
                *(_DWORD *)v88 = 138544642;
                *(void *)&v88[4] = v57;
                *(_WORD *)&v88[12] = 2114;
                *(void *)&v88[14] = v59;
                __int16 v89 = 2048;
                v90 = v27;
                __int16 v91 = 2114;
                v92 = @"BSServiceDomain.m";
                __int16 v93 = 1024;
                int v94 = 70;
                __int16 v95 = 2114;
                v96 = v56;
                _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v88, 0x3Au);
              }
              [v56 UTF8String];
              _bs_set_crash_log_message();
              __break(0);
              JUMPOUT(0x19C78E014);
            }

            *(void *)v88 = v27;
            *(void *)&v88[8] = BSService;
            v32 = (BSService *)objc_msgSendSuper2((objc_super *)v88, sel_init);
            __int16 v33 = v32;
            v27 = v32;
            if (v32)
            {
              p_specification = (id *)&v32->_specification;
              objc_storeStrong((id *)&v32->_specification, v26);
              p_domainSpecification = (id *)&v33->_domainSpecification;
              objc_storeStrong(p_domainSpecification, v28);
              v27->_lock._os_unfair_lock_opaque = 0;
              if ((!*p_domainSpecification || !*((void *)*p_domainSpecification + 7))
                && ([*p_specification isHiddenAtLaunch] & 1) == 0)
              {
                uint64_t v36 = [MEMORY[0x1E4F1CA48] array];
                lock_pendedConnections = v27->_lock_pendedConnections;
                v27->_lock_pendedConnections = (NSMutableArray *)v36;
              }
            }
          }

          id v38 = [v29 identifier];
          [v77 setObject:v27 forKey:v38];
        }
        uint64_t v24 = [obj countByEnumeratingWithState:&v79 objects:v87 count:16];
      }
      while (v24);
    }

    uint64_t v39 = [v77 copy];
    id v40 = v71[5];
    v71[5] = (id)v39;

    id v41 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v42 = v71[6];
    v71[6] = v41;

    -[BSXPCServiceConnectionListener activateSuspended]((uint64_t)v73[3]);
    if (!*(void *)v76 || !*(void *)(*(void *)v76 + 56)) {
      -[BSXPCServiceConnectionListener resume]((uint64_t)v73[3]);
    }
  }
  else
  {
LABEL_8:
    v71 = 0;
  }

  return v71;
}

void __42__BSServiceDomain__initWithSpecification___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setEndpointDescription:*(void *)(*(void *)(a1 + 32) + 32)];
  id v4 = +[BSServiceQuality userInteractive];
  [v3 setServiceQuality:v4];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__BSServiceDomain__initWithSpecification___block_invoke_2;
  v7[3] = &unk_1E58FC8F0;
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 32);
  [v3 setConnectionHandler:v7];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__BSServiceDomain__initWithSpecification___block_invoke_116;
  v5[3] = &unk_1E58FC990;
  id v6 = *(id *)(a1 + 40);
  [v3 setErrorHandler:v5];
}

void __42__BSServiceDomain__initWithSpecification___block_invoke_116(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = BSServiceXPCErrorsLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = [*(id *)(a1 + 32) identifier];
    uint64_t v10 = 0;
    id v11 = &v10;
    uint64_t v12 = 0x2050000000;
    id v6 = (void *)qword_1EB27F870;
    uint64_t v13 = qword_1EB27F870;
    if (!qword_1EB27F870)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __getRBSProcessIdentityClass_block_invoke;
      v9[3] = &unk_1E58FBE80;
      v9[4] = &v10;
      __getRBSProcessIdentityClass_block_invoke((uint64_t)v9);
      id v6 = (void *)v11[3];
    }
    id v7 = v6;
    _Block_object_dispose(&v10, 8);
    id v8 = [v7 identityOfCurrentProcess];
    *(_DWORD *)buf = 138543874;
    id v15 = v5;
    __int16 v16 = 2114;
    id v17 = v8;
    __int16 v18 = 2114;
    id v19 = v3;
    _os_log_error_impl(&dword_19C754000, v4, OS_LOG_TYPE_ERROR, "[BSServiceDomain-%{public}@] unexpected error on listener connection for %{public}@ (is the system going down or the domain misconfigured?): %{public}@", buf, 0x20u);
  }
}

- (id)debugDescription
{
  return -[BSServiceDomain _debugDescriptionWithMultilinePrefix:]((uint64_t)self, 0);
}

- (id)_debugDescriptionWithMultilinePrefix:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = [MEMORY[0x1E4F4F718] builderWithObject:a1];
    id v5 = (os_unfair_lock_s *)(a1 + 16);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    id v6 = [*(id *)(a1 + 40) allValues];
    id v7 = (void *)[v6 mutableCopy];

    [v7 sortUsingComparator:&__block_literal_global_159_0];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __56__BSServiceDomain__debugDescriptionWithMultilinePrefix___block_invoke_2;
    v17[3] = &unk_1E58FC4E0;
    id v8 = v4;
    id v18 = v8;
    uint64_t v19 = a1;
    id v9 = (id)[v8 modifyProem:v17];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __56__BSServiceDomain__debugDescriptionWithMultilinePrefix___block_invoke_3;
    v14[3] = &unk_1E58FC508;
    v14[4] = a1;
    id v10 = v8;
    id v15 = v10;
    id v11 = v7;
    id v16 = v11;
    [v10 appendBodySectionWithName:0 multilinePrefix:v3 block:v14];
    os_unfair_lock_unlock(v5);
    uint64_t v12 = [v10 build];
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (os_unfair_lock_s)listenerEndpoint
{
  if (a1)
  {
    -[BSXPCServiceConnectionListener endpoint](a1[3]);
    a1 = (os_unfair_lock_s **)objc_claimAutoreleasedReturnValue();
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)listenerEndpointOneshot
{
  if (a1)
  {
    uint64_t v2 = a1[1];
    if (v2 && *(void *)(v2 + 56) == 3)
    {
      a1 = __xpcInstance();
    }
    else
    {
      a1 = 0;
    }
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)registerListener:(uint64_t)a1
{
  uint64_t v118 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v96 = v3;
  if (!a1)
  {
    id v38 = 0;
    goto LABEL_40;
  }
  id v4 = v3;
  if (!v3)
  {
    id v40 = NSString;
    id v41 = [*(id *)(a1 + 8) identifier];
    id v42 = [v40 stringWithFormat:@"asked to register a nil listener of domain %@", v41];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_registerListener_);
      id v43 = (id)objc_claimAutoreleasedReturnValue();
      v44 = (objc_class *)objc_opt_class();
      id v45 = NSStringFromClass(v44);
      *(_DWORD *)buf = 138544642;
      id v107 = v43;
      __int16 v108 = 2114;
      v109 = v45;
      __int16 v110 = 2048;
      uint64_t v111 = a1;
      __int16 v112 = 2114;
      v113 = @"BSServiceDomain.m";
      __int16 v114 = 1024;
      int v115 = 403;
      __int16 v116 = 2114;
      v117 = v42;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v42 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C78F07CLL);
  }
  v92 = [v3 service];
  id v5 = [v4 instance];
  id v6 = v92;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v6)
  {
    v46 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_registerListener_);
      id v47 = (id)objc_claimAutoreleasedReturnValue();
      v48 = (objc_class *)objc_opt_class();
      id v49 = NSStringFromClass(v48);
      *(_DWORD *)buf = 138544642;
      id v107 = v47;
      __int16 v108 = 2114;
      v109 = v49;
      __int16 v110 = 2048;
      uint64_t v111 = a1;
      __int16 v112 = 2114;
      v113 = @"BSServiceDomain.m";
      __int16 v114 = 1024;
      int v115 = 406;
      __int16 v116 = 2114;
      v117 = v46;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v46 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C78F17CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v50 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_registerListener_);
      id v51 = (id)objc_claimAutoreleasedReturnValue();
      v52 = (objc_class *)objc_opt_class();
      id v53 = NSStringFromClass(v52);
      *(_DWORD *)buf = 138544642;
      id v107 = v51;
      __int16 v108 = 2114;
      v109 = v53;
      __int16 v110 = 2048;
      uint64_t v111 = a1;
      __int16 v112 = 2114;
      v113 = @"BSServiceDomain.m";
      __int16 v114 = 1024;
      int v115 = 406;
      __int16 v116 = 2114;
      v117 = v50;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v50 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C78F27CLL);
  }

  id v7 = v5;
  if (v7)
  {
    NSClassFromString(&cfstr_Nsstring.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v73 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_registerListener_);
        id v74 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v75 = (objc_class *)objc_opt_class();
        v76 = NSStringFromClass(v75);
        *(_DWORD *)buf = 138544642;
        id v107 = v74;
        __int16 v108 = 2114;
        v109 = v76;
        __int16 v110 = 2048;
        uint64_t v111 = a1;
        __int16 v112 = 2114;
        v113 = @"BSServiceDomain.m";
        __int16 v114 = 1024;
        int v115 = 407;
        __int16 v116 = 2114;
        v117 = v73;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v73 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C78F6C8);
    }
  }

  __int16 v95 = v6;
  uint64_t v8 = [*(id *)(a1 + 40) objectForKey:v6];
  if (!v8)
  {
    v54 = NSString;
    uint64_t v55 = [*(id *)(a1 + 8) identifier];
    v56 = (void *)v55;
    id v57 = @"<any>";
    if (v7) {
      id v57 = v7;
    }
    v58 = [v54 stringWithFormat:@"failed to activate listener for instance %@ of service %@ in domain %@ because the service was not initialized", v57, v95, v55];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_registerListener_);
      id v59 = (id)objc_claimAutoreleasedReturnValue();
      v60 = (objc_class *)objc_opt_class();
      id v61 = NSStringFromClass(v60);
      *(_DWORD *)buf = 138544642;
      id v107 = v59;
      __int16 v108 = 2114;
      v109 = v61;
      __int16 v110 = 2048;
      uint64_t v111 = a1;
      __int16 v112 = 2114;
      v113 = @"BSServiceDomain.m";
      __int16 v114 = 1024;
      int v115 = 409;
      __int16 v116 = 2114;
      v117 = v58;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v58 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C78F3A4);
  }
  id v9 = v4;
  id v10 = v7;
  id v11 = [MEMORY[0x1E4F4F880] referenceWithObject:v9];
  os_unfair_lock_lock((os_unfair_lock_t)(v8 + 24));
  uint64_t v97 = v11;
  if (*(unsigned char *)(v8 + 56))
  {
    v62 = [NSString stringWithFormat:@"cannot register listener on an invalidated service"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__registerListener_forInstance_);
      id v63 = (id)objc_claimAutoreleasedReturnValue();
      v64 = (objc_class *)objc_opt_class();
      id v65 = NSStringFromClass(v64);
      *(_DWORD *)buf = 138544642;
      id v107 = v63;
      __int16 v108 = 2114;
      v109 = v65;
      __int16 v110 = 2048;
      uint64_t v111 = v8;
      __int16 v112 = 2114;
      v113 = @"BSServiceDomain.m";
      __int16 v114 = 1024;
      int v115 = 112;
      __int16 v116 = 2114;
      v117 = v62;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v62 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C78F498);
  }
  if (*(void *)(v8 + 32))
  {
    v66 = NSString;
    v67 = [*(id *)(v8 + 8) identifier];
    v68 = [*(id *)(v8 + 16) identifier];
    id v69 = [v66 stringWithFormat:@"already have a global listener for service %@ of domain %@ : old=%@ new=%@", v67, v68, *(void *)(v8 + 32), v9];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__registerListener_forInstance_);
      id v70 = (id)objc_claimAutoreleasedReturnValue();
      v71 = (objc_class *)objc_opt_class();
      v72 = NSStringFromClass(v71);
      *(_DWORD *)buf = 138544642;
      id v107 = v70;
      __int16 v108 = 2114;
      v109 = v72;
      __int16 v110 = 2048;
      uint64_t v111 = v8;
      __int16 v112 = 2114;
      v113 = @"BSServiceDomain.m";
      __int16 v114 = 1024;
      int v115 = 113;
      __int16 v116 = 2114;
      v117 = v69;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v69 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C78F5C4);
  }
  uint64_t v12 = *(void **)(v8 + 40);
  if (v7)
  {
    if (v12)
    {
      uint64_t v13 = [v12 objectForKey:v10];

      if (v13)
      {
        v77 = NSString;
        id v78 = [*(id *)(v8 + 8) identifier];
        long long v79 = [*(id *)(v8 + 16) identifier];
        long long v80 = [*(id *)(v8 + 40) objectForKey:v10];
        long long v81 = [v77 stringWithFormat:@"already have a listener for instance %@ of service %@ of domain %@ : old=%@ new=%@", v10, v78, v79, v80, v9];

        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel__registerListener_forInstance_);
          id v82 = (id)objc_claimAutoreleasedReturnValue();
          v83 = (objc_class *)objc_opt_class();
          v84 = NSStringFromClass(v83);
          *(_DWORD *)buf = 138544642;
          id v107 = v82;
          __int16 v108 = 2114;
          v109 = v84;
          __int16 v110 = 2048;
          uint64_t v111 = v8;
          __int16 v112 = 2114;
          v113 = @"BSServiceDomain.m";
          __int16 v114 = 1024;
          int v115 = 116;
          __int16 v116 = 2114;
          v117 = v81;
          _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
        }
        [v81 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19C78F810);
      }
      [*(id *)(v8 + 40) setObject:v11 forKey:v10];
      goto LABEL_18;
    }
    uint64_t v16 = [MEMORY[0x1E4F1CA60] dictionaryWithObject:v11 forKey:v10];
    id v15 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v16;
  }
  else
  {
    if (v12)
    {
      v85 = NSString;
      objc_super v86 = [*(id *)(v8 + 8) identifier];
      v87 = [*(id *)(v8 + 16) identifier];
      v88 = [v85 stringWithFormat:@"already have a listener for service %@ of domain %@ : old=%@ new=%@", v86, v87, *(void *)(v8 + 40), v9];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__registerListener_forInstance_);
        id v89 = (id)objc_claimAutoreleasedReturnValue();
        v90 = (objc_class *)objc_opt_class();
        __int16 v91 = NSStringFromClass(v90);
        *(_DWORD *)buf = 138544642;
        id v107 = v89;
        __int16 v108 = 2114;
        v109 = v91;
        __int16 v110 = 2048;
        uint64_t v111 = v8;
        __int16 v112 = 2114;
        v113 = @"BSServiceDomain.m";
        __int16 v114 = 1024;
        int v115 = 122;
        __int16 v116 = 2114;
        v117 = v88;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v88 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C78F93CLL);
    }
    id v14 = v11;
    id v15 = *(void **)(v8 + 32);
    *(void *)(v8 + 32) = v14;
  }

LABEL_18:
  unint64_t v17 = [*(id *)(v8 + 48) count];
  int v94 = v7;
  if (v17)
  {
    if (v7)
    {
      unint64_t v18 = 0;
      id v19 = 0;
      do
      {
        uint64_t v20 = [*(id *)(v8 + 48) objectAtIndex:v18];
        id v21 = [v20 instance];
        int v22 = BSEqualStrings();

        if (v22)
        {
          if (!v19)
          {
            id v19 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v17];
          }
          [v19 addObject:v20];
          [*(id *)(v8 + 48) removeObjectAtIndex:v18];
          --v17;
        }
        else
        {
          ++v18;
        }
      }
      while (v18 < v17);
    }
    else
    {
      id v19 = *(id *)(v8 + 48);
      uint64_t v23 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v24 = *(void **)(v8 + 48);
      *(void *)(v8 + 48) = v23;
    }
  }
  else
  {
    id v19 = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 24));
  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  id v25 = v19;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v102 objects:buf count:16];
  if (v26)
  {
    uint64_t v27 = *(void *)v103;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v103 != v27) {
          objc_enumerationMutation(v25);
        }
        [v9 didReceiveConnection:*(void *)(*((void *)&v102 + 1) + 8 * i)];
      }
      uint64_t v26 = [v25 countByEnumeratingWithState:&v102 objects:buf count:16];
    }
    while (v26);
  }

  objc_initWeak(&location, (id)v8);
  id v29 = objc_alloc(MEMORY[0x1E4F4F838]);
  id v30 = NSString;
  __int16 v93 = [*(id *)(v8 + 16) identifier];
  id v31 = [v30 stringWithFormat:@"com.apple.boardservices.domain:%@", v93];
  v32 = NSString;
  uint64_t v33 = [*(id *)(v8 + 8) identifier];
  v34 = (void *)v33;
  __int16 v35 = @"<any>";
  if (v94) {
    __int16 v35 = v10;
  }
  uint64_t v36 = [v32 stringWithFormat:@"listener:\"%@\"-\"%@\" -> %p", v33, v35, v9];
  v98[0] = MEMORY[0x1E4F143A8];
  v98[1] = 3221225472;
  v98[2] = __43__BSService__registerListener_forInstance___block_invoke;
  v98[3] = &unk_1E58FC918;
  objc_copyWeak(&v100, &location);
  v98[4] = v97;
  __int16 v37 = v10;
  v99 = v37;
  id v38 = (void *)[v29 initWithIdentifier:v31 forReason:v36 invalidationBlock:v98];

  objc_destroyWeak(&v100);
  objc_destroyWeak(&location);

LABEL_40:

  return v38;
}

- (id)_activate
{
  uint64_t v1 = (uint64_t)a1;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v2 = *(void *)&a1[2]._os_unfair_lock_opaque;
    if (!v2 || (uint64_t v3 = *(void *)(v2 + 56)) == 0)
    {
      uint64_t v13 = [NSString stringWithFormat:@"cannot manually activate an automatic domain"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__activate);
        id v14 = (id)objc_claimAutoreleasedReturnValue();
        id v15 = (objc_class *)objc_opt_class();
        uint64_t v16 = NSStringFromClass(v15);
        *(_DWORD *)id location = 138544642;
        *(void *)&location[4] = v14;
        __int16 v25 = 2114;
        uint64_t v26 = v16;
        __int16 v27 = 2048;
        uint64_t v28 = v1;
        __int16 v29 = 2114;
        id v30 = @"BSServiceDomain.m";
        __int16 v31 = 1024;
        int v32 = 425;
        __int16 v33 = 2114;
        v34 = v13;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", location, 0x3Au);
      }
      [v13 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C79005CLL);
    }
    if (BYTE1(a1[16]._os_unfair_lock_opaque))
    {
      unint64_t v17 = [NSString stringWithFormat:@"cannot manually activate an invalidated domain"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__activate);
        id v18 = (id)objc_claimAutoreleasedReturnValue();
        id v19 = (objc_class *)objc_opt_class();
        uint64_t v20 = NSStringFromClass(v19);
        *(_DWORD *)id location = 138544642;
        *(void *)&location[4] = v18;
        __int16 v25 = 2114;
        uint64_t v26 = v20;
        __int16 v27 = 2048;
        uint64_t v28 = v1;
        __int16 v29 = 2114;
        id v30 = @"BSServiceDomain.m";
        __int16 v31 = 1024;
        int v32 = 426;
        __int16 v33 = 2114;
        v34 = v17;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", location, 0x3Au);
      }
      [v17 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C790150);
    }
    os_unfair_lock_lock(a1 + 4);
    uint64_t v4 = *(void *)(v1 + 56);
    *(void *)(v1 + 56) = v4 + 1;
    if (v4)
    {
LABEL_6:
      os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 16));
      if (v3 == 2)
      {
LABEL_7:
        objc_initWeak((id *)location, (id)v1);
        id v5 = objc_alloc(MEMORY[0x1E4F4F838]);
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __28__BSServiceDomain__activate__block_invoke_2;
        v21[3] = &unk_1E58FC9E0;
        objc_copyWeak(&v22, (id *)location);
        uint64_t v1 = [v5 initWithIdentifier:@"com.apple.boardservices.domain" forReason:@"session" invalidationBlock:v21];
        objc_destroyWeak(&v22);
        objc_destroyWeak((id *)location);
        goto LABEL_23;
      }
      goto LABEL_22;
    }
    if (v3 == 3)
    {
      uint64_t v8 = BSServiceBootstrapLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = [*(id *)(v1 + 8) identifier];
        *(_DWORD *)id location = 138412290;
        *(void *)&location[4] = v9;
        _os_log_impl(&dword_19C754000, v8, OS_LOG_TYPE_DEFAULT, "initializing domain %@", location, 0xCu);
      }
      if (!*(unsigned char *)(v1 + 64))
      {
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __28__BSServiceDomain__activate__block_invoke;
        block[3] = &unk_1E58FC278;
        block[4] = v1;
        dispatch_async(MEMORY[0x1E4F14428], block);
LABEL_27:
        -[BSXPCServiceConnectionListener resume](*(void *)(v1 + 24));
        goto LABEL_6;
      }
    }
    else
    {
      if (v3 == 2)
      {
        id v6 = BSServiceBootstrapLog();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          id v7 = [*(id *)(v1 + 8) identifier];
          *(_DWORD *)id location = 138412290;
          *(void *)&location[4] = v7;
          _os_log_impl(&dword_19C754000, v6, OS_LOG_TYPE_DEFAULT, "initializing session for domain %@", location, 0xCu);
        }
        if (*(unsigned char *)(v1 + 64))
        {
          os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 16));
          goto LABEL_7;
        }
        goto LABEL_26;
      }
      id v10 = BSServiceBootstrapLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = [*(id *)(v1 + 8) identifier];
        *(_DWORD *)id location = 138412290;
        *(void *)&location[4] = v11;
        _os_log_impl(&dword_19C754000, v10, OS_LOG_TYPE_DEFAULT, "manually bootstrapping domain %@", location, 0xCu);
      }
      if (!*(unsigned char *)(v1 + 64))
      {
LABEL_26:
        -[BSServiceDomain _enforceListenerRegistrationForReason:](v1, @"manual activation");
        goto LABEL_27;
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 16));
LABEL_22:
    uint64_t v1 = 0;
  }
LABEL_23:

  return (id)v1;
}

void __28__BSServiceDomain__activate__block_invoke(uint64_t a1)
{
}

- (void)_enforceListenerRegistrationForReason:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    id v5 = *(void **)(a1 + 40);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __57__BSServiceDomain__enforceListenerRegistrationForReason___block_invoke;
    v6[3] = &unk_1E58FCA08;
    id v7 = v3;
    [v5 enumerateKeysAndObjectsUsingBlock:v6];
  }
}

void __28__BSServiceDomain__activate__block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 4);
    uint64_t v1 = *((void *)WeakRetained + 7);
    if (!v1)
    {
      id v6 = [NSString stringWithFormat:@"domain activation underflow"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__deactivate);
        id v7 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v8 = (objc_class *)objc_opt_class();
        id v9 = NSStringFromClass(v8);
        *(_DWORD *)buf = 138544642;
        *(void *)&uint8_t buf[4] = v7;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v9;
        *(_WORD *)&buf[22] = 2048;
        uint64_t v12 = WeakRetained;
        LOWORD(v13) = 2114;
        *(void *)((char *)&v13 + 2) = @"BSServiceDomain.m";
        WORD5(v13) = 1024;
        HIDWORD(v13) = 531;
        __int16 v14 = 2114;
        id v15 = v6;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v6 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C79052CLL);
    }
    if (!*((unsigned char *)WeakRetained + 65))
    {
      uint64_t v2 = v1 - 1;
      *((void *)WeakRetained + 7) = v2;
      if (!v2)
      {
        id v3 = BSServiceBootstrapLog();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v4 = [*((id *)WeakRetained + 1) identifier];
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v4;
          _os_log_impl(&dword_19C754000, v3, OS_LOG_TYPE_DEFAULT, "destroying session for domain %@", buf, 0xCu);
        }
        if (!*((unsigned char *)WeakRetained + 64))
        {
          *((unsigned char *)WeakRetained + 64) = 1;
          uint64_t v5 = *((void *)WeakRetained + 3);
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __30__BSServiceDomain__deactivate__block_invoke;
          uint64_t v12 = &unk_1E58FCA70;
          *(void *)&long long v13 = WeakRetained;
          *((void *)&v13 + 1) = sel__deactivate;
          -[BSXPCServiceConnectionListener suspendWithCompletion:](v5, (uint64_t)buf);
        }
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 4);
  }
}

void __57__BSServiceDomain__enforceListenerRegistrationForReason___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v21 = *(id *)(a1 + 32);
  if (a3)
  {
    uint64_t v4 = (os_unfair_lock_s *)(a3 + 24);
    os_unfair_lock_lock((os_unfair_lock_t)(a3 + 24));
    uint64_t v22 = a3;
    if (([*(id *)(a3 + 8) isHiddenAtLaunch] & 1) == 0
      && !*(void *)(a3 + 32)
      && ![*(id *)(a3 + 40) count])
    {
      uint64_t v5 = BSServiceBootstrapLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      {
        id v19 = [*(id *)(a3 + 16) identifier];
        uint64_t v20 = *(void *)(v22 + 8);
        *(_DWORD *)uint64_t v35 = 138543874;
        uint64_t v36 = v19;
        __int16 v37 = 2114;
        uint64_t v38 = v20;
        __int16 v39 = 2112;
        id v40 = v21;
        _os_log_fault_impl(&dword_19C754000, v5, OS_LOG_TYPE_FAULT, "domain=%{public}@ service=%{public}@ : no listener at %@", v35, 0x20u);
      }
      a3 = v22;
    }
    id v6 = *(id *)(a3 + 48);
    uint64_t v7 = a3;
    id v8 = v6;
    id v9 = *(void **)(v7 + 48);
    *(void *)(v7 + 48) = 0;

    os_unfair_lock_unlock(v4);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v35 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v24;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v10);
          }
          __int16 v14 = *(void **)(*((void *)&v23 + 1) + 8 * v13);
          id v15 = BSServiceBootstrapLog();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            id v16 = [v14 instance];
            id v17 = [*(id *)(v22 + 8) identifier];
            id v18 = [*(id *)(v22 + 16) identifier];
            *(_DWORD *)buf = 138413058;
            id v28 = v16;
            __int16 v29 = 2112;
            id v30 = v17;
            __int16 v31 = 2112;
            int v32 = v18;
            __int16 v33 = 2112;
            v34 = v14;
            _os_log_error_impl(&dword_19C754000, v15, OS_LOG_TYPE_ERROR, "invalidating connection to instance %@ of service %@ of domain %@ because pending has been disabled : %@", buf, 0x2Au);
          }
          [v14 invalidate];
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v35 count:16];
      }
      while (v11);
    }
  }
}

- (void)_invalidate
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v2 = (os_unfair_lock_s *)(a1 + 16);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    if (!*(unsigned char *)(a1 + 65))
    {
      *(unsigned char *)(a1 + 65) = 1;
      id v3 = BSServiceBootstrapLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v4 = [*(id *)(a1 + 8) identifier];
        int v5 = 138412290;
        id v6 = v4;
        _os_log_impl(&dword_19C754000, v3, OS_LOG_TYPE_DEFAULT, "invalidating domain %@", (uint8_t *)&v5, 0xCu);
      }
      [*(id *)(a1 + 40) enumerateKeysAndObjectsUsingBlock:&__block_literal_global_156];
      [*(id *)(a1 + 24) invalidate];
    }
    os_unfair_lock_unlock(v2);
  }
}

void __30__BSServiceDomain__invalidate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v4 = (os_unfair_lock_s *)(a3 + 24);
    os_unfair_lock_lock((os_unfair_lock_t)(a3 + 24));
    if (*(unsigned char *)(a3 + 56))
    {
      id v5 = 0;
    }
    else
    {
      *(unsigned char *)(a3 + 56) = 1;
      id v5 = *(id *)(a3 + 48);
      id v6 = *(void **)(a3 + 32);
      *(void *)(a3 + 32) = 0;

      uint64_t v7 = *(void **)(a3 + 40);
      *(void *)(a3 + 40) = 0;

      id v8 = *(void **)(a3 + 48);
      *(void *)(a3 + 48) = 0;
    }
    os_unfair_lock_unlock(v4);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v14;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v9);
          }
          objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "invalidate", (void)v13);
        }
        while (v10 != v12);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }
  }
}

uint64_t __56__BSServiceDomain__debugDescriptionWithMultilinePrefix___block_invoke(uint64_t a1, id *a2, void *a3)
{
  uint64_t v4 = a3;
  id v5 = -[BSService _identifier](a2);
  id v6 = -[BSService _identifier](v4);
  uint64_t v7 = [v5 compare:v6];

  return v7;
}

void __56__BSServiceDomain__debugDescriptionWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(*(void *)(a1 + 40) + 8) identifier];
  [v2 appendString:v3 withName:0];

  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(v4 + 8);
  if (v5 && *(void *)(v5 + 56))
  {
    if (*(unsigned char *)(v4 + 65))
    {
      id v6 = @"invalid";
    }
    else
    {
      int v7 = *(unsigned __int8 *)(v4 + 64);
      id v8 = @"active";
      BOOL v9 = *(void *)(v4 + 56) == 0;
      uint64_t v10 = @"reactivating";
      if (v9)
      {
        id v8 = @"inactive";
        uint64_t v10 = @"deactivating";
      }
      if (v7) {
        id v6 = v10;
      }
      else {
        id v6 = v8;
      }
    }
    id v11 = (id)[*(id *)(a1 + 32) appendObject:v6 withName:@"state"];
  }
}

void __56__BSServiceDomain__debugDescriptionWithMultilinePrefix___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = [v2 activeMultilinePrefix];
  -[BSServiceDomainSpecification _appendManagerDumpBodyToBuilder:withMultilinePrefix:](v3, v2, v4);

  int v5 = -[BSXPCServiceConnectionListener isNonLaunching](*(os_unfair_lock_s **)(*(void *)(a1 + 32) + 24));
  id v6 = *(void **)(*(void *)(a1 + 32) + 32);
  if (v5)
  {
    id v7 = [@"NL:" stringByAppendingString:v6];
  }
  else
  {
    id v7 = v6;
  }
  id v8 = v7;
  id v9 = (id)[*(id *)(a1 + 40) appendObject:v7 withName:@"endpoint"];
  uint64_t v10 = *(void **)(a1 + 40);
  id v11 = [v10 activeMultilinePrefix];
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  uint64_t v18 = __56__BSServiceDomain__debugDescriptionWithMultilinePrefix___block_invoke_4;
  id v19 = &unk_1E58FC4E0;
  id v20 = *(id *)(a1 + 48);
  id v21 = *(id *)(a1 + 40);
  [v10 appendBodySectionWithName:@"services" multilinePrefix:v11 block:&v16];

  id v12 = (id)objc_msgSend(*(id *)(a1 + 40), "appendObject:withName:", *(void *)(*(void *)(a1 + 32) + 24), @"rootListener", v16, v17, v18, v19);
  long long v13 = *(void **)(a1 + 40);
  uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 48);
  long long v15 = [v13 activeMultilinePrefix];
  [v13 appendArraySection:v14 withName:@"incomingRootConnections" multilinePrefix:v15 skipIfEmpty:0];
}

void __56__BSServiceDomain__debugDescriptionWithMultilinePrefix___block_invoke_4(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v12 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        id v7 = *(void **)(a1 + 40);
        id v8 = objc_msgSend(v7, "activeMultilinePrefix", (void)v11);
        id v9 = -[BSService _debugDescriptionWithMultilinePrefix:](v6, v8);
        id v10 = (id)[v7 appendObject:v9 withName:0];
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v3);
  }
}

void __30__BSServiceDomain__deactivate__block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 64))
  {
    int v5 = [NSString stringWithFormat:@"sanity - this shouldn't be possible"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      id v7 = (objc_class *)objc_opt_class();
      id v8 = NSStringFromClass(v7);
      uint64_t v9 = *(void *)(a1 + 32);
      int v10 = 138544642;
      id v11 = v6;
      __int16 v12 = 2114;
      long long v13 = v8;
      __int16 v14 = 2048;
      uint64_t v15 = v9;
      __int16 v16 = 2114;
      uint64_t v17 = @"BSServiceDomain.m";
      __int16 v18 = 1024;
      int v19 = 538;
      __int16 v20 = 2114;
      id v21 = v5;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v10, 0x3Au);
    }
    [v5 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C7911D4);
  }
  *(unsigned char *)(v2 + 64) = 0;
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(void *)(v3 + 56))
  {
    -[BSServiceDomain _enforceListenerRegistrationForReason:](v3, @"manual activation");
    -[BSXPCServiceConnectionListener resume](*(void *)(*(void *)(a1 + 32) + 24));
    uint64_t v3 = *(void *)(a1 + 32);
  }
  uint64_t v4 = (os_unfair_lock_s *)(v3 + 16);

  os_unfair_lock_unlock(v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_incomingConnections, 0);
  objc_storeStrong((id *)&self->_identifierToService, 0);
  objc_storeStrong((id *)&self->_listenerEndpointDescription, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);

  objc_storeStrong((id *)&self->_specification, 0);
}

@end