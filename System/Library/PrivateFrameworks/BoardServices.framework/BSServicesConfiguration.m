@interface BSServicesConfiguration
+ (id)_configurationFromPlist:(void *)a3 postfixBlock:;
+ (id)_parseFeatureFlagsForDomain:(void *)a3 parameterName:(void *)a4 featureFlags:;
+ (id)activateManualDomain:(id)a3;
+ (id)bootstrapConfiguration;
+ (id)defaultConfiguration;
+ (id)extendAutomaticBootstrapCompletion;
+ (id)registerDynamicDomainsFromPlist:(id)a3;
+ (void)activateXPCService;
- (BSServicesConfiguration)init;
- (NSSet)disabledDomains;
- (NSSet)domains;
- (NSString)description;
- (id)_initWithDomainsByIdentifier:(void *)a3 disabledDomainsByIdentifier:;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)domainForIdentifier:(id)a3;
- (id)domainForMachName:(id)a3;
- (id)domainsContainingServiceIdentifier:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
@end

@implementation BSServicesConfiguration

+ (id)bootstrapConfiguration
{
  if (qword_1EB27F7F8 != -1) {
    dispatch_once(&qword_1EB27F7F8, &__block_literal_global_2);
  }
  v2 = (void *)_MergedGlobals_5;

  return v2;
}

- (id)domainsContainingServiceIdentifier:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v5)
  {
    v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      v16 = (objc_class *)objc_opt_class();
      v17 = NSStringFromClass(v16);
      *(_DWORD *)buf = 138544642;
      id v28 = v15;
      __int16 v29 = 2114;
      v30 = v17;
      __int16 v31 = 2048;
      v32 = self;
      __int16 v33 = 2114;
      v34 = @"BSServicesConfiguration.m";
      __int16 v35 = 1024;
      int v36 = 83;
      __int16 v37 = 2114;
      v38 = v14;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v14 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C778BB4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      v20 = (objc_class *)objc_opt_class();
      v21 = NSStringFromClass(v20);
      *(_DWORD *)buf = 138544642;
      id v28 = v19;
      __int16 v29 = 2114;
      v30 = v21;
      __int16 v31 = 2048;
      v32 = self;
      __int16 v33 = 2114;
      v34 = @"BSServicesConfiguration.m";
      __int16 v35 = 1024;
      int v36 = 83;
      __int16 v37 = 2114;
      v38 = v18;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v18 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C778CB4);
  }

  v6 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", -[NSOrderedSet count](self->_orderedDomains, "count"));
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v7 = self->_orderedDomains;
  uint64_t v8 = [(NSOrderedSet *)v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v12 = [v11 serviceForIdentifier:v5];
        if (v12) {
          [v6 addObject:v11];
        }
      }
      uint64_t v8 = [(NSOrderedSet *)v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v8);
  }

  return v6;
}

void __49__BSServicesConfiguration_bootstrapConfiguration__block_invoke()
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x19F3998C0]();
  v1 = [MEMORY[0x1E4F28F80] processInfo];
  v2 = [v1 environment];
  v3 = [v2 objectForKey:@"BSServiceDomains"];

  v4 = [MEMORY[0x1E4F28B50] mainBundle];
  id v5 = [v4 infoDictionary];
  v6 = [v5 objectForKey:@"BSServiceDomains"];

  id v7 = v3;
  id v8 = v6;
  uint64_t v9 = self;
  v10 = (void *)MEMORY[0x19F3998C0]();
  if (v7)
  {
    id v11 = v7;
    v12 = (const char *)[v11 UTF8String];
    if (!v12)
    {
      v20 = [NSString stringWithFormat:@"BSServiceDomains of environment could not be converted to UTF8String : %@", v11];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__bootstrapConfigWithEnv_info_);
        id v21 = (id)objc_claimAutoreleasedReturnValue();
        long long v22 = (objc_class *)objc_opt_class();
        long long v23 = NSStringFromClass(v22);
        *(_DWORD *)buf = 138544642;
        id v46 = v21;
        __int16 v47 = 2114;
        v48 = v23;
        __int16 v49 = 2048;
        uint64_t v50 = v9;
        __int16 v51 = 2114;
        v52 = @"BSServicesConfiguration.m";
        __int16 v53 = 1024;
        int v54 = 322;
        __int16 v55 = 2114;
        v56 = v20;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v20 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C77B408);
    }
    v13 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v12 length:strlen(v12)];
    if (!v13)
    {
      long long v24 = [NSString stringWithFormat:@"BSServiceDomains of environment could not be converted to NSData : %@", v11];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__bootstrapConfigWithEnv_info_);
        id v25 = (id)objc_claimAutoreleasedReturnValue();
        v26 = (objc_class *)objc_opt_class();
        v27 = NSStringFromClass(v26);
        *(_DWORD *)buf = 138544642;
        id v46 = v25;
        __int16 v47 = 2114;
        v48 = v27;
        __int16 v49 = 2048;
        uint64_t v50 = v9;
        __int16 v51 = 2114;
        v52 = @"BSServicesConfiguration.m";
        __int16 v53 = 1024;
        int v54 = 324;
        __int16 v55 = 2114;
        v56 = v24;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v24 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C77B504);
    }
    id v44 = 0;
    v14 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v13 options:0 error:&v44];
    id v15 = v44;
    if (!v14)
    {
      id v28 = [NSString stringWithFormat:@"BSServiceDomains of environment could not be deserialized due to %@ : %@", v15, v11];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__bootstrapConfigWithEnv_info_);
        id v29 = (id)objc_claimAutoreleasedReturnValue();
        v30 = (objc_class *)objc_opt_class();
        __int16 v31 = NSStringFromClass(v30);
        *(_DWORD *)buf = 138544642;
        id v46 = v29;
        __int16 v47 = 2114;
        v48 = v31;
        __int16 v49 = 2048;
        uint64_t v50 = v9;
        __int16 v51 = 2114;
        v52 = @"BSServicesConfiguration.m";
        __int16 v53 = 1024;
        int v54 = 327;
        __int16 v55 = 2114;
        v56 = v28;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v28 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C77B600);
    }

    if (v8)
    {
      v32 = [NSString stringWithFormat:@"BSServiceDomains cannot be defined in both the environment and the Info.plist : env=%@ info=%@", v14, v8];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__bootstrapConfigWithEnv_info_);
        id v33 = (id)objc_claimAutoreleasedReturnValue();
        v34 = (objc_class *)objc_opt_class();
        __int16 v35 = NSStringFromClass(v34);
        *(_DWORD *)buf = 138544642;
        id v46 = v33;
        __int16 v47 = 2114;
        v48 = v35;
        __int16 v49 = 2048;
        uint64_t v50 = v9;
        __int16 v51 = 2114;
        v52 = @"BSServicesConfiguration.m";
        __int16 v53 = 1024;
        int v54 = 331;
        __int16 v55 = 2114;
        v56 = v32;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v32 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C77B6FCLL);
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      int v36 = [NSString stringWithFormat:@"BSServiceDomains of environment was of an unexpected type : %@", v14];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__bootstrapConfigWithEnv_info_);
        id v37 = (id)objc_claimAutoreleasedReturnValue();
        v38 = (objc_class *)objc_opt_class();
        uint64_t v39 = NSStringFromClass(v38);
        *(_DWORD *)buf = 138544642;
        id v46 = v37;
        __int16 v47 = 2114;
        v48 = v39;
        __int16 v49 = 2048;
        uint64_t v50 = v9;
        __int16 v51 = 2114;
        v52 = @"BSServicesConfiguration.m";
        __int16 v53 = 1024;
        int v54 = 332;
        __int16 v55 = 2114;
        v56 = v36;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v36 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C77B7F8);
    }
    uint64_t v16 = +[BSServicesConfiguration _configurationFromPlist:postfixBlock:]((uint64_t)BSServicesConfiguration, v14, 0);
  }
  else
  {
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v40 = [NSString stringWithFormat:@"BSServiceDomains was of an unexpected type : %@", 0];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel__bootstrapConfigWithEnv_info_);
          id v41 = (id)objc_claimAutoreleasedReturnValue();
          v42 = (objc_class *)objc_opt_class();
          v43 = NSStringFromClass(v42);
          *(_DWORD *)buf = 138544642;
          id v46 = v41;
          __int16 v47 = 2114;
          v48 = v43;
          __int16 v49 = 2048;
          uint64_t v50 = v9;
          __int16 v51 = 2114;
          v52 = @"BSServicesConfiguration.m";
          __int16 v53 = 1024;
          int v54 = 335;
          __int16 v55 = 2114;
          v56 = v40;
          _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
        }
        [v40 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19C77B8F0);
      }
      uint64_t v17 = +[BSServicesConfiguration _configurationFromPlist:postfixBlock:]((uint64_t)BSServicesConfiguration, v8, &__block_literal_global_159);
    }
    else
    {
      uint64_t v17 = +[BSServicesConfiguration _configurationFromPlist:postfixBlock:]((uint64_t)BSServicesConfiguration, 0, 0);
    }
    uint64_t v16 = v17;
  }

  v18 = (void *)_MergedGlobals_5;
  _MergedGlobals_5 = v16;

  if (v7)
  {
    *__error() = 0;
    if (unsetenv("BSServiceDomains"))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        int v19 = *__error();
        *(_DWORD *)buf = 67109120;
        LODWORD(v46) = v19;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failed to unsetenv(BSServiceDomains) : errno=%{darwin.errno}d", buf, 8u);
      }
    }
  }
}

