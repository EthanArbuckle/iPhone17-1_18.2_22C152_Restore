@interface ASCPlatformPublicKeyCredentialLoginChoice
+ (BOOL)supportsSecureCoding;
- (ASCPlatformPublicKeyCredentialLoginChoice)initWithCoder:(id)a3;
- (ASCPlatformPublicKeyCredentialLoginChoice)initWithCredentialIdentity:(id)a3 publicKeyCredentialOperationUUID:(id)a4 clientDataHash:(id)a5 userVerificationPreference:(id)a6 supportedAlgorithms:(id)a7;
- (ASCPlatformPublicKeyCredentialLoginChoice)initWithName:(id)a3 displayName:(id)a4 customTitle:(id)a5 identifier:(id)a6 userHandle:(id)a7 relyingPartyIdentifier:(id)a8 publicKeyCredentialOperationUUID:(id)a9 groupID:(id)a10;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExternal;
- (BOOL)isRegistrationRequest;
- (BOOL)isSharedCredential;
- (NSArray)excludedCredentials;
- (NSArray)supportedAlgorithms;
- (NSData)clientDataHash;
- (NSString)customTitle;
- (NSString)displayName;
- (NSString)externalCredentialProviderBundleID;
- (NSString)externalCredentialProviderName;
- (NSString)groupID;
- (NSString)name;
- (NSString)relyingPartyIdentifier;
- (NSString)userHandle;
- (NSString)userVerificationPreference;
- (NSString)userVisibleName;
- (NSUUID)publicKeyCredentialOperationUUID;
- (SFPasskeyCredentialIdentity)credentialIdentity;
- (WBSPublicKeyCredentialIdentifier)identifier;
- (id)_initAsRegistrationChoice:(BOOL)a3 withName:(id)a4 displayName:(id)a5 customTitle:(id)a6 identifier:(id)a7 userHandle:(id)a8 relyingPartyIdentifier:(id)a9 publicKeyCredentialOperationUUID:(id)a10 externalCredentialProviderName:(id)a11 externalCredentialProviderBundleID:(id)a12 supportedAlgorithms:(id)a13 excludedCredentials:(id)a14 groupID:(id)a15;
- (id)initRegistrationChoiceWithOptions:(id)a3;
- (id)initRegistrationChoiceWithOptions:(id)a3 externalCredentialProviderName:(id)a4 externalCredentialProviderBundleID:(id)a5;
- (int64_t)compare:(id)a3;
- (unint64_t)loginChoiceKind;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCPlatformPublicKeyCredentialLoginChoice

- (id)_initAsRegistrationChoice:(BOOL)a3 withName:(id)a4 displayName:(id)a5 customTitle:(id)a6 identifier:(id)a7 userHandle:(id)a8 relyingPartyIdentifier:(id)a9 publicKeyCredentialOperationUUID:(id)a10 externalCredentialProviderName:(id)a11 externalCredentialProviderBundleID:(id)a12 supportedAlgorithms:(id)a13 excludedCredentials:(id)a14 groupID:(id)a15
{
  id v60 = a4;
  id v59 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v58 = a10;
  v23 = v19;
  id v24 = a11;
  v25 = v20;
  id v26 = a12;
  id v27 = a13;
  id v28 = a14;
  id v29 = a15;
  v61.receiver = self;
  v61.super_class = (Class)ASCPlatformPublicKeyCredentialLoginChoice;
  v30 = [(ASCPlatformPublicKeyCredentialLoginChoice *)&v61 init];
  v31 = v30;
  if (v30)
  {
    v30->_isRegistrationRequest = a3;
    uint64_t v32 = [v60 copy];
    name = v31->_name;
    v31->_name = (NSString *)v32;

    uint64_t v34 = [v59 copy];
    displayName = v31->_displayName;
    v31->_displayName = (NSString *)v34;

    uint64_t v36 = [v25 copy];
    identifier = v31->_identifier;
    v31->_identifier = (WBSPublicKeyCredentialIdentifier *)v36;

    uint64_t v38 = [v21 copy];
    userHandle = v31->_userHandle;
    v31->_userHandle = (NSString *)v38;

    uint64_t v40 = [v22 copy];
    relyingPartyIdentifier = v31->_relyingPartyIdentifier;
    v31->_relyingPartyIdentifier = (NSString *)v40;

    objc_storeStrong((id *)&v31->_publicKeyCredentialOperationUUID, a10);
    if ([v23 length])
    {
      uint64_t v42 = [v23 copy];
      customTitle = v31->_customTitle;
      v31->_customTitle = (NSString *)v42;
    }
    else
    {
      customTitle = v31->_customTitle;
      v31->_customTitle = 0;
    }

    uint64_t v44 = [v24 copy];
    externalCredentialProviderName = v31->_externalCredentialProviderName;
    v31->_externalCredentialProviderName = (NSString *)v44;

    uint64_t v46 = [v26 copy];
    externalCredentialProviderBundleID = v31->_externalCredentialProviderBundleID;
    v31->_externalCredentialProviderBundleID = (NSString *)v46;

    uint64_t v48 = [v27 copy];
    supportedAlgorithms = v31->_supportedAlgorithms;
    v31->_supportedAlgorithms = (NSArray *)v48;

    uint64_t v50 = [v28 copy];
    excludedCredentials = v31->_excludedCredentials;
    v31->_excludedCredentials = (NSArray *)v50;

    uint64_t v52 = [v29 copy];
    groupID = v31->_groupID;
    v31->_groupID = (NSString *)v52;

    v54 = v31;
  }

  return v31;
}

