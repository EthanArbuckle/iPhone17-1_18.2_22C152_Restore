@interface MCGmailAccountPayload
+ (id)localizedPluralForm;
+ (id)localizedSingularForm;
+ (id)typeStrings;
- (BOOL)mustInstallNonInteractively;
- (MCGmailAccountPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5;
- (NSArray)mailAccountIdentifiers;
- (NSDictionary)communicationServiceRules;
- (NSString)VPNUUID;
- (NSString)acAccountIdentifier;
- (NSString)accountDescription;
- (NSString)accountName;
- (NSString)emailAddress;
- (id)payloadDescriptionKeyValueSections;
- (id)restrictions;
- (id)stubDictionary;
- (id)subtitle1Label;
- (id)verboseDescription;
- (void)setAcAccountIdentifier:(id)a3;
@end

@implementation MCGmailAccountPayload

+ (id)typeStrings
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.google-oauth";
  v4[1] = @"com.apple.gmail";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  return v2;
}

+ (id)localizedSingularForm
{
  return MCLocalizedFormat(@"GOOGLE_ACCOUNT_DESCRIPTION_SINGULAR_FORMAT", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)localizedPluralForm
{
  return MCLocalizedFormat(@"GOOGLE_ACCOUNT_DESCRIPTION_PLURAL_FORMAT", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCGmailAccountPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v51.receiver = self;
  v51.super_class = (Class)MCGmailAccountPayload;
  v10 = [(MCPayload *)&v51 initWithDictionary:v8 profile:v9 outError:a5];
  if (!v10) {
    goto LABEL_14;
  }
  id v50 = 0;
  v11 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"CommunicationServiceRules" isRequired:0 outError:&v50];
  id v12 = v50;
  if (v12) {
    goto LABEL_5;
  }
  id v49 = 0;
  uint64_t v13 = +[MCCommunicationServiceRulesUtilities validatedCommunicationServiceRules:v11 outError:&v49];
  id v12 = v49;
  communicationServiceRules = v10->_communicationServiceRules;
  v10->_communicationServiceRules = (NSDictionary *)v13;

  if (v12) {
    goto LABEL_5;
  }
  id v48 = 0;
  uint64_t v15 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"VPNUUID" isRequired:0 outError:&v48];
  id v12 = v48;
  VPNUUID = v10->_VPNUUID;
  v10->_VPNUUID = (NSString *)v15;

  if (v12) {
    goto LABEL_5;
  }
  if ([v9 isStub])
  {
    id v44 = 0;
    uint64_t v28 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"AccountName" isRequired:0 outError:&v44];
    id v12 = v44;
    accountName = v10->_accountName;
    v10->_accountName = (NSString *)v28;

    if (v12) {
      goto LABEL_5;
    }
    id v43 = 0;
    uint64_t v30 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"AccountDescription" isRequired:0 outError:&v43];
    id v12 = v43;
    accountDescription = v10->_accountDescription;
    v10->_accountDescription = (NSString *)v30;

    if (v12) {
      goto LABEL_5;
    }
    id v42 = 0;
    uint64_t v32 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"EmailAddress" isRequired:0 outError:&v42];
    id v12 = v42;
    emailAddress = v10->_emailAddress;
    v10->_emailAddress = (NSString *)v32;

    if (v12) {
      goto LABEL_5;
    }
    id v41 = 0;
    uint64_t v34 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"ACAccountIdentifier" isRequired:0 outError:&v41];
    id v12 = v41;
    uint64_t v35 = 96;
  }
  else
  {
    id v47 = 0;
    uint64_t v36 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"AccountName" isRequired:0 outError:&v47];
    id v12 = v47;
    v37 = v10->_accountName;
    v10->_accountName = (NSString *)v36;

    if (v12) {
      goto LABEL_5;
    }
    id v46 = 0;
    uint64_t v38 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"AccountDescription" isRequired:0 outError:&v46];
    id v12 = v46;
    v39 = v10->_accountDescription;
    v10->_accountDescription = (NSString *)v38;

    if (v12) {
      goto LABEL_5;
    }
    id v45 = 0;
    uint64_t v34 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"EmailAddress" isRequired:1 outError:&v45];
    id v12 = v45;
    uint64_t v35 = 120;
  }
  v40 = *(Class *)((char *)&v10->super.super.isa + v35);
  *(Class *)((char *)&v10->super.super.isa + v35) = (Class)v34;

  if (v12)
  {
LABEL_5:
    v17 = [(MCPayload *)v10 malformedPayloadErrorWithError:v12];
    v18 = v17;
    if (a5) {
      *a5 = v17;
    }
    v19 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      v20 = v19;
      v21 = objc_opt_class();
      id v22 = v21;
      v23 = [v18 MCVerboseDescription];
      *(_DWORD *)buf = 138543618;
      v53 = v21;
      __int16 v54 = 2114;
      id v55 = v23;
      _os_log_impl(&dword_1A13F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);
    }
    v10 = 0;
  }
  if ([v8 count])
  {
    v24 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      v25 = v24;
      v26 = [(MCPayload *)v10 friendlyName];
      *(_DWORD *)buf = 138543618;
      v53 = v26;
      __int16 v54 = 2114;
      id v55 = v8;
      _os_log_impl(&dword_1A13F0000, v25, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);
    }
  }

