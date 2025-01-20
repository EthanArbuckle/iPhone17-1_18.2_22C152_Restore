@interface NERelay
+ (BOOL)supportsSecureCoding;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (BOOL)identityDataImported;
- (NEIdentityKeychainItem)identity;
- (NEKeychainItem)identityDataPasswordKeychainItem;
- (NERelay)init;
- (NERelay)initWithCoder:(id)a3;
- (NSArray)certificateReferences;
- (NSArray)rawPublicKeys;
- (NSData)identityDataHash;
- (NSData)identityDataInternal;
- (NSData)identityReferenceInternal;
- (NSDictionary)additionalHTTPHeaderFields;
- (NSString)identityDataPassword;
- (NSString)syntheticDNSAnswerIPv4Prefix;
- (NSString)syntheticDNSAnswerIPv6Prefix;
- (NSURL)HTTP2RelayURL;
- (NSURL)HTTP3RelayURL;
- (NSURL)dnsOverHTTPSURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (void)clearKeychainItemsInDomain:(int64_t)a3 removeItems:(BOOL)a4;
- (void)copyPasswordsFromKeychainInDomain:(int64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAdditionalHTTPHeaderFields:(NSDictionary *)additionalHTTPHeaderFields;
- (void)setCertificateReferences:(id)a3;
- (void)setDnsOverHTTPSURL:(NSURL *)dnsOverHTTPSURL;
- (void)setHTTP2RelayURL:(NSURL *)HTTP2RelayURL;
- (void)setHTTP3RelayURL:(NSURL *)HTTP3RelayURL;
- (void)setIdentity:(id)a3;
- (void)setIdentityData:(NSData *)identityData;
- (void)setIdentityDataHash:(id)a3;
- (void)setIdentityDataImported:(BOOL)a3;
- (void)setIdentityDataInternal:(id)a3;
- (void)setIdentityDataPassword:(NSString *)identityDataPassword;
- (void)setIdentityDataPasswordKeychainItem:(id)a3;
- (void)setIdentityReferenceInternal:(id)a3;
- (void)setIdentityWithKey:(id)a3 keyRef:(id)a4;
- (void)setRawPublicKeys:(NSArray *)rawPublicKeys;
- (void)setSyntheticDNSAnswerIPv4Prefix:(NSString *)syntheticDNSAnswerIPv4Prefix;
- (void)setSyntheticDNSAnswerIPv6Prefix:(NSString *)syntheticDNSAnswerIPv6Prefix;
- (void)syncWithKeychainInDomainCommon:(int64_t)a3;
@end

@implementation NERelay

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_identityDataPasswordKeychainItem, 0);
  objc_storeStrong((id *)&self->_identityDataHash, 0);
  objc_storeStrong((id *)&self->_identityDataInternal, 0);
  objc_storeStrong((id *)&self->_certificates, 0);
  objc_storeStrong((id *)&self->_keychainAccessGroup, 0);
  objc_storeStrong((id *)&self->_identityDataPassword, 0);
  objc_storeStrong((id *)&self->_rawPublicKeys, 0);
  objc_storeStrong((id *)&self->_additionalHTTPHeaderFields, 0);
  objc_storeStrong((id *)&self->_syntheticDNSAnswerIPv6Prefix, 0);
  objc_storeStrong((id *)&self->_syntheticDNSAnswerIPv4Prefix, 0);
  objc_storeStrong((id *)&self->_dnsOverHTTPSURL, 0);
  objc_storeStrong((id *)&self->_HTTP2RelayURL, 0);

  objc_storeStrong((id *)&self->_HTTP3RelayURL, 0);
}

- (void)setIdentity:(id)a3
{
}

- (NEIdentityKeychainItem)identity
{
  return (NEIdentityKeychainItem *)objc_getProperty(self, a2, 128, 1);
}

- (void)setIdentityDataPasswordKeychainItem:(id)a3
{
}

- (NEKeychainItem)identityDataPasswordKeychainItem
{
  return (NEKeychainItem *)objc_getProperty(self, a2, 120, 1);
}

