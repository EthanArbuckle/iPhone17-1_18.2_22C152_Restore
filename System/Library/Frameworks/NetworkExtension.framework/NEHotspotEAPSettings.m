@interface NEHotspotEAPSettings
+ (BOOL)supportsSecureCoding;
- (BOOL)isTLSClientCertificateRequired;
- (BOOL)setIdentity:(SecIdentityRef)identity;
- (BOOL)setTrustedServerCertificates:(NSArray *)certificates;
- (NEHotspotConfigurationEAPTLSVersion)preferredTLSVersion;
- (NEHotspotConfigurationTTLSInnerAuthenticationType)ttlsInnerAuthenticationType;
- (NEHotspotEAPSettings)initWithCoder:(id)a3;
- (NSArray)clientTrustChainReference;
- (NSArray)supportedEAPTypes;
- (NSArray)trustedServerCertificateReferences;
- (NSArray)trustedServerNames;
- (NSData)identityReference;
- (NSString)outerIdentity;
- (NSString)password;
- (NSString)username;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setClientTrustChainReference:(id)a3;
- (void)setIdentityReference:(id)a3;
- (void)setOuterIdentity:(NSString *)outerIdentity;
- (void)setPassword:(NSString *)password;
- (void)setPreferredTLSVersion:(NEHotspotConfigurationEAPTLSVersion)preferredTLSVersion;
- (void)setSupportedEAPTypes:(NSArray *)supportedEAPTypes;
- (void)setTlsClientCertificateRequired:(BOOL)tlsClientCertificateRequired;
- (void)setTrustedServerCertificateReferences:(id)a3;
- (void)setTrustedServerNames:(NSArray *)trustedServerNames;
- (void)setTtlsInnerAuthenticationType:(NEHotspotConfigurationTTLSInnerAuthenticationType)ttlsInnerAuthenticationType;
- (void)setUsername:(NSString *)username;
@end

@implementation NEHotspotEAPSettings

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trustedServerCertificateReferences, 0);
  objc_storeStrong((id *)&self->_identityReference, 0);
  objc_storeStrong((id *)&self->_clientTrustChainReference, 0);
  objc_storeStrong((id *)&self->_trustedServerNames, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_outerIdentity, 0);
  objc_storeStrong((id *)&self->_username, 0);

  objc_storeStrong((id *)&self->_supportedEAPTypes, 0);
}

- (void)setTrustedServerCertificateReferences:(id)a3
{
}

- (NSArray)trustedServerCertificateReferences
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setIdentityReference:(id)a3
{
}

- (NSData)identityReference
{
  return (NSData *)objc_getProperty(self, a2, 80, 1);
}

- (void)setClientTrustChainReference:(id)a3
{
}

- (NSArray)clientTrustChainReference
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setPreferredTLSVersion:(NEHotspotConfigurationEAPTLSVersion)preferredTLSVersion
{
  self->_preferredTLSVersion = preferredTLSVersion;
}

- (NEHotspotConfigurationEAPTLSVersion)preferredTLSVersion
{
  return self->_preferredTLSVersion;
}

- (void)setTlsClientCertificateRequired:(BOOL)tlsClientCertificateRequired
{
  self->_tlsClientCertificateRequired = tlsClientCertificateRequired;
}

- (BOOL)isTLSClientCertificateRequired
{
  return self->_tlsClientCertificateRequired;
}

- (void)setTrustedServerNames:(NSArray *)trustedServerNames
{
}

- (NSArray)trustedServerNames
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPassword:(NSString *)password
{
}

- (NSString)password
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setTtlsInnerAuthenticationType:(NEHotspotConfigurationTTLSInnerAuthenticationType)ttlsInnerAuthenticationType
{
  self->_ttlsInnerAuthenticationType = ttlsInnerAuthenticationType;
}

- (NEHotspotConfigurationTTLSInnerAuthenticationType)ttlsInnerAuthenticationType
{
  return self->_ttlsInnerAuthenticationType;
}

- (void)setOuterIdentity:(NSString *)outerIdentity
{
}

- (NSString)outerIdentity
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setUsername:(NSString *)username
{
}

- (NSString)username
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSupportedEAPTypes:(NSArray *)supportedEAPTypes
{
}