+ (id)_configurationFromPlist:(void *)a3 postfixBlock:
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = self;
  id v7 = (void *)MEMORY[0x19F3998C0]();
  id v8 = [MEMORY[0x1E4F1CA60] dictionary];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __64__BSServicesConfiguration__configurationFromPlist_postfixBlock___block_invoke;
  v29[3] = &unk_1E58FC530;
  id v22 = v8;
  id v30 = v22;
  uint64_t v9 = (void *)MEMORY[0x19F399B00](v29);
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v18 = [NSString stringWithFormat:@"domainsInfo was of an unexpected type : %@", v4];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__configurationFromPlist_postfixBlock_);
        id v19 = (id)objc_claimAutoreleasedReturnValue();
        v20 = (objc_class *)objc_opt_class();
        id v21 = NSStringFromClass(v20);
        *(_DWORD *)buf = 138544642;
        id v32 = v19;
        __int16 v33 = 2114;
        v34 = v21;
        __int16 v35 = 2048;
        uint64_t v36 = v6;
        __int16 v37 = 2114;
        v38 = @"BSServicesConfiguration.m";
        __int16 v39 = 1024;
        int v40 = 162;
        __int16 v41 = 2114;
        v42 = v18;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v18 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C77BE04);
    }
  }
  v10 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  id v11 = [MEMORY[0x1E4F1CA60] dictionary];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __64__BSServicesConfiguration__configurationFromPlist_postfixBlock___block_invoke_33;
  v23[3] = &unk_1E58FC5A8;
  v27 = sel__configurationFromPlist_postfixBlock_;
  uint64_t v28 = v6;
  id v12 = v9;
  id v26 = v12;
  id v13 = v11;
  id v24 = v13;
  id v14 = v10;
  id v25 = v14;
  [v4 enumerateKeysAndObjectsUsingBlock:v23];
  id v15 = -[BSServicesConfiguration _initWithDomainsByIdentifier:disabledDomainsByIdentifier:]((id *)[BSServicesConfiguration alloc], v14, v13);
  if (v5)
  {
    uint64_t v16 = v5[2](v5, v15, v12);

    id v15 = (id *)v16;
  }

  return v15;
}

- (id)_initWithDomainsByIdentifier:(void *)a3 disabledDomainsByIdentifier:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v17.receiver = a1;
    v17.super_class = (Class)BSServicesConfiguration;
    a1 = (id *)objc_msgSendSuper2(&v17, sel_init);
    if (a1)
    {
      uint64_t v7 = [v5 copy];
      id v8 = a1[1];
      a1[1] = (id)v7;

      uint64_t v9 = [v6 copy];
      id v10 = a1[2];
      a1[2] = (id)v9;

      id v11 = (void *)MEMORY[0x1E4F1CAA0];
      id v12 = [a1[1] allValues];
      id v13 = [v12 sortedArrayUsingComparator:&__block_literal_global_134];
      uint64_t v14 = [v11 orderedSetWithArray:v13];
      id v15 = a1[3];
      a1[3] = (id)v14;
    }
  }

  return a1;
}

