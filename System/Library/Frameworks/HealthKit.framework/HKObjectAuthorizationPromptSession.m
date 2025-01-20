@interface HKObjectAuthorizationPromptSession
+ (BOOL)supportsSecureCoding;
- (HKObjectAuthorizationPromptSession)initWithCoder:(id)a3;
- (NSString)bundleIdentifier;
- (NSUUID)sessionIdentifier;
- (id)initForBundleIdentifier:(id)a3 sessionIdentifier:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKObjectAuthorizationPromptSession

- (id)initForBundleIdentifier:(id)a3 sessionIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKObjectAuthorizationPromptSession;
  v9 = [(HKObjectAuthorizationPromptSession *)&v12 init];
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sessionIdentifier, a4);
    objc_storeStrong(p_isa + 2, a3);
  }

  return p_isa;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKObjectAuthorizationPromptSession)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKObjectAuthorizationPromptSession;
  v5 = [(HKObjectAuthorizationPromptSession *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sid"];
    sessionIdentifier = v5->_sessionIdentifier;
    v5->_sessionIdentifier = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bid"];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  sessionIdentifier = self->_sessionIdentifier;
  id v5 = a3;
  [v5 encodeObject:sessionIdentifier forKey:@"sid"];
  [v5 encodeObject:self->_bundleIdentifier forKey:@"bid"];
}

- (NSUUID)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);

  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

@end