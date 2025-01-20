@interface BSServiceConnectionEndpoint
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (NSString)defaultShellMachName;
+ (id)_endpointForManager:(void *)a3 domain:(void *)a4 service:(void *)a5 instance:;
+ (id)_endpointFromEndowmentRepresentation:(uint64_t)a1;
+ (id)endpointForMachName:(id)a3 service:(id)a4 instance:(id)a5;
+ (id)endpointForServiceName:(id)a3 oneshot:(id)a4 service:(id)a5 instance:(id)a6;
+ (id)endpointForSystemMachName:(id)a3 service:(id)a4 instance:(id)a5;
+ (id)endpointOfLaunchIdentifier:(id)a3 fromLaunchResponse:(id)a4 withService:(id)a5 instance:(id)a6 error:(id *)a7;
+ (id)nullEndpointForService:(id)a3 instance:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNonLaunching;
- (BOOL)isNullEndpoint;
- (BSServiceConnectionEndpoint)init;
- (BSServiceConnectionEndpoint)initWithBSXPCCoder:(id)a3;
- (BSServiceConnectionEndpoint)initWithCoder:(id)a3;
- (BSServiceConnectionEndpoint)initWithXPCDictionary:(id)a3;
- (NSString)description;
- (NSString)instance;
- (NSString)service;
- (NSString)targetDescription;
- (id)_initForNullEndpointWithService:(void *)a3 instance:;
- (id)_initWithEndpoint:(void *)a3 oneshot:(char)a4 isNonLaunching:(int)a5 targetPID:(void *)a6 targetDescription:(void *)a7 service:(void *)a8 instance:;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
- (void)_endowmentRepresentation;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
- (void)saveAsInjectorEndowmentForKey:(id)a3;
@end

@implementation BSServiceConnectionEndpoint

+ (NSString)defaultShellMachName
{
  return (NSString *)@"com.apple.frontboard.systemappservices";
}

- (unint64_t)hash
{
  endpoint = self->_endpoint;
  if (endpoint) {
    size_t v4 = xpc_hash(endpoint);
  }
  else {
    size_t v4 = 0;
  }
  NSUInteger v5 = [(NSString *)self->_service hash] ^ v4;
  return v5 ^ [(NSString *)self->_instance hash];
}

- (NSString)service
{
  return self->_service;
}

- (NSString)targetDescription
{
  if (self->_targetDescription) {
    return self->_targetDescription;
  }
  else {
    return (NSString *)@"<null>";
  }
}

- (NSString)instance
{
  return self->_instance;
}

- (BOOL)isNonLaunching
{
  return self->_nonLaunching;
}

- (BOOL)isNullEndpoint
{
  return !self->_endpoint && self->_targetDescription == 0;
}

- (BOOL)isEqual:(id)a3
{
  size_t v4 = (BSServiceConnectionEndpoint *)a3;
  if (self == v4)
  {
    char v6 = 1;
    goto LABEL_5;
  }
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    endpoint = self->_endpoint;
    v9 = v4->_endpoint;
    if (endpoint)
    {
      if (!v9 || !xpc_equal(endpoint, v9)) {
        goto LABEL_3;
      }
    }
    else if (v9)
    {
      goto LABEL_3;
    }
    if (BSEqualStrings())
    {
      char v6 = BSEqualStrings();
      goto LABEL_5;
    }
  }
LABEL_3:
  char v6 = 0;
