@interface MCLDAPAccountPayload
+ (id)localizedPluralForm;
+ (id)localizedSingularForm;
+ (id)typeStrings;
- (BOOL)containsSensitiveUserInformation;
- (BOOL)useSSL;
- (MCLDAPAccountPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5;
- (NSArray)contactsAccountIdentifiers;
- (NSArray)searchSettings;
- (NSDictionary)communicationServiceRules;
- (NSNumber)useSSLNum;
- (NSString)VPNUUID;
- (NSString)acAccountIdentifier;
- (NSString)accountDescription;
- (NSString)accountPersistentUUID;
- (NSString)hostname;
- (NSString)password;
- (NSString)username;
- (id)payloadDescriptionKeyValueSections;
- (id)restrictions;
- (id)stubDictionary;
- (id)subtitle1Label;
- (id)subtitle2Description;
- (id)subtitle2Label;
- (id)verboseDescription;
- (void)setAcAccountIdentifier:(id)a3;
- (void)setAccountPersistentUUID:(id)a3;
- (void)setPassword:(id)a3;
- (void)setUsername:(id)a3;
@end

@implementation MCLDAPAccountPayload

+ (id)typeStrings
{
  return (id)[MEMORY[0x1E4F1C978] arrayWithObject:@"com.apple.ldap.account"];
}

+ (id)localizedSingularForm
{
  return MCLocalizedFormat(@"LDAP_ACCOUNT_DESCRIPTION_SINGULAR_FORMAT", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)localizedPluralForm
{
  return MCLocalizedFormat(@"LDAP_ACCOUNT_DESCRIPTION_PLURAL_FORMAT", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCLDAPAccountPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v49.receiver = self;
  v49.super_class = (Class)MCLDAPAccountPayload;
  v10 = [(MCPayload *)&v49 initWithDictionary:v8 profile:v9 outError:a5];
  if (!v10) {
    goto LABEL_22;
  }
  id v48 = 0;
  uint64_t v11 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"LDAPAccountDescription" isRequired:0 outError:&v48];
  id v12 = v48;
  accountDescription = v10->_accountDescription;
  v10->_accountDescription = (NSString *)v11;

  if (v12) {
    goto LABEL_13;
  }
  id v47 = 0;
  uint64_t v14 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"LDAPAccountUserName" isRequired:0 outError:&v47];
  id v12 = v47;
  username = v10->_username;
  v10->_username = (NSString *)v14;

  if (v12) {
    goto LABEL_13;
  }
  id v46 = 0;
  uint64_t v16 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"LDAPAccountHostName" isRequired:1 outError:&v46];
  id v12 = v46;
  hostname = v10->_hostname;
  v10->_hostname = (NSString *)v16;

  if (v12) {
    goto LABEL_13;
  }
  id v45 = 0;
  uint64_t v18 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"LDAPAccountUseSSL" isRequired:0 outError:&v45];
  id v12 = v45;
  useSSLNum = v10->_useSSLNum;
  v10->_useSSLNum = (NSNumber *)v18;

  if (v12) {
    goto LABEL_13;
  }
  v10->_useSSL = [(NSNumber *)v10->_useSSLNum BOOLValue];
  id v44 = 0;
  uint64_t v20 = [v8 MCValidateAndRemoveArrayOfClass:objc_opt_class() withKey:@"LDAPSearchSettings" isRequired:0 outError:&v44];
  id v12 = v44;
  searchSettings = v10->_searchSettings;
  v10->_searchSettings = (NSArray *)v20;

  if (v12) {
    goto LABEL_13;
  }
  if ([v9 isStub])
  {
    id v42 = 0;
    uint64_t v22 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"LDAPAccountPersistentUUID" isRequired:0 outError:&v42];
    id v12 = v42;
    accountPersistentUUID = v10->_accountPersistentUUID;
    v10->_accountPersistentUUID = (NSString *)v22;

    if (v12)
    {
LABEL_13:
      v29 = [(MCPayload *)v10 malformedPayloadErrorWithError:v12];
      v30 = v29;
      if (a5) {
        *a5 = v29;
      }
      v31 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        v32 = v31;
        v33 = objc_opt_class();
        id v34 = v33;
        v35 = [v30 MCVerboseDescription];
        *(_DWORD *)buf = 138543618;
        v51 = v33;
        __int16 v52 = 2114;
        id v53 = v35;
        _os_log_impl(&dword_1A13F0000, v32, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);
      }
      v10 = 0;
      goto LABEL_18;
    }
    id v41 = 0;
    uint64_t v24 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"ACAccountIdentifier" isRequired:0 outError:&v41];
    id v12 = v41;
    uint64_t v25 = 152;
  }
  else
  {
    id v43 = 0;
    uint64_t v24 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"LDAPAccountPassword" isRequired:0 outError:&v43];
    id v12 = v43;
    uint64_t v25 = 112;
  }
  v26 = *(Class *)((char *)&v10->super.super.isa + v25);
  *(Class *)((char *)&v10->super.super.isa + v25) = (Class)v24;

  if (v12) {
    goto LABEL_13;
  }
  id v40 = 0;
  uint64_t v27 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"VPNUUID" isRequired:0 outError:&v40];
  id v12 = v40;
  VPNUUID = v10->_VPNUUID;
  v10->_VPNUUID = (NSString *)v27;

  if (v12) {
    goto LABEL_13;
  }
