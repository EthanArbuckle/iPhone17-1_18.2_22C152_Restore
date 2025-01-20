@interface BSServiceConnectionEndpointInjector
+ (id)injectorWithConfigurator:(id)a3;
- (BSServiceConnectionEndpointInjector)init;
- (NSString)description;
- (void)dealloc;
- (void)invalidate;
- (void)setAdditionalAttributes:(id)a3;
- (void)setDomain:(id)a3;
- (void)setInheritingEnvironment:(id)a3;
- (void)setInstance:(id)a3;
- (void)setService:(id)a3;
- (void)setTarget:(id)a3;
@end

@implementation BSServiceConnectionEndpointInjector

+ (id)injectorWithConfigurator:(id)a3
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  v4 = [BSServiceConnectionEndpointInjector alloc];
  v5 = +[BSServiceManager sharedInstanceCreatingIfNecessary:]((uint64_t)BSServiceManager, 1);
  v6 = v5;
  if (v4)
  {
    id v7 = v5;
    NSClassFromString(&cfstr_Bsservicemanag.isa);
    if (!v7)
    {
      v43 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__initWithManager_configurator_);
        id v44 = (id)objc_claimAutoreleasedReturnValue();
        v45 = (objc_class *)objc_opt_class();
        v46 = NSStringFromClass(v45);
        *(_DWORD *)buf = 138544642;
        *(void *)&buf[4] = v44;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v46;
        *(_WORD *)&buf[22] = 2048;
        v69 = v4;
        *(_WORD *)v70 = 2114;
        *(void *)&v70[2] = @"BSServiceConnectionEndpointInjector.m";
        __int16 v71 = 1024;
        int v72 = 59;
        __int16 v73 = 2114;
        v74 = v43;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v43 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C775DE8);
    }
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v47 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:BSServiceManagerClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__initWithManager_configurator_);
        id v48 = (id)objc_claimAutoreleasedReturnValue();
        v49 = (objc_class *)objc_opt_class();
        v50 = NSStringFromClass(v49);
        *(_DWORD *)buf = 138544642;
        *(void *)&buf[4] = v48;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v50;
        *(_WORD *)&buf[22] = 2048;
        v69 = v4;
        *(_WORD *)v70 = 2114;
        *(void *)&v70[2] = @"BSServiceConnectionEndpointInjector.m";
        __int16 v71 = 1024;
        int v72 = 59;
        __int16 v73 = 2114;
        v74 = v47;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v47 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C775EE8);
    }

    if (!a3)
    {
      v51 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"block"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__initWithManager_configurator_);
        id v52 = (id)objc_claimAutoreleasedReturnValue();
        v53 = (objc_class *)objc_opt_class();
        v54 = NSStringFromClass(v53);
        *(_DWORD *)buf = 138544642;
        *(void *)&buf[4] = v52;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v54;
        *(_WORD *)&buf[22] = 2048;
        v69 = v4;
        *(_WORD *)v70 = 2114;
        *(void *)&v70[2] = @"BSServiceConnectionEndpointInjector.m";
        __int16 v71 = 1024;
        int v72 = 60;
        __int16 v73 = 2114;
        v74 = v51;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v51 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C775FE8);
    }
    v63.receiver = v4;
    v63.super_class = (Class)BSServiceConnectionEndpointInjector;
    v8 = objc_msgSendSuper2(&v63, sel_init);
    v4 = v8;
    if (v8)
    {
      v8->_lock._os_unfair_lock_opaque = 0;
      objc_storeStrong((id *)&v8->_manager, v6);
      os_unfair_lock_lock(&v4->_lock);
      (*((void (**)(id, BSServiceConnectionEndpointInjector *))a3 + 2))(a3, v4);
      if (!v4->_target)
      {
        v55 = [NSString stringWithFormat:@"must configure a target"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel__initWithManager_configurator_);
          id v56 = (id)objc_claimAutoreleasedReturnValue();
          v57 = (objc_class *)objc_opt_class();
          v58 = NSStringFromClass(v57);
          *(_DWORD *)buf = 138544642;
          *(void *)&buf[4] = v56;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v58;
          *(_WORD *)&buf[22] = 2048;
          v69 = v4;
          *(_WORD *)v70 = 2114;
          *(void *)&v70[2] = @"BSServiceConnectionEndpointInjector.m";
          __int16 v71 = 1024;
          int v72 = 70;
          __int16 v73 = 2114;
          v74 = v55;
          _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
        }
        [v55 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19C7760DCLL);
      }
      v9 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
      domain = v4->_domain;
      if (domain && (service = v4->_service) != 0)
      {
        instance = v4->_instance;
        if (instance) {
          [NSString stringWithFormat:@"injecting \"%@\"-\"%@\"-\"%@\"", domain, v4->_service, instance];
        }
        else {
        v17 = [NSString stringWithFormat:@"injecting \"%@\"-\"%@\"", v4->_domain, service];
        }
        v15 = +[BSServiceConnectionEndpoint _endpointForManager:domain:service:instance:]((uint64_t)BSServiceConnectionEndpoint, v7, v4->_domain, v4->_service, v4->_instance);
        if (!v15)
        {
          v59 = [NSString stringWithFormat:@"no endpoint found for domain=\"%@\" service=\"%@\" instance=\"%@\"", v4->_domain, v4->_service, v4->_instance];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(sel__initWithManager_configurator_);
            id v60 = (id)objc_claimAutoreleasedReturnValue();
            v61 = (objc_class *)objc_opt_class();
            v62 = NSStringFromClass(v61);
            *(_DWORD *)buf = 138544642;
            *(void *)&buf[4] = v60;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v62;
            *(_WORD *)&buf[22] = 2048;
            v69 = v4;
            *(_WORD *)v70 = 2114;
            *(void *)&v70[2] = @"BSServiceConnectionEndpointInjector.m";
            __int16 v71 = 1024;
            int v72 = 82;
            __int16 v73 = 2114;
            v74 = v59;
            _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
          }
          [v59 UTF8String];
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x19C7761DCLL);
        }
        id v64 = 0;
        v65 = &v64;
        uint64_t v66 = 0x2050000000;
        id v18 = (id)_MergedGlobals_1;
        uint64_t v67 = _MergedGlobals_1;
        if (!_MergedGlobals_1)
        {
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __getRBSEndowmentGrantClass_block_invoke;
          v69 = (BSServiceConnectionEndpointInjector *)&unk_1E58FBE80;
          *(void *)v70 = &v64;
          __getRBSEndowmentGrantClass_block_invoke((uint64_t)buf);
          id v18 = v65[3];
        }
        id v19 = v18;
        _Block_object_dispose(&v64, 8);
        v20 = BSServiceEndpointGrantNamespace();
        v21 = -[BSServiceConnectionEndpoint _endowmentRepresentation](v15);
        v22 = [v19 grantWithNamespace:v20 endowment:v21];
        [v9 addObject:v22];

        if (v4->_inheritingEnvironment)
        {
          v13 = [v17 stringByAppendingFormat:@" + inherited from %i<%@> to %@", getpid(), v4->_inheritingEnvironment, v4->_target];

          id RBSHereditaryGrantClass = getRBSHereditaryGrantClass();
          v16 = BSServiceEndpointGrantNamespace();
          v24 = [RBSHereditaryGrantClass grantWithNamespace:v16 sourceEnvironment:v4->_inheritingEnvironment attributes:0];
          [v9 addObject:v24];
        }
        else
        {
          v13 = [v17 stringByAppendingFormat:@" to %@", v4->_target];
          v16 = v17;
        }
      }
      else
      {
        if (!v4->_inheritingEnvironment)
        {
          v37 = [NSString stringWithFormat:@"unsupported configuration : domain=\"%@\" service=\"%@\" inheritingEnvironment=\"%@\"", domain, v4->_service, 0];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(sel__initWithManager_configurator_);
            id v38 = (id)objc_claimAutoreleasedReturnValue();
            v39 = (objc_class *)objc_opt_class();
            v40 = NSStringFromClass(v39);
            *(_DWORD *)buf = 138544642;
            *(void *)&buf[4] = v38;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v40;
            *(_WORD *)&buf[22] = 2048;
            v69 = v4;
            *(_WORD *)v70 = 2114;
            *(void *)&v70[2] = @"BSServiceConnectionEndpointInjector.m";
            __int16 v71 = 1024;
            int v72 = 105;
            __int16 v73 = 2114;
            v74 = v37;
            _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
          }
          [v37 UTF8String];
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x19C775C80);
        }
        v13 = [NSString stringWithFormat:@"injecting inherited from \"%@\" to %@", v4->_inheritingEnvironment, v4->_target];
        id v14 = getRBSHereditaryGrantClass();
        v15 = BSServiceEndpointGrantNamespace();
        v16 = [v14 grantWithNamespace:v15 sourceEnvironment:v4->_inheritingEnvironment attributes:0];
        [v9 addObject:v16];
      }

      if ([(NSArray *)v4->_additionalAttributes count]) {
        [v9 addObjectsFromArray:v4->_additionalAttributes];
      }
      id v64 = 0;
      v65 = &v64;
      uint64_t v66 = 0x2050000000;
      id v25 = (id)qword_1EB27F7B8;
      uint64_t v67 = qword_1EB27F7B8;
      if (!qword_1EB27F7B8)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getRBSAssertionClass_block_invoke;
        v69 = (BSServiceConnectionEndpointInjector *)&unk_1E58FBE80;
        *(void *)v70 = &v64;
        __getRBSAssertionClass_block_invoke((uint64_t)buf);
        id v25 = v65[3];
      }
      v26 = (objc_class *)v25;
      _Block_object_dispose(&v64, 8);
      uint64_t v27 = [[v26 alloc] initWithExplanation:v13 target:v4->_target attributes:v9];
      assertion = v4->_assertion;
      v4->_assertion = (RBSAssertion *)v27;

      v29 = v4->_assertion;
      id v64 = 0;
      char v30 = [(RBSAssertion *)v29 acquireWithError:&v64];
      id v31 = v64;
      if (v30)
      {
        additionalAttributes = v4->_additionalAttributes;
        v4->_additionalAttributes = 0;

        os_unfair_lock_unlock(&v4->_lock);
      }
      else
      {
        v33 = BSServiceInjectionLog();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          target = v4->_target;
          v42 = [v31 succinctDescription];
          *(_DWORD *)buf = 138412802;
          *(void *)&buf[4] = v13;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = target;
          *(_WORD *)&buf[22] = 2114;
          v69 = v42;
          _os_log_error_impl(&dword_19C754000, v33, OS_LOG_TYPE_ERROR, "%@ -> failed to acquire on %@ : %{public}@", buf, 0x20u);
        }
        v4->_invalidated = 1;
        v34 = v4->_assertion;
        v4->_assertion = 0;

        v35 = v4->_additionalAttributes;
        v4->_additionalAttributes = 0;

        os_unfair_lock_unlock(&v4->_lock);
        v4 = 0;
      }
    }
  }

  return v4;
}

