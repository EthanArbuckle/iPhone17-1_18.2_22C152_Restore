@interface BSMutableServiceInterface
+ (id)interfaceWithIdentifier:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setClient:(id)a3;
- (void)setClientMessagingExpectation:(int64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setServer:(id)a3;
@end

@implementation BSMutableServiceInterface

- (id)copyWithZone:(_NSZone *)a3
{
  int64_t v5 = [(BSServiceInterface *)self clientMessagingExpectation];
  v6 = (uint64_t *)MEMORY[0x1E4F1CFD0];
  if (v5 != 1) {
    v6 = (uint64_t *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t v7 = *v6;
  v8 = +[BSServiceInterface allocWithZone:a3];
  identifier = self->super._identifier;
  server = self->super._server;
  client = self->super._client;

  return -[BSServiceInterface _initWithIdentifier:server:client:clientWaitsForActivation:](v8, identifier, server, client, v7);
}

+ (id)interfaceWithIdentifier:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v5)
  {
    v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      *(_DWORD *)buf = 138544642;
      id v20 = v12;
      __int16 v21 = 2114;
      v22 = v14;
      __int16 v23 = 2048;
      id v24 = a1;
      __int16 v25 = 2114;
      v26 = @"BSServiceInterface.m";
      __int16 v27 = 1024;
      int v28 = 448;
      __int16 v29 = 2114;
      v30 = v11;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v11 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C76DADCLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      v17 = (objc_class *)objc_opt_class();
      v18 = NSStringFromClass(v17);
      *(_DWORD *)buf = 138544642;
      id v20 = v16;
      __int16 v21 = 2114;
      v22 = v18;
      __int16 v23 = 2048;
      id v24 = a1;
      __int16 v25 = 2114;
      v26 = @"BSServiceInterface.m";
      __int16 v27 = 1024;
      int v28 = 448;
      __int16 v29 = 2114;
      v30 = v15;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v15 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C76DBDCLL);
  }

  v6 = [BSMutableServiceInterface alloc];
  uint64_t v7 = __emptyProtocol();
  v8 = __emptyProtocol();
  v9 = -[BSServiceInterface _initWithIdentifier:server:client:clientWaitsForActivation:](v6, v5, v7, v8, 0);

  return v9;
}

- (void)setClient:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  if (v13)
  {
    NSClassFromString(&cfstr_Bsobjcprotocol.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:BSObjCProtocolClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        id v10 = (id)objc_claimAutoreleasedReturnValue();
        v11 = (objc_class *)objc_opt_class();
        id v12 = NSStringFromClass(v11);
        *(_DWORD *)buf = 138544642;
        id v15 = v10;
        __int16 v16 = 2114;
        v17 = v12;
        __int16 v18 = 2048;
        v19 = self;
        __int16 v20 = 2114;
        __int16 v21 = @"BSServiceInterface.m";
        __int16 v22 = 1024;
        int v23 = 477;
        __int16 v24 = 2114;
        __int16 v25 = v9;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v9 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C772FF0);
    }

    id v5 = __protocolsToRemove();
    id v6 = [v13 flattenWithIgnoredInheritedProtocols:v5];

    __vetProtocol(v6);
    char v7 = BSEqualObjects();
  }
  else
  {
    __emptyProtocol();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    char v7 = BSEqualObjects();
  }
  if ((v7 & 1) == 0)
  {
    id v6 = v6;
    client = self->super._client;
    self->super._client = (BSObjCProtocol *)v6;
  }
}

- (void)setServer:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  if (v13)
  {
    NSClassFromString(&cfstr_Bsobjcprotocol.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:BSObjCProtocolClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        id v10 = (id)objc_claimAutoreleasedReturnValue();
        v11 = (objc_class *)objc_opt_class();
        id v12 = NSStringFromClass(v11);
        *(_DWORD *)buf = 138544642;
        id v15 = v10;
        __int16 v16 = 2114;
        v17 = v12;
        __int16 v18 = 2048;
        v19 = self;
        __int16 v20 = 2114;
        __int16 v21 = @"BSServiceInterface.m";
        __int16 v22 = 1024;
        int v23 = 460;
        __int16 v24 = 2114;
        __int16 v25 = v9;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v9 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C77326CLL);
    }

    id v5 = __protocolsToRemove();
    id v6 = [v13 flattenWithIgnoredInheritedProtocols:v5];

    __vetProtocol(v6);
    char v7 = BSEqualObjects();
  }
  else
  {
    __emptyProtocol();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    char v7 = BSEqualObjects();
  }
  if ((v7 & 1) == 0)
  {
    id v6 = v6;
    server = self->super._server;
    self->super._server = (BSObjCProtocol *)v6;
  }
}

- (void)setClientMessagingExpectation:(int64_t)a3
{
  v3 = (__CFBoolean **)MEMORY[0x1E4F1CFD0];
  if (a3 != 1) {
    v3 = (__CFBoolean **)MEMORY[0x1E4F1CFC8];
  }
  self->super._clientWaitsForActivation = *v3;
}

- (void)setIdentifier:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v15)
  {
    char v7 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      v9 = (objc_class *)objc_opt_class();
      id v10 = NSStringFromClass(v9);
      *(_DWORD *)buf = 138544642;
      id v17 = v8;
      __int16 v18 = 2114;
      v19 = v10;
      __int16 v20 = 2048;
      __int16 v21 = self;
      __int16 v22 = 2114;
      int v23 = @"BSServiceInterface.m";
      __int16 v24 = 1024;
      int v25 = 454;
      __int16 v26 = 2114;
      __int16 v27 = v7;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v7 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C788EC8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      id v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      *(_DWORD *)buf = 138544642;
      id v17 = v12;
      __int16 v18 = 2114;
      v19 = v14;
      __int16 v20 = 2048;
      __int16 v21 = self;
      __int16 v22 = 2114;
      int v23 = @"BSServiceInterface.m";
      __int16 v24 = 1024;
      int v25 = 454;
      __int16 v26 = 2114;
      __int16 v27 = v11;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v11 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C788FC8);
  }

  id v5 = (NSString *)[v15 copy];
  identifier = self->super._identifier;
  self->super._identifier = v5;
}

@end