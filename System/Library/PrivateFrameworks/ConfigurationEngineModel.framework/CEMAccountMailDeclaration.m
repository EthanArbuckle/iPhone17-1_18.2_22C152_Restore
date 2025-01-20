@interface CEMAccountMailDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withEmailAccountType:(id)a4 withIncomingMailServerAuthentication:(id)a5 withIncomingMailServerHostName:(id)a6 withOutgoingMailServerAuthentication:(id)a7;
+ (id)buildWithIdentifier:(id)a3 withEmailAccountDescription:(id)a4 withEmailAccountName:(id)a5 withEmailAccountType:(id)a6 withEmailAddress:(id)a7 withIncomingMailServerAuthentication:(id)a8 withIncomingMailServerHostName:(id)a9 withIncomingMailServerPortNumber:(id)a10 withIncomingMailServerUseSSL:(id)a11 withOutgoingPasswordSameAsIncomingPassword:(id)a12 withOutgoingMailServerAuthentication:(id)a13 withOutgoingMailServerPortNumber:(id)a14 withOutgoingMailServerUseSSL:(id)a15 withOutgoingMailServerUsername:(id)a16 withPreventMove:(id)a17 withPreventAppSheet:(id)a18 withSMIMEEnabled:(id)a19 withSMIMESigningEnabled:(id)a20 withSMIMESigningCertificateUUID:(id)a21 withSMIMEEncryptionEnabled:(id)a22 withSMIMEEncryptionCertificateUUID:(id)a23 withSMIMEEnablePerMessageSwitch:(id)a24 withDisableMailRecentsSyncing:(id)a25 withAllowMailDrop:(id)a26 withIncomingMailServerIMAPPathPrefix:(id)a27 withIncomingCredentials:(id)a28 withOutgoingCredentials:(id)a29 withSMIMESigningOverrideable:(id)a30 withSMIMESigningCertificateUUIDOverrideable:(id)a31 withSMIMEEncryptByDefault:(id)a32 withSMIMEEncryptByDefaultOverrideable:(id)a33 withSMIMEEncryptionCertificateUUIDOverrideable:(id)a34 withSMIMEEnableEncryptionPerMessageSwitch:(id)a35;
+ (id)profileType;
+ (id)restrictionPayloadKeys;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)multipleAllowed;
- (BOOL)mustBeSupervised;
- (NSNumber)payloadAllowMailDrop;
- (NSNumber)payloadDisableMailRecentsSyncing;
- (NSNumber)payloadIncomingMailServerPortNumber;
- (NSNumber)payloadIncomingMailServerUseSSL;
- (NSNumber)payloadOutgoingMailServerPortNumber;
- (NSNumber)payloadOutgoingMailServerUseSSL;
- (NSNumber)payloadOutgoingPasswordSameAsIncomingPassword;
- (NSNumber)payloadPreventAppSheet;
- (NSNumber)payloadPreventMove;
- (NSNumber)payloadSMIMEEnableEncryptionPerMessageSwitch;
- (NSNumber)payloadSMIMEEnablePerMessageSwitch;
- (NSNumber)payloadSMIMEEnabled;
- (NSNumber)payloadSMIMEEncryptByDefault;
- (NSNumber)payloadSMIMEEncryptByDefaultOverrideable;
- (NSNumber)payloadSMIMEEncryptionCertificateUUIDOverrideable;
- (NSNumber)payloadSMIMEEncryptionEnabled;
- (NSNumber)payloadSMIMESigningCertificateUUIDOverrideable;
- (NSNumber)payloadSMIMESigningEnabled;
- (NSNumber)payloadSMIMESigningOverrideable;
- (NSString)payloadEmailAccountDescription;
- (NSString)payloadEmailAccountName;
- (NSString)payloadEmailAccountType;
- (NSString)payloadEmailAddress;
- (NSString)payloadIncomingCredentials;
- (NSString)payloadIncomingMailServerAuthentication;
- (NSString)payloadIncomingMailServerHostName;
- (NSString)payloadIncomingMailServerIMAPPathPrefix;
- (NSString)payloadOutgoingCredentials;
- (NSString)payloadOutgoingMailServerAuthentication;
- (NSString)payloadOutgoingMailServerUsername;
- (NSString)payloadSMIMEEncryptionCertificateUUID;
- (NSString)payloadSMIMESigningCertificateUUID;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)activationLevel;
- (void)setPayloadAllowMailDrop:(id)a3;
- (void)setPayloadDisableMailRecentsSyncing:(id)a3;
- (void)setPayloadEmailAccountDescription:(id)a3;
- (void)setPayloadEmailAccountName:(id)a3;
- (void)setPayloadEmailAccountType:(id)a3;
- (void)setPayloadEmailAddress:(id)a3;
- (void)setPayloadIncomingCredentials:(id)a3;
- (void)setPayloadIncomingMailServerAuthentication:(id)a3;
- (void)setPayloadIncomingMailServerHostName:(id)a3;
- (void)setPayloadIncomingMailServerIMAPPathPrefix:(id)a3;
- (void)setPayloadIncomingMailServerPortNumber:(id)a3;
- (void)setPayloadIncomingMailServerUseSSL:(id)a3;
- (void)setPayloadOutgoingCredentials:(id)a3;
- (void)setPayloadOutgoingMailServerAuthentication:(id)a3;
- (void)setPayloadOutgoingMailServerPortNumber:(id)a3;
- (void)setPayloadOutgoingMailServerUseSSL:(id)a3;
- (void)setPayloadOutgoingMailServerUsername:(id)a3;
- (void)setPayloadOutgoingPasswordSameAsIncomingPassword:(id)a3;
- (void)setPayloadPreventAppSheet:(id)a3;
- (void)setPayloadPreventMove:(id)a3;
- (void)setPayloadSMIMEEnableEncryptionPerMessageSwitch:(id)a3;
- (void)setPayloadSMIMEEnablePerMessageSwitch:(id)a3;
- (void)setPayloadSMIMEEnabled:(id)a3;
- (void)setPayloadSMIMEEncryptByDefault:(id)a3;
- (void)setPayloadSMIMEEncryptByDefaultOverrideable:(id)a3;
- (void)setPayloadSMIMEEncryptionCertificateUUID:(id)a3;
- (void)setPayloadSMIMEEncryptionCertificateUUIDOverrideable:(id)a3;
- (void)setPayloadSMIMEEncryptionEnabled:(id)a3;
- (void)setPayloadSMIMESigningCertificateUUID:(id)a3;
- (void)setPayloadSMIMESigningCertificateUUIDOverrideable:(id)a3;
- (void)setPayloadSMIMESigningEnabled:(id)a3;
- (void)setPayloadSMIMESigningOverrideable:(id)a3;
@end

