@interface LPSourceApplicationMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LPImage)icon;
- (LPSourceApplicationMetadata)initWithCoder:(id)a3;
- (NSString)bundleIdentifier;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setIcon:(id)a3;
- (void)setName:(id)a3;
@end

@implementation LPSourceApplicationMetadata

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[LPSourceApplicationMetadata allocWithZone:a3];
  if (v4)
  {
    v5 = [(LPSourceApplicationMetadata *)self name];
    [(LPSourceApplicationMetadata *)v4 setName:v5];

    v6 = [(LPSourceApplicationMetadata *)self bundleIdentifier];
    [(LPSourceApplicationMetadata *)v4 setBundleIdentifier:v6];

    v7 = [(LPSourceApplicationMetadata *)self icon];
    [(LPSourceApplicationMetadata *)v4 setIcon:v7];

    v8 = v4;
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPSourceApplicationMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)LPSourceApplicationMetadata;
  v5 = [(LPSourceApplicationMetadata *)&v14 init];
  if (v5)
  {
    uint64_t v6 = decodeStringForKey(v4, @"name");
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = decodeStringForKey(v4, @"bundleIdentifier");
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v8;

    uint64_t v10 = objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", @"icon");
    icon = v5->_icon;
    v5->_icon = (LPImage *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_name, @"name");
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_bundleIdentifier, @"bundleIdentifier");
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_icon, @"icon");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LPSourceApplicationMetadata;
  if ([(LPSourceApplicationMetadata *)&v8 isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = (void **)v4;
      if ((objectsAreEqual_0(v6[1], self->_name) & 1) != 0
        && objectsAreEqual_0(v6[2], self->_bundleIdentifier))
      {
        char v5 = objectsAreEqual_0(v6[3], self->_icon);
      }
      else
      {
        char v5 = 0;
      }
    }
    else
    {
      char v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  return [(NSString *)self->_bundleIdentifier hash];
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (LPImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end