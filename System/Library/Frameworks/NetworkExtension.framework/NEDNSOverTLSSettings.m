@interface NEDNSOverTLSSettings
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NEDNSOverTLSSettings)initWithCoder:(id)a3;
- (NSData)identityReference;
- (NSString)serverName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)initFromLegacyDictionary:(id)a3;
- (int64_t)dnsProtocol;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentityReference:(NSData *)identityReference;
- (void)setServerName:(NSString *)serverName;
@end

@implementation NEDNSOverTLSSettings

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identityReference, 0);

  objc_storeStrong((id *)&self->_serverName, 0);
}

- (void)setIdentityReference:(NSData *)identityReference
{
}

- (NSData)identityReference
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

- (void)setServerName:(NSString *)serverName
{
}

- (NSString)serverName
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (id)initFromLegacyDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NEDNSOverTLSSettings;
  v5 = [(NEDNSSettings *)&v10 initFromLegacyDictionary:v4];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"ServerName"];
    if (!isa_nsstring(v6))
    {

      v8 = 0;
      goto LABEL_6;
    }
    v7 = (void *)v5[7];
    v5[7] = v6;
  }
  v8 = v5;
LABEL_6:

  return v8;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc(MEMORY[0x1E4F28E78]);
  v13.receiver = self;
  v13.super_class = (Class)NEDNSOverTLSSettings;
  v8 = [(NEDNSSettings *)&v13 descriptionWithIndent:v5 options:a4];
  v9 = (void *)[v7 initWithString:v8];

  objc_super v10 = [(NEDNSOverTLSSettings *)self serverName];
  [v9 appendPrettyObject:v10 withName:@"serverName" andIndent:v5 options:a4];

  v11 = [(NEDNSOverTLSSettings *)self identityReference];
  [v9 appendPrettyObject:v11 withName:@"identityReference" andIndent:v5 options:a4];

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NEDNSOverTLSSettings;
  id v4 = [(NEDNSSettings *)&v8 copyWithZone:a3];
  uint64_t v5 = [(NEDNSOverTLSSettings *)self serverName];
  [v4 setServerName:v5];

  v6 = [(NEDNSOverTLSSettings *)self identityReference];
  [v4 setIdentityReference:v6];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NEDNSOverTLSSettings;
  id v4 = a3;
  [(NEDNSSettings *)&v7 encodeWithCoder:v4];
  uint64_t v5 = [(NEDNSOverTLSSettings *)self serverName];
  [v4 encodeObject:v5 forKey:@"ServerName"];

  v6 = [(NEDNSOverTLSSettings *)self identityReference];
  [v4 encodeObject:v6 forKey:@"IdentityReference"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)NEDNSOverTLSSettings;
  if ([(NEDNSOverTLSSettings *)&v17 isEqual:v4])
  {
    id v5 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = [(NEDNSOverTLSSettings *)self serverName];
      objc_super v7 = [v5 serverName];
      char v8 = [v6 isEqualToString:v7];
    }
    else
    {
      char v8 = 0;
    }
    objc_super v10 = [(NEDNSOverTLSSettings *)self identityReference];
    if (v10 || ([v5 identityReference], (v15 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v11 = [(NEDNSOverTLSSettings *)self identityReference];
      if (v11)
      {
        v12 = [(NEDNSOverTLSSettings *)self identityReference];
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

- (NEDNSOverTLSSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NEDNSOverTLSSettings;
  id v5 = [(NEDNSSettings *)&v12 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"ServerName"];
    serverName = v5->_serverName;
    v5->_serverName = (NSString *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"IdentityReference"];
    identityReference = v5->_identityReference;
    v5->_identityReference = (NSData *)v9;
  }
  return v5;
}

- (int64_t)dnsProtocol
{
  return 2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end