@implementation CEMAccountMailDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.account.mail";
}

+ (id)profileType
{
  return @"com.apple.mail.managed";
}

+ (NSSet)allowedPayloadKeys
{
  v6[32] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"EmailAccountDescription";
  v6[1] = @"EmailAccountName";
  v6[2] = @"EmailAccountType";
  v6[3] = @"EmailAddress";
  v6[4] = @"IncomingMailServerAuthentication";
  v6[5] = @"IncomingMailServerHostName";
  v6[6] = @"IncomingMailServerPortNumber";
  v6[7] = @"IncomingMailServerUseSSL";
  v6[8] = @"OutgoingPasswordSameAsIncomingPassword";
  v6[9] = @"OutgoingMailServerAuthentication";
  v6[10] = @"OutgoingMailServerPortNumber";
  v6[11] = @"OutgoingMailServerUseSSL";
  v6[12] = @"OutgoingMailServerUsername";
  v6[13] = @"PreventMove";
  v6[14] = @"PreventAppSheet";
  v6[15] = @"SMIMEEnabled";
  v6[16] = @"SMIMESigningEnabled";
  v6[17] = @"SMIMESigningCertificateUUID";
  v6[18] = @"SMIMEEncryptionEnabled";
  v6[19] = @"SMIMEEncryptionCertificateUUID";
  v6[20] = @"SMIMEEnablePerMessageSwitch";
  v6[21] = @"disableMailRecentsSyncing";
  v6[22] = @"allowMailDrop";
  v6[23] = @"IncomingMailServerIMAPPathPrefix";
  v6[24] = @"IncomingCredentials";
  v6[25] = @"OutgoingCredentials";
  v6[26] = @"SMIMESigningOverrideable";
  v6[27] = @"SMIMESigningCertificateUUIDOverrideable";
  v6[28] = @"SMIMEEncryptByDefault";
  v6[29] = @"SMIMEEncryptByDefaultOverrideable";
  v6[30] = @"SMIMEEncryptionCertificateUUIDOverrideable";
  v6[31] = @"SMIMEEnableEncryptionPerMessageSwitch";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:32];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)restrictionPayloadKeys
{
  return (id)[MEMORY[0x263EFFA08] setWithArray:MEMORY[0x263EFFA68]];
}

- (BOOL)multipleAllowed
{
  return 1;
}

- (BOOL)mustBeSupervised
{
  return 0;
}

- (int)activationLevel
{
  return 2;
}

- (id)assetReferences
{
  v3 = [MEMORY[0x263EFF980] arrayWithCapacity:2];
  v4 = [(CEMAccountMailDeclaration *)self payloadIncomingCredentials];
  if (v4)
  {
    v5 = +[CEMAssetReference referenceForIdentifier:v4 assetschematype:@"credential"];
    [v3 addObject:v5];
  }
  v6 = [(CEMAccountMailDeclaration *)self payloadOutgoingCredentials];

  if (v6)
  {
    v7 = +[CEMAssetReference referenceForIdentifier:v6 assetschematype:@"credential"];
    [v3 addObject:v7];
  }
  v8 = (void *)[v3 copy];

  return v8;
}

