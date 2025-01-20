@interface FBSSceneIdentityToken
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (FBSSceneIdentityToken)tokenWithHostEndpoint:(id)a3 workspace:(id)a4 identifier:(id)a5;
+ (FBSSceneIdentityToken)tokenWithHostPID:(int)a3 directEndpointTarget:(id)a4 workspace:(id)a5 identifier:(id)a6;
+ (FBSSceneIdentityToken)tokenWithHostPID:(int)a3 viewServiceSessionIdentifier:(id)a4;
+ (id)pseudoTokenWithIdentifier:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BSServiceConnectionEndpoint)hostEndpoint;
- (FBSSceneIdentityToken)init;
- (FBSSceneIdentityToken)initWithBSXPCCoder:(id)a3;
- (FBSSceneIdentityToken)initWithCoder:(id)a3;
- (FBSSceneIdentityToken)initWithXPCDictionary:(id)a3;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)identifier;
- (NSString)stringRepresentation;
- (id)_initWithHost:(void *)a3 endpoint:(void *)a4 target:(void *)a5 workspace:(void *)a6 identifier:;
- (unint64_t)hash;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation FBSSceneIdentityToken

- (NSString)stringRepresentation
{
  return self->_stringRepresentation;
}

- (NSString)description
{
  return self->_stringRepresentation;
}

- (FBSSceneIdentityToken)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)[v4 decodeInt64ForKey:@"h"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"e"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"t"];
  v8 = [v4 decodeStringForKey:@"w"];
  v9 = [v4 decodeStringForKey:@"i"];

  v10 = (FBSSceneIdentityToken *)-[FBSSceneIdentityToken _initWithHost:endpoint:target:workspace:identifier:](self, v5, v6, v7, v8, v9);
  return v10;
}

- (FBSSceneIdentityToken)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)[v4 decodeInt64ForKey:@"h"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"e"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"t"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"w"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"i"];

  v10 = (FBSSceneIdentityToken *)-[FBSSceneIdentityToken _initWithHost:endpoint:target:workspace:identifier:](self, v5, v6, v7, v8, v9);
  return v10;
}

- (unint64_t)hash
{
  return [(NSString *)self->_stringRepresentation hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (FBSSceneIdentityToken *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_6;
  }
  if (self == v4)
  {
    BOOL v7 = 1;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = v5;
    if (self->_host == v6->_host) {
      BSEqualObjects();
    }
    BOOL v7 = 0;
  }
  else
  {
LABEL_6:
    BOOL v7 = 0;
  }
LABEL_9:

  return v7;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

+ (FBSSceneIdentityToken)tokenWithHostEndpoint:(id)a3 workspace:(id)a4 identifier:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v7;
  NSClassFromString(&cfstr_Bsserviceconne.isa);
  if (!v10)
  {
    v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[FBSSceneIdentityToken tokenWithHostEndpoint:workspace:identifier:]();
    }
    [v18 UTF8String];
    _bs_set_crash_log_message();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v19 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:BSServiceConnectionEndpointClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[FBSSceneIdentityToken tokenWithHostEndpoint:workspace:identifier:]();
    }
    [v19 UTF8String];
    _bs_set_crash_log_message();
  }

  v11 = +[FBSWorkspaceServiceSpecification identifier];
  v12 = [v10 service];
  char v13 = [v11 isEqualToString:v12];

  if ((v13 & 1) == 0)
  {
    v20 = [NSString stringWithFormat:@"endpoint specified the wrong service : %@", v10];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[FBSSceneIdentityToken tokenWithHostEndpoint:workspace:identifier:].cold.6();
    }
    [v20 UTF8String];
    _bs_set_crash_log_message();
  }
  id v14 = v8;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v14)
  {
    v21 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[FBSSceneIdentityToken tokenWithHostEndpoint:workspace:identifier:]();
    }
    [v21 UTF8String];
    _bs_set_crash_log_message();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v22 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[FBSSceneIdentityToken tokenWithHostEndpoint:workspace:identifier:]();
    }
    [v22 UTF8String];
    _bs_set_crash_log_message();
  }

  id v15 = v9;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v15)
  {
    v23 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[FBSSceneIdentityToken tokenWithHostEndpoint:workspace:identifier:]();
    }
    [v23 UTF8String];
    _bs_set_crash_log_message();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v24 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[FBSSceneIdentityToken tokenWithHostEndpoint:workspace:identifier:]();
    }
    [v24 UTF8String];
    _bs_set_crash_log_message();
  }

  id v16 = -[FBSSceneIdentityToken _initWithHost:endpoint:target:workspace:identifier:]([FBSSceneIdentityToken alloc], 0, v10, 0, v14, v15);

  return (FBSSceneIdentityToken *)v16;
}

