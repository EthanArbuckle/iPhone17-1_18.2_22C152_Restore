@interface MCCardDAVAccountPayload
+ (id)localizedPluralForm;
+ (id)localizedSingularForm;
+ (id)typeStrings;
- (BOOL)containsSensitiveUserInformation;
- (BOOL)useSSL;
- (MCCardDAVAccountPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5;
- (NSArray)contactsAccountIdentifiers;
- (NSDictionary)communicationServiceRules;
- (NSNumber)portNum;
- (NSNumber)useSSLNum;
- (NSString)VPNUUID;
- (NSString)acAccountIdentifier;
- (NSString)accountDescription;
- (NSString)accountPersistentUUID;
- (NSString)hostname;
- (NSString)password;
- (NSString)principalURL;
- (NSString)username;
- (id)payloadDescriptionKeyValueSections;
- (id)restrictions;
- (id)stubDictionary;
- (id)subtitle1Label;
- (id)subtitle2Description;
- (id)subtitle2Label;
- (id)verboseDescription;
- (int)port;
- (void)setAcAccountIdentifier:(id)a3;
- (void)setAccountPersistentUUID:(id)a3;
- (void)setPassword:(id)a3;
- (void)setUsername:(id)a3;
@end

@implementation MCCardDAVAccountPayload

+ (id)typeStrings
{
  return (id)[MEMORY[0x1E4F1C978] arrayWithObject:@"com.apple.carddav.account"];
}

+ (id)localizedSingularForm
{
  return MCLocalizedFormat(@"CARDDAV_ACCOUNT_DESCRIPTION_SINGULAR_FORMAT", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)localizedPluralForm
{
  return MCLocalizedFormat(@"CARDDAV_ACCOUNT_DESCRIPTION_PLURAL_FORMAT", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCCardDAVAccountPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v59.receiver = self;
  v59.super_class = (Class)MCCardDAVAccountPayload;
  v10 = [(MCPayload *)&v59 initWithDictionary:v8 profile:v9 outError:a5];
  if (!v10) {
    goto LABEL_20;
  }
  id v58 = 0;
  uint64_t v11 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"CardDAVAccountDescription" isRequired:0 outError:&v58];
  id v12 = v58;
  accountDescription = v10->_accountDescription;
  v10->_accountDescription = (NSString *)v11;

  if (v12) {
    goto LABEL_11;
  }
  id v57 = 0;
  uint64_t v14 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"CardDAVUsername" isRequired:0 outError:&v57];
  id v12 = v57;
  username = v10->_username;
  v10->_username = (NSString *)v14;

  if (v12) {
    goto LABEL_11;
  }
  id v56 = 0;
  uint64_t v16 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"CardDAVPrincipalURL" isRequired:0 outError:&v56];
  id v12 = v56;
  principalURL = v10->_principalURL;
  v10->_principalURL = (NSString *)v16;

  if (v12) {
    goto LABEL_11;
  }
  id v55 = 0;
  uint64_t v18 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"CardDAVUseSSL" isRequired:0 outError:&v55];
  id v12 = v55;
  useSSLNum = v10->_useSSLNum;
  v10->_useSSLNum = (NSNumber *)v18;

  if (v12) {
    goto LABEL_11;
  }
  v10->_useSSL = [(NSNumber *)v10->_useSSLNum BOOLValue];
  id v54 = 0;
  uint64_t v20 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"CardDAVPort" isRequired:0 outError:&v54];
  id v12 = v54;
  portNum = v10->_portNum;
  v10->_portNum = (NSNumber *)v20;

  if (v12) {
    goto LABEL_11;
  }
  v10->_port = [(NSNumber *)v10->_portNum intValue];
  id v53 = 0;
  v22 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"CommunicationServiceRules" isRequired:0 outError:&v53];
  id v12 = v53;
  if (v12) {
    goto LABEL_10;
  }
  id v52 = 0;
  uint64_t v23 = +[MCCommunicationServiceRulesUtilities validatedCommunicationServiceRules:v22 outError:&v52];
  id v12 = v52;
  communicationServiceRules = v10->_communicationServiceRules;
  v10->_communicationServiceRules = (NSDictionary *)v23;

  if (v12
    || (id v51 = 0,
        [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"VPNUUID" isRequired:0 outError:&v51], v25 = objc_claimAutoreleasedReturnValue(), id v12 = v51, VPNUUID = v10->_VPNUUID, v10->_VPNUUID = (NSString *)v25, VPNUUID, v12))
  {
LABEL_10:

LABEL_11:
    v27 = [(MCPayload *)v10 malformedPayloadErrorWithError:v12];
    v22 = v27;
    if (a5) {
      *a5 = v27;
    }
    v28 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      v29 = v28;
      v30 = objc_opt_class();
      id v31 = v30;
      v32 = [v22 MCVerboseDescription];
      *(_DWORD *)buf = 138543618;
      v61 = v30;
      __int16 v62 = 2114;
      id v63 = v32;
      _os_log_impl(&dword_1A13F0000, v29, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);
    }
    v10 = 0;
    goto LABEL_16;
  }
  if ([v9 isStub])
  {
    id v48 = 0;
    uint64_t v37 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"CardDAVHostName" isRequired:0 outError:&v48];
    id v12 = v48;
    hostname = v10->_hostname;
    v10->_hostname = (NSString *)v37;

    if (v12) {
      goto LABEL_10;
    }
    id v47 = 0;
    uint64_t v39 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"CardDAVAccountPersistentUUID" isRequired:0 outError:&v47];
    id v12 = v47;
    accountPersistentUUID = v10->_accountPersistentUUID;
    v10->_accountPersistentUUID = (NSString *)v39;

    if (v12) {
      goto LABEL_10;
    }
    id v46 = 0;
    uint64_t v41 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"ACAccountIdentifier" isRequired:0 outError:&v46];
    id v12 = v46;
    uint64_t v42 = 152;
  }
  else
  {
    id v50 = 0;
    uint64_t v43 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"CardDAVHostName" isRequired:1 outError:&v50];
    id v12 = v50;
    v44 = v10->_hostname;
    v10->_hostname = (NSString *)v43;

    if (v12) {
      goto LABEL_10;
    }
    id v49 = 0;
    uint64_t v41 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"CardDAVPassword" isRequired:0 outError:&v49];
    id v12 = v49;
    uint64_t v42 = 112;
  }
  v45 = *(Class *)((char *)&v10->super.super.isa + v42);
  *(Class *)((char *)&v10->super.super.isa + v42) = (Class)v41;

  if (v12) {
    goto LABEL_10;
  }