+ (id)buildWithIdentifier:(id)a3 withEmailAccountDescription:(id)a4 withEmailAccountName:(id)a5 withEmailAccountType:(id)a6 withEmailAddress:(id)a7 withIncomingMailServerAuthentication:(id)a8 withIncomingMailServerHostName:(id)a9 withIncomingMailServerPortNumber:(id)a10 withIncomingMailServerUseSSL:(id)a11 withOutgoingPasswordSameAsIncomingPassword:(id)a12 withOutgoingMailServerAuthentication:(id)a13 withOutgoingMailServerPortNumber:(id)a14 withOutgoingMailServerUseSSL:(id)a15 withOutgoingMailServerUsername:(id)a16 withPreventMove:(id)a17 withPreventAppSheet:(id)a18 withSMIMEEnabled:(id)a19 withSMIMESigningEnabled:(id)a20 withSMIMESigningCertificateUUID:(id)a21 withSMIMEEncryptionEnabled:(id)a22 withSMIMEEncryptionCertificateUUID:(id)a23 withSMIMEEnablePerMessageSwitch:(id)a24 withDisableMailRecentsSyncing:(id)a25 withAllowMailDrop:(id)a26 withIncomingMailServerIMAPPathPrefix:(id)a27 withIncomingCredentials:(id)a28 withOutgoingCredentials:(id)a29 withSMIMESigningOverrideable:(id)a30 withSMIMESigningCertificateUUIDOverrideable:(id)a31 withSMIMEEncryptByDefault:(id)a32 withSMIMEEncryptByDefaultOverrideable:(id)a33 withSMIMEEncryptionCertificateUUIDOverrideable:(id)a34 withSMIMEEnableEncryptionPerMessageSwitch:(id)a35
{
  id v35 = a3;
  id v97 = a35;
  id v96 = a34;
  id v95 = a33;
  id v36 = a32;
  id v37 = a31;
  id v38 = a30;
  id v94 = a29;
  id v93 = a28;
  id v92 = a27;
  id v91 = a26;
  id v90 = a25;
  id v89 = a24;
  id v88 = a23;
  id v87 = a22;
  id v86 = a21;
  id v85 = a20;
  id v84 = a19;
  id v83 = a18;
  id v82 = a17;
  id v81 = a16;
  id v80 = a15;
  id v76 = a14;
  id v71 = a13;
  id v69 = a12;
  id v68 = a11;
  id v39 = a10;
  id v70 = a9;
  id v73 = a8;
  id v40 = a7;
  id v41 = a6;
  id v42 = a5;
  id v43 = a4;
  v44 = objc_opt_new();
  [v44 setDeclarationType:@"com.apple.configuration.account.mail"];
  if (v35)
  {
    [v44 setDeclarationIdentifier:v35];
  }
  else
  {
    [MEMORY[0x263F08C38] UUID];
    v45 = id v79 = v37;
    v46 = [v45 UUIDString];
    [v44 setDeclarationIdentifier:v46];

    id v35 = 0;
    id v37 = v79;
  }
  [v44 setPayloadEmailAccountDescription:v43];

  [v44 setPayloadEmailAccountName:v42];
  [v44 setPayloadEmailAccountType:v41];

  [v44 setPayloadEmailAddress:v40];
  [v44 setPayloadIncomingMailServerAuthentication:v73];

  [v44 setPayloadIncomingMailServerHostName:v70];
  if (v39) {
    v47 = v39;
  }
  else {
    v47 = &unk_26C894748;
  }
  [v44 setPayloadIncomingMailServerPortNumber:v47];

  v48 = (void *)MEMORY[0x263EFFA80];
  if (v68) {
    id v49 = v68;
  }
  else {
    id v49 = (id)MEMORY[0x263EFFA80];
  }
  [v44 setPayloadIncomingMailServerUseSSL:v49];

  if (v69) {
    id v50 = v69;
  }
  else {
    id v50 = v48;
  }
  [v44 setPayloadOutgoingPasswordSameAsIncomingPassword:v50];

  [v44 setPayloadOutgoingMailServerAuthentication:v71];
  if (v76) {
    v51 = v76;
  }
  else {
    v51 = &unk_26C894760;
  }
  [v44 setPayloadOutgoingMailServerPortNumber:v51];

  if (v80) {
    id v52 = v80;
  }
  else {
    id v52 = v48;
  }
  [v44 setPayloadOutgoingMailServerUseSSL:v52];

  [v44 setPayloadOutgoingMailServerUsername:v81];
  if (v82) {
    id v53 = v82;
  }
  else {
    id v53 = v48;
  }
  [v44 setPayloadPreventMove:v53];

  if (v83) {
    id v54 = v83;
  }
  else {
    id v54 = v48;
  }
  [v44 setPayloadPreventAppSheet:v54];

  if (v84) {
    id v55 = v84;
  }
  else {
    id v55 = v48;
  }
  [v44 setPayloadSMIMEEnabled:v55];

  if (v85) {
    id v56 = v85;
  }
  else {
    id v56 = v48;
  }
  [v44 setPayloadSMIMESigningEnabled:v56];

  [v44 setPayloadSMIMESigningCertificateUUID:v86];
  if (v87) {
    id v57 = v87;
  }
  else {
    id v57 = v48;
  }
  [v44 setPayloadSMIMEEncryptionEnabled:v57];

  [v44 setPayloadSMIMEEncryptionCertificateUUID:v88];
  if (v89) {
    id v58 = v89;
  }
  else {
    id v58 = v48;
  }
  [v44 setPayloadSMIMEEnablePerMessageSwitch:v58];

  if (v90) {
    id v59 = v90;
  }
  else {
    id v59 = v48;
  }
  [v44 setPayloadDisableMailRecentsSyncing:v59];

  if (v91) {
    id v60 = v91;
  }
  else {
    id v60 = v48;
  }
  [v44 setPayloadAllowMailDrop:v60];

  [v44 setPayloadIncomingMailServerIMAPPathPrefix:v92];
  [v44 setPayloadIncomingCredentials:v93];

  [v44 setPayloadOutgoingCredentials:v94];
  if (v38) {
    id v61 = v38;
  }
  else {
    id v61 = v48;
  }
  [v44 setPayloadSMIMESigningOverrideable:v61];

  if (v37) {
    id v62 = v37;
  }
  else {
    id v62 = v48;
  }
  [v44 setPayloadSMIMESigningCertificateUUIDOverrideable:v62];

  if (v36) {
    id v63 = v36;
  }
  else {
    id v63 = v48;
  }
  [v44 setPayloadSMIMEEncryptByDefault:v63];

  if (v95) {
    id v64 = v95;
  }
  else {
    id v64 = v48;
  }
  [v44 setPayloadSMIMEEncryptByDefaultOverrideable:v64];

  if (v96) {
    id v65 = v96;
  }
  else {
    id v65 = v48;
  }
  [v44 setPayloadSMIMEEncryptionCertificateUUIDOverrideable:v65];

  if (v97) {
    id v66 = v97;
  }
  else {
    id v66 = v48;
  }
  [v44 setPayloadSMIMEEnableEncryptionPerMessageSwitch:v66];

  [v44 updateServerHash];

  return v44;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withEmailAccountType:(id)a4 withIncomingMailServerAuthentication:(id)a5 withIncomingMailServerHostName:(id)a6 withOutgoingMailServerAuthentication:(id)a7
{
  id v11 = a3;
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  v16 = objc_opt_new();
  [v16 setDeclarationType:@"com.apple.configuration.account.mail"];
  if (v11)
  {
    [v16 setDeclarationIdentifier:v11];
  }
  else
  {
    v17 = [MEMORY[0x263F08C38] UUID];
    v18 = [v17 UUIDString];
    [v16 setDeclarationIdentifier:v18];
  }
  [v16 setPayloadEmailAccountType:v15];

  [v16 setPayloadIncomingMailServerAuthentication:v14];
  [v16 setPayloadIncomingMailServerHostName:v13];

  [v16 setPayloadOutgoingMailServerAuthentication:v12];
  [v16 updateServerHash];

  return v16;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMAccountMailDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  id v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v110 = 0;
  id v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"EmailAccountDescription" isRequired:0 defaultValue:0 error:&v110];
  id v14 = v110;
  payloadEmailAccountDescription = self->_payloadEmailAccountDescription;
  self->_payloadEmailAccountDescription = v13;

  if (!v14)
  {
    id v109 = 0;
    v16 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"EmailAccountName" isRequired:0 defaultValue:0 error:&v109];
    id v14 = v109;
    payloadEmailAccountName = self->_payloadEmailAccountName;
    self->_payloadEmailAccountName = v16;

    if (!v14)
    {
      id v108 = 0;
      v18 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"EmailAccountType" isRequired:1 defaultValue:0 error:&v108];
      id v14 = v108;
      payloadEmailAccountType = self->_payloadEmailAccountType;
      self->_payloadEmailAccountType = v18;

      if (!v14)
      {
        id v107 = 0;
        v20 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"EmailAddress" isRequired:0 defaultValue:0 error:&v107];
        id v14 = v107;
        payloadEmailAddress = self->_payloadEmailAddress;
        self->_payloadEmailAddress = v20;

        if (!v14)
        {
          id v106 = 0;
          v22 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"IncomingMailServerAuthentication" isRequired:1 defaultValue:0 error:&v106];
          id v14 = v106;
          payloadIncomingMailServerAuthentication = self->_payloadIncomingMailServerAuthentication;
          self->_payloadIncomingMailServerAuthentication = v22;

          if (!v14)
          {
            id v105 = 0;
            v24 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"IncomingMailServerHostName" isRequired:1 defaultValue:0 error:&v105];
            id v14 = v105;
            payloadIncomingMailServerHostName = self->_payloadIncomingMailServerHostName;
            self->_payloadIncomingMailServerHostName = v24;

            if (!v14)
            {
              id v104 = 0;
              v26 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"IncomingMailServerPortNumber" isRequired:0 defaultValue:&unk_26C894748 error:&v104];
              id v14 = v104;
              payloadIncomingMailServerPortNumber = self->_payloadIncomingMailServerPortNumber;
              self->_payloadIncomingMailServerPortNumber = v26;

              if (!v14)
              {
                id v103 = 0;
                v28 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"IncomingMailServerUseSSL" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v103];
                id v14 = v103;
                payloadIncomingMailServerUseSSL = self->_payloadIncomingMailServerUseSSL;
                self->_payloadIncomingMailServerUseSSL = v28;

                if (!v14)
                {
                  id v102 = 0;
                  v30 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"OutgoingPasswordSameAsIncomingPassword" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v102];
                  id v14 = v102;
                  payloadOutgoingPasswordSameAsIncomingPassword = self->_payloadOutgoingPasswordSameAsIncomingPassword;
                  self->_payloadOutgoingPasswordSameAsIncomingPassword = v30;

                  if (!v14)
                  {
                    id v101 = 0;
                    v32 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"OutgoingMailServerAuthentication" isRequired:1 defaultValue:0 error:&v101];
                    id v14 = v101;
                    payloadOutgoingMailServerAuthentication = self->_payloadOutgoingMailServerAuthentication;
                    self->_payloadOutgoingMailServerAuthentication = v32;

                    if (!v14)
                    {
                      id v100 = 0;
                      v34 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"OutgoingMailServerPortNumber" isRequired:0 defaultValue:&unk_26C894760 error:&v100];
                      id v14 = v100;
                      payloadOutgoingMailServerPortNumber = self->_payloadOutgoingMailServerPortNumber;
                      self->_payloadOutgoingMailServerPortNumber = v34;

                      if (!v14)
                      {
                        id v99 = 0;
                        id v36 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"OutgoingMailServerUseSSL" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v99];
                        id v14 = v99;
                        payloadOutgoingMailServerUseSSL = self->_payloadOutgoingMailServerUseSSL;
                        self->_payloadOutgoingMailServerUseSSL = v36;

                        if (!v14)
                        {
                          id v98 = 0;
                          id v38 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"OutgoingMailServerUsername" isRequired:0 defaultValue:0 error:&v98];
                          id v14 = v98;
                          payloadOutgoingMailServerUsername = self->_payloadOutgoingMailServerUsername;
                          self->_payloadOutgoingMailServerUsername = v38;

                          if (!v14)
                          {
                            id v97 = 0;
                            id v40 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"PreventMove" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v97];
                            id v14 = v97;
                            payloadPreventMove = self->_payloadPreventMove;
                            self->_payloadPreventMove = v40;

                            if (!v14)
                            {
                              id v96 = 0;
                              id v42 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"PreventAppSheet" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v96];
                              id v14 = v96;
                              payloadPreventAppSheet = self->_payloadPreventAppSheet;
                              self->_payloadPreventAppSheet = v42;

                              if (!v14)
                              {
                                id v95 = 0;
                                v44 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"SMIMEEnabled" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v95];
                                id v14 = v95;
                                payloadSMIMEEnabled = self->_payloadSMIMEEnabled;
                                self->_payloadSMIMEEnabled = v44;

                                if (!v14)
                                {
                                  id v94 = 0;
                                  v46 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"SMIMESigningEnabled" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v94];
                                  id v14 = v94;
                                  payloadSMIMESigningEnabled = self->_payloadSMIMESigningEnabled;
                                  self->_payloadSMIMESigningEnabled = v46;

                                  if (!v14)
                                  {
                                    id v93 = 0;
                                    v48 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"SMIMESigningCertificateUUID" isRequired:0 defaultValue:0 error:&v93];
                                    id v14 = v93;
                                    payloadSMIMESigningCertificateUUID = self->_payloadSMIMESigningCertificateUUID;
                                    self->_payloadSMIMESigningCertificateUUID = v48;

                                    if (!v14)
                                    {
                                      id v92 = 0;
                                      id v50 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"SMIMEEncryptionEnabled" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v92];
                                      id v14 = v92;
                                      payloadSMIMEEncryptionEnabled = self->_payloadSMIMEEncryptionEnabled;
                                      self->_payloadSMIMEEncryptionEnabled = v50;

                                      if (!v14)
                                      {
                                        id v91 = 0;
                                        id v52 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"SMIMEEncryptionCertificateUUID" isRequired:0 defaultValue:0 error:&v91];
                                        id v14 = v91;
                                        payloadSMIMEEncryptionCertificateUUID = self->_payloadSMIMEEncryptionCertificateUUID;
                                        self->_payloadSMIMEEncryptionCertificateUUID = v52;

                                        if (!v14)
                                        {
                                          id v90 = 0;
                                          id v54 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"SMIMEEnablePerMessageSwitch" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v90];
                                          id v14 = v90;
                                          payloadSMIMEEnablePerMessageSwitch = self->_payloadSMIMEEnablePerMessageSwitch;
                                          self->_payloadSMIMEEnablePerMessageSwitch = v54;

                                          if (!v14)
                                          {
                                            id v89 = 0;
                                            id v56 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"disableMailRecentsSyncing" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v89];
                                            id v14 = v89;
                                            payloadDisableMailRecentsSyncing = self->_payloadDisableMailRecentsSyncing;
                                            self->_payloadDisableMailRecentsSyncing = v56;

                                            if (!v14)
                                            {
                                              id v88 = 0;
                                              id v58 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowMailDrop" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v88];
                                              id v14 = v88;
                                              payloadAllowMailDrop = self->_payloadAllowMailDrop;
                                              self->_payloadAllowMailDrop = v58;

                                              if (!v14)
                                              {
                                                id v87 = 0;
                                                id v60 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"IncomingMailServerIMAPPathPrefix" isRequired:0 defaultValue:0 error:&v87];
                                                id v14 = v87;
                                                payloadIncomingMailServerIMAPPathPrefix = self->_payloadIncomingMailServerIMAPPathPrefix;
                                                self->_payloadIncomingMailServerIMAPPathPrefix = v60;

                                                if (!v14)
                                                {
                                                  id v86 = 0;
                                                  id v62 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"IncomingCredentials" isRequired:0 defaultValue:0 error:&v86];
                                                  id v14 = v86;
                                                  payloadIncomingCredentials = self->_payloadIncomingCredentials;
                                                  self->_payloadIncomingCredentials = v62;

                                                  if (!v14)
                                                  {
                                                    id v85 = 0;
                                                    id v64 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"OutgoingCredentials" isRequired:0 defaultValue:0 error:&v85];
                                                    id v14 = v85;
                                                    payloadOutgoingCredentials = self->_payloadOutgoingCredentials;
                                                    self->_payloadOutgoingCredentials = v64;

                                                    if (!v14)
                                                    {
                                                      id v84 = 0;
                                                      id v66 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"SMIMESigningOverrideable" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v84];
                                                      id v14 = v84;
                                                      payloadSMIMESigningOverrideable = self->_payloadSMIMESigningOverrideable;
                                                      self->_payloadSMIMESigningOverrideable = v66;

                                                      if (!v14)
                                                      {
                                                        id v83 = 0;
                                                        id v68 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"SMIMESigningCertificateUUIDOverrideable" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v83];
                                                        id v14 = v83;
                                                        payloadSMIMESigningCertificateUUIDOverrideable = self->_payloadSMIMESigningCertificateUUIDOverrideable;
                                                        self->_payloadSMIMESigningCertificateUUIDOverrideable = v68;

                                                        if (!v14)
                                                        {
                                                          id v82 = 0;
                                                          id v70 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"SMIMEEncryptByDefault" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v82];
                                                          id v14 = v82;
                                                          payloadSMIMEEncryptByDefault = self->_payloadSMIMEEncryptByDefault;
                                                          self->_payloadSMIMEEncryptByDefault = v70;

                                                          if (!v14)
                                                          {
                                                            id v81 = 0;
                                                            v72 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"SMIMEEncryptByDefaultOverrideable" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v81];
                                                            id v14 = v81;
                                                            payloadSMIMEEncryptByDefaultOverrideable = self->_payloadSMIMEEncryptByDefaultOverrideable;
                                                            self->_payloadSMIMEEncryptByDefaultOverrideable = v72;

                                                            if (!v14)
                                                            {
                                                              id v80 = 0;
                                                              v74 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"SMIMEEncryptionCertificateUUIDOverrideable" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v80];
                                                              id v14 = v80;
                                                              payloadSMIMEEncryptionCertificateUUIDOverrideable = self->_payloadSMIMEEncryptionCertificateUUIDOverrideable;
                                                              self->_payloadSMIMEEncryptionCertificateUUIDOverrideable = v74;

                                                              if (!v14)
                                                              {
                                                                id v79 = 0;
                                                                id v76 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"SMIMEEnableEncryptionPerMessageSwitch" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v79];
                                                                id v14 = v79;
                                                                payloadSMIMEEnableEncryptionPerMessageSwitch = self->_payloadSMIMEEnableEncryptionPerMessageSwitch;
                                                                self->_payloadSMIMEEnableEncryptionPerMessageSwitch = v76;
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  if (a4 && v14) {
    *a4 = v14;
  }

  return v14 == 0;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263EFF9A0] dictionary];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"EmailAccountDescription" withValue:self->_payloadEmailAccountDescription isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"EmailAccountName" withValue:self->_payloadEmailAccountName isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"EmailAccountType" withValue:self->_payloadEmailAccountType isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"EmailAddress" withValue:self->_payloadEmailAddress isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"IncomingMailServerAuthentication" withValue:self->_payloadIncomingMailServerAuthentication isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"IncomingMailServerHostName" withValue:self->_payloadIncomingMailServerHostName isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v5 withKey:@"IncomingMailServerPortNumber" withValue:self->_payloadIncomingMailServerPortNumber isRequired:0 defaultValue:&unk_26C894748];
  uint64_t v6 = MEMORY[0x263EFFA80];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"IncomingMailServerUseSSL" withValue:self->_payloadIncomingMailServerUseSSL isRequired:0 defaultValue:MEMORY[0x263EFFA80]];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"OutgoingPasswordSameAsIncomingPassword" withValue:self->_payloadOutgoingPasswordSameAsIncomingPassword isRequired:0 defaultValue:v6];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"OutgoingMailServerAuthentication" withValue:self->_payloadOutgoingMailServerAuthentication isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v5 withKey:@"OutgoingMailServerPortNumber" withValue:self->_payloadOutgoingMailServerPortNumber isRequired:0 defaultValue:&unk_26C894760];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"OutgoingMailServerUseSSL" withValue:self->_payloadOutgoingMailServerUseSSL isRequired:0 defaultValue:v6];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"OutgoingMailServerUsername" withValue:self->_payloadOutgoingMailServerUsername isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"PreventMove" withValue:self->_payloadPreventMove isRequired:0 defaultValue:v6];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"PreventAppSheet" withValue:self->_payloadPreventAppSheet isRequired:0 defaultValue:v6];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"SMIMEEnabled" withValue:self->_payloadSMIMEEnabled isRequired:0 defaultValue:v6];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"SMIMESigningEnabled" withValue:self->_payloadSMIMESigningEnabled isRequired:0 defaultValue:v6];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"SMIMESigningCertificateUUID" withValue:self->_payloadSMIMESigningCertificateUUID isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"SMIMEEncryptionEnabled" withValue:self->_payloadSMIMEEncryptionEnabled isRequired:0 defaultValue:v6];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"SMIMEEncryptionCertificateUUID" withValue:self->_payloadSMIMEEncryptionCertificateUUID isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"SMIMEEnablePerMessageSwitch" withValue:self->_payloadSMIMEEnablePerMessageSwitch isRequired:0 defaultValue:v6];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"disableMailRecentsSyncing" withValue:self->_payloadDisableMailRecentsSyncing isRequired:0 defaultValue:v6];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"allowMailDrop" withValue:self->_payloadAllowMailDrop isRequired:0 defaultValue:v6];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"IncomingMailServerIMAPPathPrefix" withValue:self->_payloadIncomingMailServerIMAPPathPrefix isRequired:0 defaultValue:0];
  payloadIncomingCredentials = self->_payloadIncomingCredentials;
  if (payloadIncomingCredentials)
  {
    v8 = [v4 objectForKeyedSubscript:self->_payloadIncomingCredentials];
    [(CEMPayloadBase *)self serializeAssetIntoDictionary:v5 withKey:@"IncomingCredentials" withValue:payloadIncomingCredentials assetProvider:v8 transformType:&stru_26C838878 isRequired:0 defaultValue:&stru_26C838878];
  }
  else
  {
    [(CEMPayloadBase *)self serializeAssetIntoDictionary:v5 withKey:@"IncomingCredentials" withValue:0 assetProvider:0 transformType:&stru_26C838878 isRequired:0 defaultValue:&stru_26C838878];
  }
  payloadOutgoingCredentials = self->_payloadOutgoingCredentials;
  if (payloadOutgoingCredentials)
  {
    v10 = [v4 objectForKeyedSubscript:self->_payloadOutgoingCredentials];
    [(CEMPayloadBase *)self serializeAssetIntoDictionary:v5 withKey:@"OutgoingCredentials" withValue:payloadOutgoingCredentials assetProvider:v10 transformType:&stru_26C838878 isRequired:0 defaultValue:&stru_26C838878];
  }
  else
  {
    [(CEMPayloadBase *)self serializeAssetIntoDictionary:v5 withKey:@"OutgoingCredentials" withValue:0 assetProvider:0 transformType:&stru_26C838878 isRequired:0 defaultValue:&stru_26C838878];
  }
  uint64_t v11 = MEMORY[0x263EFFA80];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"SMIMESigningOverrideable" withValue:self->_payloadSMIMESigningOverrideable isRequired:0 defaultValue:MEMORY[0x263EFFA80]];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"SMIMESigningCertificateUUIDOverrideable" withValue:self->_payloadSMIMESigningCertificateUUIDOverrideable isRequired:0 defaultValue:v11];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"SMIMEEncryptByDefault" withValue:self->_payloadSMIMEEncryptByDefault isRequired:0 defaultValue:v11];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"SMIMEEncryptByDefaultOverrideable" withValue:self->_payloadSMIMEEncryptByDefaultOverrideable isRequired:0 defaultValue:v11];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"SMIMEEncryptionCertificateUUIDOverrideable" withValue:self->_payloadSMIMEEncryptionCertificateUUIDOverrideable isRequired:0 defaultValue:v11];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"SMIMEEnableEncryptionPerMessageSwitch" withValue:self->_payloadSMIMEEnableEncryptionPerMessageSwitch isRequired:0 defaultValue:v11];
  id v12 = (void *)[v5 copy];

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v70.receiver = self;
  v70.super_class = (Class)CEMAccountMailDeclaration;
  id v4 = [(CEMDeclarationBase *)&v70 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadEmailAccountDescription copy];
  uint64_t v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(NSString *)self->_payloadEmailAccountName copy];
  v8 = (void *)v4[10];
  v4[10] = v7;

  uint64_t v9 = [(NSString *)self->_payloadEmailAccountType copy];
  v10 = (void *)v4[11];
  v4[11] = v9;

  uint64_t v11 = [(NSString *)self->_payloadEmailAddress copy];
  id v12 = (void *)v4[12];
  v4[12] = v11;

  uint64_t v13 = [(NSString *)self->_payloadIncomingMailServerAuthentication copy];
  id v14 = (void *)v4[13];
  v4[13] = v13;

  uint64_t v15 = [(NSString *)self->_payloadIncomingMailServerHostName copy];
  v16 = (void *)v4[14];
  v4[14] = v15;

  uint64_t v17 = [(NSNumber *)self->_payloadIncomingMailServerPortNumber copy];
  v18 = (void *)v4[15];
  v4[15] = v17;

  uint64_t v19 = [(NSNumber *)self->_payloadIncomingMailServerUseSSL copy];
  v20 = (void *)v4[16];
  v4[16] = v19;

  uint64_t v21 = [(NSNumber *)self->_payloadOutgoingPasswordSameAsIncomingPassword copy];
  v22 = (void *)v4[17];
  v4[17] = v21;

  uint64_t v23 = [(NSString *)self->_payloadOutgoingMailServerAuthentication copy];
  v24 = (void *)v4[18];
  v4[18] = v23;

  uint64_t v25 = [(NSNumber *)self->_payloadOutgoingMailServerPortNumber copy];
  v26 = (void *)v4[19];
  v4[19] = v25;

  uint64_t v27 = [(NSNumber *)self->_payloadOutgoingMailServerUseSSL copy];
  v28 = (void *)v4[20];
  v4[20] = v27;

  uint64_t v29 = [(NSString *)self->_payloadOutgoingMailServerUsername copy];
  v30 = (void *)v4[21];
  v4[21] = v29;

  uint64_t v31 = [(NSNumber *)self->_payloadPreventMove copy];
  v32 = (void *)v4[22];
  v4[22] = v31;

  uint64_t v33 = [(NSNumber *)self->_payloadPreventAppSheet copy];
  v34 = (void *)v4[23];
  v4[23] = v33;

  uint64_t v35 = [(NSNumber *)self->_payloadSMIMEEnabled copy];
  id v36 = (void *)v4[24];
  v4[24] = v35;

  uint64_t v37 = [(NSNumber *)self->_payloadSMIMESigningEnabled copy];
  id v38 = (void *)v4[25];
  v4[25] = v37;

  uint64_t v39 = [(NSString *)self->_payloadSMIMESigningCertificateUUID copy];
  id v40 = (void *)v4[26];
  v4[26] = v39;

  uint64_t v41 = [(NSNumber *)self->_payloadSMIMEEncryptionEnabled copy];
  id v42 = (void *)v4[27];
  v4[27] = v41;

  uint64_t v43 = [(NSString *)self->_payloadSMIMEEncryptionCertificateUUID copy];
  v44 = (void *)v4[28];
  v4[28] = v43;

  uint64_t v45 = [(NSNumber *)self->_payloadSMIMEEnablePerMessageSwitch copy];
  v46 = (void *)v4[29];
  v4[29] = v45;

  uint64_t v47 = [(NSNumber *)self->_payloadDisableMailRecentsSyncing copy];
  v48 = (void *)v4[30];
  v4[30] = v47;

  uint64_t v49 = [(NSNumber *)self->_payloadAllowMailDrop copy];
  id v50 = (void *)v4[31];
  v4[31] = v49;

  uint64_t v51 = [(NSString *)self->_payloadIncomingMailServerIMAPPathPrefix copy];
  id v52 = (void *)v4[32];
  v4[32] = v51;

  uint64_t v53 = [(NSString *)self->_payloadIncomingCredentials copy];
  id v54 = (void *)v4[33];
  v4[33] = v53;

  uint64_t v55 = [(NSString *)self->_payloadOutgoingCredentials copy];
  id v56 = (void *)v4[34];
  v4[34] = v55;

  uint64_t v57 = [(NSNumber *)self->_payloadSMIMESigningOverrideable copy];
  id v58 = (void *)v4[35];
  v4[35] = v57;

  uint64_t v59 = [(NSNumber *)self->_payloadSMIMESigningCertificateUUIDOverrideable copy];
  id v60 = (void *)v4[36];
  v4[36] = v59;

  uint64_t v61 = [(NSNumber *)self->_payloadSMIMEEncryptByDefault copy];
  id v62 = (void *)v4[37];
  v4[37] = v61;

  uint64_t v63 = [(NSNumber *)self->_payloadSMIMEEncryptByDefaultOverrideable copy];
  id v64 = (void *)v4[38];
  v4[38] = v63;

  uint64_t v65 = [(NSNumber *)self->_payloadSMIMEEncryptionCertificateUUIDOverrideable copy];
  id v66 = (void *)v4[39];
  v4[39] = v65;

  uint64_t v67 = [(NSNumber *)self->_payloadSMIMEEnableEncryptionPerMessageSwitch copy];
  id v68 = (void *)v4[40];
  v4[40] = v67;

  return v4;
}

