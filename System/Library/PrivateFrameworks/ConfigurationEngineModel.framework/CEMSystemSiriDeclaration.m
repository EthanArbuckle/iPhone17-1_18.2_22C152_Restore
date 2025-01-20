@interface CEMSystemSiriDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3;
+ (id)buildWithIdentifier:(id)a3 withAllowAssistant:(id)a4 withAllowDictation:(id)a5 withAllowAssistantUserGeneratedContent:(id)a6 withForceAssistantProfanityFilter:(id)a7;
+ (id)buildWithIdentifier:(id)a3 withAllowAssistant:(id)a4 withAllowDictation:(id)a5 withAllowAssistantUserGeneratedContent:(id)a6 withForceAssistantProfanityFilter:(id)a7 withAllowKeyboardMathSolving:(id)a8 withAllowMathPaperSolving:(id)a9 withAllowWritingTools:(id)a10 withAllowGenmoji:(id)a11 withAllowImagePlayground:(id)a12 withAllowImageWand:(id)a13;
+ (id)buildWithIdentifier:(id)a3 withAllowAssistant:(id)a4 withAllowDictation:(id)a5 withAllowAssistantUserGeneratedContent:(id)a6 withForceAssistantProfanityFilter:(id)a7 withAllowKeyboardMathSolving:(id)a8 withAllowMathPaperSolving:(id)a9 withAllowWritingTools:(id)a10 withAllowGenmoji:(id)a11 withAllowImagePlayground:(id)a12 withAllowImageWand:(id)a13 withAllowExternalIntelligenceIntegrations:(id)a14;
+ (id)profileType;
+ (id)restrictionPayloadKeys;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)multipleAllowed;
- (BOOL)mustBeSupervised;
- (NSNumber)payloadAllowAssistant;
- (NSNumber)payloadAllowAssistantUserGeneratedContent;
- (NSNumber)payloadAllowDictation;
- (NSNumber)payloadAllowExternalIntelligenceIntegrations;
- (NSNumber)payloadAllowGenmoji;
- (NSNumber)payloadAllowImagePlayground;
- (NSNumber)payloadAllowImageWand;
- (NSNumber)payloadAllowKeyboardMathSolving;
- (NSNumber)payloadAllowMathPaperSolving;
- (NSNumber)payloadAllowWritingTools;
- (NSNumber)payloadForceAssistantProfanityFilter;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)activationLevel;
- (void)setPayloadAllowAssistant:(id)a3;
- (void)setPayloadAllowAssistantUserGeneratedContent:(id)a3;
- (void)setPayloadAllowDictation:(id)a3;
- (void)setPayloadAllowExternalIntelligenceIntegrations:(id)a3;
- (void)setPayloadAllowGenmoji:(id)a3;
- (void)setPayloadAllowImagePlayground:(id)a3;
- (void)setPayloadAllowImageWand:(id)a3;
- (void)setPayloadAllowKeyboardMathSolving:(id)a3;
- (void)setPayloadAllowMathPaperSolving:(id)a3;
- (void)setPayloadAllowWritingTools:(id)a3;
- (void)setPayloadForceAssistantProfanityFilter:(id)a3;
@end

@implementation CEMSystemSiriDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.system.siri";
}

+ (id)profileType
{
  return &stru_26C838878;
}

+ (NSSet)allowedPayloadKeys
{
  v6[11] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"allowAssistant";
  v6[1] = @"allowDictation";
  v6[2] = @"allowAssistantUserGeneratedContent";
  v6[3] = @"forceAssistantProfanityFilter";
  v6[4] = @"allowKeyboardMathSolving";
  v6[5] = @"allowMathPaperSolving";
  v6[6] = @"allowWritingTools";
  v6[7] = @"allowGenmoji";
  v6[8] = @"allowImagePlayground";
  v6[9] = @"allowImageWand";
  v6[10] = @"allowExternalIntelligenceIntegrations";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:11];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)restrictionPayloadKeys
{
  v6[11] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"allowAssistant";
  v6[1] = @"allowDictation";
  v6[2] = @"allowAssistantUserGeneratedContent";
  v6[3] = @"forceAssistantProfanityFilter";
  v6[4] = @"allowKeyboardMathSolving";
  v6[5] = @"allowMathPaperSolving";
  v6[6] = @"allowWritingTools";
  v6[7] = @"allowGenmoji";
  v6[8] = @"allowImagePlayground";
  v6[9] = @"allowImageWand";
  v6[10] = @"allowExternalIntelligenceIntegrations";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:11];
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