- (BSServicesConfiguration)init
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = [NSString stringWithFormat:@"init is not allowed on BSServicesConfiguration"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    id v10 = v5;
    __int16 v11 = 2114;
    id v12 = v7;
    __int16 v13 = 2048;
    uint64_t v14 = self;
    __int16 v15 = 2114;
    uint64_t v16 = @"BSServicesConfiguration.m";
    __int16 v17 = 1024;
    int v18 = 29;
    __int16 v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (BSServicesConfiguration *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (id)defaultConfiguration
{
  return +[BSServicesConfiguration bootstrapConfiguration];
}

- (NSSet)domains
{
  return [(NSOrderedSet *)self->_orderedDomains set];
}

- (NSSet)disabledDomains
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = [(NSDictionary *)self->_disabledDomainsByIdentifier allValues];
  id v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

- (id)domainForIdentifier:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v5)
  {
    id v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      id v10 = (objc_class *)objc_opt_class();
      __int16 v11 = NSStringFromClass(v10);
      *(_DWORD *)buf = 138544642;
      id v17 = v9;
      __int16 v18 = 2114;
      __int16 v19 = v11;
      __int16 v20 = 2048;
      uint64_t v21 = self;
      __int16 v22 = 2114;
      long long v23 = @"BSServicesConfiguration.m";
      __int16 v24 = 1024;
      int v25 = 68;
      __int16 v26 = 2114;
      v27 = v8;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C784554);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v14 = (objc_class *)objc_opt_class();
      __int16 v15 = NSStringFromClass(v14);
      *(_DWORD *)buf = 138544642;
      id v17 = v13;
      __int16 v18 = 2114;
      __int16 v19 = v15;
      __int16 v20 = 2048;
      uint64_t v21 = self;
      __int16 v22 = 2114;
      long long v23 = @"BSServicesConfiguration.m";
      __int16 v24 = 1024;
      int v25 = 68;
      __int16 v26 = 2114;
      v27 = v12;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v12 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C784654);
  }

  id v6 = [(NSDictionary *)self->_domainsByIdentifier objectForKey:v5];

  return v6;
}

- (id)domainForMachName:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v5)
  {
    uint64_t v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v16 = (objc_class *)objc_opt_class();
      id v17 = NSStringFromClass(v16);
      *(_DWORD *)buf = 138544642;
      id v28 = v15;
      __int16 v29 = 2114;
      id v30 = v17;
      __int16 v31 = 2048;
      id v32 = self;
      __int16 v33 = 2114;
      v34 = @"BSServicesConfiguration.m";
      __int16 v35 = 1024;
      int v36 = 73;
      __int16 v37 = 2114;
      v38 = v14;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v14 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C78493CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __int16 v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v20 = (objc_class *)objc_opt_class();
      uint64_t v21 = NSStringFromClass(v20);
      *(_DWORD *)buf = 138544642;
      id v28 = v19;
      __int16 v29 = 2114;
      id v30 = v21;
      __int16 v31 = 2048;
      id v32 = self;
      __int16 v33 = 2114;
      v34 = @"BSServicesConfiguration.m";
      __int16 v35 = 1024;
      int v36 = 73;
      __int16 v37 = 2114;
      v38 = v18;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v18 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C784A3CLL);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = self->_orderedDomains;
  id v7 = (id)[(NSOrderedSet *)v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        __int16 v11 = [v10 machName];
        char v12 = [v11 isEqualToString:v5];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_13;
        }
      }
      id v7 = (id)[(NSOrderedSet *)v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v7;
}

+ (id)extendAutomaticBootstrapCompletion
{
  +[BSServiceManager sharedInstanceCreatingIfNecessary:]((uint64_t)BSServiceManager, 1);
  v2 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  v3 = -[BSServiceManager extendAutomaticBootstrapCompletion](v2);

  return v3;
}

+ (id)registerDynamicDomainsFromPlist:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[BSServiceManager sharedInstanceCreatingIfNecessary:]((uint64_t)BSServiceManager, 1);
  id v5 = v3;
  uint64_t v6 = self;
  id v7 = +[BSServicesConfiguration _configurationFromPlist:postfixBlock:]((uint64_t)BSServicesConfiguration, v5, 0);
  uint64_t v8 = [v7 domains];
  uint64_t v9 = [v8 count];

  if (!v9)
  {
    char v12 = [NSString stringWithFormat:@"no domains in dynamic registration : %@", v5];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__dynamicConfigWithPlist_);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v14 = (objc_class *)objc_opt_class();
      id v15 = NSStringFromClass(v14);
      *(_DWORD *)buf = 138544642;
      id v17 = v13;
      __int16 v18 = 2114;
      id v19 = v15;
      __int16 v20 = 2048;
      uint64_t v21 = v6;
      __int16 v22 = 2114;
      long long v23 = @"BSServicesConfiguration.m";
      __int16 v24 = 1024;
      int v25 = 416;
      __int16 v26 = 2114;
      v27 = v12;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v12 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C784D38);
  }

  id v10 = -[BSServiceManager registerDynamicConfiguration:]((uint64_t)v4, v7);

  return v10;
}

+ (id)activateManualDomain:(id)a3
{
  id v3 = a3;
  id v4 = +[BSServiceManager sharedInstanceCreatingIfNecessary:]((uint64_t)BSServiceManager, 1);
  id v5 = -[BSServiceManager activateManualDomain:]((uint64_t)v4, v3);

  return v5;
}

+ (void)activateXPCService
{
  v2 = (void *)MEMORY[0x19F3998C0](a1, a2);
  id v3 = +[BSServiceManager sharedInstanceCreatingIfNecessary:]((uint64_t)BSServiceManager, 1);
  -[BSServiceManager enforceXPCServiceListenerRegistration]((uint64_t)v3);

  id v4 = (_Unwind_Exception *)xpc_bs_main();

  _Unwind_Resume(v4);
}

