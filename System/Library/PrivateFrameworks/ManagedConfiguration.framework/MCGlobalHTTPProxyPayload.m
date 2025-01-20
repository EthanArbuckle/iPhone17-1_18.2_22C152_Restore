@interface MCGlobalHTTPProxyPayload
+ (id)localizedPluralForm;
+ (id)localizedSingularForm;
+ (id)typeStrings;
- (BOOL)proxyCaptiveLoginAllowed;
- (BOOL)proxyPACFallbackAllowed;
- (MCGlobalHTTPProxyPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5;
- (NSNumber)proxyCaptiveLoginAllowedNum;
- (NSNumber)proxyPACFallbackAllowedNum;
- (NSNumber)proxyServerPort;
- (NSString)credentialUUID;
- (NSString)proxyPACURLString;
- (NSString)proxyPassword;
- (NSString)proxyServer;
- (NSString)proxyUsername;
- (id)installationWarnings;
- (id)payloadDescriptionKeyValueSections;
- (id)stubDictionary;
- (id)subtitle1Description;
- (id)subtitle1Label;
- (id)subtitle2Description;
- (id)subtitle2Label;
- (id)verboseDescription;
- (int)proxyType;
- (void)setCredentialUUID:(id)a3;
- (void)setProxyCaptiveLoginAllowed:(BOOL)a3;
- (void)setProxyCaptiveLoginAllowedNum:(id)a3;
- (void)setProxyPACFallbackAllowed:(BOOL)a3;
- (void)setProxyPACFallbackAllowedNum:(id)a3;
- (void)setProxyPACURLString:(id)a3;
- (void)setProxyPassword:(id)a3;
- (void)setProxyServer:(id)a3;
- (void)setProxyServerPort:(id)a3;
- (void)setProxyType:(int)a3;
- (void)setProxyUsername:(id)a3;
@end

@implementation MCGlobalHTTPProxyPayload

+ (id)typeStrings
{
  return (id)[MEMORY[0x1E4F1C978] arrayWithObject:@"com.apple.proxy.http.global"];
}

+ (id)localizedSingularForm
{
  return MCLocalizedFormat(@"GLOBAL_PROXY_SINGULAR", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)localizedPluralForm
{
  return MCLocalizedFormat(@"GLOBAL_PROXY_", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCGlobalHTTPProxyPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v70.receiver = self;
  v70.super_class = (Class)MCGlobalHTTPProxyPayload;
  v10 = [(MCPayload *)&v70 initWithDictionary:v8 profile:v9 outError:a5];
  if (!v10) {
    goto LABEL_23;
  }
  id v69 = 0;
  uint64_t v11 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"ProxyPACFallbackAllowed" isRequired:0 outError:&v69];
  id v12 = v69;
  proxyPACFallbackAllowedNum = v10->_proxyPACFallbackAllowedNum;
  v10->_proxyPACFallbackAllowedNum = (NSNumber *)v11;

  if (v12) {
    goto LABEL_14;
  }
  v10->_proxyPACFallbackAllowed = [(NSNumber *)v10->_proxyPACFallbackAllowedNum BOOLValue];
  id v68 = 0;
  uint64_t v14 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"ProxyCaptiveLoginAllowed" isRequired:0 outError:&v68];
  id v12 = v68;
  proxyCaptiveLoginAllowedNum = v10->_proxyCaptiveLoginAllowedNum;
  v10->_proxyCaptiveLoginAllowedNum = (NSNumber *)v14;

  if (v12) {
    goto LABEL_14;
  }
  v10->_proxyCaptiveLoginAllowed = [(NSNumber *)v10->_proxyCaptiveLoginAllowedNum BOOLValue];
  if (![v9 isStub])
  {
    id v60 = 0;
    v16 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"ProxyType" isRequired:0 outError:&v60];
    id v17 = v60;
    if (v17) {
      goto LABEL_12;
    }
    if (v16)
    {
      if ([v16 isEqualToString:@"Manual"])
      {
        int v37 = 1;
LABEL_33:
        v10->_int proxyType = v37;
        goto LABEL_34;
      }
      if ([v16 isEqualToString:@"Auto"])
      {
        int v37 = 0;
        goto LABEL_33;
      }
      id v17 = +[MCPayload badFieldValueErrorWithField:@"ProxyType"];
      if (v17) {
        goto LABEL_12;
      }
    }
LABEL_34:
    int proxyType = v10->_proxyType;
    if (proxyType)
    {
      if (proxyType != 1) {
        goto LABEL_42;
      }
      id v59 = 0;
      uint64_t v42 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"ProxyServer" isRequired:1 outError:&v59];
      id v12 = v59;
      proxyServer = v10->_proxyServer;
      v10->_proxyServer = (NSString *)v42;

      if (v12) {
        goto LABEL_13;
      }
      id v58 = 0;
      uint64_t v44 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"ProxyServerPort" isRequired:0 outError:&v58];
      id v12 = v58;
      proxyServerPort = v10->_proxyServerPort;
      v10->_proxyServerPort = (NSNumber *)v44;

      if (v12) {
        goto LABEL_13;
      }
      id v57 = 0;
      uint64_t v46 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"ProxyUsername" isRequired:0 outError:&v57];
      id v12 = v57;
      proxyUsername = v10->_proxyUsername;
      v10->_proxyUsername = (NSString *)v46;

      if (v12) {
        goto LABEL_13;
      }
      id v56 = 0;
      uint64_t v48 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"ProxyPassword" isRequired:0 outError:&v56];
      id v12 = v56;
      uint64_t v49 = 120;
    }
    else
    {
      id v55 = 0;
      uint64_t v48 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"ProxyPACURL" isRequired:0 outError:&v55];
      id v12 = v55;
      uint64_t v49 = 128;
    }
    v50 = *(Class *)((char *)&v10->super.super.isa + v49);
    *(Class *)((char *)&v10->super.super.isa + v49) = (Class)v48;

    if (v12) {
      goto LABEL_13;
    }
