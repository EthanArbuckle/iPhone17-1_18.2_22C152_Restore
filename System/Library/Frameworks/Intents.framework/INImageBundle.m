@interface INImageBundle
+ (BOOL)supportsSecureCoding;
- (INImageBundle)init;
- (INImageBundle)initWithCoder:(id)a3;
- (NSString)bundleIdentifier;
- (NSString)bundlePath;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)bundleType;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setBundlePath:(id)a3;
- (void)setBundleType:(unint64_t)a3;
@end

@implementation INImageBundle

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);

  objc_storeStrong((id *)&self->_bundlePath, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(INImageBundle);
  v5 = [(INImageBundle *)self bundlePath];
  [(INImageBundle *)v4 setBundlePath:v5];

  [(INImageBundle *)v4 setBundleType:[(INImageBundle *)self bundleType]];
  v6 = [(INImageBundle *)self bundleIdentifier];
  [(INImageBundle *)v4 setBundleIdentifier:v6];

  return v4;
}

- (unint64_t)bundleType
{
  return self->_bundleType;
}

- (NSString)bundlePath
{
  return self->_bundlePath;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundlePath:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_bundlePath, "isEqualToString:"))
  {
    v4 = [v6 stringByStandardizingPath];
    bundlePath = self->_bundlePath;
    self->_bundlePath = v4;
  }
}

- (void)setBundleIdentifier:(id)a3
{
}

- (void)setBundleType:(unint64_t)a3
{
  self->_bundleType = a3;
}

- (INImageBundle)init
{
  v3.receiver = self;
  v3.super_class = (Class)INImageBundle;
  result = [(INImageBundle *)&v3 init];
  if (result) {
    result->_bundleType = 1;
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  bundlePath = self->_bundlePath;
  id v5 = a3;
  [v5 encodeObject:bundlePath forKey:@"bundlePath"];
  [v5 encodeInteger:self->_bundleType forKey:@"bundleType"];
  [v5 encodeObject:self->_bundleIdentifier forKey:@"bundleIdentifier"];
}

- (INImageBundle)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)INImageBundle;
  id v5 = [(INImageBundle *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundlePath"];
    bundlePath = v5->_bundlePath;
    v5->_bundlePath = (NSString *)v6;

    v5->_bundleType = [v4 decodeIntegerForKey:@"bundleType"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v8;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end