LABEL_16:

  if ([v8 count])
  {
    v33 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      v34 = v33;
      v35 = [(MCPayload *)v10 friendlyName];
      *(_DWORD *)buf = 138543618;
      v61 = v35;
      __int16 v62 = 2114;
      id v63 = v8;
      _os_log_impl(&dword_1A13F0000, v34, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);
    }
  }

LABEL_20:
  return v10;
}

- (id)verboseDescription
{
  v7.receiver = self;
  v7.super_class = (Class)MCCardDAVAccountPayload;
  uint64_t v3 = [(MCPayload *)&v7 verboseDescription];
  uint64_t v4 = (void *)[v3 mutableCopy];

  if (self->_accountDescription) {
    [v4 appendFormat:@"\naccountDescription   : %@", self->_accountDescription];
  }
  if (self->_hostname) {
    [v4 appendFormat:@"\nURL                  : %@", self->_hostname];
  }
  if (self->_username) {
    [v4 appendFormat:@"\nusername             : %@", self->_username];
  }
  if (self->_password) {
    [v4 appendFormat:@"\npassword             : (set)"];
  }
  if (self->_principalURL) {
    [v4 appendFormat:@"\nprincipalURL         : %@", self->_principalURL];
  }
  if (self->_useSSL) {
    uint64_t v5 = @"YES";
  }
  else {
    uint64_t v5 = @"NO";
  }
  [v4 appendFormat:@"\nuseSSL               : %@", v5];
  if (self->_port) {
    objc_msgSend(v4, "appendFormat:", @"\nport                 : %d", self->_port);
  }
  if (self->_VPNUUID) {
    [v4 appendFormat:@"\nVPNUUID              : %@", self->_VPNUUID];
  }
  if (self->_accountPersistentUUID) {
    [v4 appendFormat:@"\naccountPersistentUUID: %@", self->_accountPersistentUUID];
  }
  if (self->_acAccountIdentifier) {
    [v4 appendFormat:@"\nACAccountIdentifier  : %@", self->_acAccountIdentifier];
  }
  return v4;
}

