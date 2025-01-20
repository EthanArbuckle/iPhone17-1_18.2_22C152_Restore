@interface CRCarPlayAppDeclaration
+ (id)declarationForAppProxy:(id)a3;
+ (id)declarationForAppRecord:(id)a3;
+ (id)declarationForBundleIdentifier:(id)a3 entitlements:(id)a4 infoPlist:(id)a5;
+ (id)declarationForBundleIdentifier:(id)a3 info:(id)a4 entitlements:(id)a5;
+ (id)declarationForBundleIdentifier:(id)a3 infoPropertyList:(id)a4 entitlementsPropertyList:(id)a5;
+ (id)declarationForBundleIdentifier:(id)a3 infoPropertyList:(id)a4 entitlementsPropertyList:(id)a5 bundlePath:(id)a6;
+ (id)requiredEntitlementKeys;
+ (id)requiredInfoKeys;
- (BOOL)isSystemApp;
- (BOOL)launchNotificationsUsingSiri;
- (BOOL)launchUsingSiri;
- (BOOL)requiresGeoSupport;
- (BOOL)supportsAudio;
- (BOOL)supportsCalling;
- (BOOL)supportsCharging;
- (BOOL)supportsCommunication;
- (BOOL)supportsDrivingTask;
- (BOOL)supportsFueling;
- (BOOL)supportsMaps;
- (BOOL)supportsMessaging;
- (BOOL)supportsParking;
- (BOOL)supportsPlayableContent;
- (BOOL)supportsPublicSafety;
- (BOOL)supportsQuickOrdering;
- (BOOL)supportsTemplates;
- (NSSet)autoMakerProtocols;
- (NSString)bundleIdentifier;
- (NSString)bundlePath;
- (unint64_t)_applicationCategory;
- (void)setAutoMakerProtocols:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setBundlePath:(id)a3;
- (void)setLaunchNotificationsUsingSiri:(BOOL)a3;
- (void)setLaunchUsingSiri:(BOOL)a3;
- (void)setRequiresGeoSupport:(BOOL)a3;
- (void)setSupportsAudio:(BOOL)a3;
- (void)setSupportsCalling:(BOOL)a3;
- (void)setSupportsCharging:(BOOL)a3;
- (void)setSupportsCommunication:(BOOL)a3;
- (void)setSupportsDrivingTask:(BOOL)a3;
- (void)setSupportsFueling:(BOOL)a3;
- (void)setSupportsMaps:(BOOL)a3;
- (void)setSupportsMessaging:(BOOL)a3;
- (void)setSupportsParking:(BOOL)a3;
- (void)setSupportsPlayableContent:(BOOL)a3;
- (void)setSupportsPublicSafety:(BOOL)a3;
- (void)setSupportsQuickOrdering:(BOOL)a3;
- (void)setSupportsTemplates:(BOOL)a3;
- (void)setSystemApp:(BOOL)a3;
- (void)set_applicationCategory:(unint64_t)a3;
@end

@implementation CRCarPlayAppDeclaration

+ (id)requiredInfoKeys
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"SBStarkLaunchModes"];
}

+ (id)requiredEntitlementKeys
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"CARCapableApp", @"SBStarkCapable", @"com.apple.developer.playable-content", @"com.apple.developer.carplay-messaging", @"com.apple.developer.carplay-calling", @"com.apple.developer.carplay-protocols", @"com.apple.developer.carplay-maps", @"com.apple.developer.carplay-audio", @"com.apple.developer.carplay-communication", @"com.apple.developer.carplay-charging", @"com.apple.developer.carplay-parking", @"com.apple.developer.carplay-quick-ordering", @"com.apple.developer.carplay-public-safety", @"com.apple.developer.carplay-fueling", @"com.apple.developer.carplay-driving-task", 0);
}

+ (id)declarationForBundleIdentifier:(id)a3 info:(id)a4 entitlements:(id)a5
{
  return (id)[a1 declarationForBundleIdentifier:a3 info:a4 entitlements:a5 bundlePath:0];
}

+ (id)declarationForAppProxy:(id)a3
{
  id v4 = a3;
  v5 = [v4 bundleIdentifier];
  v6 = [a1 requiredInfoKeys];
  v7 = [v4 objectsForInfoDictionaryKeys:v6];
  v8 = [a1 requiredEntitlementKeys];
  v9 = [v4 entitlementValuesForKeys:v8];
  v10 = [v4 bundleURL];

  v11 = [v10 path];
  v12 = [a1 declarationForBundleIdentifier:v5 infoPropertyList:v7 entitlementsPropertyList:v9 bundlePath:v11];

  return v12;
}

