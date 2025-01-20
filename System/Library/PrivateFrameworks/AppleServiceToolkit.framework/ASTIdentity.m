@interface ASTIdentity
+ (ASTIdentity)identityWithIdentityAliases:(id)a3;
+ (ASTIdentity)identityWithSerialNumber:(id)a3;
+ (BOOL)supportsSecureCoding;
- (ASTIdentity)init;
- (ASTIdentity)initWithCoder:(id)a3;
- (ASTIdentity)initWithIdentityAliases:(id)a3;
- (NSArray)aliases;
- (NSArray)json;
- (NSString)hostAppBuild;
- (NSString)hostAppVersion;
- (id)_dictionariesFromIdentityAliases:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)userAgent;
- (void)encodeWithCoder:(id)a3;
- (void)setAliases:(id)a3;
- (void)setHostAppBuild:(id)a3;
- (void)setHostAppVersion:(id)a3;
- (void)setJson:(id)a3;
@end

@implementation ASTIdentity

- (ASTIdentity)init
{
  return [(ASTIdentity *)self initWithIdentityAliases:MEMORY[0x263EFFA68]];
}

- (ASTIdentity)initWithIdentityAliases:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ASTIdentity;
  v6 = [(ASTIdentity *)&v20 init];
  v7 = v6;
  if (v6)
  {
    v8 = [(ASTIdentity *)v6 _dictionariesFromIdentityAliases:v5];
    if ([MEMORY[0x263F08900] isValidJSONObject:v8])
    {
      objc_storeStrong((id *)&v7->_aliases, a3);
      objc_storeStrong((id *)&v7->_json, v8);
      v9 = [MEMORY[0x263F086E0] mainBundle];
      v10 = [v9 infoDictionary];
      uint64_t v11 = [v10 objectForKeyedSubscript:@"CFBundleShortVersionString"];
      v12 = (void *)v11;
      if (v11) {
        v13 = (__CFString *)v11;
      }
      else {
        v13 = @"unknown";
      }
      objc_storeStrong((id *)&v7->_hostAppVersion, v13);

      v14 = [MEMORY[0x263F086E0] mainBundle];
      v15 = [v14 infoDictionary];
      uint64_t v16 = [v15 objectForKeyedSubscript:@"CFBundleVersion"];
      v17 = (void *)v16;
      if (v16) {
        v18 = (__CFString *)v16;
      }
      else {
        v18 = @"unknown";
      }
      objc_storeStrong((id *)&v7->_hostAppBuild, v18);
    }
    else
    {
      v14 = v7;
      v7 = 0;
    }
  }
  return v7;
}

+ (ASTIdentity)identityWithIdentityAliases:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithIdentityAliases:v4];

  return (ASTIdentity *)v5;
}

+ (ASTIdentity)identityWithSerialNumber:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v4 = +[ASTIdentityAlias identityAliasWithSerialNumber:a3];
  id v5 = objc_alloc((Class)a1);
  v9[0] = v4;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  v7 = (void *)[v5 initWithIdentityAliases:v6];

  return (ASTIdentity *)v7;
}

- (id)userAgent
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __24__ASTIdentity_userAgent__block_invoke;
  block[3] = &unk_264E7D638;
  block[4] = self;
  if (userAgent_onceToken != -1) {
    dispatch_once(&userAgent_onceToken, block);
  }
  return (id)userAgent_userAgent;
}

void __24__ASTIdentity_userAgent__block_invoke(uint64_t a1)
{
  id v16 = (id)MGCopyAnswer();
  v2 = [v16 stringByReplacingOccurrencesOfString:@"." withString:@"_"];
  v3 = (void *)MGCopyAnswer();
  id v4 = [MEMORY[0x263F086E0] mainBundle];
  id v5 = [v4 infoDictionary];
  v6 = [v5 objectForKeyedSubscript:@"CFBundleExecutable"];
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    v9 = [MEMORY[0x263F08AB0] processInfo];
    id v8 = [v9 processName];
  }
  v10 = (void *)MGCopyAnswer();
  uint64_t v11 = (void *)MGCopyAnswer();
  v12 = NSString;
  v13 = [*(id *)(a1 + 32) hostAppVersion];
  objc_msgSend(v12, "stringWithFormat:", @"AST/%@ (%@; CPU %@ %@ like Mac OS X) Version/%@ Mobile/%@ %@/%@",
    @"1.6",
    v10,
    v11,
    v2,
    v16,
    v3,
    v8,
  uint64_t v14 = v13);
  v15 = (void *)userAgent_userAgent;
  userAgent_userAgent = v14;
}

- (ASTIdentity)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ASTIdentity;
  id v5 = [(ASTIdentity *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hostAppVersion"];
    hostAppVersion = v5->_hostAppVersion;
    v5->_hostAppVersion = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hostAppBuild"];
    hostAppBuild = v5->_hostAppBuild;
    v5->_hostAppBuild = (NSString *)v8;

    v10 = (void *)MEMORY[0x263EFFA08];
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v10, "setWithObjects:", v11, v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"aliases"];
    aliases = v5->_aliases;
    v5->_aliases = (NSArray *)v14;

    id v16 = [(ASTIdentity *)v5 _dictionariesFromIdentityAliases:v5->_aliases];
    if ([MEMORY[0x263F08900] isValidJSONObject:v16])
    {
      objc_storeStrong((id *)&v5->_json, v16);
    }
    else
    {

      id v5 = 0;
    }
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ASTIdentity *)self hostAppVersion];
  [v4 encodeObject:v5 forKey:@"hostAppVersion"];

  uint64_t v6 = [(ASTIdentity *)self hostAppBuild];
  [v4 encodeObject:v6 forKey:@"hostAppBuild"];

  id v7 = [(ASTIdentity *)self aliases];
  [v4 encodeObject:v7 forKey:@"aliases"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_hostAppVersion copyWithZone:a3];
  id v7 = (void *)v5[3];
  v5[3] = v6;

  uint64_t v8 = [(NSString *)self->_hostAppBuild copyWithZone:a3];
  v9 = (void *)v5[4];
  v5[4] = v8;

  uint64_t v10 = [(NSArray *)self->_aliases copyWithZone:a3];
  uint64_t v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (id)_dictionariesFromIdentityAliases:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "dictionary", (void)v12);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (NSArray)aliases
{
  return self->_aliases;
}

- (void)setAliases:(id)a3
{
}

- (NSArray)json
{
  return self->_json;
}

- (void)setJson:(id)a3
{
}

- (NSString)hostAppVersion
{
  return self->_hostAppVersion;
}

- (void)setHostAppVersion:(id)a3
{
}

- (NSString)hostAppBuild
{
  return self->_hostAppBuild;
}

- (void)setHostAppBuild:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostAppBuild, 0);
  objc_storeStrong((id *)&self->_hostAppVersion, 0);
  objc_storeStrong((id *)&self->_json, 0);

  objc_storeStrong((id *)&self->_aliases, 0);
}

@end