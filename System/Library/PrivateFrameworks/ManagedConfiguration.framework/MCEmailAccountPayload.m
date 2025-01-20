@interface MCEmailAccountPayload
+ (id)localizedPluralForm;
+ (id)localizedSingularForm;
+ (id)profileNameFromAccountTag:(id)a3;
+ (id)typeStrings;
- (BOOL)containsSensitiveUserInformation;
- (BOOL)incomingMailServerUseSSL;
- (BOOL)outgoingMailServerUseSSL;
- (BOOL)outgoingPasswordSameAsIncomingPassword;
- (MCEmailAccountPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5;
- (NSNumber)incomingMailServerPortNumber;
- (NSNumber)incomingMailServerUseSSLNum;
- (NSNumber)outgoingMailServerPortNumber;
- (NSNumber)outgoingMailServerUseSSLNum;
- (NSNumber)outgoingPasswordSameAsIncomingPasswordNum;
- (NSString)emailAccountDescription;
- (NSString)emailAccountName;
- (NSString)emailAccountType;
- (NSString)emailAddress;
- (NSString)incomingACAccountIdentifier;
- (NSString)incomingMailServerAuthentication;
- (NSString)incomingMailServerHostname;
- (NSString)incomingMailServerIMAPPathPrefix;
- (NSString)incomingMailServerUsername;
- (NSString)incomingPassword;
- (NSString)outgoingACAccountIdentifier;
- (NSString)outgoingMailServerAuthentication;
- (NSString)outgoingMailServerHostname;
- (NSString)outgoingMailServerUsername;
- (NSString)outgoingPassword;
- (id)_authenticationTypeLocalizedString:(id)a3;
- (id)_emailAccountTypeLocalizedString;
- (id)mailAccountIdentifiers;
- (id)payloadDescriptionKeyValueSections;
- (id)stubDictionary;
- (id)subtitle1Label;
- (id)subtitle2Description;
- (id)subtitle2Label;
- (id)verboseDescription;
- (void)setIncomingACAccountIdentifier:(id)a3;
- (void)setOutgoingACAccountIdentifier:(id)a3;
@end

@implementation MCEmailAccountPayload

+ (id)typeStrings
{
  return (id)[MEMORY[0x1E4F1C978] arrayWithObject:@"com.apple.mail.managed"];
}

+ (id)localizedSingularForm
{
  return MCLocalizedFormat(@"EMAIL_ACCOUNT_DESCRIPTION_SINGULAR_FORMAT", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)localizedPluralForm
{
  return MCLocalizedFormat(@"EMAIL_ACCOUNT_DESCRIPTION_PLURAL_FORMAT", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCEmailAccountPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  v116[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v109.receiver = self;
  v109.super_class = (Class)MCEmailAccountPayload;
  v10 = [(MCEmailAccountPayloadBase *)&v109 initWithDictionary:v8 profile:v9 outError:a5];
  if (!v10) {
    goto LABEL_38;
  }
  if ([v9 isStub])
  {
    id v98 = 0;
    uint64_t v11 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"EmailAccountType" isRequired:0 outError:&v98];
    id v12 = v98;
    emailAccountType = v10->_emailAccountType;
    v10->_emailAccountType = (NSString *)v11;

    if (v12) {
      goto LABEL_29;
    }
    id v97 = 0;
    uint64_t v14 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"IncomingMailServerAuthentication" isRequired:0 outError:&v97];
    id v12 = v97;
    incomingMailServerAuthentication = v10->_incomingMailServerAuthentication;
    v10->_incomingMailServerAuthentication = (NSString *)v14;

    if (v12) {
      goto LABEL_29;
    }
    id v96 = 0;
    uint64_t v16 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"IncomingMailServerHostName" isRequired:0 outError:&v96];
    id v12 = v96;
    incomingMailServerHostname = v10->_incomingMailServerHostname;
    v10->_incomingMailServerHostname = (NSString *)v16;

    if (v12) {
      goto LABEL_29;
    }
    id v95 = 0;
    uint64_t v18 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"OutgoingMailServerAuthentication" isRequired:0 outError:&v95];
    id v12 = v95;
    outgoingMailServerAuthentication = v10->_outgoingMailServerAuthentication;
    v10->_outgoingMailServerAuthentication = (NSString *)v18;

    if (v12) {
      goto LABEL_29;
    }
    id v94 = 0;
    uint64_t v20 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"OutgoingMailServerHostName" isRequired:0 outError:&v94];
    id v12 = v94;
    outgoingMailServerHostname = v10->_outgoingMailServerHostname;
    v10->_outgoingMailServerHostname = (NSString *)v20;

    if (v12) {
      goto LABEL_29;
    }
    id v93 = 0;
    uint64_t v22 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"IncomingACAccountIdentifier" isRequired:0 outError:&v93];
    id v12 = v93;
    incomingACAccountIdentifier = v10->_incomingACAccountIdentifier;
    v10->_incomingACAccountIdentifier = (NSString *)v22;

    if (v12) {
      goto LABEL_29;
    }
    id v92 = 0;
    uint64_t v24 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"OutgoingACAccountIdentifier" isRequired:0 outError:&v92];
    id v12 = v92;
    uint64_t v25 = 360;
  }
  else
  {
    id v108 = 0;
    uint64_t v26 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"EmailAccountType" isRequired:1 outError:&v108];
    id v12 = v108;
    v27 = v10->_emailAccountType;
    v10->_emailAccountType = (NSString *)v26;

    if (v12) {
      goto LABEL_29;
    }
    v28 = v10->_emailAccountType;
    v116[0] = @"EmailTypePOP";
    v116[1] = @"EmailTypeIMAP";
    v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v116 count:2];
    id v107 = 0;
    +[MCProfile checkString:v28 isOneOfStrings:v29 key:@"EmailAccountType" errorDomain:@"MCPayloadErrorDomain" errorCode:2004 errorString:@"ERROR_PROFILE_FIELD_INVALID_P_FIELD" outError:&v107];
    id v30 = v107;

    id v106 = v30;
    uint64_t v31 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"IncomingMailServerAuthentication" isRequired:1 outError:&v106];
    id v12 = v106;

    v32 = v10->_incomingMailServerAuthentication;
    v10->_incomingMailServerAuthentication = (NSString *)v31;

    if (v12) {
      goto LABEL_29;
    }
    v33 = v10->_incomingMailServerAuthentication;
    v115[0] = @"EmailAuthNone";
    v115[1] = @"EmailAuthPassword";
    v115[2] = @"EmailAuthCRAMMD5";
    v115[3] = @"EmailAuthNTLM";
    v115[4] = @"EmailAuthHTTPMD5";
    v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v115 count:5];
    id v105 = 0;
    +[MCProfile checkString:v33 isOneOfStrings:v34 key:@"IncomingMailServerAuthentication" errorDomain:@"MCPayloadErrorDomain" errorCode:2004 errorString:@"ERROR_PROFILE_FIELD_INVALID_P_FIELD" outError:&v105];
    id v35 = v105;

    id v104 = v35;
    uint64_t v36 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"IncomingMailServerHostName" isRequired:1 outError:&v104];
    id v12 = v104;

    v37 = v10->_incomingMailServerHostname;
    v10->_incomingMailServerHostname = (NSString *)v36;

    if (v12) {
      goto LABEL_29;
    }
    id v103 = 0;
    uint64_t v38 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"OutgoingMailServerAuthentication" isRequired:1 outError:&v103];
    id v12 = v103;
    v39 = v10->_outgoingMailServerAuthentication;
    v10->_outgoingMailServerAuthentication = (NSString *)v38;

    if (v12) {
      goto LABEL_29;
    }
    v40 = v10->_outgoingMailServerAuthentication;
    v114[0] = @"EmailAuthNone";
    v114[1] = @"EmailAuthPassword";
    v114[2] = @"EmailAuthCRAMMD5";
    v114[3] = @"EmailAuthNTLM";
    v114[4] = @"EmailAuthHTTPMD5";
    v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v114 count:5];
    id v102 = 0;
    +[MCProfile checkString:v40 isOneOfStrings:v41 key:@"OutgoingMailServerAuthentication" errorDomain:@"MCPayloadErrorDomain" errorCode:2004 errorString:@"ERROR_PROFILE_FIELD_INVALID_P_FIELD" outError:&v102];
    id v42 = v102;

    id v101 = v42;
    uint64_t v43 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"OutgoingMailServerHostName" isRequired:1 outError:&v101];
    id v12 = v101;

    v44 = v10->_outgoingMailServerHostname;
    v10->_outgoingMailServerHostname = (NSString *)v43;

    if (v12) {
      goto LABEL_29;
    }
    id v100 = 0;
    uint64_t v45 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"IncomingPassword" isRequired:0 outError:&v100];
    id v12 = v100;
    incomingPassword = v10->_incomingPassword;
    v10->_incomingPassword = (NSString *)v45;

    if (v12) {
      goto LABEL_29;
    }
    id v99 = 0;
    uint64_t v24 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"OutgoingPassword" isRequired:0 outError:&v99];
    id v12 = v99;
    uint64_t v25 = 296;
  }
  v47 = *(Class *)((char *)&v10->super.super.super.isa + v25);
  *(Class *)((char *)&v10->super.super.super.isa + v25) = (Class)v24;

  if (v12) {
    goto LABEL_29;
  }
  id v91 = 0;
  uint64_t v48 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"EmailAccountDescription" isRequired:0 outError:&v91];
  id v12 = v91;
  emailAccountDescription = v10->_emailAccountDescription;
  v10->_emailAccountDescription = (NSString *)v48;

  if (v12) {
    goto LABEL_29;
  }
  id v90 = 0;
  uint64_t v50 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"EmailAddress" isRequired:0 outError:&v90];
  id v12 = v90;
  emailAddress = v10->_emailAddress;
  v10->_emailAddress = (NSString *)v50;

  if (v12) {
    goto LABEL_29;
  }
  id v89 = 0;
  uint64_t v52 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"EmailAccountName" isRequired:0 outError:&v89];
  id v12 = v89;
  emailAccountName = v10->_emailAccountName;
  v10->_emailAccountName = (NSString *)v52;

  if (v12) {
    goto LABEL_29;
  }
  id v88 = 0;
  uint64_t v54 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"IncomingMailServerUsername" isRequired:0 outError:&v88];
  id v12 = v88;
  incomingMailServerUsername = v10->_incomingMailServerUsername;
  v10->_incomingMailServerUsername = (NSString *)v54;

  if (v12) {
    goto LABEL_29;
  }
  id v87 = 0;
  uint64_t v56 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"IncomingMailServerPortNumber" isRequired:0 outError:&v87];
  id v12 = v87;
  incomingMailServerPortNumber = v10->_incomingMailServerPortNumber;
  v10->_incomingMailServerPortNumber = (NSNumber *)v56;

  if (v12) {
    goto LABEL_29;
  }
  id v86 = 0;
  uint64_t v58 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"IncomingMailServerUseSSL" isRequired:0 outError:&v86];
  id v12 = v86;
  incomingMailServerUseSSLNum = v10->_incomingMailServerUseSSLNum;
  v10->_incomingMailServerUseSSLNum = (NSNumber *)v58;

  if (v12) {
    goto LABEL_29;
  }
  v10->_incomingMailServerUseSSL = [(NSNumber *)v10->_incomingMailServerUseSSLNum BOOLValue];
  id v85 = 0;
  uint64_t v60 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"IncomingMailServerIMAPPathPrefix" isRequired:0 outError:&v85];
  id v12 = v85;
  incomingMailServerIMAPPathPrefix = v10->_incomingMailServerIMAPPathPrefix;
  v10->_incomingMailServerIMAPPathPrefix = (NSString *)v60;

  if (v12) {
    goto LABEL_29;
  }
  id v84 = 0;
  uint64_t v62 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"OutgoingPasswordSameAsIncomingPassword" isRequired:0 outError:&v84];
  id v12 = v84;
  outgoingPasswordSameAsIncomingPasswordNum = v10->_outgoingPasswordSameAsIncomingPasswordNum;
  v10->_outgoingPasswordSameAsIncomingPasswordNum = (NSNumber *)v62;

  if (v12) {
    goto LABEL_29;
  }
  v10->_outgoingPasswordSameAsIncomingPassword = [(NSNumber *)v10->_outgoingPasswordSameAsIncomingPasswordNum BOOLValue];
  id v83 = 0;
  uint64_t v64 = [v8 MCValidateAndRemoveNonZeroLengthStringWithKey:@"OutgoingMailServerUsername" isRequired:0 outError:&v83];
  id v12 = v83;
  outgoingMailServerUsername = v10->_outgoingMailServerUsername;
  v10->_outgoingMailServerUsername = (NSString *)v64;

  if (v12) {
    goto LABEL_29;
  }
  id v82 = 0;
  uint64_t v66 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"OutgoingMailServerPortNumber" isRequired:0 outError:&v82];
  id v12 = v82;
  outgoingMailServerPortNumber = v10->_outgoingMailServerPortNumber;
  v10->_outgoingMailServerPortNumber = (NSNumber *)v66;

  if (v12
    || (id v81 = 0,
        [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:@"OutgoingMailServerUseSSL" isRequired:0 outError:&v81], v68 = objc_claimAutoreleasedReturnValue(), id v12 = v81, outgoingMailServerUseSSLNum = v10->_outgoingMailServerUseSSLNum, v10->_outgoingMailServerUseSSLNum = (NSNumber *)v68, outgoingMailServerUseSSLNum, v12))
  {
LABEL_29:
    v70 = [(MCPayload *)v10 malformedPayloadErrorWithError:v12];
    v71 = v70;
    if (a5) {
      *a5 = v70;
    }
    v72 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      v73 = v72;
      v74 = objc_opt_class();
      id v75 = v74;
      v76 = [v71 MCVerboseDescription];
      *(_DWORD *)buf = 138543618;
      v111 = v74;
      __int16 v112 = 2114;
      id v113 = v76;
      _os_log_impl(&dword_1A13F0000, v73, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);
    }
    v10 = 0;
    goto LABEL_34;
  }
  v10->_outgoingMailServerUseSSL = [(NSNumber *)v10->_outgoingMailServerUseSSLNum BOOLValue];