- (NSArray)supportedEAPTypes
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)setIdentity:(SecIdentityRef)identity
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  CFTypeRef result = 0;
  if (identity)
  {
    objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E4F3BD48], *MEMORY[0x1E4F1CFD0], *MEMORY[0x1E4F3BC78], 0);
    CFDictionaryRef v4 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    OSStatus v5 = SecItemCopyMatching(v4, &result);
    if (v5)
    {
      OSStatus v6 = v5;
      p_super = ne_log_obj();
      if (!os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
        goto LABEL_4;
      }
      v15 = objc_opt_class();
      *(_DWORD *)buf = 138412546;
      id v19 = v15;
      __int16 v20 = 1024;
      OSStatus v21 = v6;
      id v11 = v15;
      v12 = "%@ failed to find persistent reference for identity. status = %d";
      v13 = p_super;
      uint32_t v14 = 18;
    }
    else
    {
      if (result)
      {
        p_super = &self->_identityReference->super;
        self->_identityReference = (NSData *)result;
        BOOL v8 = 1;
        goto LABEL_10;
      }
      p_super = ne_log_obj();
      if (!os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
LABEL_4:
        BOOL v8 = 0;
LABEL_10:

        goto LABEL_11;
      }
      v10 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      id v19 = v10;
      id v11 = v10;
      v12 = "%@ found nil persistent reference for identity";
      v13 = p_super;
      uint32_t v14 = 12;
    }
    _os_log_error_impl(&dword_19DDAF000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);

    goto LABEL_4;
  }
  ne_log_obj();
  CFDictionaryRef v4 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = (id)objc_opt_class();
    id v16 = v19;
    _os_log_error_impl(&dword_19DDAF000, (os_log_t)v4, OS_LOG_TYPE_ERROR, "%@ invalid input data for identity", buf, 0xCu);
  }
  BOOL v8 = 0;
LABEL_11:

  return v8;
}

- (BOOL)setTrustedServerCertificates:(NSArray *)certificates
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  CFDictionaryRef v4 = certificates;
  OSStatus v5 = v4;
  CFTypeRef result = 0;
  if (v4 && [(NSArray *)v4 count] && [(NSArray *)v5 count] < 0xB)
  {
    v9 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E4F1CFD0], *MEMORY[0x1E4F3BC78], 0);
    OSStatus v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v10 = v5;
    uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v30 objects:v39 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v31;
      uint64_t v14 = *MEMORY[0x1E4F3BD48];
      v29 = self;
LABEL_10:
      uint64_t v15 = 0;
      while (1)
      {
        if (*(void *)v31 != v13) {
          objc_enumerationMutation(v10);
        }
        id v16 = *(const void **)(*((void *)&v30 + 1) + 8 * v15);
        CFTypeID v17 = CFGetTypeID(v16);
        if (v17 != SecCertificateGetTypeID()) {
          break;
        }
        [v9 setObject:v16 forKeyedSubscript:v14];
        OSStatus v18 = SecItemCopyMatching((CFDictionaryRef)v9, &result);
        if (v18)
        {
          OSStatus v24 = v18;
          __int16 v20 = ne_log_obj();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            v25 = objc_opt_class();
            *(_DWORD *)buf = 138412546;
            id v36 = v25;
            __int16 v37 = 1024;
            OSStatus v38 = v24;
            id v22 = v25;
            v23 = "%@ failed to find persistent reference for trusted server certificate. status = %d";
            v26 = v20;
            uint32_t v27 = 18;
            goto LABEL_30;
          }
LABEL_26:

          BOOL v7 = 0;
          goto LABEL_27;
        }
        if (!result)
        {
          __int16 v20 = ne_log_obj();
          if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            goto LABEL_26;
          }
          v28 = objc_opt_class();
          *(_DWORD *)buf = 138412290;
          id v36 = v28;
          id v22 = v28;
          v23 = "%@ found nil persistent reference for trusted server certificate";
LABEL_29:
          v26 = v20;
          uint32_t v27 = 12;