+ (id)declarationForBundleIdentifier:(id)a3 infoPropertyList:(id)a4 entitlementsPropertyList:(id)a5 bundlePath:(id)a6
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v45 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if (([v10 BOOLForKey:@"CARCapableApp"] & 1) != 0
    || [v10 BOOLForKey:@"SBStarkCapable"])
  {
    v12 = objc_alloc_init(CRCarPlayAppDeclaration);
    [(CRCarPlayAppDeclaration *)v12 setBundleIdentifier:v45];
    v13 = v12;
    [(CRCarPlayAppDeclaration *)v13 setSystemApp:1];

    v14 = [v9 objectForKey:@"SBStarkLaunchModes" ofClass:objc_opt_class()];
    if (v14)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v43 = v9;
        v42 = v14;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        id v15 = v14;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v50 objects:v55 count:16];
        if (!v16) {
          goto LABEL_22;
        }
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v51;
        while (1)
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v51 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = *(void **)(*((void *)&v50 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              if ([v20 isEqualToString:@"Siri"])
              {
                if (!v13)
                {
                  v13 = objc_alloc_init(CRCarPlayAppDeclaration);
                  [(CRCarPlayAppDeclaration *)v13 setBundleIdentifier:v45];
                }
                v13 = v13;
                [(CRCarPlayAppDeclaration *)v13 setLaunchUsingSiri:1];
              }
              else
              {
                if (![v20 isEqualToString:@"GeoSupported"]) {
                  continue;
                }
                if (!v13)
                {
                  v13 = objc_alloc_init(CRCarPlayAppDeclaration);
                  [(CRCarPlayAppDeclaration *)v13 setBundleIdentifier:v45];
                }
                v13 = v13;
                [(CRCarPlayAppDeclaration *)v13 setRequiresGeoSupport:1];
              }
            }
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v50 objects:v55 count:16];
          if (!v17)
          {
LABEL_22:

            id v9 = v43;
            v14 = v42;
            break;
          }
        }
      }
    }

    if (([v10 BOOLForKey:@"com.apple.developer.playable-content"] & 1) == 0)
    {
LABEL_29:
      if (([v10 BOOLForKey:@"com.apple.developer.carplay-messaging"] & 1) == 0) {
        goto LABEL_35;
      }
      if (v13)
      {
LABEL_34:
        v13 = v13;
        [(CRCarPlayAppDeclaration *)v13 setSupportsMessaging:1];

LABEL_35:
        if (([v10 BOOLForKey:@"com.apple.developer.carplay-calling"] & 1) == 0) {
          goto LABEL_39;
        }
        if (v13)
        {
LABEL_38:
          v13 = v13;
          [(CRCarPlayAppDeclaration *)v13 setSupportsCalling:1];

LABEL_39:
          if (([v10 BOOLForKey:@"com.apple.developer.carplay-maps"] & 1) == 0) {
            goto LABEL_45;
          }
          if (v13)
          {
LABEL_42:
            v21 = v13;
            [(CRCarPlayAppDeclaration *)v21 setSupportsMaps:1];

            if (!v21)
            {
              v21 = objc_alloc_init(CRCarPlayAppDeclaration);
              [(CRCarPlayAppDeclaration *)v21 setBundleIdentifier:v45];
            }
            v13 = v21;
            [(CRCarPlayAppDeclaration *)v13 setSupportsTemplates:1];

LABEL_45:
            if (([v10 BOOLForKey:@"com.apple.developer.carplay-audio"] & 1) == 0) {
              goto LABEL_51;
            }
            if (v13)
            {
LABEL_48:
              v22 = v13;
              [(CRCarPlayAppDeclaration *)v22 setSupportsAudio:1];

              if (!v22)
              {
                v22 = objc_alloc_init(CRCarPlayAppDeclaration);
                [(CRCarPlayAppDeclaration *)v22 setBundleIdentifier:v45];
              }
              v13 = v22;
              [(CRCarPlayAppDeclaration *)v13 setSupportsTemplates:1];

LABEL_51:
              if (([v10 BOOLForKey:@"com.apple.developer.carplay-communication"] & 1) == 0) {
                goto LABEL_57;
              }
              if (v13)
              {
LABEL_54:
                v23 = v13;
                [(CRCarPlayAppDeclaration *)v23 setSupportsCommunication:1];

                if (!v23)
                {
                  v23 = objc_alloc_init(CRCarPlayAppDeclaration);
                  [(CRCarPlayAppDeclaration *)v23 setBundleIdentifier:v45];
                }
                v13 = v23;
                [(CRCarPlayAppDeclaration *)v13 setSupportsTemplates:1];

LABEL_57:
                if (([v10 BOOLForKey:@"com.apple.developer.carplay-charging"] & 1) == 0) {
                  goto LABEL_63;
                }
                if (v13)
                {
LABEL_60:
                  v24 = v13;
                  [(CRCarPlayAppDeclaration *)v24 setSupportsCharging:1];

                  if (!v24)
                  {
                    v24 = objc_alloc_init(CRCarPlayAppDeclaration);
                    [(CRCarPlayAppDeclaration *)v24 setBundleIdentifier:v45];
                  }
                  v13 = v24;
                  [(CRCarPlayAppDeclaration *)v13 setSupportsTemplates:1];

LABEL_63:
                  if (([v10 BOOLForKey:@"com.apple.developer.carplay-parking"] & 1) == 0) {
                    goto LABEL_69;
                  }
                  if (v13)
                  {
LABEL_66:
                    v25 = v13;
                    [(CRCarPlayAppDeclaration *)v25 setSupportsParking:1];

                    if (!v25)
                    {
                      v25 = objc_alloc_init(CRCarPlayAppDeclaration);
                      [(CRCarPlayAppDeclaration *)v25 setBundleIdentifier:v45];
                    }
                    v13 = v25;
                    [(CRCarPlayAppDeclaration *)v13 setSupportsTemplates:1];

LABEL_69:
                    if (([v10 BOOLForKey:@"com.apple.developer.carplay-quick-ordering"] & 1) == 0) {
                      goto LABEL_75;
                    }
                    if (v13)
                    {
LABEL_72:
                      v26 = v13;
                      [(CRCarPlayAppDeclaration *)v26 setSupportsQuickOrdering:1];

                      if (!v26)
                      {
                        v26 = objc_alloc_init(CRCarPlayAppDeclaration);
                        [(CRCarPlayAppDeclaration *)v26 setBundleIdentifier:v45];
                      }
                      v13 = v26;
                      [(CRCarPlayAppDeclaration *)v13 setSupportsTemplates:1];

LABEL_75:
                      if (([v10 BOOLForKey:@"com.apple.developer.carplay-public-safety"] & 1) == 0) {
                        goto LABEL_81;
                      }
                      if (v13)
                      {
LABEL_78:
                        v27 = v13;
                        [(CRCarPlayAppDeclaration *)v27 setSupportsPublicSafety:1];

                        if (!v27)
                        {
                          v27 = objc_alloc_init(CRCarPlayAppDeclaration);
                          [(CRCarPlayAppDeclaration *)v27 setBundleIdentifier:v45];
                        }
                        v13 = v27;
                        [(CRCarPlayAppDeclaration *)v13 setSupportsTemplates:1];

LABEL_81:
                        if (([v10 BOOLForKey:@"com.apple.developer.carplay-fueling"] & 1) == 0) {
                          goto LABEL_87;
                        }
                        if (v13)
                        {
LABEL_84:
                          v28 = v13;
                          [(CRCarPlayAppDeclaration *)v28 setSupportsFueling:1];

                          if (!v28)
                          {
                            v28 = objc_alloc_init(CRCarPlayAppDeclaration);
                            [(CRCarPlayAppDeclaration *)v28 setBundleIdentifier:v45];
                          }
                          v13 = v28;
                          [(CRCarPlayAppDeclaration *)v13 setSupportsTemplates:1];

LABEL_87:
                          if (([v10 BOOLForKey:@"com.apple.developer.carplay-driving-task"] & 1) == 0) {
                            goto LABEL_93;
                          }
                          if (v13) {
                            goto LABEL_90;
                          }
                          goto LABEL_89;
                        }
LABEL_83:
                        v13 = objc_alloc_init(CRCarPlayAppDeclaration);
                        [(CRCarPlayAppDeclaration *)v13 setBundleIdentifier:v45];
                        goto LABEL_84;
                      }
LABEL_77:
                      v13 = objc_alloc_init(CRCarPlayAppDeclaration);
                      [(CRCarPlayAppDeclaration *)v13 setBundleIdentifier:v45];
                      goto LABEL_78;
                    }
LABEL_71:
                    v13 = objc_alloc_init(CRCarPlayAppDeclaration);
                    [(CRCarPlayAppDeclaration *)v13 setBundleIdentifier:v45];
                    goto LABEL_72;
                  }
LABEL_65:
                  v13 = objc_alloc_init(CRCarPlayAppDeclaration);
                  [(CRCarPlayAppDeclaration *)v13 setBundleIdentifier:v45];
                  goto LABEL_66;
                }
LABEL_59:
                v13 = objc_alloc_init(CRCarPlayAppDeclaration);
                [(CRCarPlayAppDeclaration *)v13 setBundleIdentifier:v45];
                goto LABEL_60;
              }
LABEL_53:
              v13 = objc_alloc_init(CRCarPlayAppDeclaration);
              [(CRCarPlayAppDeclaration *)v13 setBundleIdentifier:v45];
              goto LABEL_54;
            }
LABEL_47:
            v13 = objc_alloc_init(CRCarPlayAppDeclaration);
            [(CRCarPlayAppDeclaration *)v13 setBundleIdentifier:v45];
            goto LABEL_48;
          }
LABEL_41:
          v13 = objc_alloc_init(CRCarPlayAppDeclaration);
          [(CRCarPlayAppDeclaration *)v13 setBundleIdentifier:v45];
          goto LABEL_42;
        }
LABEL_37:
        v13 = objc_alloc_init(CRCarPlayAppDeclaration);
        [(CRCarPlayAppDeclaration *)v13 setBundleIdentifier:v45];
        goto LABEL_38;
      }
LABEL_33:
      v13 = objc_alloc_init(CRCarPlayAppDeclaration);
      [(CRCarPlayAppDeclaration *)v13 setBundleIdentifier:v45];
      goto LABEL_34;
    }
    if (v13)
    {
LABEL_28:
      v13 = v13;
      [(CRCarPlayAppDeclaration *)v13 setSupportsPlayableContent:1];

      goto LABEL_29;
    }