- (id)_initWithHost:(void *)a3 endpoint:(void *)a4 target:(void *)a5 workspace:(void *)a6 identifier:
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!a1)
  {
    id v64 = 0;
    goto LABEL_45;
  }
  if ((int)a2 < 1)
  {
    if (a2)
    {
      v71 = [MEMORY[0x1E4F28B00] currentHandler];
      [v71 handleFailureInMethod:sel__initWithHost_endpoint_target_workspace_identifier_ object:a1 file:@"FBSSceneIdentityToken.m" lineNumber:79 description:@"invalid host pid=%i" , a2];

      if (!v11) {
        goto LABEL_52;
      }
    }
    else if (!v11)
    {
      goto LABEL_52;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
LABEL_19:
      v30 = +[FBSWorkspaceServiceSpecification identifier];
      v31 = [v11 service];
      char v32 = [v30 isEqualToString:v31];

      if ((v32 & 1) == 0)
      {
        v73 = [MEMORY[0x1E4F28B00] currentHandler];
        [v73 handleFailureInMethod:sel__initWithHost_endpoint_target_workspace_identifier_, a1, @"FBSSceneIdentityToken.m", 81, @"endpoint specified the wrong service : %@", v11 object file lineNumber description];
      }
      int v80 = (int)a2;
      if (v12)
      {
        v74 = [MEMORY[0x1E4F28B00] currentHandler];
        [v74 handleFailureInMethod:sel__initWithHost_endpoint_target_workspace_identifier_, a1, @"FBSSceneIdentityToken.m", 82, @"invalid target : %@", v12 object file lineNumber description];
      }
      if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        v67 = [MEMORY[0x1E4F28B00] currentHandler];
        [v67 handleFailureInMethod:sel__initWithHost_endpoint_target_workspace_identifier_, a1, @"FBSSceneIdentityToken.m", 83, @"invalid workspace : %@", v13 object file lineNumber description];
      }
      if (!v14 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        v68 = [MEMORY[0x1E4F28B00] currentHandler];
        [v68 handleFailureInMethod:sel__initWithHost_endpoint_target_workspace_identifier_, a1, @"FBSSceneIdentityToken.m", 84, @"invalid identifier='%@'", v14 object file lineNumber description];
      }
      v78 = NSString;
      id v22 = [v11 targetDescription];
      v33 = (void *)MEMORY[0x1E4F28B88];
      id v34 = v13;
      id v35 = v13;
      id v36 = v11;
      v37 = a1;
      id v38 = v34;
      v39 = [v33 URLHostAllowedCharacterSet];
      v40 = [v38 stringByAddingPercentEncodingWithAllowedCharacters:v39];

      if ([v40 isEqualToString:v38]) {
        v41 = v38;
      }
      else {
        v41 = v40;
      }
      id v42 = v41;

      v43 = (void *)MEMORY[0x1E4F28B88];
      id v44 = v14;
      v45 = [v43 URLHostAllowedCharacterSet];
      v46 = [v44 stringByAddingPercentEncodingWithAllowedCharacters:v45];

      if ([v46 isEqualToString:v44]) {
        v47 = v44;
      }
      else {
        v47 = v46;
      }
      a2 = v47;

      a1 = v37;
      id v11 = v36;
      id v13 = v35;
      v29 = [v78 stringWithFormat:@"%@/%@:%@", v22, v42, a2];

      LODWORD(a2) = v80;
      goto LABEL_42;
    }
LABEL_52:
    v72 = [MEMORY[0x1E4F28B00] currentHandler];
    [v72 handleFailureInMethod:sel__initWithHost_endpoint_target_workspace_identifier_, a1, @"FBSSceneIdentityToken.m", 80, @"invalid endpoint : %@", v11 object file lineNumber description];

    goto LABEL_19;
  }
  if (v12)
  {
    if (v11)
    {
      v69 = [MEMORY[0x1E4F28B00] currentHandler];
      [v69 handleFailureInMethod:sel__initWithHost_endpoint_target_workspace_identifier_, a1, @"FBSSceneIdentityToken.m", 68, @"invalid direct identity endpoint : %@", v11 object file lineNumber description];

      if (v13)
      {
LABEL_6:
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          goto LABEL_7;
        }
      }
    }
    else if (v13)
    {
      goto LABEL_6;
    }
    v70 = [MEMORY[0x1E4F28B00] currentHandler];
    [v70 handleFailureInMethod:sel__initWithHost_endpoint_target_workspace_identifier_, a1, @"FBSSceneIdentityToken.m", 69, @"invalid direct identity workspace : %@", v13 object file lineNumber description];

