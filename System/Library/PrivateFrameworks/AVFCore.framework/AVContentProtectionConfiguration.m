@interface AVContentProtectionConfiguration
- (AVContentProtectionConfiguration)initWithContentKeySystem:(id)a3 keyIdentifiers:(id)a4;
- (NSArray)keyIdentifiers;
- (NSString)contentKeySystem;
- (void)dealloc;
@end

@implementation AVContentProtectionConfiguration

- (AVContentProtectionConfiguration)initWithContentKeySystem:(id)a3 keyIdentifiers:(id)a4
{
  if (!a3)
  {
    v8 = (objc_class *)self;
    v9 = a2;
    v10 = self;
    v16 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v17 = *MEMORY[0x1E4F1C3C8];
    v18 = "contentKeySystem != nil";
    goto LABEL_8;
  }
  if (!a4)
  {
    v8 = (objc_class *)self;
    v9 = a2;
    v19 = self;
    v16 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v17 = *MEMORY[0x1E4F1C3C8];
    v18 = "keyIdentifiers != nil";
LABEL_8:
    v20 = (void *)[v16 exceptionWithName:v17, AVMethodExceptionReasonWithObjectAndSelector(v8, v9, @"invalid parameter not satisfying: %s", v11, v12, v13, v14, v15, (uint64_t)v18), 0 reason userInfo];
    objc_exception_throw(v20);
  }
  v21.receiver = self;
  v21.super_class = (Class)AVContentProtectionConfiguration;
  v6 = [(AVContentProtectionConfiguration *)&v21 init];
  if (v6)
  {
    v6->_contentKeySystem = (NSString *)[a3 copy];
    v6->_keyIdentifiers = (NSArray *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:a4 copyItems:1];
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVContentProtectionConfiguration;
  [(AVContentProtectionConfiguration *)&v3 dealloc];
}

- (NSString)contentKeySystem
{
  return self->_contentKeySystem;
}

- (NSArray)keyIdentifiers
{
  return self->_keyIdentifiers;
}

@end