LABEL_27:
    v13 = objc_alloc_init(CRCarPlayAppDeclaration);
    [(CRCarPlayAppDeclaration *)v13 setBundleIdentifier:v45];
    goto LABEL_28;
  }
  if ([v10 BOOLForKey:@"com.apple.developer.playable-content"]) {
    goto LABEL_27;
  }
  if ([v10 BOOLForKey:@"com.apple.developer.carplay-messaging"]) {
    goto LABEL_33;
  }
  if ([v10 BOOLForKey:@"com.apple.developer.carplay-calling"]) {
    goto LABEL_37;
  }
  if ([v10 BOOLForKey:@"com.apple.developer.carplay-maps"]) {
    goto LABEL_41;
  }
  if ([v10 BOOLForKey:@"com.apple.developer.carplay-audio"]) {
    goto LABEL_47;
  }
  if ([v10 BOOLForKey:@"com.apple.developer.carplay-communication"]) {
    goto LABEL_53;
  }
  if ([v10 BOOLForKey:@"com.apple.developer.carplay-charging"]) {
    goto LABEL_59;
  }
  if ([v10 BOOLForKey:@"com.apple.developer.carplay-parking"]) {
    goto LABEL_65;
  }
  if ([v10 BOOLForKey:@"com.apple.developer.carplay-quick-ordering"]) {
    goto LABEL_71;
  }
  if ([v10 BOOLForKey:@"com.apple.developer.carplay-public-safety"]) {
    goto LABEL_77;
  }
  if ([v10 BOOLForKey:@"com.apple.developer.carplay-fueling"]) {
    goto LABEL_83;
  }
  if (([v10 BOOLForKey:@"com.apple.developer.carplay-driving-task"] & 1) == 0)
  {
    v13 = 0;
    goto LABEL_93;
  }
