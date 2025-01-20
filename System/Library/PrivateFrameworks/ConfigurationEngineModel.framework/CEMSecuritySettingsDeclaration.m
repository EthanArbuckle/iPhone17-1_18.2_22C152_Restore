@interface CEMSecuritySettingsDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3;
+ (id)buildWithIdentifier:(id)a3 withAllowUntrustedTLSPrompt:(id)a4 withAllowOTAPKIUpdates:(id)a5 withForceEncryptedBackup:(id)a6 withAllowEraseContentAndSettings:(id)a7 withAllowEnablingRestrictions:(id)a8;
+ (id)profileType;
+ (id)restrictionPayloadKeys;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)multipleAllowed;
- (BOOL)mustBeSupervised;
- (NSNumber)payloadAllowEnablingRestrictions;
- (NSNumber)payloadAllowEraseContentAndSettings;
- (NSNumber)payloadAllowOTAPKIUpdates;
- (NSNumber)payloadAllowUntrustedTLSPrompt;
- (NSNumber)payloadForceEncryptedBackup;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)activationLevel;
- (void)setPayloadAllowEnablingRestrictions:(id)a3;
- (void)setPayloadAllowEraseContentAndSettings:(id)a3;
- (void)setPayloadAllowOTAPKIUpdates:(id)a3;
- (void)setPayloadAllowUntrustedTLSPrompt:(id)a3;
- (void)setPayloadForceEncryptedBackup:(id)a3;
@end

@implementation CEMSecuritySettingsDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.security.settings";
}

+ (id)profileType
{
  return &stru_26C838878;
}

+ (NSSet)allowedPayloadKeys
{
  v6[5] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"allowUntrustedTLSPrompt";
  v6[1] = @"allowOTAPKIUpdates";
  v6[2] = @"forceEncryptedBackup";
  v6[3] = @"allowEraseContentAndSettings";
  v6[4] = @"allowEnablingRestrictions";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:5];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)restrictionPayloadKeys
{
  v6[5] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"allowUntrustedTLSPrompt";
  v6[1] = @"allowOTAPKIUpdates";
  v6[2] = @"forceEncryptedBackup";
  v6[3] = @"allowEraseContentAndSettings";
  v6[4] = @"allowEnablingRestrictions";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:5];
  v4 = [v2 setWithArray:v3];

  return v4;
}

- (BOOL)multipleAllowed
{
  return 0;
}

- (BOOL)mustBeSupervised
{
  return 1;
}

- (int)activationLevel
{
  return 2;
}

- (id)assetReferences
{
  return (id)MEMORY[0x263EFFA68];
}

