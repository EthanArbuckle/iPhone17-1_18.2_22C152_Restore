@interface NEVPNProtocolPPP
+ (BOOL)supportsSecureCoding;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (BOOL)setServiceProtocolsInService:(__SCNetworkService *)a3;
- (BOOL)updateWithServiceProtocolsFromService:(__SCNetworkService *)a3;
- (BOOL)verboseLoggingEnabled;
- (NEIPv4Settings)IPv4Settings;
- (NEIPv6Settings)IPv6Settings;
- (NEVPNProtocolPPP)initWithCoder:(id)a3;
- (NEVPNProtocolPPP)initWithType:(int64_t)a3;
- (id)copyLegacyDictionary;
- (id)copyLegacyDictionaryComplete:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)initFromLegacyDictionary:(id)a3;
- (int64_t)authenticationMethod;
- (void)encodeWithCoder:(id)a3;
- (void)setAuthenticationMethod:(int64_t)a3;
- (void)setIPv4Settings:(id)a3;
- (void)setIPv6Settings:(id)a3;
- (void)setVerboseLoggingEnabled:(BOOL)a3;
@end

@implementation NEVPNProtocolPPP

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_IPv6Settings, 0);

  objc_storeStrong((id *)&self->_IPv4Settings, 0);
}

- (void)setIPv6Settings:(id)a3
{
}

- (NEIPv6Settings)IPv6Settings
{
  return (NEIPv6Settings *)objc_getProperty(self, a2, 200, 1);
}

- (void)setIPv4Settings:(id)a3
{
}

- (NEIPv4Settings)IPv4Settings
{
  return (NEIPv4Settings *)objc_getProperty(self, a2, 192, 1);
}

- (void)setVerboseLoggingEnabled:(BOOL)a3
{
  self->_verboseLoggingEnabled = a3;
}

- (BOOL)verboseLoggingEnabled
{
  return self->_verboseLoggingEnabled;
}

- (void)setAuthenticationMethod:(int64_t)a3
{
  self->_authenticationMethod = a3;
}

- (int64_t)authenticationMethod
{
  return self->_authenticationMethod;
}

- (BOOL)updateWithServiceProtocolsFromService:(__SCNetworkService *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)NEVPNProtocolPPP;
  BOOL v5 = -[NEVPNProtocol updateWithServiceProtocolsFromService:](&v13, sel_updateWithServiceProtocolsFromService_);
  if (v5)
  {
    CFDictionaryRef v6 = +[NEConfiguration copyConfigurationForProtocol:inService:]((uint64_t)NEConfiguration, (const __CFString *)*MEMORY[0x1E4F41B88], a3);
    if (v6)
    {
      CFDictionaryRef v7 = v6;
      id v8 = [[NEIPv4Settings alloc] initFromLegacyDictionary:v6];
      [(NEVPNProtocolPPP *)self setIPv4Settings:v8];

      CFRelease(v7);
    }
    CFDictionaryRef v9 = +[NEConfiguration copyConfigurationForProtocol:inService:]((uint64_t)NEConfiguration, (const __CFString *)*MEMORY[0x1E4F41B90], a3);
    if (v9)
    {
      CFDictionaryRef v10 = v9;
      id v11 = [[NEIPv6Settings alloc] initFromLegacyDictionary:v9];
      [(NEVPNProtocolPPP *)self setIPv6Settings:v11];

      CFRelease(v10);
    }
  }
  return v5;
}