- (NSString)payloadEmailAccountDescription
{
  return self->_payloadEmailAccountDescription;
}

- (void)setPayloadEmailAccountDescription:(id)a3
{
}

- (NSString)payloadEmailAccountName
{
  return self->_payloadEmailAccountName;
}

- (void)setPayloadEmailAccountName:(id)a3
{
}

- (NSString)payloadEmailAccountType
{
  return self->_payloadEmailAccountType;
}

- (void)setPayloadEmailAccountType:(id)a3
{
}

- (NSString)payloadEmailAddress
{
  return self->_payloadEmailAddress;
}

- (void)setPayloadEmailAddress:(id)a3
{
}

- (NSString)payloadIncomingMailServerAuthentication
{
  return self->_payloadIncomingMailServerAuthentication;
}

- (void)setPayloadIncomingMailServerAuthentication:(id)a3
{
}

- (NSString)payloadIncomingMailServerHostName
{
  return self->_payloadIncomingMailServerHostName;
}

- (void)setPayloadIncomingMailServerHostName:(id)a3
{
}

- (NSNumber)payloadIncomingMailServerPortNumber
{
  return self->_payloadIncomingMailServerPortNumber;
}

- (void)setPayloadIncomingMailServerPortNumber:(id)a3
{
}

- (NSNumber)payloadIncomingMailServerUseSSL
{
  return self->_payloadIncomingMailServerUseSSL;
}

