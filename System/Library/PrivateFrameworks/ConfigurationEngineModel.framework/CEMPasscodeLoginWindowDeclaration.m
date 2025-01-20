@interface CEMPasscodeLoginWindowDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3;
+ (id)buildWithIdentifier:(id)a3 withSHOWFULLNAME:(id)a4 withHideLocalUsers:(id)a5 withIncludeNetworkUser:(id)a6 withHideAdminUsers:(id)a7 withSHOWOTHERUSERSMANAGED:(id)a8 withAdminHostInfo:(id)a9 withAllowList:(id)a10 withDenyList:(id)a11 withHideMobileAccounts:(id)a12 withShutDownDisabled:(id)a13 withRestartDisabled:(id)a14 withSleepDisabled:(id)a15 withDisableConsoleAccess:(id)a16 withLoginwindowText:(id)a17 withShutDownDisabledWhileLoggedIn:(id)a18 withRestartDisabledWhileLoggedIn:(id)a19 withPowerOffDisabledWhileLoggedIn:(id)a20 withLogOutDisabledWhileLoggedIn:(id)a21 withDisableScreenLockImmediate:(id)a22;
+ (id)profileType;
+ (id)restrictionPayloadKeys;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)multipleAllowed;
- (BOOL)mustBeSupervised;
- (NSArray)payloadAllowList;
- (NSArray)payloadDenyList;
- (NSNumber)payloadDisableConsoleAccess;
- (NSNumber)payloadDisableScreenLockImmediate;
- (NSNumber)payloadHideAdminUsers;
- (NSNumber)payloadHideLocalUsers;
- (NSNumber)payloadHideMobileAccounts;
- (NSNumber)payloadIncludeNetworkUser;
- (NSNumber)payloadLogOutDisabledWhileLoggedIn;
- (NSNumber)payloadPowerOffDisabledWhileLoggedIn;
- (NSNumber)payloadRestartDisabled;
- (NSNumber)payloadRestartDisabledWhileLoggedIn;
- (NSNumber)payloadSHOWFULLNAME;
- (NSNumber)payloadSHOWOTHERUSERSMANAGED;
- (NSNumber)payloadShutDownDisabled;
- (NSNumber)payloadShutDownDisabledWhileLoggedIn;
- (NSNumber)payloadSleepDisabled;
- (NSString)payloadAdminHostInfo;
- (NSString)payloadLoginwindowText;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)activationLevel;
- (void)setPayloadAdminHostInfo:(id)a3;
- (void)setPayloadAllowList:(id)a3;
- (void)setPayloadDenyList:(id)a3;
- (void)setPayloadDisableConsoleAccess:(id)a3;
- (void)setPayloadDisableScreenLockImmediate:(id)a3;
- (void)setPayloadHideAdminUsers:(id)a3;
- (void)setPayloadHideLocalUsers:(id)a3;
- (void)setPayloadHideMobileAccounts:(id)a3;
- (void)setPayloadIncludeNetworkUser:(id)a3;
- (void)setPayloadLogOutDisabledWhileLoggedIn:(id)a3;
- (void)setPayloadLoginwindowText:(id)a3;
- (void)setPayloadPowerOffDisabledWhileLoggedIn:(id)a3;
- (void)setPayloadRestartDisabled:(id)a3;
- (void)setPayloadRestartDisabledWhileLoggedIn:(id)a3;
- (void)setPayloadSHOWFULLNAME:(id)a3;
- (void)setPayloadSHOWOTHERUSERSMANAGED:(id)a3;
- (void)setPayloadShutDownDisabled:(id)a3;
- (void)setPayloadShutDownDisabledWhileLoggedIn:(id)a3;
- (void)setPayloadSleepDisabled:(id)a3;
@end

@implementation CEMPasscodeLoginWindowDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.passcode.loginwindow";
}

+ (id)profileType
{
  return @"com.apple.loginwindow";
}

+ (NSSet)allowedPayloadKeys
{
  v6[19] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"SHOWFULLNAME";
  v6[1] = @"HideLocalUsers";
  v6[2] = @"IncludeNetworkUser";
  v6[3] = @"HideAdminUsers";
  v6[4] = @"SHOWOTHERUSERS_MANAGED";
  v6[5] = @"AdminHostInfo";
  v6[6] = @"AllowList";
  v6[7] = @"DenyList";
  v6[8] = @"HideMobileAccounts";
  v6[9] = @"ShutDownDisabled";
  v6[10] = @"RestartDisabled";
  v6[11] = @"SleepDisabled";
  v6[12] = @"DisableConsoleAccess";
  v6[13] = @"LoginwindowText";
  v6[14] = @"ShutDownDisabledWhileLoggedIn";
  v6[15] = @"RestartDisabledWhileLoggedIn";
  v6[16] = @"PowerOffDisabledWhileLoggedIn";
  v6[17] = @"LogOutDisabledWhileLoggedIn";
  v6[18] = @"DisableScreenLockImmediate";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:19];
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
  return 0;
}

