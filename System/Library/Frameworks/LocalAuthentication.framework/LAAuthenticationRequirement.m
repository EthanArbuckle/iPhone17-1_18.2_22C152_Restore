@interface LAAuthenticationRequirement
+ (LAAuthenticationRequirement)biometryCurrentSetRequirement;
+ (LAAuthenticationRequirement)biometryRequirement;
+ (LAAuthenticationRequirement)biometryRequirementWithFallback:(LABiometryFallbackRequirement *)fallback;
+ (LAAuthenticationRequirement)defaultRequirement;
+ (id)biometryCurrentSetRequirementWithFallback:(id)a3;
+ (id)biometryRefreshableSetRequirementWithFallback:(id)a3;
- (BOOL)isEqual:(id)a3;
- (LAAuthenticationRequirement)init;
- (id)key;
- (id)requirementByAddingExtendedRequirement:(id)a3;
- (void)encodeWithACLCoder:(id)a3;
- (void)initWithAuthenticationType:(void *)a1;
@end

@implementation LAAuthenticationRequirement

- (LAAuthenticationRequirement)init
{
  return (LAAuthenticationRequirement *)-[LAAuthenticationRequirement initWithAuthenticationType:](self, 1);
}

- (void)initWithAuthenticationType:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v8.receiver = a1;
  v8.super_class = (Class)LAAuthenticationRequirement;
  v3 = objc_msgSendSuper2(&v8, sel_init);
  v4 = v3;
  if (v3)
  {
    v3[1] = a2;
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v6 = (void *)v4[2];
    v4[2] = v5;
  }
  return v4;
}

+ (LAAuthenticationRequirement)defaultRequirement
{
  v2 = -[LAAuthenticationRequirement initWithAuthenticationType:]([LAAuthenticationRequirement alloc], 1);

  return (LAAuthenticationRequirement *)v2;
}

+ (LAAuthenticationRequirement)biometryRequirement
{
  v2 = -[LAAuthenticationRequirement initWithAuthenticationType:]([LAAuthenticationRequirement alloc], 2);

  return (LAAuthenticationRequirement *)v2;
}

+ (LAAuthenticationRequirement)biometryCurrentSetRequirement
{
  v2 = -[LAAuthenticationRequirement initWithAuthenticationType:]([LAAuthenticationRequirement alloc], 8);

  return (LAAuthenticationRequirement *)v2;
}

+ (LAAuthenticationRequirement)biometryRequirementWithFallback:(LABiometryFallbackRequirement *)fallback
{
  v3 = fallback;
  v4 = (id *)-[LAAuthenticationRequirement initWithAuthenticationType:]([LAAuthenticationRequirement alloc], 2);
  [v4[2] addObject:v3];

  return (LAAuthenticationRequirement *)v4;
}

+ (id)biometryCurrentSetRequirementWithFallback:(id)a3
{
  id v3 = a3;
  v4 = (id *)-[LAAuthenticationRequirement initWithAuthenticationType:]([LAAuthenticationRequirement alloc], 8);
  [v4[2] addObject:v3];

  return v4;
}

+ (id)biometryRefreshableSetRequirementWithFallback:(id)a3
{
  id v3 = a3;
  v4 = (id *)-[LAAuthenticationRequirement initWithAuthenticationType:]([LAAuthenticationRequirement alloc], 8);
  [v4[2] addObject:v3];

  return v4;
}

- (id)requirementByAddingExtendedRequirement:(id)a3
{
  id v4 = a3;
  id v5 = (id *)-[LAAuthenticationRequirement initWithAuthenticationType:]([LAAuthenticationRequirement alloc], self->_authType);
  uint64_t v6 = [(NSMutableSet *)self->_subrequirements mutableCopy];
  id v7 = v5[2];
  v5[2] = (id)v6;

  [v5[2] addObject:v4];

  return v5;
}

- (id)key
{
  uint64_t v7 = 0;
  objc_super v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  id v3 = _os_activity_create(&dword_1BED06000, "LocalAuthentication.Authorization.getRequirementKey", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__LAAuthenticationRequirement_key__block_invoke;
  v6[3] = &unk_1E63C3F10;
  v6[4] = self;
  v6[5] = &v7;
  os_activity_apply(v3, v6);
  id v4 = (id)v8[5];

  _Block_object_dispose(&v7, 8);

  return v4;
}

void __34__LAAuthenticationRequirement_key__block_invoke(uint64_t a1)
{
  uint64_t v6 = objc_alloc_init(LAACLCoder);
  [*(id *)(a1 + 32) encodeWithACLCoder:v6];
  v2 = [(LAACLCoder *)v6 encode];
  id v3 = [[LAAccessKey alloc] initWithACL:v2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)encodeWithACLCoder:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 setAuthenticationType:self->_authType];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = self->_subrequirements;
  uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "encodeWithACLCoder:", v4, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = (NSMutableSet **)v4;
    uint64_t v6 = v5;
    BOOL v8 = 0;
    if (v5[1] == (NSMutableSet *)self->_authType)
    {
      uint64_t v7 = v5[2];
      if (v7 == self->_subrequirements || -[NSMutableSet isEqualToSet:](v7, "isEqualToSet:")) {
        BOOL v8 = 1;
      }
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
}

@end