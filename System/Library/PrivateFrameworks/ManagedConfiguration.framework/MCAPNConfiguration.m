@interface MCAPNConfiguration
- (MCAPNConfiguration)initWithDictionary:(id)a3 outError:(id *)a4;
- (NSDictionary)telephonyRepresentation;
- (NSNumber)allowedProtocolMask;
- (NSNumber)allowedProtocolMaskInDomesticRoaming;
- (NSNumber)allowedProtocolMaskInRoaming;
- (NSNumber)defaultProtocolMask;
- (NSNumber)enableXLAT464;
- (NSNumber)proxyPort;
- (NSString)authenticationType;
- (NSString)name;
- (NSString)password;
- (NSString)proxyServer;
- (NSString)username;
- (id)description;
- (id)localizedAuthenticationType;
- (id)stubDictionary;
- (void)setAllowedProtocolMask:(id)a3;
- (void)setAllowedProtocolMaskInDomesticRoaming:(id)a3;
- (void)setAllowedProtocolMaskInRoaming:(id)a3;
- (void)setAuthenticationType:(id)a3;
- (void)setDefaultProtocolMask:(id)a3;
- (void)setEnableXLAT464:(id)a3;
- (void)setName:(id)a3;
- (void)setPassword:(id)a3;
- (void)setProxyPort:(id)a3;
- (void)setProxyServer:(id)a3;
- (void)setUsername:(id)a3;
@end

@implementation MCAPNConfiguration