LABEL_7:
    id v79 = v11;
    if (!v14 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v66 = [MEMORY[0x1E4F28B00] currentHandler];
      [v66 handleFailureInMethod:sel__initWithHost_endpoint_target_workspace_identifier_, a1, @"FBSSceneIdentityToken.m", 70, @"invalid direct identity identifier='%@'", v14 object file lineNumber description];
    }
    id v15 = NSString;
    id v16 = (void *)MEMORY[0x1E4F28B88];
    id v17 = v13;
    v18 = [v16 URLHostAllowedCharacterSet];
    [v17 stringByAddingPercentEncodingWithAllowedCharacters:v18];
    v20 = v19 = a1;

    if ([v20 isEqualToString:v17]) {
      v21 = v17;
    }
    else {
      v21 = v20;
    }
    id v22 = v21;

    v23 = (void *)MEMORY[0x1E4F28B88];
    id v24 = v14;
    v25 = [v23 URLHostAllowedCharacterSet];
    v26 = [v24 stringByAddingPercentEncodingWithAllowedCharacters:v25];

    if ([v26 isEqualToString:v24]) {
      v27 = v24;
    }
    else {
      v27 = v26;
    }
    id v28 = v27;

    a1 = v19;
    v29 = [v15 stringWithFormat:@"%i->%@/%@:%@", a2, v12, v22, v28];

    id v11 = v79;
    goto LABEL_42;
  }
  if (!v11)
  {
    if (!v13) {
      goto LABEL_36;
    }
LABEL_54:
    v76 = [MEMORY[0x1E4F28B00] currentHandler];
    [v76 handleFailureInMethod:sel__initWithHost_endpoint_target_workspace_identifier_, a1, @"FBSSceneIdentityToken.m", 74, @"invalid view-service identity workspace : %@", v13 object file lineNumber description];

    if (!v14) {
      goto LABEL_55;
    }
    goto LABEL_37;
  }
  v75 = [MEMORY[0x1E4F28B00] currentHandler];
  [v75 handleFailureInMethod:sel__initWithHost_endpoint_target_workspace_identifier_, a1, @"FBSSceneIdentityToken.m", 73, @"invalid view-service identity endpoint : %@", v11 object file lineNumber description];

  if (v13) {
    goto LABEL_54;
  }
LABEL_36:
  if (!v14)
  {
LABEL_55:
    v77 = [MEMORY[0x1E4F28B00] currentHandler];
    [v77 handleFailureInMethod:sel__initWithHost_endpoint_target_workspace_identifier_, a1, @"FBSSceneIdentityToken.m", 75, @"invalid view-service identifier='%@'", v14 object file lineNumber description];

    goto LABEL_38;
  }
LABEL_37:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_55;
  }
LABEL_38:
  v48 = NSString;
  v49 = (void *)MEMORY[0x1E4F28B88];
  id v50 = v14;
  v51 = [v49 URLHostAllowedCharacterSet];
  v52 = [v50 stringByAddingPercentEncodingWithAllowedCharacters:v51];

  if ([v52 isEqualToString:v50]) {
    v53 = v50;
  }
  else {
    v53 = v52;
  }
  id v22 = v53;

  v29 = [v48 stringWithFormat:@"%i/view-service:%@", a2, v22];
LABEL_42:

  v81.receiver = a1;
  v81.super_class = (Class)FBSSceneIdentityToken;
  v54 = [super init];
  id v55 = v54;
  if (v54)
  {
    v54[12] = a2;
    uint64_t v56 = [v11 copy];
    v57 = (void *)*((void *)v55 + 1);
    *((void *)v55 + 1) = v56;

    uint64_t v58 = [v12 copy];
    v59 = (void *)*((void *)v55 + 2);
    *((void *)v55 + 2) = v58;

    uint64_t v60 = [v13 copy];
    v61 = (void *)*((void *)v55 + 3);
    *((void *)v55 + 3) = v60;

    uint64_t v62 = [v14 copy];
    v63 = (void *)*((void *)v55 + 4);
    *((void *)v55 + 4) = v62;

    objc_storeStrong((id *)v55 + 5, v29);
  }
  id v64 = v55;

