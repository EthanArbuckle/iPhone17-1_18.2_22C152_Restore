@interface CEMPasscodeSettingsDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3;
+ (id)buildWithIdentifier:(id)a3 withAllowSimple:(id)a4 withForcePIN:(id)a5 withMaxFailedAttempts:(id)a6 withMaxInactivity:(id)a7 withMaxPINAgeInDays:(id)a8 withMinComplexChars:(id)a9 withMinLength:(id)a10 withRequireAlphanumeric:(id)a11 withPinHistory:(id)a12 withMaxGracePeriod:(id)a13 withMinutesUntilFailedLoginReset:(id)a14 withChangeAtNextAuth:(id)a15 withManualFetchingWhenRoaming:(id)a16 withAllowFingerprintForUnlock:(id)a17 withAllowFingerprintModification:(id)a18 withAllowPasscodeModification:(id)a19 withAllowAutoUnlock:(id)a20;
+ (id)profileType;
+ (id)restrictionPayloadKeys;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)multipleAllowed;
- (BOOL)mustBeSupervised;
- (NSNumber)payloadAllowAutoUnlock;
- (NSNumber)payloadAllowFingerprintForUnlock;
- (NSNumber)payloadAllowFingerprintModification;
- (NSNumber)payloadAllowPasscodeModification;
- (NSNumber)payloadAllowSimple;
- (NSNumber)payloadChangeAtNextAuth;
- (NSNumber)payloadForcePIN;
- (NSNumber)payloadManualFetchingWhenRoaming;
- (NSNumber)payloadMaxFailedAttempts;
- (NSNumber)payloadMaxGracePeriod;
- (NSNumber)payloadMaxInactivity;
- (NSNumber)payloadMaxPINAgeInDays;
- (NSNumber)payloadMinComplexChars;
- (NSNumber)payloadMinLength;
- (NSNumber)payloadMinutesUntilFailedLoginReset;
- (NSNumber)payloadPinHistory;
- (NSNumber)payloadRequireAlphanumeric;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)activationLevel;
- (void)setPayloadAllowAutoUnlock:(id)a3;
- (void)setPayloadAllowFingerprintForUnlock:(id)a3;
- (void)setPayloadAllowFingerprintModification:(id)a3;
- (void)setPayloadAllowPasscodeModification:(id)a3;
- (void)setPayloadAllowSimple:(id)a3;
- (void)setPayloadChangeAtNextAuth:(id)a3;
- (void)setPayloadForcePIN:(id)a3;
- (void)setPayloadManualFetchingWhenRoaming:(id)a3;
- (void)setPayloadMaxFailedAttempts:(id)a3;
- (void)setPayloadMaxGracePeriod:(id)a3;
- (void)setPayloadMaxInactivity:(id)a3;
- (void)setPayloadMaxPINAgeInDays:(id)a3;
- (void)setPayloadMinComplexChars:(id)a3;
- (void)setPayloadMinLength:(id)a3;
- (void)setPayloadMinutesUntilFailedLoginReset:(id)a3;
- (void)setPayloadPinHistory:(id)a3;
- (void)setPayloadRequireAlphanumeric:(id)a3;
@end

@implementation CEMPasscodeSettingsDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.passcode.settings";
}

+ (id)profileType
{
  return @"com.apple.mobiledevice.passwordpolicy";
}