LABEL_14:
  return v10;
}

- (BOOL)mustInstallNonInteractively
{
  return 1;
}

- (id)stubDictionary
{
  v12.receiver = self;
  v12.super_class = (Class)MCGmailAccountPayload;
  uint64_t v3 = [(MCPayload *)&v12 stubDictionary];
  uint64_t v4 = v3;
  accountName = self->_accountName;
  if (accountName) {
    [v3 setObject:accountName forKeyedSubscript:@"AccountName"];
  }
  accountDescription = self->_accountDescription;
  if (accountDescription) {
    [v4 setObject:accountDescription forKeyedSubscript:@"AccountDescription"];
  }
  emailAddress = self->_emailAddress;
  if (emailAddress) {
    [v4 setObject:emailAddress forKeyedSubscript:@"EmailAddress"];
  }
  communicationServiceRules = self->_communicationServiceRules;
  if (communicationServiceRules) {
    [v4 setObject:communicationServiceRules forKeyedSubscript:@"CommunicationServiceRules"];
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

- (id)verboseDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v7.receiver = self;
  v7.super_class = (Class)MCGmailAccountPayload;
  uint64_t v4 = [(MCPayload *)&v7 verboseDescription];
  uint64_t v5 = (void *)[v3 initWithFormat:@"%@\n", v4];

  if ([(NSString *)self->_accountDescription length]) {
    [v5 appendFormat:@"Acct Desc           : %@\n", self->_accountDescription];
  }
  if ([(NSString *)self->_accountName length]) {
    [v5 appendFormat:@"Name                : %@\n", self->_accountName];
  }
  if ([(NSString *)self->_emailAddress length]) {
    [v5 appendFormat:@"Email               : %@\n", self->_emailAddress];
  }
  if (self->_VPNUUID) {
    [v5 appendFormat:@"VPNUUID             : %@\n", self->_VPNUUID];
  }
  if (self->_acAccountIdentifier) {
    [v5 appendFormat:@"ACAccountIdentifier : %@\n", self->_acAccountIdentifier];
  }
  return v5;
}

- (id)restrictions
{
  uint64_t v2 = [(MCGmailAccountPayload *)self communicationServiceRules];
  id v3 = +[MCCommunicationServiceRulesUtilities restrictionsForValidatedCommunicationServiceRules:v2];

  return v3;
}

- (id)subtitle1Label
{
  uint64_t v2 = [(MCGmailAccountPayload *)self emailAddress];
  if (v2) {
    id v3 = @"GOOGLE_ACCOUNT_EMAIL_COLON";
  }
  else {
    id v3 = @"GOOGLE_ACCOUNT_EMAIL_MISSING";
  }
  uint64_t v4 = MCLocalizedString(v3);

  return v4;
}

- (id)payloadDescriptionKeyValueSections
{
  id v3 = objc_opt_new();
  uint64_t v4 = objc_opt_new();
  if (self->_VPNUUID)
  {
    uint64_t v5 = [MCKeyValue alloc];
    VPNUUID = self->_VPNUUID;
    objc_super v7 = MCLocalizedString(@"ACCOUNT_VPNUUID");
    id v8 = [(MCKeyValue *)v5 initWithLocalizedString:VPNUUID localizedKey:v7];

    [v4 addObject:v8];
  }
  if ([v4 count])
  {
    id v9 = +[MCKeyValueSection sectionWithKeyValues:v4];
    [v3 addObject:v9];
  }
  if (![v3 count])
  {

    id v3 = 0;
  }

  return v3;
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

- (NSString)accountDescription
{
  return self->_accountDescription;
}

- (NSString)accountName
{
  return self->_accountName;
}

- (NSString)emailAddress
{
  return self->_emailAddress;
}

- (NSDictionary)communicationServiceRules
{
  return self->_communicationServiceRules;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_communicationServiceRules, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
  objc_storeStrong((id *)&self->_accountName, 0);
  objc_storeStrong((id *)&self->_accountDescription, 0);
  objc_storeStrong((id *)&self->_acAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_VPNUUID, 0);
}

- (NSArray)mailAccountIdentifiers
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