- (void)setIdentityDataHash:(id)a3
{
}

- (NSData)identityDataHash
{
  return (NSData *)objc_getProperty(self, a2, 112, 1);
}

- (void)setIdentityDataImported:(BOOL)a3
{
  self->_identityDataImported = a3;
}

- (BOOL)identityDataImported
{
  return self->_identityDataImported;
}

- (void)setIdentityDataInternal:(id)a3
{
}

- (NSData)identityDataInternal
{
  return (NSData *)objc_getProperty(self, a2, 104, 1);
}

- (void)setIdentityDataPassword:(NSString *)identityDataPassword
{
}

- (NSString)identityDataPassword
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setRawPublicKeys:(NSArray *)rawPublicKeys
{
}

- (NSArray)rawPublicKeys
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAdditionalHTTPHeaderFields:(NSDictionary *)additionalHTTPHeaderFields
{
}

- (NSDictionary)additionalHTTPHeaderFields
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSyntheticDNSAnswerIPv6Prefix:(NSString *)syntheticDNSAnswerIPv6Prefix
{
}

- (NSString)syntheticDNSAnswerIPv6Prefix
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSyntheticDNSAnswerIPv4Prefix:(NSString *)syntheticDNSAnswerIPv4Prefix
{
}

- (NSString)syntheticDNSAnswerIPv4Prefix
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDnsOverHTTPSURL:(NSURL *)dnsOverHTTPSURL
{
}

- (NSURL)dnsOverHTTPSURL
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (void)setHTTP2RelayURL:(NSURL *)HTTP2RelayURL
{
}

- (NSURL)HTTP2RelayURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (void)setHTTP3RelayURL:(NSURL *)HTTP3RelayURL
{
}

- (NSURL)HTTP3RelayURL
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (id)description
{
  return [(NERelay *)self descriptionWithIndent:0 options:0];
}

- (void)copyPasswordsFromKeychainInDomain:(int64_t)a3
{
  if (!a3)
  {
    v4 = [(NERelay *)self identityDataPasswordKeychainItem];

    if (v4)
    {
      id v6 = [(NERelay *)self identityDataPasswordKeychainItem];
      v5 = (void *)[v6 copyPassword];
      [(NERelay *)self setIdentityDataPassword:v5];
    }
  }
}

- (void)clearKeychainItemsInDomain:(int64_t)a3 removeItems:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [(NERelay *)self identityDataPasswordKeychainItem];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(NERelay *)self identityDataPasswordKeychainItem];
    uint64_t v10 = [v9 domain];

    if (v10 == a3)
    {
      v11 = [(NERelay *)self identityDataPasswordKeychainItem];
      [v11 setIdentifier:0];
    }
  }
  if (v4)
  {
    v12 = [(NERelay *)self identity];
    [v12 remove];

    [(NERelay *)self setIdentityData:0];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    if (self) {
      id Property = objc_getProperty(self, v13, 96, 1);
    }
    else {
      id Property = 0;
    }
    id v15 = Property;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v22 != v18) {
            objc_enumerationMutation(v15);
          }
          objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "remove", (void)v21);
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v17);
    }
  }
  else
  {
    [(NERelay *)self setIdentityData:0];
  }
  if (self) {
    objc_setProperty_atomic(self, v20, 0, 96);
  }
}

- (void)syncWithKeychainInDomainCommon:(int64_t)a3
{
  uint64_t v5 = [(NERelay *)self identity];
  if (v5)
  {
    id v6 = (void *)v5;
    uint64_t v7 = [(NERelay *)self identity];
    uint64_t v8 = [v7 domain];

    if (v8 == a3)
    {
      v9 = [(NERelay *)self identity];
      [v9 sync];
    }
  }
  if (!a3)
  {
    [(NERelay *)self setIdentityDataPassword:0];
  }
}

- (NSArray)certificateReferences
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  if (v2 && objc_getProperty(v2, v3, 96, 1))
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = objc_getProperty(v2, v5, 96, 1);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "persistentReference", (void)v12);
          if (v10) {
            [v4 addObject:v10];
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v4 = 0;
  }
  objc_sync_exit(v2);

  return (NSArray *)v4;
}