- (MCAPNConfiguration)initWithDictionary:(id)a3 outError:(id *)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v50.receiver = self;
  v50.super_class = (Class)MCAPNConfiguration;
  v7 = [(MCAPNConfiguration *)&v50 init];
  if (!v7) {
    goto LABEL_29;
  }
  id v49 = 0;
  uint64_t v8 = +[MCProfile removeRequiredNonZeroLengthStringInDictionary:v6 key:@"Name" errorDomain:@"MCPayloadErrorDomain" missingDataCode:2002 missingDataErrorString:@"ERROR_PAYLOAD_REQUIRED_FIELD_MISSING_P_FIELD" invalidDataCode:2003 invalidDataErrorString:@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD" outError:&v49];
  enableXLAT464 = (NSNumber *)v49;
  name = v7->_name;
  v7->_name = (NSString *)v8;

  if (!enableXLAT464)
  {
    id v48 = 0;
    uint64_t v11 = +[MCProfile removeOptionalNonZeroLengthStringInDictionary:v6 key:@"AuthenticationType" errorDomain:@"MCPayloadErrorDomain" invalidDataCode:2003 invalidDataErrorString:@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD" outError:&v48];
    enableXLAT464 = (NSNumber *)v48;
    authenticationType = v7->_authenticationType;
    v7->_authenticationType = (NSString *)v11;
  }
  v13 = v7->_authenticationType;
  if (v13)
  {
    if (![(NSString *)v13 isEqualToString:@"CHAP"]
      && ![(NSString *)v7->_authenticationType isEqualToString:@"PAP"])
    {
      v14 = +[MCPayload badFieldValueErrorWithField:@"AuthenticationType"];
      goto LABEL_8;
    }
  }
  else
  {
    v7->_authenticationType = (NSString *)@"PAP";
  }
  if (!enableXLAT464)
  {
    id v47 = 0;
    uint64_t v15 = +[MCProfile removeOptionalNonZeroLengthStringInDictionary:v6 key:@"Username" errorDomain:@"MCPayloadErrorDomain" invalidDataCode:2003 invalidDataErrorString:@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD" outError:&v47];
    enableXLAT464 = (NSNumber *)v47;
    username = v7->_username;
    v7->_username = (NSString *)v15;

    if (!enableXLAT464)
    {
      id v46 = 0;
      uint64_t v17 = +[MCProfile removeOptionalNonZeroLengthStringInDictionary:v6 key:@"Password" errorDomain:@"MCPayloadErrorDomain" invalidDataCode:2003 invalidDataErrorString:@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD" outError:&v46];
      enableXLAT464 = (NSNumber *)v46;
      password = v7->_password;
      v7->_password = (NSString *)v17;

      if (!enableXLAT464)
      {
        id v45 = 0;
        uint64_t v19 = +[MCProfile removeOptionalNonZeroLengthStringInDictionary:v6 key:@"ProxyServer" errorDomain:@"MCPayloadErrorDomain" invalidDataCode:2003 invalidDataErrorString:@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD" outError:&v45];
        enableXLAT464 = (NSNumber *)v45;
        proxyServer = v7->_proxyServer;
        v7->_proxyServer = (NSString *)v19;

        if (!enableXLAT464)
        {
          id v44 = 0;
          uint64_t v21 = +[MCProfile removeOptionalObjectInDictionary:v6 key:@"ProxyPort" type:objc_opt_class() errorDomain:@"MCPayloadErrorDomain" invalidDataCode:2003 invalidDataErrorString:@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD" outError:&v44];
          enableXLAT464 = (NSNumber *)v44;
          proxyPort = v7->_proxyPort;
          v7->_proxyPort = (NSNumber *)v21;
        }
      }
    }
  }
  v43 = enableXLAT464;
  uint64_t v23 = [v6 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"DefaultProtocolMask" isRequired:0 outError:&v43];
  v14 = v43;

  defaultProtocolMask = v7->_defaultProtocolMask;
  v7->_defaultProtocolMask = (NSNumber *)v23;

  if (v14) {
    goto LABEL_20;
  }
  id v42 = 0;
  uint64_t v25 = [v6 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"AllowedProtocolMask" isRequired:0 outError:&v42];
  v14 = (NSNumber *)v42;
  allowedProtocolMask = v7->_allowedProtocolMask;
  v7->_allowedProtocolMask = (NSNumber *)v25;

  if (v14) {
    goto LABEL_20;
  }
  id v41 = 0;
  uint64_t v27 = [v6 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"AllowedProtocolMaskInRoaming" isRequired:0 outError:&v41];
  v14 = (NSNumber *)v41;
  allowedProtocolMaskInRoaming = v7->_allowedProtocolMaskInRoaming;
  v7->_allowedProtocolMaskInRoaming = (NSNumber *)v27;

  if (v14) {
    goto LABEL_20;
  }
  id v40 = 0;
  uint64_t v29 = [v6 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"AllowedProtocolMaskInDomesticRoaming" isRequired:0 outError:&v40];
  v14 = (NSNumber *)v40;
  allowedProtocolMaskInDomesticRoaming = v7->_allowedProtocolMaskInDomesticRoaming;
  v7->_allowedProtocolMaskInDomesticRoaming = (NSNumber *)v29;

  if (v14) {
    goto LABEL_20;
  }
  id v39 = 0;
  uint64_t v38 = [v6 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"EnableXLAT464" isRequired:0 outError:&v39];
  v14 = (NSNumber *)v39;
  enableXLAT464 = v7->_enableXLAT464;
  v7->_enableXLAT464 = (NSNumber *)v38;
LABEL_8:

  if (v14)
  {
LABEL_20:
    v31 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      v32 = v31;
      v33 = objc_opt_class();
      id v34 = v33;
      v35 = [(NSNumber *)v14 MCVerboseDescription];
      *(_DWORD *)buf = 138543618;
      id v52 = v33;
      __int16 v53 = 2114;
      v54 = v35;
      _os_log_impl(&dword_1A13F0000, v32, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse APN dictionary: %{public}@", buf, 0x16u);
    }
    if (a4) {
      *a4 = v14;
    }

    v7 = 0;
  }
  if ([v6 count])
  {
    v36 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v52 = v6;
      _os_log_impl(&dword_1A13F0000, v36, OS_LOG_TYPE_INFO, "APN dictionary contains ignored fields. They are: %{public}@", buf, 0xCu);
    }
  }

LABEL_29:
  return v7;
}

- (id)stubDictionary
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(MCAPNConfiguration *)self name];
  [v3 setObject:v4 forKeyedSubscript:@"Name"];

  v5 = [(MCAPNConfiguration *)self authenticationType];
  [v3 setObject:v5 forKeyedSubscript:@"AuthenticationType"];

  id v6 = [(MCAPNConfiguration *)self username];
  [v3 setObject:v6 forKeyedSubscript:@"Username"];

  v7 = [(MCAPNConfiguration *)self proxyServer];
  [v3 setObject:v7 forKeyedSubscript:@"ProxyServer"];

  uint64_t v8 = [(MCAPNConfiguration *)self proxyPort];
  [v3 setObject:v8 forKeyedSubscript:@"ProxyPort"];

  v9 = [(MCAPNConfiguration *)self defaultProtocolMask];
  [v3 setObject:v9 forKeyedSubscript:@"DefaultProtocolMask"];

  v10 = [(MCAPNConfiguration *)self allowedProtocolMask];
  [v3 setObject:v10 forKeyedSubscript:@"AllowedProtocolMask"];

  uint64_t v11 = [(MCAPNConfiguration *)self allowedProtocolMaskInRoaming];
  [v3 setObject:v11 forKeyedSubscript:@"AllowedProtocolMaskInRoaming"];

  v12 = [(MCAPNConfiguration *)self allowedProtocolMaskInDomesticRoaming];
  [v3 setObject:v12 forKeyedSubscript:@"AllowedProtocolMaskInDomesticRoaming"];

  v13 = [(MCAPNConfiguration *)self enableXLAT464];
  [v3 setObject:v13 forKeyedSubscript:@"EnableXLAT464"];

  return v3;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  v4 = [(MCAPNConfiguration *)self name];

  if (v4)
  {
    v5 = [(MCAPNConfiguration *)self name];
    [v3 appendFormat:@"  Name        : %@\n", v5];
  }
  id v6 = [(MCAPNConfiguration *)self authenticationType];

  if (v6)
  {
    v7 = [(MCAPNConfiguration *)self authenticationType];
    [v3 appendFormat:@"  Auth        : %@\n", v7];
  }
  uint64_t v8 = [(MCAPNConfiguration *)self username];

  if (v8)
  {
    v9 = [(MCAPNConfiguration *)self username];
    [v3 appendFormat:@"  Username    : %@\n", v9];
  }
  v10 = [(MCAPNConfiguration *)self proxyServer];

  if (v10)
  {
    uint64_t v11 = [(MCAPNConfiguration *)self proxyServer];
    [v3 appendFormat:@"  Proxy       : %@\n", v11];
  }
  v12 = [(MCAPNConfiguration *)self proxyPort];

  if (v12)
  {
    v13 = [(MCAPNConfiguration *)self proxyPort];
    [v3 appendFormat:@"  Port        : %@\n", v13];
  }
  v14 = [(MCAPNConfiguration *)self enableXLAT464];

  if (v14)
  {
    uint64_t v15 = [(MCAPNConfiguration *)self enableXLAT464];
    [v3 appendFormat:@"  XLAT464     : %@\n", v15];
  }
  return v3;
}

- (id)localizedAuthenticationType
{
  if ([(NSString *)self->_authenticationType isEqualToString:@"CHAP"])
  {
    v3 = @"AUTHENTICATION_TYPE_CHAP";
LABEL_5:
    v4 = MCLocalizedString(v3);
    goto LABEL_7;
  }
  if ([(NSString *)self->_authenticationType isEqualToString:@"PAP"])
  {
    v3 = @"AUTHENTICATION_TYPE_PAP";
    goto LABEL_5;
  }
  v4 = 0;
LABEL_7:
  return v4;
}

- (NSDictionary)telephonyRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:10];
  v4 = [(MCAPNConfiguration *)self name];
  [v3 setObject:v4 forKeyedSubscript:@"apn"];

  v5 = [(MCAPNConfiguration *)self authenticationType];
  [v3 setObject:v5 forKeyedSubscript:@"auth_type"];

  id v6 = [(MCAPNConfiguration *)self username];
  [v3 setObject:v6 forKeyedSubscript:@"username"];

  v7 = [(MCAPNConfiguration *)self password];
  [v3 setObject:v7 forKeyedSubscript:@"password"];

  uint64_t v8 = [(MCAPNConfiguration *)self proxyServer];

  if (v8)
  {
    v9 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:6];
    [v9 setObject:&unk_1EF4D0850 forKeyedSubscript:@"HTTPEnable"];
    [v9 setObject:&unk_1EF4D0850 forKeyedSubscript:@"HTTPSEnable"];
    v10 = [(MCAPNConfiguration *)self proxyServer];
    [v9 setObject:v10 forKeyedSubscript:@"HTTPProxy"];

    uint64_t v11 = [(MCAPNConfiguration *)self proxyServer];
    [v9 setObject:v11 forKeyedSubscript:@"HTTPSProxy"];

    v12 = [(MCAPNConfiguration *)self proxyPort];

    if (v12)
    {
      v13 = [(MCAPNConfiguration *)self proxyPort];
      [v9 setObject:v13 forKeyedSubscript:@"HTTPPort"];

      v14 = [(MCAPNConfiguration *)self proxyPort];
      [v9 setObject:v14 forKeyedSubscript:@"HTTPSPort"];
    }
    [v3 setObject:v9 forKeyedSubscript:@"ProxyConfiguration"];
  }
  uint64_t v15 = [(MCAPNConfiguration *)self defaultProtocolMask];
  [v3 setObject:v15 forKeyedSubscript:@"DefaultProtocolMask"];

  v16 = [(MCAPNConfiguration *)self allowedProtocolMask];
  [v3 setObject:v16 forKeyedSubscript:@"AllowedProtocolMask"];

  uint64_t v17 = [(MCAPNConfiguration *)self allowedProtocolMaskInRoaming];
  [v3 setObject:v17 forKeyedSubscript:@"AllowedProtocolMaskInRoaming"];

  v18 = [(MCAPNConfiguration *)self allowedProtocolMaskInDomesticRoaming];
  [v3 setObject:v18 forKeyedSubscript:@"AllowedProtocolMaskInDomesticRoaming"];

  uint64_t v19 = [(MCAPNConfiguration *)self enableXLAT464];
  [v3 setObject:v19 forKeyedSubscript:@"enableXLAT464"];

  return (NSDictionary *)v3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
}