LABEL_30:
          _os_log_error_impl(&dword_19DDAF000, v26, OS_LOG_TYPE_ERROR, v23, buf, v27);

          goto LABEL_26;
        }
        -[NSObject addObject:](v6, "addObject:");
        CFRelease(result);
        if (v12 == ++v15)
        {
          uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v30 objects:v39 count:16];
          self = v29;
          if (v12) {
            goto LABEL_10;
          }
          goto LABEL_18;
        }
      }
      __int16 v20 = ne_log_obj();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        OSStatus v21 = objc_opt_class();
        *(_DWORD *)buf = 138412290;
        id v36 = v21;
        id v22 = v21;
        v23 = "%@ invalid certificate data type";
        goto LABEL_29;
      }
      goto LABEL_26;
    }
LABEL_18:

    if ([v6 count]) {
      objc_storeStrong((id *)&self->_trustedServerCertificateReferences, v6);
    }
    BOOL v7 = 1;
LABEL_27:
  }
  else
  {
    OSStatus v6 = ne_log_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v36 = (id)objc_opt_class();
      id v19 = v36;
      _os_log_error_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_ERROR, "%@ invalid input data for trusted server certificates", buf, 0xCu);
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v12 = a3;
  CFDictionaryRef v4 = [(NEHotspotEAPSettings *)self supportedEAPTypes];
  [v12 encodeObject:v4 forKey:@"SupportedEAPTypes"];

  OSStatus v5 = [(NEHotspotEAPSettings *)self username];
  [v12 encodeObject:v5 forKey:@"UserName"];

  OSStatus v6 = [(NEHotspotEAPSettings *)self outerIdentity];
  [v12 encodeObject:v6 forKey:@"OuterIdentity"];

  objc_msgSend(v12, "encodeInt64:forKey:", -[NEHotspotEAPSettings ttlsInnerAuthenticationType](self, "ttlsInnerAuthenticationType"), @"TTLSInnerAuthenticationType");
  BOOL v7 = [(NEHotspotEAPSettings *)self password];
  [v12 encodeObject:v7 forKey:@"UserPassword"];

  BOOL v8 = [(NEHotspotEAPSettings *)self identityReference];
  [v12 encodeObject:v8 forKey:@"IdentityReference"];

  v9 = [(NEHotspotEAPSettings *)self clientTrustChainReference];
  [v12 encodeObject:v9 forKey:@"ClientTrustChainReference"];

  v10 = [(NEHotspotEAPSettings *)self trustedServerNames];
  [v12 encodeObject:v10 forKey:@"TrustedServerNames"];

  uint64_t v11 = [(NEHotspotEAPSettings *)self trustedServerCertificateReferences];
  [v12 encodeObject:v11 forKey:@"TrustedServerCertificateRefs"];

  objc_msgSend(v12, "encodeBool:forKey:", -[NEHotspotEAPSettings isTLSClientCertificateRequired](self, "isTLSClientCertificateRequired"), @"TLSIsCertificateRequiredKey");
  objc_msgSend(v12, "encodeInt64:forKey:", -[NEHotspotEAPSettings preferredTLSVersion](self, "preferredTLSVersion"), @"PreferredTLSVersion");
}

