@interface MCSubCalAccountPayload
+ (id)localizedPluralForm;
+ (id)localizedSingularForm;
+ (id)typeStrings;
- (BOOL)containsSensitiveUserInformation;
- (BOOL)useSSL;
- (MCSubCalAccountPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5;
- (NSArray)calendarAccountIdentifiers;
- (NSNumber)useSSLNum;
- (NSString)VPNUUID;
- (NSString)acAccountIdentifier;
- (NSString)accountDescription;
- (NSString)accountPersistentUUID;
- (NSString)hostname;
- (NSString)password;
- (NSString)username;
- (id)payloadDescriptionKeyValueSections;
- (id)stubDictionary;
- (id)subtitle1Label;
- (id)subtitle2Description;
- (id)subtitle2Label;
- (id)verboseDescription;
- (void)setAcAccountIdentifier:(id)a3;
- (void)setAccountPersistentUUID:(id)a3;
@end

@implementation MCSubCalAccountPayload

+ (id)typeStrings
{
  return (id)[MEMORY[0x1E4F1C978] arrayWithObject:@"com.apple.subscribedcalendar.account"];
}

+ (id)localizedSingularForm
{
  return MCLocalizedFormat(@"SUBCAL_ACCOUNT_DESCRIPTION_SINGULAR_FORMAT", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)localizedPluralForm
{
  return MCLocalizedFormat(@"SUBCAL_ACCOUNT_DESCRIPTION_PLURAL_FORMAT", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCSubCalAccountPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v49.receiver = self;
  v49.super_class = (Class)MCSubCalAccountPayload;
  v10 = [(MCPayload *)&v49 initWithDictionary:v8 profile:v9 outError:a5];
  if (!v10) {
    goto LABEL_15;
  }
  id v48 = 0;
  uint64_t v11 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"SubCalAccountDescription" isRequired:0 outError:&v48];
  id v12 = v48;
  accountDescription = v10->_accountDescription;
  v10->_accountDescription = (NSString *)v11;

  if (v12) {
    goto LABEL_6;
  }
  id v47 = 0;
  uint64_t v14 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"SubCalAccountUsername" isRequired:0 outError:&v47];
  id v12 = v47;
  username = v10->_username;
  v10->_username = (NSString *)v14;

  if (v12) {
    goto LABEL_6;
  }
  id v46 = 0;
  uint64_t v16 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"SubCalAccountUseSSL" isRequired:0 outError:&v46];
  id v12 = v46;
  useSSLNum = v10->_useSSLNum;
  v10->_useSSLNum = (NSNumber *)v16;

  if (v12) {
    goto LABEL_6;
  }
  v10->_useSSL = [(NSNumber *)v10->_useSSLNum BOOLValue];
  id v45 = 0;
  uint64_t v18 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"VPNUUID" isRequired:0 outError:&v45];
  id v12 = v45;
  VPNUUID = v10->_VPNUUID;
  v10->_VPNUUID = (NSString *)v18;

  if (v12) {
    goto LABEL_6;
  }
  if ([v9 isStub])
  {
    id v42 = 0;
    uint64_t v31 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"SubCalAccountHostName" isRequired:0 outError:&v42];
    id v12 = v42;
    hostname = v10->_hostname;
    v10->_hostname = (NSString *)v31;

    if (v12) {
      goto LABEL_6;
    }
    id v41 = 0;
    uint64_t v33 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"SubCalAccountPersistentUUID" isRequired:0 outError:&v41];
    id v12 = v41;
    accountPersistentUUID = v10->_accountPersistentUUID;
    v10->_accountPersistentUUID = (NSString *)v33;

    if (v12) {
      goto LABEL_6;
    }
    id v40 = 0;
    uint64_t v35 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"ACAccountIdentifier" isRequired:0 outError:&v40];
    id v12 = v40;
    uint64_t v36 = 144;
  }
  else
  {
    id v44 = 0;
    uint64_t v37 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"SubCalAccountHostName" isRequired:1 outError:&v44];
    id v12 = v44;
    v38 = v10->_hostname;
    v10->_hostname = (NSString *)v37;

    if (v12)
    {
LABEL_6:
      v20 = [(MCPayload *)v10 malformedPayloadErrorWithError:v12];
      v21 = v20;
      if (a5) {
        *a5 = v20;
      }
      v22 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        v23 = v22;
        v24 = objc_opt_class();
        id v25 = v24;
        v26 = [v21 MCVerboseDescription];
        *(_DWORD *)buf = 138543618;
        v51 = v24;
        __int16 v52 = 2114;
        id v53 = v26;
        _os_log_impl(&dword_1A13F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);
      }
      v10 = 0;
      goto LABEL_11;
    }
    id v43 = 0;
    uint64_t v35 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"SubCalAccountPassword" isRequired:0 outError:&v43];
    id v12 = v43;
    uint64_t v36 = 112;
  }
  v39 = *(Class *)((char *)&v10->super.super.isa + v36);
  *(Class *)((char *)&v10->super.super.isa + v36) = (Class)v35;

  if (v12) {
    goto LABEL_6;
  }
LABEL_11:
  if ([v8 count])
  {
    v27 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      v28 = v27;
      v29 = [(MCPayload *)v10 friendlyName];
      *(_DWORD *)buf = 138543618;
      v51 = v29;
      __int16 v52 = 2114;
      id v53 = v8;
      _os_log_impl(&dword_1A13F0000, v28, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);
    }
  }

LABEL_15:
  return v10;
}