- (BOOL)setServiceProtocolsInService:(__SCNetworkService *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)NEVPNProtocolPPP;
  if (!-[NEVPNProtocol setServiceProtocolsInService:](&v13, sel_setServiceProtocolsInService_)) {
    return 0;
  }
  BOOL v5 = [(NEVPNProtocolPPP *)self IPv4Settings];

  if (v5)
  {
    CFDictionaryRef v6 = [(NEVPNProtocolPPP *)self IPv4Settings];
    BOOL v5 = (void *)[v6 copyLegacyDictionary];
  }
  int v7 = +[NEConfiguration setConfiguration:forProtocol:inService:]((uint64_t)NEConfiguration, (const __CFDictionary *)v5, (const __CFString *)*MEMORY[0x1E4F41B88], a3);
  if (v5) {
    CFRelease(v5);
  }
  if (!v7) {
    return 0;
  }
  id v8 = [(NEVPNProtocolPPP *)self IPv6Settings];

  if (v8)
  {
    CFDictionaryRef v9 = [(NEVPNProtocolPPP *)self IPv6Settings];
    CFDictionaryRef v10 = (const __CFDictionary *)[v9 copyLegacyDictionary];
  }
  else
  {
    CFDictionaryRef v10 = 0;
  }
  char v11 = +[NEConfiguration setConfiguration:forProtocol:inService:]((uint64_t)NEConfiguration, v10, (const __CFString *)*MEMORY[0x1E4F41B90], a3);
  if (v10) {
    CFRelease(v10);
  }
  return v11;
}

- (id)initFromLegacyDictionary:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 objectForKeyedSubscript:@"__NEVPNProtocolIdentifier"];
  int v6 = isa_nsuuid(v5);

  if (v6)
  {
    int v7 = [v4 objectForKeyedSubscript:@"__NEVPNProtocolIdentifier"];
    id v8 = [(NEVPNProtocol *)self initWithProtocolIdentifier:v7];

    if (!v8) {
      goto LABEL_25;
    }
  }
  else
  {
    id v8 = [(NEVPNProtocolPPP *)self init];
    if (!v8) {
      goto LABEL_25;
    }
  }
  CFDictionaryRef v9 = [v4 objectForKeyedSubscript:@"__NEVPNKeychainDomain"];
  int v10 = isa_nsnumber(v9);

  if (v10)
  {
    char v11 = [v4 objectForKeyedSubscript:@"__NEVPNKeychainDomain"];
    v8->super._int64_t keychainDomain = (int)[v11 intValue];
  }
  uint64_t v12 = *MEMORY[0x1E4F41D98];
  objc_super v13 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41D98]];
  int v14 = isa_nsstring(v13);

  if (v14)
  {
    v15 = [v4 objectForKeyedSubscript:v12];
    [(NEVPNProtocol *)v8 setServerAddress:v15];
  }
  uint64_t v16 = *MEMORY[0x1E4F41D58];
  v17 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41D58]];
  int v18 = isa_nsstring(v17);

  if (v18)
  {
    v19 = [v4 objectForKeyedSubscript:v16];
    [(NEVPNProtocol *)v8 setUsername:v19];
  }
  v8->_authenticationMethod = 1;
  uint64_t v20 = *MEMORY[0x1E4F41D60];
  v21 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41D60]];
  int v22 = isa_nsstring(v21);

  if (v22)
  {
    v23 = [NEKeychainItem alloc];
    v24 = [v4 objectForKeyedSubscript:v20];
    int64_t keychainDomain = v8->super._keychainDomain;
    id v27 = objc_getProperty(v8, v26, 88, 1);
    v28 = [(NEKeychainItem *)v23 initWithLegacyIdentifier:v24 domain:keychainDomain accessGroup:v27];
    [(NEVPNProtocol *)v8 setPasswordKeychainItem:v28];
    goto LABEL_13;
  }
  v24 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41D70]];
  if (!isa_nsarray(v24) || ![v24 containsObject:*MEMORY[0x1E4F420E8]]) {
    goto LABEL_22;
  }
  id v27 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41D50]];
  if (isa_nsarray(v27) && [v27 count])
  {
    v28 = [v27 objectAtIndexedSubscript:0];
    if (isa_nsstring(v28))
    {
      if ([(NEKeychainItem *)v28 isEqualToString:@"EAP-RSA"])
      {
        uint64_t v29 = 2;
      }
      else if ([(NEKeychainItem *)v28 isEqualToString:@"EAP-TLS"])
      {
        uint64_t v29 = 3;
      }
      else
      {
        if (![(NEKeychainItem *)v28 isEqualToString:@"EAP-KRB"]) {
          goto LABEL_13;
        }
        uint64_t v29 = 4;
      }
      v8->_authenticationMethod = v29;
    }
LABEL_13:
  }