- (id)assetReferences
{
  return (id)MEMORY[0x263EFFA68];
}

+ (id)buildWithIdentifier:(id)a3 withSHOWFULLNAME:(id)a4 withHideLocalUsers:(id)a5 withIncludeNetworkUser:(id)a6 withHideAdminUsers:(id)a7 withSHOWOTHERUSERSMANAGED:(id)a8 withAdminHostInfo:(id)a9 withAllowList:(id)a10 withDenyList:(id)a11 withHideMobileAccounts:(id)a12 withShutDownDisabled:(id)a13 withRestartDisabled:(id)a14 withSleepDisabled:(id)a15 withDisableConsoleAccess:(id)a16 withLoginwindowText:(id)a17 withShutDownDisabledWhileLoggedIn:(id)a18 withRestartDisabledWhileLoggedIn:(id)a19 withPowerOffDisabledWhileLoggedIn:(id)a20 withLogOutDisabledWhileLoggedIn:(id)a21 withDisableScreenLockImmediate:(id)a22
{
  id v22 = a3;
  id v66 = a22;
  id v65 = a21;
  id v64 = a20;
  id v63 = a19;
  id v62 = a18;
  id v61 = a17;
  id v60 = a16;
  id v59 = a15;
  id v23 = a14;
  id v24 = a13;
  id v58 = a12;
  id v57 = a11;
  id v56 = a10;
  id v55 = a9;
  id v25 = a8;
  id v26 = a7;
  id v27 = a6;
  id v28 = a5;
  id v29 = a4;
  v30 = objc_opt_new();
  [v30 setDeclarationType:@"com.apple.configuration.passcode.loginwindow"];
  if (v22)
  {
    [v30 setDeclarationIdentifier:v22];
  }
  else
  {
    v31 = [MEMORY[0x263F08C38] UUID];
    v32 = [v31 UUIDString];
    [v30 setDeclarationIdentifier:v32];

    id v22 = 0;
  }
  v33 = (void *)MEMORY[0x263EFFA80];
  if (v29) {
    id v34 = v29;
  }
  else {
    id v34 = (id)MEMORY[0x263EFFA80];
  }
  objc_msgSend(v30, "setPayloadSHOWFULLNAME:", v34, a13);

  if (v28) {
    id v35 = v28;
  }
  else {
    id v35 = v33;
  }
  [v30 setPayloadHideLocalUsers:v35];

  if (v27) {
    id v36 = v27;
  }
  else {
    id v36 = v33;
  }
  [v30 setPayloadIncludeNetworkUser:v36];

  if (v26) {
    id v37 = v26;
  }
  else {
    id v37 = v33;
  }
  [v30 setPayloadHideAdminUsers:v37];

  if (v25) {
    id v38 = v25;
  }
  else {
    id v38 = v33;
  }
  [v30 setPayloadSHOWOTHERUSERSMANAGED:v38];

  [v30 setPayloadAdminHostInfo:v55];
  [v30 setPayloadAllowList:v56];

  [v30 setPayloadDenyList:v57];
  if (v58) {
    id v39 = v58;
  }
  else {
    id v39 = v33;
  }
  [v30 setPayloadHideMobileAccounts:v39];

  if (v24) {
    id v40 = v24;
  }
  else {
    id v40 = v33;
  }
  [v30 setPayloadShutDownDisabled:v40];

  if (v23) {
    id v41 = v23;
  }
  else {
    id v41 = v33;
  }
  [v30 setPayloadRestartDisabled:v41];

  if (v59) {
    id v42 = v59;
  }
  else {
    id v42 = v33;
  }
  [v30 setPayloadSleepDisabled:v42];

  if (v60) {
    id v43 = v60;
  }
  else {
    id v43 = v33;
  }
  [v30 setPayloadDisableConsoleAccess:v43];

  [v30 setPayloadLoginwindowText:v61];
  if (v62) {
    id v44 = v62;
  }
  else {
    id v44 = v33;
  }
  [v30 setPayloadShutDownDisabledWhileLoggedIn:v44];

  if (v63) {
    id v45 = v63;
  }
  else {
    id v45 = v33;
  }
  [v30 setPayloadRestartDisabledWhileLoggedIn:v45];

  if (v64) {
    id v46 = v64;
  }
  else {
    id v46 = v33;
  }
  [v30 setPayloadPowerOffDisabledWhileLoggedIn:v46];

  if (v65) {
    id v47 = v65;
  }
  else {
    id v47 = v33;
  }
  [v30 setPayloadLogOutDisabledWhileLoggedIn:v47];

  if (v66) {
    id v48 = v66;
  }
  else {
    id v48 = v33;
  }
  [v30 setPayloadDisableScreenLockImmediate:v48];

  [v30 updateServerHash];

  return v30;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setDeclarationType:@"com.apple.configuration.passcode.loginwindow"];
  if (v3)
  {
    [v4 setDeclarationIdentifier:v3];
  }
  else
  {
    v5 = [MEMORY[0x263F08C38] UUID];
    v6 = [v5 UUIDString];
    [v4 setDeclarationIdentifier:v6];
  }
  [v4 updateServerHash];

  return v4;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMPasscodeLoginWindowDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v71 = 0;
  v13 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"SHOWFULLNAME" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v71];
  id v14 = v71;
  payloadSHOWFULLNAME = self->_payloadSHOWFULLNAME;
  self->_payloadSHOWFULLNAME = v13;

  if (!v14)
  {
    id v70 = 0;
    v16 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"HideLocalUsers" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v70];
    id v14 = v70;
    payloadHideLocalUsers = self->_payloadHideLocalUsers;
    self->_payloadHideLocalUsers = v16;

    if (!v14)
    {
      id v69 = 0;
      v18 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"IncludeNetworkUser" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v69];
      id v14 = v69;
      payloadIncludeNetworkUser = self->_payloadIncludeNetworkUser;
      self->_payloadIncludeNetworkUser = v18;

      if (!v14)
      {
        id v68 = 0;
        v20 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"HideAdminUsers" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v68];
        id v14 = v68;
        payloadHideAdminUsers = self->_payloadHideAdminUsers;
        self->_payloadHideAdminUsers = v20;

        if (!v14)
        {
          id v67 = 0;
          id v22 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"SHOWOTHERUSERS_MANAGED" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v67];
          id v14 = v67;
          payloadSHOWOTHERUSERSMANAGED = self->_payloadSHOWOTHERUSERSMANAGED;
          self->_payloadSHOWOTHERUSERSMANAGED = v22;

          if (!v14)
          {
            id v66 = 0;
            id v24 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"AdminHostInfo" isRequired:0 defaultValue:0 error:&v66];
            id v14 = v66;
            payloadAdminHostInfo = self->_payloadAdminHostInfo;
            self->_payloadAdminHostInfo = v24;

            if (!v14)
            {
              id v65 = 0;
              id v26 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"AllowList" validator:&__block_literal_global_27 isRequired:0 defaultValue:0 error:&v65];
              id v14 = v65;
              payloadAllowList = self->_payloadAllowList;
              self->_payloadAllowList = v26;

              if (!v14)
              {
                id v64 = 0;
                id v28 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"DenyList" validator:&__block_literal_global_80 isRequired:0 defaultValue:0 error:&v64];
                id v14 = v64;
                payloadDenyList = self->_payloadDenyList;
                self->_payloadDenyList = v28;

                if (!v14)
                {
                  id v63 = 0;
                  v30 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"HideMobileAccounts" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v63];
                  id v14 = v63;
                  payloadHideMobileAccounts = self->_payloadHideMobileAccounts;
                  self->_payloadHideMobileAccounts = v30;

                  if (!v14)
                  {
                    id v62 = 0;
                    v32 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"ShutDownDisabled" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v62];
                    id v14 = v62;
                    payloadShutDownDisabled = self->_payloadShutDownDisabled;
                    self->_payloadShutDownDisabled = v32;

                    if (!v14)
                    {
                      id v61 = 0;
                      id v34 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"RestartDisabled" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v61];
                      id v14 = v61;
                      payloadRestartDisabled = self->_payloadRestartDisabled;
                      self->_payloadRestartDisabled = v34;

                      if (!v14)
                      {
                        id v60 = 0;
                        id v36 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"SleepDisabled" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v60];
                        id v14 = v60;
                        payloadSleepDisabled = self->_payloadSleepDisabled;
                        self->_payloadSleepDisabled = v36;

                        if (!v14)
                        {
                          id v59 = 0;
                          id v38 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"DisableConsoleAccess" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v59];
                          id v14 = v59;
                          payloadDisableConsoleAccess = self->_payloadDisableConsoleAccess;
                          self->_payloadDisableConsoleAccess = v38;

                          if (!v14)
                          {
                            id v58 = 0;
                            id v40 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"LoginwindowText" isRequired:0 defaultValue:0 error:&v58];
                            id v14 = v58;
                            payloadLoginwindowText = self->_payloadLoginwindowText;
                            self->_payloadLoginwindowText = v40;

                            if (!v14)
                            {
                              id v57 = 0;
                              id v42 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"ShutDownDisabledWhileLoggedIn" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v57];
                              id v14 = v57;
                              payloadShutDownDisabledWhileLoggedIn = self->_payloadShutDownDisabledWhileLoggedIn;
                              self->_payloadShutDownDisabledWhileLoggedIn = v42;

                              if (!v14)
                              {
                                id v56 = 0;
                                id v44 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"RestartDisabledWhileLoggedIn" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v56];
                                id v14 = v56;
                                payloadRestartDisabledWhileLoggedIn = self->_payloadRestartDisabledWhileLoggedIn;
                                self->_payloadRestartDisabledWhileLoggedIn = v44;

                                if (!v14)
                                {
                                  id v55 = 0;
                                  id v46 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"PowerOffDisabledWhileLoggedIn" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v55];
                                  id v14 = v55;
                                  payloadPowerOffDisabledWhileLoggedIn = self->_payloadPowerOffDisabledWhileLoggedIn;
                                  self->_payloadPowerOffDisabledWhileLoggedIn = v46;

                                  if (!v14)
                                  {
                                    id v54 = 0;
                                    id v48 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"LogOutDisabledWhileLoggedIn" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v54];
                                    id v14 = v54;
                                    payloadLogOutDisabledWhileLoggedIn = self->_payloadLogOutDisabledWhileLoggedIn;
                                    self->_payloadLogOutDisabledWhileLoggedIn = v48;

                                    if (!v14)
                                    {
                                      id v53 = 0;
                                      v50 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"DisableScreenLockImmediate" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v53];
                                      id v14 = v53;
                                      payloadDisableScreenLockImmediate = self->_payloadDisableScreenLockImmediate;
                                      self->_payloadDisableScreenLockImmediate = v50;
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

