@interface BLSSceneAttribute
+ (BOOL)supportsSecureCoding;
- (BLSSceneAttribute)initWithCoder:(id)a3;
- (BLSSceneAttribute)initWithFBSScene:(id)a3;
- (BLSSceneAttribute)initWithSceneIdentityToken:(id)a3;
- (BLSSceneAttribute)initWithXPCDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (FBSSceneIdentityToken)sceneIdentityToken;
- (NSString)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation BLSSceneAttribute

- (BLSSceneAttribute)initWithFBSScene:(id)a3
{
  v4 = [a3 identityToken];
  v5 = [(BLSSceneAttribute *)self initWithSceneIdentityToken:v4];

  return v5;
}

- (BLSSceneAttribute)initWithSceneIdentityToken:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BLSSceneAttribute;
  v6 = [(BLSAttribute *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_sceneIdentityToken, a3);
  }

  return v7;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v4 = [(FBSSceneIdentityToken *)self->_sceneIdentityToken stringRepresentation];
  [v3 appendString:v4 withName:@"identityToken"];

  id v5 = [v3 build];

  return (NSString *)v5;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendPointer:objc_opt_class()];
  id v5 = (id)[v3 appendObject:self->_sceneIdentityToken];
  unint64_t v6 = [v3 hash];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BLSSceneAttribute *)a3;
  if (v4 == self)
  {
    char v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (uint64_t v5 = objc_opt_class(), v5 == objc_opt_class()))
    {
      sceneIdentityToken = self->_sceneIdentityToken;
      v8 = [(BLSSceneAttribute *)v4 sceneIdentityToken];
      char v6 = [(FBSSceneIdentityToken *)sceneIdentityToken isEqual:v8];
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (BLSSceneAttribute)initWithXPCDictionary:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [@"identityToken" UTF8String];
  char v6 = (void *)BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionaryWithKey();

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    self = [(BLSSceneAttribute *)self initWithSceneIdentityToken:v6];
    v7 = self;
  }
  else
  {
    v8 = bls_assertions_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      v12 = NSStringFromSelector(a2);
      int v13 = 138412802;
      v14 = v6;
      __int16 v15 = 2112;
      v16 = v11;
      __int16 v17 = 2112;
      v18 = v12;
      _os_log_fault_impl(&dword_1B55DE000, v8, OS_LOG_TYPE_FAULT, "%@ not a FBSSceneIdentityToken for [%@ %@]", (uint8_t *)&v13, 0x20u);
    }
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v3 = a3;
  [@"identityToken" UTF8String];
  BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BLSSceneAttribute)initWithCoder:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  char v6 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"identityToken"];
  if (v6)
  {
    self = [(BLSSceneAttribute *)self initWithSceneIdentityToken:v6];
    v7 = self;
  }
  else
  {
    v8 = bls_assertions_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      v12 = NSStringFromSelector(a2);
      int v13 = 138543874;
      id v14 = v5;
      __int16 v15 = 2112;
      v16 = v11;
      __int16 v17 = 2112;
      v18 = v12;
      _os_log_fault_impl(&dword_1B55DE000, v8, OS_LOG_TYPE_FAULT, "invalid FBSSceneIdentityToken from %{public}@ for [%@ %@]", (uint8_t *)&v13, 0x20u);
    }
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
}

- (FBSSceneIdentityToken)sceneIdentityToken
{
  return self->_sceneIdentityToken;
}

- (void).cxx_destruct
{
}

@end