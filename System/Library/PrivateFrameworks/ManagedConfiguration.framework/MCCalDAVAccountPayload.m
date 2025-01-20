@interface MCCalDAVAccountPayload
+ (id)localizedPluralForm;
+ (id)localizedSingularForm;
+ (id)typeStrings;
- (BOOL)containsSensitiveUserInformation;
- (BOOL)useSSL;
- (MCCalDAVAccountPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5;
- (NSArray)calendarAccountIdentifiers;
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

@implementation MCCalDAVAccountPayload

+ (id)typeStrings
{
  return (id)[MEMORY[0x1E4F1C978] arrayWithObject:@"com.apple.caldav.account"];
}

+ (id)localizedSingularForm
{
  return MCLocalizedFormat(@"CALDAV_ACCOUNT_DESCRIPTION_SINGULAR_FORMAT", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)localizedPluralForm
{
  return MCLocalizedFormat(@"CALDAV_ACCOUNT_DESCRIPTION_PLURAL_FORMAT", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCCalDAVAccountPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v58.receiver = self;
  v58.super_class = (Class)MCCalDAVAccountPayload;
  v10 = [(MCPayload *)&v58 initWithDictionary:v8 profile:v9 outError:a5];
  if (!v10) {
    goto LABEL_19;
  }
  id v57 = 0;
  uint64_t v11 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"CalDAVAccountDescription" isRequired:0 outError:&v57];
  id v12 = v57;
  accountDescription = v10->_accountDescription;
  v10->_accountDescription = (NSString *)v11;

  if (v12) {
    goto LABEL_10;
  }
  id v56 = 0;
  uint64_t v14 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"CalDAVUsername" isRequired:0 outError:&v56];
  id v12 = v56;
  username = v10->_username;
  v10->_username = (NSString *)v14;

  if (v12) {
    goto LABEL_10;
  }
  id v55 = 0;
  uint64_t v16 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"CalDAVPrincipalURL" isRequired:0 outError:&v55];
  id v12 = v55;
  principalURL = v10->_principalURL;
  v10->_principalURL = (NSString *)v16;

  if (v12) {
    goto LABEL_10;
  }
  id v54 = 0;
  uint64_t v18 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"CalDAVUseSSL" isRequired:0 outError:&v54];
  id v12 = v54;
  useSSLNum = v10->_useSSLNum;
  v10->_useSSLNum = (NSNumber *)v18;

  if (v12) {
    goto LABEL_10;
  }
  v20 = v10->_useSSLNum;
  if (!v20)
  {
    uint64_t v21 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
    v22 = v10->_useSSLNum;
    v10->_useSSLNum = (NSNumber *)v21;

    v20 = v10->_useSSLNum;
  }
  v10->_useSSL = [(NSNumber *)v20 BOOLValue];
  id v53 = 0;
  uint64_t v23 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"CalDAVPort" isRequired:0 outError:&v53];
  id v12 = v53;
  portNum = v10->_portNum;
  v10->_portNum = (NSNumber *)v23;

  if (v12) {
    goto LABEL_10;
  }
  v10->_port = [(NSNumber *)v10->_portNum intValue];
  id v52 = 0;
  uint64_t v25 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"VPNUUID" isRequired:0 outError:&v52];
  id v12 = v52;
  VPNUUID = v10->_VPNUUID;
  v10->_VPNUUID = (NSString *)v25;

  if (v12) {
    goto LABEL_10;
  }
  if ([v9 isStub])
  {
    id v49 = 0;
    uint64_t v38 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"CalDAVHostName" isRequired:0 outError:&v49];
    id v12 = v49;
    hostname = v10->_hostname;
    v10->_hostname = (NSString *)v38;

    if (v12) {
      goto LABEL_10;
    }
    id v48 = 0;
    uint64_t v40 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"CalDAVAccountPersistentUUID" isRequired:0 outError:&v48];
    id v12 = v48;
    accountPersistentUUID = v10->_accountPersistentUUID;
    v10->_accountPersistentUUID = (NSString *)v40;

    if (v12) {
      goto LABEL_10;
    }
    id v47 = 0;
    uint64_t v42 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"ACAccountIdentifier" isRequired:0 outError:&v47];
    id v12 = v47;
    uint64_t v43 = 152;
  }
  else
  {
    id v51 = 0;
    uint64_t v44 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"CalDAVHostName" isRequired:1 outError:&v51];
    id v12 = v51;
    v45 = v10->_hostname;
    v10->_hostname = (NSString *)v44;

    if (v12)
    {
LABEL_10:
      v27 = [(MCPayload *)v10 malformedPayloadErrorWithError:v12];
      v28 = v27;
      if (a5) {
        *a5 = v27;
      }
      v29 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        v30 = v29;
        v31 = objc_opt_class();
        id v32 = v31;
        v33 = [v28 MCVerboseDescription];
        *(_DWORD *)buf = 138543618;
        v60 = v31;
        __int16 v61 = 2114;
        id v62 = v33;
        _os_log_impl(&dword_1A13F0000, v30, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);
      }
      v10 = 0;
      goto LABEL_15;
    }
    id v50 = 0;
    uint64_t v42 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"CalDAVPassword" isRequired:0 outError:&v50];
    id v12 = v50;
    uint64_t v43 = 112;
  }
  v46 = *(Class *)((char *)&v10->super.super.isa + v43);
  *(Class *)((char *)&v10->super.super.isa + v43) = (Class)v42;

  if (v12) {
    goto LABEL_10;
  }