uint64_t __55__CEMPasscodeLoginWindowDeclaration_loadPayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __55__CEMPasscodeLoginWindowDeclaration_loadPayload_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", a3);
  uint64_t v5 = MEMORY[0x263EFFA80];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"SHOWFULLNAME" withValue:self->_payloadSHOWFULLNAME isRequired:0 defaultValue:MEMORY[0x263EFFA80]];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"HideLocalUsers" withValue:self->_payloadHideLocalUsers isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"IncludeNetworkUser" withValue:self->_payloadIncludeNetworkUser isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"HideAdminUsers" withValue:self->_payloadHideAdminUsers isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"SHOWOTHERUSERS_MANAGED" withValue:self->_payloadSHOWOTHERUSERSMANAGED isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"AdminHostInfo" withValue:self->_payloadAdminHostInfo isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v4 withKey:@"AllowList" withValue:self->_payloadAllowList itemSerializer:&__block_literal_global_84 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v4 withKey:@"DenyList" withValue:self->_payloadDenyList itemSerializer:&__block_literal_global_86_0 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"HideMobileAccounts" withValue:self->_payloadHideMobileAccounts isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"ShutDownDisabled" withValue:self->_payloadShutDownDisabled isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"RestartDisabled" withValue:self->_payloadRestartDisabled isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"SleepDisabled" withValue:self->_payloadSleepDisabled isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"DisableConsoleAccess" withValue:self->_payloadDisableConsoleAccess isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"LoginwindowText" withValue:self->_payloadLoginwindowText isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"ShutDownDisabledWhileLoggedIn" withValue:self->_payloadShutDownDisabledWhileLoggedIn isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"RestartDisabledWhileLoggedIn" withValue:self->_payloadRestartDisabledWhileLoggedIn isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"PowerOffDisabledWhileLoggedIn" withValue:self->_payloadPowerOffDisabledWhileLoggedIn isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"LogOutDisabledWhileLoggedIn" withValue:self->_payloadLogOutDisabledWhileLoggedIn isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"DisableScreenLockImmediate" withValue:self->_payloadDisableScreenLockImmediate isRequired:0 defaultValue:v5];
  id v6 = (void *)[v4 copy];

  return v6;
}

