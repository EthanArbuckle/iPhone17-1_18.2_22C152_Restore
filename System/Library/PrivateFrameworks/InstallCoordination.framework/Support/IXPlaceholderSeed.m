@interface IXPlaceholderSeed
+ (BOOL)supportsSecureCoding;
- (BOOL)isAppExtension;
- (IXPlaceholderSeed)initWithCoder:(id)a3;
- (NSString)bundleID;
- (NSString)bundleName;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)installType;
- (unint64_t)placeholderType;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setBundleName:(id)a3;
- (void)setInstallType:(unint64_t)a3;
- (void)setPlaceholderType:(unint64_t)a3;
@end

@implementation IXPlaceholderSeed

- (IXPlaceholderSeed)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)IXPlaceholderSeed;
  v5 = [(IXOwnedDataPromiseSeed *)&v15 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleName"];
    bundleName = v5->_bundleName;
    v5->_bundleName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleID"];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v8;

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installType"];
    v5->_installType = (unint64_t)[v10 unsignedLongLongValue];

    if ([v4 containsValueForKey:@"placeholderType"])
    {
      v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"placeholderType"];
      v5->_placeholderType = (unint64_t)[v11 unsignedLongLongValue];
    }
    else
    {
      unsigned int v12 = [v4 decodeBoolForKey:@"isPlugin"];
      uint64_t v13 = 1;
      if (v12) {
        uint64_t v13 = 2;
      }
      v5->_placeholderType = v13;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)IXPlaceholderSeed;
  id v4 = a3;
  [(IXOwnedDataPromiseSeed *)&v9 encodeWithCoder:v4];
  v5 = [(IXPlaceholderSeed *)self bundleName];
  [v4 encodeObject:v5 forKey:@"bundleName"];

  uint64_t v6 = [(IXPlaceholderSeed *)self bundleID];
  [v4 encodeObject:v6 forKey:@"bundleID"];

  v7 = +[NSNumber numberWithUnsignedInteger:[(IXPlaceholderSeed *)self installType]];
  [v4 encodeObject:v7 forKey:@"installType"];

  uint64_t v8 = +[NSNumber numberWithUnsignedInteger:[(IXPlaceholderSeed *)self placeholderType]];
  [v4 encodeObject:v8 forKey:@"placeholderType"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)IXPlaceholderSeed;
  id v4 = [(IXOwnedDataPromiseSeed *)&v8 copyWithZone:a3];
  v5 = [(IXPlaceholderSeed *)self bundleName];
  [v4 setBundleName:v5];

  uint64_t v6 = [(IXPlaceholderSeed *)self bundleID];
  [v4 setBundleID:v6];

  objc_msgSend(v4, "setInstallType:", -[IXPlaceholderSeed installType](self, "installType"));
  objc_msgSend(v4, "setPlaceholderType:", -[IXPlaceholderSeed placeholderType](self, "placeholderType"));
  return v4;
}

- (BOOL)isAppExtension
{
  uint64_t v2 = [(IXPlaceholderSeed *)self placeholderType];

  return IXIsAppExtensionForPlaceholderType(v2);
}

- (NSString)bundleName
{
  return self->_bundleName;
}

- (void)setBundleName:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (unint64_t)installType
{
  return self->_installType;
}

- (void)setInstallType:(unint64_t)a3
{
  self->_installType = a3;
}

- (unint64_t)placeholderType
{
  return self->_placeholderType;
}

- (void)setPlaceholderType:(unint64_t)a3
{
  self->_placeholderType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_storeStrong((id *)&self->_bundleName, 0);
}

@end