LABEL_22:

  uint64_t v30 = *MEMORY[0x1E4F41DE0];
  v31 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41DE0]];
  int v32 = isa_nsnumber(v31);

  if (v32)
  {
    v33 = [v4 objectForKeyedSubscript:v30];
    v8->_verboseLoggingEnabled = [v33 BOOLValue];
  }
  [(NEVPNProtocol *)v8 initDisconnectOptions:v4];
LABEL_25:

  return v8;
}

- (id)copyLegacyDictionaryComplete:(BOOL)a3
{
  BOOL v3 = a3;
  v27[1] = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  int v6 = [(NEVPNProtocol *)self serverAddress];

  if (v6)
  {
    int v7 = [(NEVPNProtocol *)self serverAddress];
    [v5 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F41D98]];
  }
  id v8 = [(NEVPNProtocol *)self username];

  if (v8)
  {
    CFDictionaryRef v9 = [(NEVPNProtocol *)self username];
    [v5 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F41D58]];
  }
  if ([(NEVPNProtocolPPP *)self authenticationMethod] == 1
    && ([(NEVPNProtocol *)self passwordKeychainItem],
        int v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        v10))
  {
    char v11 = [(NEVPNProtocol *)self passwordKeychainItem];
    uint64_t v12 = [v11 password];

    objc_super v13 = [(NEVPNProtocol *)self passwordKeychainItem];
    int v14 = v13;
    if (v12)
    {
      uint64_t v15 = [v13 password];
    }
    else
    {
      v21 = [v13 identifier];

      if (!v21) {
        goto LABEL_22;
      }
      int v14 = [(NEVPNProtocol *)self passwordKeychainItem];
      uint64_t v15 = [v14 identifier];
    }
    int v22 = (void *)v15;

    if (v22)
    {
      [v5 setObject:v22 forKeyedSubscript:*MEMORY[0x1E4F41D60]];
      [v5 setObject:*MEMORY[0x1E4F420E0] forKeyedSubscript:*MEMORY[0x1E4F41D68]];
    }
  }
  else
  {
    if ([(NEVPNProtocolPPP *)self authenticationMethod] == 2)
    {
      v27[0] = *MEMORY[0x1E4F420E8];
      uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
      [v5 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F41D70]];

      v17 = (__CFString *)*MEMORY[0x1E4F41D50];
      int v18 = &unk_1EF08D420;
    }
    else if ([(NEVPNProtocolPPP *)self authenticationMethod] == 3)
    {
      uint64_t v26 = *MEMORY[0x1E4F420E8];
      v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
      [v5 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F41D70]];

      v17 = (__CFString *)*MEMORY[0x1E4F41D50];
      int v18 = &unk_1EF08D438;
    }
    else if ([(NEVPNProtocolPPP *)self authenticationMethod] == 4)
    {
      uint64_t v25 = *MEMORY[0x1E4F420E8];
      uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
      [v5 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F41D70]];

      v17 = (__CFString *)*MEMORY[0x1E4F41D50];
      int v18 = &unk_1EF08D450;
    }
    else
    {
      if ([(NEVPNProtocolPPP *)self authenticationMethod] != 5) {
        goto LABEL_22;
      }
      int v18 = &unk_1EF08D2D0;
      v17 = @"TokenCard";
    }
    [v5 setObject:v18 forKeyedSubscript:v17];
  }
