@interface NEDNSOverHTTPSSettings
+ (BOOL)supportsSecureCoding;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NEDNSOverHTTPSSettings)initWithCoder:(id)a3;
- (NSData)identityReference;
- (NSURL)serverURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)initFromLegacyDictionary:(id)a3;
- (int64_t)dnsProtocol;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentityReference:(NSData *)identityReference;
- (void)setServerURL:(NSURL *)serverURL;
@end

@implementation NEDNSOverHTTPSSettings

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identityReference, 0);

  objc_storeStrong((id *)&self->_serverURL, 0);
}

- (void)setIdentityReference:(NSData *)identityReference
{
}

- (NSData)identityReference
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

- (void)setServerURL:(NSURL *)serverURL
{
}

- (NSURL)serverURL
{
  return (NSURL *)objc_getProperty(self, a2, 56, 1);
}

- (id)initFromLegacyDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NEDNSOverHTTPSSettings;
  v5 = [(NEDNSSettings *)&v11 initFromLegacyDictionary:v4];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"ServerURL"];
    if (isa_nsstring(v6))
    {
      uint64_t v7 = [MEMORY[0x1E4F1CB10] URLWithString:v6];
      if (!v7)
      {

        v9 = 0;
        goto LABEL_7;
      }
      v8 = (void *)v5[7];
      v5[7] = v7;
    }
  }
  v9 = v5;
LABEL_7:

  return v9;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NEDNSOverHTTPSSettings;
  BOOL v5 = [(NEDNSSettings *)&v12 checkValidityAndCollectErrors:v4];
  v6 = [(NEDNSOverHTTPSSettings *)self serverURL];

  if (!v6)
  {
    v10 = @"Missing server URL";
    goto LABEL_5;
  }
  uint64_t v7 = [(NEDNSOverHTTPSSettings *)self serverURL];
  v8 = [v7 scheme];
  char v9 = [v8 isEqualToString:@"https"];

  if ((v9 & 1) == 0)
  {
    v10 = @"Server URL does not have HTTPS scheme";
LABEL_5:
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, v10, v4);
    BOOL v5 = 0;
  }

  return v5;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc(MEMORY[0x1E4F28E78]);
  v13.receiver = self;
  v13.super_class = (Class)NEDNSOverHTTPSSettings;
  v8 = [(NEDNSSettings *)&v13 descriptionWithIndent:v5 options:a4];
  char v9 = (void *)[v7 initWithString:v8];

  v10 = [(NEDNSOverHTTPSSettings *)self serverURL];
  [v9 appendPrettyObject:v10 withName:@"serverURL" andIndent:v5 options:a4];

  objc_super v11 = [(NEDNSOverHTTPSSettings *)self identityReference];
  [v9 appendPrettyObject:v11 withName:@"identityReference" andIndent:v5 options:a4];

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NEDNSOverHTTPSSettings;
  id v4 = [(NEDNSSettings *)&v8 copyWithZone:a3];
  uint64_t v5 = [(NEDNSOverHTTPSSettings *)self serverURL];
  [v4 setServerURL:v5];

  v6 = [(NEDNSOverHTTPSSettings *)self identityReference];
  [v4 setIdentityReference:v6];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NEDNSOverHTTPSSettings;
  id v4 = a3;
  [(NEDNSSettings *)&v7 encodeWithCoder:v4];
  uint64_t v5 = [(NEDNSOverHTTPSSettings *)self serverURL];
  [v4 encodeObject:v5 forKey:@"ServerURL"];

  v6 = [(NEDNSOverHTTPSSettings *)self identityReference];
  [v4 encodeObject:v6 forKey:@"IdentityReference"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)NEDNSOverHTTPSSettings;
  if ([(NEDNSOverHTTPSSettings *)&v17 isEqual:v4])
  {
    id v5 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = [(NEDNSOverHTTPSSettings *)self serverURL];
      objc_super v7 = [v5 serverURL];
      char v8 = [v6 isEqual:v7];
    }
    else
    {
      char v8 = 0;
    }
    v10 = [(NEDNSOverHTTPSSettings *)self identityReference];
    if (v10 || ([v5 identityReference], (v15 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      objc_super v11 = [(NEDNSOverHTTPSSettings *)self identityReference];
      if (v11)
      {
        objc_super v12 = [(NEDNSOverHTTPSSettings *)self identityReference];
        objc_super v13 = [v5 identityReference];
        int v14 = [v12 isEqualToData:v13] ^ 1;
      }
      else
      {
        LOBYTE(v14) = 0;
      }

      if (v10) {
        goto LABEL_15;
      }
      v15 = 0;
    }
    else
    {
      LOBYTE(v14) = 1;
    }

LABEL_15:
    char v9 = v8 & ~(_BYTE)v14;

    goto LABEL_16;
  }
  char v9 = 0;
LABEL_16:

  return v9;
}

- (NEDNSOverHTTPSSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NEDNSOverHTTPSSettings;
  id v5 = [(NEDNSSettings *)&v12 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"ServerURL"];
    serverURL = v5->_serverURL;
    v5->_serverURL = (NSURL *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"IdentityReference"];
    identityReference = v5->_identityReference;
    v5->_identityReference = (NSData *)v9;
  }
  return v5;
}

- (int64_t)dnsProtocol
{
  return 3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end