LABEL_5:

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oneshot, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_instance, 0);
  objc_storeStrong((id *)&self->_service, 0);

  objc_storeStrong((id *)&self->_targetDescription, 0);
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BSServiceConnectionEndpoint)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeInt64ForKey:@"p"];
  char v6 = [v4 decodeXPCObjectOfType:MEMORY[0x1E4F145A0] forKey:@"e"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"o"];
  char v8 = [v4 decodeBoolForKey:@"nl"];
  if ((unint64_t)(v5 - 0x80000000) >= 0xFFFFFFFF80000001) {
    int v9 = v5;
  }
  else {
    int v9 = 0;
  }
  v10 = [v4 decodeStringForKey:@"t"];
  v11 = [v4 decodeStringForKey:@"s"];
  v12 = [v4 decodeStringForKey:@"i"];
  __decodedEndpoint(self, v6, v7, v8, v9, v10, v11, v12, @"BSXPCSecureCoding");
  v13 = (BSServiceConnectionEndpoint *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)endpointOfLaunchIdentifier:(id)a3 fromLaunchResponse:(id)a4 withService:(id)a5 instance:(id)a6 error:(id *)a7
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v46 = a4;
  id v45 = a5;
  id v44 = a6;
  id v48 = v11;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v48)
  {
    v30 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v31 = [NSString stringWithUTF8String:"+[BSServiceConnectionEndpoint endpointOfLaunchIdentifier:fromLaunchResponse:withService:instance:error:]"];
      *(_DWORD *)buf = 138544130;
      v62 = v31;
      __int16 v63 = 2114;
      v64 = @"BSServiceConnectionEndpoint.m";
      __int16 v65 = 1024;
      int v66 = 274;
      __int16 v67 = 2114;
      v68 = v30;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v30 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C773A08);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v32 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v33 = [NSString stringWithUTF8String:"+[BSServiceConnectionEndpoint endpointOfLaunchIdentifier:fromLaunchResponse:withService:instance:error:]"];
      *(_DWORD *)buf = 138544130;
      v62 = v33;
      __int16 v63 = 2114;
      v64 = @"BSServiceConnectionEndpoint.m";
      __int16 v65 = 1024;
      int v66 = 274;
      __int16 v67 = 2114;
      v68 = v32;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v32 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C773ADCLL);
  }

  id v12 = v46;
  NSClassFromString(&cfstr_Rbslaunchrespo.isa);
  if (!v12)
  {
    v34 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v35 = [NSString stringWithUTF8String:"+[BSServiceConnectionEndpoint endpointOfLaunchIdentifier:fromLaunchResponse:withService:instance:error:]"];
      *(_DWORD *)buf = 138544130;
      v62 = v35;
      __int16 v63 = 2114;
      v64 = @"BSServiceConnectionEndpoint.m";
      __int16 v65 = 1024;
      int v66 = 275;
      __int16 v67 = 2114;
      v68 = v34;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v34 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C773BB0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v36 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:RBSLaunchResponseClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v37 = [NSString stringWithUTF8String:"+[BSServiceConnectionEndpoint endpointOfLaunchIdentifier:fromLaunchResponse:withService:instance:error:]"];
      *(_DWORD *)buf = 138544130;
      v62 = v37;
      __int16 v63 = 2114;
      v64 = @"BSServiceConnectionEndpoint.m";
      __int16 v65 = 1024;
      int v66 = 275;
      __int16 v67 = 2114;
      v68 = v36;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v36 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C773C84);
  }

  id v13 = v45;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v13)
  {
    v38 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v39 = [NSString stringWithUTF8String:"+[BSServiceConnectionEndpoint endpointOfLaunchIdentifier:fromLaunchResponse:withService:instance:error:]"];
      *(_DWORD *)buf = 138544130;
      v62 = v39;
      __int16 v63 = 2114;
      v64 = @"BSServiceConnectionEndpoint.m";
      __int16 v65 = 1024;
      int v66 = 276;
      __int16 v67 = 2114;
      v68 = v38;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v38 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C773D58);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v40 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v41 = [NSString stringWithUTF8String:"+[BSServiceConnectionEndpoint endpointOfLaunchIdentifier:fromLaunchResponse:withService:instance:error:]"];
      *(_DWORD *)buf = 138544130;
      v62 = v41;
      __int16 v63 = 2114;
      v64 = @"BSServiceConnectionEndpoint.m";
      __int16 v65 = 1024;
      int v66 = 276;
      __int16 v67 = 2114;
      v68 = v40;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v40 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C773E2CLL);
  }

  id v14 = v44;
  if (v14)
  {
    NSClassFromString(&cfstr_Nsstring.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v42 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v43 = [NSString stringWithUTF8String:"+[BSServiceConnectionEndpoint endpointOfLaunchIdentifier:fromLaunchResponse:withService:instance:error:]"];
        *(_DWORD *)buf = 138544130;
        v62 = v43;
        __int16 v63 = 2114;
        v64 = @"BSServiceConnectionEndpoint.m";
        __int16 v65 = 1024;
        int v66 = 277;
        __int16 v67 = 2114;
        v68 = v42;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
      }
      [v42 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C773F00);
    }
  }

  v15 = [v12 process];
  v47 = [v12 managedEndpointByLaunchIdentifier];
  v16 = [v47 objectForKey:v48];
  v17 = v16;
  if (v15 && v16)
  {
    v18 = [v16 endpoint];
    if (v18)
    {
      v19 = [v15 identity];
      if ([v19 isXPCService])
      {
        v20 = [v19 uuid];
        v21 = [v17 name];
        v22 = BSServiceConnectionEndpointTargetDescriptionForServiceLookup(v21, v20);
      }
      else
      {
        v21 = [v17 name];
        v22 = __escaped(v21);
        v20 = 0;
      }

      v25 = -[BSServiceConnectionEndpoint _initWithEndpoint:oneshot:isNonLaunching:targetPID:targetDescription:service:instance:]([BSServiceConnectionEndpoint alloc], v18, v20, [v17 isNonLaunching], 0, v22, v13, v14);
    }
    else
    {
      if (a7)
      {
        v26 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v27 = *MEMORY[0x1E4F285A8];
        v56[0] = MEMORY[0x1E4F143A8];
        v56[1] = 3221225472;
        v56[2] = __104__BSServiceConnectionEndpoint_endpointOfLaunchIdentifier_fromLaunchResponse_withService_instance_error___block_invoke;
        v56[3] = &unk_1E58FCDD8;
        id v57 = v17;
        id v58 = v48;
        id v59 = v15;
        id v60 = v12;
        objc_msgSend(v26, "bs_errorWithDomain:code:configuration:", v27, 1, v56);
        *a7 = (id)objc_claimAutoreleasedReturnValue();
      }
      v18 = 0;
      v25 = 0;
    }
  }
  else
  {
    if (!a7)
    {
      v25 = 0;
      goto LABEL_25;
    }
    v23 = (void *)MEMORY[0x1E4F28C58];
    if (v15)
    {
      uint64_t v24 = *MEMORY[0x1E4F285A8];
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = __104__BSServiceConnectionEndpoint_endpointOfLaunchIdentifier_fromLaunchResponse_withService_instance_error___block_invoke_2;
      v51[3] = &unk_1E58FCDD8;
      id v52 = v48;
      id v53 = v15;
      id v54 = v47;
      id v55 = v12;
      objc_msgSend(v23, "bs_errorWithDomain:code:configuration:", v24, 56, v51);
      *a7 = (id)objc_claimAutoreleasedReturnValue();

      v25 = 0;
      v18 = v52;
    }
    else
    {
      uint64_t v28 = *MEMORY[0x1E4F28798];
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __104__BSServiceConnectionEndpoint_endpointOfLaunchIdentifier_fromLaunchResponse_withService_instance_error___block_invoke_3;
      v49[3] = &unk_1E58FCE00;
      id v50 = v12;
      objc_msgSend(v23, "bs_errorWithDomain:code:configuration:", v28, 3, v49);
      v25 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
      v18 = v50;
    }
  }

LABEL_25:

  return v25;
}

