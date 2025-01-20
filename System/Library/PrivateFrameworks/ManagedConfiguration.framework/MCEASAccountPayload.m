@interface MCEASAccountPayload
+ (id)localizedPluralForm;
+ (id)localizedSingularForm;
+ (id)typeStrings;
- (BOOL)containsSensitiveUserInformation;
- (BOOL)enableCalendars;
- (BOOL)enableCalendarsUserOverridable;
- (BOOL)enableContacts;
- (BOOL)enableContactsUserOverridable;
- (BOOL)enableMail;
- (BOOL)enableMailUserOverridable;
- (BOOL)enableNotes;
- (BOOL)enableNotesUserOverridable;
- (BOOL)enableReminders;
- (BOOL)enableRemindersUserOverridable;
- (BOOL)hasCertificate;
- (BOOL)mustNotUseSynchronizableCredential;
- (BOOL)overridePreviousPassword;
- (BOOL)syncDefaultFoldersOnly;
- (MCEASAccountPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5;
- (NSData)certificatePersistentID;
- (NSData)embeddedCertificate;
- (NSDictionary)communicationServiceRules;
- (NSNumber)mailNumberOfPastDaysToSync;
- (NSNumber)syncDefaultFoldersOnlyNum;
- (NSNumber)useOAuth;
- (NSNumber)useSSL;
- (NSString)OAuthSignInURL;
- (NSString)OAuthTokenRequestURL;
- (NSString)acAccountIdentifier;
- (NSString)accountDescription;
- (NSString)accountPersistentUUID;
- (NSString)certificateUUID;
- (NSString)emailAddress;
- (NSString)embeddedCertificateName;
- (NSString)embeddedCertificatePassword;
- (NSString)hostname;
- (NSString)password;
- (NSString)username;
- (id)calendarAccountIdentifiers;
- (id)contactsAccountIdentifiers;
- (id)mailAccountIdentifiers;
- (id)payloadDescriptionKeyValueSections;
- (id)restrictions;
- (id)stubDictionary;
- (id)subtitle1Label;
- (id)subtitle2Description;
- (id)subtitle2Label;
- (id)verboseDescription;
- (void)setAcAccountIdentifier:(id)a3;
- (void)setAccountPersistentUUID:(id)a3;
- (void)setCertificatePersistentID:(id)a3;
- (void)setEmailAddress:(id)a3;
- (void)setEmbeddedCertificatePassword:(id)a3;
- (void)setOAuthSignInURL:(id)a3;
- (void)setOAuthTokenRequestURL:(id)a3;
- (void)setPassword:(id)a3;
- (void)setSyncDefaultFoldersOnly:(BOOL)a3;
- (void)setUseOAuth:(id)a3;
- (void)setUseSSL:(id)a3;
- (void)setUsername:(id)a3;
@end

@implementation MCEASAccountPayload

+ (id)typeStrings
{
  return (id)[MEMORY[0x1E4F1C978] arrayWithObject:@"com.apple.eas.account"];
}

+ (id)localizedSingularForm
{
  return MCLocalizedFormat(@"EAS_ACCOUNT_DESCRIPTION_SINGULAR_FORMAT", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)localizedPluralForm
{
  return MCLocalizedFormat(@"EAS_ACCOUNT_DESCRIPTION_PLURAL_FORMAT", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCEASAccountPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  uint64_t v136 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v131.receiver = self;
  v131.super_class = (Class)MCEASAccountPayload;
  v10 = [(MCEmailAccountPayloadBase *)&v131 initWithDictionary:v8 profile:v9 outError:a5];
  v11 = v10;
  if (!v10) {
    goto LABEL_15;
  }
  uint64_t v12 = [(MCPayload *)v10 displayName];
  accountDescription = v11->_accountDescription;
  v11->_accountDescription = (NSString *)v12;

  id v130 = 0;
  uint64_t v14 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"UserName" isRequired:0 outError:&v130];
  id v15 = v130;
  username = v11->_username;
  v11->_username = (NSString *)v14;

  if (v15) {
    goto LABEL_6;
  }
  id v129 = 0;
  uint64_t v17 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"EmailAddress" isRequired:0 outError:&v129];
  id v15 = v129;
  emailAddress = v11->_emailAddress;
  v11->_emailAddress = (NSString *)v17;

  if (v15) {
    goto LABEL_6;
  }
  id v128 = 0;
  uint64_t v19 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"SSL" isRequired:0 outError:&v128];
  id v15 = v128;
  useSSL = v11->_useSSL;
  v11->_useSSL = (NSNumber *)v19;

  if (v15) {
    goto LABEL_6;
  }
  id v127 = 0;
  uint64_t v21 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"OAuth" isRequired:0 outError:&v127];
  id v15 = v127;
  useOAuth = v11->_useOAuth;
  v11->_useOAuth = (NSNumber *)v21;

  if (v15) {
    goto LABEL_6;
  }
  if ([(NSNumber *)v11->_useOAuth BOOLValue])
  {
    id v126 = 0;
    uint64_t v34 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"OAuthSignInURL" isRequired:0 outError:&v126];
    id v15 = v126;
    OAuthSignInURL = v11->_OAuthSignInURL;
    v11->_OAuthSignInURL = (NSString *)v34;

    if (!v15)
    {
      if (v11->_OAuthSignInURL)
      {
        v36 = objc_msgSend(MEMORY[0x1E4F1CB10], "URLWithString:");

        if (!v36)
        {
          v82 = @"OAuthSignInURL";
          goto LABEL_50;
        }
      }
      id v125 = 0;
      uint64_t v37 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"OAuthTokenRequestURL" isRequired:0 outError:&v125];
      id v15 = v125;
      OAuthTokenRequestURL = v11->_OAuthTokenRequestURL;
      v11->_OAuthTokenRequestURL = (NSString *)v37;

      if (!v15)
      {
        if (!v11->_OAuthTokenRequestURL) {
          goto LABEL_23;
        }
        v39 = objc_msgSend(MEMORY[0x1E4F1CB10], "URLWithString:");

        if (v39) {
          goto LABEL_23;
        }
        v82 = @"OAuthTokenRequestURL";
LABEL_50:
        id v15 = +[MCPayload badFieldValueErrorWithField:v82];
        goto LABEL_53;
      }
    }