id __64__BSServicesConfiguration__configurationFromPlist_postfixBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = v3;
    id v5 = [*(id *)(a1 + 32) objectForKey:v3];
    uint64_t v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      id v7 = (id)[v4 copyWithZone:0];

      [*(id *)(a1 + 32) setObject:v7 forKey:v7];
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void __64__BSServicesConfiguration__configurationFromPlist_postfixBlock___block_invoke_33(uint64_t a1, void *a2, void *a3)
{
  uint64_t v151 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v117 = a3;
  v108 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v61 = [NSString stringWithFormat:@"identifier of the domain must be NSString : %@", v5];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 56));
      id v62 = (id)objc_claimAutoreleasedReturnValue();
      v63 = (objc_class *)objc_opt_class();
      v64 = NSStringFromClass(v63);
      uint64_t v65 = *(void *)(a1 + 64);
      *(_DWORD *)buf = 138544642;
      id v140 = v62;
      __int16 v141 = 2114;
      v142 = v64;
      __int16 v143 = 2048;
      uint64_t v144 = v65;
      __int16 v145 = 2114;
      v146 = @"BSServicesConfiguration.m";
      __int16 v147 = 1024;
      int v148 = 167;
      __int16 v149 = 2114;
      v150 = v61;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v61 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C785C58);
  }
  int v6 = [v5 hasPrefix:@"XPCService"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v66 = [NSString stringWithFormat:@"configuration of domain %@ must be NSDictionary : %@", v5, v117];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 56));
      id v67 = (id)objc_claimAutoreleasedReturnValue();
      v68 = (objc_class *)objc_opt_class();
      v69 = NSStringFromClass(v68);
      uint64_t v70 = *(void *)(a1 + 64);
      *(_DWORD *)buf = 138544642;
      id v140 = v67;
      __int16 v141 = 2114;
      v142 = v69;
      __int16 v143 = 2048;
      uint64_t v144 = v70;
      __int16 v145 = 2114;
      v146 = @"BSServicesConfiguration.m";
      __int16 v147 = 1024;
      int v148 = 169;
      __int16 v149 = 2114;
      v150 = v66;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v66 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C785D54);
  }
  v116 = [v117 objectForKey:@"MachName"];
  if (v6)
  {
    if (v116)
    {
      v76 = [NSString stringWithFormat:@"MachName of domain %@ is not allowed : %@", v5, v116];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(a1 + 56));
        id v77 = (id)objc_claimAutoreleasedReturnValue();
        v78 = (objc_class *)objc_opt_class();
        v79 = NSStringFromClass(v78);
        uint64_t v80 = *(void *)(a1 + 64);
        *(_DWORD *)buf = 138544642;
        id v140 = v77;
        __int16 v141 = 2114;
        v142 = v79;
        __int16 v143 = 2048;
        uint64_t v144 = v80;
        __int16 v145 = 2114;
        v146 = @"BSServicesConfiguration.m";
        __int16 v147 = 1024;
        int v148 = 174;
        __int16 v149 = 2114;
        v150 = v76;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v76 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C785F50);
    }
    if (([v5 isEqualToString:@"XPCService"] & 1) == 0)
    {
      if (([v5 hasPrefix:@"XPCService."] & 1) == 0)
      {
        v96 = [NSString stringWithFormat:@"XPCService sub domain "];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(*(SEL *)(a1 + 56));
          id v97 = (id)objc_claimAutoreleasedReturnValue();
          v98 = (objc_class *)objc_opt_class();
          v99 = NSStringFromClass(v98);
          uint64_t v100 = *(void *)(a1 + 64);
          *(_DWORD *)buf = 138544642;
          id v140 = v97;
          __int16 v141 = 2114;
          v142 = v99;
          __int16 v143 = 2048;
          uint64_t v144 = v100;
          __int16 v145 = 2114;
          v146 = @"BSServicesConfiguration.m";
          __int16 v147 = 1024;
          int v148 = 176;
          __int16 v149 = 2114;
          v150 = v96;
          _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
        }
        [v96 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19C78633CLL);
      }
      uint64_t v7 = [@"XPCService." length];
      unint64_t v8 = [v5 length];
      if (v8 <= [@"XPCService." length])
      {
        uint64_t v9 = 0;
      }
      else
      {
        uint64_t v9 = [v5 substringFromIndex:v7];
      }
      v116 = v9;
      if (![v9 length])
      {
        v101 = [NSString stringWithFormat:@"MachName of domain %@ is invalid : %@", v5, v9];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(*(SEL *)(a1 + 56));
          id v102 = (id)objc_claimAutoreleasedReturnValue();
          v103 = (objc_class *)objc_opt_class();
          v104 = NSStringFromClass(v103);
          uint64_t v105 = *(void *)(a1 + 64);
          *(_DWORD *)buf = 138544642;
          id v140 = v102;
          __int16 v141 = 2114;
          v142 = v104;
          __int16 v143 = 2048;
          uint64_t v144 = v105;
          __int16 v145 = 2114;
          v146 = @"BSServicesConfiguration.m";
          __int16 v147 = 1024;
          int v148 = 181;
          __int16 v149 = 2114;
          v150 = v101;
          _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
        }
        [v101 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19C786438);
      }
      goto LABEL_17;
    }
LABEL_14:
    v116 = 0;
    goto LABEL_17;
  }
  if (!v116) {
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v10 = [NSString stringWithFormat:@"MachName of domain %@ must be NSString : %@", v5, v116];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 56));
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      char v12 = (objc_class *)objc_opt_class();
      id v13 = NSStringFromClass(v12);
      uint64_t v14 = *(void *)(a1 + 64);
      *(_DWORD *)buf = 138544642;
      id v140 = v11;
      __int16 v141 = 2114;
      v142 = v13;
      __int16 v143 = 2048;
      uint64_t v144 = v14;
      __int16 v145 = 2114;
      v146 = @"BSServicesConfiguration.m";
      __int16 v147 = 1024;
      int v148 = 184;
      __int16 v149 = 2114;
      v150 = v10;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v10 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C7851A8);
  }