id __72__CEMPasscodeLoginWindowDeclaration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

id __72__CEMPasscodeLoginWindowDeclaration_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v44.receiver = self;
  v44.super_class = (Class)CEMPasscodeLoginWindowDeclaration;
  v4 = [(CEMDeclarationBase *)&v44 copyWithZone:a3];
  uint64_t v5 = [(NSNumber *)self->_payloadSHOWFULLNAME copy];
  id v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(NSNumber *)self->_payloadHideLocalUsers copy];
  v8 = (void *)v4[10];
  v4[10] = v7;

  uint64_t v9 = [(NSNumber *)self->_payloadIncludeNetworkUser copy];
  v10 = (void *)v4[11];
  v4[11] = v9;

  uint64_t v11 = [(NSNumber *)self->_payloadHideAdminUsers copy];
  v12 = (void *)v4[12];
  v4[12] = v11;

  uint64_t v13 = [(NSNumber *)self->_payloadSHOWOTHERUSERSMANAGED copy];
  id v14 = (void *)v4[13];
  v4[13] = v13;

  uint64_t v15 = [(NSString *)self->_payloadAdminHostInfo copy];
  v16 = (void *)v4[14];
  v4[14] = v15;

  uint64_t v17 = [(NSArray *)self->_payloadAllowList copy];
  v18 = (void *)v4[15];
  v4[15] = v17;

  uint64_t v19 = [(NSArray *)self->_payloadDenyList copy];
  v20 = (void *)v4[16];
  v4[16] = v19;

  uint64_t v21 = [(NSNumber *)self->_payloadHideMobileAccounts copy];
  id v22 = (void *)v4[17];
  v4[17] = v21;

  uint64_t v23 = [(NSNumber *)self->_payloadShutDownDisabled copy];
  id v24 = (void *)v4[18];
  v4[18] = v23;

  uint64_t v25 = [(NSNumber *)self->_payloadRestartDisabled copy];
  id v26 = (void *)v4[19];
  v4[19] = v25;

  uint64_t v27 = [(NSNumber *)self->_payloadSleepDisabled copy];
  id v28 = (void *)v4[20];
  v4[20] = v27;

  uint64_t v29 = [(NSNumber *)self->_payloadDisableConsoleAccess copy];
  v30 = (void *)v4[21];
  v4[21] = v29;

  uint64_t v31 = [(NSString *)self->_payloadLoginwindowText copy];
  v32 = (void *)v4[22];
  v4[22] = v31;

  uint64_t v33 = [(NSNumber *)self->_payloadShutDownDisabledWhileLoggedIn copy];
  id v34 = (void *)v4[23];
  v4[23] = v33;

  uint64_t v35 = [(NSNumber *)self->_payloadRestartDisabledWhileLoggedIn copy];
  id v36 = (void *)v4[24];
  v4[24] = v35;

  uint64_t v37 = [(NSNumber *)self->_payloadPowerOffDisabledWhileLoggedIn copy];
  id v38 = (void *)v4[25];
  v4[25] = v37;

  uint64_t v39 = [(NSNumber *)self->_payloadLogOutDisabledWhileLoggedIn copy];
  id v40 = (void *)v4[26];
  v4[26] = v39;

  uint64_t v41 = [(NSNumber *)self->_payloadDisableScreenLockImmediate copy];
  id v42 = (void *)v4[27];
  v4[27] = v41;

  return v4;
}