LABEL_45:
  return v64;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringRepresentation, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_workspace, 0);
  objc_storeStrong((id *)&self->_target, 0);

  objc_storeStrong((id *)&self->_endpoint, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (self->_host >= 1)
  {
    [v4 encodeInt64:forKey:];
    id v4 = v8;
  }
  endpoint = self->_endpoint;
  if (endpoint)
  {
    [v8 encodeObject:endpoint forKey:@"e"];
    id v4 = v8;
  }
  target = self->_target;
  if (target)
  {
    [v8 encodeObject:target forKey:@"t"];
    id v4 = v8;
  }
  workspace = self->_workspace;
  if (workspace)
  {
    [v8 encodeObject:workspace forKey:@"w"];
    id v4 = v8;
  }
  [v4 encodeObject:self->_identifier forKey:@"i"];
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (self->_host >= 1)
  {
    [v4 encodeInt64:forKey:];
    id v4 = v8;
  }
  endpoint = self->_endpoint;
  if (endpoint)
  {
    [v8 encodeObject:endpoint forKey:@"e"];
    id v4 = v8;
  }
  target = self->_target;
  if (target)
  {
    [v8 encodeObject:target forKey:@"t"];
    id v4 = v8;
  }
  workspace = self->_workspace;
  if (workspace)
  {
    [v8 encodeObject:workspace forKey:@"w"];
    id v4 = v8;
  }
  [v4 encodeObject:self->_identifier forKey:@"i"];
}

- (FBSSceneIdentityToken)init
{
  id v4 = [NSString stringWithFormat:@"-init is not allowed on FBSSceneIdentityToken"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v5 = NSStringFromSelector(a2);
    v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v8 = 138544642;
    id v9 = v5;
    __int16 v10 = 2114;
    id v11 = v7;
    __int16 v12 = 2048;
    id v13 = self;
    __int16 v14 = 2114;
    id v15 = @"FBSSceneIdentityToken.m";
    __int16 v16 = 1024;
    int v17 = 43;
    __int16 v18 = 2114;
    v19 = v4;
    _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
  }
  [v4 UTF8String];
  _bs_set_crash_log_message();
}

+ (FBSSceneIdentityToken)tokenWithHostPID:(int)a3 viewServiceSessionIdentifier:(id)a4
{
  id v4 = *(void **)&a3;
  id v5 = a4;
  if ((int)v4 <= 0)
  {
    id v9 = [NSString stringWithFormat:@"invalid host pid : %i", v4];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[FBSSceneIdentityToken tokenWithHostPID:viewServiceSessionIdentifier:]();
    }
    [v9 UTF8String];
    _bs_set_crash_log_message();
  }
  id v6 = v5;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v6)
  {
    __int16 v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[FBSSceneIdentityToken tokenWithHostPID:viewServiceSessionIdentifier:]();
    }
    [v10 UTF8String];
    _bs_set_crash_log_message();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[FBSSceneIdentityToken tokenWithHostPID:viewServiceSessionIdentifier:]();
    }
    [v11 UTF8String];
    _bs_set_crash_log_message();
  }

  id v7 = -[FBSSceneIdentityToken _initWithHost:endpoint:target:workspace:identifier:]([FBSSceneIdentityToken alloc], v4, 0, 0, 0, v6);

  return (FBSSceneIdentityToken *)v7;
}