- (ASCPlatformPublicKeyCredentialLoginChoice)initWithCredentialIdentity:(id)a3 publicKeyCredentialOperationUUID:(id)a4 clientDataHash:(id)a5 userVerificationPreference:(id)a6 supportedAlgorithms:(id)a7
{
  id v12 = a3;
  id v42 = a5;
  id v41 = a6;
  id v13 = a7;
  id v14 = a4;
  v15 = [v12 user];
  v16 = [v12 user];
  id v17 = objc_alloc(MEMORY[0x263F66350]);
  v18 = [v12 credentialID];
  id v19 = (void *)[v17 initWithCredentialID:v18 groupID:&stru_26CAB9030];
  id v20 = [v12 userHandle];
  id v21 = [v12 serviceIdentifier];
  id v22 = [(ASCPlatformPublicKeyCredentialLoginChoice *)self initWithName:v15 displayName:v16 customTitle:0 identifier:v19 userHandle:v20 relyingPartyIdentifier:v21 publicKeyCredentialOperationUUID:v14 groupID:0];

  if (v22)
  {
    uint64_t v23 = [v12 copy];
    credentialIdentity = v22->_credentialIdentity;
    v22->_credentialIdentity = (SFPasskeyCredentialIdentity *)v23;

    v25 = [v12 owningExtensionState];
    id v26 = [v25 localizedDisplayName];
    uint64_t v27 = [v26 copy];
    externalCredentialProviderName = v22->_externalCredentialProviderName;
    v22->_externalCredentialProviderName = (NSString *)v27;

    id v29 = [v12 owningExtensionState];
    v30 = [v29 providerBundleID];
    uint64_t v31 = [v30 copy];
    externalCredentialProviderBundleID = v22->_externalCredentialProviderBundleID;
    v22->_externalCredentialProviderBundleID = (NSString *)v31;

    uint64_t v33 = [v42 copy];
    clientDataHash = v22->_clientDataHash;
    v22->_clientDataHash = (NSData *)v33;

    uint64_t v35 = [v41 copy];
    userVerificationPreference = v22->_userVerificationPreference;
    v22->_userVerificationPreference = (NSString *)v35;

    uint64_t v37 = [v13 copy];
    supportedAlgorithms = v22->_supportedAlgorithms;
    v22->_supportedAlgorithms = (NSArray *)v37;

    v39 = v22;
  }

  return v22;
}

- (id)initRegistrationChoiceWithOptions:(id)a3
{
  id v4 = a3;
  v5 = [v4 userName];
  v6 = [v4 userDisplayName];
  v7 = [v4 userIdentifier];
  v8 = [v7 base64EncodedStringWithOptions:0];
  v9 = [v4 relyingPartyIdentifier];
  v10 = [v4 supportedAlgorithmIdentifiers];
  v11 = [v4 excludedCredentials];

  id v12 = [(ASCPlatformPublicKeyCredentialLoginChoice *)self _initAsRegistrationChoice:1 withName:v5 displayName:v6 customTitle:0 identifier:0 userHandle:v8 relyingPartyIdentifier:v9 publicKeyCredentialOperationUUID:0 externalCredentialProviderName:0 externalCredentialProviderBundleID:0 supportedAlgorithms:v10 excludedCredentials:v11 groupID:0];
  return v12;
}

- (id)initRegistrationChoiceWithOptions:(id)a3 externalCredentialProviderName:(id)a4 externalCredentialProviderBundleID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(ASCPlatformPublicKeyCredentialLoginChoice *)self initRegistrationChoiceWithOptions:v8];
  if (v11)
  {
    uint64_t v12 = [v9 copy];
    id v13 = (void *)v11[10];
    v11[10] = v12;

    uint64_t v14 = [v10 copy];
    v15 = (void *)v11[11];
    v11[11] = v14;

    v16 = [v8 clientDataHash];
    uint64_t v17 = [v16 copy];
    v18 = (void *)v11[12];
    v11[12] = v17;

    id v19 = [v8 userVerificationPreference];
    uint64_t v20 = [v19 copy];
    id v21 = (void *)v11[13];
    v11[13] = v20;

    id v22 = [v8 supportedAlgorithmIdentifiers];
    uint64_t v23 = [v22 copy];
    id v24 = (void *)v11[14];
    v11[14] = v23;

    v25 = [v8 excludedCredentials];
    uint64_t v26 = [v25 copy];
    uint64_t v27 = (void *)v11[15];
    v11[15] = v26;

    id v28 = v11;
  }

  return v11;
}