+ (id)buildWithIdentifier:(id)a3 withAllowAssistant:(id)a4 withAllowDictation:(id)a5 withAllowAssistantUserGeneratedContent:(id)a6 withForceAssistantProfanityFilter:(id)a7 withAllowKeyboardMathSolving:(id)a8 withAllowMathPaperSolving:(id)a9 withAllowWritingTools:(id)a10 withAllowGenmoji:(id)a11 withAllowImagePlayground:(id)a12 withAllowImageWand:(id)a13 withAllowExternalIntelligenceIntegrations:(id)a14
{
  id v16 = a3;
  id v46 = a14;
  id v45 = a13;
  id v44 = a12;
  id v43 = a11;
  id v17 = a10;
  id v18 = a9;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = a4;
  v24 = objc_opt_new();
  [v24 setDeclarationType:@"com.apple.configuration.system.siri"];
  if (v16)
  {
    [v24 setDeclarationIdentifier:v16];
  }
  else
  {
    v25 = [MEMORY[0x263F08C38] UUID];
    v26 = [v25 UUIDString];
    [v24 setDeclarationIdentifier:v26];

    id v16 = 0;
  }
  v27 = (void *)MEMORY[0x263EFFA88];
  if (v23) {
    id v28 = v23;
  }
  else {
    id v28 = (id)MEMORY[0x263EFFA88];
  }
  [v24 setPayloadAllowAssistant:v28];

  if (v22) {
    id v29 = v22;
  }
  else {
    id v29 = v27;
  }
  [v24 setPayloadAllowDictation:v29];

  if (v21) {
    id v30 = v21;
  }
  else {
    id v30 = v27;
  }
  [v24 setPayloadAllowAssistantUserGeneratedContent:v30];

  if (v20) {
    id v31 = v20;
  }
  else {
    id v31 = (id)MEMORY[0x263EFFA80];
  }
  [v24 setPayloadForceAssistantProfanityFilter:v31];

  if (v19) {
    id v32 = v19;
  }
  else {
    id v32 = v27;
  }
  [v24 setPayloadAllowKeyboardMathSolving:v32];

  if (v18) {
    id v33 = v18;
  }
  else {
    id v33 = v27;
  }
  [v24 setPayloadAllowMathPaperSolving:v33];

  if (v17) {
    id v34 = v17;
  }
  else {
    id v34 = v27;
  }
  [v24 setPayloadAllowWritingTools:v34];

  if (v43) {
    id v35 = v43;
  }
  else {
    id v35 = v27;
  }
  [v24 setPayloadAllowGenmoji:v35];

  if (v44) {
    id v36 = v44;
  }
  else {
    id v36 = v27;
  }
  [v24 setPayloadAllowImagePlayground:v36];

  if (v45) {
    id v37 = v45;
  }
  else {
    id v37 = v27;
  }
  [v24 setPayloadAllowImageWand:v37];

  if (v46) {
    id v38 = v46;
  }
  else {
    id v38 = v27;
  }
  [v24 setPayloadAllowExternalIntelligenceIntegrations:v38];

  [v24 updateServerHash];

  return v24;
}

