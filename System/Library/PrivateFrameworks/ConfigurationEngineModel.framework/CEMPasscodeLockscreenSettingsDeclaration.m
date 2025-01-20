@interface CEMPasscodeLockscreenSettingsDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3;
+ (id)buildWithIdentifier:(id)a3 withAllowVoiceDialing:(id)a4 withAllowAssistantWhileLocked:(id)a5 withAllowLockScreenTodayView:(id)a6 withAllowPassbookWhileLocked:(id)a7 withAllowLockScreenNotificationsView:(id)a8 withAllowLockScreenControlCenter:(id)a9 withAllowLockScreenWiFiModification:(id)a10;
+ (id)profileType;
+ (id)restrictionPayloadKeys;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)multipleAllowed;
- (BOOL)mustBeSupervised;
- (NSNumber)payloadAllowAssistantWhileLocked;
- (NSNumber)payloadAllowLockScreenControlCenter;
- (NSNumber)payloadAllowLockScreenNotificationsView;
- (NSNumber)payloadAllowLockScreenTodayView;
- (NSNumber)payloadAllowLockScreenWiFiModification;
- (NSNumber)payloadAllowPassbookWhileLocked;
- (NSNumber)payloadAllowVoiceDialing;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)activationLevel;
- (void)setPayloadAllowAssistantWhileLocked:(id)a3;
- (void)setPayloadAllowLockScreenControlCenter:(id)a3;
- (void)setPayloadAllowLockScreenNotificationsView:(id)a3;
- (void)setPayloadAllowLockScreenTodayView:(id)a3;
- (void)setPayloadAllowLockScreenWiFiModification:(id)a3;
- (void)setPayloadAllowPassbookWhileLocked:(id)a3;
- (void)setPayloadAllowVoiceDialing:(id)a3;
@end

@implementation CEMPasscodeLockscreenSettingsDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.passcode.lockscreen";
}

+ (id)profileType
{
  return &stru_26C838878;
}

+ (NSSet)allowedPayloadKeys
{
  v6[7] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"allowVoiceDialing";
  v6[1] = @"allowAssistantWhileLocked";
  v6[2] = @"allowLockScreenTodayView";
  v6[3] = @"allowPassbookWhileLocked";
  v6[4] = @"allowLockScreenNotificationsView";
  v6[5] = @"allowLockScreenControlCenter";
  v6[6] = @"allowLockScreenWiFiModification";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:7];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)restrictionPayloadKeys
{
  v6[7] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"allowVoiceDialing";
  v6[1] = @"allowAssistantWhileLocked";
  v6[2] = @"allowLockScreenTodayView";
  v6[3] = @"allowPassbookWhileLocked";
  v6[4] = @"allowLockScreenNotificationsView";
  v6[5] = @"allowLockScreenControlCenter";
  v6[6] = @"allowLockScreenWiFiModification";
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
  return 1;
}

- (int)activationLevel
{
  return 0;
}

- (id)assetReferences
{
  return (id)MEMORY[0x263EFFA68];
}

