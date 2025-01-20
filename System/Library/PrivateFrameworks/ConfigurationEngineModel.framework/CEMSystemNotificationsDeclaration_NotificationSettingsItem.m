@interface CEMSystemNotificationsDeclaration_NotificationSettingsItem
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnlyWithBundleIdentifier:(id)a3;
+ (id)buildWithBundleIdentifier:(id)a3 withNotificationsEnabled:(id)a4 withShowInNotificationCenter:(id)a5 withShowInLockScreen:(id)a6 withAlertType:(id)a7 withBadgesEnabled:(id)a8 withSoundsEnabled:(id)a9 withShowInCarPlay:(id)a10 withEmergencyEnabled:(id)a11 withCriticalAlertEnabled:(id)a12 withGroupingType:(id)a13;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSNumber)payloadAlertType;
- (NSNumber)payloadBadgesEnabled;
- (NSNumber)payloadCriticalAlertEnabled;
- (NSNumber)payloadEmergencyEnabled;
- (NSNumber)payloadGroupingType;
- (NSNumber)payloadNotificationsEnabled;
- (NSNumber)payloadShowInCarPlay;
- (NSNumber)payloadShowInLockScreen;
- (NSNumber)payloadShowInNotificationCenter;
- (NSNumber)payloadSoundsEnabled;
- (NSString)payloadBundleIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadAlertType:(id)a3;
- (void)setPayloadBadgesEnabled:(id)a3;
- (void)setPayloadBundleIdentifier:(id)a3;
- (void)setPayloadCriticalAlertEnabled:(id)a3;
- (void)setPayloadEmergencyEnabled:(id)a3;
- (void)setPayloadGroupingType:(id)a3;
- (void)setPayloadNotificationsEnabled:(id)a3;
- (void)setPayloadShowInCarPlay:(id)a3;
- (void)setPayloadShowInLockScreen:(id)a3;
- (void)setPayloadShowInNotificationCenter:(id)a3;
- (void)setPayloadSoundsEnabled:(id)a3;
@end

@implementation CEMSystemNotificationsDeclaration_NotificationSettingsItem

+ (NSSet)allowedPayloadKeys
{
  v6[11] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"BundleIdentifier";
  v6[1] = @"NotificationsEnabled";
  v6[2] = @"ShowInNotificationCenter";
  v6[3] = @"ShowInLockScreen";
  v6[4] = @"AlertType";
  v6[5] = @"BadgesEnabled";
  v6[6] = @"SoundsEnabled";
  v6[7] = @"ShowInCarPlay";
  v6[8] = @"EmergencyEnabled";
  v6[9] = @"CriticalAlertEnabled";
  v6[10] = @"GroupingType";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:11];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithBundleIdentifier:(id)a3 withNotificationsEnabled:(id)a4 withShowInNotificationCenter:(id)a5 withShowInLockScreen:(id)a6 withAlertType:(id)a7 withBadgesEnabled:(id)a8 withSoundsEnabled:(id)a9 withShowInCarPlay:(id)a10 withEmergencyEnabled:(id)a11 withCriticalAlertEnabled:(id)a12 withGroupingType:(id)a13
{
  id v43 = a13;
  id v42 = a12;
  id v41 = a11;
  id v18 = a10;
  id v19 = a9;
  id v20 = a8;
  id v21 = a7;
  id v22 = a6;
  id v23 = a5;
  id v24 = a4;
  id v25 = a3;
  v26 = objc_opt_new();
  [v26 setPayloadBundleIdentifier:v25];

  v27 = (void *)MEMORY[0x263EFFA88];
  if (v24) {
    id v28 = v24;
  }
  else {
    id v28 = (id)MEMORY[0x263EFFA88];
  }
  objc_msgSend(v26, "setPayloadNotificationsEnabled:", v28, a3);

  if (v23) {
    id v29 = v23;
  }
  else {
    id v29 = v27;
  }
  [v26 setPayloadShowInNotificationCenter:v29];

  if (v22) {
    id v30 = v22;
  }
  else {
    id v30 = v27;
  }
  [v26 setPayloadShowInLockScreen:v30];

  if (v21) {
    v31 = v21;
  }
  else {
    v31 = &unk_26C894970;
  }
  [v26 setPayloadAlertType:v31];

  if (v20) {
    id v32 = v20;
  }
  else {
    id v32 = v27;
  }
  [v26 setPayloadBadgesEnabled:v32];

  if (v19) {
    id v33 = v19;
  }
  else {
    id v33 = v27;
  }
  [v26 setPayloadSoundsEnabled:v33];

  if (v18) {
    id v34 = v18;
  }
  else {
    id v34 = v27;
  }
  [v26 setPayloadShowInCarPlay:v34];

  v35 = (void *)MEMORY[0x263EFFA80];
  if (v41) {
    id v36 = v41;
  }
  else {
    id v36 = (id)MEMORY[0x263EFFA80];
  }
  [v26 setPayloadEmergencyEnabled:v36];

  if (v42) {
    id v37 = v42;
  }
  else {
    id v37 = v35;
  }
  [v26 setPayloadCriticalAlertEnabled:v37];

  if (v43) {
    v38 = v43;
  }
  else {
    v38 = &unk_26C894988;
  }
  [v26 setPayloadGroupingType:v38];

  return v26;
}