LABEL_42:
    if (!v10->_proxyPACURLString)
    {
      id v12 = 0;
      goto LABEL_13;
    }
    credentialUUID = objc_msgSend(MEMORY[0x1E4F1CB10], "URLWithString:");
    v51 = [credentialUUID scheme];
    if ([v51 isEqualToString:@"http"])
    {
    }
    else
    {
      v52 = [credentialUUID scheme];
      char v53 = [v52 isEqualToString:@"https"];

      if ((v53 & 1) == 0)
      {
        uint64_t v54 = +[MCPayload badFieldValueErrorWithField:@"ProxyPACURL"];
        if (v54)
        {
          id v12 = (id)v54;
          goto LABEL_52;
        }
      }
    }
    id v12 = 0;
    goto LABEL_52;
  }
  id v67 = 0;
  v16 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"ProxyType" isRequired:0 outError:&v67];
  id v17 = v67;
  if (v17)
  {
LABEL_12:
    id v12 = v17;
    goto LABEL_13;
  }
  -[MCGlobalHTTPProxyPayload setProxyType:](v10, "setProxyType:", [v16 intValue]);
  if ([(MCGlobalHTTPProxyPayload *)v10 proxyType] != 1)
  {
    if (v10->_proxyType)
    {
LABEL_30:
      id v61 = 0;
      uint64_t v39 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"credentialUUID" isRequired:0 outError:&v61];
      id v12 = v61;
      credentialUUID = v10->_credentialUUID;
      v10->_credentialUUID = (NSString *)v39;
LABEL_52:

      goto LABEL_13;
    }
    id v62 = 0;
    uint64_t v24 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"ProxyPACURL" isRequired:0 outError:&v62];
    id v12 = v62;
    uint64_t v25 = 128;
