@interface HMDRemoteMessagePolicy
+ (id)defaultPolicy;
+ (id)defaultSecurePolicy;
+ (id)remoteMessagePolicyWithRequiresSecureMessage:(BOOL)a3 allowsAnonymousMessage:(BOOL)a4 requiresAccountMessage:(BOOL)a5 transportRestriction:(unint64_t)a6 roles:(unint64_t)a7;
- (BOOL)allowsAnonymousMessage;
- (BOOL)isEqual:(id)a3;
- (BOOL)requiresAccountMessage;
- (BOOL)requiresSecureMessage;
- (HMDRemoteMessagePolicy)init;
- (id)__initWithRequiresSecureMessage:(BOOL)a3 allowsAnonymousMessage:(BOOL)a4 requiresAccountMessage:(BOOL)a5 transportRestriction:(unint64_t)a6 roles:(unint64_t)a7;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)roles;
- (unint64_t)transportRestriction;
- (void)setAllowsAnonymousMessage:(BOOL)a3;
- (void)setRequiresAccountMessage:(BOOL)a3;
- (void)setRequiresSecureMessage:(BOOL)a3;
- (void)setRoles:(unint64_t)a3;
- (void)setTransportRestriction:(unint64_t)a3;
@end

@implementation HMDRemoteMessagePolicy

- (void)setRoles:(unint64_t)a3
{
  self->_roles = a3;
}

- (unint64_t)roles
{
  return self->_roles;
}

- (void)setTransportRestriction:(unint64_t)a3
{
  self->_transportRestriction = a3;
}

- (unint64_t)transportRestriction
{
  return self->_transportRestriction;
}

- (void)setRequiresAccountMessage:(BOOL)a3
{
  self->_requiresAccountMessage = a3;
}

- (BOOL)requiresAccountMessage
{
  return self->_requiresAccountMessage;
}

- (void)setAllowsAnonymousMessage:(BOOL)a3
{
  self->_allowsAnonymousMessage = a3;
}

- (BOOL)allowsAnonymousMessage
{
  return self->_allowsAnonymousMessage;
}

- (void)setRequiresSecureMessage:(BOOL)a3
{
  self->_requiresSecureMessage = a3;
}

- (BOOL)requiresSecureMessage
{
  return self->_requiresSecureMessage;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)defaultSecurePolicy
{
  return (id)[a1 remoteMessagePolicyWithRequiresSecureMessage:1 allowsAnonymousMessage:0 requiresAccountMessage:0 transportRestriction:-1 roles:0];
}

+ (id)defaultPolicy
{
  return (id)[a1 remoteMessagePolicyWithRequiresSecureMessage:0 allowsAnonymousMessage:0 requiresAccountMessage:0 transportRestriction:-1 roles:0];
}

+ (id)remoteMessagePolicyWithRequiresSecureMessage:(BOOL)a3 allowsAnonymousMessage:(BOOL)a4 requiresAccountMessage:(BOOL)a5 transportRestriction:(unint64_t)a6 roles:(unint64_t)a7
{
  v7 = objc_msgSend(objc_alloc((Class)a1), "__initWithRequiresSecureMessage:allowsAnonymousMessage:requiresAccountMessage:transportRestriction:roles:", a3, a4, a5, a6, a7);
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMDRemoteMessagePolicy *)a3;
  if (self == v4)
  {
    BOOL v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    v6 = v5;
    if (v6
      && (BOOL v7 = [(HMDRemoteMessagePolicy *)self requiresSecureMessage],
          v7 == [(HMDRemoteMessagePolicy *)v6 requiresSecureMessage])
      && (BOOL v8 = [(HMDRemoteMessagePolicy *)self allowsAnonymousMessage],
          v8 == [(HMDRemoteMessagePolicy *)v6 allowsAnonymousMessage])
      && (BOOL v9 = [(HMDRemoteMessagePolicy *)self requiresAccountMessage],
          v9 == [(HMDRemoteMessagePolicy *)v6 requiresAccountMessage])
      && (unint64_t v10 = [(HMDRemoteMessagePolicy *)self transportRestriction],
          v10 == [(HMDRemoteMessagePolicy *)v6 transportRestriction]))
    {
      unint64_t v11 = [(HMDRemoteMessagePolicy *)self roles];
      BOOL v12 = v11 == [(HMDRemoteMessagePolicy *)v6 roles];
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  return v12;
}

- (unint64_t)hash
{
  uint64_t v3 = [(HMDRemoteMessagePolicy *)self requiresSecureMessage];
  BOOL v4 = [(HMDRemoteMessagePolicy *)self allowsAnonymousMessage];
  uint64_t v5 = 2;
  if (!v4) {
    uint64_t v5 = 0;
  }
  uint64_t v6 = v5 | v3;
  BOOL v7 = [(HMDRemoteMessagePolicy *)self requiresAccountMessage];
  uint64_t v8 = 4;
  if (!v7) {
    uint64_t v8 = 0;
  }
  unint64_t v9 = v6 | v8 | (8 * [(HMDRemoteMessagePolicy *)self transportRestriction]);
  return v9 ^ (16 * [(HMDRemoteMessagePolicy *)self roles]);
}

- (id)__initWithRequiresSecureMessage:(BOOL)a3 allowsAnonymousMessage:(BOOL)a4 requiresAccountMessage:(BOOL)a5 transportRestriction:(unint64_t)a6 roles:(unint64_t)a7
{
  v13.receiver = self;
  v13.super_class = (Class)HMDRemoteMessagePolicy;
  id result = [(HMDRemoteMessagePolicy *)&v13 init];
  if (result)
  {
    *((unsigned char *)result + 8) = a3;
    *((unsigned char *)result + 9) = a4;
    *((unsigned char *)result + 10) = a5;
    *((void *)result + 2) = a6;
    *((void *)result + 3) = a7;
  }
  return result;
}

- (HMDRemoteMessagePolicy)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  BOOL v4 = NSString;
  uint64_t v5 = NSStringFromSelector(a2);
  uint64_t v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

@end