LABEL_18:
  if ([v8 count])
  {
    v36 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      v37 = v36;
      v38 = [(MCPayload *)v10 friendlyName];
      *(_DWORD *)buf = 138543618;
      v51 = v38;
      __int16 v52 = 2114;
      id v53 = v8;
      _os_log_impl(&dword_1A13F0000, v37, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);
    }
  }

LABEL_22:
  return v10;
}

- (id)verboseDescription
{
  v7.receiver = self;
  v7.super_class = (Class)MCLDAPAccountPayload;
  uint64_t v3 = [(MCPayload *)&v7 verboseDescription];
  uint64_t v4 = (void *)[v3 mutableCopy];

  if (self->_accountDescription) {
    [v4 appendFormat:@"\naccountDescription: %@", self->_accountDescription];
  }
  if (self->_hostname) {
    [v4 appendFormat:@"\nhostname: %@", self->_hostname];
  }
  if (self->_username) {
    [v4 appendFormat:@"\nusername: %@", self->_username];
  }
  if (self->_password) {
    [v4 appendFormat:@"\npassword: (set)"];
  }
  if (self->_useSSL) {
    uint64_t v5 = @"YES";
  }
  else {
    uint64_t v5 = @"NO";
  }
  [v4 appendFormat:@"\nuseSSL: %@", v5];
  if (self->_searchSettings) {
    [v4 appendFormat:@"\nSearchSettings: %@", self->_searchSettings];
  }
  if (self->_accountPersistentUUID) {
    [v4 appendFormat:@"\naccountPersistentUUID: %@", self->_accountPersistentUUID];
  }
  if (self->_VPNUUID) {
    [v4 appendFormat:@"\nVPNUUID: %@", self->_VPNUUID];
  }
  if (self->_acAccountIdentifier) {
    [v4 appendFormat:@"\nACAccount Identifier: %@", self->_acAccountIdentifier];
  }
  return v4;
}

- (id)stubDictionary
{
  v15.receiver = self;
  v15.super_class = (Class)MCLDAPAccountPayload;
  uint64_t v3 = [(MCPayload *)&v15 stubDictionary];
  uint64_t v4 = v3;
  accountDescription = self->_accountDescription;
  if (accountDescription) {
    [v3 setObject:accountDescription forKey:@"LDAPAccountDescription"];
  }
  hostname = self->_hostname;
  if (hostname) {
    [v4 setObject:hostname forKey:@"LDAPAccountHostName"];
  }
  username = self->_username;
  if (username) {
    [v4 setObject:username forKey:@"LDAPAccountUserName"];
  }
  accountPersistentUUID = self->_accountPersistentUUID;
  if (accountPersistentUUID) {
    [v4 setObject:accountPersistentUUID forKey:@"LDAPAccountPersistentUUID"];
  }
  id v9 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_useSSL];
  [v4 setObject:v9 forKey:@"LDAPAccountUseSSL"];

  searchSettings = self->_searchSettings;
  if (searchSettings) {
    [v4 setObject:searchSettings forKey:@"LDAPSearchSettings"];
  }
  communicationServiceRules = self->_communicationServiceRules;
  if (communicationServiceRules) {
    [v4 setObject:communicationServiceRules forKey:@"CommunicationServiceRules"];
  }
  VPNUUID = self->_VPNUUID;
  if (VPNUUID) {
    [v4 setObject:VPNUUID forKey:@"VPNUUID"];
  }
  acAccountIdentifier = self->_acAccountIdentifier;
  if (acAccountIdentifier) {
    [v4 setObject:acAccountIdentifier forKey:@"ACAccountIdentifier"];
  }
  return v4;
}

