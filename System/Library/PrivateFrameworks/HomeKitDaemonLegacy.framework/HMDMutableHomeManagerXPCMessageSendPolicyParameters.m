@interface HMDMutableHomeManagerXPCMessageSendPolicyParameters
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation HMDMutableHomeManagerXPCMessageSendPolicyParameters

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[HMDHomeManagerXPCMessageSendPolicyParameters allocWithZone:a3] initWithEntitlements:[(HMDXPCMessageSendPolicyParameters *)self entitlements] options:[(HMDHomeManagerXPCMessageSendPolicyParameters *)self options]];
  [(HMDHomeManagerXPCMessageSendPolicyParameters *)v4 setActive:[(HMDHomeManagerXPCMessageSendPolicyParameters *)self isActive]];
  return v4;
}

@end