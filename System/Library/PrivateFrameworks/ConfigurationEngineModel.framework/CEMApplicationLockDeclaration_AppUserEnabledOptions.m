@interface CEMApplicationLockDeclaration_AppUserEnabledOptions
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnly;
+ (id)buildWithVoiceOver:(id)a3 withZoom:(id)a4 withInvertColors:(id)a5 withAssistiveTouch:(id)a6;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSNumber)payloadAssistiveTouch;
- (NSNumber)payloadInvertColors;
- (NSNumber)payloadVoiceOver;
- (NSNumber)payloadZoom;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadAssistiveTouch:(id)a3;
- (void)setPayloadInvertColors:(id)a3;
- (void)setPayloadVoiceOver:(id)a3;
- (void)setPayloadZoom:(id)a3;
@end

@implementation CEMApplicationLockDeclaration_AppUserEnabledOptions

+ (NSSet)allowedPayloadKeys
{
  v6[4] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"VoiceOver";
  v6[1] = @"Zoom";
  v6[2] = @"InvertColors";
  v6[3] = @"AssistiveTouch";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithVoiceOver:(id)a3 withZoom:(id)a4 withInvertColors:(id)a5 withAssistiveTouch:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = objc_opt_new();
  v14 = v13;
  v15 = (void *)MEMORY[0x263EFFA80];
  if (v12) {
    id v16 = v12;
  }
  else {
    id v16 = (id)MEMORY[0x263EFFA80];
  }
  [v13 setPayloadVoiceOver:v16];

  if (v11) {
    id v17 = v11;
  }
  else {
    id v17 = v15;
  }
  [v14 setPayloadZoom:v17];

  if (v10) {
    id v18 = v10;
  }
  else {
    id v18 = v15;
  }
  [v14 setPayloadInvertColors:v18];

  if (v9) {
    id v19 = v9;
  }
  else {
    id v19 = v15;
  }
  [v14 setPayloadAssistiveTouch:v19];

  return v14;
}

+ (id)buildRequiredOnly
{
  v2 = objc_opt_new();

  return v2;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  id v9 = [v7 setWithArray:v8];

  id v10 = +[CEMApplicationLockDeclaration_AppUserEnabledOptions allowedPayloadKeys];
  [v9 minusSet:v10];

  id v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  id v26 = 0;
  v13 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"VoiceOver" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v26];
  id v14 = v26;
  payloadVoiceOver = self->_payloadVoiceOver;
  self->_payloadVoiceOver = v13;

  if (!v14)
  {
    id v25 = 0;
    id v16 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"Zoom" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v25];
    id v14 = v25;
    payloadZoom = self->_payloadZoom;
    self->_payloadZoom = v16;

    if (!v14)
    {
      id v24 = 0;
      id v18 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"InvertColors" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v24];
      id v14 = v24;
      payloadInvertColors = self->_payloadInvertColors;
      self->_payloadInvertColors = v18;

      if (!v14)
      {
        id v23 = 0;
        v20 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"AssistiveTouch" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v23];
        id v14 = v23;
        payloadAssistiveTouch = self->_payloadAssistiveTouch;
        self->_payloadAssistiveTouch = v20;
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
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"VoiceOver" withValue:self->_payloadVoiceOver isRequired:0 defaultValue:MEMORY[0x263EFFA80]];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"Zoom" withValue:self->_payloadZoom isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"InvertColors" withValue:self->_payloadInvertColors isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"AssistiveTouch" withValue:self->_payloadAssistiveTouch isRequired:0 defaultValue:v5];
  id v6 = (void *)[v4 copy];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CEMApplicationLockDeclaration_AppUserEnabledOptions;
  v4 = [(CEMPayloadBase *)&v14 copyWithZone:a3];
  uint64_t v5 = [(NSNumber *)self->_payloadVoiceOver copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSNumber *)self->_payloadZoom copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSNumber *)self->_payloadInvertColors copy];
  id v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSNumber *)self->_payloadAssistiveTouch copy];
  id v12 = (void *)v4[5];
  v4[5] = v11;

  return v4;
}

- (NSNumber)payloadVoiceOver
{
  return self->_payloadVoiceOver;
}

- (void)setPayloadVoiceOver:(id)a3
{
}

- (NSNumber)payloadZoom
{
  return self->_payloadZoom;
}

- (void)setPayloadZoom:(id)a3
{
}

- (NSNumber)payloadInvertColors
{
  return self->_payloadInvertColors;
}

- (void)setPayloadInvertColors:(id)a3
{
}

- (NSNumber)payloadAssistiveTouch
{
  return self->_payloadAssistiveTouch;
}

- (void)setPayloadAssistiveTouch:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAssistiveTouch, 0);
  objc_storeStrong((id *)&self->_payloadInvertColors, 0);
  objc_storeStrong((id *)&self->_payloadZoom, 0);

  objc_storeStrong((id *)&self->_payloadVoiceOver, 0);
}

@end