+ (id)buildWithIdentifier:(id)a3 withAllowUntrustedTLSPrompt:(id)a4 withAllowOTAPKIUpdates:(id)a5 withForceEncryptedBackup:(id)a6 withAllowEraseContentAndSettings:(id)a7 withAllowEnablingRestrictions:(id)a8
{
  id v13 = a3;
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  v19 = objc_opt_new();
  [v19 setDeclarationType:@"com.apple.configuration.security.settings"];
  if (v13)
  {
    [v19 setDeclarationIdentifier:v13];
  }
  else
  {
    v20 = [MEMORY[0x263F08C38] UUID];
    v21 = [v20 UUIDString];
    [v19 setDeclarationIdentifier:v21];
  }
  v22 = (void *)MEMORY[0x263EFFA88];
  if (v18) {
    id v23 = v18;
  }
  else {
    id v23 = (id)MEMORY[0x263EFFA88];
  }
  [v19 setPayloadAllowUntrustedTLSPrompt:v23];

  if (v17) {
    id v24 = v17;
  }
  else {
    id v24 = v22;
  }
  [v19 setPayloadAllowOTAPKIUpdates:v24];

  if (v16) {
    id v25 = v16;
  }
  else {
    id v25 = (id)MEMORY[0x263EFFA80];
  }
  [v19 setPayloadForceEncryptedBackup:v25];

  if (v15) {
    id v26 = v15;
  }
  else {
    id v26 = v22;
  }
  [v19 setPayloadAllowEraseContentAndSettings:v26];

  if (v14) {
    id v27 = v14;
  }
  else {
    id v27 = v22;
  }
  [v19 setPayloadAllowEnablingRestrictions:v27];

  [v19 updateServerHash];

  return v19;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setDeclarationType:@"com.apple.configuration.security.settings"];
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

  v10 = +[CEMSecuritySettingsDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v29 = 0;
  id v13 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowUntrustedTLSPrompt" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v29];
  id v14 = v29;
  payloadAllowUntrustedTLSPrompt = self->_payloadAllowUntrustedTLSPrompt;
  self->_payloadAllowUntrustedTLSPrompt = v13;

  if (!v14)
  {
    id v28 = 0;
    id v16 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowOTAPKIUpdates" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v28];
    id v14 = v28;
    payloadAllowOTAPKIUpdates = self->_payloadAllowOTAPKIUpdates;
    self->_payloadAllowOTAPKIUpdates = v16;

    if (!v14)
    {
      id v27 = 0;
      id v18 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"forceEncryptedBackup" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v27];
      id v14 = v27;
      payloadForceEncryptedBackup = self->_payloadForceEncryptedBackup;
      self->_payloadForceEncryptedBackup = v18;

      if (!v14)
      {
        id v26 = 0;
        v20 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowEraseContentAndSettings" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v26];
        id v14 = v26;
        payloadAllowEraseContentAndSettings = self->_payloadAllowEraseContentAndSettings;
        self->_payloadAllowEraseContentAndSettings = v20;

        if (!v14)
        {
          id v25 = 0;
          v22 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowEnablingRestrictions" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v25];
          id v14 = v25;
          payloadAllowEnablingRestrictions = self->_payloadAllowEnablingRestrictions;
          self->_payloadAllowEnablingRestrictions = v22;
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
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowUntrustedTLSPrompt" withValue:self->_payloadAllowUntrustedTLSPrompt isRequired:0 defaultValue:MEMORY[0x263EFFA88]];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowOTAPKIUpdates" withValue:self->_payloadAllowOTAPKIUpdates isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"forceEncryptedBackup" withValue:self->_payloadForceEncryptedBackup isRequired:0 defaultValue:MEMORY[0x263EFFA80]];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowEraseContentAndSettings" withValue:self->_payloadAllowEraseContentAndSettings isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowEnablingRestrictions" withValue:self->_payloadAllowEnablingRestrictions isRequired:0 defaultValue:v5];
  id v6 = (void *)[v4 copy];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v16.receiver = self;
  v16.super_class = (Class)CEMSecuritySettingsDeclaration;
  v4 = [(CEMDeclarationBase *)&v16 copyWithZone:a3];
  uint64_t v5 = [(NSNumber *)self->_payloadAllowUntrustedTLSPrompt copy];
  id v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(NSNumber *)self->_payloadAllowOTAPKIUpdates copy];
  v8 = (void *)v4[10];
  v4[10] = v7;

  uint64_t v9 = [(NSNumber *)self->_payloadForceEncryptedBackup copy];
  v10 = (void *)v4[11];
  v4[11] = v9;

  uint64_t v11 = [(NSNumber *)self->_payloadAllowEraseContentAndSettings copy];
  v12 = (void *)v4[12];
  v4[12] = v11;

  uint64_t v13 = [(NSNumber *)self->_payloadAllowEnablingRestrictions copy];
  id v14 = (void *)v4[13];
  v4[13] = v13;

  return v4;
}

- (NSNumber)payloadAllowUntrustedTLSPrompt
{
  return self->_payloadAllowUntrustedTLSPrompt;
}

- (void)setPayloadAllowUntrustedTLSPrompt:(id)a3
{
}

- (NSNumber)payloadAllowOTAPKIUpdates
{
  return self->_payloadAllowOTAPKIUpdates;
}

- (void)setPayloadAllowOTAPKIUpdates:(id)a3
{
}

- (NSNumber)payloadForceEncryptedBackup
{
  return self->_payloadForceEncryptedBackup;
}

- (void)setPayloadForceEncryptedBackup:(id)a3
{
}

- (NSNumber)payloadAllowEraseContentAndSettings
{
  return self->_payloadAllowEraseContentAndSettings;
}

- (void)setPayloadAllowEraseContentAndSettings:(id)a3
{
}

- (NSNumber)payloadAllowEnablingRestrictions
{
  return self->_payloadAllowEnablingRestrictions;
}

- (void)setPayloadAllowEnablingRestrictions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAllowEnablingRestrictions, 0);
  objc_storeStrong((id *)&self->_payloadAllowEraseContentAndSettings, 0);
  objc_storeStrong((id *)&self->_payloadForceEncryptedBackup, 0);
  objc_storeStrong((id *)&self->_payloadAllowOTAPKIUpdates, 0);

  objc_storeStrong((id *)&self->_payloadAllowUntrustedTLSPrompt, 0);
}

@end