- (id)restrictions
{
  uint64_t v2 = [(MCLDAPAccountPayload *)self communicationServiceRules];
  uint64_t v3 = +[MCCommunicationServiceRulesUtilities restrictionsForValidatedCommunicationServiceRules:v2];

  return v3;
}

- (id)subtitle1Label
{
  uint64_t v2 = [(MCLDAPAccountPayload *)self hostname];
  if (v2) {
    uint64_t v3 = @"LDAP_SERVER_NAME_COLON";
  }
  else {
    uint64_t v3 = @"LDAP_SERVER_NAME_MISSING";
  }
  uint64_t v4 = MCLocalizedString(v3);

  return v4;
}

- (id)subtitle2Label
{
  uint64_t v3 = [(MCLDAPAccountPayload *)self username];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = [(MCLDAPAccountPayload *)self hostname];

    if (v5)
    {
      uint64_t v3 = MCLocalizedString(@"LDAP_USERNAME_COLON");
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
  uint64_t v3 = [(MCLDAPAccountPayload *)self username];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = [(MCLDAPAccountPayload *)self hostname];

    if (v5)
    {
      uint64_t v3 = [(MCLDAPAccountPayload *)self username];
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
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = objc_opt_new();
  if (self->_accountDescription)
  {
    uint64_t v5 = [MCKeyValue alloc];
    accountDescription = self->_accountDescription;
    objc_super v7 = MCLocalizedString(@"ACCOUNT_DESCRIPTION");
    id v8 = [(MCKeyValue *)v5 initWithLocalizedString:accountDescription localizedKey:v7];

    [v4 addObject:v8];
  }
  if (self->_hostname)
  {
    id v9 = [MCKeyValue alloc];
    hostname = self->_hostname;
    uint64_t v11 = MCLocalizedString(@"URL");
    id v12 = [(MCKeyValue *)v9 initWithLocalizedString:hostname localizedKey:v11];

    [v4 addObject:v12];
  }
  if (self->_username)
  {
    v13 = [MCKeyValue alloc];
    username = self->_username;
    objc_super v15 = MCLocalizedString(@"USERNAME");
    uint64_t v16 = [(MCKeyValue *)v13 initWithLocalizedString:username localizedKey:v15];

    [v4 addObject:v16];
  }
  if (self->_password)
  {
    v17 = [MCKeyValue alloc];
    uint64_t v18 = MCLocalizedString(@"PRESENT");
    v19 = MCLocalizedString(@"PASSWORD");
    uint64_t v20 = [(MCKeyValue *)v17 initWithLocalizedString:v18 localizedKey:v19];

    [v4 addObject:v20];
  }
  if (self->_useSSLNum)
  {
    v21 = [MCKeyValue alloc];
    uint64_t v22 = MCLocalizedStringForBool([(NSNumber *)self->_useSSLNum BOOLValue]);
    v23 = MCLocalizedString(@"USES_SSL");
    uint64_t v24 = [(MCKeyValue *)v21 initWithLocalizedString:v22 localizedKey:v23];

    [v4 addObject:v24];
  }
  if (self->_VPNUUID)
  {
    uint64_t v25 = [MCKeyValue alloc];
    VPNUUID = self->_VPNUUID;
    uint64_t v27 = MCLocalizedString(@"ACCOUNT_VPNUUID");
    v28 = [(MCKeyValue *)v25 initWithLocalizedString:VPNUUID localizedKey:v27];

    [v4 addObject:v28];
  }
  if ([v4 count])
  {
    v29 = +[MCKeyValueSection sectionWithKeyValues:v4];
    [v3 addObject:v29];
  }
  if (![v3 count])
  {

    uint64_t v3 = 0;
  }

  return v3;
}

- (BOOL)containsSensitiveUserInformation
{
  v6.receiver = self;
  v6.super_class = (Class)MCLDAPAccountPayload;
  if ([(MCPayload *)&v6 containsSensitiveUserInformation]) {
    return 1;
  }
  uint64_t v4 = [(MCLDAPAccountPayload *)self password];
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

- (BOOL)useSSL
{
  return self->_useSSL;
}

- (NSArray)searchSettings
{
  return self->_searchSettings;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_useSSLNum, 0);
  objc_storeStrong((id *)&self->_communicationServiceRules, 0);
  objc_storeStrong((id *)&self->_acAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_VPNUUID, 0);
  objc_storeStrong((id *)&self->_accountPersistentUUID, 0);
  objc_storeStrong((id *)&self->_searchSettings, 0);
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