LABEL_6:
    v23 = [(MCPayload *)v11 malformedPayloadErrorWithError:v15];
    v24 = v23;
    if (a5) {
      *a5 = v23;
    }
    v25 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      v26 = v25;
      v27 = objc_opt_class();
      id v28 = v27;
      v29 = [v24 MCVerboseDescription];
      *(_DWORD *)buf = 138543618;
      v133 = v27;
      __int16 v134 = 2114;
      id v135 = v29;
      _os_log_impl(&dword_1A13F0000, v26, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);
    }
    v11 = 0;
    goto LABEL_11;
  }
LABEL_23:
  id v124 = 0;
  uint64_t v40 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"MailNumberOfPastDaysToSync" isRequired:0 outError:&v124];
  id v15 = v124;
  mailNumberOfPastDaysToSync = v11->_mailNumberOfPastDaysToSync;
  v11->_mailNumberOfPastDaysToSync = (NSNumber *)v40;

  if (v15) {
    goto LABEL_6;
  }
  id v123 = 0;
  uint64_t v42 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"SyncDefaultFoldersOnly" isRequired:0 outError:&v123];
  id v15 = v123;
  syncDefaultFoldersOnlyNum = v11->_syncDefaultFoldersOnlyNum;
  v11->_syncDefaultFoldersOnlyNum = (NSNumber *)v42;

  if (v15) {
    goto LABEL_6;
  }
  v11->_syncDefaultFoldersOnly = [(NSNumber *)v11->_syncDefaultFoldersOnlyNum BOOLValue];
  id v122 = 0;
  v44 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"CommunicationServiceRules" isRequired:0 outError:&v122];
  id v15 = v122;
  if (v15) {
    goto LABEL_52;
  }
  id v121 = 0;
  uint64_t v45 = +[MCCommunicationServiceRulesUtilities validatedCommunicationServiceRules:v44 outError:&v121];
  id v15 = v121;
  communicationServiceRules = v11->_communicationServiceRules;
  v11->_communicationServiceRules = (NSDictionary *)v45;

  if (v15) {
    goto LABEL_52;
  }
  id v120 = 0;
  uint64_t v47 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"EnableMail" isRequired:0 outError:&v120];
  id v15 = v120;
  enableMailNum = v11->_enableMailNum;
  v11->_enableMailNum = (NSNumber *)v47;

  if (v15) {
    goto LABEL_52;
  }
  id v119 = 0;
  uint64_t v49 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"EnableContacts" isRequired:0 outError:&v119];
  id v15 = v119;
  enableContactsNum = v11->_enableContactsNum;
  v11->_enableContactsNum = (NSNumber *)v49;

  if (v15) {
    goto LABEL_52;
  }
  id v118 = 0;
  uint64_t v51 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"EnableCalendars" isRequired:0 outError:&v118];
  id v15 = v118;
  enableCalendarsNum = v11->_enableCalendarsNum;
  v11->_enableCalendarsNum = (NSNumber *)v51;

  if (v15) {
    goto LABEL_52;
  }
  id v117 = 0;
  uint64_t v53 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"EnableReminders" isRequired:0 outError:&v117];
  id v15 = v117;
  enableRemindersNum = v11->_enableRemindersNum;
  v11->_enableRemindersNum = (NSNumber *)v53;

  if (v15) {
    goto LABEL_52;
  }
  id v116 = 0;
  uint64_t v55 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"EnableNotes" isRequired:0 outError:&v116];
  id v15 = v116;
  enableNotesNum = v11->_enableNotesNum;
  v11->_enableNotesNum = (NSNumber *)v55;

  if (v15) {
    goto LABEL_52;
  }
  if ([(MCEASAccountPayload *)v11 enableMail]
    || [(MCEASAccountPayload *)v11 enableContacts]
    || [(MCEASAccountPayload *)v11 enableCalendars]
    || [(MCEASAccountPayload *)v11 enableReminders]
    || [(MCEASAccountPayload *)v11 enableNotes])
  {
    id v115 = 0;
    uint64_t v64 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"EnableMailUserOverridable" isRequired:0 outError:&v115];
    id v15 = v115;
    enableMailUserOverridableNum = v11->_enableMailUserOverridableNum;
    v11->_enableMailUserOverridableNum = (NSNumber *)v64;

    if (v15) {
      goto LABEL_52;
    }
    id v114 = 0;
    uint64_t v66 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"EnableContactsUserOverridable" isRequired:0 outError:&v114];
    id v15 = v114;
    enableContactsUserOverridableNum = v11->_enableContactsUserOverridableNum;
    v11->_enableContactsUserOverridableNum = (NSNumber *)v66;

    if (v15) {
      goto LABEL_52;
    }
    id v113 = 0;
    uint64_t v68 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"EnableCalendarsUserOverridable" isRequired:0 outError:&v113];
    id v15 = v113;
    enableCalendarsUserOverridableNum = v11->_enableCalendarsUserOverridableNum;
    v11->_enableCalendarsUserOverridableNum = (NSNumber *)v68;

    if (v15) {
      goto LABEL_52;
    }
    id v112 = 0;
    uint64_t v70 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"EnableRemindersUserOverridable" isRequired:0 outError:&v112];
    id v15 = v112;
    enableRemindersUserOverridableNum = v11->_enableRemindersUserOverridableNum;
    v11->_enableRemindersUserOverridableNum = (NSNumber *)v70;

    if (v15) {
      goto LABEL_52;
    }
    id v111 = 0;
    uint64_t v72 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"EnableNotesUserOverridable" isRequired:0 outError:&v111];
    id v15 = v111;
    enableNotesUserOverridableNum = v11->_enableNotesUserOverridableNum;
    v11->_enableNotesUserOverridableNum = (NSNumber *)v72;

    if (v15) {
      goto LABEL_52;
    }
    if ([v9 isStub])
    {
      id v103 = 0;
      uint64_t v74 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"Host" isRequired:0 outError:&v103];
      id v15 = v103;
      hostname = v11->_hostname;
      v11->_hostname = (NSString *)v74;

      if (v15) {
        goto LABEL_52;
      }
      id v102 = 0;
      uint64_t v76 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"EASAccountPersistentUUID" isRequired:0 outError:&v102];
      id v15 = v102;
      accountPersistentUUID = v11->_accountPersistentUUID;
      v11->_accountPersistentUUID = (NSString *)v76;

      if (v15) {
        goto LABEL_52;
      }
      id v101 = 0;
      uint64_t v78 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"EASAccountCertificatePersistentID" isRequired:0 outError:&v101];
      id v15 = v101;
      certificatePersistentID = v11->_certificatePersistentID;
      v11->_certificatePersistentID = (NSData *)v78;

      if (v15) {
        goto LABEL_52;
      }
      id v100 = 0;
      uint64_t v80 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"ACAccountIdentifier" isRequired:0 outError:&v100];
      id v15 = v100;
      acAccountIdentifier = v11->_acAccountIdentifier;
      v11->_acAccountIdentifier = (NSString *)v80;

      if (v15) {
        goto LABEL_52;
      }
    }
    else
    {
      if ([(NSNumber *)v11->_useOAuth BOOLValue]) {
        BOOL v85 = v11->_OAuthSignInURL != 0;
      }
      else {
        BOOL v85 = 1;
      }
      id v110 = 0;
      uint64_t v86 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"Host" isRequired:v85 outError:&v110];
      id v15 = v110;
      v87 = v11->_hostname;
      v11->_hostname = (NSString *)v86;

      if (v15) {
        goto LABEL_52;
      }
      id v109 = 0;
      uint64_t v88 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"Password" isRequired:0 outError:&v109];
      id v15 = v109;
      password = v11->_password;
      v11->_password = (NSString *)v88;

      if (v15) {
        goto LABEL_52;
      }
      id v108 = 0;
      uint64_t v90 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"Certificate" isRequired:0 outError:&v108];
      id v15 = v108;
      embeddedCertificate = v11->_embeddedCertificate;
      v11->_embeddedCertificate = (NSData *)v90;

      if (v15) {
        goto LABEL_52;
      }
      id v107 = 0;
      uint64_t v92 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"CertificateName" isRequired:0 outError:&v107];
      id v15 = v107;
      embeddedCertificateName = v11->_embeddedCertificateName;
      v11->_embeddedCertificateName = (NSString *)v92;

      if (v15) {
        goto LABEL_52;
      }
      id v106 = 0;
      uint64_t v94 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"CertificatePassword" isRequired:0 outError:&v106];
      id v15 = v106;
      embeddedCertificatePassword = v11->_embeddedCertificatePassword;
      v11->_embeddedCertificatePassword = (NSString *)v94;

      if (v15) {
        goto LABEL_52;
      }
      id v105 = 0;
      uint64_t v96 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"PayloadCertificateUUID" isRequired:0 outError:&v105];
      id v15 = v105;
      certificateUUID = v11->_certificateUUID;
      v11->_certificateUUID = (NSString *)v96;

      if (v15) {
        goto LABEL_52;
      }
      id v104 = 0;
      v98 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"OverridePreviousPassword" isRequired:0 outError:&v104];
      id v99 = v104;
      if (v99)
      {
        id v15 = v99;

        goto LABEL_52;
      }
      v11->_overridePreviousPassword = [v98 BOOLValue];
    }
    id v15 = 0;
  }
  else
  {
    v83 = (void *)MEMORY[0x1E4F28C58];
    v84 = MCErrorArray(@"EAS_NO_SERVICES_ENABLED", v57, v58, v59, v60, v61, v62, v63, 0);
    id v15 = [v83 MCErrorWithDomain:@"MCEASErrorDomain" code:21009 descriptionArray:v84 underlyingError:0 errorType:@"MCFatalError"];
  }