LABEL_15:
  if ([v8 count])
  {
    v34 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      v35 = v34;
      v36 = [(MCPayload *)v10 friendlyName];
      *(_DWORD *)buf = 138543618;
      v60 = v36;
      __int16 v61 = 2114;
      id v62 = v8;
      _os_log_impl(&dword_1A13F0000, v35, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);
    }
  }

LABEL_19:
  return v10;
}

- (id)verboseDescription
{
  v6.receiver = self;
  v6.super_class = (Class)MCCalDAVAccountPayload;
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
  if (self->_principalURL) {
    [v4 appendFormat:@"\nprincipalURL          : %@", self->_principalURL];
  }
  if (self->_useSSL) {
    [v4 appendFormat:@"\nuseSSL                : %@", @"YES"];
  }
  if (self->_port) {
    objc_msgSend(v4, "appendFormat:", @"\nport                  : %d", self->_port);
  }
  if (self->_VPNUUID) {
    [v4 appendFormat:@"\nVPNUUID               : %@", self->_VPNUUID];
  }
  if (self->_accountPersistentUUID) {
    [v4 appendFormat:@"\naccountPersistentUUID : %@", self->_accountPersistentUUID];
  }
  if (self->_acAccountIdentifier) {
    [v4 appendFormat:@"\naACAccount Identifier : %@", self->_acAccountIdentifier];
  }
  return v4;
}

- (id)stubDictionary
{
  v15.receiver = self;
  v15.super_class = (Class)MCCalDAVAccountPayload;
  uint64_t v3 = [(MCPayload *)&v15 stubDictionary];
  uint64_t v4 = v3;
  accountDescription = self->_accountDescription;
  if (accountDescription) {
    [v3 setObject:accountDescription forKey:@"CalDAVAccountDescription"];
  }
  hostname = self->_hostname;
  if (hostname) {
    [v4 setObject:hostname forKey:@"CalDAVHostName"];
  }
  username = self->_username;
  if (username) {
    [v4 setObject:username forKey:@"CalDAVUsername"];
  }
  principalURL = self->_principalURL;
  if (principalURL) {
    [v4 setObject:principalURL forKey:@"CalDAVPrincipalURL"];
  }
  id v9 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_useSSL];
  [v4 setObject:v9 forKey:@"CalDAVUseSSL"];

  if (self->_port)
  {
    v10 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:");
    [v4 setObject:v10 forKey:@"CalDAVPort"];
  }
  VPNUUID = self->_VPNUUID;
  if (VPNUUID) {
    [v4 setObject:VPNUUID forKey:@"VPNUUID"];
  }
  accountPersistentUUID = self->_accountPersistentUUID;
  if (accountPersistentUUID) {
    [v4 setObject:accountPersistentUUID forKey:@"CalDAVAccountPersistentUUID"];
  }
  acAccountIdentifier = self->_acAccountIdentifier;
  if (acAccountIdentifier) {
    [v4 setObject:acAccountIdentifier forKey:@"ACAccountIdentifier"];
  }
  return v4;
}

- (id)subtitle1Label
{
  uint64_t v2 = [(MCCalDAVAccountPayload *)self hostname];
  if (v2) {
    uint64_t v3 = @"CALDAV_SERVER_NAME_COLON";
  }
  else {
    uint64_t v3 = @"CALDAV_SERVER_NAME_MISSING";
  }
  uint64_t v4 = MCLocalizedString(v3);

  return v4;
}

- (id)subtitle2Label
{
  uint64_t v3 = [(MCCalDAVAccountPayload *)self username];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = [(MCCalDAVAccountPayload *)self hostname];

    if (v5)
    {
      uint64_t v3 = MCLocalizedString(@"CALDAV_USERNAME_COLON");
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
  uint64_t v3 = [(MCCalDAVAccountPayload *)self username];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = [(MCCalDAVAccountPayload *)self hostname];

    if (v5)
    {
      uint64_t v3 = [(MCCalDAVAccountPayload *)self username];
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
    objc_super v6 = MCLocalizedString(@"ACCOUNT_DESCRIPTION");
    uint64_t v7 = [(MCKeyValue *)v4 initWithLocalizedString:accountDescription localizedKey:v6];

    [v3 addObject:v7];
  }
  if (self->_hostname)
  {
    id v8 = [MCKeyValue alloc];
    hostname = self->_hostname;
    v10 = MCLocalizedString(@"SERVER");
    uint64_t v11 = [(MCKeyValue *)v8 initWithLocalizedString:hostname localizedKey:v10];

    [v3 addObject:v11];
  }
  if (self->_username)
  {
    id v12 = [MCKeyValue alloc];
    username = self->_username;
    uint64_t v14 = MCLocalizedString(@"USERNAME");
    objc_super v15 = [(MCKeyValue *)v12 initWithLocalizedString:username localizedKey:v14];

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
  if (self->_principalURL)
  {
    v20 = [MCKeyValue alloc];
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
    v31 = MCLocalizedString(@"PORT");
    id v32 = [(MCKeyValue *)v30 initWithLocalizedString:v29 localizedKey:v31];

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
    uint64_t v38 = (void *)v37;
    v41[0] = v37;
    v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:1];
  }
  else
  {
    v39 = 0;
  }

  return v39;
}

- (BOOL)containsSensitiveUserInformation
{
  v6.receiver = self;
  v6.super_class = (Class)MCCalDAVAccountPayload;
  if ([(MCPayload *)&v6 containsSensitiveUserInformation]) {
    return 1;
  }
  uint64_t v4 = [(MCCalDAVAccountPayload *)self password];
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
  objc_storeStrong((id *)&self->_acAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_VPNUUID, 0);
  objc_storeStrong((id *)&self->_accountPersistentUUID, 0);
  objc_storeStrong((id *)&self->_principalURL, 0);
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