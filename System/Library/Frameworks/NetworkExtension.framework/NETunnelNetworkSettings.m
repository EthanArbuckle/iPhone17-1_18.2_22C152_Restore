@interface NETunnelNetworkSettings
+ (BOOL)supportsSecureCoding;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (NEDNSSettings)DNSSettings;
- (NEProxySettings)proxySettings;
- (NETunnelNetworkSettings)initWithCoder:(id)a3;
- (NETunnelNetworkSettings)initWithTunnelRemoteAddress:(NSString *)address;
- (NSString)tunnelRemoteAddress;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)initFromLegacyDictionary:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDNSSettings:(NEDNSSettings *)DNSSettings;
- (void)setProxySettings:(NEProxySettings *)proxySettings;
@end

@implementation NETunnelNetworkSettings

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxySettings, 0);
  objc_storeStrong((id *)&self->_DNSSettings, 0);

  objc_storeStrong((id *)&self->_tunnelRemoteAddress, 0);
}

- (void)setProxySettings:(NEProxySettings *)proxySettings
{
}

- (NEProxySettings)proxySettings
{
  return (NEProxySettings *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDNSSettings:(NEDNSSettings *)DNSSettings
{
}

- (NEDNSSettings)DNSSettings
{
  return (NEDNSSettings *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)tunnelRemoteAddress
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (id)initFromLegacyDictionary:(id)a3
{
  CFDictionaryRef v4 = (const __CFDictionary *)a3;
  CFDictionaryRef v5 = v4;
  if (!v4 || (uint64_t v6 = CFDICTIONARY_TYPE, CFGetTypeID(v4) != v6))
  {
    v17 = ne_log_obj();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v19 = "Legacy dictionary is not a valid dictionary";
      goto LABEL_23;
    }
    goto LABEL_15;
  }
  CFDictionaryRef v7 = (const __CFDictionary *)NEGetValueWithType(v5, (const void *)*MEMORY[0x1E4F41B48], CFDICTIONARY_TYPE);
  if (!v7)
  {
    v17 = ne_log_obj();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v19 = "Legacy dictionary is missing a VPN dictionary";
      goto LABEL_23;
    }
LABEL_15:

    v11 = 0;
    goto LABEL_16;
  }
  CFStringRef v8 = (const __CFString *)NEGetValueWithType(v7, (const void *)*MEMORY[0x1E4F42038], CFSTRING_TYPE);
  if (!v8 || (v9 = (__CFString *)v8, !NEGetAddressFamilyFromString(v8)))
  {
    v17 = ne_log_obj();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v19 = "Legacy dictionary does not have a remote address string in its VPN dictionary";
LABEL_23:
      _os_log_error_impl(&dword_19DDAF000, v17, OS_LOG_TYPE_ERROR, v19, buf, 2u);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
  v22.receiver = self;
  v22.super_class = (Class)NETunnelNetworkSettings;
  v10 = [(NETunnelNetworkSettings *)&v22 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_tunnelRemoteAddress, v9);
    CFDictionaryRef v12 = (const __CFDictionary *)NEGetValueWithType(v5, (const void *)*MEMORY[0x1E4F41B08], CFDICTIONARY_TYPE);
    if (v12)
    {
      CFDictionaryRef v13 = v12;
      if (CFDictionaryGetCount(v12) >= 1)
      {
        if (CFDictionaryContainsKey(v13, (const void *)*MEMORY[0x1E4F41BC0])
          || (v20 = (const void *)*MEMORY[0x1E4F41BB8], CFDictionaryContainsKey(v13, (const void *)*MEMORY[0x1E4F41BB8]))
          && (CFArrayRef v21 = (const __CFArray *)NEGetValueWithType(v13, v20, CFARRAY_TYPE)) != 0
          && CFArrayGetCount(v21))
        {
          id v14 = [[NEDNSSettings alloc] initFromLegacyDictionary:v13];
          [(NETunnelNetworkSettings *)v11 setDNSSettings:v14];
        }
      }
    }
    CFDictionaryRef v15 = (const __CFDictionary *)NEGetValueWithType(v5, (const void *)*MEMORY[0x1E4F41B40], CFDICTIONARY_TYPE);
    if (v15)
    {
      CFDictionaryRef v16 = v15;
      if (CFDictionaryGetCount(v15) >= 1)
      {
        self = [[NEProxySettings alloc] initFromLegacyDictionary:v16];
        [(NETunnelNetworkSettings *)v11 setProxySettings:self];
LABEL_16:
      }
    }
  }

  return v11;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  CFDictionaryRef v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:0];
  CFStringRef v8 = [(NETunnelNetworkSettings *)self tunnelRemoteAddress];
  [v7 appendPrettyObject:v8 withName:@"tunnelRemoteAddress" andIndent:v5 options:a4 | 1];

  v9 = [(NETunnelNetworkSettings *)self DNSSettings];
  [v7 appendPrettyObject:v9 withName:@"DNSSettings" andIndent:v5 options:a4];

  v10 = [(NETunnelNetworkSettings *)self proxySettings];
  [v7 appendPrettyObject:v10 withName:@"proxySettings" andIndent:v5 options:a4];

  return v7;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NETunnelNetworkSettings *)self tunnelRemoteAddress];

  if (v5)
  {
    uint64_t v6 = [(NETunnelNetworkSettings *)self tunnelRemoteAddress];
    unsigned int v7 = NEGetAddressFamilyFromString(v6);

    if (v7)
    {
      char v8 = 1;
      goto LABEL_7;
    }
    v9 = @"Invalid NETunnelNetworkSettings tunnelRemoteAddress";
  }
  else
  {
    v9 = @"Missing NETunnelNetworkSettings tunnelRemoteAddress";
  }
  +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, v9, v4);
  char v8 = 0;
