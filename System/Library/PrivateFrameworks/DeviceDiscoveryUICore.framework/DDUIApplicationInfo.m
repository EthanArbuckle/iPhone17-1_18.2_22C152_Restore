@interface DDUIApplicationInfo
- (DDUIApplicationInfo)initWithApplicationID:(id)a3 serviceIdentifier:(id)a4 bundleID:(id)a5 appName:(id)a6 adamID:(unint64_t)a7;
- (DDUIApplicationInfo)initWithDictionaryRepresentation:(id)a3;
- (NSString)appName;
- (NSString)applicationID;
- (NSString)bundleID;
- (NSString)bundleIDPrefixedServiceIdentifier;
- (NSString)serviceIdentifier;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)adamID;
@end

@implementation DDUIApplicationInfo

- (DDUIApplicationInfo)initWithApplicationID:(id)a3 serviceIdentifier:(id)a4 bundleID:(id)a5 appName:(id)a6 adamID:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = v15;
  v17 = 0;
  if (v12 && v14 && v15)
  {
    v22.receiver = self;
    v22.super_class = (Class)DDUIApplicationInfo;
    v18 = [(DDUIApplicationInfo *)&v22 init];
    v19 = v18;
    if (v18)
    {
      objc_storeStrong((id *)&v18->_applicationID, a3);
      objc_storeStrong((id *)&v19->_serviceIdentifier, a4);
      objc_storeStrong((id *)&v19->_bundleID, a5);
      objc_storeStrong((id *)&v19->_appName, a6);
      v19->_adamID = a7;
    }
    self = v19;
    v17 = self;
  }

  return v17;
}

- (DDUIApplicationInfo)initWithDictionaryRepresentation:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [v4 objectForKeyedSubscript:@"DDUIMessageApplicationIDKey"];
    v6 = [v4 objectForKeyedSubscript:@"DDUIMessageServiceIDKey"];
    v7 = [v4 objectForKeyedSubscript:@"DDUIMessageBundleIDKey"];
    v8 = [v4 objectForKeyedSubscript:@"DDUIMessageAppNameKey"];
    v9 = [v4 objectForKeyedSubscript:@"DDUIMessageAdamIDKey"];

    self = -[DDUIApplicationInfo initWithApplicationID:serviceIdentifier:bundleID:appName:adamID:](self, "initWithApplicationID:serviceIdentifier:bundleID:appName:adamID:", v5, v6, v7, v8, [v9 unsignedLongLongValue]);
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)dictionaryRepresentation
{
  v11[5] = *MEMORY[0x1E4F143B8];
  v10[0] = @"DDUIMessageApplicationIDKey";
  v3 = [(DDUIApplicationInfo *)self applicationID];
  v11[0] = v3;
  v10[1] = @"DDUIMessageServiceIDKey";
  id v4 = [(DDUIApplicationInfo *)self serviceIdentifier];
  v11[1] = v4;
  v10[2] = @"DDUIMessageBundleIDKey";
  v5 = [(DDUIApplicationInfo *)self bundleID];
  v11[2] = v5;
  v10[3] = @"DDUIMessageAppNameKey";
  v6 = [(DDUIApplicationInfo *)self appName];
  v11[3] = v6;
  v10[4] = @"DDUIMessageAdamIDKey";
  v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[DDUIApplicationInfo adamID](self, "adamID"));
  v11[4] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:5];

  return v8;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; applicationID = \"%@\"; serviceIdentifier = \"%@\"; bundleID = \"%@\"; appName = \"%@\"; adamID = %llu>",
               objc_opt_class(),
               self,
               self->_applicationID,
               self->_serviceIdentifier,
               self->_bundleID,
               self->_appName,
               self->_adamID);
}

- (NSString)bundleIDPrefixedServiceIdentifier
{
  return (NSString *)[NSString stringWithFormat:@"%@.%@", self->_bundleID, self->_serviceIdentifier];
}

- (NSString)applicationID
{
  return self->_applicationID;
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)appName
{
  return self->_appName;
}

- (unint64_t)adamID
{
  return self->_adamID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationID, 0);
}

@end