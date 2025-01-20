@interface NEVPNProtocolIPSec
+ (BOOL)supportsSecureCoding;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (BOOL)extendedAuthPasswordPrompt;
- (BOOL)needToUpdateKeychain;
- (BOOL)useExtendedAuthentication;
- (NEKeychainItem)sharedSecretKeychainItem;
- (NEVPNIKEAuthenticationMethod)authenticationMethod;
- (NEVPNProtocolIPSec)init;
- (NEVPNProtocolIPSec)initWithCoder:(id)a3;
- (NEVPNProtocolIPSec)initWithType:(int64_t)a3;
- (NSArray)legacyExchangeMode;
- (NSArray)legacyProposals;
- (NSData)sharedSecretReference;
- (NSString)localIdentifier;
- (NSString)remoteIdentifier;
- (__SCNetworkInterface)createInterface;
- (id)copyLegacyDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)initFromLegacyDictionary:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)migratePasswordsFromPreferences:(__SCPreferences *)a3;
- (void)removeKeychainItemsInDomain:(int64_t)a3 keepIdentity:(BOOL)a4;
- (void)setAuthenticationMethod:(NEVPNIKEAuthenticationMethod)authenticationMethod;
- (void)setExtendedAuthPasswordPrompt:(BOOL)a3;
- (void)setLegacyExchangeMode:(id)a3;
- (void)setLegacyProposals:(id)a3;
- (void)setLocalIdentifier:(NSString *)localIdentifier;
- (void)setRemoteIdentifier:(NSString *)remoteIdentifier;
- (void)setSharedSecretKeychainItem:(id)a3;
- (void)setSharedSecretReference:(NSData *)sharedSecretReference;
- (void)setUseExtendedAuthentication:(BOOL)useExtendedAuthentication;
- (void)syncWithKeychainInDomain:(int64_t)a3 configuration:(id)a4 suffix:(id)a5;
@end

@implementation NEVPNProtocolIPSec

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacyExchangeMode, 0);
  objc_storeStrong((id *)&self->_legacyProposals, 0);
  objc_storeStrong((id *)&self->_sharedSecretKeychainItem, 0);
  objc_storeStrong((id *)&self->_remoteIdentifier, 0);
  objc_storeStrong((id *)&self->_localIdentifier, 0);

  objc_storeStrong((id *)&self->_sharedSecretReference, 0);
}

- (void)setExtendedAuthPasswordPrompt:(BOOL)a3
{
  self->_extendedAuthPasswordPrompt = a3;
}

- (BOOL)extendedAuthPasswordPrompt
{
  return self->_extendedAuthPasswordPrompt;
}

- (void)setLegacyExchangeMode:(id)a3
{
}

- (NSArray)legacyExchangeMode
{
  return (NSArray *)objc_getProperty(self, a2, 232, 1);
}

- (void)setLegacyProposals:(id)a3
{
}

- (NSArray)legacyProposals
{
  return (NSArray *)objc_getProperty(self, a2, 224, 1);
}

- (void)setSharedSecretKeychainItem:(id)a3
{
}

- (NEKeychainItem)sharedSecretKeychainItem
{
  return (NEKeychainItem *)objc_getProperty(self, a2, 216, 1);
}

- (void)setRemoteIdentifier:(NSString *)remoteIdentifier
{
}

- (NSString)remoteIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 208, 1);
}

- (void)setLocalIdentifier:(NSString *)localIdentifier
{
}

- (NSString)localIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (void)setSharedSecretReference:(NSData *)sharedSecretReference
{
}

- (NSData)sharedSecretReference
{
  return (NSData *)objc_getProperty(self, a2, 176, 1);
}

- (void)setUseExtendedAuthentication:(BOOL)useExtendedAuthentication
{
  self->_useExtendedAuthentication = useExtendedAuthentication;
}

- (BOOL)useExtendedAuthentication
{
  return self->_useExtendedAuthentication;
}

- (void)setAuthenticationMethod:(NEVPNIKEAuthenticationMethod)authenticationMethod
{
  self->_authenticationMethod = authenticationMethod;
}

- (NEVPNIKEAuthenticationMethod)authenticationMethod
{
  return self->_authenticationMethod;
}

- (void)migratePasswordsFromPreferences:(__SCPreferences *)a3
{
  v5 = [(NEVPNProtocol *)self passwordKeychainItem];
  [v5 migrateFromPreferences:a3];

  id v6 = [(NEVPNProtocolIPSec *)self sharedSecretKeychainItem];
  [v6 migrateFromPreferences:a3];
}