LABEL_34:
  if ([v8 count])
  {
    v77 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      v78 = v77;
      v79 = [(MCPayload *)v10 friendlyName];
      *(_DWORD *)buf = 138543618;
      v111 = v79;
      __int16 v112 = 2114;
      id v113 = v8;
      _os_log_impl(&dword_1A13F0000, v78, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);
    }
  }

LABEL_38:
  return v10;
}

- (id)stubDictionary
{
  v25.receiver = self;
  v25.super_class = (Class)MCEmailAccountPayload;
  uint64_t v3 = [(MCEmailAccountPayloadBase *)&v25 stubDictionary];
  uint64_t v4 = v3;
  emailAccountDescription = self->_emailAccountDescription;
  if (emailAccountDescription) {
    [v3 setObject:emailAccountDescription forKey:@"EmailAccountDescription"];
  }
  emailAccountType = self->_emailAccountType;
  if (emailAccountType) {
    [v4 setObject:emailAccountType forKey:@"EmailAccountType"];
  }
  incomingMailServerHostname = self->_incomingMailServerHostname;
  if (incomingMailServerHostname) {
    [v4 setObject:incomingMailServerHostname forKey:@"IncomingMailServerHostName"];
  }
  emailAddress = self->_emailAddress;
  if (emailAddress) {
    [v4 setObject:emailAddress forKey:@"EmailAddress"];
  }
  emailAccountName = self->_emailAccountName;
  if (emailAccountName) {
    [v4 setObject:emailAccountName forKey:@"EmailAccountName"];
  }
  incomingMailServerAuthentication = self->_incomingMailServerAuthentication;
  if (incomingMailServerAuthentication) {
    [v4 setObject:incomingMailServerAuthentication forKey:@"IncomingMailServerAuthentication"];
  }
  uint64_t v11 = self->_incomingMailServerHostname;
  if (v11) {
    [v4 setObject:v11 forKey:@"IncomingMailServerHostName"];
  }
  incomingMailServerPortNumber = self->_incomingMailServerPortNumber;
  if (incomingMailServerPortNumber) {
    [v4 setObject:incomingMailServerPortNumber forKey:@"IncomingMailServerPortNumber"];
  }
  incomingMailServerUseSSLNum = self->_incomingMailServerUseSSLNum;
  if (incomingMailServerUseSSLNum) {
    [v4 setObject:incomingMailServerUseSSLNum forKey:@"IncomingMailServerUseSSL"];
  }
  incomingMailServerUsername = self->_incomingMailServerUsername;
  if (incomingMailServerUsername) {
    [v4 setObject:incomingMailServerUsername forKey:@"IncomingMailServerUsername"];
  }
  incomingMailServerIMAPPathPrefix = self->_incomingMailServerIMAPPathPrefix;
  if (incomingMailServerIMAPPathPrefix) {
    [v4 setObject:incomingMailServerIMAPPathPrefix forKey:@"IncomingMailServerIMAPPathPrefix"];
  }
  incomingACAccountIdentifier = self->_incomingACAccountIdentifier;
  if (incomingACAccountIdentifier) {
    [v4 setObject:incomingACAccountIdentifier forKey:@"IncomingACAccountIdentifier"];
  }
  outgoingMailServerAuthentication = self->_outgoingMailServerAuthentication;
  if (outgoingMailServerAuthentication) {
    [v4 setObject:outgoingMailServerAuthentication forKey:@"OutgoingMailServerAuthentication"];
  }
  outgoingMailServerHostname = self->_outgoingMailServerHostname;
  if (outgoingMailServerHostname) {
    [v4 setObject:outgoingMailServerHostname forKey:@"OutgoingMailServerHostName"];
  }
  outgoingMailServerPortNumber = self->_outgoingMailServerPortNumber;
  if (outgoingMailServerPortNumber) {
    [v4 setObject:outgoingMailServerPortNumber forKey:@"OutgoingMailServerPortNumber"];
  }
  outgoingMailServerUseSSLNum = self->_outgoingMailServerUseSSLNum;
  if (outgoingMailServerUseSSLNum) {
    [v4 setObject:outgoingMailServerUseSSLNum forKey:@"OutgoingMailServerUseSSL"];
  }
  outgoingMailServerUsername = self->_outgoingMailServerUsername;
  if (outgoingMailServerUsername) {
    [v4 setObject:outgoingMailServerUsername forKey:@"OutgoingMailServerUsername"];
  }
  outgoingPasswordSameAsIncomingPasswordNum = self->_outgoingPasswordSameAsIncomingPasswordNum;
  if (outgoingPasswordSameAsIncomingPasswordNum) {
    [v4 setObject:outgoingPasswordSameAsIncomingPasswordNum forKey:@"OutgoingPasswordSameAsIncomingPassword"];
  }
  outgoingACAccountIdentifier = self->_outgoingACAccountIdentifier;
  if (outgoingACAccountIdentifier) {
    [v4 setObject:outgoingACAccountIdentifier forKey:@"OutgoingACAccountIdentifier"];
  }
  return v4;
}

