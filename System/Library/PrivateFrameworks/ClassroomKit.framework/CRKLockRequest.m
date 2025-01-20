@interface CRKLockRequest
+ (BOOL)supportsSecureCoding;
- (CRKLockRequest)initWithCoder:(id)a3;
- (NSString)lockedByLabel;
- (NSString)passcode;
- (void)encodeWithCoder:(id)a3;
- (void)setLockedByLabel:(id)a3;
- (void)setPasscode:(id)a3;
@end

@implementation CRKLockRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKLockRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CRKLockRequest;
  v5 = [(CATTaskRequest *)&v13 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"lockedByLabel"];
    lockedByLabel = v5->_lockedByLabel;
    v5->_lockedByLabel = (NSString *)v7;

    v9 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"passcode"];
    passcode = v5->_passcode;
    v5->_passcode = (NSString *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CRKLockRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v7 encodeWithCoder:v4];
  v5 = [(CRKLockRequest *)self lockedByLabel];
  [v4 encodeObject:v5 forKey:@"lockedByLabel"];

  v6 = [(CRKLockRequest *)self passcode];
  [v4 encodeObject:v6 forKey:@"passcode"];
}

- (NSString)lockedByLabel
{
  return self->_lockedByLabel;
}

- (void)setLockedByLabel:(id)a3
{
}

- (NSString)passcode
{
  return self->_passcode;
}

- (void)setPasscode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passcode, 0);

  objc_storeStrong((id *)&self->_lockedByLabel, 0);
}

@end