+ (id)buildWithIdentifier:(id)a3 withAllowAssistant:(id)a4 withAllowDictation:(id)a5 withAllowAssistantUserGeneratedContent:(id)a6 withForceAssistantProfanityFilter:(id)a7 withAllowKeyboardMathSolving:(id)a8 withAllowMathPaperSolving:(id)a9 withAllowWritingTools:(id)a10 withAllowGenmoji:(id)a11 withAllowImagePlayground:(id)a12 withAllowImageWand:(id)a13
{
  id v16 = a3;
  id v43 = a13;
  id v42 = a12;
  id v41 = a11;
  id v17 = a10;
  id v18 = a9;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = a4;
  v24 = objc_opt_new();
  [v24 setDeclarationType:@"com.apple.configuration.system.siri"];
  if (v16)
  {
    [v24 setDeclarationIdentifier:v16];
  }
  else
  {
    v25 = [MEMORY[0x263F08C38] UUID];
    v26 = [v25 UUIDString];
    [v24 setDeclarationIdentifier:v26];

    id v16 = 0;
  }
  v27 = (void *)MEMORY[0x263EFFA88];
  if (v23) {
    id v28 = v23;
  }
  else {
    id v28 = (id)MEMORY[0x263EFFA88];
  }
  [v24 setPayloadAllowAssistant:v28];

  if (v22) {
    id v29 = v22;
  }
  else {
    id v29 = v27;
  }
  [v24 setPayloadAllowDictation:v29];

  if (v21) {
    id v30 = v21;
  }
  else {
    id v30 = v27;
  }
  [v24 setPayloadAllowAssistantUserGeneratedContent:v30];

  if (v20) {
    id v31 = v20;
  }
  else {
    id v31 = (id)MEMORY[0x263EFFA80];
  }
  [v24 setPayloadForceAssistantProfanityFilter:v31];

  if (v19) {
    id v32 = v19;
  }
  else {
    id v32 = v27;
  }
  [v24 setPayloadAllowKeyboardMathSolving:v32];

  if (v18) {
    id v33 = v18;
  }
  else {
    id v33 = v27;
  }
  [v24 setPayloadAllowMathPaperSolving:v33];

  if (v17) {
    id v34 = v17;
  }
  else {
    id v34 = v27;
  }
  [v24 setPayloadAllowWritingTools:v34];

  if (v41) {
    id v35 = v41;
  }
  else {
    id v35 = v27;
  }
  [v24 setPayloadAllowGenmoji:v35];

  if (v42) {
    id v36 = v42;
  }
  else {
    id v36 = v27;
  }
  [v24 setPayloadAllowImagePlayground:v36];

  if (v43) {
    id v37 = v43;
  }
  else {
    id v37 = v27;
  }
  [v24 setPayloadAllowImageWand:v37];

  [v24 setPayloadAllowExternalIntelligenceIntegrations:v27];
  [v24 updateServerHash];

  return v24;
}

