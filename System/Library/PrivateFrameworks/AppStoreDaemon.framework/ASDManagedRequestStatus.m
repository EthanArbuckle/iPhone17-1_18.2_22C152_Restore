@interface ASDManagedRequestStatus
+ (BOOL)supportsSecureCoding;
- (ASDManagedRequestStatus)initWithCoder:(id)a3;
- (NSString)bundleIdentifier;
- (NSString)bundleVersion;
- (NSString)title;
- (NSUUID)requestIdentifier;
- (int64_t)state;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setBundleVersion:(id)a3;
- (void)setRequestIdentifier:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setTitle:(id)a3;
@end

@implementation ASDManagedRequestStatus

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  bundleIdentifier = self->_bundleIdentifier;
  id v5 = a3;
  [v5 encodeObject:bundleIdentifier forKey:@"BundleIdentifier"];
  [v5 encodeObject:self->_bundleVersion forKey:@"BundleVersion"];
  [v5 encodeObject:self->_requestIdentifier forKey:@"RequestIdentifier"];
  [v5 encodeInteger:self->_state forKey:@"State"];
  [v5 encodeObject:self->_title forKey:@"Title"];
}

- (ASDManagedRequestStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ASDManagedRequestStatus;
  id v5 = [(ASDManagedRequestStatus *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BundleIdentifier"];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BundleVersion"];
    bundleVersion = v5->_bundleVersion;
    v5->_bundleVersion = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RequestIdentifier"];
    requestIdentifier = v5->_requestIdentifier;
    v5->_requestIdentifier = (NSUUID *)v10;

    v5->_state = [v4 decodeIntegerForKey:@"State"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Title"];
    title = v5->_title;
    v5->_title = (NSString *)v12;
  }
  return v5;
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)bundleVersion
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBundleVersion:(id)a3
{
}

- (NSUUID)requestIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRequestIdentifier:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end