- (void)setPayloadIncomingMailServerUseSSL:(id)a3
{
}

- (NSNumber)payloadOutgoingPasswordSameAsIncomingPassword
{
  return self->_payloadOutgoingPasswordSameAsIncomingPassword;
}

- (void)setPayloadOutgoingPasswordSameAsIncomingPassword:(id)a3
{
}

- (NSString)payloadOutgoingMailServerAuthentication
{
  return self->_payloadOutgoingMailServerAuthentication;
}

- (void)setPayloadOutgoingMailServerAuthentication:(id)a3
{
}

- (NSNumber)payloadOutgoingMailServerPortNumber
{
  return self->_payloadOutgoingMailServerPortNumber;
}

- (void)setPayloadOutgoingMailServerPortNumber:(id)a3
{
}

- (NSNumber)payloadOutgoingMailServerUseSSL
{
  return self->_payloadOutgoingMailServerUseSSL;
}

- (void)setPayloadOutgoingMailServerUseSSL:(id)a3
{
}

- (NSString)payloadOutgoingMailServerUsername
{
  return self->_payloadOutgoingMailServerUsername;
}

- (void)setPayloadOutgoingMailServerUsername:(id)a3
{
}

- (NSNumber)payloadPreventMove
{
  return self->_payloadPreventMove;
}