LABEL_52:

LABEL_53:
  if (v15) {
    goto LABEL_6;
  }
LABEL_11:
  if ([v8 count])
  {
    v30 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      v31 = v30;
      v32 = [(MCPayload *)v11 friendlyName];
      *(_DWORD *)buf = 138543618;
      v133 = v32;
      __int16 v134 = 2114;
      id v135 = v8;
      _os_log_impl(&dword_1A13F0000, v31, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);
    }
  }

LABEL_15:
  return v11;
}

- (BOOL)hasCertificate
{
  return self->_embeddedCertificate || self->_certificateUUID != 0;
}

- (BOOL)enableMail
{
  enableMailNum = self->_enableMailNum;
  return !enableMailNum || [(NSNumber *)enableMailNum BOOLValue];
}

- (BOOL)enableContacts
{
  enableContactsNum = self->_enableContactsNum;
  return !enableContactsNum || [(NSNumber *)enableContactsNum BOOLValue];
}

- (BOOL)enableCalendars
{
  enableCalendarsNum = self->_enableCalendarsNum;
  return !enableCalendarsNum || [(NSNumber *)enableCalendarsNum BOOLValue];
}

- (BOOL)enableReminders
{
  enableRemindersNum = self->_enableRemindersNum;
  return !enableRemindersNum || [(NSNumber *)enableRemindersNum BOOLValue];
}

- (BOOL)enableNotes
{
  enableNotesNum = self->_enableNotesNum;
  return !enableNotesNum || [(NSNumber *)enableNotesNum BOOLValue];
}

- (BOOL)enableMailUserOverridable
{
  enableMailUserOverridableNum = self->_enableMailUserOverridableNum;
  return !enableMailUserOverridableNum || [(NSNumber *)enableMailUserOverridableNum BOOLValue];
}

- (BOOL)enableContactsUserOverridable
{
  enableContactsUserOverridableNum = self->_enableContactsUserOverridableNum;
  return !enableContactsUserOverridableNum || [(NSNumber *)enableContactsUserOverridableNum BOOLValue];
}

- (BOOL)enableCalendarsUserOverridable
{
  enableCalendarsUserOverridableNum = self->_enableCalendarsUserOverridableNum;
  return !enableCalendarsUserOverridableNum || [(NSNumber *)enableCalendarsUserOverridableNum BOOLValue];
}