+ (NSSet)allowedPayloadKeys
{
  v6[17] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"allowSimple";
  v6[1] = @"forcePIN";
  v6[2] = @"maxFailedAttempts";
  v6[3] = @"maxInactivity";
  v6[4] = @"maxPINAgeInDays";
  v6[5] = @"minComplexChars";
  v6[6] = @"minLength";
  v6[7] = @"requireAlphanumeric";
  v6[8] = @"pinHistory";
  v6[9] = @"maxGracePeriod";
  v6[10] = @"minutesUntilFailedLoginReset";
  v6[11] = @"changeAtNextAuth";
  v6[12] = @"manualFetchingWhenRoaming";
  v6[13] = @"allowFingerprintForUnlock";
  v6[14] = @"allowFingerprintModification";
  v6[15] = @"allowPasscodeModification";
  v6[16] = @"allowAutoUnlock";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:17];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)restrictionPayloadKeys
{
  v6[4] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"allowFingerprintForUnlock";
  v6[1] = @"allowFingerprintModification";
  v6[2] = @"allowPasscodeModification";
  v6[3] = @"allowAutoUnlock";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];
  v4 = [v2 setWithArray:v3];

  return v4;
}

- (BOOL)multipleAllowed
{
  return 0;
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

+ (id)buildWithIdentifier:(id)a3 withAllowSimple:(id)a4 withForcePIN:(id)a5 withMaxFailedAttempts:(id)a6 withMaxInactivity:(id)a7 withMaxPINAgeInDays:(id)a8 withMinComplexChars:(id)a9 withMinLength:(id)a10 withRequireAlphanumeric:(id)a11 withPinHistory:(id)a12 withMaxGracePeriod:(id)a13 withMinutesUntilFailedLoginReset:(id)a14 withChangeAtNextAuth:(id)a15 withManualFetchingWhenRoaming:(id)a16 withAllowFingerprintForUnlock:(id)a17 withAllowFingerprintModification:(id)a18 withAllowPasscodeModification:(id)a19 withAllowAutoUnlock:(id)a20
{
  id v20 = a3;
  id v61 = a20;
  id v60 = a19;
  id v59 = a18;
  id v58 = a17;
  id v57 = a16;
  id v56 = a15;
  id v55 = a14;
  id v54 = a13;
  id v53 = a12;
  id v52 = a11;
  id v21 = a10;
  id v22 = a9;
  id v23 = a8;
  id v24 = a7;
  id v25 = a6;
  id v26 = a5;
  id v27 = a4;
  v28 = objc_opt_new();
  [v28 setDeclarationType:@"com.apple.configuration.passcode.settings"];
  if (v20)
  {
    [v28 setDeclarationIdentifier:v20];
  }
  else
  {
    v29 = [MEMORY[0x263F08C38] UUID];
    v30 = [v29 UUIDString];
    [v28 setDeclarationIdentifier:v30];

    id v20 = 0;
  }
  v31 = (void *)MEMORY[0x263EFFA88];
  if (v27) {
    id v32 = v27;
  }
  else {
    id v32 = (id)MEMORY[0x263EFFA88];
  }
  [v28 setPayloadAllowSimple:v32];

  if (v26) {
    id v33 = v26;
  }
  else {
    id v33 = v31;
  }
  [v28 setPayloadForcePIN:v33];

  if (v25) {
    v34 = v25;
  }
  else {
    v34 = &unk_26C8948F8;
  }
  [v28 setPayloadMaxFailedAttempts:v34];

  [v28 setPayloadMaxInactivity:v24];
  [v28 setPayloadMaxPINAgeInDays:v23];

  if (v22) {
    v35 = v22;
  }
  else {
    v35 = &unk_26C894910;
  }
  [v28 setPayloadMinComplexChars:v35];

  if (v21) {
    v36 = v21;
  }
  else {
    v36 = &unk_26C894910;
  }
  [v28 setPayloadMinLength:v36];

  v37 = (void *)MEMORY[0x263EFFA80];
  if (v52) {
    id v38 = v52;
  }
  else {
    id v38 = (id)MEMORY[0x263EFFA80];
  }
  [v28 setPayloadRequireAlphanumeric:v38];

  [v28 setPayloadPinHistory:v53];
  if (v54) {
    v39 = v54;
  }
  else {
    v39 = &unk_26C894910;
  }
  [v28 setPayloadMaxGracePeriod:v39];

  [v28 setPayloadMinutesUntilFailedLoginReset:v55];
  if (v56) {
    id v40 = v56;
  }
  else {
    id v40 = v37;
  }
  [v28 setPayloadChangeAtNextAuth:v40];

  if (v57) {
    id v41 = v57;
  }
  else {
    id v41 = v37;
  }
  [v28 setPayloadManualFetchingWhenRoaming:v41];

  if (v58) {
    id v42 = v58;
  }
  else {
    id v42 = v31;
  }
  [v28 setPayloadAllowFingerprintForUnlock:v42];

  if (v59) {
    id v43 = v59;
  }
  else {
    id v43 = v31;
  }
  [v28 setPayloadAllowFingerprintModification:v43];

  if (v60) {
    id v44 = v60;
  }
  else {
    id v44 = v31;
  }
  [v28 setPayloadAllowPasscodeModification:v44];

  if (v61) {
    id v45 = v61;
  }
  else {
    id v45 = v31;
  }
  [v28 setPayloadAllowAutoUnlock:v45];

  [v28 updateServerHash];

  return v28;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setDeclarationType:@"com.apple.configuration.passcode.settings"];
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

  v10 = +[CEMPasscodeSettingsDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v65 = 0;
  v13 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowSimple" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v65];
  id v14 = v65;
  payloadAllowSimple = self->_payloadAllowSimple;
  self->_payloadAllowSimple = v13;

  if (!v14)
  {
    id v64 = 0;
    v16 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"forcePIN" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v64];
    id v14 = v64;
    payloadForcePIN = self->_payloadForcePIN;
    self->_payloadForcePIN = v16;

    if (!v14)
    {
      id v63 = 0;
      v18 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"maxFailedAttempts" isRequired:0 defaultValue:&unk_26C8948F8 error:&v63];
      id v14 = v63;
      payloadMaxFailedAttempts = self->_payloadMaxFailedAttempts;
      self->_payloadMaxFailedAttempts = v18;

      if (!v14)
      {
        id v62 = 0;
        id v20 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"maxInactivity" isRequired:0 defaultValue:0 error:&v62];
        id v14 = v62;
        payloadMaxInactivity = self->_payloadMaxInactivity;
        self->_payloadMaxInactivity = v20;

        if (!v14)
        {
          id v61 = 0;
          id v22 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"maxPINAgeInDays" isRequired:0 defaultValue:0 error:&v61];
          id v14 = v61;
          payloadMaxPINAgeInDays = self->_payloadMaxPINAgeInDays;
          self->_payloadMaxPINAgeInDays = v22;

          if (!v14)
          {
            id v60 = 0;
            id v24 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"minComplexChars" isRequired:0 defaultValue:&unk_26C894910 error:&v60];
            id v14 = v60;
            payloadMinComplexChars = self->_payloadMinComplexChars;
            self->_payloadMinComplexChars = v24;

            if (!v14)
            {
              id v59 = 0;
              id v26 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"minLength" isRequired:0 defaultValue:&unk_26C894910 error:&v59];
              id v14 = v59;
              payloadMinLength = self->_payloadMinLength;
              self->_payloadMinLength = v26;

              if (!v14)
              {
                id v58 = 0;
                v28 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"requireAlphanumeric" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v58];
                id v14 = v58;
                payloadRequireAlphanumeric = self->_payloadRequireAlphanumeric;
                self->_payloadRequireAlphanumeric = v28;

                if (!v14)
                {
                  id v57 = 0;
                  v30 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"pinHistory" isRequired:0 defaultValue:0 error:&v57];
                  id v14 = v57;
                  payloadPinHistory = self->_payloadPinHistory;
                  self->_payloadPinHistory = v30;

                  if (!v14)
                  {
                    id v56 = 0;
                    id v32 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"maxGracePeriod" isRequired:0 defaultValue:&unk_26C894910 error:&v56];
                    id v14 = v56;
                    payloadMaxGracePeriod = self->_payloadMaxGracePeriod;
                    self->_payloadMaxGracePeriod = v32;

                    if (!v14)
                    {
                      id v55 = 0;
                      v34 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"minutesUntilFailedLoginReset" isRequired:0 defaultValue:0 error:&v55];
                      id v14 = v55;
                      payloadMinutesUntilFailedLoginReset = self->_payloadMinutesUntilFailedLoginReset;
                      self->_payloadMinutesUntilFailedLoginReset = v34;

                      if (!v14)
                      {
                        id v54 = 0;
                        v36 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"changeAtNextAuth" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v54];
                        id v14 = v54;
                        payloadChangeAtNextAuth = self->_payloadChangeAtNextAuth;
                        self->_payloadChangeAtNextAuth = v36;

                        if (!v14)
                        {
                          id v53 = 0;
                          id v38 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"manualFetchingWhenRoaming" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v53];
                          id v14 = v53;
                          payloadManualFetchingWhenRoaming = self->_payloadManualFetchingWhenRoaming;
                          self->_payloadManualFetchingWhenRoaming = v38;

                          if (!v14)
                          {
                            id v52 = 0;
                            id v40 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowFingerprintForUnlock" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v52];
                            id v14 = v52;
                            payloadAllowFingerprintForUnlock = self->_payloadAllowFingerprintForUnlock;
                            self->_payloadAllowFingerprintForUnlock = v40;

                            if (!v14)
                            {
                              id v51 = 0;
                              id v42 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowFingerprintModification" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v51];
                              id v14 = v51;
                              payloadAllowFingerprintModification = self->_payloadAllowFingerprintModification;
                              self->_payloadAllowFingerprintModification = v42;

                              if (!v14)
                              {
                                id v50 = 0;
                                id v44 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowPasscodeModification" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v50];
                                id v14 = v50;
                                payloadAllowPasscodeModification = self->_payloadAllowPasscodeModification;
                                self->_payloadAllowPasscodeModification = v44;

                                if (!v14)
                                {
                                  id v49 = 0;
                                  v46 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowAutoUnlock" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v49];
                                  id v14 = v49;
                                  payloadAllowAutoUnlock = self->_payloadAllowAutoUnlock;
                                  self->_payloadAllowAutoUnlock = v46;
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
  v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", a3);
  uint64_t v5 = MEMORY[0x263EFFA88];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowSimple" withValue:self->_payloadAllowSimple isRequired:0 defaultValue:MEMORY[0x263EFFA88]];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"forcePIN" withValue:self->_payloadForcePIN isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v4 withKey:@"maxFailedAttempts" withValue:self->_payloadMaxFailedAttempts isRequired:0 defaultValue:&unk_26C8948F8];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v4 withKey:@"maxInactivity" withValue:self->_payloadMaxInactivity isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v4 withKey:@"maxPINAgeInDays" withValue:self->_payloadMaxPINAgeInDays isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v4 withKey:@"minComplexChars" withValue:self->_payloadMinComplexChars isRequired:0 defaultValue:&unk_26C894910];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v4 withKey:@"minLength" withValue:self->_payloadMinLength isRequired:0 defaultValue:&unk_26C894910];
  uint64_t v6 = MEMORY[0x263EFFA80];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"requireAlphanumeric" withValue:self->_payloadRequireAlphanumeric isRequired:0 defaultValue:MEMORY[0x263EFFA80]];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v4 withKey:@"pinHistory" withValue:self->_payloadPinHistory isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v4 withKey:@"maxGracePeriod" withValue:self->_payloadMaxGracePeriod isRequired:0 defaultValue:&unk_26C894910];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v4 withKey:@"minutesUntilFailedLoginReset" withValue:self->_payloadMinutesUntilFailedLoginReset isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"changeAtNextAuth" withValue:self->_payloadChangeAtNextAuth isRequired:0 defaultValue:v6];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"manualFetchingWhenRoaming" withValue:self->_payloadManualFetchingWhenRoaming isRequired:0 defaultValue:v6];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowFingerprintForUnlock" withValue:self->_payloadAllowFingerprintForUnlock isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowFingerprintModification" withValue:self->_payloadAllowFingerprintModification isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowPasscodeModification" withValue:self->_payloadAllowPasscodeModification isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowAutoUnlock" withValue:self->_payloadAllowAutoUnlock isRequired:0 defaultValue:v5];
  v7 = (void *)[v4 copy];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v40.receiver = self;
  v40.super_class = (Class)CEMPasscodeSettingsDeclaration;
  v4 = [(CEMDeclarationBase *)&v40 copyWithZone:a3];
  uint64_t v5 = [(NSNumber *)self->_payloadAllowSimple copy];
  uint64_t v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(NSNumber *)self->_payloadForcePIN copy];
  v8 = (void *)v4[10];
  v4[10] = v7;

  uint64_t v9 = [(NSNumber *)self->_payloadMaxFailedAttempts copy];
  v10 = (void *)v4[11];
  v4[11] = v9;

  uint64_t v11 = [(NSNumber *)self->_payloadMaxInactivity copy];
  v12 = (void *)v4[12];
  v4[12] = v11;

  uint64_t v13 = [(NSNumber *)self->_payloadMaxPINAgeInDays copy];
  id v14 = (void *)v4[13];
  v4[13] = v13;

  uint64_t v15 = [(NSNumber *)self->_payloadMinComplexChars copy];
  v16 = (void *)v4[14];
  v4[14] = v15;

  uint64_t v17 = [(NSNumber *)self->_payloadMinLength copy];
  v18 = (void *)v4[15];
  v4[15] = v17;

  uint64_t v19 = [(NSNumber *)self->_payloadRequireAlphanumeric copy];
  id v20 = (void *)v4[16];
  v4[16] = v19;

  uint64_t v21 = [(NSNumber *)self->_payloadPinHistory copy];
  id v22 = (void *)v4[17];
  v4[17] = v21;

  uint64_t v23 = [(NSNumber *)self->_payloadMaxGracePeriod copy];
  id v24 = (void *)v4[18];
  v4[18] = v23;

  uint64_t v25 = [(NSNumber *)self->_payloadMinutesUntilFailedLoginReset copy];
  id v26 = (void *)v4[19];
  v4[19] = v25;

  uint64_t v27 = [(NSNumber *)self->_payloadChangeAtNextAuth copy];
  v28 = (void *)v4[20];
  v4[20] = v27;

  uint64_t v29 = [(NSNumber *)self->_payloadManualFetchingWhenRoaming copy];
  v30 = (void *)v4[21];
  v4[21] = v29;

  uint64_t v31 = [(NSNumber *)self->_payloadAllowFingerprintForUnlock copy];
  id v32 = (void *)v4[22];
  v4[22] = v31;

  uint64_t v33 = [(NSNumber *)self->_payloadAllowFingerprintModification copy];
  v34 = (void *)v4[23];
  v4[23] = v33;

  uint64_t v35 = [(NSNumber *)self->_payloadAllowPasscodeModification copy];
  v36 = (void *)v4[24];
  v4[24] = v35;

  uint64_t v37 = [(NSNumber *)self->_payloadAllowAutoUnlock copy];
  id v38 = (void *)v4[25];
  v4[25] = v37;

  return v4;
}