- (id)stubDictionary
{
  v16.receiver = self;
  v16.super_class = (Class)MCCardDAVAccountPayload;
  uint64_t v3 = [(MCPayload *)&v16 stubDictionary];
  uint64_t v4 = v3;
  accountDescription = self->_accountDescription;
  if (accountDescription) {
    [v3 setObject:accountDescription forKey:@"CardDAVAccountDescription"];
  }
  hostname = self->_hostname;
  if (hostname) {
    [v4 setObject:hostname forKey:@"CardDAVHostName"];
  }
  username = self->_username;
  if (username) {
    [v4 setObject:username forKey:@"CardDAVUsername"];
  }
  principalURL = self->_principalURL;
  if (principalURL) {
    [v4 setObject:principalURL forKey:@"CardDAVPrincipalURL"];
  }
  id v9 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_useSSL];
  [v4 setObject:v9 forKey:@"CardDAVUseSSL"];

  if (self->_port)
  {
    v10 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:");
    [v4 setObject:v10 forKey:@"CardDAVPort"];
  }
  VPNUUID = self->_VPNUUID;
  if (VPNUUID) {
    [v4 setObject:VPNUUID forKey:@"VPNUUID"];
  }
  accountPersistentUUID = self->_accountPersistentUUID;
  if (accountPersistentUUID) {
    [v4 setObject:accountPersistentUUID forKey:@"CardDAVAccountPersistentUUID"];
  }
  communicationServiceRules = self->_communicationServiceRules;
  if (communicationServiceRules) {
    [v4 setObject:communicationServiceRules forKey:@"CommunicationServiceRules"];
  }
  acAccountIdentifier = self->_acAccountIdentifier;
  if (acAccountIdentifier) {
    [v4 setObject:acAccountIdentifier forKey:@"ACAccountIdentifier"];
  }
  return v4;
}

- (id)restrictions
{
  uint64_t v2 = [(MCCardDAVAccountPayload *)self communicationServiceRules];
  uint64_t v3 = +[MCCommunicationServiceRulesUtilities restrictionsForValidatedCommunicationServiceRules:v2];

  return v3;
}

- (id)subtitle1Label
{
  uint64_t v2 = [(MCCardDAVAccountPayload *)self hostname];
  if (v2) {
    uint64_t v3 = @"CARDDAV_SERVER_NAME_COLON";
  }
  else {
    uint64_t v3 = @"CARDDAV_SERVER_NAME_MISSING";
  }
  uint64_t v4 = MCLocalizedString(v3);

  return v4;
}

- (id)subtitle2Label
{
  uint64_t v3 = [(MCCardDAVAccountPayload *)self username];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = [(MCCardDAVAccountPayload *)self hostname];

    if (v5)
    {
      uint64_t v3 = MCLocalizedString(@"CARDDAV_USERNAME_COLON");
    }
    else
    {
      uint64_t v3 = 0;
    }
  }
  return v3;
}

- (id)subtitle2Description
{
  uint64_t v3 = [(MCCardDAVAccountPayload *)self username];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = [(MCCardDAVAccountPayload *)self hostname];

    if (v5)
    {
      uint64_t v3 = [(MCCardDAVAccountPayload *)self username];
    }
    else
    {
      uint64_t v3 = 0;
    }
  }
  return v3;
}