+ (id)endpointForServiceName:(id)a3 oneshot:(id)a4 service:(id)a5 instance:(id)a6
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = 0;
  if (v9 && v11)
  {
    if (v10)
    {
      v19[0] = 0;
      v19[1] = 0;
      [v10 getUUIDBytes:v19];
      [v9 UTF8String];
      uint64_t bs_service = xpc_endpoint_create_bs_service();
    }
    else
    {
      [v9 UTF8String];
      uint64_t bs_service = xpc_endpoint_create_bs_service();
    }
    v15 = (void *)bs_service;
    if (bs_service)
    {
      v16 = [BSServiceConnectionEndpoint alloc];
      v17 = BSServiceConnectionEndpointTargetDescriptionForServiceLookup(v9, v10);
      id v13 = -[BSServiceConnectionEndpoint _initWithEndpoint:oneshot:isNonLaunching:targetPID:targetDescription:service:instance:](v16, v15, v10, 0, 0, v17, v11, v12);
    }
    else
    {
      id v13 = 0;
    }
  }

  return v13;
}

- (BSServiceConnectionEndpoint)initWithCoder:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![v4 containsValueForKey:@"e"])
  {
LABEL_7:
    uint64_t v5 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v6 = BSServiceInjectionLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      v17 = (objc_class *)objc_opt_class();
      v18 = NSStringFromClass(v17);
      *(_DWORD *)buf = 138412546;
      id v20 = v16;
      __int16 v21 = 2112;
      v22 = v18;
      _os_log_error_impl(&dword_19C754000, v6, OS_LOG_TYPE_ERROR, "An %@ can not be coded by an instance of %@", buf, 0x16u);
    }
    goto LABEL_7;
  }
  uint64_t v5 = [v4 decodeXPCObjectOfType:MEMORY[0x1E4F145A0] forKey:@"e"];
LABEL_8:
  int v7 = [v4 decodeIntForKey:@"p"];
  char v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"o"];
  char v9 = [v4 decodeBoolForKey:@"nl"];
  id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"t"];
  id v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"s"];
  id v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"i"];
  __decodedEndpoint(self, v5, v8, v9, v7 & ~(v7 >> 31), v10, v11, v12, @"NSSecureCoding");
  id v13 = (BSServiceConnectionEndpoint *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)endpointForMachName:(id)a3 service:(id)a4 instance:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = 0;
  if (v7 && v8)
  {
    id v11 = v7;
    [v11 UTF8String];
    bs_named = (void *)xpc_endpoint_create_bs_named();
    if (bs_named)
    {
      id v13 = [BSServiceConnectionEndpoint alloc];
      id v14 = __escaped(v11);
      id v10 = -[BSServiceConnectionEndpoint _initWithEndpoint:oneshot:isNonLaunching:targetPID:targetDescription:service:instance:](v13, bs_named, 0, 0, 0, v14, v8, v9);
    }
    else
    {
      id v10 = 0;
    }
  }

  return v10;
}

