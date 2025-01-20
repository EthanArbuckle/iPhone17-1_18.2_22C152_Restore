@interface LABiometryFallbackRequirement
+ (LABiometryFallbackRequirement)devicePasscodeRequirement;
+ (id)customPasswordRequirement:(id)a3;
- (BOOL)isEqual:(id)a3;
- (id)initWithAuthenticationType:(void *)a3 subrequirements:;
- (void)encodeWithACLCoder:(id)a3;
@end

@implementation LABiometryFallbackRequirement

- (id)initWithAuthenticationType:(void *)a3 subrequirements:
{
  id v6 = a3;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)LABiometryFallbackRequirement;
    v7 = (id *)objc_msgSendSuper2(&v9, sel_init);
    a1 = v7;
    if (v7)
    {
      v7[1] = a2;
      objc_storeStrong(v7 + 2, a3);
    }
  }

  return a1;
}

+ (LABiometryFallbackRequirement)devicePasscodeRequirement
{
  v2 = [LABiometryFallbackRequirement alloc];
  v3 = -[LABiometryFallbackRequirement initWithAuthenticationType:subrequirements:]((id *)&v2->super.isa, (void *)0x10, MEMORY[0x1E4F1CBF0]);

  return (LABiometryFallbackRequirement *)v3;
}

+ (id)customPasswordRequirement:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [LABiometryFallbackRequirement alloc];
  v8[0] = v3;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  id v6 = -[LABiometryFallbackRequirement initWithAuthenticationType:subrequirements:]((id *)&v4->super.isa, (void *)0x80000000, v5);

  return v6;
}

- (void)encodeWithACLCoder:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 setFallbackAuthenticationType:self->_authType];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_subrequirements;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && v4[1] == self->_authType;

  return v5;
}

- (void).cxx_destruct
{
}

@end