- (NSNumber)payloadAllowSimple
{
  return self->_payloadAllowSimple;
}

- (void)setPayloadAllowSimple:(id)a3
{
}

- (NSNumber)payloadForcePIN
{
  return self->_payloadForcePIN;
}

- (void)setPayloadForcePIN:(id)a3
{
}

- (NSNumber)payloadMaxFailedAttempts
{
  return self->_payloadMaxFailedAttempts;
}

- (void)setPayloadMaxFailedAttempts:(id)a3
{
}

- (NSNumber)payloadMaxInactivity
{
  return self->_payloadMaxInactivity;
}

- (void)setPayloadMaxInactivity:(id)a3
{
}

- (NSNumber)payloadMaxPINAgeInDays
{
  return self->_payloadMaxPINAgeInDays;
}

- (void)setPayloadMaxPINAgeInDays:(id)a3
{
}

- (NSNumber)payloadMinComplexChars
{
  return self->_payloadMinComplexChars;
}

- (void)setPayloadMinComplexChars:(id)a3
{
}

- (NSNumber)payloadMinLength
{
  return self->_payloadMinLength;
}

- (void)setPayloadMinLength:(id)a3
{
}

- (NSNumber)payloadRequireAlphanumeric
{
  return self->_payloadRequireAlphanumeric;
}

