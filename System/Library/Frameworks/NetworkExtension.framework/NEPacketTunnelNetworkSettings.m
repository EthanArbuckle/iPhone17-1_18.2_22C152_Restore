@interface NEPacketTunnelNetworkSettings
+ (BOOL)supportsSecureCoding;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (NEIPv4Settings)IPv4Settings;
- (NEIPv6Settings)IPv6Settings;
- (NEPacketTunnelNetworkSettings)initWithCoder:(id)a3;
- (NSNumber)MTU;
- (NSNumber)tunnelOverheadBytes;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)initFromLegacyDictionary:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setIPv4Settings:(NEIPv4Settings *)IPv4Settings;
- (void)setIPv6Settings:(NEIPv6Settings *)IPv6Settings;
- (void)setMTU:(NSNumber *)MTU;
- (void)setTunnelOverheadBytes:(NSNumber *)tunnelOverheadBytes;
@end

@implementation NEPacketTunnelNetworkSettings

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_MTU, 0);
  objc_storeStrong((id *)&self->_tunnelOverheadBytes, 0);
  objc_storeStrong((id *)&self->_IPv6Settings, 0);

  objc_storeStrong((id *)&self->_IPv4Settings, 0);
}

- (void)setMTU:(NSNumber *)MTU
{
}

- (NSNumber)MTU
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTunnelOverheadBytes:(NSNumber *)tunnelOverheadBytes
{
}

- (NSNumber)tunnelOverheadBytes
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void)setIPv6Settings:(NEIPv6Settings *)IPv6Settings
{
}

- (NEIPv6Settings)IPv6Settings
{
  return (NEIPv6Settings *)objc_getProperty(self, a2, 40, 1);
}

- (void)setIPv4Settings:(NEIPv4Settings *)IPv4Settings
{
}

- (NEIPv4Settings)IPv4Settings
{
  return (NEIPv4Settings *)objc_getProperty(self, a2, 32, 1);
}

- (id)initFromLegacyDictionary:(id)a3
{
  CFDictionaryRef v4 = (const __CFDictionary *)a3;
  v29.receiver = self;
  v29.super_class = (Class)NEPacketTunnelNetworkSettings;
  v5 = [(NETunnelNetworkSettings *)&v29 initFromLegacyDictionary:v4];
  if (!v5)
  {
LABEL_13:
    v18 = 0;
    goto LABEL_22;
  }
  CFDictionaryRef v6 = (const __CFDictionary *)NEGetValueWithType(v4, (const void *)*MEMORY[0x1E4F41B48], CFDICTIONARY_TYPE);
  if (!v6)
  {
    v17 = ne_log_obj();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v28 = 0;
      _os_log_error_impl(&dword_19DDAF000, v17, OS_LOG_TYPE_ERROR, "legacy dictionary is missing a VPN dictionary", v28, 2u);
    }

    goto LABEL_13;
  }
  CFDictionaryRef v7 = v6;
  v8 = (const void *)*MEMORY[0x1E4F41F98];
  if (NEGetValueWithType(v6, (const void *)*MEMORY[0x1E4F41F98], CFNUMBER_TYPE))
  {
    uint64_t v9 = NEGetValueWithType(v7, v8, CFNUMBER_TYPE);
    v10 = (void *)v5[7];
    v5[7] = v9;
  }
  CFDictionaryRef v11 = (const __CFDictionary *)NEGetValueWithType(v4, (const void *)*MEMORY[0x1E4F41B10], CFDICTIONARY_TYPE);
  if (v11)
  {
    CFDictionaryRef v12 = v11;
    if (CFDictionaryGetCount(v11) >= 1)
    {
      v13 = (const void *)*MEMORY[0x1E4F41C70];
      if (CFDictionaryContainsKey(v12, (const void *)*MEMORY[0x1E4F41C70]))
      {
        MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v12);
        if (MutableCopy)
        {
          v15 = MutableCopy;
          CFDictionaryRemoveValue(MutableCopy, v13);
          id v16 = [[NEIPv4Settings alloc] initFromLegacyDictionary:v15];
          [v5 setIPv4Settings:v16];

          CFRelease(v15);
        }
      }
      else
      {
        id v19 = [[NEIPv4Settings alloc] initFromLegacyDictionary:v12];
        [v5 setIPv4Settings:v19];
      }
    }
  }
  CFDictionaryRef v20 = (const __CFDictionary *)NEGetValueWithType(v4, (const void *)*MEMORY[0x1E4F41B18], CFDICTIONARY_TYPE);
  if (v20)
  {
    CFDictionaryRef v21 = v20;
    if (CFDictionaryGetCount(v20) >= 1)
    {
      v22 = (const void *)*MEMORY[0x1E4F41CC8];
      if (CFDictionaryContainsKey(v21, (const void *)*MEMORY[0x1E4F41CC8]))
      {
        v23 = CFDictionaryCreateMutableCopy(0, 0, v21);
        if (v23)
        {
          v24 = v23;
          CFDictionaryRemoveValue(v23, v22);
          id v25 = [[NEIPv6Settings alloc] initFromLegacyDictionary:v24];
          [v5 setIPv6Settings:v25];

          CFRelease(v24);
        }
      }
      else
      {
        id v26 = [[NEIPv6Settings alloc] initFromLegacyDictionary:v21];
        [v5 setIPv6Settings:v26];
      }
    }
  }
  v18 = v5;