LABEL_22:
  if (v3)
  {
    if ([(NEVPNProtocolPPP *)self verboseLoggingEnabled]) {
      v23 = &unk_1EF08D2D0;
    }
    else {
      v23 = &unk_1EF08D2E8;
    }
    [v5 setObject:v23 forKeyedSubscript:*MEMORY[0x1E4F41DE0]];
    [(NEVPNProtocol *)self addDisconnectOptions:v5];
    [v5 setObject:&unk_1EF08D2D0 forKeyedSubscript:*MEMORY[0x1E4F41D48]];
    [v5 setObject:&unk_1EF08D2E8 forKeyedSubscript:*MEMORY[0x1E4F41D78]];
    [v5 setObject:&unk_1EF08D2D0 forKeyedSubscript:*MEMORY[0x1E4F41D80]];
    [v5 setObject:&unk_1EF08D2E8 forKeyedSubscript:*MEMORY[0x1E4F41D88]];
    [v5 setObject:&unk_1EF08D300 forKeyedSubscript:*MEMORY[0x1E4F41D90]];
    [v5 setObject:&unk_1EF08D2E8 forKeyedSubscript:*MEMORY[0x1E4F41DA0]];
    [v5 setObject:&unk_1EF08D2E8 forKeyedSubscript:*MEMORY[0x1E4F41DA8]];
    [v5 setObject:&unk_1EF08D2E8 forKeyedSubscript:*MEMORY[0x1E4F41DB0]];
    [v5 setObject:&unk_1EF08D2E8 forKeyedSubscript:*MEMORY[0x1E4F41DB8]];
    [v5 setObject:&unk_1EF08D318 forKeyedSubscript:*MEMORY[0x1E4F41DC0]];
    [v5 setObject:&unk_1EF08D2D0 forKeyedSubscript:*MEMORY[0x1E4F41DC8]];
    [v5 setObject:&unk_1EF08D330 forKeyedSubscript:*MEMORY[0x1E4F41DD0]];
    [v5 setObject:&unk_1EF08D348 forKeyedSubscript:*MEMORY[0x1E4F41DD8]];
    [v5 setObject:@"/var/log/ppp.log" forKeyedSubscript:@"Logfile"];
  }
  return v5;
}

