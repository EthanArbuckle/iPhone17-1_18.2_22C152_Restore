@interface HFMediaAccessControlDescriptor
+ (BOOL)accessClassificationSupportsPassword:(unint64_t)a3;
+ (NAIdentity)na_identity;
+ (id)defaultAccessControl;
+ (id)descriptorWithAccess:(unint64_t)a3 requiresPassword:(BOOL)a4 password:(id)a5;
- (BOOL)accessRequiresPassword;
- (BOOL)accessSupportsPassword;
- (BOOL)isEqual:(id)a3;
- (HFMediaAccessControlDescriptor)init;
- (HFMediaAccessControlDescriptor)initWithAccess:(unint64_t)a3 requiresPassword:(BOOL)a4 password:(id)a5;
- (NSString)accessPassword;
- (NSString)description;
- (unint64_t)access;
- (unint64_t)hash;
@end

@implementation HFMediaAccessControlDescriptor

+ (id)defaultAccessControl
{
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) initWithAccess:0 requiresPassword:0 password:0];
  return v2;
}

+ (id)descriptorWithAccess:(unint64_t)a3 requiresPassword:(BOOL)a4 password:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  v8 = (void *)[objc_alloc((Class)objc_opt_class()) initWithAccess:a3 requiresPassword:v5 password:v7];

  return v8;
}

- (HFMediaAccessControlDescriptor)initWithAccess:(unint64_t)a3 requiresPassword:(BOOL)a4 password:(id)a5
{
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HFMediaAccessControlDescriptor;
  v9 = [(HFMediaAccessControlDescriptor *)&v14 init];
  v10 = v9;
  if (v9)
  {
    v9->_access = a3;
    v9->_accessRequiresPassword = a4;
    uint64_t v11 = [v8 copy];
    accessPassword = v10->_accessPassword;
    v10->_accessPassword = (NSString *)v11;
  }
  return v10;
}

- (HFMediaAccessControlDescriptor)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  BOOL v5 = NSStringFromSelector(sel_initWithAccess_requiresPassword_password_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFMediaAccessControlDescriptor.m", 60, @"%s is unavailable; use %@ instead",
    "-[HFMediaAccessControlDescriptor init]",
    v5);

  return 0;
}

- (BOOL)accessSupportsPassword
{
  v3 = objc_opt_class();
  unint64_t v4 = [(HFMediaAccessControlDescriptor *)self access];
  return [v3 accessClassificationSupportsPassword:v4];
}

+ (BOOL)accessClassificationSupportsPassword:(unint64_t)a3
{
  return a3 < 2;
}

- (NSString)description
{
  v3 = [MEMORY[0x263F58188] builderWithObject:self];
  unint64_t v4 = NSLocalizedStringFromHFMediaAccessControlClassification([(HFMediaAccessControlDescriptor *)self access], 0);
  [v3 appendString:v4 withName:@"access"];

  id v5 = (id)objc_msgSend(v3, "appendBool:withName:", -[HFMediaAccessControlDescriptor accessRequiresPassword](self, "accessRequiresPassword"), @"accessRequiresPassword");
  v6 = [(HFMediaAccessControlDescriptor *)self accessPassword];
  [v3 appendString:v6 withName:@"accessPassword"];

  id v7 = [v3 build];

  return (NSString *)v7;
}

+ (NAIdentity)na_identity
{
  if (_MergedGlobals_249 != -1) {
    dispatch_once(&_MergedGlobals_249, &__block_literal_global_38_0);
  }
  v2 = (void *)qword_26AB2F058;
  return (NAIdentity *)v2;
}

void __45__HFMediaAccessControlDescriptor_na_identity__block_invoke_2()
{
  id v5 = [MEMORY[0x263F58198] builder];
  v0 = [v5 appendCharacteristic:&__block_literal_global_42_0];
  v1 = [v0 appendCharacteristic:&__block_literal_global_45];
  v2 = [v1 appendCharacteristic:&__block_literal_global_47_1];
  uint64_t v3 = [v2 build];
  unint64_t v4 = (void *)qword_26AB2F058;
  qword_26AB2F058 = v3;
}

uint64_t __45__HFMediaAccessControlDescriptor_na_identity__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 access];
  return [v2 numberWithUnsignedInteger:v3];
}

uint64_t __45__HFMediaAccessControlDescriptor_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 accessPassword];
}

uint64_t __45__HFMediaAccessControlDescriptor_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 accessRequiresPassword];
  return [v2 numberWithBool:v3];
}

- (unint64_t)hash
{
  uint64_t v3 = objc_msgSend((id)objc_opt_class(), "na_identity");
  unint64_t v4 = [v3 hashOfObject:self];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend((id)objc_opt_class(), "na_identity");
  LOBYTE(self) = [v5 isObject:self equalToObject:v4];

  return (char)self;
}

- (unint64_t)access
{
  return self->_access;
}

- (BOOL)accessRequiresPassword
{
  return self->_accessRequiresPassword;
}

- (NSString)accessPassword
{
  return self->_accessPassword;
}

- (void).cxx_destruct
{
}

@end