LABEL_89:
  v13 = objc_alloc_init(CRCarPlayAppDeclaration);
  [(CRCarPlayAppDeclaration *)v13 setBundleIdentifier:v45];
LABEL_90:
  v29 = v13;
  [(CRCarPlayAppDeclaration *)v29 setSupportsDrivingTask:1];

  if (!v29)
  {
    v29 = objc_alloc_init(CRCarPlayAppDeclaration);
    [(CRCarPlayAppDeclaration *)v29 setBundleIdentifier:v45];
  }
  v13 = v29;
  [(CRCarPlayAppDeclaration *)v13 setSupportsTemplates:1];

LABEL_93:
  v30 = [v10 objectForKey:@"com.apple.developer.carplay-protocols" ofClass:objc_opt_class()];
  v31 = v30;
  if (v30)
  {
    id v44 = v11;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    v32 = v30;
    uint64_t v33 = [(CRCarPlayAppDeclaration *)v32 countByEnumeratingWithState:&v46 objects:v54 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v47;
      while (2)
      {
        for (uint64_t j = 0; j != v34; ++j)
        {
          if (*(void *)v47 != v35) {
            objc_enumerationMutation(v32);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            uint64_t v38 = 0;
            goto LABEL_106;
          }
        }
        uint64_t v34 = [(CRCarPlayAppDeclaration *)v32 countByEnumeratingWithState:&v46 objects:v54 count:16];
        if (v34) {
          continue;
        }
        break;
      }
    }

    if (!v13)
    {
      v13 = objc_alloc_init(CRCarPlayAppDeclaration);
      [(CRCarPlayAppDeclaration *)v13 setBundleIdentifier:v45];
    }
    v13 = v13;
    v37 = [MEMORY[0x1E4F1CAD0] setWithArray:v32];
    [(CRCarPlayAppDeclaration *)v13 setAutoMakerProtocols:v37];

    uint64_t v38 = 32;
    v32 = v13;
LABEL_106:
    id v11 = v44;
  }
  else
  {
    uint64_t v38 = 0;
  }
  if ([v45 isEqualToString:@"com.apple.Maps"]) {
    v38 |= 8uLL;
  }
  if ([v45 isEqualToString:@"com.apple.mobilecal"]) {
    v38 |= 0x400uLL;
  }
  if (([v45 isEqualToString:@"com.apple.Music"] & 1) != 0
    || ([v45 isEqualToString:@"com.apple.iBooks"] & 1) != 0
    || ([v45 isEqualToString:@"com.apple.podcasts"] & 1) != 0
    || ([v10 BOOLForKey:@"com.apple.developer.playable-content"] & 1) != 0
    || [v10 BOOLForKey:@"com.apple.developer.carplay-audio"])
  {
    v38 |= 0x10uLL;
  }
  if (([v10 BOOLForKey:@"com.apple.developer.carplay-calling"] & 1) != 0
    || [v45 isEqualToString:@"com.apple.mobilephone"])
  {
    v38 |= 4uLL;
  }
  if (([v10 BOOLForKey:@"com.apple.developer.carplay-messaging"] & 1) != 0
    || [v45 isEqualToString:@"com.apple.MobileSMS"])
  {
    v38 |= 2uLL;
  }
  if ([v10 BOOLForKey:@"com.apple.developer.carplay-communication"]) {
    v38 |= 6uLL;
  }
  if ([v10 BOOLForKey:@"com.apple.developer.carplay-charging"]) {
    v38 |= 0x100uLL;
  }
  if ([v10 BOOLForKey:@"com.apple.developer.carplay-parking"]) {
    v38 |= 0x200uLL;
  }
  if ([v10 BOOLForKey:@"com.apple.developer.carplay-quick-ordering"]) {
    v38 |= 0x80uLL;
  }
  if ([v10 BOOLForKey:@"com.apple.developer.carplay-fueling"]) {
    v38 |= 0x800uLL;
  }
  if ([v10 BOOLForKey:@"com.apple.developer.carplay-driving-task"]) {
    uint64_t v39 = v38 | 0x1000;
  }
  else {
    uint64_t v39 = v38;
  }
  if (v39)
  {
    if (!v13)
    {
      v13 = objc_alloc_init(CRCarPlayAppDeclaration);
      [(CRCarPlayAppDeclaration *)v13 setBundleIdentifier:v45];
    }
    v13 = v13;
    [(CRCarPlayAppDeclaration *)v13 set_applicationCategory:v39];
  }
  if (v13) {
    [(CRCarPlayAppDeclaration *)v13 setBundlePath:v11];
  }
  v40 = v13;

  return v40;
}