LABEL_17:
  v114 = [v117 objectForKey:@"Start"];
  if (v6)
  {
    if (v114)
    {
      v81 = [NSString stringWithFormat:@"Start of domain %@ is not allowed : %@", v5, v114];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(a1 + 56));
        id v82 = (id)objc_claimAutoreleasedReturnValue();
        v83 = (objc_class *)objc_opt_class();
        v84 = NSStringFromClass(v83);
        uint64_t v85 = *(void *)(a1 + 64);
        *(_DWORD *)buf = 138544642;
        id v140 = v82;
        __int16 v141 = 2114;
        v142 = v84;
        __int16 v143 = 2048;
        uint64_t v144 = v85;
        __int16 v145 = 2114;
        v146 = @"BSServicesConfiguration.m";
        __int16 v147 = 1024;
        int v148 = 191;
        __int16 v149 = 2114;
        v150 = v81;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v81 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C78604CLL);
    }
    uint64_t v15 = 3;
  }
  else
  {
    if (!v114)
    {
      v112 = 0;
      goto LABEL_28;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v86 = [NSString stringWithFormat:@"Start of domain %@ must be NSString : %@", v5, v114];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(a1 + 56));
        id v87 = (id)objc_claimAutoreleasedReturnValue();
        v88 = (objc_class *)objc_opt_class();
        v89 = NSStringFromClass(v88);
        uint64_t v90 = *(void *)(a1 + 64);
        *(_DWORD *)buf = 138544642;
        id v140 = v87;
        __int16 v141 = 2114;
        v142 = v89;
        __int16 v143 = 2048;
        uint64_t v144 = v90;
        __int16 v145 = 2114;
        v146 = @"BSServicesConfiguration.m";
        __int16 v147 = 1024;
        int v148 = 194;
        __int16 v149 = 2114;
        v150 = v86;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v86 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C786148);
    }
    if ([v114 isEqualToString:@"ManualBootstrap"])
    {
      uint64_t v15 = 1;
    }
    else
    {
      if (([v114 isEqualToString:@"ManualSession"] & 1) == 0)
      {
        v56 = [NSString stringWithFormat:@"unrecognized Start value of domain %@ : %@", v5, v114];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(*(SEL *)(a1 + 56));
          id v57 = (id)objc_claimAutoreleasedReturnValue();
          v58 = (objc_class *)objc_opt_class();
          v59 = NSStringFromClass(v58);
          uint64_t v60 = *(void *)(a1 + 64);
          *(_DWORD *)buf = 138544642;
          id v140 = v57;
          __int16 v141 = 2114;
          v142 = v59;
          __int16 v143 = 2048;
          uint64_t v144 = v60;
          __int16 v145 = 2114;
          v146 = @"BSServicesConfiguration.m";
          __int16 v147 = 1024;
          int v148 = 200;
          __int16 v149 = 2114;
          v150 = v56;
          _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
        }
        [v56 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19C785B60);
      }
      uint64_t v15 = 2;
    }
  }
  v112 = (void *)v15;
LABEL_28:
  uint64_t v16 = [MEMORY[0x1E4F1CA80] set];
  v113 = [v117 objectForKey:@"DerivedServiceRestrictions"];
  if (v6)
  {
    if (v113)
    {
      id v17 = [NSString stringWithFormat:@"DerivedServiceRestrictions of domain %@ is not allowed : %@", v108, v113];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(a1 + 56));
        id v18 = (id)objc_claimAutoreleasedReturnValue();
        id v19 = (objc_class *)objc_opt_class();
        __int16 v20 = NSStringFromClass(v19);
        uint64_t v21 = *(void *)(a1 + 64);
        *(_DWORD *)buf = 138544642;
        id v140 = v18;
        __int16 v141 = 2114;
        v142 = v20;
        __int16 v143 = 2048;
        uint64_t v144 = v21;
        __int16 v145 = 2114;
        v146 = @"BSServicesConfiguration.m";
        __int16 v147 = 1024;
        int v148 = 208;
        __int16 v149 = 2114;
        v150 = v17;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v17 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C785388);
    }
  }
  else
  {
    if (v113)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v91 = [NSString stringWithFormat:@"DerivedServiceRestrictions of domain %@ was of an unexpected type : %@", v108, v113];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(*(SEL *)(a1 + 56));
          id v92 = (id)objc_claimAutoreleasedReturnValue();
          v93 = (objc_class *)objc_opt_class();
          v94 = NSStringFromClass(v93);
          uint64_t v95 = *(void *)(a1 + 64);
          *(_DWORD *)buf = 138544642;
          id v140 = v92;
          __int16 v141 = 2114;
          v142 = v94;
          __int16 v143 = 2048;
          uint64_t v144 = v95;
          __int16 v145 = 2114;
          v146 = @"BSServicesConfiguration.m";
          __int16 v147 = 1024;
          int v148 = 210;
          __int16 v149 = 2114;
          v150 = v91;
          _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
        }
        [v91 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19C786248);
      }
    }
    long long v134 = 0u;
    long long v135 = 0u;
    long long v132 = 0u;
    long long v133 = 0u;
    id v22 = v113;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v132 objects:v138 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v133;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v133 != v24) {
            objc_enumerationMutation(v22);
          }
          uint64_t v26 = *(void *)(*((void *)&v132 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            __int16 v51 = [NSString stringWithFormat:@"entry of DerivedServiceRestrictions of domain %@ must be NSString : %@", v108, v26];
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
            {
              NSStringFromSelector(*(SEL *)(a1 + 56));
              id v52 = (id)objc_claimAutoreleasedReturnValue();
              __int16 v53 = (objc_class *)objc_opt_class();
              int v54 = NSStringFromClass(v53);
              uint64_t v55 = *(void *)(a1 + 64);
              *(_DWORD *)buf = 138544642;
              id v140 = v52;
              __int16 v141 = 2114;
              v142 = v54;
              __int16 v143 = 2048;
              uint64_t v144 = v55;
              __int16 v145 = 2114;
              v146 = @"BSServicesConfiguration.m";
              __int16 v147 = 1024;
              int v148 = 212;
              __int16 v149 = 2114;
              v150 = v51;
              _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
            }
            [v51 UTF8String];
            _bs_set_crash_log_message();
            __break(0);
            JUMPOUT(0x19C785A64);
          }
          v27 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
          [v16 addObject:v27];
        }
        uint64_t v23 = [v22 countByEnumeratingWithState:&v132 objects:v138 count:16];
      }
      while (v23);
    }
  }
  v115 = [v117 objectForKey:@"Services"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v71 = [NSString stringWithFormat:@"expected a Services entry in the configuration of domain %@ : %@", v108, v117];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 56));
      id v72 = (id)objc_claimAutoreleasedReturnValue();
      v73 = (objc_class *)objc_opt_class();
      v74 = NSStringFromClass(v73);
      uint64_t v75 = *(void *)(a1 + 64);
      *(_DWORD *)buf = 138544642;
      id v140 = v72;
      __int16 v141 = 2114;
      v142 = v74;
      __int16 v143 = 2048;
      uint64_t v144 = v75;
      __int16 v145 = 2114;
      v146 = @"BSServicesConfiguration.m";
      __int16 v147 = 1024;
      int v148 = 219;
      __int16 v149 = 2114;
      v150 = v71;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v71 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C785E54);
  }
  uint64_t v28 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v115, "count"));
  v126[0] = MEMORY[0x1E4F143A8];
  v126[1] = 3221225472;
  v126[2] = __64__BSServicesConfiguration__configurationFromPlist_postfixBlock___block_invoke_98;
  v126[3] = &unk_1E58FC580;
  id v29 = v108;
  uint64_t v30 = *(void *)(a1 + 64);
  id v127 = v29;
  uint64_t v130 = v30;
  v131 = v112;
  long long v110 = *(_OWORD *)(a1 + 48);
  id v31 = (id)v110;
  long long v129 = v110;
  id v111 = v28;
  id v128 = v111;
  [v115 enumerateKeysAndObjectsUsingBlock:v126];
  id v32 = [v117 objectForKey:@"EnableIfFeatureFlag"];
  v106 = v32;
  if (v32)
  {
    +[BSServicesConfiguration _parseFeatureFlagsForDomain:parameterName:featureFlags:](*(void *)(a1 + 64), v29, @"EnableIfFeatureFlag", v32);
    long long v124 = 0u;
    long long v125 = 0u;
    long long v122 = 0u;
    long long v123 = 0u;
    id v33 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v34 = [v33 countByEnumeratingWithState:&v122 objects:v137 count:16];
    if (v34)
    {
      uint64_t v35 = *(void *)v123;
      while (2)
      {
        for (uint64_t j = 0; j != v34; ++j)
        {
          if (*(void *)v123 != v35) {
            objc_enumerationMutation(v33);
          }
          if (([*(id *)(*((void *)&v122 + 1) + 8 * j) isEnabled] & 1) == 0)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              id v140 = v29;
              _os_log_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Feature flag enablement conditional for BSServiceDomain %{public}@ not satisfied; ignoring domain.",
                buf,
                0xCu);
            }
            int v109 = 1;
            goto LABEL_58;
          }
        }
        uint64_t v34 = [v33 countByEnumeratingWithState:&v122 objects:v137 count:16];
        if (v34) {
          continue;
        }
        break;
      }
    }
    int v109 = 0;