+ (id)buildRequiredOnlyWithBundleIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setPayloadBundleIdentifier:v3];

  return v4;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMSystemNotificationsDeclaration_NotificationSettingsItem allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  id v47 = 0;
  v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"BundleIdentifier" isRequired:1 defaultValue:0 error:&v47];
  id v14 = v47;
  payloadBundleIdentifier = self->_payloadBundleIdentifier;
  self->_payloadBundleIdentifier = v13;

  if (!v14)
  {
    id v46 = 0;
    v16 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"NotificationsEnabled" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v46];
    id v14 = v46;
    payloadNotificationsEnabled = self->_payloadNotificationsEnabled;
    self->_payloadNotificationsEnabled = v16;

    if (!v14)
    {
      id v45 = 0;
      id v18 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"ShowInNotificationCenter" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v45];
      id v14 = v45;
      payloadShowInNotificationCenter = self->_payloadShowInNotificationCenter;
      self->_payloadShowInNotificationCenter = v18;

      if (!v14)
      {
        id v44 = 0;
        id v20 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"ShowInLockScreen" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v44];
        id v14 = v44;
        payloadShowInLockScreen = self->_payloadShowInLockScreen;
        self->_payloadShowInLockScreen = v20;

        if (!v14)
        {
          id v43 = 0;
          id v22 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"AlertType" isRequired:0 defaultValue:&unk_26C894970 error:&v43];
          id v14 = v43;
          payloadAlertType = self->_payloadAlertType;
          self->_payloadAlertType = v22;

          if (!v14)
          {
            id v42 = 0;
            id v24 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"BadgesEnabled" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v42];
            id v14 = v42;
            payloadBadgesEnabled = self->_payloadBadgesEnabled;
            self->_payloadBadgesEnabled = v24;

            if (!v14)
            {
              id v41 = 0;
              v26 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"SoundsEnabled" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v41];
              id v14 = v41;
              payloadSoundsEnabled = self->_payloadSoundsEnabled;
              self->_payloadSoundsEnabled = v26;

              if (!v14)
              {
                id v40 = 0;
                id v28 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"ShowInCarPlay" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v40];
                id v14 = v40;
                payloadShowInCarPlay = self->_payloadShowInCarPlay;
                self->_payloadShowInCarPlay = v28;

                if (!v14)
                {
                  id v39 = 0;
                  id v30 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"EmergencyEnabled" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v39];
                  id v14 = v39;
                  payloadEmergencyEnabled = self->_payloadEmergencyEnabled;
                  self->_payloadEmergencyEnabled = v30;

                  if (!v14)
                  {
                    id v38 = 0;
                    id v32 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"CriticalAlertEnabled" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v38];
                    id v14 = v38;
                    payloadCriticalAlertEnabled = self->_payloadCriticalAlertEnabled;
                    self->_payloadCriticalAlertEnabled = v32;

                    if (!v14)
                    {
                      id v37 = 0;
                      id v34 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"GroupingType" isRequired:0 defaultValue:&unk_26C894988 error:&v37];
                      id v14 = v37;
                      payloadGroupingType = self->_payloadGroupingType;
                      self->_payloadGroupingType = v34;
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
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"BundleIdentifier" withValue:self->_payloadBundleIdentifier isRequired:1 defaultValue:0];
  uint64_t v5 = MEMORY[0x263EFFA88];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"NotificationsEnabled" withValue:self->_payloadNotificationsEnabled isRequired:0 defaultValue:MEMORY[0x263EFFA88]];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"ShowInNotificationCenter" withValue:self->_payloadShowInNotificationCenter isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"ShowInLockScreen" withValue:self->_payloadShowInLockScreen isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v4 withKey:@"AlertType" withValue:self->_payloadAlertType isRequired:0 defaultValue:&unk_26C894970];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"BadgesEnabled" withValue:self->_payloadBadgesEnabled isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"SoundsEnabled" withValue:self->_payloadSoundsEnabled isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"ShowInCarPlay" withValue:self->_payloadShowInCarPlay isRequired:0 defaultValue:v5];
  uint64_t v6 = MEMORY[0x263EFFA80];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"EmergencyEnabled" withValue:self->_payloadEmergencyEnabled isRequired:0 defaultValue:MEMORY[0x263EFFA80]];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"CriticalAlertEnabled" withValue:self->_payloadCriticalAlertEnabled isRequired:0 defaultValue:v6];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v4 withKey:@"GroupingType" withValue:self->_payloadGroupingType isRequired:0 defaultValue:&unk_26C894988];
  v7 = (void *)[v4 copy];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v28.receiver = self;
  v28.super_class = (Class)CEMSystemNotificationsDeclaration_NotificationSettingsItem;
  v4 = [(CEMPayloadBase *)&v28 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadBundleIdentifier copy];
  uint64_t v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSNumber *)self->_payloadNotificationsEnabled copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSNumber *)self->_payloadShowInNotificationCenter copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSNumber *)self->_payloadShowInLockScreen copy];
  v12 = (void *)v4[5];
  v4[5] = v11;

  uint64_t v13 = [(NSNumber *)self->_payloadAlertType copy];
  id v14 = (void *)v4[6];
  v4[6] = v13;

  uint64_t v15 = [(NSNumber *)self->_payloadBadgesEnabled copy];
  v16 = (void *)v4[7];
  v4[7] = v15;

  uint64_t v17 = [(NSNumber *)self->_payloadSoundsEnabled copy];
  id v18 = (void *)v4[8];
  v4[8] = v17;

  uint64_t v19 = [(NSNumber *)self->_payloadShowInCarPlay copy];
  id v20 = (void *)v4[9];
  v4[9] = v19;

  uint64_t v21 = [(NSNumber *)self->_payloadEmergencyEnabled copy];
  id v22 = (void *)v4[10];
  v4[10] = v21;

  uint64_t v23 = [(NSNumber *)self->_payloadCriticalAlertEnabled copy];
  id v24 = (void *)v4[11];
  v4[11] = v23;

  uint64_t v25 = [(NSNumber *)self->_payloadGroupingType copy];
  v26 = (void *)v4[12];
  v4[12] = v25;

  return v4;
}