- (BOOL)enableRemindersUserOverridable
{
  enableRemindersUserOverridableNum = self->_enableRemindersUserOverridableNum;
  return !enableRemindersUserOverridableNum || [(NSNumber *)enableRemindersUserOverridableNum BOOLValue];
}

- (BOOL)enableNotesUserOverridable
{
  enableNotesUserOverridableNum = self->_enableNotesUserOverridableNum;
  return !enableNotesUserOverridableNum || [(NSNumber *)enableNotesUserOverridableNum BOOLValue];
}

- (id)verboseDescription
{
  v33.receiver = self;
  v33.super_class = (Class)MCEASAccountPayload;
  uint64_t v3 = [(MCEmailAccountPayloadBase *)&v33 verboseDescription];
  uint64_t v4 = (void *)[v3 mutableCopy];

  if (self->_accountDescription) {
    [v4 appendFormat:@"Description : %@\n", self->_accountDescription];
  }
  if (self->_hostname) {
    [v4 appendFormat:@"Host        : %@\n", self->_hostname];
  }
  if (self->_username) {
    [v4 appendFormat:@"Username    : %@\n", self->_username];
  }
  if (self->_password) {
    [v4 appendFormat:@"Password    : (set)\n"];
  }
  if (self->_emailAddress) {
    [v4 appendFormat:@"Email       : %@\n", self->_emailAddress];
  }
  uint64_t v5 = [(MCEASAccountPayload *)self useSSL];

  if (v5)
  {
    uint64_t v6 = [(MCEASAccountPayload *)self useSSL];
    uint64_t v7 = MCStringForBool([v6 BOOLValue]);
    [v4 appendFormat:@"useSSL      : %@\n", v7];
  }
  id v8 = [(MCEASAccountPayload *)self useOAuth];

  if (v8)
  {
    id v9 = [(MCEASAccountPayload *)self useOAuth];
    v10 = MCStringForBool([v9 BOOLValue]);
    [v4 appendFormat:@"useOAuth    : %@\n", v10];
  }
  if (self->_OAuthSignInURL) {
    [v4 appendFormat:@"OAuthSignInURL: %@\n", self->_OAuthSignInURL];
  }
  if (self->_OAuthTokenRequestURL) {
    [v4 appendFormat:@"OAuthTokenRequestURL: %@\n", self->_OAuthTokenRequestURL];
  }
  mailNumberOfPastDaysToSync = self->_mailNumberOfPastDaysToSync;
  if (mailNumberOfPastDaysToSync) {
    objc_msgSend(v4, "appendFormat:", @"Sync # days : %d\n", -[NSNumber intValue](mailNumberOfPastDaysToSync, "intValue"));
  }
  if (self->_embeddedCertificate) {
    [v4 appendFormat:@"Certificate : Embedded\n"];
  }
  if (self->_certificateUUID) {
    [v4 appendFormat:@"Certificate : %@\n", self->_certificateUUID];
  }
  if (self->_certificatePersistentID) {
    [v4 appendFormat:@"Certificate : %@\n", self->_certificatePersistentID];
  }
  if (self->_accountPersistentUUID) {
    [v4 appendFormat:@"PersistentUUID: %@\n", self->_accountPersistentUUID];
  }
  if (self->_syncDefaultFoldersOnly) {
    [v4 appendFormat:@"SyncDefaultFoldersOnly : Yes\n"];
  }
  if (self->_acAccountIdentifier) {
    [v4 appendFormat:@"ACAccountIdentifier : %@\n", self->_acAccountIdentifier];
  }
  enableMailNum = self->_enableMailNum;
  if (enableMailNum)
  {
    v13 = MCStringForBool([(NSNumber *)enableMailNum BOOLValue]);
    [v4 appendFormat:@"Enable Mail     : %@\n", v13];
  }
  enableContactsNum = self->_enableContactsNum;
  if (enableContactsNum)
  {
    id v15 = MCStringForBool([(NSNumber *)enableContactsNum BOOLValue]);
    [v4 appendFormat:@"Enable Contacts : %@\n", v15];
  }
  enableCalendarsNum = self->_enableCalendarsNum;
  if (enableCalendarsNum)
  {
    uint64_t v17 = MCStringForBool([(NSNumber *)enableCalendarsNum BOOLValue]);
    [v4 appendFormat:@"Enable Calendars: %@\n", v17];
  }
  enableRemindersNum = self->_enableRemindersNum;
  if (enableRemindersNum)
  {
    uint64_t v19 = MCStringForBool([(NSNumber *)enableRemindersNum BOOLValue]);
    [v4 appendFormat:@"Enable Reminders: %@\n", v19];
  }
  enableNotesNum = self->_enableNotesNum;
  if (enableNotesNum)
  {
    uint64_t v21 = MCStringForBool([(NSNumber *)enableNotesNum BOOLValue]);
    [v4 appendFormat:@"Enable Notes    : %@\n", v21];
  }
  enableMailUserOverridableNum = self->_enableMailUserOverridableNum;
  if (enableMailUserOverridableNum)
  {
    v23 = MCStringForBool([(NSNumber *)enableMailUserOverridableNum BOOLValue]);
    [v4 appendFormat:@"Enable Mail is user-overridable     : %@\n", v23];
  }
  enableContactsUserOverridableNum = self->_enableContactsUserOverridableNum;
  if (enableContactsUserOverridableNum)
  {
    v25 = MCStringForBool([(NSNumber *)enableContactsUserOverridableNum BOOLValue]);
    [v4 appendFormat:@"Enable Contacts is user-overridable : %@\n", v25];
  }
  enableCalendarsUserOverridableNum = self->_enableCalendarsUserOverridableNum;
  if (enableCalendarsUserOverridableNum)
  {
    v27 = MCStringForBool([(NSNumber *)enableCalendarsUserOverridableNum BOOLValue]);
    [v4 appendFormat:@"Enable Calendars is user-overridable: %@\n", v27];
  }
  enableRemindersUserOverridableNum = self->_enableRemindersUserOverridableNum;
  if (enableRemindersUserOverridableNum)
  {
    v29 = MCStringForBool([(NSNumber *)enableRemindersUserOverridableNum BOOLValue]);
    [v4 appendFormat:@"Enable Reminders is user-overridable: %@\n", v29];
  }
  enableNotesUserOverridableNum = self->_enableNotesUserOverridableNum;
  if (enableNotesUserOverridableNum)
  {
    v31 = MCStringForBool([(NSNumber *)enableNotesUserOverridableNum BOOLValue]);
    [v4 appendFormat:@"Enable Notes is user-overridable    : %@\n", v31];
  }
  return v4;
}