- (void)removeKeychainItemsInDomain:(int64_t)a3 keepIdentity:(BOOL)a4
{
  v11.receiver = self;
  v11.super_class = (Class)NEVPNProtocolIPSec;
  [(NEVPNProtocol *)&v11 removeKeychainItemsInDomain:a3 keepIdentity:a4];
  uint64_t v6 = [(NEVPNProtocolIPSec *)self sharedSecretKeychainItem];
  if (v6)
  {
    v7 = (void *)v6;
    v8 = [(NEVPNProtocolIPSec *)self sharedSecretKeychainItem];
    uint64_t v9 = [v8 domain];

    if (v9 == a3)
    {
      v10 = [(NEVPNProtocolIPSec *)self sharedSecretKeychainItem];
      [v10 setIdentifier:0];
    }
  }
}

- (BOOL)needToUpdateKeychain
{
  v8.receiver = self;
  v8.super_class = (Class)NEVPNProtocolIPSec;
  if ([(NEVPNProtocol *)&v8 needToUpdateKeychain]) {
    return 1;
  }
  v4 = [(NEVPNProtocolIPSec *)self sharedSecretKeychainItem];
  if (v4)
  {
    v5 = [(NEVPNProtocolIPSec *)self sharedSecretKeychainItem];
    uint64_t v6 = [v5 password];
    BOOL v3 = [v6 length] != 0;
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (void)syncWithKeychainInDomain:(int64_t)a3 configuration:(id)a4 suffix:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = v9;
  if (v9)
  {
    objc_super v11 = [v9 stringByAppendingString:@".XAUTH"];
    v12 = [v10 stringByAppendingString:@".SS"];
    v13 = [v10 stringByAppendingString:@".IDDATA"];
  }
  else
  {
    v12 = @"SS";
    objc_super v11 = @"XAUTH";
    v13 = @"IDDATA";
  }
  v58.receiver = self;
  v58.super_class = (Class)NEVPNProtocolIPSec;
  [(NEVPNProtocol *)&v58 syncWithKeychainInDomainCommon:a3];
  uint64_t v14 = [(NEVPNProtocol *)self username];
  if (v14)
  {
    v15 = (void *)v14;
    v16 = [(NEVPNProtocol *)self passwordKeychainItem];

    if (!v16)
    {
      v56 = v13;
      v17 = NSString;
      v18 = [v8 identifier];
      v19 = [v18 UUIDString];
      v20 = [v17 stringWithFormat:@"%@.%@", v19, v11];

      v22 = [NEKeychainItem alloc];
      if (self)
      {
        int64_t keychainDomain = self->super._keychainDomain;
        id Property = objc_getProperty(self, v21, 88, 1);
      }
      else
      {
        int64_t keychainDomain = 0;
        id Property = 0;
      }
      id v25 = Property;
      v26 = [(NEKeychainItem *)v22 initWithIdentifier:v20 domain:keychainDomain accessGroup:v25];
      [(NEVPNProtocol *)self setPasswordKeychainItem:v26];

      v13 = v56;
    }
  }
  uint64_t v27 = [(NEVPNProtocol *)self passwordKeychainItem];
  if (v27)
  {
    v28 = (void *)v27;
    v29 = [(NEVPNProtocol *)self passwordKeychainItem];
    uint64_t v30 = [v29 domain];

    if (v30 == a3)
    {
      v31 = [(NEVPNProtocol *)self passwordKeychainItem];
      v32 = [(NEVPNProtocol *)self username];
      [v31 syncUsingConfiguration:v8 accountName:v32 passwordType:1 identifierSuffix:v11];
    }
  }
  if ([(NEVPNProtocolIPSec *)self authenticationMethod] == NEVPNIKEAuthenticationMethodSharedSecret)
  {
    v33 = [(NEVPNProtocolIPSec *)self sharedSecretKeychainItem];

    if (!v33)
    {
      v57 = v13;
      v34 = NSString;
      v35 = [v8 identifier];
      v36 = [v35 UUIDString];
      v37 = [v34 stringWithFormat:@"%@.%@", v36, v12];

      v39 = [NEKeychainItem alloc];
      if (self)
      {
        int64_t v40 = self->super._keychainDomain;
        id v41 = objc_getProperty(self, v38, 88, 1);
      }
      else
      {
        int64_t v40 = 0;
        id v41 = 0;
      }
      id v42 = v41;
      v43 = [(NEKeychainItem *)v39 initWithIdentifier:v37 domain:v40 accessGroup:v42];
      [(NEVPNProtocolIPSec *)self setSharedSecretKeychainItem:v43];

      v13 = v57;
    }
  }
  uint64_t v44 = [(NEVPNProtocolIPSec *)self sharedSecretKeychainItem];
  if (v44)
  {
    v45 = (void *)v44;
    v46 = [(NEVPNProtocolIPSec *)self sharedSecretKeychainItem];
    uint64_t v47 = [v46 domain];

    if (v47 == a3)
    {
      v48 = [(NEVPNProtocolIPSec *)self sharedSecretKeychainItem];
      v49 = [(NEVPNProtocolIPSec *)self localIdentifier];
      [v48 syncUsingConfiguration:v8 accountName:v49 passwordType:2 identifierSuffix:v12];
    }
  }
  uint64_t v50 = [(NEVPNProtocol *)self identityDataPasswordKeychainItem];
  if (v50)
  {
    v51 = (void *)v50;
    v52 = [(NEVPNProtocol *)self identityDataPasswordKeychainItem];
    uint64_t v53 = [v52 domain];

    if (v53 == a3)
    {
      v54 = [(NEVPNProtocol *)self identityDataPasswordKeychainItem];
      v55 = [(NEVPNProtocolIPSec *)self localIdentifier];
      [v54 syncUsingConfiguration:v8 accountName:v55 passwordType:3 identifierSuffix:v13];
    }
  }
}

- (__SCNetworkInterface)createInterface
{
  return SCNetworkInterfaceCreateWithInterface((SCNetworkInterfaceRef)*MEMORY[0x1E4F41B50], (CFStringRef)*MEMORY[0x1E4F41B60]);
}

- (id)initFromLegacyDictionary:(id)a3
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"__NEVPNProtocolIdentifier"];
  int v6 = isa_nsuuid(v5);

  if (v6)
  {
    v7 = [v4 objectForKeyedSubscript:@"__NEVPNProtocolIdentifier"];
    id v8 = [(NEVPNProtocol *)self initWithProtocolIdentifier:v7];

    if (!v8) {
      goto LABEL_53;
    }
  }
  else
  {
    id v8 = [(NEVPNProtocolIPSec *)self init];
    if (!v8) {
      goto LABEL_53;
    }
  }
  uint64_t v9 = *MEMORY[0x1E4F41C10];
  v10 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41C10]];
  int v11 = isa_nsstring(v10);

  if (v11)
  {
    v12 = [v4 objectForKeyedSubscript:v9];
    [(NEVPNProtocol *)v8 setServerAddress:v12];
  }
  uint64_t v13 = *MEMORY[0x1E4F41C30];
  uint64_t v14 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41C30]];
  int v15 = isa_nsstring(v14);

  if (v15)
  {
    v16 = [v4 objectForKeyedSubscript:v13];
    [(NEVPNProtocol *)v8 setUsername:v16];

    [(NEVPNProtocolIPSec *)v8 setUseExtendedAuthentication:1];
  }
  v17 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41C40]];
  if (isa_nsstring(v17) && [v17 isEqualToString:*MEMORY[0x1E4F42078]]) {
    [(NEVPNProtocolIPSec *)v8 setExtendedAuthPasswordPrompt:1];
  }
  uint64_t v18 = *MEMORY[0x1E4F41C38];
  v19 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41C38]];
  int v20 = isa_nsstring(v19);

  if (v20)
  {
    if (isa_nsstring(v17) && [v17 isEqualToString:*MEMORY[0x1E4F42070]])
    {
      v21 = [NEKeychainItem alloc];
      v22 = [v4 objectForKeyedSubscript:v18];
      int64_t keychainDomain = v8->super._keychainDomain;
      id v25 = objc_getProperty(v8, v24, 88, 1);
      v26 = [(NEKeychainItem *)v21 initWithLegacyIdentifier:v22 domain:keychainDomain accessGroup:v25];
      [(NEVPNProtocol *)v8 setPasswordKeychainItem:v26];
    }
    uint64_t v27 = [(NEVPNProtocol *)v8 passwordKeychainItem];

    if (!v27)
    {
      v28 = [NEKeychainItem alloc];
      v29 = [v4 objectForKeyedSubscript:v18];
      int64_t v30 = v8->super._keychainDomain;
      id v32 = objc_getProperty(v8, v31, 88, 1);
      v33 = [(NEKeychainItem *)v28 initWithPassword:v29 domain:v30 accessGroup:v32];
      [(NEVPNProtocol *)v8 setPasswordKeychainItem:v33];
    }
    [(NEVPNProtocolIPSec *)v8 setUseExtendedAuthentication:1];
  }
  v34 = [v4 objectForKeyedSubscript:@"PasswordReference"];
  int v35 = isa_nsdata(v34);

  if (v35)
  {
    v36 = [v4 objectForKeyedSubscript:@"PasswordReference"];
    [(NEVPNProtocol *)v8 setPasswordReference:v36];
  }
  uint64_t v37 = *MEMORY[0x1E4F41C28];
  v38 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41C28]];
  int v39 = isa_nsnumber(v38);

  if (v39)
  {
    int64_t v40 = [v4 objectForKeyedSubscript:v37];
    -[NEVPNProtocolIPSec setUseExtendedAuthentication:](v8, "setUseExtendedAuthentication:", [v40 BOOLValue]);
  }
  uint64_t v41 = *MEMORY[0x1E4F41BF8];
  id v42 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41BF8]];
  int v43 = isa_nsdata(v42);

  if (v43)
  {
    uint64_t v44 = [v4 objectForKeyedSubscript:v41];
    [(NEVPNProtocol *)v8 setIdentityReferenceInternal:v44];
  }
  uint64_t v45 = *MEMORY[0x1E4F41C18];
  v46 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41C18]];
  int v47 = isa_nsstring(v46);

  if (v47)
  {
    v48 = [NEKeychainItem alloc];
    v49 = [v4 objectForKeyedSubscript:v45];
    int64_t v50 = v8->super._keychainDomain;
    id v52 = objc_getProperty(v8, v51, 88, 1);
    uint64_t v53 = [(NEKeychainItem *)v48 initWithLegacyIdentifier:v49 domain:v50 accessGroup:v52];
    sharedSecretKeychainItem = v8->_sharedSecretKeychainItem;
    v8->_sharedSecretKeychainItem = (NEKeychainItem *)v53;
  }
  uint64_t v55 = *MEMORY[0x1E4F41C00];
  v56 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41C00]];
  int v57 = isa_nsstring(v56);

  if (v57)
  {
    objc_super v58 = [v4 objectForKeyedSubscript:v55];
    uint64_t v59 = [v58 copy];
    localIdentifier = v8->_localIdentifier;
    v8->_localIdentifier = (NSString *)v59;
  }
  uint64_t v61 = *MEMORY[0x1E4F41BF0];
  v62 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41BF0]];
  int v63 = isa_nsstring(v62);

  if (v63)
  {
    v64 = [v4 objectForKeyedSubscript:v61];
    if ([v64 isEqualToString:*MEMORY[0x1E4F42058]])
    {
      uint64_t v65 = 2;
    }
    else
    {
      if (![v64 isEqualToString:*MEMORY[0x1E4F42050]])
      {
LABEL_36:

        goto LABEL_37;
      }
      uint64_t v65 = 1;
    }
    v8->_authenticationMethod = v65;
    goto LABEL_36;
  }
  v8->_authenticationMethod = 0;