+ (FBSSceneIdentityToken)tokenWithHostPID:(int)a3 directEndpointTarget:(id)a4 workspace:(id)a5 identifier:(id)a6
{
  int v8 = *(void **)&a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if ((int)v8 <= 0)
  {
    __int16 v18 = [NSString stringWithFormat:@"invalid host pid : %i", v8];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[FBSSceneIdentityToken tokenWithHostPID:directEndpointTarget:workspace:identifier:]();
    }
    [v18 UTF8String];
    _bs_set_crash_log_message();
  }
  __int16 v12 = v11;
  id v13 = v9;
  NSClassFromString(&cfstr_Rbsprocessiden.isa);
  if (!v13)
  {
    v19 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[FBSSceneIdentityToken tokenWithHostPID:directEndpointTarget:workspace:identifier:]();
    }
    [v19 UTF8String];
    _bs_set_crash_log_message();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v20 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:RBSProcessIdentityClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[FBSSceneIdentityToken tokenWithHostPID:directEndpointTarget:workspace:identifier:]();
    }
    [v20 UTF8String];
    _bs_set_crash_log_message();
  }

  id v14 = v10;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v14)
  {
    v21 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[FBSSceneIdentityToken tokenWithHostPID:directEndpointTarget:workspace:identifier:]();
    }
    [v21 UTF8String];
    _bs_set_crash_log_message();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v22 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[FBSSceneIdentityToken tokenWithHostPID:directEndpointTarget:workspace:identifier:]();
    }
    [v22 UTF8String];
    _bs_set_crash_log_message();
  }

  id v15 = v12;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v15)
  {
    v23 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[FBSSceneIdentityToken tokenWithHostPID:directEndpointTarget:workspace:identifier:].cold.4();
    }
    [v23 UTF8String];
    _bs_set_crash_log_message();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v24 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[FBSSceneIdentityToken tokenWithHostPID:directEndpointTarget:workspace:identifier:].cold.4();
    }
    [v24 UTF8String];
    _bs_set_crash_log_message();
  }

  id v16 = -[FBSSceneIdentityToken _initWithHost:endpoint:target:workspace:identifier:]([FBSSceneIdentityToken alloc], v8, 0, v13, v14, v15);

  return (FBSSceneIdentityToken *)v16;
}

+ (id)pseudoTokenWithIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = [FBSSceneIdentityToken alloc];
  id v5 = (void *)getpid();
  id v6 = -[FBSSceneIdentityToken _initWithHost:endpoint:target:workspace:identifier:](v4, v5, 0, 0, 0, v3);
  id v7 = v6;
  if (v6)
  {
    int v8 = NSString;
    id v9 = (void *)MEMORY[0x1E4F28B88];
    uint64_t v10 = *((unsigned int *)v6 + 12);
    id v11 = v3;
    __int16 v12 = [v9 URLHostAllowedCharacterSet];
    id v13 = [v11 stringByAddingPercentEncodingWithAllowedCharacters:v12];

    if ([v13 isEqualToString:v11]) {
      id v14 = v11;
    }
    else {
      id v14 = v13;
    }
    id v15 = v14;

    uint64_t v16 = [v8 stringWithFormat:@"%i/psuedo:%@", v10, v15];

    int v17 = (void *)v7[5];
    v7[5] = v16;
  }

  return v7;
}

- (BSServiceConnectionEndpoint)hostEndpoint
{
  return self->_endpoint;
}

- (NSString)debugDescription
{
  return (NSString *)[NSString stringWithFormat:@"<%@:%p %@>", objc_opt_class(), self, self->_stringRepresentation];
}

- (FBSSceneIdentityToken)initWithXPCDictionary:(id)a3
{
  id v3 = a3;
  [@"t" UTF8String];
  BSDeserializeDataFromXPCDictionaryWithKey();
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (self->_host >= 1) {
      xpc_dictionary_set_int64(v4, (const char *)[@"h" UTF8String], self->_host);
    }
    if (self->_endpoint)
    {
      [@"e" UTF8String];
      BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
    }
    target = self->_target;
    if (target)
    {
      [(RBSProcessIdentity *)target bs_secureEncoded];
      objc_claimAutoreleasedReturnValue();
      [@"t" UTF8String];
      BSSerializeDataToXPCDictionaryWithKey();
    }
    if (self->_workspace)
    {
      [@"w" UTF8String];
      BSSerializeStringToXPCDictionaryWithKey();
    }
    [@"i" UTF8String];
    BSSerializeStringToXPCDictionaryWithKey();
  }
}

+ (void)tokenWithHostPID:viewServiceSessionIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)tokenWithHostPID:viewServiceSessionIdentifier:.cold.2()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)tokenWithHostEndpoint:workspace:identifier:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)tokenWithHostEndpoint:workspace:identifier:.cold.2()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)tokenWithHostEndpoint:workspace:identifier:.cold.3()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)tokenWithHostEndpoint:workspace:identifier:.cold.6()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)tokenWithHostPID:directEndpointTarget:workspace:identifier:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)tokenWithHostPID:directEndpointTarget:workspace:identifier:.cold.2()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)tokenWithHostPID:directEndpointTarget:workspace:identifier:.cold.3()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)tokenWithHostPID:directEndpointTarget:workspace:identifier:.cold.4()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end