+ (id)declarationForBundleIdentifier:(id)a3 infoPropertyList:(id)a4 entitlementsPropertyList:(id)a5
{
  return (id)[a1 declarationForBundleIdentifier:a3 infoPropertyList:a4 entitlementsPropertyList:a5 bundlePath:0];
}

+ (id)declarationForAppRecord:(id)a3
{
  id v4 = a3;
  v5 = [v4 bundleIdentifier];
  if (v5)
  {
    v6 = [v4 infoDictionary];
    v7 = [v4 entitlements];
    v8 = [a1 declarationForBundleIdentifier:v5 infoPropertyList:v6 entitlementsPropertyList:v7];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)declarationForBundleIdentifier:(id)a3 entitlements:(id)a4 infoPlist:(id)a5
{
  v8 = (objc_class *)MEMORY[0x1E4F223E8];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 alloc];
  v13 = [a1 requiredInfoKeys];
  v14 = (void *)[v12 _initWithKeys:v13 forDictionary:v9];

  id v15 = objc_alloc(MEMORY[0x1E4F223E8]);
  uint64_t v16 = [a1 requiredEntitlementKeys];
  uint64_t v17 = (void *)[v15 _initWithKeys:v16 forDictionary:v10];

  uint64_t v18 = [a1 declarationForBundleIdentifier:v11 info:v14 entitlements:v17];

  return v18;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (BOOL)isSystemApp
{
  return self->_systemApp;
}

- (void)setSystemApp:(BOOL)a3
{
  self->_systemApp = a3;
}

- (BOOL)requiresGeoSupport
{
  return self->_requiresGeoSupport;
}

- (void)setRequiresGeoSupport:(BOOL)a3
{
  self->_requiresGeoSupport = a3;
}

- (BOOL)launchUsingSiri
{
  return self->_launchUsingSiri;
}

- (void)setLaunchUsingSiri:(BOOL)a3
{
  self->_launchUsingSiruint64_t i = a3;
}

- (BOOL)launchNotificationsUsingSiri
{
  return self->_launchNotificationsUsingSiri;
}

- (void)setLaunchNotificationsUsingSiri:(BOOL)a3
{
  self->_launchNotificationsUsingSiruint64_t i = a3;
}

- (BOOL)supportsPlayableContent
{
  return self->_supportsPlayableContent;
}

- (void)setSupportsPlayableContent:(BOOL)a3
{
  self->_supportsPlayableContent = a3;
}

- (BOOL)supportsMessaging
{
  return self->_supportsMessaging;
}

- (void)setSupportsMessaging:(BOOL)a3
{
  self->_supportsMessaging = a3;
}

- (BOOL)supportsCalling
{
  return self->_supportsCalling;
}

- (void)setSupportsCalling:(BOOL)a3
{
  self->_supportsCalling = a3;
}

- (BOOL)supportsMaps
{
  return self->_supportsMaps;
}

- (void)setSupportsMaps:(BOOL)a3
{
  self->_supportsMaps = a3;
}

- (BOOL)supportsAudio
{
  return self->_supportsAudio;
}

- (void)setSupportsAudio:(BOOL)a3
{
  self->_supportsAudio = a3;
}

- (BOOL)supportsCommunication
{
  return self->_supportsCommunication;
}

- (void)setSupportsCommunication:(BOOL)a3
{
  self->_supportsCommunication = a3;
}

- (BOOL)supportsTemplates
{
  return self->_supportsTemplates;
}

- (void)setSupportsTemplates:(BOOL)a3
{
  self->_supportsTemplates = a3;
}

- (BOOL)supportsCharging
{
  return self->_supportsCharging;
}

- (void)setSupportsCharging:(BOOL)a3
{
  self->_supportsCharging = a3;
}

- (BOOL)supportsParking
{
  return self->_supportsParking;
}

- (void)setSupportsParking:(BOOL)a3
{
  self->_supportsParking = a3;
}

- (BOOL)supportsPublicSafety
{
  return self->_supportsPublicSafety;
}

- (void)setSupportsPublicSafety:(BOOL)a3
{
  self->_supportsPublicSafety = a3;
}

- (BOOL)supportsQuickOrdering
{
  return self->_supportsQuickOrdering;
}

- (void)setSupportsQuickOrdering:(BOOL)a3
{
  self->_supportsQuickOrdering = a3;
}

- (BOOL)supportsFueling
{
  return self->_supportsFueling;
}

- (void)setSupportsFueling:(BOOL)a3
{
  self->_supportsFueling = a3;
}

- (BOOL)supportsDrivingTask
{
  return self->_supportsDrivingTask;
}

- (void)setSupportsDrivingTask:(BOOL)a3
{
  self->_supportsDrivingTask = a3;
}

- (NSSet)autoMakerProtocols
{
  return self->_autoMakerProtocols;
}

- (void)setAutoMakerProtocols:(id)a3
{
}

- (unint64_t)_applicationCategory
{
  return self->__applicationCategory;
}

- (void)set_applicationCategory:(unint64_t)a3
{
  self->__applicationCategory = a3;
}

- (NSString)bundlePath
{
  return self->_bundlePath;
}

- (void)setBundlePath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundlePath, 0);
  objc_storeStrong((id *)&self->_autoMakerProtocols, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end