- (void)setPayloadRequireAlphanumeric:(id)a3
{
}

- (NSNumber)payloadPinHistory
{
  return self->_payloadPinHistory;
}

- (void)setPayloadPinHistory:(id)a3
{
}

- (NSNumber)payloadMaxGracePeriod
{
  return self->_payloadMaxGracePeriod;
}

- (void)setPayloadMaxGracePeriod:(id)a3
{
}

- (NSNumber)payloadMinutesUntilFailedLoginReset
{
  return self->_payloadMinutesUntilFailedLoginReset;
}

- (void)setPayloadMinutesUntilFailedLoginReset:(id)a3
{
}

- (NSNumber)payloadChangeAtNextAuth
{
  return self->_payloadChangeAtNextAuth;
}

- (void)setPayloadChangeAtNextAuth:(id)a3
{
}

- (NSNumber)payloadManualFetchingWhenRoaming
{
  return self->_payloadManualFetchingWhenRoaming;
}

- (void)setPayloadManualFetchingWhenRoaming:(id)a3
{
}

- (NSNumber)payloadAllowFingerprintForUnlock
{
  return self->_payloadAllowFingerprintForUnlock;
}

- (void)setPayloadAllowFingerprintForUnlock:(id)a3
{
}

- (NSNumber)payloadAllowFingerprintModification
{
  return self->_payloadAllowFingerprintModification;
}