+ (id)buildWithIdentifier:(id)a3 withAllowVoiceDialing:(id)a4 withAllowAssistantWhileLocked:(id)a5 withAllowLockScreenTodayView:(id)a6 withAllowPassbookWhileLocked:(id)a7 withAllowLockScreenNotificationsView:(id)a8 withAllowLockScreenControlCenter:(id)a9 withAllowLockScreenWiFiModification:(id)a10
{
  id v15 = a3;
  id v34 = a10;
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  v22 = objc_opt_new();
  [v22 setDeclarationType:@"com.apple.configuration.passcode.lockscreen"];
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
  v25 = (void *)MEMORY[0x263EFFA88];
  if (v21) {
    id v26 = v21;
  }
  else {
    id v26 = (id)MEMORY[0x263EFFA88];
  }
  [v22 setPayloadAllowVoiceDialing:v26];

  if (v20) {
    id v27 = v20;
  }
  else {
    id v27 = v25;
  }
  [v22 setPayloadAllowAssistantWhileLocked:v27];

  if (v19) {
    id v28 = v19;
  }
  else {
    id v28 = v25;
  }
  [v22 setPayloadAllowLockScreenTodayView:v28];

  if (v18) {
    id v29 = v18;
  }
  else {
    id v29 = v25;
  }
  [v22 setPayloadAllowPassbookWhileLocked:v29];

  if (v17) {
    id v30 = v17;
  }
  else {
    id v30 = v25;
  }
  [v22 setPayloadAllowLockScreenNotificationsView:v30];

  if (v16) {
    id v31 = v16;
  }
  else {
    id v31 = v25;
  }
  [v22 setPayloadAllowLockScreenControlCenter:v31];

  if (v34) {
    id v32 = v34;
  }
  else {
    id v32 = v25;
  }
  [v22 setPayloadAllowLockScreenWiFiModification:v32];

  [v22 updateServerHash];

  return v22;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setDeclarationType:@"com.apple.configuration.passcode.lockscreen"];
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

  v10 = +[CEMPasscodeLockscreenSettingsDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v35 = 0;
  v13 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowVoiceDialing" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v35];
  id v14 = v35;
  payloadAllowVoiceDialing = self->_payloadAllowVoiceDialing;
  self->_payloadAllowVoiceDialing = v13;

  if (!v14)
  {
    id v34 = 0;
    id v16 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowAssistantWhileLocked" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v34];
    id v14 = v34;
    payloadAllowAssistantWhileLocked = self->_payloadAllowAssistantWhileLocked;
    self->_payloadAllowAssistantWhileLocked = v16;

    if (!v14)
    {
      id v33 = 0;
      id v18 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowLockScreenTodayView" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v33];
      id v14 = v33;
      payloadAllowLockScreenTodayView = self->_payloadAllowLockScreenTodayView;
      self->_payloadAllowLockScreenTodayView = v18;

      if (!v14)
      {
        id v32 = 0;
        id v20 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowPassbookWhileLocked" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v32];
        id v14 = v32;
        payloadAllowPassbookWhileLocked = self->_payloadAllowPassbookWhileLocked;
        self->_payloadAllowPassbookWhileLocked = v20;

        if (!v14)
        {
          id v31 = 0;
          v22 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowLockScreenNotificationsView" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v31];
          id v14 = v31;
          payloadAllowLockScreenNotificationsView = self->_payloadAllowLockScreenNotificationsView;
          self->_payloadAllowLockScreenNotificationsView = v22;

          if (!v14)
          {
            id v30 = 0;
            v24 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowLockScreenControlCenter" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v30];
            id v14 = v30;
            payloadAllowLockScreenControlCenter = self->_payloadAllowLockScreenControlCenter;
            self->_payloadAllowLockScreenControlCenter = v24;

            if (!v14)
            {
              id v29 = 0;
              id v26 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowLockScreenWiFiModification" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v29];
              id v14 = v29;
              payloadAllowLockScreenWiFiModification = self->_payloadAllowLockScreenWiFiModification;
              self->_payloadAllowLockScreenWiFiModification = v26;
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
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowVoiceDialing" withValue:self->_payloadAllowVoiceDialing isRequired:0 defaultValue:MEMORY[0x263EFFA88]];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowAssistantWhileLocked" withValue:self->_payloadAllowAssistantWhileLocked isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowLockScreenTodayView" withValue:self->_payloadAllowLockScreenTodayView isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowPassbookWhileLocked" withValue:self->_payloadAllowPassbookWhileLocked isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowLockScreenNotificationsView" withValue:self->_payloadAllowLockScreenNotificationsView isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowLockScreenControlCenter" withValue:self->_payloadAllowLockScreenControlCenter isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowLockScreenWiFiModification" withValue:self->_payloadAllowLockScreenWiFiModification isRequired:0 defaultValue:v5];
  id v6 = (void *)[v4 copy];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v20.receiver = self;
  v20.super_class = (Class)CEMPasscodeLockscreenSettingsDeclaration;
  v4 = [(CEMDeclarationBase *)&v20 copyWithZone:a3];
  uint64_t v5 = [(NSNumber *)self->_payloadAllowVoiceDialing copy];
  id v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(NSNumber *)self->_payloadAllowAssistantWhileLocked copy];
  v8 = (void *)v4[10];
  v4[10] = v7;

  uint64_t v9 = [(NSNumber *)self->_payloadAllowLockScreenTodayView copy];
  v10 = (void *)v4[11];
  v4[11] = v9;

  uint64_t v11 = [(NSNumber *)self->_payloadAllowPassbookWhileLocked copy];
  v12 = (void *)v4[12];
  v4[12] = v11;

  uint64_t v13 = [(NSNumber *)self->_payloadAllowLockScreenNotificationsView copy];
  id v14 = (void *)v4[13];
  v4[13] = v13;

  uint64_t v15 = [(NSNumber *)self->_payloadAllowLockScreenControlCenter copy];
  id v16 = (void *)v4[14];
  v4[14] = v15;

  uint64_t v17 = [(NSNumber *)self->_payloadAllowLockScreenWiFiModification copy];
  id v18 = (void *)v4[15];
  v4[15] = v17;

  return v4;
}

- (NSNumber)payloadAllowVoiceDialing
{
  return self->_payloadAllowVoiceDialing;
}

- (void)setPayloadAllowVoiceDialing:(id)a3
{
}

- (NSNumber)payloadAllowAssistantWhileLocked
{
  return self->_payloadAllowAssistantWhileLocked;
}

- (void)setPayloadAllowAssistantWhileLocked:(id)a3
{
}

- (NSNumber)payloadAllowLockScreenTodayView
{
  return self->_payloadAllowLockScreenTodayView;
}

- (void)setPayloadAllowLockScreenTodayView:(id)a3
{
}

- (NSNumber)payloadAllowPassbookWhileLocked
{
  return self->_payloadAllowPassbookWhileLocked;
}

- (void)setPayloadAllowPassbookWhileLocked:(id)a3
{
}

- (NSNumber)payloadAllowLockScreenNotificationsView
{
  return self->_payloadAllowLockScreenNotificationsView;
}

- (void)setPayloadAllowLockScreenNotificationsView:(id)a3
{
}

- (NSNumber)payloadAllowLockScreenControlCenter
{
  return self->_payloadAllowLockScreenControlCenter;
}

- (void)setPayloadAllowLockScreenControlCenter:(id)a3
{
}

- (NSNumber)payloadAllowLockScreenWiFiModification
{
  return self->_payloadAllowLockScreenWiFiModification;
}

- (void)setPayloadAllowLockScreenWiFiModification:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAllowLockScreenWiFiModification, 0);
  objc_storeStrong((id *)&self->_payloadAllowLockScreenControlCenter, 0);
  objc_storeStrong((id *)&self->_payloadAllowLockScreenNotificationsView, 0);
  objc_storeStrong((id *)&self->_payloadAllowPassbookWhileLocked, 0);
  objc_storeStrong((id *)&self->_payloadAllowLockScreenTodayView, 0);
  objc_storeStrong((id *)&self->_payloadAllowAssistantWhileLocked, 0);

  objc_storeStrong((id *)&self->_payloadAllowVoiceDialing, 0);
}

@end