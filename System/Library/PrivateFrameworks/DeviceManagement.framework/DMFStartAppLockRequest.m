@interface DMFStartAppLockRequest
+ (BOOL)supportsSecureCoding;
- (DMFStartAppLockRequest)initWithCoder:(id)a3;
- (NSString)bundleIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleIdentifier:(id)a3;
@end

@implementation DMFStartAppLockRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFStartAppLockRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DMFStartAppLockRequest;
  v5 = [(CATTaskRequest *)&v10 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"bundleIdentifier"];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DMFStartAppLockRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v6 encodeWithCoder:v4];
  v5 = [(DMFStartAppLockRequest *)self bundleIdentifier];
  [v4 encodeObject:v5 forKey:@"bundleIdentifier"];
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end