LABEL_37:
  v66 = [v4 objectForKeyedSubscript:@"ExchangeMode"];
  int v67 = isa_nsarray(v66);

  if (v67)
  {
    v68 = [v4 objectForKeyedSubscript:@"ExchangeMode"];
    [(NEVPNProtocolIPSec *)v8 setLegacyExchangeMode:v68];
  }
  v69 = [v4 objectForKeyedSubscript:@"Proposals"];
  int v70 = isa_nsarray(v69);

  if (v70)
  {
    v71 = [MEMORY[0x1E4F1CA48] array];
    v72 = [v4 objectForKeyedSubscript:@"Proposals"];
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    uint64_t v73 = [v72 countByEnumeratingWithState:&v80 objects:v84 count:16];
    if (v73)
    {
      uint64_t v74 = v73;
      uint64_t v75 = *(void *)v81;
      do
      {
        for (uint64_t i = 0; i != v74; ++i)
        {
          if (*(void *)v81 != v75) {
            objc_enumerationMutation(v72);
          }
          id v77 = [[NEVPNIKEv1ProposalParameters alloc] initFromLegacyDictionary:*(void *)(*((void *)&v80 + 1) + 8 * i)];
          if (v77) {
            [v71 addObject:v77];
          }
        }
        uint64_t v74 = [v72 countByEnumeratingWithState:&v80 objects:v84 count:16];
      }
      while (v74);
    }
    if ([v71 count]) {
      [(NEVPNProtocolIPSec *)v8 setLegacyProposals:v71];
    }
  }
  [(NEVPNProtocol *)v8 initDisconnectOptions:v4];
  v78 = v8;

