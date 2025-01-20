@interface CCUISensorAttributionEntity
+ (id)attributionEntityFromSensorActivityData:(id)a3;
+ (id)genericLocationSystemServiceEntity;
- (BOOL)isContinuityCaptureExtension;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGenericLocationSystemServiceEntity;
- (BOOL)isKeyboardCameraEntity;
- (BOOL)isSetupApp;
- (BOOL)isSiriAndDictationEntity;
- (BOOL)isSystemService;
- (BOOL)isWalletSpecialEntity;
- (NSString)bundleIdentifier;
- (NSString)displayNameForCompactView;
- (NSString)executableDisplayName;
- (id)debugDescription;
- (unint64_t)hash;
- (void)setBundleIdentifier:(id)a3;
- (void)setExecutableDisplayName:(id)a3;
- (void)setIsSystemService:(BOOL)a3;
@end

@implementation CCUISensorAttributionEntity

uint64_t __39__CCUISensorAttributionEntity_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) isSystemService];
}

uint64_t __39__CCUISensorAttributionEntity_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) executableDisplayName];
}

uint64_t __39__CCUISensorAttributionEntity_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) bundleIdentifier];
}

- (NSString)displayNameForCompactView
{
  if ([(NSString *)self->_bundleIdentifier isEqualToString:@"com.apple.mobilesafari"])
  {
    v3 = [MEMORY[0x1E4F28B50] bundleForClass:NSClassFromString(&cfstr_Ccuisensoracti.isa)];
    v4 = [v3 localizedStringForKey:@"CONTROL_CENTER_SENSOR_SAFARI_WEBSITES" value:&stru_1F3016698 table:@"ControlCenterUI"];
  }
  else
  {
    v4 = [(CCUISensorAttributionEntity *)self executableDisplayName];
  }
  return (NSString *)v4;
}

- (BOOL)isContinuityCaptureExtension
{
  v2 = [(CCUISensorAttributionEntity *)self bundleIdentifier];
  char v3 = [v2 isEqualToString:@"com.apple.sidecar.extension.capture"];

  return v3;
}

- (BOOL)isKeyboardCameraEntity
{
  v2 = [(CCUISensorAttributionEntity *)self bundleIdentifier];
  char v3 = [v2 isEqualToString:@"com.apple.VisionKit.KeyboardCamera"];

  return v3;
}

- (BOOL)isWalletSpecialEntity
{
  v2 = [(CCUISensorAttributionEntity *)self bundleIdentifier];
  char v3 = [v2 isEqualToString:@"com.apple.PassKitCore"];

  return v3;
}

- (BOOL)isSetupApp
{
  v2 = [(CCUISensorAttributionEntity *)self bundleIdentifier];
  char v3 = [v2 isEqualToString:@"com.apple.purplebuddy"];

  return v3;
}

- (BOOL)isGenericLocationSystemServiceEntity
{
  v2 = [(CCUISensorAttributionEntity *)self bundleIdentifier];
  char v3 = [v2 isEqualToString:@"com.apple.locationSystemServices"];

  return v3;
}

- (BOOL)isSiriAndDictationEntity
{
  v2 = [(CCUISensorAttributionEntity *)self bundleIdentifier];
  char v3 = [v2 isEqualToString:@"com.apple.AssistantServices"];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_executableDisplayName, 0);
}

- (unint64_t)hash
{
  char v3 = [MEMORY[0x1E4F4F758] builder];
  v4 = [(CCUISensorAttributionEntity *)self bundleIdentifier];
  id v5 = (id)[v3 appendObject:v4];

  v6 = [(CCUISensorAttributionEntity *)self executableDisplayName];
  id v7 = (id)[v3 appendObject:v6];

  id v8 = (id)objc_msgSend(v3, "appendBool:", -[CCUISensorAttributionEntity isSystemService](self, "isSystemService"));
  unint64_t v9 = [v3 hash];

  return v9;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)executableDisplayName
{
  return self->_executableDisplayName;
}

- (BOOL)isSystemService
{
  return self->_isSystemService;
}

+ (id)attributionEntityFromSensorActivityData:(id)a3
{
  id v3 = a3;
  if ([v3 sensorType] == 2 && objc_msgSend(v3, "isSystemService"))
  {
    v4 = [(id)objc_opt_class() genericLocationSystemServiceEntity];
  }
  else
  {
    v4 = objc_alloc_init(CCUISensorAttributionEntity);
    id v5 = [v3 executableDisplayName];
    [(CCUISensorAttributionEntity *)v4 setExecutableDisplayName:v5];

    v6 = [v3 bundleIdentifier];
    [(CCUISensorAttributionEntity *)v4 setBundleIdentifier:v6];

    -[CCUISensorAttributionEntity setIsSystemService:](v4, "setIsSystemService:", [v3 isSystemService]);
  }

  return v4;
}

- (void)setIsSystemService:(BOOL)a3
{
  self->_isSystemService = a3;
}

- (void)setExecutableDisplayName:(id)a3
{
}

- (void)setBundleIdentifier:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CCUISensorAttributionEntity *)a3;
  if (self == v4)
  {
    char v14 = 1;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
    v6 = [(CCUISensorAttributionEntity *)self bundleIdentifier];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __39__CCUISensorAttributionEntity_isEqual___block_invoke;
    v20[3] = &unk_1E6AD45B8;
    id v7 = v4;
    v21 = v7;
    id v8 = (id)[v5 appendString:v6 counterpart:v20];

    unint64_t v9 = [(CCUISensorAttributionEntity *)self executableDisplayName];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __39__CCUISensorAttributionEntity_isEqual___block_invoke_2;
    v18[3] = &unk_1E6AD45B8;
    v10 = v7;
    v19 = v10;
    id v11 = (id)[v5 appendString:v9 counterpart:v18];

    BOOL v12 = [(CCUISensorAttributionEntity *)self isSystemService];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __39__CCUISensorAttributionEntity_isEqual___block_invoke_3;
    v16[3] = &unk_1E6AD45E0;
    v17 = v10;
    id v13 = (id)[v5 appendBool:v12 counterpart:v16];
    char v14 = [v5 isEqual];
  }
  return v14;
}

- (id)debugDescription
{
  id v3 = NSString;
  v4 = [(CCUISensorAttributionEntity *)self bundleIdentifier];
  id v5 = [(CCUISensorAttributionEntity *)self executableDisplayName];
  v6 = [v3 stringWithFormat:@"bundle:%@ executableDisplayName:%@ isSystemService:%d", v4, v5, -[CCUISensorAttributionEntity isSystemService](self, "isSystemService")];

  return v6;
}

+ (id)genericLocationSystemServiceEntity
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:NSClassFromString(&cfstr_Ccuisensoracti.isa)];
  id v3 = [v2 localizedStringForKey:@"CONTROL_CENTER_SENSOR_LOCATION_SYSTEM_SERVICES" value:&stru_1F3016698 table:@"ControlCenterUI"];

  v4 = objc_alloc_init(CCUISensorAttributionEntity);
  [(CCUISensorAttributionEntity *)v4 setExecutableDisplayName:v3];
  [(CCUISensorAttributionEntity *)v4 setBundleIdentifier:@"com.apple.locationSystemServices"];
  [(CCUISensorAttributionEntity *)v4 setIsSystemService:1];

  return v4;
}

@end