- (id)verboseDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v14.receiver = self;
  v14.super_class = (Class)MCEmailAccountPayload;
  uint64_t v4 = [(MCEmailAccountPayloadBase *)&v14 verboseDescription];
  uint64_t v5 = (void *)[v3 initWithFormat:@"%@\n", v4];

  uint64_t v6 = [(MCPayload *)self profile];
  char v7 = [v6 isStub];

  if ((v7 & 1) == 0)
  {
    if (self->_emailAccountDescription) {
      [v5 appendFormat:@"Acct Desc  : %@\n", self->_emailAccountDescription];
    }
    if (self->_emailAccountName) {
      [v5 appendFormat:@"Name       : %@\n", self->_emailAccountName];
    }
    if (self->_emailAccountType) {
      [v5 appendFormat:@"Type       : %@\n", self->_emailAccountType];
    }
    if (self->_emailAddress) {
      [v5 appendFormat:@"Address    : %@\n", self->_emailAddress];
    }
    if (self->_incomingMailServerAuthentication) {
      [v5 appendFormat:@"Incoming server auth     : %@\n", self->_incomingMailServerAuthentication];
    }
    if (self->_incomingMailServerHostname) {
      [v5 appendFormat:@"Incoming server hostname : %@\n", self->_incomingMailServerHostname];
    }
    incomingMailServerPortNumber = self->_incomingMailServerPortNumber;
    if (incomingMailServerPortNumber) {
      objc_msgSend(v5, "appendFormat:", @"Incoming server port     : %u\n", -[NSNumber unsignedIntValue](incomingMailServerPortNumber, "unsignedIntValue"));
    }
    id v9 = MCStringForBool(self->_incomingMailServerUseSSL);
    [v5 appendFormat:@"Incoming server uses SSL : %@\n", v9];

    if (self->_incomingMailServerUsername) {
      [v5 appendFormat:@"Incoming server username : %@\n", self->_incomingMailServerUsername];
    }
    if (self->_incomingMailServerIMAPPathPrefix) {
      [v5 appendFormat:@"Incoming server IMAP pfx : %@\n", self->_incomingMailServerIMAPPathPrefix];
    }
    if (self->_incomingPassword) {
      [v5 appendFormat:@"Incoming server password : (set)\n"];
    }
    if (self->_incomingACAccountIdentifier) {
      [v5 appendFormat:@"Incoming ACAccount Identifier : %@\n", self->_incomingACAccountIdentifier];
    }
    if (self->_outgoingPassword) {
      [v5 appendFormat:@"Outgoing server password : (set)\n"];
    }
    v10 = MCStringForBool(self->_outgoingPasswordSameAsIncomingPassword);
    [v5 appendFormat:@"Outgoing pwd same as incoming: %@\n", v10];

    if (self->_outgoingMailServerAuthentication) {
      [v5 appendFormat:@"Outgoing server auth     : %@\n", self->_outgoingMailServerAuthentication];
    }
    if (self->_outgoingMailServerHostname) {
      [v5 appendFormat:@"Outgoing server hostname : %@\n", self->_outgoingMailServerHostname];
    }
    outgoingMailServerPortNumber = self->_outgoingMailServerPortNumber;
    if (outgoingMailServerPortNumber) {
      objc_msgSend(v5, "appendFormat:", @"Outgoing server port     : %u\n", -[NSNumber unsignedIntValue](outgoingMailServerPortNumber, "unsignedIntValue"));
    }
    id v12 = MCStringForBool(self->_outgoingMailServerUseSSL);
    [v5 appendFormat:@"Outgoing server uses SSL : %@\n", v12];

    if (self->_outgoingMailServerUsername) {
      [v5 appendFormat:@"Outgoing server username : %@\n", self->_outgoingMailServerUsername];
    }
    if (self->_outgoingACAccountIdentifier) {
      [v5 appendFormat:@"Outgoing ACAccount Identifier : %@\n", self->_outgoingACAccountIdentifier];
    }
  }
  return v5;
}