LABEL_53:
  return v8;
}

- (id)copyLegacyDictionary
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(NEVPNProtocol *)self serverAddress];

  if (v4)
  {
    v5 = [(NEVPNProtocol *)self serverAddress];
    [v3 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F41C10]];
  }
  if ([(NEVPNProtocolIPSec *)self authenticationMethod] == NEVPNIKEAuthenticationMethodCertificate)
  {
    int v6 = (void *)MEMORY[0x1E4F42050];
  }
  else
  {
    if ([(NEVPNProtocolIPSec *)self authenticationMethod] != NEVPNIKEAuthenticationMethodSharedSecret) {
      goto LABEL_8;
    }
    int v6 = (void *)MEMORY[0x1E4F42058];
  }
  [v3 setObject:*v6 forKeyedSubscript:*MEMORY[0x1E4F41BF0]];
LABEL_8:
  v7 = [(NEVPNProtocol *)self username];

  if (v7)
  {
    id v8 = [(NEVPNProtocol *)self username];
    [v3 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F41C30]];
  }
  uint64_t v9 = [(NEVPNProtocol *)self passwordKeychainItem];

  if (v9)
  {
    v10 = [(NEVPNProtocol *)self passwordKeychainItem];
    int v11 = [v10 password];

    v12 = [(NEVPNProtocol *)self passwordKeychainItem];
    uint64_t v13 = v12;
    if (v11)
    {
      uint64_t v14 = [v12 password];

      uint64_t v13 = (void *)v14;
      if (!v14) {
        goto LABEL_19;
      }
      goto LABEL_13;
    }
    uint64_t v15 = [v12 identifier];
    if (!v15) {
      goto LABEL_18;
    }
    v16 = (void *)v15;
    v17 = [(NEVPNProtocol *)self passwordKeychainItem];
    uint64_t v18 = [v17 persistentReference];

    if (v18)
    {
      v19 = [(NEVPNProtocol *)self passwordKeychainItem];
      uint64_t v13 = [v19 identifier];

      [v3 setObject:*MEMORY[0x1E4F42070] forKeyedSubscript:*MEMORY[0x1E4F41C40]];
      if (v13)
      {
LABEL_13:
        [v3 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F41C38]];
LABEL_18:
      }
    }
  }