+ (id)buildWithIdentifier:(id)a3 withAllowAssistant:(id)a4 withAllowDictation:(id)a5 withAllowAssistantUserGeneratedContent:(id)a6 withForceAssistantProfanityFilter:(id)a7
{
  return (id)[a1 buildWithIdentifier:a3 withAllowAssistant:a4 withAllowDictation:a5 withAllowAssistantUserGeneratedContent:a6 withForceAssistantProfanityFilter:a7 withAllowKeyboardMathSolving:0 withAllowMathPaperSolving:0 withAllowWritingTools:0 withAllowGenmoji:0 withAllowImagePlayground:0 withAllowImageWand:0];
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setDeclarationType:@"com.apple.configuration.system.siri"];
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

  v10 = +[CEMSystemSiriDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v47 = 0;
  v13 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowAssistant" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v47];
  id v14 = v47;
  payloadAllowAssistant = self->_payloadAllowAssistant;
  self->_payloadAllowAssistant = v13;

  if (!v14)
  {
    id v46 = 0;
    id v16 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowDictation" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v46];
    id v14 = v46;
    payloadAllowDictation = self->_payloadAllowDictation;
    self->_payloadAllowDictation = v16;

    if (!v14)
    {
      id v45 = 0;
      id v18 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowAssistantUserGeneratedContent" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v45];
      id v14 = v45;
      payloadAllowAssistantUserGeneratedContent = self->_payloadAllowAssistantUserGeneratedContent;
      self->_payloadAllowAssistantUserGeneratedContent = v18;

      if (!v14)
      {
        id v44 = 0;
        id v20 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"forceAssistantProfanityFilter" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v44];
        id v14 = v44;
        payloadForceAssistantProfanityFilter = self->_payloadForceAssistantProfanityFilter;
        self->_payloadForceAssistantProfanityFilter = v20;

        if (!v14)
        {
          id v43 = 0;
          id v22 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowKeyboardMathSolving" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v43];
          id v14 = v43;
          payloadAllowKeyboardMathSolving = self->_payloadAllowKeyboardMathSolving;
          self->_payloadAllowKeyboardMathSolving = v22;

          if (!v14)
          {
            id v42 = 0;
            v24 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowMathPaperSolving" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v42];
            id v14 = v42;
            payloadAllowMathPaperSolving = self->_payloadAllowMathPaperSolving;
            self->_payloadAllowMathPaperSolving = v24;

            if (!v14)
            {
              id v41 = 0;
              v26 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowWritingTools" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v41];
              id v14 = v41;
              payloadAllowWritingTools = self->_payloadAllowWritingTools;
              self->_payloadAllowWritingTools = v26;

              if (!v14)
              {
                id v40 = 0;
                id v28 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowGenmoji" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v40];
                id v14 = v40;
                payloadAllowGenmoji = self->_payloadAllowGenmoji;
                self->_payloadAllowGenmoji = v28;

                if (!v14)
                {
                  id v39 = 0;
                  id v30 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowImagePlayground" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v39];
                  id v14 = v39;
                  payloadAllowImagePlayground = self->_payloadAllowImagePlayground;
                  self->_payloadAllowImagePlayground = v30;

                  if (!v14)
                  {
                    id v38 = 0;
                    id v32 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowImageWand" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v38];
                    id v14 = v38;
                    payloadAllowImageWand = self->_payloadAllowImageWand;
                    self->_payloadAllowImageWand = v32;

                    if (!v14)
                    {
                      id v37 = 0;
                      id v34 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowExternalIntelligenceIntegrations" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v37];
                      id v14 = v37;
                      payloadAllowExternalIntelligenceIntegrations = self->_payloadAllowExternalIntelligenceIntegrations;
                      self->_payloadAllowExternalIntelligenceIntegrations = v34;
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
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowAssistant" withValue:self->_payloadAllowAssistant isRequired:0 defaultValue:MEMORY[0x263EFFA88]];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowDictation" withValue:self->_payloadAllowDictation isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowAssistantUserGeneratedContent" withValue:self->_payloadAllowAssistantUserGeneratedContent isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"forceAssistantProfanityFilter" withValue:self->_payloadForceAssistantProfanityFilter isRequired:0 defaultValue:MEMORY[0x263EFFA80]];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowKeyboardMathSolving" withValue:self->_payloadAllowKeyboardMathSolving isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowMathPaperSolving" withValue:self->_payloadAllowMathPaperSolving isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowWritingTools" withValue:self->_payloadAllowWritingTools isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowGenmoji" withValue:self->_payloadAllowGenmoji isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowImagePlayground" withValue:self->_payloadAllowImagePlayground isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowImageWand" withValue:self->_payloadAllowImageWand isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowExternalIntelligenceIntegrations" withValue:self->_payloadAllowExternalIntelligenceIntegrations isRequired:0 defaultValue:v5];
  id v6 = (void *)[v4 copy];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v28.receiver = self;
  v28.super_class = (Class)CEMSystemSiriDeclaration;
  v4 = [(CEMDeclarationBase *)&v28 copyWithZone:a3];
  uint64_t v5 = [(NSNumber *)self->_payloadAllowAssistant copy];
  id v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(NSNumber *)self->_payloadAllowDictation copy];
  v8 = (void *)v4[10];
  v4[10] = v7;

  uint64_t v9 = [(NSNumber *)self->_payloadAllowAssistantUserGeneratedContent copy];
  v10 = (void *)v4[11];
  v4[11] = v9;

  uint64_t v11 = [(NSNumber *)self->_payloadForceAssistantProfanityFilter copy];
  v12 = (void *)v4[12];
  v4[12] = v11;

  uint64_t v13 = [(NSNumber *)self->_payloadAllowKeyboardMathSolving copy];
  id v14 = (void *)v4[13];
  v4[13] = v13;

  uint64_t v15 = [(NSNumber *)self->_payloadAllowMathPaperSolving copy];
  id v16 = (void *)v4[14];
  v4[14] = v15;

  uint64_t v17 = [(NSNumber *)self->_payloadAllowWritingTools copy];
  id v18 = (void *)v4[15];
  v4[15] = v17;

  uint64_t v19 = [(NSNumber *)self->_payloadAllowGenmoji copy];
  id v20 = (void *)v4[16];
  v4[16] = v19;

  uint64_t v21 = [(NSNumber *)self->_payloadAllowImagePlayground copy];
  id v22 = (void *)v4[17];
  v4[17] = v21;

  uint64_t v23 = [(NSNumber *)self->_payloadAllowImageWand copy];
  v24 = (void *)v4[18];
  v4[18] = v23;

  uint64_t v25 = [(NSNumber *)self->_payloadAllowExternalIntelligenceIntegrations copy];
  v26 = (void *)v4[19];
  v4[19] = v25;

  return v4;
}

- (NSNumber)payloadAllowAssistant
{
  return self->_payloadAllowAssistant;
}

- (void)setPayloadAllowAssistant:(id)a3
{
}

- (NSNumber)payloadAllowDictation
{
  return self->_payloadAllowDictation;
}

- (void)setPayloadAllowDictation:(id)a3
{
}

- (NSNumber)payloadAllowAssistantUserGeneratedContent
{
  return self->_payloadAllowAssistantUserGeneratedContent;
}

- (void)setPayloadAllowAssistantUserGeneratedContent:(id)a3
{
}

- (NSNumber)payloadForceAssistantProfanityFilter
{
  return self->_payloadForceAssistantProfanityFilter;
}

- (void)setPayloadForceAssistantProfanityFilter:(id)a3
{
}

- (NSNumber)payloadAllowKeyboardMathSolving
{
  return self->_payloadAllowKeyboardMathSolving;
}

- (void)setPayloadAllowKeyboardMathSolving:(id)a3
{
}

- (NSNumber)payloadAllowMathPaperSolving
{
  return self->_payloadAllowMathPaperSolving;
}

- (void)setPayloadAllowMathPaperSolving:(id)a3
{
}

- (NSNumber)payloadAllowWritingTools
{
  return self->_payloadAllowWritingTools;
}

- (void)setPayloadAllowWritingTools:(id)a3
{
}

- (NSNumber)payloadAllowGenmoji
{
  return self->_payloadAllowGenmoji;
}

- (void)setPayloadAllowGenmoji:(id)a3
{
}

- (NSNumber)payloadAllowImagePlayground
{
  return self->_payloadAllowImagePlayground;
}

- (void)setPayloadAllowImagePlayground:(id)a3
{
}

- (NSNumber)payloadAllowImageWand
{
  return self->_payloadAllowImageWand;
}

- (void)setPayloadAllowImageWand:(id)a3
{
}

- (NSNumber)payloadAllowExternalIntelligenceIntegrations
{
  return self->_payloadAllowExternalIntelligenceIntegrations;
}

- (void)setPayloadAllowExternalIntelligenceIntegrations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAllowExternalIntelligenceIntegrations, 0);
  objc_storeStrong((id *)&self->_payloadAllowImageWand, 0);
  objc_storeStrong((id *)&self->_payloadAllowImagePlayground, 0);
  objc_storeStrong((id *)&self->_payloadAllowGenmoji, 0);
  objc_storeStrong((id *)&self->_payloadAllowWritingTools, 0);
  objc_storeStrong((id *)&self->_payloadAllowMathPaperSolving, 0);
  objc_storeStrong((id *)&self->_payloadAllowKeyboardMathSolving, 0);
  objc_storeStrong((id *)&self->_payloadForceAssistantProfanityFilter, 0);
  objc_storeStrong((id *)&self->_payloadAllowAssistantUserGeneratedContent, 0);
  objc_storeStrong((id *)&self->_payloadAllowDictation, 0);

  objc_storeStrong((id *)&self->_payloadAllowAssistant, 0);
}

@end