- (NSString)proxyServer
{
  return self->_proxyServer;
}

- (void)setProxyServer:(id)a3
{
}

- (NSNumber)proxyPort
{
  return self->_proxyPort;
}

- (void)setProxyPort:(id)a3
{
}

- (NSString)authenticationType
{
  return self->_authenticationType;
}

- (void)setAuthenticationType:(id)a3
{
}

- (NSNumber)defaultProtocolMask
{
  return self->_defaultProtocolMask;
}

- (void)setDefaultProtocolMask:(id)a3
{
}

- (NSNumber)allowedProtocolMask
{
  return self->_allowedProtocolMask;
}

- (void)setAllowedProtocolMask:(id)a3
{
}

- (NSNumber)allowedProtocolMaskInRoaming
{
  return self->_allowedProtocolMaskInRoaming;
}

- (void)setAllowedProtocolMaskInRoaming:(id)a3
{
}

- (NSNumber)allowedProtocolMaskInDomesticRoaming
{
  return self->_allowedProtocolMaskInDomesticRoaming;
}

- (void)setAllowedProtocolMaskInDomesticRoaming:(id)a3
{
}

- (NSNumber)enableXLAT464
{
  return self->_enableXLAT464;
}

- (void)setEnableXLAT464:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enableXLAT464, 0);
  objc_storeStrong((id *)&self->_allowedProtocolMaskInDomesticRoaming, 0);
  objc_storeStrong((id *)&self->_allowedProtocolMaskInRoaming, 0);
  objc_storeStrong((id *)&self->_allowedProtocolMask, 0);
  objc_storeStrong((id *)&self->_defaultProtocolMask, 0);
  objc_storeStrong((id *)&self->_authenticationType, 0);
  objc_storeStrong((id *)&self->_proxyPort, 0);
  objc_storeStrong((id *)&self->_proxyServer, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end