LABEL_19:
  int v20 = [(NEVPNProtocol *)self passwordReference];

  if (v20)
  {
    v21 = [(NEVPNProtocol *)self passwordReference];
    [v3 setObject:v21 forKeyedSubscript:@"PasswordReference"];
  }
  v22 = [(NEVPNProtocolIPSec *)self sharedSecretReference];

  if (v22)
  {
    v23 = [(NEVPNProtocolIPSec *)self sharedSecretReference];
    [v3 setObject:v23 forKeyedSubscript:@"SharedSecretReference"];
  }
  SEL v24 = [(NEVPNProtocol *)self identityReferenceInternal];

  if (v24)
  {
    id v25 = [(NEVPNProtocol *)self identityReferenceInternal];
    [v3 setObject:v25 forKeyedSubscript:*MEMORY[0x1E4F41BF8]];
  }
  v26 = [(NEVPNProtocolIPSec *)self sharedSecretKeychainItem];

  if (v26)
  {
    uint64_t v27 = [(NEVPNProtocolIPSec *)self sharedSecretKeychainItem];
    v28 = [v27 password];

    v29 = [(NEVPNProtocolIPSec *)self sharedSecretKeychainItem];
    int64_t v30 = v29;
    if (v28)
    {
      uint64_t v31 = [v29 password];

      int64_t v30 = (void *)v31;
      if (!v31) {
        goto LABEL_34;
      }
      goto LABEL_28;
    }
    uint64_t v32 = [v29 identifier];
    if (!v32) {
      goto LABEL_33;
    }
    v33 = (void *)v32;
    v34 = [(NEVPNProtocolIPSec *)self sharedSecretKeychainItem];
    int v35 = [v34 persistentReference];

    if (v35)
    {
      v36 = [(NEVPNProtocolIPSec *)self sharedSecretKeychainItem];
      int64_t v30 = [v36 identifier];

      [v3 setObject:*MEMORY[0x1E4F42068] forKeyedSubscript:*MEMORY[0x1E4F41C20]];
      if (v30)
      {
LABEL_28:
        [v3 setObject:v30 forKeyedSubscript:*MEMORY[0x1E4F41C18]];
LABEL_33:
      }
    }
  }