- (ASCPlatformPublicKeyCredentialLoginChoice)initWithName:(id)a3 displayName:(id)a4 customTitle:(id)a5 identifier:(id)a6 userHandle:(id)a7 relyingPartyIdentifier:(id)a8 publicKeyCredentialOperationUUID:(id)a9 groupID:(id)a10
{
  return (ASCPlatformPublicKeyCredentialLoginChoice *)[(ASCPlatformPublicKeyCredentialLoginChoice *)self _initAsRegistrationChoice:0 withName:a3 displayName:a4 customTitle:a5 identifier:a6 userHandle:a7 relyingPartyIdentifier:a8 publicKeyCredentialOperationUUID:a9 externalCredentialProviderName:0 externalCredentialProviderBundleID:0 supportedAlgorithms:MEMORY[0x263EFFA68] excludedCredentials:0 groupID:a10];
}

- (NSString)userVisibleName
{
  return self->_name;
}

- (unint64_t)loginChoiceKind
{
  return 2;
}

- (BOOL)isSharedCredential
{
  v2 = [(ASCPlatformPublicKeyCredentialLoginChoice *)self groupID];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (BOOL)isExternal
{
  return self->_externalCredentialProviderName != 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (unsigned __int8 *)v4;
    v6 = [v5 publicKeyCredentialOperationUUID];
    int v7 = WBSIsEqual();

    if (v7
      && self->_isRegistrationRequest == v5[8]
      && [(NSString *)self->_name isEqualToString:*((void *)v5 + 2)]
      && [(NSString *)self->_displayName isEqualToString:*((void *)v5 + 3)]
      && WBSIsEqual()
      && [(NSString *)self->_relyingPartyIdentifier isEqualToString:*((void *)v5 + 6)]
      && WBSIsEqual()
      && WBSIsEqual()
      && WBSIsEqual()
      && WBSIsEqual()
      && WBSIsEqual()
      && WBSIsEqual()
      && WBSIsEqual())
    {
      char v8 = WBSIsEqual();
    }
    else
    {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ASCPlatformPublicKeyCredentialLoginChoice *)self externalCredentialProviderName];
  if (v5
    && (v6 = (void *)v5,
        [v4 externalCredentialProviderName],
        int v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        !v7))
  {
    int64_t v13 = -1;
  }
  else
  {
    char v8 = [(ASCPlatformPublicKeyCredentialLoginChoice *)self externalCredentialProviderName];
    if (v8)
    {

LABEL_5:
      id v9 = [(ASCPlatformPublicKeyCredentialLoginChoice *)self credentialIdentity];
      uint64_t v10 = [v4 credentialIdentity];
      v11 = (void *)v10;
      if (v9 && v10)
      {
        uint64_t v12 = [v9 rank];
        if (v12 > [v11 rank])
        {
          int64_t v13 = -1;
LABEL_15:

          goto LABEL_16;
        }
        uint64_t v15 = [v9 rank];
        if (v15 < [v11 rank])
        {
          int64_t v13 = 1;
          goto LABEL_15;
        }
      }
      int64_t v13 = 0;
      goto LABEL_15;
    }
    uint64_t v14 = [v4 externalCredentialProviderName];

    if (!v14) {
      goto LABEL_5;
    }
    int64_t v13 = 1;
  }
LABEL_16:

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v6 = a3;
  [v6 encodeObject:name forKey:@"name"];
  [v6 encodeObject:self->_displayName forKey:@"displayName"];
  [v6 encodeObject:self->_customTitle forKey:@"customTitle"];
  [v6 encodeObject:self->_identifier forKey:@"identifier"];
  uint64_t v5 = [NSNumber numberWithBool:self->_isRegistrationRequest];
  [v6 encodeObject:v5 forKey:@"registrationRequestIndicator"];

  [v6 encodeObject:self->_userHandle forKey:@"userHandle"];
  [v6 encodeObject:self->_relyingPartyIdentifier forKey:@"relyingPartyIdentifier"];
  [v6 encodeObject:self->_publicKeyCredentialOperationUUID forKey:@"publicKeyCredentialOperationUUID"];
  [v6 encodeObject:self->_credentialIdentity forKey:@"credentialIdentity"];
  [v6 encodeObject:self->_externalCredentialProviderName forKey:@"externalCredentialProviderName"];
  [v6 encodeObject:self->_externalCredentialProviderBundleID forKey:@"externalCredentialProviderBundleID"];
  [v6 encodeObject:self->_clientDataHash forKey:@"clientDataHash"];
  [v6 encodeObject:self->_userVerificationPreference forKey:@"userVerificationPreference"];
  [v6 encodeObject:self->_supportedAlgorithms forKey:@"supportedAlgorithms"];
  [v6 encodeObject:self->_excludedCredentials forKey:@"excludedCredentials"];
  [v6 encodeObject:self->_groupID forKey:@"groupID"];
}

