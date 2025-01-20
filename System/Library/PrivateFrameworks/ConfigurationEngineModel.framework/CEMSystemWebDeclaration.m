@interface CEMSystemWebDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3;
+ (id)buildWithIdentifier:(id)a3 withForceLimitAdTracking:(id)a4 withSafariAllowAutoFill:(id)a5 withSafariForceFraudWarning:(id)a6 withSafariAllowJavaScript:(id)a7 withSafariAllowPopups:(id)a8 withSafariAcceptCookies:(id)a9 withForceAuthenticationBeforeAutoFill:(id)a10;
+ (id)profileType;
+ (id)restrictionPayloadKeys;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)multipleAllowed;
- (BOOL)mustBeSupervised;
- (NSNumber)payloadForceAuthenticationBeforeAutoFill;
- (NSNumber)payloadForceLimitAdTracking;
- (NSNumber)payloadSafariAcceptCookies;
- (NSNumber)payloadSafariAllowAutoFill;
- (NSNumber)payloadSafariAllowJavaScript;
- (NSNumber)payloadSafariAllowPopups;
- (NSNumber)payloadSafariForceFraudWarning;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)activationLevel;
- (void)setPayloadForceAuthenticationBeforeAutoFill:(id)a3;
- (void)setPayloadForceLimitAdTracking:(id)a3;
- (void)setPayloadSafariAcceptCookies:(id)a3;
- (void)setPayloadSafariAllowAutoFill:(id)a3;
- (void)setPayloadSafariAllowJavaScript:(id)a3;
- (void)setPayloadSafariAllowPopups:(id)a3;
- (void)setPayloadSafariForceFraudWarning:(id)a3;
@end

@implementation CEMSystemWebDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.system.web";
}

+ (id)profileType
{
  return &stru_26C838878;
}

+ (NSSet)allowedPayloadKeys
{
  v6[7] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"forceLimitAdTracking";
  v6[1] = @"safariAllowAutoFill";
  v6[2] = @"safariForceFraudWarning";
  v6[3] = @"safariAllowJavaScript";
  v6[4] = @"safariAllowPopups";
  v6[5] = @"safariAcceptCookies";
  v6[6] = @"forceAuthenticationBeforeAutoFill";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:7];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)restrictionPayloadKeys
{
  v6[7] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"forceLimitAdTracking";
  v6[1] = @"safariAllowAutoFill";
  v6[2] = @"safariForceFraudWarning";
  v6[3] = @"safariAllowJavaScript";
  v6[4] = @"safariAllowPopups";
  v6[5] = @"safariAcceptCookies";
  v6[6] = @"forceAuthenticationBeforeAutoFill";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:7];
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
  return 2;
}

- (id)assetReferences
{
  return (id)MEMORY[0x263EFFA68];
}