- (id)subtitle1Label
{
  uint64_t v2 = [(MCEmailAccountPayload *)self _emailAccountTypeLocalizedString];
  if (v2) {
    id v3 = @"EMAIL_ACCOUNT_TYPE_COLON";
  }
  else {
    id v3 = @"EMAIL_ACCOUNT_ACCOUNT_TYPE_MISSING";
  }
  uint64_t v4 = MCLocalizedString(v3);

  return v4;
}

- (id)subtitle2Label
{
  id v3 = [(MCEmailAccountPayload *)self incomingMailServerHostname];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = [(MCEmailAccountPayload *)self _emailAccountTypeLocalizedString];

    if (v5)
    {
      id v3 = MCLocalizedString(@"EMAIL_ACCOUNT_SERVER_COLON");
    }
    else
    {
      id v3 = 0;
    }
  }
  return v3;
}

- (id)subtitle2Description
{
  id v3 = [(MCEmailAccountPayload *)self incomingMailServerHostname];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = [(MCEmailAccountPayload *)self _emailAccountTypeLocalizedString];

    if (v5)
    {
      id v3 = [(MCEmailAccountPayload *)self incomingMailServerHostname];
    }
    else
    {
      id v3 = 0;
    }
  }
  return v3;
}

- (id)_emailAccountTypeLocalizedString
{
  uint64_t v2 = [(MCEmailAccountPayload *)self emailAccountType];
  int v3 = [v2 isEqualToString:@"EmailTypeIMAP"];

  if (v3) {
    uint64_t v4 = @"EMAIL_ACCOUNT_TYPE_IMAP";
  }
  else {
    uint64_t v4 = @"EMAIL_ACCOUNT_TYPE_POP";
  }
  uint64_t v5 = MCLocalizedString(v4);
  return v5;
}