- (void)setTarget:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"target"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      *(_DWORD *)buf = 138544642;
      id v13 = v9;
      __int16 v14 = 2114;
      v15 = v11;
      __int16 v16 = 2048;
      v17 = self;
      __int16 v18 = 2114;
      id v19 = @"BSServiceConnectionEndpointInjector.m";
      __int16 v20 = 1024;
      int v21 = 139;
      __int16 v22 = 2114;
      v23 = v8;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C779DF8);
  }
  os_unfair_lock_assert_owner(&self->_lock);
  v5 = (RBSTarget *)[a3 copy];
  target = self->_target;
  self->_target = v5;
}

- (void)setInheritingEnvironment:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"inheritingEnvironment"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      *(_DWORD *)buf = 138544642;
      id v13 = v9;
      __int16 v14 = 2114;
      v15 = v11;
      __int16 v16 = 2048;
      v17 = self;
      __int16 v18 = 2114;
      id v19 = @"BSServiceConnectionEndpointInjector.m";
      __int16 v20 = 1024;
      int v21 = 163;
      __int16 v22 = 2114;
      v23 = v8;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C779FB4);
  }
  os_unfair_lock_assert_owner(&self->_lock);
  v5 = (NSString *)[a3 copy];
  inheritingEnvironment = self->_inheritingEnvironment;
  self->_inheritingEnvironment = v5;
}