+ (id)buildWithIdentifier:(id)a3 withForceLimitAdTracking:(id)a4 withSafariAllowAutoFill:(id)a5 withSafariForceFraudWarning:(id)a6 withSafariAllowJavaScript:(id)a7 withSafariAllowPopups:(id)a8 withSafariAcceptCookies:(id)a9 withForceAuthenticationBeforeAutoFill:(id)a10
{
  id v15 = a3;
  id v35 = a10;
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  v22 = objc_opt_new();
  [v22 setDeclarationType:@"com.apple.configuration.system.web"];
  if (v15)
  {
    [v22 setDeclarationIdentifier:v15];
  }
  else
  {
    v23 = [MEMORY[0x263F08C38] UUID];
    v24 = [v23 UUIDString];
    [v22 setDeclarationIdentifier:v24];
  }
  v25 = (void *)MEMORY[0x263EFFA80];
  if (v21) {
    id v26 = v21;
  }
  else {
    id v26 = (id)MEMORY[0x263EFFA80];
  }
  [v22 setPayloadForceLimitAdTracking:v26];

  v27 = (void *)MEMORY[0x263EFFA88];
  if (v20) {
    id v28 = v20;
  }
  else {
    id v28 = (id)MEMORY[0x263EFFA88];
  }
  [v22 setPayloadSafariAllowAutoFill:v28];

  if (v19) {
    id v29 = v19;
  }
  else {
    id v29 = v25;
  }
  [v22 setPayloadSafariForceFraudWarning:v29];

  if (v18) {
    id v30 = v18;
  }
  else {
    id v30 = v27;
  }
  [v22 setPayloadSafariAllowJavaScript:v30];

  if (v17) {
    id v31 = v17;
  }
  else {
    id v31 = v27;
  }
  [v22 setPayloadSafariAllowPopups:v31];

  if (v16) {
    v32 = v16;
  }
  else {
    v32 = &unk_26C8949E0;
  }
  [v22 setPayloadSafariAcceptCookies:v32];

  if (v35) {
    id v33 = v35;
  }
  else {
    id v33 = v25;
  }
  [v22 setPayloadForceAuthenticationBeforeAutoFill:v33];

  [v22 updateServerHash];

  return v22;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setDeclarationType:@"com.apple.configuration.system.web"];
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

  v10 = +[CEMSystemWebDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v35 = 0;
  v13 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"forceLimitAdTracking" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v35];
  id v14 = v35;
  payloadForceLimitAdTracking = self->_payloadForceLimitAdTracking;
  self->_payloadForceLimitAdTracking = v13;

  if (!v14)
  {
    id v34 = 0;
    id v16 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"safariAllowAutoFill" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v34];
    id v14 = v34;
    payloadSafariAllowAutoFill = self->_payloadSafariAllowAutoFill;
    self->_payloadSafariAllowAutoFill = v16;

    if (!v14)
    {
      id v33 = 0;
      id v18 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"safariForceFraudWarning" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v33];
      id v14 = v33;
      payloadSafariForceFraudWarning = self->_payloadSafariForceFraudWarning;
      self->_payloadSafariForceFraudWarning = v18;

      if (!v14)
      {
        id v32 = 0;
        id v20 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"safariAllowJavaScript" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v32];
        id v14 = v32;
        payloadSafariAllowJavaScript = self->_payloadSafariAllowJavaScript;
        self->_payloadSafariAllowJavaScript = v20;

        if (!v14)
        {
          id v31 = 0;
          v22 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"safariAllowPopups" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v31];
          id v14 = v31;
          payloadSafariAllowPopups = self->_payloadSafariAllowPopups;
          self->_payloadSafariAllowPopups = v22;

          if (!v14)
          {
            id v30 = 0;
            v24 = [(CEMPayloadBase *)self loadFloatFromDictionary:v6 withKey:@"safariAcceptCookies" isRequired:0 defaultValue:&unk_26C8949E0 error:&v30];
            id v14 = v30;
            payloadSafariAcceptCookies = self->_payloadSafariAcceptCookies;
            self->_payloadSafariAcceptCookies = v24;

            if (!v14)
            {
              id v29 = 0;
              id v26 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"forceAuthenticationBeforeAutoFill" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v29];
              id v14 = v29;
              payloadForceAuthenticationBeforeAutoFill = self->_payloadForceAuthenticationBeforeAutoFill;
              self->_payloadForceAuthenticationBeforeAutoFill = v26;
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
  uint64_t v5 = MEMORY[0x263EFFA80];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"forceLimitAdTracking" withValue:self->_payloadForceLimitAdTracking isRequired:0 defaultValue:MEMORY[0x263EFFA80]];
  uint64_t v6 = MEMORY[0x263EFFA88];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"safariAllowAutoFill" withValue:self->_payloadSafariAllowAutoFill isRequired:0 defaultValue:MEMORY[0x263EFFA88]];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"safariForceFraudWarning" withValue:self->_payloadSafariForceFraudWarning isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"safariAllowJavaScript" withValue:self->_payloadSafariAllowJavaScript isRequired:0 defaultValue:v6];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"safariAllowPopups" withValue:self->_payloadSafariAllowPopups isRequired:0 defaultValue:v6];
  [(CEMPayloadBase *)self serializeFloatIntoDictionary:v4 withKey:@"safariAcceptCookies" withValue:self->_payloadSafariAcceptCookies isRequired:0 defaultValue:&unk_26C8949E0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"forceAuthenticationBeforeAutoFill" withValue:self->_payloadForceAuthenticationBeforeAutoFill isRequired:0 defaultValue:v5];
  v7 = (void *)[v4 copy];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v20.receiver = self;
  v20.super_class = (Class)CEMSystemWebDeclaration;
  v4 = [(CEMDeclarationBase *)&v20 copyWithZone:a3];
  uint64_t v5 = [(NSNumber *)self->_payloadForceLimitAdTracking copy];
  uint64_t v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(NSNumber *)self->_payloadSafariAllowAutoFill copy];
  v8 = (void *)v4[10];
  v4[10] = v7;

  uint64_t v9 = [(NSNumber *)self->_payloadSafariForceFraudWarning copy];
  v10 = (void *)v4[11];
  v4[11] = v9;

  uint64_t v11 = [(NSNumber *)self->_payloadSafariAllowJavaScript copy];
  v12 = (void *)v4[12];
  v4[12] = v11;

  uint64_t v13 = [(NSNumber *)self->_payloadSafariAllowPopups copy];
  id v14 = (void *)v4[13];
  v4[13] = v13;

  uint64_t v15 = [(NSNumber *)self->_payloadSafariAcceptCookies copy];
  id v16 = (void *)v4[14];
  v4[14] = v15;

  uint64_t v17 = [(NSNumber *)self->_payloadForceAuthenticationBeforeAutoFill copy];
  id v18 = (void *)v4[15];
  v4[15] = v17;

  return v4;
}