- (void)setPayloadPreventMove:(id)a3
{
}

- (NSNumber)payloadPreventAppSheet
{
  return self->_payloadPreventAppSheet;
}

- (void)setPayloadPreventAppSheet:(id)a3
{
}

- (NSNumber)payloadSMIMEEnabled
{
  return self->_payloadSMIMEEnabled;
}

- (void)setPayloadSMIMEEnabled:(id)a3
{
}

- (NSNumber)payloadSMIMESigningEnabled
{
  return self->_payloadSMIMESigningEnabled;
}

- (void)setPayloadSMIMESigningEnabled:(id)a3
{
}

- (NSString)payloadSMIMESigningCertificateUUID
{
  return self->_payloadSMIMESigningCertificateUUID;
}

- (void)setPayloadSMIMESigningCertificateUUID:(id)a3
{
}

- (NSNumber)payloadSMIMEEncryptionEnabled
{
  return self->_payloadSMIMEEncryptionEnabled;
}

- (void)setPayloadSMIMEEncryptionEnabled:(id)a3
{
}

- (NSString)payloadSMIMEEncryptionCertificateUUID
{
  return self->_payloadSMIMEEncryptionCertificateUUID;
}

- (void)setPayloadSMIMEEncryptionCertificateUUID:(id)a3
{
}