- (id)_initWithEndpoint:(void *)a3 oneshot:(char)a4 isNonLaunching:(int)a5 targetPID:(void *)a6 targetDescription:(void *)a7 service:(void *)a8 instance:
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v56 = a2;
  id v16 = a3;
  id v59 = a6;
  id v58 = a7;
  id v57 = a8;
  if (a1)
  {
    id v17 = v16;
    if (v17)
    {
      NSClassFromString(&cfstr_Nsuuid.isa);
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v44 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSUUIDClass]"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel__initWithEndpoint_oneshot_isNonLaunching_targetPID_targetDescription_service_instance_);
          id v45 = (id)objc_claimAutoreleasedReturnValue();
          id v46 = (objc_class *)objc_opt_class();
          v47 = NSStringFromClass(v46);
          *(_DWORD *)buf = 138544642;
          id v62 = v45;
          __int16 v63 = 2114;
          v64 = v47;
          __int16 v65 = 2048;
          int v66 = a1;
          __int16 v67 = 2114;
          v68 = @"BSServiceConnectionEndpoint.m";
          __int16 v69 = 1024;
          int v70 = 114;
          __int16 v71 = 2114;
          v72 = v44;
          _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
        }
        [v44 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19C775124);
      }
    }

    id v18 = v59;
    if (v18)
    {
      NSClassFromString(&cfstr_Nsstring.isa);
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v48 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel__initWithEndpoint_oneshot_isNonLaunching_targetPID_targetDescription_service_instance_);
          id v49 = (id)objc_claimAutoreleasedReturnValue();
          id v50 = (objc_class *)objc_opt_class();
          v51 = NSStringFromClass(v50);
          *(_DWORD *)buf = 138544642;
          id v62 = v49;
          __int16 v63 = 2114;
          v64 = v51;
          __int16 v65 = 2048;
          int v66 = a1;
          __int16 v67 = 2114;
          v68 = @"BSServiceConnectionEndpoint.m";
          __int16 v69 = 1024;
          int v70 = 115;
          __int16 v71 = 2114;
          v72 = v48;
          _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
        }
        [v48 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19C775224);
      }
    }

    id v19 = v58;
    NSClassFromString(&cfstr_Nsstring.isa);
    if (!v19)
    {
      v32 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__initWithEndpoint_oneshot_isNonLaunching_targetPID_targetDescription_service_instance_);
        id v33 = (id)objc_claimAutoreleasedReturnValue();
        v34 = (objc_class *)objc_opt_class();
        v35 = NSStringFromClass(v34);
        *(_DWORD *)buf = 138544642;
        id v62 = v33;
        __int16 v63 = 2114;
        v64 = v35;
        __int16 v65 = 2048;
        int v66 = a1;
        __int16 v67 = 2114;
        v68 = @"BSServiceConnectionEndpoint.m";
        __int16 v69 = 1024;
        int v70 = 116;
        __int16 v71 = 2114;
        v72 = v32;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v32 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C774E2CLL);
    }
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v36 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__initWithEndpoint_oneshot_isNonLaunching_targetPID_targetDescription_service_instance_);
        id v37 = (id)objc_claimAutoreleasedReturnValue();
        v38 = (objc_class *)objc_opt_class();
        v39 = NSStringFromClass(v38);
        *(_DWORD *)buf = 138544642;
        id v62 = v37;
        __int16 v63 = 2114;
        v64 = v39;
        __int16 v65 = 2048;
        int v66 = a1;
        __int16 v67 = 2114;
        v68 = @"BSServiceConnectionEndpoint.m";
        __int16 v69 = 1024;
        int v70 = 116;
        __int16 v71 = 2114;
        v72 = v36;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v36 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C774F2CLL);
    }

    id v20 = v57;
    if (v20)
    {
      NSClassFromString(&cfstr_Nsstring.isa);
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v52 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel__initWithEndpoint_oneshot_isNonLaunching_targetPID_targetDescription_service_instance_);
          id v53 = (id)objc_claimAutoreleasedReturnValue();
          id v54 = (objc_class *)objc_opt_class();
          id v55 = NSStringFromClass(v54);
          *(_DWORD *)buf = 138544642;
          id v62 = v53;
          __int16 v63 = 2114;
          v64 = v55;
          __int16 v65 = 2048;
          int v66 = a1;
          __int16 v67 = 2114;
          v68 = @"BSServiceConnectionEndpoint.m";
          __int16 v69 = 1024;
          int v70 = 117;
          __int16 v71 = 2114;
          v72 = v52;
          _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
        }
        [v52 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19C775324);
      }
    }

    if (!v56 && v18)
    {
      v40 = [NSString stringWithFormat:@"if we don't have an endpoint then we can only be the null endpoint which shouldn't have a description %@", v18];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__initWithEndpoint_oneshot_isNonLaunching_targetPID_targetDescription_service_instance_);
        id v41 = (id)objc_claimAutoreleasedReturnValue();
        v42 = (objc_class *)objc_opt_class();
        v43 = NSStringFromClass(v42);
        *(_DWORD *)buf = 138544642;
        id v62 = v41;
        __int16 v63 = 2114;
        v64 = v43;
        __int16 v65 = 2048;
        int v66 = a1;
        __int16 v67 = 2114;
        v68 = @"BSServiceConnectionEndpoint.m";
        __int16 v69 = 1024;
        int v70 = 118;
        __int16 v71 = 2114;
        v72 = v40;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v40 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C775024);
    }
    v60.receiver = a1;
    v60.super_class = (Class)BSServiceConnectionEndpoint;
    __int16 v21 = (id *)objc_msgSendSuper2(&v60, sel_init);
    v22 = v21;
    if (v21)
    {
      objc_storeStrong(v21 + 5, a2);
      uint64_t v23 = [v17 copy];
      id v24 = v22[6];
      v22[6] = (id)v23;

      *((unsigned char *)v22 + 20) = a4;
      *((_DWORD *)v22 + 4) = a5;
      uint64_t v25 = [v18 copy];
      id v26 = v22[1];
      v22[1] = (id)v25;

      uint64_t v27 = [v19 copy];
      id v28 = v22[3];
      v22[3] = (id)v27;

      uint64_t v29 = [v20 copy];
      id v30 = v22[4];
      v22[4] = (id)v29;
    }
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeXPCObject:self->_endpoint forKey:@"e"];
  [v5 encodeObject:self->_oneshot forKey:@"o"];
  if (self->_nonLaunching) {
    [v5 encodeBool:1 forKey:@"nl"];
  }
  uint64_t targetPID = self->_targetPID;
  if (targetPID) {
    [v5 encodeInt64:targetPID forKey:@"p"];
  }
  [v5 encodeObject:self->_targetDescription forKey:@"t"];
  [v5 encodeObject:self->_service forKey:@"s"];
  [v5 encodeObject:self->_instance forKey:@"i"];
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  if (self->_endpoint)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v10 encodeXPCObject:self->_endpoint forKey:@"e"];
    }
    else
    {
      id v4 = (void *)MEMORY[0x1E4F1CA00];
      id v5 = (objc_class *)objc_opt_class();
      char v6 = NSStringFromClass(v5);
      id v7 = (objc_class *)objc_opt_class();
      id v8 = NSStringFromClass(v7);
      [v4 raise:*MEMORY[0x1E4F1C3C8], @"An %@ can not be coded by an instance of %@", v6, v8 format];
    }
  }
  [v10 encodeObject:self->_oneshot forKey:@"o"];
  if (self->_nonLaunching) {
    [v10 encodeBool:1 forKey:@"nl"];
  }
  uint64_t targetPID = self->_targetPID;
  if (targetPID) {
    [v10 encodeInt:targetPID forKey:@"p"];
  }
  [v10 encodeObject:self->_targetDescription forKey:@"t"];
  [v10 encodeObject:self->_service forKey:@"s"];
  [v10 encodeObject:self->_instance forKey:@"i"];
}

- (BSServiceConnectionEndpoint)init
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = [NSString stringWithFormat:@"-init is not allowed on BSServiceConnectionEndpoint"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    char v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    id v10 = v5;
    __int16 v11 = 2114;
    id v12 = v7;
    __int16 v13 = 2048;
    id v14 = self;
    __int16 v15 = 2114;
    id v16 = @"BSServiceConnectionEndpoint.m";
    __int16 v17 = 1024;
    int v18 = 109;
    __int16 v19 = 2114;
    id v20 = v4;
    _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (BSServiceConnectionEndpoint *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)_initForNullEndpointWithService:(void *)a3 instance:
{
  id v5 = a2;
  id v6 = a3;
  if (a1) {
    a1 = -[BSServiceConnectionEndpoint _initWithEndpoint:oneshot:isNonLaunching:targetPID:targetDescription:service:instance:](a1, 0, 0, 0, 0, 0, v5, v6);
  }

  return a1;
}

+ (id)endpointForSystemMachName:(id)a3 service:(id)a4 instance:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = 0;
  if (v7 && v8)
  {
    id v11 = v7;
    [v11 UTF8String];
    bs_named = (void *)xpc_endpoint_create_bs_named();
    if (bs_named)
    {
      __int16 v13 = [BSServiceConnectionEndpoint alloc];
      id v14 = __escaped(v11);
      id v10 = -[BSServiceConnectionEndpoint _initWithEndpoint:oneshot:isNonLaunching:targetPID:targetDescription:service:instance:](v13, bs_named, 0, 0, 0, v14, v8, v9);
    }
    else
    {
      id v10 = 0;
    }
  }

  return v10;
}