- (ASCPlatformPublicKeyCredentialLoginChoice)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  uint64_t v26 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"displayName"];
  uint64_t v27 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"customTitle"];
  v25 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  uint64_t v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"registrationRequestIndicator"];
  uint64_t v20 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"userHandle"];
  id v19 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"relyingPartyIdentifier"];
  id v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"publicKeyCredentialOperationUUID"];
  id obj = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"credentialIdentity"];
  int v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"externalCredentialProviderName"];
  char v8 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"externalCredentialProviderBundleID"];
  id v23 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"clientDataHash"];
  id v22 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"userVerificationPreference"];
  id v9 = [v3 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"supportedAlgorithms"];
  uint64_t v10 = (void *)MEMORY[0x263EFFA08];
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  int64_t v13 = [v3 decodeObjectOfClasses:v12 forKey:@"excludedCredentials"];

  uint64_t v14 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"groupID"];

  uint64_t v15 = -[ASCPlatformPublicKeyCredentialLoginChoice _initAsRegistrationChoice:withName:displayName:customTitle:identifier:userHandle:relyingPartyIdentifier:publicKeyCredentialOperationUUID:externalCredentialProviderName:externalCredentialProviderBundleID:supportedAlgorithms:excludedCredentials:groupID:](self, "_initAsRegistrationChoice:withName:displayName:customTitle:identifier:userHandle:relyingPartyIdentifier:publicKeyCredentialOperationUUID:externalCredentialProviderName:externalCredentialProviderBundleID:supportedAlgorithms:excludedCredentials:groupID:", [v5 BOOLValue], v4, v26, v27, v25, v19, v6, v7, v8, v9, v13, v14);
  v16 = (ASCPlatformPublicKeyCredentialLoginChoice *)v15;
  if (v15)
  {
    objc_storeStrong(v15 + 9, obj);
    objc_storeStrong((id *)&v16->_clientDataHash, v23);
    objc_storeStrong((id *)&v16->_userVerificationPreference, v22);
    uint64_t v17 = v16;
  }

  return v16;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)customTitle
{
  return self->_customTitle;
}

- (NSString)userHandle
{
  return self->_userHandle;
}

- (NSString)relyingPartyIdentifier
{
  return self->_relyingPartyIdentifier;
}

- (BOOL)isRegistrationRequest
{
  return self->_isRegistrationRequest;
}

- (WBSPublicKeyCredentialIdentifier)identifier
{
  return self->_identifier;
}

- (NSUUID)publicKeyCredentialOperationUUID
{
  return self->_publicKeyCredentialOperationUUID;
}

- (SFPasskeyCredentialIdentity)credentialIdentity
{
  return self->_credentialIdentity;
}

- (NSString)externalCredentialProviderName
{
  return self->_externalCredentialProviderName;
}

- (NSString)externalCredentialProviderBundleID
{
  return self->_externalCredentialProviderBundleID;
}

- (NSData)clientDataHash
{
  return self->_clientDataHash;
}

- (NSString)userVerificationPreference
{
  return self->_userVerificationPreference;
}

- (NSArray)supportedAlgorithms
{
  return self->_supportedAlgorithms;
}

- (NSArray)excludedCredentials
{
  return self->_excludedCredentials;
}

- (NSString)groupID
{
  return self->_groupID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_excludedCredentials, 0);
  objc_storeStrong((id *)&self->_supportedAlgorithms, 0);
  objc_storeStrong((id *)&self->_userVerificationPreference, 0);
  objc_storeStrong((id *)&self->_clientDataHash, 0);
  objc_storeStrong((id *)&self->_externalCredentialProviderBundleID, 0);
  objc_storeStrong((id *)&self->_externalCredentialProviderName, 0);
  objc_storeStrong((id *)&self->_credentialIdentity, 0);
  objc_storeStrong((id *)&self->_publicKeyCredentialOperationUUID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_relyingPartyIdentifier, 0);
  objc_storeStrong((id *)&self->_userHandle, 0);
  objc_storeStrong((id *)&self->_customTitle, 0);
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end