- (NSNumber)payloadSHOWFULLNAME
{
  return self->_payloadSHOWFULLNAME;
}

- (void)setPayloadSHOWFULLNAME:(id)a3
{
}

- (NSNumber)payloadHideLocalUsers
{
  return self->_payloadHideLocalUsers;
}

- (void)setPayloadHideLocalUsers:(id)a3
{
}

- (NSNumber)payloadIncludeNetworkUser
{
  return self->_payloadIncludeNetworkUser;
}

- (void)setPayloadIncludeNetworkUser:(id)a3
{
}

- (NSNumber)payloadHideAdminUsers
{
  return self->_payloadHideAdminUsers;
}

- (void)setPayloadHideAdminUsers:(id)a3
{
}

- (NSNumber)payloadSHOWOTHERUSERSMANAGED
{
  return self->_payloadSHOWOTHERUSERSMANAGED;
}

- (void)setPayloadSHOWOTHERUSERSMANAGED:(id)a3
{
}

- (NSString)payloadAdminHostInfo
{
  return self->_payloadAdminHostInfo;
}

- (void)setPayloadAdminHostInfo:(id)a3
{
}

- (NSArray)payloadAllowList
{
  return self->_payloadAllowList;
}

- (void)setPayloadAllowList:(id)a3
{
}