- (int64_t)compare:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  NSClassFromString(&cfstr_Bsserviceconne_8.isa);
  if (!v5)
  {
    __int16 v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      id v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      id v26 = v18;
      __int16 v27 = 2114;
      id v28 = v20;
      __int16 v29 = 2048;
      *(void *)id v30 = self;
      *(_WORD *)&v30[8] = 2114;
      *(void *)&v30[10] = @"BSServiceConnectionEndpoint.m";
      __int16 v31 = 1024;
      int v32 = 195;
      __int16 v33 = 2114;
      v34 = v17;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v17 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C79AE30);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v21 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:BSServiceConnectionEndpointClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v22 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      id v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      id v26 = v22;
      __int16 v27 = 2114;
      id v28 = v24;
      __int16 v29 = 2048;
      *(void *)id v30 = self;
      *(_WORD *)&v30[8] = 2114;
      *(void *)&v30[10] = @"BSServiceConnectionEndpoint.m";
      __int16 v31 = 1024;
      int v32 = 195;
      __int16 v33 = 2114;
      v34 = v21;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v21 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C79AF30);
  }

  NSComparisonResult v6 = [(NSString *)self->_service compare:v5[3]];
  if (v6 == NSOrderedSame)
  {
    if ((BSEqualStrings() & 1) == 0)
    {
      instance = self->_instance;
      if (!instance) {
        goto LABEL_17;
      }
      if (!v5[4]) {
        goto LABEL_26;
      }
      NSComparisonResult v6 = -[NSString compare:](instance, "compare:");
      if (v6) {
        goto LABEL_4;
      }
    }
    endpoint = self->_endpoint;
    id v9 = (void *)v5[5];
    if (endpoint)
    {
      if (!v9) {
        goto LABEL_26;
      }
      id v10 = endpoint;
      id v11 = v9;
      uint64_t v12 = xpc_endpoint_compare();
      if (v12 == -1)
      {
        NSComparisonResult v6 = NSOrderedAscending;
LABEL_19:

        goto LABEL_4;
      }
      if (v12)
      {
        if (v12 != 1)
        {
          __int16 v15 = [NSString stringWithFormat:@"invalid xpc_endpoint_compare result : %i l=%@ r=%@", v12, v10, v11];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            id v16 = objc_msgSend(NSString, "stringWithUTF8String:", "NSComparisonResult __endpointCompare(__strong xpc_endpoint_t, __strong xpc_endpoint_t)");
            *(_DWORD *)buf = 138544130;
            id v26 = v16;
            __int16 v27 = 2114;
            id v28 = @"BSServiceConnectionEndpoint.m";
            __int16 v29 = 1024;
            *(_DWORD *)id v30 = 52;
            *(_WORD *)&v30[4] = 2114;
            *(void *)&v30[6] = v15;
            _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
          }
          [v15 UTF8String];
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x19C79AD30);
        }
        NSComparisonResult v6 = NSOrderedDescending;
        goto LABEL_19;
      }
    }
    else if (v9)
    {
      goto LABEL_17;
    }
    if (BSEqualObjects())
    {
      NSComparisonResult v6 = NSOrderedSame;
      goto LABEL_4;
    }
    oneshot = self->_oneshot;
    if (oneshot)
    {
      if (v5[6])
      {
        NSComparisonResult v6 = -[NSUUID compare:](oneshot, "compare:");
        goto LABEL_4;
      }
LABEL_26:
      NSComparisonResult v6 = NSOrderedDescending;
      goto LABEL_4;
    }
LABEL_17:
    NSComparisonResult v6 = NSOrderedAscending;
  }
LABEL_4:

  return v6;
}

+ (id)nullEndpointForService:(id)a3 instance:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = -[BSServiceConnectionEndpoint _initForNullEndpointWithService:instance:]((id *)[BSServiceConnectionEndpoint alloc], v5, v6);

  return v7;
}

- (void)saveAsInjectorEndowmentForKey:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2050000000;
  id v5 = (void *)_MergedGlobals_10;
  uint64_t v16 = _MergedGlobals_10;
  if (!_MergedGlobals_10)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getRBSServiceClass_block_invoke;
    id v18 = &unk_1E58FBE80;
    __int16 v19 = &v13;
    __getRBSServiceClass_block_invoke((uint64_t)buf);
    id v5 = (void *)v14[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v13, 8);
  id v7 = -[BSServiceConnectionEndpoint _endowmentRepresentation](self);
  id v12 = 0;
  char v8 = [v6 saveEndowment:v7 forKey:v4 withError:&v12];
  id v9 = v12;

  if (v9) {
    char v10 = 0;
  }
  else {
    char v10 = v8;
  }
  if ((v10 & 1) == 0)
  {
    id v11 = BSServiceInjectionLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v4;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = self;
      *(_WORD *)&buf[22] = 2112;
      id v18 = v9;
      _os_log_error_impl(&dword_19C754000, v11, OS_LOG_TYPE_ERROR, "BSServiceConnectionEndpoint: error saving as injector endowment for '%@' : endpoint=%@, error=%@", buf, 0x20u);
    }
  }
}