- (NSNumber)payloadSMIMEEnablePerMessageSwitch
{
  return self->_payloadSMIMEEnablePerMessageSwitch;
}

- (void)setPayloadSMIMEEnablePerMessageSwitch:(id)a3
{
}

- (NSNumber)payloadDisableMailRecentsSyncing
{
  return self->_payloadDisableMailRecentsSyncing;
}

- (void)setPayloadDisableMailRecentsSyncing:(id)a3
{
}

- (NSNumber)payloadAllowMailDrop
{
  return self->_payloadAllowMailDrop;
}

- (void)setPayloadAllowMailDrop:(id)a3
{
}

- (NSString)payloadIncomingMailServerIMAPPathPrefix
{
  return self->_payloadIncomingMailServerIMAPPathPrefix;
}

- (void)setPayloadIncomingMailServerIMAPPathPrefix:(id)a3
{
}

- (NSString)payloadIncomingCredentials
{
  return self->_payloadIncomingCredentials;
}

- (void)setPayloadIncomingCredentials:(id)a3
{
}

- (NSString)payloadOutgoingCredentials
{
  return self->_payloadOutgoingCredentials;
}

- (void)setPayloadOutgoingCredentials:(id)a3
{
}

- (NSNumber)payloadSMIMESigningOverrideable
{
  return self->_payloadSMIMESigningOverrideable;
}