- (id)stubDictionary
{
  v30.receiver = self;
  v30.super_class = (Class)MCEASAccountPayload;
  uint64_t v3 = [(MCEmailAccountPayloadBase *)&v30 stubDictionary];
  uint64_t v4 = v3;
  accountDescription = self->_accountDescription;
  if (accountDescription) {
    [v3 setObject:accountDescription forKey:@"PayloadDisplayName"];
  }
  hostname = self->_hostname;
  if (hostname) {
    [v4 setObject:hostname forKey:@"Host"];
  }
  username = self->_username;
  if (username) {
    [v4 setObject:username forKey:@"UserName"];
  }
  emailAddress = self->_emailAddress;
  if (emailAddress) {
    [v4 setObject:emailAddress forKey:@"EmailAddress"];
  }
  useSSL = self->_useSSL;
  if (useSSL) {
    [v4 setObject:useSSL forKey:@"SSL"];
  }
  useOAuth = self->_useOAuth;
  if (useOAuth) {
    [v4 setObject:useOAuth forKey:@"OAuth"];
  }
  OAuthSignInURL = self->_OAuthSignInURL;
  if (OAuthSignInURL) {
    [v4 setObject:OAuthSignInURL forKey:@"OAuthSignInURL"];
  }
  OAuthTokenRequestURL = self->_OAuthTokenRequestURL;
  if (OAuthTokenRequestURL) {
    [v4 setObject:OAuthTokenRequestURL forKey:@"OAuthTokenRequestURL"];
  }
  mailNumberOfPastDaysToSync = self->_mailNumberOfPastDaysToSync;
  if (mailNumberOfPastDaysToSync) {
    [v4 setObject:mailNumberOfPastDaysToSync forKey:@"MailNumberOfPastDaysToSync"];
  }
  uint64_t v14 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_syncDefaultFoldersOnly];
  [v4 setObject:v14 forKey:@"SyncDefaultFoldersOnly"];

  accountPersistentUUID = self->_accountPersistentUUID;
  if (accountPersistentUUID) {
    [v4 setObject:accountPersistentUUID forKey:@"EASAccountPersistentUUID"];
  }
  acAccountIdentifier = self->_acAccountIdentifier;
  if (acAccountIdentifier) {
    [v4 setObject:acAccountIdentifier forKey:@"ACAccountIdentifier"];
  }
  certificatePersistentID = self->_certificatePersistentID;
  if (certificatePersistentID) {
    [v4 setObject:certificatePersistentID forKey:@"EASAccountCertificatePersistentID"];
  }
  communicationServiceRules = self->_communicationServiceRules;
  if (communicationServiceRules) {
    [v4 setObject:communicationServiceRules forKey:@"CommunicationServiceRules"];
  }
  enableMailNum = self->_enableMailNum;
  if (enableMailNum) {
    [v4 setObject:enableMailNum forKey:@"EnableMail"];
  }
  enableContactsNum = self->_enableContactsNum;
  if (enableContactsNum) {
    [v4 setObject:enableContactsNum forKey:@"EnableContacts"];
  }
  enableCalendarsNum = self->_enableCalendarsNum;
  if (enableCalendarsNum) {
    [v4 setObject:enableCalendarsNum forKey:@"EnableCalendars"];
  }
  enableRemindersNum = self->_enableRemindersNum;
  if (enableRemindersNum) {
    [v4 setObject:enableRemindersNum forKey:@"EnableReminders"];
  }
  enableNotesNum = self->_enableNotesNum;
  if (enableNotesNum) {
    [v4 setObject:enableNotesNum forKey:@"EnableNotes"];
  }
  enableMailUserOverridableNum = self->_enableMailUserOverridableNum;
  if (enableMailUserOverridableNum) {
    [v4 setObject:enableMailUserOverridableNum forKey:@"EnableMailUserOverridable"];
  }
  enableContactsUserOverridableNum = self->_enableContactsUserOverridableNum;
  if (enableContactsUserOverridableNum) {
    [v4 setObject:enableContactsUserOverridableNum forKey:@"EnableContactsUserOverridable"];
  }
  enableCalendarsUserOverridableNum = self->_enableCalendarsUserOverridableNum;
  if (enableCalendarsUserOverridableNum) {
    [v4 setObject:enableCalendarsUserOverridableNum forKey:@"EnableCalendarsUserOverridable"];
  }
  enableRemindersUserOverridableNum = self->_enableRemindersUserOverridableNum;
  if (enableRemindersUserOverridableNum) {
    [v4 setObject:enableRemindersUserOverridableNum forKey:@"EnableRemindersUserOverridable"];
  }
  enableNotesUserOverridableNum = self->_enableNotesUserOverridableNum;
  if (enableNotesUserOverridableNum) {
    [v4 setObject:enableNotesUserOverridableNum forKey:@"EnableNotesUserOverridable"];
  }
  return v4;
}

- (id)restrictions
{
  uint64_t v2 = [(MCEASAccountPayload *)self communicationServiceRules];
  uint64_t v3 = +[MCCommunicationServiceRulesUtilities restrictionsForValidatedCommunicationServiceRules:v2];

  return v3;
}