- (void)_endowmentRepresentation
{
  v1 = a1;
  if (a1)
  {
    v2 = [MEMORY[0x1E4F1CA60] dictionary];
    v3 = (void *)v1[5];
    if (v3)
    {
      id v4 = v3;
      id v5 = objc_alloc_init(MEMORY[0x1E4F292A0]);
      [v5 _setEndpoint:v4];

      [v2 setObject:v5 forKey:@"e"];
    }
    uint64_t v6 = v1[6];
    if (v6) {
      [v2 setObject:v6 forKey:@"o"];
    }
    if (*((unsigned char *)v1 + 20)) {
      [v2 setObject:MEMORY[0x1E4F1CC38] forKey:@"nl"];
    }
    if (*((_DWORD *)v1 + 4))
    {
      id v7 = objc_msgSend(NSNumber, "numberWithInt:");
      [v2 setObject:v7 forKey:@"p"];
    }
    uint64_t v8 = v1[1];
    if (v8) {
      [v2 setObject:v8 forKey:@"t"];
    }
    [v2 setObject:v1[3] forKey:@"s"];
    uint64_t v9 = v1[4];
    if (v9) {
      [v2 setObject:v9 forKey:@"i"];
    }
    v1 = (void *)[v2 copy];
  }

  return v1;
}

void __104__BSServiceConnectionEndpoint_endpointOfLaunchIdentifier_fromLaunchResponse_withService_instance_error___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setFailureReason:@"invalid xpcEndpoint for %@ with launch identifier '%@' from %@", *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48)];
  v3 = [*(id *)(a1 + 56) error];
  [v4 setUnderlyingError:v3];
}

void __104__BSServiceConnectionEndpoint_endpointOfLaunchIdentifier_fromLaunchResponse_withService_instance_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setFailureReason:@"could not find launch identifier '%@' in returned endpoints of %@ : %@", *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48)];
  v3 = [*(id *)(a1 + 56) error];
  [v4 setUnderlyingError:v3];
}

void __104__BSServiceConnectionEndpoint_endpointOfLaunchIdentifier_fromLaunchResponse_withService_instance_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setFailureReason:@"launch response did not return a process"];
  v3 = [*(id *)(a1 + 32) error];
  [v4 setUnderlyingError:v3];
}