- (id)copyLegacyDictionary
{
  return [(NEVPNProtocolPPP *)self copyLegacyDictionaryComplete:1];
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc(MEMORY[0x1E4F28E78]);
  v13.receiver = self;
  v13.super_class = (Class)NEVPNProtocolPPP;
  id v8 = [(NEVPNProtocol *)&v13 descriptionWithIndent:v5 options:a4];
  CFDictionaryRef v9 = (void *)[v7 initWithString:v8];

  objc_msgSend(v9, "appendPrettyInt:withName:andIndent:options:", -[NEVPNProtocolPPP authenticationMethod](self, "authenticationMethod"), @"authenticationMethod", v5, a4);
  objc_msgSend(v9, "appendPrettyBOOL:withName:andIndent:options:", -[NEVPNProtocolPPP verboseLoggingEnabled](self, "verboseLoggingEnabled"), @"verboseLoggingEnabled", v5, a4);
  int v10 = [(NEVPNProtocolPPP *)self IPv4Settings];
  [v9 appendPrettyObject:v10 withName:@"IPv4Settings" andIndent:v5 options:a4];

  char v11 = [(NEVPNProtocolPPP *)self IPv6Settings];
  [v9 appendPrettyObject:v11 withName:@"IPv6Settings" andIndent:v5 options:a4];

  return v9;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)NEVPNProtocolPPP;
  if (objc_msgSend(-[NEVPNProtocolPPP class](&v17, sel_class), "instancesRespondToSelector:", sel_checkValidityAndCollectErrors_))
  {
    v16.receiver = self;
    v16.super_class = (Class)NEVPNProtocolPPP;
    unsigned __int8 v5 = [(NEVPNProtocol *)&v16 checkValidityAndCollectErrors:v4];
  }
  else
  {
    unsigned __int8 v5 = 1;
  }
  uint64_t v6 = [(NEVPNProtocolPPP *)self IPv4Settings];
  if (v6)
  {
    id v7 = (void *)v6;
    id v8 = [(NEVPNProtocolPPP *)self IPv4Settings];
    char v9 = [v8 checkValidityAndCollectErrors:v4];

    v5 &= v9;
  }
  uint64_t v10 = [(NEVPNProtocolPPP *)self IPv6Settings];
  if (v10)
  {
    char v11 = (void *)v10;
    uint64_t v12 = [(NEVPNProtocolPPP *)self IPv6Settings];
    char v13 = [v12 checkValidityAndCollectErrors:v4];

    v5 &= v13;
  }
  if ([(NEVPNProtocolPPP *)self authenticationMethod] == 3)
  {
    int v14 = [(NEVPNProtocol *)self identityReferenceInternal];

    if (!v14)
    {
      +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Missing identity", v4);
      unsigned __int8 v5 = 0;
    }
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NEVPNProtocolPPP;
  id v4 = [(NEVPNProtocol *)&v8 copyWithZone:a3];
  objc_msgSend(v4, "setAuthenticationMethod:", -[NEVPNProtocolPPP authenticationMethod](self, "authenticationMethod"));
  objc_msgSend(v4, "setVerboseLoggingEnabled:", -[NEVPNProtocolPPP verboseLoggingEnabled](self, "verboseLoggingEnabled"));
  unsigned __int8 v5 = [(NEVPNProtocolPPP *)self IPv4Settings];
  [v4 setIPv4Settings:v5];

  uint64_t v6 = [(NEVPNProtocolPPP *)self IPv6Settings];
  [v4 setIPv6Settings:v6];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NEVPNProtocolPPP;
  id v4 = a3;
  [(NEVPNProtocol *)&v7 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt32:forKey:", -[NEVPNProtocolPPP authenticationMethod](self, "authenticationMethod", v7.receiver, v7.super_class), @"AuthenticationMethod");
  objc_msgSend(v4, "encodeBool:forKey:", -[NEVPNProtocolPPP verboseLoggingEnabled](self, "verboseLoggingEnabled"), @"VerboseLoggingEnabled");
  unsigned __int8 v5 = [(NEVPNProtocolPPP *)self IPv4Settings];
  [v4 encodeObject:v5 forKey:@"IPv4Settings"];

  uint64_t v6 = [(NEVPNProtocolPPP *)self IPv6Settings];
  [v4 encodeObject:v6 forKey:@"IPv6Settings"];
}

- (NEVPNProtocolPPP)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NEVPNProtocolPPP;
  unsigned __int8 v5 = [(NEVPNProtocol *)&v11 initWithCoder:v4];
  if (v5)
  {
    v5->_authenticationMethod = (int)[v4 decodeInt32ForKey:@"AuthenticationMethod"];
    v5->_verboseLoggingEnabled = [v4 decodeBoolForKey:@"VerboseLoggingEnabled"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"IPv4Settings"];
    IPv4Settings = v5->_IPv4Settings;
    v5->_IPv4Settings = (NEIPv4Settings *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"IPv6Settings"];
    IPv6Settings = v5->_IPv6Settings;
    v5->_IPv6Settings = (NEIPv6Settings *)v8;
  }
  return v5;
}

- (NEVPNProtocolPPP)initWithType:(int64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)NEVPNProtocolPPP;
  BOOL v3 = [(NEVPNProtocol *)&v10 initWithType:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_authenticationMethod = 1;
    unsigned __int8 v5 = [[NEIPv4Settings alloc] initWithConfigMethod:2];
    IPv4Settings = v4->_IPv4Settings;
    v4->_IPv4Settings = v5;

    objc_super v7 = [[NEIPv6Settings alloc] initWithConfigMethod:1];
    IPv6Settings = v4->_IPv6Settings;
    v4->_IPv6Settings = v7;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end