- (id)payloadDescriptionKeyValueSections
{
  v41[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  if (self->_accountDescription)
  {
    uint64_t v4 = [MCKeyValue alloc];
    accountDescription = self->_accountDescription;
    uint64_t v6 = MCLocalizedString(@"ACCOUNT_DESCRIPTION");
    objc_super v7 = [(MCKeyValue *)v4 initWithLocalizedString:accountDescription localizedKey:v6];

    [v3 addObject:v7];
  }
  if (self->_hostname)
  {
    id v8 = [MCKeyValue alloc];
    hostname = self->_hostname;
    v10 = MCLocalizedString(@"HOSTNAME");
    uint64_t v11 = [(MCKeyValue *)v8 initWithLocalizedString:hostname localizedKey:v10];

    [v3 addObject:v11];
  }
  if (self->_username)
  {
    id v12 = [MCKeyValue alloc];
    username = self->_username;
    uint64_t v14 = MCLocalizedString(@"USERNAME");
    v15 = [(MCKeyValue *)v12 initWithLocalizedString:username localizedKey:v14];

    [v3 addObject:v15];
  }
  if (self->_password)
  {
    objc_super v16 = [MCKeyValue alloc];
    v17 = MCLocalizedString(@"PRESENT");
    uint64_t v18 = MCLocalizedString(@"PASSWORD");
    v19 = [(MCKeyValue *)v16 initWithLocalizedString:v17 localizedKey:v18];

    [v3 addObject:v19];
  }
  if (self->_principalURL)
  {
    uint64_t v20 = [MCKeyValue alloc];
    principalURL = self->_principalURL;
    v22 = MCLocalizedString(@"PRINCIPAL_URL");
    uint64_t v23 = [(MCKeyValue *)v20 initWithLocalizedString:principalURL localizedKey:v22];

    [v3 addObject:v23];
  }
  if (self->_useSSLNum)
  {
    v24 = [MCKeyValue alloc];
    uint64_t v25 = MCLocalizedStringForBool([(NSNumber *)self->_useSSLNum BOOLValue]);
    v26 = MCLocalizedString(@"USES_SSL");
    v27 = [(MCKeyValue *)v24 initWithLocalizedString:v25 localizedKey:v26];

    [v3 addObject:v27];
  }
  portNum = self->_portNum;
  if (portNum)
  {
    v29 = objc_msgSend(NSString, "stringWithFormat:", @"%d", -[NSNumber intValue](portNum, "intValue"));
    v30 = [MCKeyValue alloc];
    id v31 = MCLocalizedString(@"PORT");
    v32 = [(MCKeyValue *)v30 initWithLocalizedString:v29 localizedKey:v31];

    [v3 addObject:v32];
  }
  if (self->_VPNUUID)
  {
    v33 = [MCKeyValue alloc];
    VPNUUID = self->_VPNUUID;
    v35 = MCLocalizedString(@"ACCOUNT_VPNUUID");
    v36 = [(MCKeyValue *)v33 initWithLocalizedString:VPNUUID localizedKey:v35];

    [v3 addObject:v36];
  }
  if ([v3 count]
    && (+[MCKeyValueSection sectionWithKeyValues:v3],
        (uint64_t v37 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v38 = (void *)v37;
    v41[0] = v37;
    uint64_t v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:1];
  }
  else
  {
    uint64_t v39 = 0;
  }

  return v39;
}

- (BOOL)containsSensitiveUserInformation
{
  v6.receiver = self;
  v6.super_class = (Class)MCCardDAVAccountPayload;
  if ([(MCPayload *)&v6 containsSensitiveUserInformation]) {
    return 1;
  }
  uint64_t v4 = [(MCCardDAVAccountPayload *)self password];
  BOOL v3 = v4 != 0;

  return v3;
}

- (NSString)accountDescription
{
  return self->_accountDescription;
}

- (NSString)hostname
{
  return self->_hostname;
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

- (NSString)principalURL
{
  return self->_principalURL;
}

- (BOOL)useSSL
{
  return self->_useSSL;
}

- (int)port
{
  return self->_port;
}

- (NSString)accountPersistentUUID
{
  return self->_accountPersistentUUID;
}

- (void)setAccountPersistentUUID:(id)a3
{
}

- (NSString)VPNUUID
{
  return self->_VPNUUID;
}

- (NSString)acAccountIdentifier
{
  return self->_acAccountIdentifier;
}

- (void)setAcAccountIdentifier:(id)a3
{
}

- (NSDictionary)communicationServiceRules
{
  return self->_communicationServiceRules;
}

- (NSNumber)useSSLNum
{
  return self->_useSSLNum;
}

- (NSNumber)portNum
{
  return self->_portNum;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_portNum, 0);
  objc_storeStrong((id *)&self->_useSSLNum, 0);
  objc_storeStrong((id *)&self->_communicationServiceRules, 0);
  objc_storeStrong((id *)&self->_acAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_VPNUUID, 0);
  objc_storeStrong((id *)&self->_accountPersistentUUID, 0);
  objc_storeStrong((id *)&self->_principalURL, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_hostname, 0);
  objc_storeStrong((id *)&self->_accountDescription, 0);
}

- (NSArray)contactsAccountIdentifiers
{
  v4[1] = *MEMORY[0x1E4F143B8];
  if (self->_acAccountIdentifier)
  {
    v4[0] = self->_acAccountIdentifier;
    uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  }
  else
  {
    uint64_t v2 = 0;
  }
  return (NSArray *)v2;
}

@end