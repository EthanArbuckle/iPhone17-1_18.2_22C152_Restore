@interface CRKApplication
+ (BOOL)supportsSecureCoding;
- (CRKApplication)initWithCoder:(id)a3;
- (NSData)badgeIconData;
- (NSData)iconData;
- (NSString)bundleIdentifier;
- (NSString)name;
- (NSString)shortVersionString;
- (void)encodeWithCoder:(id)a3;
- (void)setBadgeIconData:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setIconData:(id)a3;
- (void)setName:(id)a3;
- (void)setShortVersionString:(id)a3;
@end

@implementation CRKApplication

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKApplication)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CRKApplication;
  v5 = [(CRKApplication *)&v22 init];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"bundleIdentifier"];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v7;

    v9 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v10;

    v12 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"iconData"];
    iconData = v5->_iconData;
    v5->_iconData = (NSData *)v13;

    v15 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"badgeIconData"];
    badgeIconData = v5->_badgeIconData;
    v5->_badgeIconData = (NSData *)v16;

    v18 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"shortVersionString"];
    shortVersionString = v5->_shortVersionString;
    v5->_shortVersionString = (NSString *)v19;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CRKApplication *)self bundleIdentifier];
  [v4 encodeObject:v5 forKey:@"bundleIdentifier"];

  v6 = [(CRKApplication *)self name];
  [v4 encodeObject:v6 forKey:@"name"];

  uint64_t v7 = [(CRKApplication *)self iconData];
  [v4 encodeObject:v7 forKey:@"iconData"];

  v8 = [(CRKApplication *)self badgeIconData];
  [v4 encodeObject:v8 forKey:@"badgeIconData"];

  id v9 = [(CRKApplication *)self shortVersionString];
  [v4 encodeObject:v9 forKey:@"shortVersionString"];
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSData)iconData
{
  return self->_iconData;
}

- (void)setIconData:(id)a3
{
}

- (NSData)badgeIconData
{
  return self->_badgeIconData;
}

- (void)setBadgeIconData:(id)a3
{
}

- (NSString)shortVersionString
{
  return self->_shortVersionString;
}

- (void)setShortVersionString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortVersionString, 0);
  objc_storeStrong((id *)&self->_badgeIconData, 0);
  objc_storeStrong((id *)&self->_iconData, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end