- (id)_authenticationTypeLocalizedString:(id)a3
{
  id v3 = a3;
  uint64_t v4 = MCLocalizedString(@"AUTHENTICATION_TYPE_NONE");
  if ([v3 isEqualToString:@"EmailAuthPassword"])
  {
    uint64_t v5 = @"AUTHENTICATION_TYPE_PASSWORD";
  }
  else if ([v3 isEqualToString:@"EmailAuthCRAMMD5"])
  {
    uint64_t v5 = @"AUTHENTICATION_TYPE_CRAMMD5";
  }
  else if ([v3 isEqualToString:@"EmailAuthNTLM"])
  {
    uint64_t v5 = @"AUTHENTICATION_TYPE_NTLM";
  }
  else
  {
    if (![v3 isEqualToString:@"EmailAuthHTTPMD5"]) {
      goto LABEL_10;
    }
    uint64_t v5 = @"AUTHENTICATION_TYPE_HTTPMD5";
  }
  uint64_t v6 = MCLocalizedString(v5);

  uint64_t v4 = (void *)v6;
LABEL_10:

  return v4;
}

- (id)payloadDescriptionKeyValueSections
{
  id v3 = objc_opt_new();
  uint64_t v4 = objc_opt_new();
  if (self->_emailAccountDescription)
  {
    uint64_t v5 = [MCKeyValue alloc];
    emailAccountDescription = self->_emailAccountDescription;
    char v7 = MCLocalizedString(@"ACCOUNT_DESCRIPTION");
    id v8 = [(MCKeyValue *)v5 initWithLocalizedString:emailAccountDescription localizedKey:v7];

    [v4 addObject:v8];
  }
  if (self->_emailAccountName)
  {
    id v9 = [MCKeyValue alloc];
    emailAccountName = self->_emailAccountName;
    uint64_t v11 = MCLocalizedString(@"EMAIL_ACCOUNT_NAME");
    id v12 = [(MCKeyValue *)v9 initWithLocalizedString:emailAccountName localizedKey:v11];

    [v4 addObject:v12];
  }
  if (self->_emailAccountType)
  {
    v13 = [MCKeyValue alloc];
    objc_super v14 = [(MCEmailAccountPayload *)self _emailAccountTypeLocalizedString];
    v15 = MCLocalizedString(@"TYPE");
    uint64_t v16 = [(MCKeyValue *)v13 initWithLocalizedString:v14 localizedKey:v15];

    [v4 addObject:v16];
  }
  if (self->_emailAddress)
  {
    v17 = [MCKeyValue alloc];
    emailAddress = self->_emailAddress;
    v19 = MCLocalizedString(@"EMAIL_ACCOUNT_ADDRESS");
    uint64_t v20 = [(MCKeyValue *)v17 initWithLocalizedString:emailAddress localizedKey:v19];

    [v4 addObject:v20];
  }
  if ([v4 count])
  {
    v21 = +[MCKeyValueSection sectionWithKeyValues:v4];
    [v3 addObject:v21];

    uint64_t v22 = objc_opt_new();
    uint64_t v4 = (void *)v22;
  }
  if (self->_incomingMailServerHostname)
  {
    v23 = [MCKeyValue alloc];
    incomingMailServerHostname = self->_incomingMailServerHostname;
    objc_super v25 = MCLocalizedString(@"EMAIL_ACCOUNT_HOSTNAME");
    uint64_t v26 = [(MCKeyValue *)v23 initWithLocalizedString:incomingMailServerHostname localizedKey:v25];

    [v4 addObject:v26];
  }
  if (self->_incomingMailServerUsername)
  {
    v27 = [MCKeyValue alloc];
    incomingMailServerUsername = self->_incomingMailServerUsername;
    v29 = MCLocalizedString(@"EMAIL_ACCOUNT_USERNAME");
    id v30 = [(MCKeyValue *)v27 initWithLocalizedString:incomingMailServerUsername localizedKey:v29];

    [v4 addObject:v30];
  }
  if (self->_incomingMailServerAuthentication)
  {
    uint64_t v31 = [MCKeyValue alloc];
    v32 = [(MCEmailAccountPayload *)self _authenticationTypeLocalizedString:self->_incomingMailServerAuthentication];
    v33 = MCLocalizedString(@"EMAIL_ACCOUNT_AUTHENTICATION");
    v34 = [(MCKeyValue *)v31 initWithLocalizedString:v32 localizedKey:v33];

    [v4 addObject:v34];
  }
  if (self->_incomingPassword)
  {
    id v35 = [MCKeyValue alloc];
    uint64_t v36 = MCLocalizedString(@"PASSWORD_SET");
    v37 = MCLocalizedString(@"EMAIL_ACCOUNT_PASSWORD");
    uint64_t v38 = [(MCKeyValue *)v35 initWithLocalizedString:v36 localizedKey:v37];

    [v4 addObject:v38];
  }
  if (self->_incomingMailServerUseSSLNum)
  {
    v39 = [MCKeyValue alloc];
    v40 = MCLocalizedStringForBool([(NSNumber *)self->_incomingMailServerUseSSLNum BOOLValue]);
    v41 = MCLocalizedString(@"EMAIL_ACCOUNT_SSL");
    id v42 = [(MCKeyValue *)v39 initWithLocalizedString:v40 localizedKey:v41];

    [v4 addObject:v42];
  }
  if (self->_incomingMailServerPortNumber)
  {
    uint64_t v43 = [NSString stringWithFormat:@"%@", self->_incomingMailServerPortNumber];
    v44 = [MCKeyValue alloc];
    uint64_t v45 = MCLocalizedString(@"EMAIL_ACCOUNT_PORT");
    v46 = [(MCKeyValue *)v44 initWithLocalizedString:v43 localizedKey:v45];

    [v4 addObject:v46];
  }
  if (self->_incomingMailServerIMAPPathPrefix)
  {
    v47 = [MCKeyValue alloc];
    incomingMailServerIMAPPathPrefix = self->_incomingMailServerIMAPPathPrefix;
    v49 = MCLocalizedString(@"EMAIL_ACCOUNT_IMAP_PATH_PREFIX");
    uint64_t v50 = [(MCKeyValue *)v47 initWithLocalizedString:incomingMailServerIMAPPathPrefix localizedKey:v49];

    [v4 addObject:v50];
  }
  if ([v4 count])
  {
    v51 = [MCKeyValueSection alloc];
    uint64_t v52 = MCLocalizedString(@"EMAIL_ACCOUNT_INCOMING_MAIL_SERVER");
    v53 = [(MCKeyValueSection *)v51 initWithSectionTitle:v52 footer:0 keyValues:v4];

    [v3 addObject:v53];
    uint64_t v54 = objc_opt_new();

    uint64_t v4 = (void *)v54;
  }
  if (self->_outgoingMailServerHostname)
  {
    v55 = [MCKeyValue alloc];
    outgoingMailServerHostname = self->_outgoingMailServerHostname;
    v57 = MCLocalizedString(@"EMAIL_ACCOUNT_HOSTNAME");
    uint64_t v58 = [(MCKeyValue *)v55 initWithLocalizedString:outgoingMailServerHostname localizedKey:v57];

    [v4 addObject:v58];
  }
  if (self->_outgoingMailServerUsername)
  {
    v59 = [MCKeyValue alloc];
    outgoingMailServerUsername = self->_outgoingMailServerUsername;
    v61 = MCLocalizedString(@"EMAIL_ACCOUNT_USERNAME");
    uint64_t v62 = [(MCKeyValue *)v59 initWithLocalizedString:outgoingMailServerUsername localizedKey:v61];

    [v4 addObject:v62];
  }
  if (self->_outgoingMailServerAuthentication)
  {
    v63 = [MCKeyValue alloc];
    uint64_t v64 = [(MCEmailAccountPayload *)self _authenticationTypeLocalizedString:self->_outgoingMailServerAuthentication];
    v65 = MCLocalizedString(@"EMAIL_ACCOUNT_AUTHENTICATION");
    uint64_t v66 = [(MCKeyValue *)v63 initWithLocalizedString:v64 localizedKey:v65];

    [v4 addObject:v66];
  }
  if (self->_outgoingPassword)
  {
    v67 = [MCKeyValue alloc];
    uint64_t v68 = MCLocalizedString(@"PASSWORD_SET");
    v69 = MCLocalizedString(@"EMAIL_ACCOUNT_PASSWORD");
    v70 = [(MCKeyValue *)v67 initWithLocalizedString:v68 localizedKey:v69];

    [v4 addObject:v70];
  }
  if (self->_outgoingPasswordSameAsIncomingPasswordNum)
  {
    v71 = [MCKeyValue alloc];
    v72 = MCLocalizedStringForBool([(NSNumber *)self->_outgoingPasswordSameAsIncomingPasswordNum BOOLValue]);
    v73 = MCLocalizedString(@"EMAIL_ACCOUNT_OUTGOING_PASSWORD_SAME_AS_INCOMING");
    v74 = [(MCKeyValue *)v71 initWithLocalizedString:v72 localizedKey:v73];

    [v4 addObject:v74];
  }
  if (self->_outgoingMailServerUseSSLNum)
  {
    id v75 = [MCKeyValue alloc];
    v76 = MCLocalizedStringForBool([(NSNumber *)self->_outgoingMailServerUseSSLNum BOOLValue]);
    v77 = MCLocalizedString(@"EMAIL_ACCOUNT_SSL");
    v78 = [(MCKeyValue *)v75 initWithLocalizedString:v76 localizedKey:v77];

    [v4 addObject:v78];
  }
  if (self->_outgoingMailServerPortNumber)
  {
    v79 = [NSString stringWithFormat:@"%@", self->_outgoingMailServerPortNumber];
    v80 = [MCKeyValue alloc];
    id v81 = MCLocalizedString(@"EMAIL_ACCOUNT_PORT");
    id v82 = [(MCKeyValue *)v80 initWithLocalizedString:v79 localizedKey:v81];

    [v4 addObject:v82];
  }
  if ([v4 count])
  {
    id v83 = [MCKeyValueSection alloc];
    id v84 = MCLocalizedString(@"EMAIL_ACCOUNT_OUTGOING_MAIL_SERVER");
    id v85 = [(MCKeyValueSection *)v83 initWithSectionTitle:v84 footer:0 keyValues:v4];

    [v3 addObject:v85];
  }
  v88.receiver = self;
  v88.super_class = (Class)MCEmailAccountPayload;
  id v86 = [(MCEmailAccountPayloadBase *)&v88 payloadDescriptionKeyValueSections];
  if ([v86 count]) {
    [v3 addObjectsFromArray:v86];
  }
  if (![v3 count])
  {

    id v3 = 0;
  }

  return v3;
}

