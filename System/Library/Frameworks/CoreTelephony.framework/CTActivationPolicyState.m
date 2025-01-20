@interface CTActivationPolicyState
+ (BOOL)supportsSecureCoding;
- (CTActivationPolicyState)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)carrierLock;
- (void)encodeWithCoder:(id)a3;
- (void)setCarrierLock:(int64_t)a3;
@end

@implementation CTActivationPolicyState

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  int64_t v4 = [(CTActivationPolicyState *)self carrierLock];
  v5 = "CTActivationPolicyCarrierLockUnknown";
  if (v4 == 1) {
    v5 = "CTActivationPolicyCarrierUnlocked";
  }
  if (v4 == 2) {
    v5 = "CTActivationPolicyCarrierLocked";
  }
  [v3 appendFormat:@", carrierLock=%s", v5];
  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setCarrierLock:", -[CTActivationPolicyState carrierLock](self, "carrierLock"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTActivationPolicyState carrierLock](self, "carrierLock"), @"carrier_lock");
}

- (CTActivationPolicyState)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CTActivationPolicyState;
  v5 = [(CTActivationPolicyState *)&v7 init];
  if (v5) {
    v5->_carrierLock = [v4 decodeIntegerForKey:@"carrier_lock"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)carrierLock
{
  return self->_carrierLock;
}

- (void)setCarrierLock:(int64_t)a3
{
  self->_carrierLock = a3;
}

@end