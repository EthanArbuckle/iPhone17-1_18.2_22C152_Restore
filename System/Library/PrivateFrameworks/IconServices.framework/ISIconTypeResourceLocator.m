@interface ISIconTypeResourceLocator
+ (BOOL)supportsSecureCoding;
- (BOOL)allowLocalizedIcon;
- (ISIconTypeResourceLocator)initWithCoder:(id)a3;
- (ISIconTypeResourceLocator)initWithType:(id)a3;
- (NSString)type;
- (id)bundleIdentifier;
- (id)preferedResourceName;
- (id)resourceDirectoryURL;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ISIconTypeResourceLocator

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ISIconTypeResourceLocator)initWithType:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ISIconTypeResourceLocator;
  v6 = [(ISIconTypeResourceLocator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_type, a3);
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
}

- (ISIconTypeResourceLocator)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ISIconTypeResourceLocator;
  id v5 = [(ISIconTypeResourceLocator *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_type"];
    type = v5->_type;
    v5->_type = (NSString *)v6;
  }
  return v5;
}

- (id)resourceDirectoryURL
{
  CFURLRef v2 = UTTypeCopyDeclaringBundleURL((CFStringRef)self->_type);
  return v2;
}

- (id)bundleIdentifier
{
  CFURLRef v2 = UTTypeCopyDeclaringBundleURL((CFStringRef)self->_type);
  Unique = (__CFBundle *)_CFBundleCreateUnique();
  if (Unique)
  {
    id v4 = Unique;
    id v5 = CFBundleGetIdentifier(Unique);
    CFRelease(v4);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)preferedResourceName
{
  CFURLRef v2 = (void *)_UTTypeCopyIconName();
  return v2;
}

- (BOOL)allowLocalizedIcon
{
  return 0;
}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
}

@end