- (NSArray)payloadDenyList
{
  return self->_payloadDenyList;
}

- (void)setPayloadDenyList:(id)a3
{
}

- (NSNumber)payloadHideMobileAccounts
{
  return self->_payloadHideMobileAccounts;
}

- (void)setPayloadHideMobileAccounts:(id)a3
{
}

- (NSNumber)payloadShutDownDisabled
{
  return self->_payloadShutDownDisabled;
}

- (void)setPayloadShutDownDisabled:(id)a3
{
}

- (NSNumber)payloadRestartDisabled
{
  return self->_payloadRestartDisabled;
}

- (void)setPayloadRestartDisabled:(id)a3
{
}

- (NSNumber)payloadSleepDisabled
{
  return self->_payloadSleepDisabled;
}

- (void)setPayloadSleepDisabled:(id)a3
{
}

- (NSNumber)payloadDisableConsoleAccess
{
  return self->_payloadDisableConsoleAccess;
}

- (void)setPayloadDisableConsoleAccess:(id)a3
{
}

- (NSString)payloadLoginwindowText
{
  return self->_payloadLoginwindowText;
}

- (void)setPayloadLoginwindowText:(id)a3
{
}

- (NSNumber)payloadShutDownDisabledWhileLoggedIn
{
  return self->_payloadShutDownDisabledWhileLoggedIn;
}

- (void)setPayloadShutDownDisabledWhileLoggedIn:(id)a3
{
}

- (NSNumber)payloadRestartDisabledWhileLoggedIn
{
  return self->_payloadRestartDisabledWhileLoggedIn;
}

- (void)setPayloadRestartDisabledWhileLoggedIn:(id)a3
{
}

- (NSNumber)payloadPowerOffDisabledWhileLoggedIn
{
  return self->_payloadPowerOffDisabledWhileLoggedIn;
}

- (void)setPayloadPowerOffDisabledWhileLoggedIn:(id)a3
{
}

- (NSNumber)payloadLogOutDisabledWhileLoggedIn
{
  return self->_payloadLogOutDisabledWhileLoggedIn;
}

- (void)setPayloadLogOutDisabledWhileLoggedIn:(id)a3
{
}

- (NSNumber)payloadDisableScreenLockImmediate
{
  return self->_payloadDisableScreenLockImmediate;
}

- (void)setPayloadDisableScreenLockImmediate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadDisableScreenLockImmediate, 0);
  objc_storeStrong((id *)&self->_payloadLogOutDisabledWhileLoggedIn, 0);
  objc_storeStrong((id *)&self->_payloadPowerOffDisabledWhileLoggedIn, 0);
  objc_storeStrong((id *)&self->_payloadRestartDisabledWhileLoggedIn, 0);
  objc_storeStrong((id *)&self->_payloadShutDownDisabledWhileLoggedIn, 0);
  objc_storeStrong((id *)&self->_payloadLoginwindowText, 0);
  objc_storeStrong((id *)&self->_payloadDisableConsoleAccess, 0);
  objc_storeStrong((id *)&self->_payloadSleepDisabled, 0);
  objc_storeStrong((id *)&self->_payloadRestartDisabled, 0);
  objc_storeStrong((id *)&self->_payloadShutDownDisabled, 0);
  objc_storeStrong((id *)&self->_payloadHideMobileAccounts, 0);
  objc_storeStrong((id *)&self->_payloadDenyList, 0);
  objc_storeStrong((id *)&self->_payloadAllowList, 0);
  objc_storeStrong((id *)&self->_payloadAdminHostInfo, 0);
  objc_storeStrong((id *)&self->_payloadSHOWOTHERUSERSMANAGED, 0);
  objc_storeStrong((id *)&self->_payloadHideAdminUsers, 0);
  objc_storeStrong((id *)&self->_payloadIncludeNetworkUser, 0);
  objc_storeStrong((id *)&self->_payloadHideLocalUsers, 0);

  objc_storeStrong((id *)&self->_payloadSHOWFULLNAME, 0);
}

@end