LABEL_34:
  uint64_t v37 = [(NEVPNProtocol *)self identityDataPassword];

  if (v37)
  {
    v38 = [(NEVPNProtocol *)self identityDataPassword];
LABEL_36:
    [v3 setObject:v38 forKeyedSubscript:@"IdentityDataPasswordKeyStr"];
LABEL_37:

    goto LABEL_38;
  }
  v56 = [(NEVPNProtocol *)self identityDataPasswordKeychainItem];

  if (v56)
  {
    int v57 = [(NEVPNProtocol *)self identityDataPasswordKeychainItem];
    v38 = [v57 password];

    if (!v38) {
      goto LABEL_37;
    }
    goto LABEL_36;
  }
LABEL_38:
  int v39 = [(NEVPNProtocolIPSec *)self localIdentifier];

  if (v39)
  {
    int64_t v40 = [(NEVPNProtocolIPSec *)self localIdentifier];
    [v3 setObject:v40 forKeyedSubscript:*MEMORY[0x1E4F41C00]];

    [v3 setObject:*MEMORY[0x1E4F42060] forKeyedSubscript:*MEMORY[0x1E4F41C08]];
  }
  uint64_t v41 = [(NEVPNProtocolIPSec *)self remoteIdentifier];

  if (v41)
  {
    id v42 = [(NEVPNProtocolIPSec *)self remoteIdentifier];
    [v3 setObject:v42 forKeyedSubscript:@"RemoteIdentifier"];
  }
  if ([(NEVPNProtocolIPSec *)self useExtendedAuthentication]) {
    int v43 = &unk_1EF08D2A0;
  }
  else {
    int v43 = &unk_1EF08D2B8;
  }
  [v3 setObject:v43 forKeyedSubscript:*MEMORY[0x1E4F41C28]];
  uint64_t v44 = [(NEVPNProtocolIPSec *)self legacyExchangeMode];
  int v45 = isa_nsarray(v44);

  if (v45)
  {
    v46 = [(NEVPNProtocolIPSec *)self legacyExchangeMode];
    [v3 setObject:v46 forKeyedSubscript:@"ExchangeMode"];
  }
  int v47 = [(NEVPNProtocolIPSec *)self legacyProposals];

  if (v47)
  {
    v48 = [MEMORY[0x1E4F1CA48] array];
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    v49 = [(NEVPNProtocolIPSec *)self legacyProposals];
    uint64_t v50 = [v49 countByEnumeratingWithState:&v58 objects:v62 count:16];
    if (v50)
    {
      uint64_t v51 = v50;
      uint64_t v52 = *(void *)v59;
      do
      {
        for (uint64_t i = 0; i != v51; ++i)
        {
          if (*(void *)v59 != v52) {
            objc_enumerationMutation(v49);
          }
          v54 = (void *)[*(id *)(*((void *)&v58 + 1) + 8 * i) copyLegacyDictionary];
          if (v54) {
            [v48 addObject:v54];
          }
        }
        uint64_t v51 = [v49 countByEnumeratingWithState:&v58 objects:v62 count:16];
      }
      while (v51);
    }

    [v3 setObject:v48 forKeyedSubscript:@"Proposals"];
  }
  if ([(NEVPNProtocolIPSec *)self extendedAuthPasswordPrompt]) {
    [v3 setObject:*MEMORY[0x1E4F42078] forKeyedSubscript:*MEMORY[0x1E4F41C40]];
  }
  [(NEVPNProtocol *)self addDisconnectOptions:v3];
  return v3;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc(MEMORY[0x1E4F28E78]);
  v21.receiver = self;
  v21.super_class = (Class)NEVPNProtocolIPSec;
  id v8 = [(NEVPNProtocol *)&v21 descriptionWithIndent:v5 options:a4];
  uint64_t v9 = (void *)[v7 initWithString:v8];

  if ([(NEVPNProtocolIPSec *)self authenticationMethod])
  {
    if ([(NEVPNProtocolIPSec *)self authenticationMethod] == NEVPNIKEAuthenticationMethodCertificate)
    {
      unint64_t v10 = a4 | 8;
      int v11 = @"certificate";
    }
    else
    {
      unint64_t v10 = a4 | 8;
      if ([(NEVPNProtocolIPSec *)self authenticationMethod] != NEVPNIKEAuthenticationMethodSharedSecret) {
        goto LABEL_8;
      }
      int v11 = @"shared-secret";
    }
  }
  else
  {
    unint64_t v10 = a4 | 8;
    int v11 = @"none";
  }
  [v9 appendPrettyObject:v11 withName:@"authenticationMethod" andIndent:v5 options:v10];
