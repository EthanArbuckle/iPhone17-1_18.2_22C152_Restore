@interface SKCloudServiceSetupReloadContext
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)queryItems;
- (NSDictionary)userInfo;
- (NSString)action;
- (NSString)serializedUserInfo;
- (NSString)sourceApplicationBundleIdentifier;
- (NSURL)cloudServiceSetupURL;
- (NSURL)referrerURL;
- (SKCloudServiceSetupReloadContext)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAction:(id)a3;
- (void)setCloudServiceSetupURL:(id)a3;
- (void)setQueryItems:(id)a3;
- (void)setReferrerURL:(id)a3;
- (void)setSourceApplicationBundleIdentifier:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation SKCloudServiceSetupReloadContext

- (NSDictionary)userInfo
{
  userInfo = self->_userInfo;
  if (!userInfo)
  {
    v4 = [(NSString *)self->_serializedUserInfo dataUsingEncoding:4];
    if (v4)
    {
      v5 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v4 options:0 error:0];
      v6 = self->_userInfo;
      self->_userInfo = v5;
    }
    userInfo = self->_userInfo;
  }

  return userInfo;
}

- (void)setUserInfo:(id)a3
{
  id v4 = a3;
  id v12 = v4;
  if (v4)
  {
    v5 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v4 options:0 error:0];
    if (v5) {
      v6 = (NSString *)[[NSString alloc] initWithData:v5 encoding:4];
    }
    else {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  serializedUserInfo = self->_serializedUserInfo;
  if (serializedUserInfo != v6 && ![(NSString *)serializedUserInfo isEqualToString:v6])
  {
    v8 = (NSString *)[(NSString *)v6 copy];
    v9 = self->_serializedUserInfo;
    self->_serializedUserInfo = v8;

    v10 = (NSDictionary *)[v12 copy];
    userInfo = self->_userInfo;
    self->_userInfo = v10;
  }
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: %p", v5, self];

  if (self->_cloudServiceSetupURL) {
    [v6 appendFormat:@"; cloudServiceSetupURL = %@", self->_cloudServiceSetupURL];
  }
  if (self->_action) {
    [v6 appendFormat:@"; action = %@", self->_action];
  }
  if ([(NSArray *)self->_queryItems count]) {
    [v6 appendFormat:@"; has queryItems"];
  }
  if (self->_sourceApplicationBundleIdentifier) {
    objc_msgSend(v6, "appendFormat:", @"; sourceApplicationBundleIdentifier = \"%@\"",
  }
      self->_sourceApplicationBundleIdentifier);
  if (self->_referrerURL) {
    [v6 appendFormat:@"; referrerURL = %@", self->_referrerURL];
  }
  if (self->_serializedUserInfo) {
    [v6 appendFormat:@"; has userInfo"];
  }
  [v6 appendString:@">"];

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSURL *)self->_cloudServiceSetupURL hash];
  NSUInteger v4 = [(NSString *)self->_action hash] ^ v3;
  uint64_t v5 = [(NSArray *)self->_queryItems hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_sourceApplicationBundleIdentifier hash];
  uint64_t v7 = [(NSURL *)self->_referrerURL hash];
  return v6 ^ v7 ^ [(NSString *)self->_serializedUserInfo hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (SKCloudServiceSetupReloadContext *)a3;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      cloudServiceSetupURL = self->_cloudServiceSetupURL;
      if ((cloudServiceSetupURL == v5->_cloudServiceSetupURL
         || -[NSURL isEqual:](cloudServiceSetupURL, "isEqual:"))
        && ((action = self->_action, action == v5->_action) || -[NSString isEqualToString:](action, "isEqualToString:"))
        && ((queryItems = self->_queryItems, queryItems == v5->_queryItems)
         || -[NSArray isEqualToArray:](queryItems, "isEqualToArray:"))
        && ((sourceApplicationBundleIdentifier = self->_sourceApplicationBundleIdentifier,
             sourceApplicationBundleIdentifier == v5->_sourceApplicationBundleIdentifier)
         || -[NSString isEqualToString:](sourceApplicationBundleIdentifier, "isEqualToString:"))
        && ((referrerURL = self->_referrerURL, referrerURL == v5->_referrerURL)
         || -[NSURL isEqual:](referrerURL, "isEqual:")))
      {
        serializedUserInfo = self->_serializedUserInfo;
        if (serializedUserInfo == v5->_serializedUserInfo) {
          char v12 = 1;
        }
        else {
          char v12 = -[NSString isEqualToString:](serializedUserInfo, "isEqualToString:");
        }
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSUInteger v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  objc_storeStrong(v4 + 2, self->_cloudServiceSetupURL);
  objc_storeStrong(v4 + 3, self->_action);
  uint64_t v5 = [(NSArray *)self->_queryItems copy];
  id v6 = v4[4];
  v4[4] = (id)v5;

  uint64_t v7 = [(NSString *)self->_sourceApplicationBundleIdentifier copy];
  id v8 = v4[5];
  v4[5] = (id)v7;

  objc_storeStrong(v4 + 6, self->_referrerURL);
  uint64_t v9 = [(NSString *)self->_serializedUserInfo copy];
  id v10 = v4[7];
  v4[7] = (id)v9;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKCloudServiceSetupReloadContext)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SKCloudServiceSetupReloadContext *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cloudServiceSetupURL"];
    cloudServiceSetupURL = v5->_cloudServiceSetupURL;
    v5->_cloudServiceSetupURL = (NSURL *)v6;

    id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"action"];
    uint64_t v9 = [v8 copy];
    action = v5->_action;
    v5->_action = (NSString *)v9;

    v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v14 = [v4 decodeObjectOfClasses:v13 forKey:@"queryItems"];
    uint64_t v15 = [v14 copy];
    queryItems = v5->_queryItems;
    v5->_queryItems = (NSArray *)v15;

    v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceApplicationBundleIdentifier"];
    uint64_t v18 = [v17 copy];
    sourceApplicationBundleIdentifier = v5->_sourceApplicationBundleIdentifier;
    v5->_sourceApplicationBundleIdentifier = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"referrerURL"];
    referrerURL = v5->_referrerURL;
    v5->_referrerURL = (NSURL *)v20;

    v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serializedUserInfo"];
    uint64_t v23 = [v22 copy];
    serializedUserInfo = v5->_serializedUserInfo;
    v5->_serializedUserInfo = (NSString *)v23;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  cloudServiceSetupURL = self->_cloudServiceSetupURL;
  id v5 = a3;
  [v5 encodeObject:cloudServiceSetupURL forKey:@"cloudServiceSetupURL"];
  [v5 encodeObject:self->_action forKey:@"action"];
  [v5 encodeObject:self->_queryItems forKey:@"queryItems"];
  [v5 encodeObject:self->_sourceApplicationBundleIdentifier forKey:@"sourceApplicationBundleIdentifier"];
  [v5 encodeObject:self->_referrerURL forKey:@"referrerURL"];
  [v5 encodeObject:self->_serializedUserInfo forKey:@"serializedUserInfo"];
}

- (NSURL)cloudServiceSetupURL
{
  return self->_cloudServiceSetupURL;
}

- (void)setCloudServiceSetupURL:(id)a3
{
}

- (NSString)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (NSArray)queryItems
{
  return self->_queryItems;
}

- (void)setQueryItems:(id)a3
{
}

- (NSString)sourceApplicationBundleIdentifier
{
  return self->_sourceApplicationBundleIdentifier;
}

- (void)setSourceApplicationBundleIdentifier:(id)a3
{
}

- (NSURL)referrerURL
{
  return self->_referrerURL;
}

- (void)setReferrerURL:(id)a3
{
}

- (NSString)serializedUserInfo
{
  return self->_serializedUserInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedUserInfo, 0);
  objc_storeStrong((id *)&self->_referrerURL, 0);
  objc_storeStrong((id *)&self->_sourceApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_queryItems, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_cloudServiceSetupURL, 0);

  objc_storeStrong((id *)&self->_userInfo, 0);
}

@end