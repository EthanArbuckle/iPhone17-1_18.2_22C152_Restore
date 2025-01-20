@interface BSServiceInterface
+ (BSServiceInterface)interfaceWithServer:(id)a3 client:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BSObjCProtocol)client;
- (BSObjCProtocol)server;
- (BSServiceInterface)init;
- (NSString)debugDescription;
- (NSString)identifier;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)invertInterface:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)clientMessagingExpectation;
- (unint64_t)hash;
- (void)_initWithIdentifier:(void *)a3 server:(void *)a4 client:(uint64_t)a5 clientWaitsForActivation:;
- (void)setIdentifier:(id)a3;
@end

@implementation BSServiceInterface

- (void)_initWithIdentifier:(void *)a3 server:(void *)a4 client:(uint64_t)a5 clientWaitsForActivation:
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  if (a1)
  {
    uint64_t v12 = objc_opt_class();
    if (v12 != objc_opt_class())
    {
      uint64_t v13 = objc_opt_class();
      if (v13 != objc_opt_class())
      {
        v40 = [NSString stringWithFormat:@"BSServiceInterface is not intended to be subclassed"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel__initWithIdentifier_server_client_clientWaitsForActivation_);
          id v41 = (id)objc_claimAutoreleasedReturnValue();
          v42 = (objc_class *)objc_opt_class();
          v43 = NSStringFromClass(v42);
          *(_DWORD *)buf = 138544642;
          id v46 = v41;
          __int16 v47 = 2114;
          v48 = v43;
          __int16 v49 = 2048;
          v50 = a1;
          __int16 v51 = 2114;
          v52 = @"BSServiceInterface.m";
          __int16 v53 = 1024;
          int v54 = 296;
          __int16 v55 = 2114;
          v56 = v40;
          _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
        }
        [v40 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19C761038);
      }
    }
    id v14 = v10;
    NSClassFromString(&cfstr_Bsobjcprotocol.isa);
    if (!v14)
    {
      v24 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__initWithIdentifier_server_client_clientWaitsForActivation_);
        id v25 = (id)objc_claimAutoreleasedReturnValue();
        v26 = (objc_class *)objc_opt_class();
        v27 = NSStringFromClass(v26);
        *(_DWORD *)buf = 138544642;
        id v46 = v25;
        __int16 v47 = 2114;
        v48 = v27;
        __int16 v49 = 2048;
        v50 = a1;
        __int16 v51 = 2114;
        v52 = @"BSServiceInterface.m";
        __int16 v53 = 1024;
        int v54 = 297;
        __int16 v55 = 2114;
        v56 = v24;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v24 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C760C44);
    }
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v28 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:BSObjCProtocolClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__initWithIdentifier_server_client_clientWaitsForActivation_);
        id v29 = (id)objc_claimAutoreleasedReturnValue();
        v30 = (objc_class *)objc_opt_class();
        v31 = NSStringFromClass(v30);
        *(_DWORD *)buf = 138544642;
        id v46 = v29;
        __int16 v47 = 2114;
        v48 = v31;
        __int16 v49 = 2048;
        v50 = a1;
        __int16 v51 = 2114;
        v52 = @"BSServiceInterface.m";
        __int16 v53 = 1024;
        int v54 = 297;
        __int16 v55 = 2114;
        v56 = v28;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v28 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C760D44);
    }

    id v15 = v11;
    NSClassFromString(&cfstr_Bsobjcprotocol.isa);
    if (!v15)
    {
      v32 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__initWithIdentifier_server_client_clientWaitsForActivation_);
        id v33 = (id)objc_claimAutoreleasedReturnValue();
        v34 = (objc_class *)objc_opt_class();
        v35 = NSStringFromClass(v34);
        *(_DWORD *)buf = 138544642;
        id v46 = v33;
        __int16 v47 = 2114;
        v48 = v35;
        __int16 v49 = 2048;
        v50 = a1;
        __int16 v51 = 2114;
        v52 = @"BSServiceInterface.m";
        __int16 v53 = 1024;
        int v54 = 298;
        __int16 v55 = 2114;
        v56 = v32;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v32 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C760E44);
    }
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v36 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:BSObjCProtocolClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__initWithIdentifier_server_client_clientWaitsForActivation_);
        id v37 = (id)objc_claimAutoreleasedReturnValue();
        v38 = (objc_class *)objc_opt_class();
        v39 = NSStringFromClass(v38);
        *(_DWORD *)buf = 138544642;
        id v46 = v37;
        __int16 v47 = 2114;
        v48 = v39;
        __int16 v49 = 2048;
        v50 = a1;
        __int16 v51 = 2114;
        v52 = @"BSServiceInterface.m";
        __int16 v53 = 1024;
        int v54 = 298;
        __int16 v55 = 2114;
        v56 = v36;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v36 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C760F44);
    }

    v44.receiver = a1;
    v44.super_class = (Class)BSServiceInterface;
    v16 = objc_msgSendSuper2(&v44, sel_init);
    if (v16)
    {
      uint64_t v17 = [v9 copy];
      v18 = (void *)v16[1];
      v16[1] = v17;

      uint64_t v19 = [v14 copy];
      v20 = (void *)v16[2];
      v16[2] = v19;

      uint64_t v21 = [v15 copy];
      v22 = (void *)v16[3];
      v16[3] = v21;

      v16[4] = a5;
    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BSObjCProtocol)client
{
  return self->_client;
}