- (NSNumber)payloadForceLimitAdTracking
{
  return self->_payloadForceLimitAdTracking;
}

- (void)setPayloadForceLimitAdTracking:(id)a3
{
}

- (NSNumber)payloadSafariAllowAutoFill
{
  return self->_payloadSafariAllowAutoFill;
}

- (void)setPayloadSafariAllowAutoFill:(id)a3
{
}

- (NSNumber)payloadSafariForceFraudWarning
{
  return self->_payloadSafariForceFraudWarning;
}

- (void)setPayloadSafariForceFraudWarning:(id)a3
{
}

- (NSNumber)payloadSafariAllowJavaScript
{
  return self->_payloadSafariAllowJavaScript;
}

- (void)setPayloadSafariAllowJavaScript:(id)a3
{
}

- (NSNumber)payloadSafariAllowPopups
{
  return self->_payloadSafariAllowPopups;
}

- (void)setPayloadSafariAllowPopups:(id)a3
{
}

- (NSNumber)payloadSafariAcceptCookies
{
  return self->_payloadSafariAcceptCookies;
}

- (void)setPayloadSafariAcceptCookies:(id)a3
{
}

- (NSNumber)payloadForceAuthenticationBeforeAutoFill
{
  return self->_payloadForceAuthenticationBeforeAutoFill;
}

- (void)setPayloadForceAuthenticationBeforeAutoFill:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadForceAuthenticationBeforeAutoFill, 0);
  objc_storeStrong((id *)&self->_payloadSafariAcceptCookies, 0);
  objc_storeStrong((id *)&self->_payloadSafariAllowPopups, 0);
  objc_storeStrong((id *)&self->_payloadSafariAllowJavaScript, 0);
  objc_storeStrong((id *)&self->_payloadSafariForceFraudWarning, 0);
  objc_storeStrong((id *)&self->_payloadSafariAllowAutoFill, 0);

  objc_storeStrong((id *)&self->_payloadForceLimitAdTracking, 0);
}

@end