LABEL_29:
    v38 = *(Class *)((char *)&v10->super.super.isa + v25);
    *(Class *)((char *)&v10->super.super.isa + v25) = (Class)v24;

    if (v12) {
      goto LABEL_13;
    }
    goto LABEL_30;
  }
  id v66 = 0;
  uint64_t v18 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"ProxyServer" isRequired:0 outError:&v66];
  id v12 = v66;
  v19 = v10->_proxyServer;
  v10->_proxyServer = (NSString *)v18;

  if (!v12)
  {
    id v65 = 0;
    uint64_t v20 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"ProxyServerPort" isRequired:0 outError:&v65];
    id v12 = v65;
    v21 = v10->_proxyServerPort;
    v10->_proxyServerPort = (NSNumber *)v20;

    if (!v12)
    {
      id v64 = 0;
      uint64_t v22 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"ProxyUsername" isRequired:0 outError:&v64];
      id v12 = v64;
      v23 = v10->_proxyUsername;
      v10->_proxyUsername = (NSString *)v22;

      if (!v12)
      {
        id v63 = 0;
        uint64_t v24 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"ProxyPassword" isRequired:0 outError:&v63];
        id v12 = v63;
        uint64_t v25 = 120;
        goto LABEL_29;
      }
    }
  }
LABEL_13:

  if (v12)
  {
LABEL_14:
    v26 = [(MCPayload *)v10 malformedPayloadErrorWithError:v12];
    v27 = v26;
    if (a5) {
      *a5 = v26;
    }
    v28 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      v29 = v28;
      v30 = objc_opt_class();
      id v31 = v30;
      v32 = [v27 MCVerboseDescription];
      *(_DWORD *)buf = 138543618;
      v72 = v30;
      __int16 v73 = 2114;
      id v74 = v32;
      _os_log_impl(&dword_1A13F0000, v29, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);
    }
    v10 = 0;
  }
  if ([v8 count])
  {
    v33 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      v34 = v33;
      v35 = [(MCPayload *)v10 friendlyName];
      *(_DWORD *)buf = 138543618;
      v72 = v35;
      __int16 v73 = 2114;
      id v74 = v8;
      _os_log_impl(&dword_1A13F0000, v34, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);
    }
  }

LABEL_23:
  return v10;
}

- (id)stubDictionary
{
  v16.receiver = self;
  v16.super_class = (Class)MCGlobalHTTPProxyPayload;
  uint64_t v3 = [(MCPayload *)&v16 stubDictionary];
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", -[MCGlobalHTTPProxyPayload proxyType](self, "proxyType"));
  [v3 setObject:v4 forKey:@"ProxyType"];

  uint64_t v5 = [(MCGlobalHTTPProxyPayload *)self proxyServer];

  if (v5)
  {
    uint64_t v6 = [(MCGlobalHTTPProxyPayload *)self proxyServer];
    [v3 setObject:v6 forKey:@"ProxyServer"];
  }
  uint64_t v7 = [(MCGlobalHTTPProxyPayload *)self proxyServerPort];

  if (v7)
  {
    id v8 = [(MCGlobalHTTPProxyPayload *)self proxyServerPort];
    [v3 setObject:v8 forKey:@"ProxyServerPort"];
  }
  id v9 = [(MCGlobalHTTPProxyPayload *)self proxyPACURLString];

  if (v9)
  {
    v10 = [(MCGlobalHTTPProxyPayload *)self proxyPACURLString];
    [v3 setObject:v10 forKey:@"ProxyPACURL"];
  }
  uint64_t v11 = [(MCGlobalHTTPProxyPayload *)self credentialUUID];

  if (v11)
  {
    id v12 = [(MCGlobalHTTPProxyPayload *)self credentialUUID];
    [v3 setObject:v12 forKey:@"credentialUUID"];
  }
  v13 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[MCGlobalHTTPProxyPayload proxyPACFallbackAllowed](self, "proxyPACFallbackAllowed"));
  [v3 setObject:v13 forKeyedSubscript:@"ProxyPACFallbackAllowed"];

  uint64_t v14 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[MCGlobalHTTPProxyPayload proxyCaptiveLoginAllowed](self, "proxyCaptiveLoginAllowed"));
  [v3 setObject:v14 forKeyedSubscript:@"ProxyCaptiveLoginAllowed"];

  return v3;
}