LABEL_58:
  }
  else
  {
    int v109 = 0;
    id v33 = 0;
  }
  __int16 v37 = [v117 objectForKey:@"DisableIfFeatureFlag"];
  v107 = v37;
  if (!v37)
  {
    id v38 = 0;
    goto LABEL_75;
  }
  +[BSServicesConfiguration _parseFeatureFlagsForDomain:parameterName:featureFlags:](*(void *)(a1 + 64), v29, @"DisableIfFeatureFlag", v37);
  long long v120 = 0u;
  long long v121 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  id v38 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v39 = [v38 countByEnumeratingWithState:&v118 objects:v136 count:16];
  if (!v39)
  {

LABEL_72:
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v140 = v29;
      _os_log_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Feature flag disablement conditional met for BSServiceDomain %{public}@; ignoring domain.",
        buf,
        0xCu);
    }
    int v109 = 1;
    goto LABEL_75;
  }
  uint64_t v40 = *(void *)v119;
  int v41 = 1;
  do
  {
    for (uint64_t k = 0; k != v39; ++k)
    {
      if (*(void *)v119 != v40) {
        objc_enumerationMutation(v38);
      }
      v41 &= [*(id *)(*((void *)&v118 + 1) + 8 * k) isEnabled];
    }
    uint64_t v39 = [v38 countByEnumeratingWithState:&v118 objects:v136 count:16];
  }
  while (v39);

  if (v41) {
    goto LABEL_72;
  }
LABEL_75:
  uint64_t v43 = [BSServiceDomainSpecification alloc];
  id v44 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  v45 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  uint64_t v46 = [v16 count];
  if (v46)
  {
    __int16 v47 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    __int16 v47 = 0;
  }
  v48 = -[BSServiceDomainSpecification _initWithIdentifier:machName:start:servicesByIdentifier:derivedServiceRestrictions:enableIfFeatureFlags:disableIfFeatureFlags:]((id *)&v43->super.isa, v44, v45, v112, v111, v47, v33, v38);
  if (v46) {

  }
  if (v109) {
    __int16 v49 = *(void **)(a1 + 32);
  }
  else {
    __int16 v49 = *(void **)(a1 + 40);
  }
  uint64_t v50 = [v48 identifier];
  [v49 setObject:v48 forKey:v50];
}