+ (id)profileNameFromAccountTag:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 rangeOfString:@"|" options:4];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = &stru_1EF4AAAF8;
  }
  else
  {
    objc_msgSend(v3, "substringWithRange:", v4 + 1, objc_msgSend(v3, "length") + ~v4);
    uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (BOOL)containsSensitiveUserInformation
{
  v7.receiver = self;
  v7.super_class = (Class)MCEmailAccountPayload;
  if ([(MCEmailAccountPayloadBase *)&v7 containsSensitiveUserInformation]) {
    return 1;
  }
  uint64_t v4 = [(MCEmailAccountPayload *)self incomingPassword];
  if (v4)
  {
    BOOL v3 = 1;
  }
  else
  {
    uint64_t v5 = [(MCEmailAccountPayload *)self outgoingPassword];
    BOOL v3 = v5 != 0;
  }
  return v3;
}

- (NSString)emailAccountDescription
{
  return self->_emailAccountDescription;
}

- (NSString)emailAccountName
{
  return self->_emailAccountName;
}

- (NSString)emailAccountType
{
  return self->_emailAccountType;
}

- (NSString)emailAddress
{
  return self->_emailAddress;
}

- (NSString)incomingMailServerAuthentication
{
  return self->_incomingMailServerAuthentication;
}

- (NSString)incomingMailServerHostname
{
  return self->_incomingMailServerHostname;
}

- (NSNumber)incomingMailServerPortNumber
{
  return self->_incomingMailServerPortNumber;
}

- (BOOL)incomingMailServerUseSSL
{
  return self->_incomingMailServerUseSSL;
}

- (NSString)incomingMailServerUsername
{
  return self->_incomingMailServerUsername;
}

- (NSString)incomingMailServerIMAPPathPrefix
{
  return self->_incomingMailServerIMAPPathPrefix;
}

- (NSString)incomingPassword
{
  return self->_incomingPassword;
}

- (NSString)incomingACAccountIdentifier
{
  return self->_incomingACAccountIdentifier;
}

- (void)setIncomingACAccountIdentifier:(id)a3
{
}

- (NSString)outgoingPassword
{
  return self->_outgoingPassword;
}

- (BOOL)outgoingPasswordSameAsIncomingPassword
{
  return self->_outgoingPasswordSameAsIncomingPassword;
}

- (NSString)outgoingMailServerAuthentication
{
  return self->_outgoingMailServerAuthentication;
}

- (NSString)outgoingMailServerHostname
{
  return self->_outgoingMailServerHostname;
}

- (NSNumber)outgoingMailServerPortNumber
{
  return self->_outgoingMailServerPortNumber;
}

- (BOOL)outgoingMailServerUseSSL
{
  return self->_outgoingMailServerUseSSL;
}

- (NSString)outgoingMailServerUsername
{
  return self->_outgoingMailServerUsername;
}

- (NSString)outgoingACAccountIdentifier
{
  return self->_outgoingACAccountIdentifier;
}

- (void)setOutgoingACAccountIdentifier:(id)a3
{
}

- (NSNumber)incomingMailServerUseSSLNum
{
  return self->_incomingMailServerUseSSLNum;
}

- (NSNumber)outgoingPasswordSameAsIncomingPasswordNum
{
  return self->_outgoingPasswordSameAsIncomingPasswordNum;
}

- (NSNumber)outgoingMailServerUseSSLNum
{
  return self->_outgoingMailServerUseSSLNum;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outgoingMailServerUseSSLNum, 0);
  objc_storeStrong((id *)&self->_outgoingPasswordSameAsIncomingPasswordNum, 0);
  objc_storeStrong((id *)&self->_incomingMailServerUseSSLNum, 0);
  objc_storeStrong((id *)&self->_outgoingACAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_incomingACAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_outgoingMailServerUsername, 0);
  objc_storeStrong((id *)&self->_outgoingMailServerPortNumber, 0);
  objc_storeStrong((id *)&self->_outgoingMailServerHostname, 0);
  objc_storeStrong((id *)&self->_outgoingMailServerAuthentication, 0);
  objc_storeStrong((id *)&self->_outgoingPassword, 0);
  objc_storeStrong((id *)&self->_incomingPassword, 0);
  objc_storeStrong((id *)&self->_incomingMailServerIMAPPathPrefix, 0);
  objc_storeStrong((id *)&self->_incomingMailServerUsername, 0);
  objc_storeStrong((id *)&self->_incomingMailServerPortNumber, 0);
  objc_storeStrong((id *)&self->_incomingMailServerHostname, 0);
  objc_storeStrong((id *)&self->_incomingMailServerAuthentication, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
  objc_storeStrong((id *)&self->_emailAccountType, 0);
  objc_storeStrong((id *)&self->_emailAccountName, 0);
  objc_storeStrong((id *)&self->_emailAccountDescription, 0);
}

- (id)mailAccountIdentifiers
{
  BOOL v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  uint64_t v4 = v3;
  if (self->_incomingACAccountIdentifier) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_outgoingACAccountIdentifier) {
    objc_msgSend(v4, "addObject:");
  }
  if ([v4 count]) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  return v6;
}

@end