LABEL_22:

  return v18;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendString:@"{"];
  CFDictionaryRef v4 = [(NEPacketTunnelNetworkSettings *)self descriptionWithIndent:0 options:0];
  [v3 appendString:v4];

  [v3 appendString:@"\n}"];

  return v3;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc(MEMORY[0x1E4F28E78]);
  v15.receiver = self;
  v15.super_class = (Class)NEPacketTunnelNetworkSettings;
  v8 = [(NETunnelNetworkSettings *)&v15 descriptionWithIndent:v5 options:a4];
  uint64_t v9 = (void *)[v7 initWithString:v8];

  v10 = [(NEPacketTunnelNetworkSettings *)self IPv4Settings];
  [v9 appendPrettyObject:v10 withName:@"IPv4Settings" andIndent:v5 options:a4];

  CFDictionaryRef v11 = [(NEPacketTunnelNetworkSettings *)self IPv6Settings];
  [v9 appendPrettyObject:v11 withName:@"IPv6Settings" andIndent:v5 options:a4];

  CFDictionaryRef v12 = [(NEPacketTunnelNetworkSettings *)self tunnelOverheadBytes];
  [v9 appendPrettyObject:v12 withName:@"tunnelOverheadBytes" andIndent:v5 options:a4];

  v13 = [(NEPacketTunnelNetworkSettings *)self MTU];
  [v9 appendPrettyObject:v13 withName:@"MTU" andIndent:v5 options:a4];

  return v9;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NEPacketTunnelNetworkSettings;
  unsigned __int8 v5 = [(NETunnelNetworkSettings *)&v15 checkValidityAndCollectErrors:v4];
  uint64_t v6 = [(NEPacketTunnelNetworkSettings *)self IPv4Settings];
  if (v6)
  {
    id v7 = (void *)v6;
    v8 = [(NEPacketTunnelNetworkSettings *)self IPv4Settings];
    char v9 = [v8 checkValidityAndCollectErrors:v4];

    v5 &= v9;
  }
  uint64_t v10 = [(NEPacketTunnelNetworkSettings *)self IPv6Settings];
  if (v10)
  {
    CFDictionaryRef v11 = (void *)v10;
    CFDictionaryRef v12 = [(NEPacketTunnelNetworkSettings *)self IPv6Settings];
    char v13 = [v12 checkValidityAndCollectErrors:v4];

    v5 &= v13;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)NEPacketTunnelNetworkSettings;
  id v4 = [(NETunnelNetworkSettings *)&v10 copyWithZone:a3];
  unsigned __int8 v5 = [(NEPacketTunnelNetworkSettings *)self IPv4Settings];
  [v4 setIPv4Settings:v5];

  uint64_t v6 = [(NEPacketTunnelNetworkSettings *)self IPv6Settings];
  [v4 setIPv6Settings:v6];

  id v7 = [(NEPacketTunnelNetworkSettings *)self tunnelOverheadBytes];
  [v4 setTunnelOverheadBytes:v7];

  v8 = [(NEPacketTunnelNetworkSettings *)self MTU];
  [v4 setMTU:v8];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NEPacketTunnelNetworkSettings;
  id v4 = a3;
  [(NETunnelNetworkSettings *)&v9 encodeWithCoder:v4];
  unsigned __int8 v5 = [(NEPacketTunnelNetworkSettings *)self IPv4Settings];
  [v4 encodeObject:v5 forKey:@"IPv4Settings"];

  uint64_t v6 = [(NEPacketTunnelNetworkSettings *)self IPv6Settings];
  [v4 encodeObject:v6 forKey:@"IPv6Settings"];

  id v7 = [(NEPacketTunnelNetworkSettings *)self tunnelOverheadBytes];
  [v4 encodeObject:v7 forKey:@"TunnelOverheadBytes"];

  v8 = [(NEPacketTunnelNetworkSettings *)self MTU];
  [v4 encodeObject:v8 forKey:@"MTU"];
}

- (NEPacketTunnelNetworkSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NEPacketTunnelNetworkSettings;
  unsigned __int8 v5 = [(NETunnelNetworkSettings *)&v15 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"IPv4Settings"];
    IPv4Settings = v5->_IPv4Settings;
    v5->_IPv4Settings = (NEIPv4Settings *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"IPv6Settings"];
    IPv6Settings = v5->_IPv6Settings;
    v5->_IPv6Settings = (NEIPv6Settings *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TunnelOverheadBytes"];
    tunnelOverheadBytes = v5->_tunnelOverheadBytes;
    v5->_tunnelOverheadBytes = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTU"];
    MTU = v5->_MTU;
    v5->_MTU = (NSNumber *)v12;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end