LABEL_8:
  unint64_t v12 = a4 & 0xFFFFFFFFFFFFFFF7;
  uint64_t v13 = [(NEVPNProtocolIPSec *)self sharedSecretKeychainItem];
  [v9 appendPrettyObject:v13 withName:@"sharedSecret" andIndent:v5 options:a4 & 0xFFFFFFFFFFFFFFF7];

  uint64_t v14 = [(NEVPNProtocolIPSec *)self sharedSecretReference];
  [v9 appendPrettyObject:v14 withName:@"sharedSecretReference" andIndent:v5 options:v10];

  uint64_t v15 = [(NEVPNProtocolIPSec *)self localIdentifier];
  unint64_t v16 = a4 | 9;
  [v9 appendPrettyObject:v15 withName:@"localIdentifier" andIndent:v5 options:v16];

  v17 = [(NEVPNProtocolIPSec *)self remoteIdentifier];
  [v9 appendPrettyObject:v17 withName:@"remoteIdentifier" andIndent:v5 options:v16];

  objc_msgSend(v9, "appendPrettyBOOL:withName:andIndent:options:", -[NEVPNProtocolIPSec useExtendedAuthentication](self, "useExtendedAuthentication"), @"useExtendedAuthentication", v5, v10);
  uint64_t v18 = [(NEVPNProtocolIPSec *)self legacyProposals];
  [v9 appendPrettyObject:v18 withName:@"legacyProposalParameters" andIndent:v5 options:v12];

  v19 = [(NEVPNProtocolIPSec *)self legacyExchangeMode];
  [v9 appendPrettyObject:v19 withName:@"legacyExchangeMode" andIndent:v5 options:v12];

  objc_msgSend(v9, "appendPrettyBOOL:withName:andIndent:options:", -[NEVPNProtocolIPSec extendedAuthPasswordPrompt](self, "extendedAuthPasswordPrompt"), @"extendedAuthPasswordPrompt", v5, v12);

  return v9;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NEVPNProtocolIPSec;
  BOOL v5 = [(NEVPNProtocol *)&v13 checkValidityAndCollectErrors:v4];
  if ([(NEVPNProtocolIPSec *)self authenticationMethod])
  {
    if ([(NEVPNProtocolIPSec *)self authenticationMethod] == NEVPNIKEAuthenticationMethodCertificate)
    {
      int v6 = [(NEVPNProtocol *)self identityReferenceInternal];
      if (v6)
      {

        goto LABEL_12;
      }
      id v8 = [(NEVPNProtocol *)self identityDataInternal];
      if (v8
        || [(NEVPNProtocolIPSec *)self useExtendedAuthentication]
        && [(NEVPNProtocol *)self type] == 5)
      {

        goto LABEL_12;
      }
      uint64_t v10 = [(NEVPNProtocol *)self extensibleSSOProvider];
      if (!v10 || (int v11 = (void *)v10, v12 = [(NEVPNProtocol *)self type], v11, v12 != 5))
      {
        id v7 = @"Missing identity";
        goto LABEL_9;
      }
    }
  }
  else if ([(NEVPNProtocol *)self type] == 1 {
         || [(NEVPNProtocol *)self type] == 5
  }
         && ![(NEVPNProtocolIPSec *)self useExtendedAuthentication])
  {
    id v7 = @"Unsupported authenticationMethod";
LABEL_9:
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, v7, v4);
    BOOL v5 = 0;
  }