- (void)setCertificateReferences:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  SEL v5 = self;
  objc_sync_enter(v5);
  if (v4)
  {
    id newValue = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v22;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8 * v10);
          long long v13 = [NEKeychainItem alloc];
          if (v5)
          {
            int64_t keychainDomain = v5->_keychainDomain;
            id Property = objc_getProperty(v5, v12, 88, 1);
          }
          else
          {
            int64_t keychainDomain = 0;
            id Property = 0;
          }
          id v16 = Property;
          uint64_t v17 = [(NEKeychainItem *)v13 initWithPersistentReference:v11 domain:keychainDomain accessGroup:v16];

          if (v17) {
            [newValue addObject:v17];
          }

          ++v10;
        }
        while (v8 != v10);
        uint64_t v18 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
        uint64_t v8 = v18;
      }
      while (v18);
    }

    if (v5) {
      objc_setProperty_atomic(v5, v19, newValue, 96);
    }
  }
  else if (v5)
  {
    objc_setProperty_atomic(v5, v6, 0, 96);
  }
  objc_sync_exit(v5);
}

- (void)setIdentityData:(NSData *)identityData
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = identityData;
  -[NERelay setIdentityDataInternal:](self, "setIdentityDataInternal:", v4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  if (v4)
  {
    CC_SHA1_Init(&v7);
    SEL v5 = v4;
    CC_SHA1_Update(&v7, [(NSData *)v5 bytes], [(NSData *)v5 length]);
    CC_SHA1_Final(md, &v7);
    id v6 = [MEMORY[0x1E4F1C9B8] dataWithBytes:md length:20];
    [(NERelay *)self setIdentityDataHash:v6];
  }
  else
  {
    [(NERelay *)self setIdentityDataHash:0];
  }
}

- (NSData)identityReferenceInternal
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(NERelay *)v2 identity];

  if (v3)
  {
    id v4 = [(NERelay *)v2 identity];
    v3 = [v4 persistentReference];
  }
  objc_sync_exit(v2);

  return (NSData *)v3;
}

- (void)setIdentityWithKey:(id)a3 keyRef:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  CC_SHA1_CTX v7 = self;
  objc_sync_enter(v7);
  uint64_t v9 = [NEIdentityKeychainItem alloc];
  if (v7)
  {
    int64_t keychainDomain = v7->_keychainDomain;
    id Property = objc_getProperty(v7, v8, 88, 1);
  }
  else
  {
    int64_t keychainDomain = 0;
    id Property = 0;
  }
  id v12 = Property;
  long long v13 = [(NEKeychainItem *)v9 initWithPersistentReference:v14 keyReference:v6 isModernSystem:1 domain:keychainDomain accessGroup:v12];
  [(NERelay *)v7 setIdentity:v13];

  objc_sync_exit(v7);
}

