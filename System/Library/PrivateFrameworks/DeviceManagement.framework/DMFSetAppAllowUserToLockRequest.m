@interface DMFSetAppAllowUserToLockRequest
+ (BOOL)isPermittedOnSystemConnection;
+ (BOOL)isPermittedOnUserConnection;
+ (BOOL)supportsSecureCoding;
+ (id)permittedPlatforms;
- (DMFSetAppAllowUserToLockRequest)initWithCoder:(id)a3;
- (NSNumber)allowUserToLock;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowUserToLock:(id)a3;
@end

@implementation DMFSetAppAllowUserToLockRequest

+ (id)permittedPlatforms
{
  return &unk_1F18AB670;
}

+ (BOOL)isPermittedOnSystemConnection
{
  return 1;
}

+ (BOOL)isPermittedOnUserConnection
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFSetAppAllowUserToLockRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DMFSetAppAllowUserToLockRequest;
  v5 = [(DMFAppRequest *)&v10 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"allowUserToLock"];
    allowUserToLock = v5->_allowUserToLock;
    v5->_allowUserToLock = (NSNumber *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DMFSetAppAllowUserToLockRequest;
  id v4 = a3;
  [(DMFAppRequest *)&v6 encodeWithCoder:v4];
  v5 = [(DMFSetAppAllowUserToLockRequest *)self allowUserToLock];
  [v4 encodeObject:v5 forKey:@"allowUserToLock"];
}

- (NSNumber)allowUserToLock
{
  return self->_allowUserToLock;
}

- (void)setAllowUserToLock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end