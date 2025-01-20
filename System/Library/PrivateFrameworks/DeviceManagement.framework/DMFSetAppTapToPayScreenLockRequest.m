@interface DMFSetAppTapToPayScreenLockRequest
+ (BOOL)isPermittedOnSystemConnection;
+ (BOOL)isPermittedOnUserConnection;
+ (BOOL)supportsSecureCoding;
+ (id)permittedPlatforms;
- (DMFSetAppTapToPayScreenLockRequest)initWithCoder:(id)a3;
- (NSNumber)tapToPayScreenLock;
- (void)encodeWithCoder:(id)a3;
- (void)setTapToPayScreenLock:(id)a3;
@end

@implementation DMFSetAppTapToPayScreenLockRequest

+ (id)permittedPlatforms
{
  return &unk_1F18AB940;
}

+ (BOOL)isPermittedOnSystemConnection
{
  return 1;
}

+ (BOOL)isPermittedOnUserConnection
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFSetAppTapToPayScreenLockRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DMFSetAppTapToPayScreenLockRequest;
  v5 = [(DMFAppRequest *)&v10 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"tapToPayScreenLock"];
    tapToPayScreenLock = v5->_tapToPayScreenLock;
    v5->_tapToPayScreenLock = (NSNumber *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DMFSetAppTapToPayScreenLockRequest;
  id v4 = a3;
  [(DMFAppRequest *)&v6 encodeWithCoder:v4];
  v5 = [(DMFSetAppTapToPayScreenLockRequest *)self tapToPayScreenLock];
  [v4 encodeObject:v5 forKey:@"tapToPayScreenLock"];
}

- (NSNumber)tapToPayScreenLock
{
  return self->_tapToPayScreenLock;
}

- (void)setTapToPayScreenLock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end