- (void)setIdentityReferenceInternal:(id)a3
{
  id v12 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  if (v12)
  {
    SEL v5 = [(NERelay *)v4 identity];

    if (v5)
    {
      id v6 = [(NERelay *)v4 identity];
      [v6 setPersistentReference:v12];
    }
    else
    {
      uint64_t v8 = [NEIdentityKeychainItem alloc];
      if (v4)
      {
        int64_t keychainDomain = v4->_keychainDomain;
        id Property = objc_getProperty(v4, v7, 88, 1);
      }
      else
      {
        int64_t keychainDomain = 0;
        id Property = 0;
      }
      id v6 = Property;
      uint64_t v11 = [(NEKeychainItem *)v8 initWithPersistentReference:v12 domain:keychainDomain accessGroup:v6];
      [(NERelay *)v4 setIdentity:v11];
    }
  }
  else
  {
    [(NERelay *)v4 setIdentity:0];
  }
  objc_sync_exit(v4);
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  CC_SHA1_CTX v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:0];
  unint64_t v8 = a4 & 0xFFFFFFFFFFFFFFF7;
  uint64_t v9 = [(NERelay *)self HTTP3RelayURL];
  unint64_t v10 = a4 | 9;
  [v7 appendPrettyObject:v9 withName:@"HTTP3RelayURL" andIndent:v5 options:a4 | 9];

  uint64_t v11 = [(NERelay *)self HTTP2RelayURL];
  [v7 appendPrettyObject:v11 withName:@"HTTP2RelayURL" andIndent:v5 options:a4 | 9];

  id v12 = [(NERelay *)self dnsOverHTTPSURL];
  [v7 appendPrettyObject:v12 withName:@"dnsOverHTTPSURL" andIndent:v5 options:a4 | 9];

  long long v13 = [(NERelay *)self syntheticDNSAnswerIPv4Prefix];
  [v7 appendPrettyObject:v13 withName:@"syntheticDNSAnswerIPv4Prefix" andIndent:v5 options:a4 | 9];

  id v14 = [(NERelay *)self syntheticDNSAnswerIPv6Prefix];
  [v7 appendPrettyObject:v14 withName:@"syntheticDNSAnswerIPv6Prefix" andIndent:v5 options:a4 | 9];

  long long v15 = [(NERelay *)self identity];
  [v7 appendPrettyObject:v15 withName:@"identity" andIndent:v5 options:a4 & 0xFFFFFFFFFFFFFFF7];

  id v16 = [(NERelay *)self identityDataInternal];
  if (v16)
  {
    uint64_t v17 = NSString;
    uint64_t v18 = [(NERelay *)self identityDataInternal];
    v19 = objc_msgSend(v17, "stringWithFormat:", @"%lu bytes", objc_msgSend(v18, "length"));
    unint64_t v20 = a4 | 8;
    [v7 appendPrettyObject:v19 withName:@"identityData" andIndent:v5 options:v20];
  }
  else
  {
    unint64_t v20 = a4 | 8;
    [v7 appendPrettyObject:0 withName:@"identityData" andIndent:v5 options:v20];
  }

  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NERelay identityDataImported](self, "identityDataImported"), @"identityDataImported", v5, v8);
  long long v21 = [(NERelay *)self identityDataHash];
  [v7 appendPrettyObject:v21 withName:@"identityDataHash" andIndent:v5 options:v8];

  long long v22 = [(NERelay *)self identityDataPasswordKeychainItem];
  [v7 appendPrettyObject:v22 withName:@"identityDataPassword" andIndent:v5 options:v8];

  long long v23 = [(NERelay *)self identityReference];
  [v7 appendPrettyObject:v23 withName:@"identityReference" andIndent:v5 options:v20];

  long long v24 = [(NERelay *)self identityDataPassword];
  [v7 appendPrettyObject:v24 withName:@"identityDataPassword" andIndent:v5 options:v10];

  if (self) {
    id Property = objc_getProperty(self, v25, 96, 1);
  }
  else {
    id Property = 0;
  }
  [v7 appendPrettyObject:Property withName:@"certificates" andIndent:v5 options:v8];
  v27 = [(NERelay *)self additionalHTTPHeaderFields];
  [v7 appendPrettyObject:v27 withName:@"additionalHTTPHeaderFields" andIndent:v5 options:v8];

  v28 = [(NERelay *)self rawPublicKeys];
  [v7 appendPrettyObject:v28 withName:@"rawPublicKeys" andIndent:v5 options:v8];

  return v7;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(NERelay *)self HTTP3RelayURL];
  if (v5)
  {

LABEL_4:
    LOBYTE(v6) = 1;
    goto LABEL_5;
  }
  id v6 = [(NERelay *)self HTTP2RelayURL];

  if (v6) {
    goto LABEL_4;
  }
  +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Missing relay URL", v4);