- (void)setAdditionalAttributes:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"attributes"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      *(_DWORD *)buf = 138544642;
      id v13 = v9;
      __int16 v14 = 2114;
      v15 = v11;
      __int16 v16 = 2048;
      v17 = self;
      __int16 v18 = 2114;
      id v19 = @"BSServiceConnectionEndpointInjector.m";
      __int16 v20 = 1024;
      int v21 = 169;
      __int16 v22 = 2114;
      v23 = v8;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C77A170);
  }
  os_unfair_lock_assert_owner(&self->_lock);
  v5 = (NSArray *)[a3 copy];
  additionalAttributes = self->_additionalAttributes;
  self->_additionalAttributes = v5;
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    [(RBSAssertion *)self->_assertion invalidate];
    assertion = self->_assertion;
    self->_assertion = 0;
  }

  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong((id *)&self->_inheritingEnvironment, 0);
  objc_storeStrong((id *)&self->_instance, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_additionalAttributes, 0);
  objc_storeStrong((id *)&self->_target, 0);

  objc_storeStrong((id *)&self->_manager, 0);
}

- (void)dealloc
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (!self->_invalidated)
  {
    v4 = [NSString stringWithFormat:@"must invalidate before dealloc"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      *(_DWORD *)buf = 138544642;
      id v10 = v5;
      __int16 v11 = 2114;
      v12 = v7;
      __int16 v13 = 2048;
      __int16 v14 = self;
      __int16 v15 = 2114;
      __int16 v16 = @"BSServiceConnectionEndpointInjector.m";
      __int16 v17 = 1024;
      int v18 = 133;
      __int16 v19 = 2114;
      __int16 v20 = v4;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v4 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C77D288);
  }
  v8.receiver = self;
  v8.super_class = (Class)BSServiceConnectionEndpointInjector;
  [(BSServiceConnectionEndpointInjector *)&v8 dealloc];
}