- (NEHotspotEAPSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  OSStatus v5 = [(NEHotspotEAPSettings *)self init];
  if (v5)
  {
    OSStatus v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    BOOL v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"SupportedEAPTypes"];
    supportedEAPTypes = v5->_supportedEAPTypes;
    v5->_supportedEAPTypes = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UserName"];
    username = v5->_username;
    v5->_username = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"OuterIdentity"];
    outerIdentity = v5->_outerIdentity;
    v5->_outerIdentity = (NSString *)v13;

    v5->_ttlsInnerAuthenticationType = [v4 decodeInt64ForKey:@"TTLSInnerAuthenticationType"];
    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UserPassword"];
    password = v5->_password;
    v5->_password = (NSString *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"IdentityReference"];
    identityReference = v5->_identityReference;
    v5->_identityReference = (NSData *)v17;

    id v19 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v20 = objc_opt_class();
    OSStatus v21 = objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
    uint64_t v22 = [v4 decodeObjectOfClasses:v21 forKey:@"ClientTrustChainReference"];
    clientTrustChainReference = v5->_clientTrustChainReference;
    v5->_clientTrustChainReference = (NSArray *)v22;

    OSStatus v24 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v25 = objc_opt_class();
    v26 = objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
    uint64_t v27 = [v4 decodeObjectOfClasses:v26 forKey:@"TrustedServerNames"];
    trustedServerNames = v5->_trustedServerNames;
    v5->_trustedServerNames = (NSArray *)v27;

    v29 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v30 = objc_opt_class();
    long long v31 = objc_msgSend(v29, "setWithObjects:", v30, objc_opt_class(), 0);
    uint64_t v32 = [v4 decodeObjectOfClasses:v31 forKey:@"TrustedServerCertificateRefs"];
    trustedServerCertificateReferences = v5->_trustedServerCertificateReferences;
    v5->_trustedServerCertificateReferences = (NSArray *)v32;

    v5->_tlsClientCertificateRequired = [v4 decodeBoolForKey:@"TLSIsCertificateRequiredKey"];
    v5->_preferredTLSVersion = [v4 decodeInt64ForKey:@"PreferredTLSVersion"];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[NEHotspotEAPSettings allocWithZone:a3] init];
  [(NEHotspotEAPSettings *)v4 setSupportedEAPTypes:self->_supportedEAPTypes];
  [(NEHotspotEAPSettings *)v4 setUsername:self->_username];
  [(NEHotspotEAPSettings *)v4 setOuterIdentity:self->_outerIdentity];
  [(NEHotspotEAPSettings *)v4 setTtlsInnerAuthenticationType:self->_ttlsInnerAuthenticationType];
  [(NEHotspotEAPSettings *)v4 setPassword:self->_password];
  [(NEHotspotEAPSettings *)v4 setIdentityReference:self->_identityReference];
  [(NEHotspotEAPSettings *)v4 setClientTrustChainReference:self->_clientTrustChainReference];
  [(NEHotspotEAPSettings *)v4 setTrustedServerNames:self->_trustedServerNames];
  [(NEHotspotEAPSettings *)v4 setTrustedServerCertificateReferences:self->_trustedServerCertificateReferences];
  [(NEHotspotEAPSettings *)v4 setTlsClientCertificateRequired:self->_tlsClientCertificateRequired];
  [(NEHotspotEAPSettings *)v4 setPreferredTLSVersion:self->_preferredTLSVersion];
  return v4;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v4 = [(NEHotspotEAPSettings *)self supportedEAPTypes];
  [v3 appendPrettyObject:v4 withName:@"Supported EAP Types" andIndent:0 options:0];

  OSStatus v5 = [(NEHotspotEAPSettings *)self username];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    uint64_t v7 = [(NEHotspotEAPSettings *)self username];
    [v3 appendPrettyObject:v7 withName:@"Username" andIndent:0 options:0];
  }
  BOOL v8 = [(NEHotspotEAPSettings *)self password];
  uint64_t v9 = [v8 length];

  if (v9)
  {
    v10 = [(NEHotspotEAPSettings *)self password];
    [v3 appendPrettyObject:v10 withName:@"Password" andIndent:0 options:3];
  }
  uint64_t v11 = [(NEHotspotEAPSettings *)self outerIdentity];
  uint64_t v12 = [v11 length];

  if (v12)
  {
    uint64_t v13 = [(NEHotspotEAPSettings *)self outerIdentity];
    [v3 appendPrettyObject:v13 withName:@"Outer Identity" andIndent:0 options:0];
  }
  uint64_t v14 = [(NEHotspotEAPSettings *)self trustedServerNames];

  if (v14)
  {
    uint64_t v15 = [(NEHotspotEAPSettings *)self trustedServerNames];
    [v3 appendPrettyObject:v15 withName:@"Trusted Server Names" andIndent:0 options:0];
  }
  if ([(NEHotspotEAPSettings *)self isTLSClientCertificateRequired]) {
    id v16 = @"YES";
  }
  else {
    id v16 = @"NO";
  }
  [v3 appendPrettyObject:v16 withName:@"TLS Client Certificate Required" andIndent:0 options:0];
  NEHotspotConfigurationEAPTLSVersion v17 = [(NEHotspotEAPSettings *)self preferredTLSVersion];
  if ((unint64_t)v17 > NEHotspotConfigurationEAPTLSVersion_1_2) {
    OSStatus v18 = @"TLS 1.2";
  }
  else {
    OSStatus v18 = off_1E598FFB8[v17];
  }
  [v3 appendPrettyObject:v18 withName:@"Preferred TLS Version" andIndent:0 options:0];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end