- (NSString)emailAddress
{
  emailAddress = self->_emailAddress;
  if (emailAddress)
  {
    uint64_t v4 = (void *)[(NSString *)emailAddress copy];
  }
  else
  {
    uint64_t v5 = [(MCEASAccountPayload *)self username];
    if (v5
      && (uint64_t v6 = (void *)v5,
          [(MCEASAccountPayload *)self hostname],
          uint64_t v7 = objc_claimAutoreleasedReturnValue(),
          v7,
          v6,
          v7))
    {
      id v8 = NSString;
      id v9 = [(MCEASAccountPayload *)self username];
      v10 = [(MCEASAccountPayload *)self hostname];
      uint64_t v4 = [v8 stringWithFormat:@"%@@%@", v9, v10];
    }
    else
    {
      uint64_t v4 = 0;
    }
  }
  return (NSString *)v4;
}

- (id)subtitle1Label
{
  uint64_t v2 = [(MCEASAccountPayload *)self hostname];
  if (v2) {
    uint64_t v3 = @"EAS_SERVER_NAME_COLON";
  }
  else {
    uint64_t v3 = @"EAS_SERVER_NAME_MISSING";
  }
  uint64_t v4 = MCLocalizedString(v3);

  return v4;
}

- (id)subtitle2Label
{
  uint64_t v3 = [(MCEASAccountPayload *)self emailAddress];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = [(MCEASAccountPayload *)self hostname];

    if (v5)
    {
      uint64_t v3 = MCLocalizedString(@"EAS_EMAIL_ADDRESS_COLON");
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
  uint64_t v3 = [(MCEASAccountPayload *)self emailAddress];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = [(MCEASAccountPayload *)self hostname];

    if (v5)
    {
      uint64_t v3 = [(MCEASAccountPayload *)self emailAddress];
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
  if (self->_accountDescription)
  {
    uint64_t v4 = [MCKeyValue alloc];
    accountDescription = self->_accountDescription;
    uint64_t v6 = MCLocalizedString(@"ACCOUNT_DESCRIPTION");
    uint64_t v7 = [(MCKeyValue *)v4 initWithLocalizedString:accountDescription localizedKey:v6];

    [v3 addObject:v7];
  }
  if (self->_emailAddress)
  {
    id v8 = [MCKeyValue alloc];
    emailAddress = self->_emailAddress;
    v10 = MCLocalizedString(@"EXCHANGE_EMAIL_ADDRESS");
    v11 = [(MCKeyValue *)v8 initWithLocalizedString:emailAddress localizedKey:v10];

    [v3 addObject:v11];
  }
  if (self->_hostname)
  {
    uint64_t v12 = [MCKeyValue alloc];
    hostname = self->_hostname;
    uint64_t v14 = MCLocalizedString(@"HOSTNAME");
    id v15 = [(MCKeyValue *)v12 initWithLocalizedString:hostname localizedKey:v14];

    [v3 addObject:v15];
  }
  if (self->_username)
  {
    v16 = [MCKeyValue alloc];
    username = self->_username;
    v18 = MCLocalizedString(@"USERNAME");
    uint64_t v19 = [(MCKeyValue *)v16 initWithLocalizedString:username localizedKey:v18];

    [v3 addObject:v19];
  }
  if (self->_password)
  {
    v20 = [MCKeyValue alloc];
    uint64_t v21 = MCLocalizedString(@"PRESENT");
    v22 = MCLocalizedString(@"PASSWORD");
    v23 = [(MCKeyValue *)v20 initWithLocalizedString:v21 localizedKey:v22];

    [v3 addObject:v23];
  }
  if (self->_useSSL)
  {
    v24 = [MCKeyValue alloc];
    v25 = MCLocalizedStringForBool([(NSNumber *)self->_useSSL BOOLValue]);
    v26 = MCLocalizedString(@"USES_SSL");
    v27 = [(MCKeyValue *)v24 initWithLocalizedString:v25 localizedKey:v26];

    [v3 addObject:v27];
  }
  if (self->_useOAuth)
  {
    id v28 = [MCKeyValue alloc];
    v29 = MCLocalizedStringForBool([(NSNumber *)self->_useOAuth BOOLValue]);
    objc_super v30 = MCLocalizedString(@"USES_OAUTH");
    v31 = [(MCKeyValue *)v28 initWithLocalizedString:v29 localizedKey:v30];

    [v3 addObject:v31];
  }
  if (self->_OAuthSignInURL)
  {
    v32 = [MCKeyValue alloc];
    OAuthSignInURL = self->_OAuthSignInURL;
    uint64_t v34 = MCLocalizedString(@"OAUTH_SIGN_IN_URL");
    v35 = [(MCKeyValue *)v32 initWithLocalizedString:OAuthSignInURL localizedKey:v34];

    [v3 addObject:v35];
  }
  if (self->_OAuthTokenRequestURL)
  {
    v36 = [MCKeyValue alloc];
    OAuthTokenRequestURL = self->_OAuthTokenRequestURL;
    v38 = MCLocalizedString(@"OAUTH_TOKEN_REQUEST_URL");
    v39 = [(MCKeyValue *)v36 initWithLocalizedString:OAuthTokenRequestURL localizedKey:v38];

    [v3 addObject:v39];
  }
  if (self->_mailNumberOfPastDaysToSync)
  {
    uint64_t v40 = [NSString stringWithFormat:@"%@", self->_mailNumberOfPastDaysToSync];
    v41 = [MCKeyValue alloc];
    uint64_t v42 = MCLocalizedString(@"EXCHANGE_PAST_DAYS_TO_SYNC");
    v43 = [(MCKeyValue *)v41 initWithLocalizedString:v40 localizedKey:v42];

    [v3 addObject:v43];
  }
  if (self->_syncDefaultFoldersOnlyNum)
  {
    v44 = [MCKeyValue alloc];
    uint64_t v45 = MCLocalizedStringForBool([(NSNumber *)self->_syncDefaultFoldersOnlyNum BOOLValue]);
    v46 = MCLocalizedString(@"EXCHANGE_SYNC_DEFAULT_FOLDERS_ONLY");
    uint64_t v47 = [(MCKeyValue *)v44 initWithLocalizedString:v45 localizedKey:v46];

    [v3 addObject:v47];
  }
  if (self->_enableMailNum)
  {
    v48 = [MCKeyValue alloc];
    uint64_t v49 = MCLocalizedStringForBool([(NSNumber *)self->_enableMailNum BOOLValue]);
    v50 = MCLocalizedString(@"EXCHANGE_ENABLE_MAIL");
    uint64_t v51 = [(MCKeyValue *)v48 initWithLocalizedString:v49 localizedKey:v50];

    [v3 addObject:v51];
  }
  if (self->_enableContactsNum)
  {
    v52 = [MCKeyValue alloc];
    uint64_t v53 = MCLocalizedStringForBool([(NSNumber *)self->_enableContactsNum BOOLValue]);
    v54 = MCLocalizedString(@"EXCHANGE_ENABLE_CONTACTS");
    uint64_t v55 = [(MCKeyValue *)v52 initWithLocalizedString:v53 localizedKey:v54];

    [v3 addObject:v55];
  }
  if (self->_enableCalendarsNum)
  {
    v56 = [MCKeyValue alloc];
    uint64_t v57 = MCLocalizedStringForBool([(NSNumber *)self->_enableCalendarsNum BOOLValue]);
    uint64_t v58 = MCLocalizedString(@"EXCHANGE_ENABLE_CALENDARS");
    uint64_t v59 = [(MCKeyValue *)v56 initWithLocalizedString:v57 localizedKey:v58];

    [v3 addObject:v59];
  }
  if (self->_enableRemindersNum)
  {
    uint64_t v60 = [MCKeyValue alloc];
    uint64_t v61 = MCLocalizedStringForBool([(NSNumber *)self->_enableRemindersNum BOOLValue]);
    uint64_t v62 = MCLocalizedString(@"EXCHANGE_ENABLE_REMINDERS");
    uint64_t v63 = [(MCKeyValue *)v60 initWithLocalizedString:v61 localizedKey:v62];

    [v3 addObject:v63];
  }
  if (self->_enableNotesNum)
  {
    uint64_t v64 = [MCKeyValue alloc];
    v65 = MCLocalizedStringForBool([(NSNumber *)self->_enableNotesNum BOOLValue]);
    uint64_t v66 = MCLocalizedString(@"EXCHANGE_ENABLE_NOTES");
    v67 = [(MCKeyValue *)v64 initWithLocalizedString:v65 localizedKey:v66];

    [v3 addObject:v67];
  }
  if (self->_enableMailUserOverridableNum)
  {
    uint64_t v68 = [MCKeyValue alloc];
    v69 = MCLocalizedStringForBool([(NSNumber *)self->_enableMailUserOverridableNum BOOLValue]);
    uint64_t v70 = MCLocalizedString(@"EXCHANGE_ENABLE_MAIL_USER_OVERRIDABLE");
    v71 = [(MCKeyValue *)v68 initWithLocalizedString:v69 localizedKey:v70];

    [v3 addObject:v71];
  }
  if (self->_enableContactsUserOverridableNum)
  {
    uint64_t v72 = [MCKeyValue alloc];
    v73 = MCLocalizedStringForBool([(NSNumber *)self->_enableContactsUserOverridableNum BOOLValue]);
    uint64_t v74 = MCLocalizedString(@"EXCHANGE_ENABLE_CONTACTS_USER_OVERRIDABLE");
    v75 = [(MCKeyValue *)v72 initWithLocalizedString:v73 localizedKey:v74];

    [v3 addObject:v75];
  }
  if (self->_enableCalendarsUserOverridableNum)
  {
    uint64_t v76 = [MCKeyValue alloc];
    v77 = MCLocalizedStringForBool([(NSNumber *)self->_enableCalendarsUserOverridableNum BOOLValue]);
    uint64_t v78 = MCLocalizedString(@"EXCHANGE_ENABLE_CALENDARS_USER_OVERRIDABLE");
    v79 = [(MCKeyValue *)v76 initWithLocalizedString:v77 localizedKey:v78];

    [v3 addObject:v79];
  }
  if (self->_enableRemindersUserOverridableNum)
  {
    uint64_t v80 = [MCKeyValue alloc];
    v81 = MCLocalizedStringForBool([(NSNumber *)self->_enableRemindersUserOverridableNum BOOLValue]);
    v82 = MCLocalizedString(@"EXCHANGE_ENABLE_REMINDERS_USER_OVERRIDABLE");
    v83 = [(MCKeyValue *)v80 initWithLocalizedString:v81 localizedKey:v82];

    [v3 addObject:v83];
  }
  if (self->_enableNotesUserOverridableNum)
  {
    v84 = [MCKeyValue alloc];
    BOOL v85 = MCLocalizedStringForBool([(NSNumber *)self->_enableNotesUserOverridableNum BOOLValue]);
    uint64_t v86 = MCLocalizedString(@"EXCHANGE_ENABLE_NOTES_USER_OVERRIDABLE");
    v87 = [(MCKeyValue *)v84 initWithLocalizedString:v85 localizedKey:v86];

    [v3 addObject:v87];
  }
  if (self->_certificatePersistentID)
  {
    uint64_t v88 = [(MCPayload *)self profile];
    uint64_t v89 = [v88 subjectSummaryFromCertificateWithPersistentID:self->_certificatePersistentID];
  }
  else
  {
    if (!self->_certificateUUID) {
      goto LABEL_49;
    }
    uint64_t v88 = [(MCPayload *)self profile];
    uint64_t v89 = [v88 subjectSummaryFromCertificatePayloadWithUUID:self->_certificateUUID];
  }
  uint64_t v90 = (void *)v89;

  if (v90)
  {
    v91 = [MCKeyValue alloc];
    uint64_t v92 = MCLocalizedString(@"EXCHANGE_CERTIFICATE");
    v93 = [(MCKeyValue *)v91 initWithLocalizedString:v90 localizedKey:v92];

    [v3 addObject:v93];
  }
LABEL_49:
  uint64_t v94 = objc_opt_new();
  if ([v3 count])
  {
    v95 = +[MCKeyValueSection sectionWithKeyValues:v3];
    [v94 addObject:v95];
  }
  v98.receiver = self;
  v98.super_class = (Class)MCEASAccountPayload;
  uint64_t v96 = [(MCEmailAccountPayloadBase *)&v98 payloadDescriptionKeyValueSections];
  [v94 addObjectsFromArray:v96];

  if (![v94 count])
  {

    uint64_t v94 = 0;
  }

  return v94;
}

- (BOOL)containsSensitiveUserInformation
{
  v10.receiver = self;
  v10.super_class = (Class)MCEASAccountPayload;
  if ([(MCEmailAccountPayloadBase *)&v10 containsSensitiveUserInformation]) {
    return 1;
  }
  uint64_t v4 = [(MCEASAccountPayload *)self password];
  if (v4)
  {
    BOOL v3 = 1;
  }
  else
  {
    uint64_t v5 = [(MCEASAccountPayload *)self embeddedCertificate];
    if (v5)
    {
      BOOL v3 = 1;
    }
    else
    {
      uint64_t v6 = [(MCEASAccountPayload *)self embeddedCertificateName];
      if (v6)
      {
        BOOL v3 = 1;
      }
      else
      {
        uint64_t v7 = [(MCEASAccountPayload *)self embeddedCertificatePassword];
        if (v7)
        {
          BOOL v3 = 1;
        }
        else
        {
          id v8 = [(MCEASAccountPayload *)self certificateUUID];
          if (v8) {
            BOOL v3 = 1;
          }
          else {
            BOOL v3 = [(MCEASAccountPayload *)self hasCertificate];
          }
        }
      }
    }
  }

  return v3;
}

- (BOOL)mustNotUseSynchronizableCredential
{
  BOOL v3 = [(MCEASAccountPayload *)self password];
  if (v3)
  {
    char v4 = 1;
  }
  else
  {
    uint64_t v5 = [(MCEASAccountPayload *)self useOAuth];
    char v4 = [v5 BOOLValue];
  }
  return v4;
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

- (void)setEmailAddress:(id)a3
{
}

- (NSNumber)mailNumberOfPastDaysToSync
{
  return self->_mailNumberOfPastDaysToSync;
}

- (NSData)embeddedCertificate
{
  return self->_embeddedCertificate;
}

- (NSString)embeddedCertificateName
{
  return self->_embeddedCertificateName;
}

- (NSString)embeddedCertificatePassword
{
  return self->_embeddedCertificatePassword;
}

- (void)setEmbeddedCertificatePassword:(id)a3
{
}

- (NSString)certificateUUID
{
  return self->_certificateUUID;
}

- (NSString)accountPersistentUUID
{
  return self->_accountPersistentUUID;
}

- (void)setAccountPersistentUUID:(id)a3
{
}

- (NSData)certificatePersistentID
{
  return self->_certificatePersistentID;
}

- (void)setCertificatePersistentID:(id)a3
{
}

- (BOOL)syncDefaultFoldersOnly
{
  return self->_syncDefaultFoldersOnly;
}

- (void)setSyncDefaultFoldersOnly:(BOOL)a3
{
  self->_syncDefaultFoldersOnly = a3;
}

- (NSString)acAccountIdentifier
{
  return self->_acAccountIdentifier;
}

- (void)setAcAccountIdentifier:(id)a3
{
}

- (NSNumber)useSSL
{
  return self->_useSSL;
}

- (void)setUseSSL:(id)a3
{
}

- (NSNumber)useOAuth
{
  return self->_useOAuth;
}

- (void)setUseOAuth:(id)a3
{
}

- (NSString)OAuthSignInURL
{
  return self->_OAuthSignInURL;
}

- (void)setOAuthSignInURL:(id)a3
{
}

- (NSString)OAuthTokenRequestURL
{
  return self->_OAuthTokenRequestURL;
}

- (void)setOAuthTokenRequestURL:(id)a3
{
}

- (NSDictionary)communicationServiceRules
{
  return self->_communicationServiceRules;
}

- (BOOL)overridePreviousPassword
{
  return self->_overridePreviousPassword;
}

- (NSNumber)syncDefaultFoldersOnlyNum
{
  return self->_syncDefaultFoldersOnlyNum;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncDefaultFoldersOnlyNum, 0);
  objc_storeStrong((id *)&self->_communicationServiceRules, 0);
  objc_storeStrong((id *)&self->_OAuthTokenRequestURL, 0);
  objc_storeStrong((id *)&self->_OAuthSignInURL, 0);
  objc_storeStrong((id *)&self->_useOAuth, 0);
  objc_storeStrong((id *)&self->_useSSL, 0);
  objc_storeStrong((id *)&self->_acAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_enableNotesUserOverridableNum, 0);
  objc_storeStrong((id *)&self->_enableRemindersUserOverridableNum, 0);
  objc_storeStrong((id *)&self->_enableCalendarsUserOverridableNum, 0);
  objc_storeStrong((id *)&self->_enableContactsUserOverridableNum, 0);
  objc_storeStrong((id *)&self->_enableMailUserOverridableNum, 0);
  objc_storeStrong((id *)&self->_enableNotesNum, 0);
  objc_storeStrong((id *)&self->_enableRemindersNum, 0);
  objc_storeStrong((id *)&self->_enableCalendarsNum, 0);
  objc_storeStrong((id *)&self->_enableContactsNum, 0);
  objc_storeStrong((id *)&self->_enableMailNum, 0);
  objc_storeStrong((id *)&self->_certificatePersistentID, 0);
  objc_storeStrong((id *)&self->_accountPersistentUUID, 0);
  objc_storeStrong((id *)&self->_certificateUUID, 0);
  objc_storeStrong((id *)&self->_embeddedCertificatePassword, 0);
  objc_storeStrong((id *)&self->_embeddedCertificateName, 0);
  objc_storeStrong((id *)&self->_embeddedCertificate, 0);
  objc_storeStrong((id *)&self->_mailNumberOfPastDaysToSync, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_hostname, 0);
  objc_storeStrong((id *)&self->_accountDescription, 0);
}

- (id)mailAccountIdentifiers
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
  return v2;
}

- (id)contactsAccountIdentifiers
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
  return v2;
}

- (id)calendarAccountIdentifiers
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
  return v2;
}

@end