LABEL_12:

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)NEVPNProtocolIPSec;
  id v4 = [(NEVPNProtocol *)&v12 copyWithZone:a3];
  objc_msgSend(v4, "setAuthenticationMethod:", -[NEVPNProtocolIPSec authenticationMethod](self, "authenticationMethod"));
  BOOL v5 = [(NEVPNProtocolIPSec *)self sharedSecretKeychainItem];
  [v4 setSharedSecretKeychainItem:v5];

  int v6 = [(NEVPNProtocolIPSec *)self sharedSecretReference];
  [v4 setSharedSecretReference:v6];

  id v7 = [(NEVPNProtocolIPSec *)self localIdentifier];
  [v4 setLocalIdentifier:v7];

  id v8 = [(NEVPNProtocolIPSec *)self remoteIdentifier];
  [v4 setRemoteIdentifier:v8];

  objc_msgSend(v4, "setUseExtendedAuthentication:", -[NEVPNProtocolIPSec useExtendedAuthentication](self, "useExtendedAuthentication"));
  uint64_t v9 = [(NEVPNProtocolIPSec *)self legacyProposals];
  [v4 setLegacyProposals:v9];

  uint64_t v10 = [(NEVPNProtocolIPSec *)self legacyExchangeMode];
  [v4 setLegacyExchangeMode:v10];

  objc_msgSend(v4, "setExtendedAuthPasswordPrompt:", -[NEVPNProtocolIPSec extendedAuthPasswordPrompt](self, "extendedAuthPasswordPrompt"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)NEVPNProtocolIPSec;
  id v4 = a3;
  [(NEVPNProtocol *)&v11 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt32:forKey:", -[NEVPNProtocolIPSec authenticationMethod](self, "authenticationMethod", v11.receiver, v11.super_class), @"AuthenticationMethod");
  BOOL v5 = [(NEVPNProtocolIPSec *)self sharedSecretKeychainItem];
  [v4 encodeObject:v5 forKey:@"SharedSecret"];

  int v6 = [(NEVPNProtocolIPSec *)self sharedSecretReference];
  [v4 encodeObject:v6 forKey:@"SharedSecretReference"];

  id v7 = [(NEVPNProtocolIPSec *)self localIdentifier];
  [v4 encodeObject:v7 forKey:@"LocalIdentifier"];

  id v8 = [(NEVPNProtocolIPSec *)self remoteIdentifier];
  [v4 encodeObject:v8 forKey:@"RemoteIdentifier"];

  objc_msgSend(v4, "encodeBool:forKey:", -[NEVPNProtocolIPSec useExtendedAuthentication](self, "useExtendedAuthentication"), @"UseExtendedAuthentication");
  uint64_t v9 = [(NEVPNProtocolIPSec *)self legacyProposals];
  [v4 encodeObject:v9 forKey:@"LegacyProposals"];

  uint64_t v10 = [(NEVPNProtocolIPSec *)self legacyExchangeMode];
  [v4 encodeObject:v10 forKey:@"LegacyExchangeMode"];

  objc_msgSend(v4, "encodeBool:forKey:", -[NEVPNProtocolIPSec extendedAuthPasswordPrompt](self, "extendedAuthPasswordPrompt"), @"ExtendedAuthPasswordPrompt");
}

- (NEVPNProtocolIPSec)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)NEVPNProtocolIPSec;
  BOOL v5 = [(NEVPNProtocol *)&v25 initWithCoder:v4];
  if (v5)
  {
    v5->_authenticationMethod = (int)[v4 decodeInt32ForKey:@"AuthenticationMethod"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SharedSecret"];
    sharedSecretKeychainItem = v5->_sharedSecretKeychainItem;
    v5->_sharedSecretKeychainItem = (NEKeychainItem *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SharedSecretReference"];
    sharedSecretReference = v5->_sharedSecretReference;
    v5->_sharedSecretReference = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LocalIdentifier"];
    localIdentifier = v5->_localIdentifier;
    v5->_localIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RemoteIdentifier"];
    remoteIdentifier = v5->_remoteIdentifier;
    v5->_remoteIdentifier = (NSString *)v12;

    v5->_useExtendedAuthentication = [v4 decodeBoolForKey:@"UseExtendedAuthentication"];
    uint64_t v14 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v15 = objc_opt_class();
    unint64_t v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"LegacyProposals"];
    legacyProposals = v5->_legacyProposals;
    v5->_legacyProposals = (NSArray *)v17;

    v19 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v20 = objc_opt_class();
    objc_super v21 = objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
    uint64_t v22 = [v4 decodeObjectOfClasses:v21 forKey:@"LegacyExchangeMode"];
    legacyExchangeMode = v5->_legacyExchangeMode;
    v5->_legacyExchangeMode = (NSArray *)v22;

    v5->_extendedAuthPasswordPrompt = [v4 decodeBoolForKey:@"ExtendedAuthPasswordPrompt"];
  }

  return v5;
}

- (NEVPNProtocolIPSec)initWithType:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NEVPNProtocolIPSec;
  id v3 = [(NEVPNProtocol *)&v6 initWithType:a3];
  id v4 = v3;
  if (v3)
  {
    v3->super._int64_t keychainDomain = 0;
    [(NEVPNProtocol *)v3 setDisconnectOnWake:1];
    v4->_authenticationMethod = 0;
    v4->_useExtendedAuthentication = 1;
    v4->_extendedAuthPasswordPrompt = 0;
  }
  return v4;
}

- (NEVPNProtocolIPSec)init
{
  return [(NEVPNProtocolIPSec *)self initWithType:1];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end