- (id)verboseDescription
{
  v6.receiver = self;
  v6.super_class = (Class)MCSubCalAccountPayload;
  uint64_t v3 = [(MCPayload *)&v6 verboseDescription];
  uint64_t v4 = (void *)[v3 mutableCopy];

  if (self->_accountDescription) {
    [v4 appendFormat:@"\naccountDescription    : %@", self->_accountDescription];
  }
  if (self->_hostname) {
    [v4 appendFormat:@"\nURL                   : %@", self->_hostname];
  }
  if (self->_username) {
    [v4 appendFormat:@"\nusername              : %@", self->_username];
  }
  if (self->_password) {
    [v4 appendFormat:@"\npassword              : (set)"];
  }
  if (self->_useSSL) {
    [v4 appendFormat:@"\nuseSSL                : %@", @"YES"];
  }
  if (self->_accountPersistentUUID) {
    [v4 appendFormat:@"\naccountPersistentUUID : %@", self->_accountPersistentUUID];
  }
  if (self->_VPNUUID) {
    [v4 appendFormat:@"\nVPNUUID               : %@", self->_VPNUUID];
  }
  if (self->_acAccountIdentifier) {
    [v4 appendFormat:@"\nACAccountIdentifier   : %@", self->_acAccountIdentifier];
  }
  return v4;
}

- (id)stubDictionary
{
  v12.receiver = self;
  v12.super_class = (Class)MCSubCalAccountPayload;
  uint64_t v3 = [(MCPayload *)&v12 stubDictionary];
  uint64_t v4 = v3;
  accountDescription = self->_accountDescription;
  if (accountDescription) {
    [v3 setObject:accountDescription forKey:@"SubCalAccountDescription"];
  }
  hostname = self->_hostname;
  if (hostname) {
    [v4 setObject:hostname forKey:@"SubCalAccountHostName"];
  }
  username = self->_username;
  if (username) {
    [v4 setObject:username forKey:@"SubCalAccountUsername"];
  }
  accountPersistentUUID = self->_accountPersistentUUID;
  if (accountPersistentUUID) {
    [v4 setObject:accountPersistentUUID forKey:@"SubCalAccountPersistentUUID"];
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

- (id)subtitle1Label
{
  uint64_t v2 = [(MCSubCalAccountPayload *)self hostname];
  if (v2) {
    uint64_t v3 = @"SUBCAL_SERVER_NAME_COLON";
  }
  else {
    uint64_t v3 = @"SUBCAL_SERVER_NAME_MISSING";
  }
  uint64_t v4 = MCLocalizedString(v3);

  return v4;
}

- (id)subtitle2Label
{
  uint64_t v3 = [(MCSubCalAccountPayload *)self username];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = [(MCSubCalAccountPayload *)self hostname];

    if (v5)
    {
      uint64_t v3 = MCLocalizedString(@"SUBCAL_USERNAME_COLON");
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
  uint64_t v3 = [(MCSubCalAccountPayload *)self username];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = [(MCSubCalAccountPayload *)self hostname];

    if (v5)
    {
      uint64_t v3 = [(MCSubCalAccountPayload *)self username];
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
  v32[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  if (self->_accountDescription)
  {
    uint64_t v4 = [MCKeyValue alloc];
    accountDescription = self->_accountDescription;
    objc_super v6 = MCLocalizedString(@"ACCOUNT_DESCRIPTION");
    uint64_t v7 = [(MCKeyValue *)v4 initWithLocalizedString:accountDescription localizedKey:v6];

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
    objc_super v12 = [MCKeyValue alloc];
    username = self->_username;
    uint64_t v14 = MCLocalizedString(@"USERNAME");
    v15 = [(MCKeyValue *)v12 initWithLocalizedString:username localizedKey:v14];

    [v3 addObject:v15];
  }
  if (self->_password)
  {
    uint64_t v16 = [MCKeyValue alloc];
    v17 = MCLocalizedString(@"PRESENT");
    uint64_t v18 = MCLocalizedString(@"PASSWORD");
    v19 = [(MCKeyValue *)v16 initWithLocalizedString:v17 localizedKey:v18];

    [v3 addObject:v19];
  }
  if (self->_useSSLNum)
  {
    v20 = [MCKeyValue alloc];
    v21 = MCLocalizedStringForBool([(NSNumber *)self->_useSSLNum BOOLValue]);
    v22 = MCLocalizedString(@"USES_SSL");
    v23 = [(MCKeyValue *)v20 initWithLocalizedString:v21 localizedKey:v22];

    [v3 addObject:v23];
  }
  if (self->_VPNUUID)
  {
    v24 = [MCKeyValue alloc];
    VPNUUID = self->_VPNUUID;
    v26 = MCLocalizedString(@"ACCOUNT_VPNUUID");
    v27 = [(MCKeyValue *)v24 initWithLocalizedString:VPNUUID localizedKey:v26];

    [v3 addObject:v27];
  }
  if ([v3 count]
    && (+[MCKeyValueSection sectionWithKeyValues:v3],
        (uint64_t v28 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v29 = (void *)v28;
    v32[0] = v28;
    v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
  }
  else
  {
    v30 = 0;
  }

  return v30;
}

- (BOOL)containsSensitiveUserInformation
{
  v6.receiver = self;
  v6.super_class = (Class)MCSubCalAccountPayload;
  if ([(MCPayload *)&v6 containsSensitiveUserInformation]) {
    return 1;
  }
  uint64_t v4 = [(MCSubCalAccountPayload *)self password];
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

- (NSString)password
{
  return self->_password;
}

- (BOOL)useSSL
{
  return self->_useSSL;
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

- (NSNumber)useSSLNum
{
  return self->_useSSLNum;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_useSSLNum, 0);
  objc_storeStrong((id *)&self->_acAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_VPNUUID, 0);
  objc_storeStrong((id *)&self->_accountPersistentUUID, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_hostname, 0);
  objc_storeStrong((id *)&self->_accountDescription, 0);
}

- (NSArray)calendarAccountIdentifiers
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