- (BSObjCProtocol)server
{
  return self->_server;
}

- (int64_t)clientMessagingExpectation
{
  clientWaitsForActivation = self->_clientWaitsForActivation;
  if (clientWaitsForActivation)
  {
    return CFBooleanGetValue(clientWaitsForActivation) != 0;
  }
  else
  {
    v5 = [(BSObjCProtocol *)self->_server methods];
    BOOL v4 = [v5 count] == 0;
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_server, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSString)identifier
{
  return self->_identifier;
}

+ (BSServiceInterface)interfaceWithServer:(id)a3 client:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v7;
  NSClassFromString(&cfstr_Bsobjcprotocol.isa);
  if (!v9)
  {
    uint64_t v21 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v22 = (id)objc_claimAutoreleasedReturnValue();
      v23 = (objc_class *)objc_opt_class();
      v24 = NSStringFromClass(v23);
      *(_DWORD *)buf = 138544642;
      id v38 = v22;
      __int16 v39 = 2114;
      v40 = v24;
      __int16 v41 = 2048;
      id v42 = a1;
      __int16 v43 = 2114;
      objc_super v44 = @"BSServiceInterface.m";
      __int16 v45 = 1024;
      int v46 = 357;
      __int16 v47 = 2114;
      v48 = v21;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v21 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C7729E0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v25 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:BSObjCProtocolClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v26 = (id)objc_claimAutoreleasedReturnValue();
      v27 = (objc_class *)objc_opt_class();
      v28 = NSStringFromClass(v27);
      *(_DWORD *)buf = 138544642;
      id v38 = v26;
      __int16 v39 = 2114;
      v40 = v28;
      __int16 v41 = 2048;
      id v42 = a1;
      __int16 v43 = 2114;
      objc_super v44 = @"BSServiceInterface.m";
      __int16 v45 = 1024;
      int v46 = 357;
      __int16 v47 = 2114;
      v48 = v25;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v25 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C772AE0);
  }

  id v10 = __protocolsToRemove();
  id v11 = [v9 flattenWithIgnoredInheritedProtocols:v10];

  __vetProtocol(v11);
  id v12 = v8;
  NSClassFromString(&cfstr_Bsobjcprotocol.isa);
  if (!v12)
  {
    id v29 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v30 = (id)objc_claimAutoreleasedReturnValue();
      v31 = (objc_class *)objc_opt_class();
      v32 = NSStringFromClass(v31);
      *(_DWORD *)buf = 138544642;
      id v38 = v30;
      __int16 v39 = 2114;
      v40 = v32;
      __int16 v41 = 2048;
      id v42 = a1;
      __int16 v43 = 2114;
      objc_super v44 = @"BSServiceInterface.m";
      __int16 v45 = 1024;
      int v46 = 361;
      __int16 v47 = 2114;
      v48 = v29;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v29 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C772BE0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v33 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:BSObjCProtocolClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v34 = (id)objc_claimAutoreleasedReturnValue();
      v35 = (objc_class *)objc_opt_class();
      v36 = NSStringFromClass(v35);
      *(_DWORD *)buf = 138544642;
      id v38 = v34;
      __int16 v39 = 2114;
      v40 = v36;
      __int16 v41 = 2048;
      id v42 = a1;
      __int16 v43 = 2114;
      objc_super v44 = @"BSServiceInterface.m";
      __int16 v45 = 1024;
      int v46 = 361;
      __int16 v47 = 2114;
      v48 = v33;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v33 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C772CE0);
  }

  uint64_t v13 = __protocolsToRemove();
  id v14 = [v12 flattenWithIgnoredInheritedProtocols:v13];

  __vetProtocol(v14);
  id v15 = [BSServiceInterface alloc];
  v16 = [v11 methods];
  uint64_t v17 = [v16 count];
  v18 = (uint64_t *)MEMORY[0x1E4F1CFD0];
  if (v17) {
    v18 = (uint64_t *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t v19 = -[BSServiceInterface _initWithIdentifier:server:client:clientWaitsForActivation:](v15, 0, v11, v14, *v18);

  return (BSServiceInterface *)v19;
}

- (id)invertInterface:(id)a3
{
  BOOL v4 = (void (**)(id, void *))a3;
  if (v4)
  {
    v5 = -[BSServiceInterface _initWithIdentifier:server:client:clientWaitsForActivation:]([BSMutableServiceInterface alloc], self->_identifier, self->_client, self->_server, 0);
    v4[2](v4, v5);
    v6 = (void *)[v5 copy];
  }
  else
  {
    v6 = -[BSServiceInterface _initWithIdentifier:server:client:clientWaitsForActivation:]([BSServiceInterface alloc], self->_identifier, self->_client, self->_server, 0);
  }

  return v6;
}

- (BSServiceInterface)init
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [NSString stringWithFormat:@"init is not allowed on BSServiceInterface"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    id v10 = v5;
    __int16 v11 = 2114;
    id v12 = v7;
    __int16 v13 = 2048;
    id v14 = self;
    __int16 v15 = 2114;
    v16 = @"BSServiceInterface.m";
    __int16 v17 = 1024;
    int v18 = 291;
    __int16 v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (BSServiceInterface *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)setIdentifier:(id)a3
{
  id v6 = a3;
  BOOL v4 = (NSString *)[v6 copy];
  identifier = self->_identifier;
  self->_identifier = v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  BOOL v4 = +[BSMutableServiceInterface allocWithZone:a3];
  identifier = self->_identifier;
  server = self->_server;
  client = self->_client;
  clientWaitsForActivation = self->_clientWaitsForActivation;

  return -[BSServiceInterface _initWithIdentifier:server:client:clientWaitsForActivation:](v4, identifier, server, client, (uint64_t)clientWaitsForActivation);
}

- (id)succinctDescription
{
  v2 = [(BSServiceInterface *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [v3 appendString:self->_identifier withName:0];
  BOOL v4 = [(BSObjCProtocol *)self->_server name];
  [v3 appendString:v4 withName:@"server"];

  id v5 = [(BSObjCProtocol *)self->_client name];
  [v3 appendString:v5 withName:@"client"];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(BSServiceInterface *)self descriptionBuilderWithMultilinePrefix:a3];
  BOOL v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(BSServiceInterface *)self succinctDescriptionBuilder];
  [v5 appendString:self->_identifier withName:0];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__BSServiceInterface_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E58FC4E0;
  id v6 = v5;
  id v10 = v6;
  __int16 v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];
  id v7 = v6;

  return v7;
}

CFBooleanRef __60__BSServiceInterface_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 16) withName:@"server"];
  id v3 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 24) withName:@"client"];
  CFBooleanRef result = *(const __CFBoolean **)(*(void *)(a1 + 40) + 32);
  if (result) {
    return (const __CFBoolean *)(id)[*(id *)(a1 + 32) appendBool:CFBooleanGetValue(result) != 0 withName:@"clientWaitsForActivation"];
  }
  return result;
}

- (unint64_t)hash
{
  identifier = self->_identifier;
  if (identifier)
  {
    return [(NSString *)identifier hash];
  }
  else
  {
    uint64_t v5 = [(BSObjCProtocol *)self->_server hash];
    return [(BSObjCProtocol *)self->_client hash] ^ v5;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BSServiceInterface *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if ((v5 == objc_opt_class() || (uint64_t v6 = objc_opt_class(), v6 == objc_opt_class()))
      && BSEqualStrings()
      && BSEqualObjects()
      && BSEqualObjects())
    {
      int64_t v7 = [(BSServiceInterface *)self clientMessagingExpectation];
      BOOL v8 = v7 == [(BSServiceInterface *)v4 clientMessagingExpectation];
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (NSString)debugDescription
{
  return (NSString *)[(BSServiceInterface *)self descriptionWithMultilinePrefix:0];
}

@end