void __64__BSServicesConfiguration__configurationFromPlist_postfixBlock___block_invoke_98(uint64_t a1, void *a2, void *a3)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v39 = a2;
  id v40 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v19 = [NSString stringWithFormat:@"identifier of a service in domatin %@ must be NSString : %@", *(void *)(a1 + 32), v39];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 56));
      id v20 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v21 = (objc_class *)objc_opt_class();
      id v22 = NSStringFromClass(v21);
      uint64_t v23 = *(void *)(a1 + 64);
      *(_DWORD *)buf = 138544642;
      id v45 = v20;
      __int16 v46 = 2114;
      __int16 v47 = v22;
      __int16 v48 = 2048;
      uint64_t v49 = v23;
      __int16 v50 = 2114;
      __int16 v51 = @"BSServicesConfiguration.m";
      __int16 v52 = 1024;
      int v53 = 223;
      __int16 v54 = 2114;
      uint64_t v55 = v19;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v19 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C786B84);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v24 = [NSString stringWithFormat:@"configuration of service %@ in domain %@ must be NSDictionary : %@", v39, *(void *)(a1 + 32), v40];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 56));
      id v25 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v26 = (objc_class *)objc_opt_class();
      v27 = NSStringFromClass(v26);
      uint64_t v28 = *(void *)(a1 + 64);
      *(_DWORD *)buf = 138544642;
      id v45 = v25;
      __int16 v46 = 2114;
      __int16 v47 = v27;
      __int16 v48 = 2048;
      uint64_t v49 = v28;
      __int16 v50 = 2114;
      __int16 v51 = @"BSServicesConfiguration.m";
      __int16 v52 = 1024;
      int v53 = 224;
      __int16 v54 = 2114;
      uint64_t v55 = v24;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v24 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C786C8CLL);
  }
  id v5 = [v40 objectForKey:@"HideAtLaunch"];
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v29 = [NSString stringWithFormat:@"HideAtLaunch value of service %@ in domain %@ was of an unexpected type : %@", v39, *(void *)(a1 + 32), v5];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(a1 + 56));
        id v30 = (id)objc_claimAutoreleasedReturnValue();
        id v31 = (objc_class *)objc_opt_class();
        id v32 = NSStringFromClass(v31);
        uint64_t v33 = *(void *)(a1 + 64);
        *(_DWORD *)buf = 138544642;
        id v45 = v30;
        __int16 v46 = 2114;
        __int16 v47 = v32;
        __int16 v48 = 2048;
        uint64_t v49 = v33;
        __int16 v50 = 2114;
        __int16 v51 = @"BSServicesConfiguration.m";
        __int16 v52 = 1024;
        int v53 = 229;
        __int16 v54 = 2114;
        uint64_t v55 = v29;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v29 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C786D90);
    }
    if ([v5 BOOLValue] && *(void *)(a1 + 72))
    {
      uint64_t v34 = [NSString stringWithFormat:@"HideAtLaunch is only supported for automatic domains"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(a1 + 56));
        id v35 = (id)objc_claimAutoreleasedReturnValue();
        int v36 = (objc_class *)objc_opt_class();
        __int16 v37 = NSStringFromClass(v36);
        uint64_t v38 = *(void *)(a1 + 64);
        *(_DWORD *)buf = 138544642;
        id v45 = v35;
        __int16 v46 = 2114;
        __int16 v47 = v37;
        __int16 v48 = 2048;
        uint64_t v49 = v38;
        __int16 v50 = 2114;
        __int16 v51 = @"BSServicesConfiguration.m";
        __int16 v52 = 1024;
        int v53 = 231;
        __int16 v54 = 2114;
        uint64_t v55 = v34;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v34 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C786E84);
    }
  }
  int v6 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v7 = objc_msgSend(v40, "bs_safeDictionaryForKey:", @"Options");
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __64__BSServicesConfiguration__configurationFromPlist_postfixBlock___block_invoke_118;
  v41[3] = &unk_1E58FC558;
  id v8 = v6;
  id v42 = v8;
  id v43 = *(id *)(a1 + 48);
  [v7 enumerateKeysAndObjectsUsingBlock:v41];

  uint64_t v9 = *(void *)(a1 + 48);
  id v10 = [BSServiceSpecification alloc];
  id v11 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  char v12 = [v5 BOOLValue];
  uint64_t v13 = [v8 count];
  if (v13)
  {
    uint64_t v14 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v14 = 0;
  }
  uint64_t v15 = -[BSServiceSpecification _initWithIdentifier:hiddenAtLaunch:derived:options:](v10, v11, v12, 0, v14);
  uint64_t v16 = (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v15);

  if (v13) {
  id v17 = *(void **)(a1 + 40);
  }
  id v18 = [v16 identifier];
  [v17 setObject:v16 forKey:v18];
}

void __64__BSServicesConfiguration__configurationFromPlist_postfixBlock___block_invoke_118(uint64_t a1, void *a2, void *a3)
{
}

+ (id)_parseFeatureFlagsForDomain:(void *)a3 parameterName:(void *)a4 featureFlags:
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = self;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x3032000000;
  int v36 = __Block_byref_object_copy__0;
  __int16 v37 = __Block_byref_object_dispose__0;
  id v38 = 0;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __82__BSServicesConfiguration__parseFeatureFlagsForDomain_parameterName_featureFlags___block_invoke;
  v32[3] = &unk_1E58FC610;
  v32[5] = sel__parseFeatureFlagsForDomain_parameterName_featureFlags_;
  v32[6] = v9;
  v32[4] = &v33;
  id v10 = (void (**)(void, void))MEMORY[0x19F399B00](v32);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    ((void (**)(void, id))v10)[2](v10, v8);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v17 = NSString;
      id v18 = (objc_class *)objc_opt_class();
      v20 = id v19 = NSStringFromClass(v18);

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__parseFeatureFlagsForDomain_parameterName_featureFlags_);
        id v21 = (id)objc_claimAutoreleasedReturnValue();
        id v22 = (objc_class *)objc_opt_class();
        uint64_t v23 = NSStringFromClass(v22);
        *(_DWORD *)buf = 138544642;
        id v41 = v21;
        __int16 v42 = 2114;
        id v43 = v23;
        __int16 v44 = 2048;
        uint64_t v45 = v9;
        __int16 v46 = 2114;
        __int16 v47 = @"BSServicesConfiguration.m";
        __int16 v48 = 1024;
        int v49 = 408;
        __int16 v50 = 2114;
        __int16 v51 = v20;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v20 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C787928);
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v24 = [NSString stringWithFormat:@"FeatureFlagConditionals"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__parseFeatureFlagsForDomain_parameterName_featureFlags_);
        id v25 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v26 = (objc_class *)objc_opt_class();
        v27 = NSStringFromClass(v26);
        *(_DWORD *)buf = 138544642;
        id v41 = v25;
        __int16 v42 = 2114;
        id v43 = v27;
        __int16 v44 = 2048;
        uint64_t v45 = v9;
        __int16 v46 = 2114;
        __int16 v47 = @"BSServicesConfiguration.m";
        __int16 v48 = 1024;
        int v49 = 403;
        __int16 v50 = 2114;
        __int16 v51 = v24;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v24 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C787A18);
    }
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v39 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v29 != v13) {
            objc_enumerationMutation(v11);
          }
          v10[2](v10, *(void *)(*((void *)&v28 + 1) + 8 * i));
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v39 count:16];
      }
      while (v12);
    }
  }
  id v15 = (id)v34[5];

  _Block_object_dispose(&v33, 8);

  return v15;
}