- (id)subtitle1Label
{
  id v9 = [(MCGlobalHTTPProxyPayload *)self subtitle1Description];
  if (v9) {
    MCLocalizedFormat(@"GLOBAL_PROXY_SERVER_COLON", v2, v3, v4, v5, v6, v7, v8, v12);
  }
  else {
  v10 = MCLocalizedString(@"GLOBAL_PROXY_SERVER_MISSING");
  }

  return v10;
}

- (id)subtitle1Description
{
  if ([(MCGlobalHTTPProxyPayload *)self proxyType] == 1) {
    [(MCGlobalHTTPProxyPayload *)self proxyServer];
  }
  else {
  uint64_t v3 = [(MCGlobalHTTPProxyPayload *)self proxyPACURLString];
  }
  return v3;
}

- (id)subtitle2Label
{
  uint64_t v2 = [(MCGlobalHTTPProxyPayload *)self proxyServerPort];

  if (v2)
  {
    v10 = MCLocalizedFormat(@"GLOBAL_PROXY_SERVER_PORT_COLON", v3, v4, v5, v6, v7, v8, v9, v12);
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)subtitle2Description
{
  uint64_t v3 = [(MCGlobalHTTPProxyPayload *)self proxyServerPort];

  if (v3)
  {
    uint64_t v4 = [(MCGlobalHTTPProxyPayload *)self proxyServerPort];
    uint64_t v5 = MCFormattedStringForNumber(v4);
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

- (id)payloadDescriptionKeyValueSections
{
  v60[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = [(MCGlobalHTTPProxyPayload *)self proxyServer];

  if (v4)
  {
    uint64_t v5 = [MCKeyValue alloc];
    uint64_t v6 = [(MCGlobalHTTPProxyPayload *)self proxyServer];
    uint64_t v7 = MCLocalizedString(@"SERVER");
    uint64_t v8 = [(MCKeyValue *)v5 initWithLocalizedString:v6 localizedKey:v7];

    [v3 addObject:v8];
  }
  uint64_t v9 = [(MCGlobalHTTPProxyPayload *)self proxyServerPort];

  if (v9)
  {
    v10 = NSString;
    uint64_t v11 = [(MCGlobalHTTPProxyPayload *)self proxyServerPort];
    uint64_t v12 = objc_msgSend(v10, "stringWithFormat:", @"%d", objc_msgSend(v11, "intValue"));

    v13 = [MCKeyValue alloc];
    uint64_t v14 = MCLocalizedString(@"PORT");
    v15 = [(MCKeyValue *)v13 initWithLocalizedString:v12 localizedKey:v14];

    [v3 addObject:v15];
  }
  if ([(MCGlobalHTTPProxyPayload *)self proxyType])
  {
    if ([(MCGlobalHTTPProxyPayload *)self proxyType] == 1)
    {
      objc_super v16 = [MCKeyValue alloc];
      id v17 = MCLocalizedString(@"TYPE_MANUAL");
      uint64_t v18 = MCLocalizedString(@"TYPE");
      v19 = [(MCKeyValue *)v16 initWithLocalizedString:v17 localizedKey:v18];
      [v3 addObject:v19];

      uint64_t v20 = [(MCGlobalHTTPProxyPayload *)self proxyUsername];

      if (v20)
      {
        v21 = [MCKeyValue alloc];
        uint64_t v22 = [(MCGlobalHTTPProxyPayload *)self proxyUsername];
        v23 = MCLocalizedString(@"USERNAME");
        uint64_t v24 = [(MCKeyValue *)v21 initWithLocalizedString:v22 localizedKey:v23];

        [v3 addObject:v24];
      }
      uint64_t v25 = [(MCGlobalHTTPProxyPayload *)self proxyPassword];

      if (v25)
      {
        v26 = [MCKeyValue alloc];
        v27 = MCLocalizedString(@"PRESENT");
        v28 = MCLocalizedString(@"PASSWORD");
        v29 = [(MCKeyValue *)v26 initWithLocalizedString:v27 localizedKey:v28];

        [v3 addObject:v29];
      }
      v30 = [(MCGlobalHTTPProxyPayload *)self credentialUUID];

      if (v30)
      {
        id v31 = [(MCPayload *)self profile];
        v32 = [(MCGlobalHTTPProxyPayload *)self credentialUUID];
        v33 = [v31 subjectSummaryFromCertificatePayloadWithUUID:v32];

        if (v33)
        {
          v34 = [MCKeyValue alloc];
          v35 = MCLocalizedString(@"CREDENTIAL");
          v36 = [(MCKeyValue *)v34 initWithLocalizedString:v33 localizedKey:v35];

          [v3 addObject:v36];
        }
        goto LABEL_18;
      }
    }
  }
  else
  {
    int v37 = [MCKeyValue alloc];
    v38 = MCLocalizedString(@"TYPE_AUTOMATIC");
    uint64_t v39 = MCLocalizedString(@"TYPE");
    v40 = [(MCKeyValue *)v37 initWithLocalizedString:v38 localizedKey:v39];
    [v3 addObject:v40];

    v41 = [(MCGlobalHTTPProxyPayload *)self proxyPACURLString];

    if (v41)
    {
      uint64_t v42 = [MCKeyValue alloc];
      v43 = [(MCGlobalHTTPProxyPayload *)self proxyPACURLString];
      uint64_t v44 = MCLocalizedString(@"PAC");
      v45 = [(MCKeyValue *)v42 initWithLocalizedString:v43 localizedKey:v44];

      [v3 addObject:v45];
    }
    uint64_t v46 = [(MCGlobalHTTPProxyPayload *)self proxyPACFallbackAllowedNum];

    if (v46)
    {
      v47 = [MCKeyValue alloc];
      uint64_t v48 = [(MCGlobalHTTPProxyPayload *)self proxyPACFallbackAllowedNum];
      uint64_t v49 = MCLocalizedStringForBool([v48 BOOLValue]);
      v50 = MCLocalizedString(@"FALLBACK");
      v33 = [(MCKeyValue *)v47 initWithLocalizedString:v49 localizedKey:v50];

      [v3 addObject:v33];
LABEL_18:
    }
  }
  v51 = [(MCGlobalHTTPProxyPayload *)self proxyCaptiveLoginAllowedNum];

  if (v51)
  {
    v52 = [MCKeyValue alloc];
    char v53 = [(MCGlobalHTTPProxyPayload *)self proxyCaptiveLoginAllowedNum];
    uint64_t v54 = MCLocalizedStringForBool([v53 BOOLValue]);
    id v55 = MCLocalizedString(@"CAPTIVE_LOGIN_ALLOWED");
    id v56 = [(MCKeyValue *)v52 initWithLocalizedString:v54 localizedKey:v55];
    [v3 addObject:v56];
  }
  id v57 = +[MCKeyValueSection sectionWithKeyValues:v3];
  v60[0] = v57;
  id v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:1];

  return v58;
}

- (id)verboseDescription
{
  v16.receiver = self;
  v16.super_class = (Class)MCGlobalHTTPProxyPayload;
  uint64_t v3 = [(MCPayload *)&v16 verboseDescription];
  uint64_t v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = [(MCGlobalHTTPProxyPayload *)self proxyServer];
  [v4 appendFormat:@"Server      : %@\n", v5];

  uint64_t v6 = [(MCGlobalHTTPProxyPayload *)self proxyServerPort];

  if (v6)
  {
    uint64_t v7 = [(MCGlobalHTTPProxyPayload *)self proxyServerPort];
    [v4 appendFormat:@"Port        : %@\n", v7];
  }
  if (![(MCGlobalHTTPProxyPayload *)self proxyType])
  {
    [v4 appendFormat:@"Type        : Auto\n"];
    v13 = [(MCGlobalHTTPProxyPayload *)self proxyPACURLString];
    [v4 appendFormat:@"PAC         : %@\n", v13];

    uint64_t v12 = MCStringForBool([(MCGlobalHTTPProxyPayload *)self proxyPACFallbackAllowed]);
    [v4 appendFormat:@" fallback   : %@\n", v12];
    goto LABEL_12;
  }
  if ([(MCGlobalHTTPProxyPayload *)self proxyType] == 1)
  {
    [v4 appendFormat:@"Type        : Manual\n"];
    uint64_t v8 = [(MCGlobalHTTPProxyPayload *)self proxyUsername];

    if (v8)
    {
      uint64_t v9 = [(MCGlobalHTTPProxyPayload *)self proxyUsername];
      [v4 appendFormat:@"User        : %@\n", v9];
    }
    v10 = [(MCGlobalHTTPProxyPayload *)self proxyPassword];

    if (v10) {
      [v4 appendFormat:@"Pass        : (present)\n"];
    }
    uint64_t v11 = [(MCGlobalHTTPProxyPayload *)self credentialUUID];

    if (v11)
    {
      uint64_t v12 = [(MCGlobalHTTPProxyPayload *)self credentialUUID];
      [v4 appendFormat:@"Cred UUID   : %@\n", v12];
LABEL_12:
    }
  }
  uint64_t v14 = MCStringForBool([(MCGlobalHTTPProxyPayload *)self proxyCaptiveLoginAllowed]);
  [v4 appendFormat:@"Captive OK  : %@\n", v14];

  return v4;
}

- (id)installationWarnings
{
  uint64_t v2 = MCLocalizedString(@"INSTALL_WARNING_HTTP_PROXY_TITLE");
  uint64_t v3 = MCLocalizedStringByDevice(@"INSTALL_WARNING_HTTP_PROXY");
  uint64_t v4 = +[MCProfileWarning warningWithLocalizedTitle:v2 localizedBody:v3 isLongForm:1];

  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObject:v4];

  return v5;
}

- (int)proxyType
{
  return self->_proxyType;
}

- (void)setProxyType:(int)a3
{
  self->_int proxyType = a3;
}

- (NSString)proxyServer
{
  return self->_proxyServer;
}

- (void)setProxyServer:(id)a3
{
}

- (NSNumber)proxyServerPort
{
  return self->_proxyServerPort;
}

- (void)setProxyServerPort:(id)a3
{
}

- (NSString)proxyUsername
{
  return self->_proxyUsername;
}

- (void)setProxyUsername:(id)a3
{
}

- (NSString)proxyPassword
{
  return self->_proxyPassword;
}

- (void)setProxyPassword:(id)a3
{
}

- (NSString)proxyPACURLString
{
  return self->_proxyPACURLString;
}

- (void)setProxyPACURLString:(id)a3
{
}

- (NSString)credentialUUID
{
  return self->_credentialUUID;
}

- (void)setCredentialUUID:(id)a3
{
}

- (BOOL)proxyPACFallbackAllowed
{
  return self->_proxyPACFallbackAllowed;
}

- (void)setProxyPACFallbackAllowed:(BOOL)a3
{
  self->_proxyPACFallbackAllowed = a3;
}

- (BOOL)proxyCaptiveLoginAllowed
{
  return self->_proxyCaptiveLoginAllowed;
}

- (void)setProxyCaptiveLoginAllowed:(BOOL)a3
{
  self->_proxyCaptiveLoginAllowed = a3;
}

- (NSNumber)proxyPACFallbackAllowedNum
{
  return self->_proxyPACFallbackAllowedNum;
}

- (void)setProxyPACFallbackAllowedNum:(id)a3
{
}

- (NSNumber)proxyCaptiveLoginAllowedNum
{
  return self->_proxyCaptiveLoginAllowedNum;
}

- (void)setProxyCaptiveLoginAllowedNum:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyCaptiveLoginAllowedNum, 0);
  objc_storeStrong((id *)&self->_proxyPACFallbackAllowedNum, 0);
  objc_storeStrong((id *)&self->_credentialUUID, 0);
  objc_storeStrong((id *)&self->_proxyPACURLString, 0);
  objc_storeStrong((id *)&self->_proxyPassword, 0);
  objc_storeStrong((id *)&self->_proxyUsername, 0);
  objc_storeStrong((id *)&self->_proxyServerPort, 0);
  objc_storeStrong((id *)&self->_proxyServer, 0);
}

@end