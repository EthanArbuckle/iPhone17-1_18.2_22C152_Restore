@interface HMDMutableRemoteMessagePolicy
+ (id)remoteMessagePolicyWithRequiresSecureMessage:(BOOL)a3 allowsAnonymousMessage:(BOOL)a4 requiresAccountMessage:(BOOL)a5 transportRestriction:(unint64_t)a6 roles:(unint64_t)a7;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation HMDMutableRemoteMessagePolicy

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)remoteMessagePolicyWithRequiresSecureMessage:(BOOL)a3 allowsAnonymousMessage:(BOOL)a4 requiresAccountMessage:(BOOL)a5 transportRestriction:(unint64_t)a6 roles:(unint64_t)a7
{
  v7 = objc_msgSend(objc_alloc((Class)a1), "__initWithRequiresSecureMessage:allowsAnonymousMessage:requiresAccountMessage:transportRestriction:roles:", a3, a4, a5, a6, a7);
  return v7;
}

@end