- (NSString)payloadBundleIdentifier
{
  return self->_payloadBundleIdentifier;
}

- (void)setPayloadBundleIdentifier:(id)a3
{
}

- (NSNumber)payloadNotificationsEnabled
{
  return self->_payloadNotificationsEnabled;
}

- (void)setPayloadNotificationsEnabled:(id)a3
{
}

- (NSNumber)payloadShowInNotificationCenter
{
  return self->_payloadShowInNotificationCenter;
}

- (void)setPayloadShowInNotificationCenter:(id)a3
{
}

- (NSNumber)payloadShowInLockScreen
{
  return self->_payloadShowInLockScreen;
}

- (void)setPayloadShowInLockScreen:(id)a3
{
}

- (NSNumber)payloadAlertType
{
  return self->_payloadAlertType;
}

- (void)setPayloadAlertType:(id)a3
{
}

- (NSNumber)payloadBadgesEnabled
{
  return self->_payloadBadgesEnabled;
}

- (void)setPayloadBadgesEnabled:(id)a3
{
}

- (NSNumber)payloadSoundsEnabled
{
  return self->_payloadSoundsEnabled;
}

- (void)setPayloadSoundsEnabled:(id)a3
{
}

- (NSNumber)payloadShowInCarPlay
{
  return self->_payloadShowInCarPlay;
}

- (void)setPayloadShowInCarPlay:(id)a3
{
}

- (NSNumber)payloadEmergencyEnabled
{
  return self->_payloadEmergencyEnabled;
}

- (void)setPayloadEmergencyEnabled:(id)a3
{
}

- (NSNumber)payloadCriticalAlertEnabled
{
  return self->_payloadCriticalAlertEnabled;
}

- (void)setPayloadCriticalAlertEnabled:(id)a3
{
}

- (NSNumber)payloadGroupingType
{
  return self->_payloadGroupingType;
}

- (void)setPayloadGroupingType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadGroupingType, 0);
  objc_storeStrong((id *)&self->_payloadCriticalAlertEnabled, 0);
  objc_storeStrong((id *)&self->_payloadEmergencyEnabled, 0);
  objc_storeStrong((id *)&self->_payloadShowInCarPlay, 0);
  objc_storeStrong((id *)&self->_payloadSoundsEnabled, 0);
  objc_storeStrong((id *)&self->_payloadBadgesEnabled, 0);
  objc_storeStrong((id *)&self->_payloadAlertType, 0);
  objc_storeStrong((id *)&self->_payloadShowInLockScreen, 0);
  objc_storeStrong((id *)&self->_payloadShowInNotificationCenter, 0);
  objc_storeStrong((id *)&self->_payloadNotificationsEnabled, 0);

  objc_storeStrong((id *)&self->_payloadBundleIdentifier, 0);
}

@end