- (void)setPayloadAllowFingerprintModification:(id)a3
{
}

- (NSNumber)payloadAllowPasscodeModification
{
  return self->_payloadAllowPasscodeModification;
}

- (void)setPayloadAllowPasscodeModification:(id)a3
{
}

- (NSNumber)payloadAllowAutoUnlock
{
  return self->_payloadAllowAutoUnlock;
}

- (void)setPayloadAllowAutoUnlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAllowAutoUnlock, 0);
  objc_storeStrong((id *)&self->_payloadAllowPasscodeModification, 0);
  objc_storeStrong((id *)&self->_payloadAllowFingerprintModification, 0);
  objc_storeStrong((id *)&self->_payloadAllowFingerprintForUnlock, 0);
  objc_storeStrong((id *)&self->_payloadManualFetchingWhenRoaming, 0);
  objc_storeStrong((id *)&self->_payloadChangeAtNextAuth, 0);
  objc_storeStrong((id *)&self->_payloadMinutesUntilFailedLoginReset, 0);
  objc_storeStrong((id *)&self->_payloadMaxGracePeriod, 0);
  objc_storeStrong((id *)&self->_payloadPinHistory, 0);
  objc_storeStrong((id *)&self->_payloadRequireAlphanumeric, 0);
  objc_storeStrong((id *)&self->_payloadMinLength, 0);
  objc_storeStrong((id *)&self->_payloadMinComplexChars, 0);
  objc_storeStrong((id *)&self->_payloadMaxPINAgeInDays, 0);
  objc_storeStrong((id *)&self->_payloadMaxInactivity, 0);
  objc_storeStrong((id *)&self->_payloadMaxFailedAttempts, 0);
  objc_storeStrong((id *)&self->_payloadForcePIN, 0);

  objc_storeStrong((id *)&self->_payloadAllowSimple, 0);
}

@end