+ (id)_endpointForManager:(void *)a3 domain:(void *)a4 service:(void *)a5 instance:
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v65 = a3;
  id v64 = a4;
  id v9 = a5;
  uint64_t v10 = self;
  id v11 = v8;
  NSClassFromString(&cfstr_Bsservicemanag.isa);
  if (!v11)
  {
    uint64_t v25 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__endpointForManager_domain_service_instance_);
      id v26 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v27 = (objc_class *)objc_opt_class();
      id v28 = NSStringFromClass(v27);
      *(_DWORD *)buf = 138544642;
      id v67 = v26;
      __int16 v68 = 2114;
      __int16 v69 = v28;
      __int16 v70 = 2048;
      uint64_t v71 = v10;
      __int16 v72 = 2114;
      uint64_t v73 = @"BSServiceConnectionEndpoint.m";
      __int16 v74 = 1024;
      int v75 = 352;
      __int16 v76 = 2114;
      v77 = v25;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v25 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C79B8F8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __int16 v29 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:BSServiceManagerClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__endpointForManager_domain_service_instance_);
      id v30 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v31 = (objc_class *)objc_opt_class();
      int v32 = NSStringFromClass(v31);
      *(_DWORD *)buf = 138544642;
      id v67 = v30;
      __int16 v68 = 2114;
      __int16 v69 = v32;
      __int16 v70 = 2048;
      uint64_t v71 = v10;
      __int16 v72 = 2114;
      uint64_t v73 = @"BSServiceConnectionEndpoint.m";
      __int16 v74 = 1024;
      int v75 = 352;
      __int16 v76 = 2114;
      v77 = v29;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v29 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C79B9F8);
  }

  id v12 = v65;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v12)
  {
    __int16 v33 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__endpointForManager_domain_service_instance_);
      id v34 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v35 = (objc_class *)objc_opt_class();
      v36 = NSStringFromClass(v35);
      *(_DWORD *)buf = 138544642;
      id v67 = v34;
      __int16 v68 = 2114;
      __int16 v69 = v36;
      __int16 v70 = 2048;
      uint64_t v71 = v10;
      __int16 v72 = 2114;
      uint64_t v73 = @"BSServiceConnectionEndpoint.m";
      __int16 v74 = 1024;
      int v75 = 353;
      __int16 v76 = 2114;
      v77 = v33;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v33 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C79BAF8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v37 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__endpointForManager_domain_service_instance_);
      id v38 = (id)objc_claimAutoreleasedReturnValue();
      v39 = (objc_class *)objc_opt_class();
      v40 = NSStringFromClass(v39);
      *(_DWORD *)buf = 138544642;
      id v67 = v38;
      __int16 v68 = 2114;
      __int16 v69 = v40;
      __int16 v70 = 2048;
      uint64_t v71 = v10;
      __int16 v72 = 2114;
      uint64_t v73 = @"BSServiceConnectionEndpoint.m";
      __int16 v74 = 1024;
      int v75 = 353;
      __int16 v76 = 2114;
      v77 = v37;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v37 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C79BBF8);
  }

  id v13 = v64;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v13)
  {
    id v41 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__endpointForManager_domain_service_instance_);
      id v42 = (id)objc_claimAutoreleasedReturnValue();
      v43 = (objc_class *)objc_opt_class();
      id v44 = NSStringFromClass(v43);
      *(_DWORD *)buf = 138544642;
      id v67 = v42;
      __int16 v68 = 2114;
      __int16 v69 = v44;
      __int16 v70 = 2048;
      uint64_t v71 = v10;
      __int16 v72 = 2114;
      uint64_t v73 = @"BSServiceConnectionEndpoint.m";
      __int16 v74 = 1024;
      int v75 = 354;
      __int16 v76 = 2114;
      v77 = v41;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v41 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C79BCF8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v45 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__endpointForManager_domain_service_instance_);
      id v46 = (id)objc_claimAutoreleasedReturnValue();
      v47 = (objc_class *)objc_opt_class();
      id v48 = NSStringFromClass(v47);
      *(_DWORD *)buf = 138544642;
      id v67 = v46;
      __int16 v68 = 2114;
      __int16 v69 = v48;
      __int16 v70 = 2048;
      uint64_t v71 = v10;
      __int16 v72 = 2114;
      uint64_t v73 = @"BSServiceConnectionEndpoint.m";
      __int16 v74 = 1024;
      int v75 = 354;
      __int16 v76 = 2114;
      v77 = v45;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v45 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C79BDF8);
  }

  id v14 = v9;
  if (v14)
  {
    NSClassFromString(&cfstr_Nsstring.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v57 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__endpointForManager_domain_service_instance_);
        id v58 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v59 = v10;
        objc_super v60 = (objc_class *)objc_opt_class();
        v61 = NSStringFromClass(v60);
        *(_DWORD *)buf = 138544642;
        id v67 = v58;
        __int16 v68 = 2114;
        __int16 v69 = v61;
        __int16 v70 = 2048;
        uint64_t v71 = v59;
        __int16 v72 = 2114;
        uint64_t v73 = @"BSServiceConnectionEndpoint.m";
        __int16 v74 = 1024;
        int v75 = 355;
        __int16 v76 = 2114;
        v77 = v57;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v57 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C79C0F4);
    }
  }

  -[BSServiceManager domainWithIdentifier:]((uint64_t)v11, v12);
  uint64_t v15 = (os_unfair_lock_s **)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = v15;
  if (!v15)
  {
    id v49 = [NSString stringWithFormat:@"failed to find domain %@", v12];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__endpointForManager_domain_service_instance_);
      id v50 = (id)objc_claimAutoreleasedReturnValue();
      v51 = (objc_class *)objc_opt_class();
      id v52 = NSStringFromClass(v51);
      *(_DWORD *)buf = 138544642;
      id v67 = v50;
      __int16 v68 = 2114;
      __int16 v69 = v52;
      __int16 v70 = 2048;
      uint64_t v71 = v10;
      __int16 v72 = 2114;
      uint64_t v73 = @"BSServiceConnectionEndpoint.m";
      __int16 v74 = 1024;
      int v75 = 359;
      __int16 v76 = 2114;
      v77 = v49;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v49 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C79BEF0);
  }
  __int16 v17 = -[BSServiceDomain listenerEndpoint](v15);
  __int16 v63 = -[BSServiceDomain listenerEndpointOneshot](v16);
  uint64_t v62 = v10;
  char v18 = -[BSXPCServiceConnectionListener isNonLaunching](v16[3]);
  __int16 v19 = v16[1];
  uint64_t v20 = [(os_unfair_lock_s *)v19 machName];
  if (v20) {
    pid_t v21 = 0;
  }
  else {
    pid_t v21 = getpid();
  }

  id v22 = v16[4];
  if (!v17)
  {
    id v53 = [NSString stringWithFormat:@"failed to get an endpoint for the service listener %@", v22];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__endpointForManager_domain_service_instance_);
      id v54 = (id)objc_claimAutoreleasedReturnValue();
      id v55 = (objc_class *)objc_opt_class();
      id v56 = NSStringFromClass(v55);
      *(_DWORD *)buf = 138544642;
      id v67 = v54;
      __int16 v68 = 2114;
      __int16 v69 = v56;
      __int16 v70 = 2048;
      uint64_t v71 = v62;
      __int16 v72 = 2114;
      uint64_t v73 = @"BSServiceConnectionEndpoint.m";
      __int16 v74 = 1024;
      int v75 = 367;
      __int16 v76 = 2114;
      v77 = v53;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v53 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C79BFF0);
  }
  uint64_t v23 = -[BSServiceConnectionEndpoint _initWithEndpoint:oneshot:isNonLaunching:targetPID:targetDescription:service:instance:]([BSServiceConnectionEndpoint alloc], v17, v63, v18, v21, v22, v13, v14);

  return v23;
}

