@interface CRKRenewAppleIDCredentialsRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)force;
- (CRKRenewAppleIDCredentialsRequest)initWithCoder:(id)a3;
- (NSString)reason;
- (void)encodeWithCoder:(id)a3;
- (void)setForce:(BOOL)a3;
- (void)setReason:(id)a3;
@end

@implementation CRKRenewAppleIDCredentialsRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  id v5 = a3;
  v6 = objc_msgSend(v4, "numberWithBool:", -[CRKRenewAppleIDCredentialsRequest force](self, "force"));
  [v5 encodeObject:v6 forKey:@"force"];

  id v7 = [(CRKRenewAppleIDCredentialsRequest *)self reason];
  [v5 encodeObject:v7 forKey:@"reason"];
}

- (CRKRenewAppleIDCredentialsRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRKRenewAppleIDCredentialsRequest;
  id v5 = [(CATTaskRequest *)&v11 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"force"];
    v5->_force = [v6 BOOLValue];

    id v7 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"reason"];
    reason = v5->_reason;
    v5->_reason = (NSString *)v8;
  }
  return v5;
}

- (BOOL)force
{
  return self->_force;
}

- (void)setForce:(BOOL)a3
{
  self->_force = a3;
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
}

- (void).cxx_destruct
{
}

@end