LABEL_5:
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  CC_SHA1_CTX v7 = [(NERelay *)self additionalHTTPHeaderFields];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (isa_nsstring(v12))
        {
          long long v13 = [(NERelay *)self additionalHTTPHeaderFields];
          id v14 = [v13 objectForKeyedSubscript:v12];
          char v15 = isa_nsstring(v14);

          if (v15) {
            continue;
          }
        }
        +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Invalid HTTP headers", v4);
        LOBYTE(v6) = 0;
        goto LABEL_16;
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_16:

  return (char)v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NERelay *)self HTTP3RelayURL];
  [v4 setHTTP3RelayURL:v5];

  id v6 = [(NERelay *)self HTTP2RelayURL];
  [v4 setHTTP2RelayURL:v6];

  CC_SHA1_CTX v7 = [(NERelay *)self dnsOverHTTPSURL];
  [v4 setDnsOverHTTPSURL:v7];

  uint64_t v8 = [(NERelay *)self syntheticDNSAnswerIPv4Prefix];
  [v4 setSyntheticDNSAnswerIPv4Prefix:v8];

  uint64_t v9 = [(NERelay *)self syntheticDNSAnswerIPv6Prefix];
  [v4 setSyntheticDNSAnswerIPv6Prefix:v9];

  uint64_t v10 = [(NERelay *)self identity];
  [v4 setIdentity:v10];

  uint64_t v11 = [(NERelay *)self identityDataInternal];
  [v4 setIdentityDataInternal:v11];

  id v12 = [(NERelay *)self identityDataPassword];
  [v4 setIdentityDataPassword:v12];

  long long v13 = [(NERelay *)self identityDataPasswordKeychainItem];
  [v4 setIdentityDataPasswordKeychainItem:v13];

  objc_msgSend(v4, "setIdentityDataImported:", -[NERelay identityDataImported](self, "identityDataImported"));
  id v14 = [(NERelay *)self identityDataHash];
  [v4 setIdentityDataHash:v14];

  if (!self)
  {
    id Property = 0;
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id Property = objc_getProperty(self, v15, 96, 1);
  if (v4) {
LABEL_3:
  }
    objc_setProperty_atomic(v4, v15, Property, 96);
LABEL_4:
  long long v17 = [(NERelay *)self additionalHTTPHeaderFields];
  [v4 setAdditionalHTTPHeaderFields:v17];

  long long v18 = [(NERelay *)self rawPublicKeys];
  [v4 setRawPublicKeys:v18];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v20 = a3;
  id v4 = [(NERelay *)self HTTP3RelayURL];
  [v20 encodeObject:v4 forKey:@"HTTP3RelayURL"];

  uint64_t v5 = [(NERelay *)self HTTP2RelayURL];
  [v20 encodeObject:v5 forKey:@"HTTP2RelayURL"];

  id v6 = [(NERelay *)self dnsOverHTTPSURL];
  [v20 encodeObject:v6 forKey:@"DNSOverHTTPSURL"];

  CC_SHA1_CTX v7 = [(NERelay *)self syntheticDNSAnswerIPv4Prefix];
  [v20 encodeObject:v7 forKey:@"SyntheticIPv4Prefix"];

  uint64_t v8 = [(NERelay *)self syntheticDNSAnswerIPv6Prefix];
  [v20 encodeObject:v8 forKey:@"SyntheticIPv6Prefix"];

  uint64_t v9 = [(NERelay *)self identity];
  [v20 encodeObject:v9 forKey:@"Identity"];

  uint64_t v10 = [(NERelay *)self identityDataInternal];
  [v20 encodeObject:v10 forKey:@"IdentityData"];

  uint64_t v11 = [(NERelay *)self identityDataPassword];
  [v20 encodeObject:v11 forKey:@"IdentityDataPassword"];

  id v12 = [(NERelay *)self identityDataPasswordKeychainItem];
  [v20 encodeObject:v12 forKey:@"IdentityDataPasswordKeychainItem"];

  objc_msgSend(v20, "encodeBool:forKey:", -[NERelay identityDataImported](self, "identityDataImported"), @"IdentityDataImported");
  long long v13 = [(NERelay *)self identityDataHash];
  [v20 encodeObject:v13 forKey:@"IdentityDataHash"];

  if (self)
  {
    objc_msgSend(v20, "encodeObject:forKey:", objc_getProperty(self, v14, 96, 1), @"Certificates");
    char v15 = [(NERelay *)self additionalHTTPHeaderFields];
    [v20 encodeObject:v15 forKey:@"AdditionalHTTPHeaders"];

    id v16 = [(NERelay *)self rawPublicKeys];
    [v20 encodeObject:v16 forKey:@"RawPublicKeys"];

    long long v17 = [(NERelay *)self HTTP3RelayURL];
    if (v17)
    {
      self = 0;
    }
    else
    {
      long long v18 = [(NERelay *)self HTTP2RelayURL];
      self = (NERelay *)(v18 != 0);
    }
  }
  else
  {
    [v20 encodeObject:0 forKey:@"Certificates"];
    long long v19 = [0 additionalHTTPHeaderFields];
    [v20 encodeObject:v19 forKey:@"AdditionalHTTPHeaders"];

    long long v17 = [0 rawPublicKeys];
    [v20 encodeObject:v17 forKey:@"RawPublicKeys"];
  }

  [v20 encodeBool:self forKey:@"HTTP2Only"];
}