- (BSServiceConnectionEndpointInjector)init
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v4 = [NSString stringWithFormat:@"init is not allowed on BSServiceConnectionEndpointInjector"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    id v10 = v5;
    __int16 v11 = 2114;
    v12 = v7;
    __int16 v13 = 2048;
    __int16 v14 = self;
    __int16 v15 = 2114;
    __int16 v16 = @"BSServiceConnectionEndpointInjector.m";
    __int16 v17 = 1024;
    int v18 = 54;
    __int16 v19 = 2114;
    __int16 v20 = v4;
    _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (BSServiceConnectionEndpointInjector *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)setDomain:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    objc_super v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"domain"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      id v10 = (objc_class *)objc_opt_class();
      __int16 v11 = NSStringFromClass(v10);
      *(_DWORD *)buf = 138544642;
      id v13 = v9;
      __int16 v14 = 2114;
      __int16 v15 = v11;
      __int16 v16 = 2048;
      __int16 v17 = self;
      __int16 v18 = 2114;
      __int16 v19 = @"BSServiceConnectionEndpointInjector.m";
      __int16 v20 = 1024;
      int v21 = 145;
      __int16 v22 = 2114;
      v23 = v8;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C77FB8CLL);
  }
  os_unfair_lock_assert_owner(&self->_lock);
  id v5 = (NSString *)[a3 copy];
  domain = self->_domain;
  self->_domain = v5;
}

- (void)setService:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    objc_super v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"service"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      id v10 = (objc_class *)objc_opt_class();
      __int16 v11 = NSStringFromClass(v10);
      *(_DWORD *)buf = 138544642;
      id v13 = v9;
      __int16 v14 = 2114;
      __int16 v15 = v11;
      __int16 v16 = 2048;
      __int16 v17 = self;
      __int16 v18 = 2114;
      __int16 v19 = @"BSServiceConnectionEndpointInjector.m";
      __int16 v20 = 1024;
      int v21 = 151;
      __int16 v22 = 2114;
      v23 = v8;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C77FD48);
  }
  os_unfair_lock_assert_owner(&self->_lock);
  id v5 = (NSString *)[a3 copy];
  service = self->_service;
  self->_service = v5;
}

- (void)setInstance:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    objc_super v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"instance"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      id v10 = (objc_class *)objc_opt_class();
      __int16 v11 = NSStringFromClass(v10);
      *(_DWORD *)buf = 138544642;
      id v13 = v9;
      __int16 v14 = 2114;
      __int16 v15 = v11;
      __int16 v16 = 2048;
      __int16 v17 = self;
      __int16 v18 = 2114;
      __int16 v19 = @"BSServiceConnectionEndpointInjector.m";
      __int16 v20 = 1024;
      int v21 = 157;
      __int16 v22 = 2114;
      v23 = v8;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C77FF04);
  }
  os_unfair_lock_assert_owner(&self->_lock);
  id v5 = (NSString *)[a3 copy];
  instance = self->_instance;
  self->_instance = v5;
}

- (NSString)description
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v5 = (id)[v4 appendObject:self->_target withName:@"target"];
  [v4 appendString:self->_domain withName:@"domain" skipIfEmpty:1];
  [v4 appendString:self->_service withName:@"service" skipIfEmpty:1];
  [v4 appendString:self->_instance withName:@"instance" skipIfEmpty:1];
  [v4 appendString:self->_inheritingEnvironment withName:@"inheritingEnvironment" skipIfEmpty:1];
  if (self->_invalidated)
  {
    v6 = @"invalidated";
LABEL_3:
    [v4 appendString:v6 withName:0];
    goto LABEL_5;
  }
  if (!self->_assertion)
  {
    v6 = @"inactive";
    goto LABEL_3;
  }
LABEL_5:
  os_unfair_lock_unlock(p_lock);
  id v7 = [v4 build];

  return (NSString *)v7;
}

@end