LABEL_7:
  uint64_t v10 = [(NETunnelNetworkSettings *)self DNSSettings];
  if (v10)
  {
    v11 = (void *)v10;
    CFDictionaryRef v12 = [(NETunnelNetworkSettings *)self DNSSettings];
    char v13 = [v12 checkValidityAndCollectErrors:v4];

    v8 &= v13;
  }
  uint64_t v14 = [(NETunnelNetworkSettings *)self proxySettings];
  if (v14)
  {
    CFDictionaryRef v15 = (void *)v14;
    CFDictionaryRef v16 = [(NETunnelNetworkSettings *)self proxySettings];
    char v17 = [v16 checkValidityAndCollectErrors:v4];

    v8 &= v17;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v5 = [(NETunnelNetworkSettings *)self tunnelRemoteAddress];
  uint64_t v6 = (void *)[v4 initWithTunnelRemoteAddress:v5];

  unsigned int v7 = [(NETunnelNetworkSettings *)self DNSSettings];
  [v6 setDNSSettings:v7];

  char v8 = [(NETunnelNetworkSettings *)self proxySettings];
  [v6 setProxySettings:v8];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NETunnelNetworkSettings *)self tunnelRemoteAddress];
  [v4 encodeObject:v5 forKey:@"tunnelRemoteAddress"];

  uint64_t v6 = [(NETunnelNetworkSettings *)self DNSSettings];
  [v4 encodeObject:v6 forKey:@"DNSSettings"];

  id v7 = [(NETunnelNetworkSettings *)self proxySettings];
  [v4 encodeObject:v7 forKey:@"proxySettings"];
}

- (NETunnelNetworkSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NETunnelNetworkSettings;
  uint64_t v5 = [(NETunnelNetworkSettings *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tunnelRemoteAddress"];
    tunnelRemoteAddress = v5->_tunnelRemoteAddress;
    v5->_tunnelRemoteAddress = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DNSSettings"];
    DNSSettings = v5->_DNSSettings;
    v5->_DNSSettings = (NEDNSSettings *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"proxySettings"];
    proxySettings = v5->_proxySettings;
    v5->_proxySettings = (NEProxySettings *)v10;
  }
  return v5;
}

- (NETunnelNetworkSettings)initWithTunnelRemoteAddress:(NSString *)address
{
  uint64_t v5 = address;
  v9.receiver = self;
  v9.super_class = (Class)NETunnelNetworkSettings;
  uint64_t v6 = [(NETunnelNetworkSettings *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_tunnelRemoteAddress, address);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end