- (NERelay)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NERelay *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HTTP3RelayURL"];
    HTTP3RelayURL = v5->_HTTP3RelayURL;
    v5->_HTTP3RelayURL = (NSURL *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HTTP2RelayURL"];
    HTTP2RelayURL = v5->_HTTP2RelayURL;
    v5->_HTTP2RelayURL = (NSURL *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DNSOverHTTPSURL"];
    dnsOverHTTPSURL = v5->_dnsOverHTTPSURL;
    v5->_dnsOverHTTPSURL = (NSURL *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SyntheticIPv4Prefix"];
    syntheticDNSAnswerIPv4Prefix = v5->_syntheticDNSAnswerIPv4Prefix;
    v5->_syntheticDNSAnswerIPv4Prefix = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SyntheticIPv6Prefix"];
    syntheticDNSAnswerIPv6Prefix = v5->_syntheticDNSAnswerIPv6Prefix;
    v5->_syntheticDNSAnswerIPv6Prefix = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Identity"];
    identity = v5->_identity;
    v5->_identity = (NEIdentityKeychainItem *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"IdentityData"];
    identityDataInternal = v5->_identityDataInternal;
    v5->_identityDataInternal = (NSData *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"IdentityDataPassword"];
    identityDataPassword = v5->_identityDataPassword;
    v5->_identityDataPassword = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"IdentityDataPasswordKeychainItem"];
    identityDataPasswordKeychainItem = v5->_identityDataPasswordKeychainItem;
    v5->_identityDataPasswordKeychainItem = (NEKeychainItem *)v22;

    v5->_identityDataImported = [v4 decodeBoolForKey:@"IdentityDataImported"];
    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"IdentityDataHash"];
    identityDataHash = v5->_identityDataHash;
    v5->_identityDataHash = (NSData *)v24;

    uint64_t v26 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v27 = objc_opt_class();
    v28 = objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
    uint64_t v29 = [v4 decodeObjectOfClasses:v28 forKey:@"Certificates"];
    certificates = v5->_certificates;
    v5->_certificates = (NSArray *)v29;

    v31 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v32 = objc_opt_class();
    v33 = objc_msgSend(v31, "setWithObjects:", v32, objc_opt_class(), 0);
    uint64_t v34 = [v4 decodeObjectOfClasses:v33 forKey:@"AdditionalHTTPHeaders"];
    additionalHTTPHeaderFields = v5->_additionalHTTPHeaderFields;
    v5->_additionalHTTPHeaderFields = (NSDictionary *)v34;

    v36 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v37 = objc_opt_class();
    v38 = objc_msgSend(v36, "setWithObjects:", v37, objc_opt_class(), 0);
    uint64_t v39 = [v4 decodeObjectOfClasses:v38 forKey:@"RawPublicKeys"];
    rawPublicKeys = v5->_rawPublicKeys;
    v5->_rawPublicKeys = (NSArray *)v39;
  }
  return v5;
}

- (NERelay)init
{
  v3.receiver = self;
  v3.super_class = (Class)NERelay;
  result = [(NERelay *)&v3 init];
  if (result) {
    result->_int64_t keychainDomain = 0;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end