uint64_t __84__BSServicesConfiguration__initWithDomainsByIdentifier_disabledDomainsByIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 identifier];
  id v6 = [v4 identifier];
  uint64_t v7 = [v5 compare:v6];

  return v7;
}

id *__56__BSServicesConfiguration__bootstrapConfigWithEnv_info___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v32 = a3;
  uint64_t v34 = v4;
  long long v30 = [v4 domainsContainingServiceIdentifier:@"com.apple.frontboard.system-service"];
  if ([v30 count] == 1)
  {
    id v5 = [v30 anyObject];
    long long v31 = [v5 serviceForIdentifier:@"com.apple.frontboard.system-service"];
    if (v5) {
      id v6 = (void *)v5[8];
    }
    else {
      id v6 = 0;
    }
    id v7 = v6;
    uint64_t v33 = [MEMORY[0x1E4F1CA80] set];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v8 = [&unk_1EED49D48 countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v40 != v9) {
            objc_enumerationMutation(&unk_1EED49D48);
          }
          uint64_t v11 = *(void *)(*((void *)&v39 + 1) + 8 * i);
          if (([v7 containsObject:v11] & 1) == 0)
          {
            uint64_t v12 = [v34 domainsContainingServiceIdentifier:v11];
            BOOL v13 = [v12 count] == 0;

            if (v13)
            {
              uint64_t v14 = [BSServiceSpecification alloc];
              id v15 = v32[2](v32, v11);
              uint64_t v16 = -[BSServiceSpecification _initWithIdentifier:hiddenAtLaunch:derived:options:](v14, v15, [v31 isHiddenAtLaunch], 1, 0);

              id v17 = ((void (**)(id, void *))v32)[2](v32, v16);
              [v33 addObject:v17];
            }
          }
        }
        uint64_t v8 = [&unk_1EED49D48 countByEnumeratingWithState:&v39 objects:v44 count:16];
      }
      while (v8);
    }
    if ([v33 count])
    {
      id v18 = (void *)MEMORY[0x1E4F1CA60];
      id v19 = [v34 domains];
      id v20 = objc_msgSend(v18, "dictionaryWithCapacity:", objc_msgSend(v19, "count"));

      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v21 = [v34 domains];
      uint64_t v22 = [v21 countByEnumeratingWithState:&v35 objects:v43 count:16];
      if (v22)
      {
        uint64_t v23 = *(void *)v36;
        do
        {
          for (uint64_t j = 0; j != v22; ++j)
          {
            if (*(void *)v36 != v23) {
              objc_enumerationMutation(v21);
            }
            id v25 = *(void **)(*((void *)&v35 + 1) + 8 * j);
            if (v25 == v5)
            {
              uint64_t v26 = -[BSServiceDomainSpecification _domainWithAdditionalServices:]((id *)v5, v33);
              v27 = [v5 identifier];
              [v20 setObject:v26 forKey:v27];
            }
            else
            {
              uint64_t v26 = [*(id *)(*((void *)&v35 + 1) + 8 * j) identifier];
              [v20 setObject:v25 forKey:v26];
            }
          }
          uint64_t v22 = [v21 countByEnumeratingWithState:&v35 objects:v43 count:16];
        }
        while (v22);
      }

      long long v28 = -[BSServicesConfiguration _initWithDomainsByIdentifier:disabledDomainsByIdentifier:]((id *)[BSServicesConfiguration alloc], v20, 0);
      uint64_t v34 = v28;
    }
  }

  return v34;
}

void __82__BSServicesConfiguration__parseFeatureFlagsForDomain_parameterName_featureFlags___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v21 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v11 = [NSString stringWithFormat:@"FeatureFlagConditional values must be NSString types."];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      BOOL v13 = (objc_class *)objc_opt_class();
      uint64_t v14 = NSStringFromClass(v13);
      uint64_t v15 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138544642;
      id v23 = v12;
      __int16 v24 = 2114;
      id v25 = v14;
      __int16 v26 = 2048;
      uint64_t v27 = v15;
      __int16 v28 = 2114;
      long long v29 = @"BSServicesConfiguration.m";
      __int16 v30 = 1024;
      int v31 = 385;
      __int16 v32 = 2114;
      uint64_t v33 = v11;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v11 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C788288);
  }
  id v3 = [v21 componentsSeparatedByString:@"/"];
  if ([v3 count] != 2)
  {
    uint64_t v16 = [NSString stringWithFormat:@"Feature flags must be defined in the format: Domain/FeatureName"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      id v18 = (objc_class *)objc_opt_class();
      id v19 = NSStringFromClass(v18);
      uint64_t v20 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138544642;
      id v23 = v17;
      __int16 v24 = 2114;
      id v25 = v19;
      __int16 v26 = 2048;
      uint64_t v27 = v20;
      __int16 v28 = 2114;
      long long v29 = @"BSServicesConfiguration.m";
      __int16 v30 = 1024;
      int v31 = 387;
      __int16 v32 = 2114;
      uint64_t v33 = v16;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v16 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C78837CLL);
  }
  id v4 = [v3 objectAtIndex:0];
  id v5 = [v3 objectAtIndex:1];
  id v6 = [[BSServiceFeatureFlag alloc] initWithDomain:v4 featureName:v5];
  id v7 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (!v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    id v7 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  [v7 addObject:v6];
}

- (NSString)description
{
  return (NSString *)[(BSServicesConfiguration *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(BSServicesConfiguration *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(BSServicesConfiguration *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(BSServicesConfiguration *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__BSServicesConfiguration_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E58FC4E0;
  id v6 = v5;
  id v10 = v6;
  uint64_t v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];
  id v7 = v6;

  return v7;
}

void __65__BSServicesConfiguration_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(*(void *)(a1 + 40) + 24) array];
  objc_msgSend(v1, "appendArraySection:withName:skipIfEmpty:");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedDomains, 0);
  objc_storeStrong((id *)&self->_disabledDomainsByIdentifier, 0);

  objc_storeStrong((id *)&self->_domainsByIdentifier, 0);
}

@end