- (void)setPayloadSMIMESigningOverrideable:(id)a3
{
}

- (NSNumber)payloadSMIMESigningCertificateUUIDOverrideable
{
  return self->_payloadSMIMESigningCertificateUUIDOverrideable;
}

- (void)setPayloadSMIMESigningCertificateUUIDOverrideable:(id)a3
{
}

- (NSNumber)payloadSMIMEEncryptByDefault
{
  return self->_payloadSMIMEEncryptByDefault;
}

- (void)setPayloadSMIMEEncryptByDefault:(id)a3
{
}

- (NSNumber)payloadSMIMEEncryptByDefaultOverrideable
{
  return self->_payloadSMIMEEncryptByDefaultOverrideable;
}

- (void)setPayloadSMIMEEncryptByDefaultOverrideable:(id)a3
{
}

- (NSNumber)payloadSMIMEEncryptionCertificateUUIDOverrideable
{
  return self->_payloadSMIMEEncryptionCertificateUUIDOverrideable;
}

- (void)setPayloadSMIMEEncryptionCertificateUUIDOverrideable:(id)a3
{
}

- (NSNumber)payloadSMIMEEnableEncryptionPerMessageSwitch
{
  return self->_payloadSMIMEEnableEncryptionPerMessageSwitch;
}

- (void)setPayloadSMIMEEnableEncryptionPerMessageSwitch:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadSMIMEEnableEncryptionPerMessageSwitch, 0);
  objc_storeStrong((id *)&self->_payloadSMIMEEncryptionCertificateUUIDOverrideable, 0);
  objc_storeStrong((id *)&self->_payloadSMIMEEncryptByDefaultOverrideable, 0);
  objc_storeStrong((id *)&self->_payloadSMIMEEncryptByDefault, 0);
  objc_storeStrong((id *)&self->_payloadSMIMESigningCertificateUUIDOverrideable, 0);
  objc_storeStrong((id *)&self->_payloadSMIMESigningOverrideable, 0);
  objc_storeStrong((id *)&self->_payloadOutgoingCredentials, 0);
  objc_storeStrong((id *)&self->_payloadIncomingCredentials, 0);
  objc_storeStrong((id *)&self->_payloadIncomingMailServerIMAPPathPrefix, 0);
  objc_storeStrong((id *)&self->_payloadAllowMailDrop, 0);
  objc_storeStrong((id *)&self->_payloadDisableMailRecentsSyncing, 0);
  objc_storeStrong((id *)&self->_payloadSMIMEEnablePerMessageSwitch, 0);
  objc_storeStrong((id *)&self->_payloadSMIMEEncryptionCertificateUUID, 0);
  objc_storeStrong((id *)&self->_payloadSMIMEEncryptionEnabled, 0);
  objc_storeStrong((id *)&self->_payloadSMIMESigningCertificateUUID, 0);
  objc_storeStrong((id *)&self->_payloadSMIMESigningEnabled, 0);
  objc_storeStrong((id *)&self->_payloadSMIMEEnabled, 0);
  objc_storeStrong((id *)&self->_payloadPreventAppSheet, 0);
  objc_storeStrong((id *)&self->_payloadPreventMove, 0);
  objc_storeStrong((id *)&self->_payloadOutgoingMailServerUsername, 0);
  objc_storeStrong((id *)&self->_payloadOutgoingMailServerUseSSL, 0);
  objc_storeStrong((id *)&self->_payloadOutgoingMailServerPortNumber, 0);
  objc_storeStrong((id *)&self->_payloadOutgoingMailServerAuthentication, 0);
  objc_storeStrong((id *)&self->_payloadOutgoingPasswordSameAsIncomingPassword, 0);
  objc_storeStrong((id *)&self->_payloadIncomingMailServerUseSSL, 0);
  objc_storeStrong((id *)&self->_payloadIncomingMailServerPortNumber, 0);
  objc_storeStrong((id *)&self->_payloadIncomingMailServerHostName, 0);
  objc_storeStrong((id *)&self->_payloadIncomingMailServerAuthentication, 0);
  objc_storeStrong((id *)&self->_payloadEmailAddress, 0);
  objc_storeStrong((id *)&self->_payloadEmailAccountType, 0);
  objc_storeStrong((id *)&self->_payloadEmailAccountName, 0);

  objc_storeStrong((id *)&self->_payloadEmailAccountDescription, 0);
}

@end