+ (id)_endpointFromEndowmentRepresentation:(uint64_t)a1
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  self;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = [v2 objectForKey:@"p"];
    uint64_t v4 = objc_opt_class();
    id v5 = v3;
    if (v4)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v6 = v5;
      }
      else {
        uint64_t v6 = 0;
      }
    }
    else
    {
      uint64_t v6 = 0;
    }
    id v9 = v6;

    int v10 = [v9 intValue];
    id v11 = [v2 objectForKey:@"e"];
    uint64_t v12 = objc_opt_class();
    id v13 = v11;
    if (v12)
    {
      if (objc_opt_isKindOfClass()) {
        id v14 = v13;
      }
      else {
        id v14 = 0;
      }
    }
    else
    {
      id v14 = 0;
    }
    id v15 = v14;

    id v45 = v15;
    id v44 = [v15 _endpoint];
    uint64_t v16 = [v2 objectForKey:@"o"];
    uint64_t v17 = objc_opt_class();
    id v18 = v16;
    if (v17)
    {
      if (objc_opt_isKindOfClass()) {
        __int16 v19 = v18;
      }
      else {
        __int16 v19 = 0;
      }
    }
    else
    {
      __int16 v19 = 0;
    }
    id v20 = v19;

    pid_t v21 = [v2 objectForKey:@"nl"];
    uint64_t v22 = objc_opt_class();
    id v23 = v21;
    if (v22)
    {
      int v24 = v10;
      if (objc_opt_isKindOfClass()) {
        uint64_t v25 = v23;
      }
      else {
        uint64_t v25 = 0;
      }
    }
    else
    {
      int v24 = v10;
      uint64_t v25 = 0;
    }
    id v26 = v25;

    char v27 = [v26 BOOLValue];
    id v28 = [v2 objectForKey:@"t"];
    uint64_t v29 = objc_opt_class();
    id v30 = v28;
    if (v29)
    {
      if (objc_opt_isKindOfClass()) {
        __int16 v31 = v30;
      }
      else {
        __int16 v31 = 0;
      }
    }
    else
    {
      __int16 v31 = 0;
    }
    id v32 = v31;

    __int16 v33 = [v2 objectForKey:@"s"];
    uint64_t v34 = objc_opt_class();
    id v35 = v33;
    if (v34)
    {
      if (objc_opt_isKindOfClass()) {
        v36 = v35;
      }
      else {
        v36 = 0;
      }
    }
    else
    {
      v36 = 0;
    }
    id v37 = v36;

    id v38 = [v2 objectForKey:@"i"];
    uint64_t v39 = objc_opt_class();
    id v40 = v38;
    if (v39)
    {
      if (objc_opt_isKindOfClass()) {
        id v41 = v40;
      }
      else {
        id v41 = 0;
      }
    }
    else
    {
      id v41 = 0;
    }
    id v42 = v41;

    id v8 = __decodedEndpoint(0, v44, v20, v27, v24 & ~(v24 >> 31), v32, v37, v42, @"endowment");
  }
  else
  {
    id v7 = BSServiceInjectionLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v47 = v2;
      _os_log_error_impl(&dword_19C754000, v7, OS_LOG_TYPE_ERROR, "BSServiceConnectionEndpoint: Unable to decode endowment : %@", buf, 0xCu);
    }

    id v8 = 0;
  }

  return v8;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_endpoint) {
    xpc_dictionary_set_value(v4, (const char *)[@"e" UTF8String], self->_endpoint);
  }
  oneshot = self->_oneshot;
  if (oneshot)
  {
    *(void *)uuid = 0;
    uint64_t v7 = 0;
    [(NSUUID *)oneshot getUUIDBytes:uuid];
    xpc_dictionary_set_uuid(v4, (const char *)[@"o" UTF8String], uuid);
  }
  if (self->_nonLaunching) {
    xpc_dictionary_set_BOOL(v4, (const char *)[@"nl" UTF8String], 1);
  }
  if (self->_targetPID) {
    xpc_dictionary_set_int64(v4, (const char *)[@"p" UTF8String], self->_targetPID);
  }
  [@"t" UTF8String];
  BSSerializeStringToXPCDictionaryWithKey();
  [@"s" UTF8String];
  BSSerializeStringToXPCDictionaryWithKey();
  [@"i" UTF8String];
  BSSerializeStringToXPCDictionaryWithKey();
}

- (BSServiceConnectionEndpoint)initWithXPCDictionary:(id)a3
{
  id v3 = a3;
  id v4 = xpc_dictionary_get_value(v3, (const char *)[@"e" UTF8String]);
  id v5 = xpc_dictionary_get_value(v3, (const char *)[@"o" UTF8String]);
  int64_t int64 = xpc_dictionary_get_int64(v3, (const char *)[@"p" UTF8String]);
  if (v4)
  {
    if (MEMORY[0x19F399FF0](v4) == MEMORY[0x1E4F145A0]) {
      uint64_t v7 = v4;
    }
    else {
      uint64_t v7 = 0;
    }
    if (!v5) {
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v7 = 0;
    if (!v5)
    {
LABEL_9:
      int v16 = 0;
      uint64_t v8 = 0;
      goto LABEL_11;
    }
  }
  if (MEMORY[0x19F399FF0](v5) != MEMORY[0x1E4F14600]) {
    goto LABEL_9;
  }
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:xpc_uuid_get_bytes(v5)];
  int v16 = 1;
LABEL_11:
  char v9 = xpc_dictionary_get_BOOL(v3, (const char *)[@"nl" UTF8String]);
  if ((unint64_t)(int64 - 0x80000000) >= 0xFFFFFFFF80000001) {
    int v10 = int64;
  }
  else {
    int v10 = 0;
  }
  [@"t" UTF8String];
  id v11 = (void *)BSCreateDeserializedStringFromXPCDictionaryWithKey();
  [@"s" UTF8String];
  uint64_t v12 = (void *)BSCreateDeserializedStringFromXPCDictionaryWithKey();
  [@"i" UTF8String];
  id v13 = (void *)BSCreateDeserializedStringFromXPCDictionaryWithKey();
  __decodedEndpoint(self, v7, v8, v9, v10, v11, v12, v13, @"BSXPCCoding");
  id v14 = (BSServiceConnectionEndpoint *)objc_claimAutoreleasedReturnValue();

  if (v16) {
  return v14;
  }
}

- (NSString)description
{
  id v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  if (self->_nonLaunching)
  {
    id v4 = [NSString stringWithFormat:@"NL:%@", self->_targetDescription];
  }
  else
  {
    id v4 = self->_targetDescription;
  }
  id v5 = v4;
  if (self->_endpoint)
  {
    [v3 appendString:v4 withName:@"target" skipIfEmpty:0];
  }
  else
  {
    uint64_t v6 = [NSString stringWithFormat:@"(%@)", v4];
    [v3 appendString:v6 withName:@"target" skipIfEmpty:0];
  }
  [v3 appendString:self->_service withName:@"service" skipIfEmpty:0];
  [v3 appendString:self->_instance withName:@"instance" skipIfEmpty:1];
  uint64_t v7 = [v3 build];

  return (NSString *)v7;
}

@end