@interface CCUISensorActivityData
+ (id)_genericLocationSystemServiceActivity;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSystemService;
- (BOOL)launchToSettings;
- (BOOL)usedRecently;
- (NSString)attributionGroup;
- (NSString)bundleIdentifier;
- (NSString)displayName;
- (NSString)executableDisplayName;
- (NSString)website;
- (UIColor)sensorIndicatorColor;
- (id)debugDescription;
- (unint64_t)hash;
- (unint64_t)sensorType;
- (void)setAttributionGroup:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setExecutableDisplayName:(id)a3;
- (void)setIsSystemService:(BOOL)a3;
- (void)setLaunchToSettings:(BOOL)a3;
- (void)setSensorIndicatorColor:(id)a3;
- (void)setSensorType:(unint64_t)a3;
- (void)setUsedRecently:(BOOL)a3;
- (void)setWebsite:(id)a3;
@end

@implementation CCUISensorActivityData

- (void)setUsedRecently:(BOOL)a3
{
  self->_usedRecently = a3;
}

- (void)setSensorType:(unint64_t)a3
{
  self->_sensorType = a3;
}

- (void)setExecutableDisplayName:(id)a3
{
}

- (void)setDisplayName:(id)a3
{
}

- (void)setBundleIdentifier:(id)a3
{
}

- (void)setWebsite:(id)a3
{
}

- (void)setIsSystemService:(BOOL)a3
{
  self->_isSystemService = a3;
}

- (void)setAttributionGroup:(id)a3
{
}

uint64_t __34__CCUISensorActivityData_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) sensorType];
}

- (id)debugDescription
{
  v3 = NSString;
  v4 = [(CCUISensorActivityData *)self bundleIdentifier];
  v5 = [(CCUISensorActivityData *)self displayName];
  v6 = [(CCUISensorActivityData *)self executableDisplayName];
  v7 = [(CCUISensorActivityData *)self attributionGroup];
  v8 = [(CCUISensorActivityData *)self website];
  BOOL v9 = [(CCUISensorActivityData *)self usedRecently];
  v10 = @"NO";
  if (v9) {
    v10 = @"YES";
  }
  v11 = [v3 stringWithFormat:@"bundle:%@ display:%@ executableDisplayName:%@ attributionGroup:%@ domain:%@ recently:%@", v4, v5, v6, v7, v8, v10];

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sensorIndicatorColor, 0);
  objc_storeStrong((id *)&self->_website, 0);
  objc_storeStrong((id *)&self->_attributionGroup, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_executableDisplayName, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CCUISensorActivityData *)a3;
  if (self == v4)
  {
    char v29 = 1;
  }
  else
  {
    v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
    unint64_t v6 = [(CCUISensorActivityData *)self sensorType];
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __34__CCUISensorActivityData_isEqual___block_invoke;
    v48[3] = &unk_1E6AD4590;
    v7 = v4;
    v49 = v7;
    id v8 = (id)[v5 appendUnsignedInteger:v6 counterpart:v48];
    BOOL v9 = [(CCUISensorActivityData *)self displayName];
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __34__CCUISensorActivityData_isEqual___block_invoke_2;
    v46[3] = &unk_1E6AD45B8;
    v10 = v7;
    v47 = v10;
    id v11 = (id)[v5 appendString:v9 counterpart:v46];

    v12 = [(CCUISensorActivityData *)self executableDisplayName];
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __34__CCUISensorActivityData_isEqual___block_invoke_3;
    v44[3] = &unk_1E6AD45B8;
    v13 = v10;
    v45 = v13;
    id v14 = (id)[v5 appendString:v12 counterpart:v44];

    v15 = [(CCUISensorActivityData *)self bundleIdentifier];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __34__CCUISensorActivityData_isEqual___block_invoke_4;
    v42[3] = &unk_1E6AD45B8;
    v16 = v13;
    v43 = v16;
    id v17 = (id)[v5 appendString:v15 counterpart:v42];

    v18 = [(CCUISensorActivityData *)self attributionGroup];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __34__CCUISensorActivityData_isEqual___block_invoke_5;
    v40[3] = &unk_1E6AD45B8;
    v19 = v16;
    v41 = v19;
    id v20 = (id)[v5 appendString:v18 counterpart:v40];

    v21 = [(CCUISensorActivityData *)self website];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __34__CCUISensorActivityData_isEqual___block_invoke_6;
    v38[3] = &unk_1E6AD45B8;
    v22 = v19;
    v39 = v22;
    id v23 = (id)[v5 appendString:v21 counterpart:v38];

    BOOL v24 = [(CCUISensorActivityData *)self isSystemService];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __34__CCUISensorActivityData_isEqual___block_invoke_7;
    v36[3] = &unk_1E6AD45E0;
    v25 = v22;
    v37 = v25;
    id v26 = (id)[v5 appendBool:v24 counterpart:v36];
    BOOL v27 = [(CCUISensorActivityData *)self usedRecently];
    uint64_t v31 = MEMORY[0x1E4F143A8];
    uint64_t v32 = 3221225472;
    v33 = __34__CCUISensorActivityData_isEqual___block_invoke_8;
    v34 = &unk_1E6AD45E0;
    v35 = v25;
    id v28 = (id)[v5 appendBool:v27 counterpart:&v31];
    char v29 = objc_msgSend(v5, "isEqual", v31, v32, v33, v34);
  }
  return v29;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[CCUISensorActivityData sensorType](self, "sensorType"));
  v5 = [(CCUISensorActivityData *)self displayName];
  id v6 = (id)[v3 appendObject:v5];

  v7 = [(CCUISensorActivityData *)self executableDisplayName];
  id v8 = (id)[v3 appendObject:v7];

  BOOL v9 = [(CCUISensorActivityData *)self bundleIdentifier];
  id v10 = (id)[v3 appendObject:v9];

  id v11 = [(CCUISensorActivityData *)self attributionGroup];
  id v12 = (id)[v3 appendObject:v11];

  v13 = [(CCUISensorActivityData *)self website];
  id v14 = (id)[v3 appendObject:v13];

  id v15 = (id)objc_msgSend(v3, "appendBool:", -[CCUISensorActivityData isSystemService](self, "isSystemService"));
  id v16 = (id)objc_msgSend(v3, "appendBool:", -[CCUISensorActivityData usedRecently](self, "usedRecently"));
  unint64_t v17 = [v3 hash];

  return v17;
}

- (unint64_t)sensorType
{
  return self->_sensorType;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)executableDisplayName
{
  return self->_executableDisplayName;
}

- (BOOL)usedRecently
{
  return self->_usedRecently;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)attributionGroup
{
  return self->_attributionGroup;
}

- (NSString)website
{
  return self->_website;
}

- (BOOL)isSystemService
{
  return self->_isSystemService;
}

uint64_t __34__CCUISensorActivityData_isEqual___block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) usedRecently];
}

uint64_t __34__CCUISensorActivityData_isEqual___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) isSystemService];
}

uint64_t __34__CCUISensorActivityData_isEqual___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) website];
}

uint64_t __34__CCUISensorActivityData_isEqual___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) attributionGroup];
}

uint64_t __34__CCUISensorActivityData_isEqual___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) bundleIdentifier];
}

uint64_t __34__CCUISensorActivityData_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) executableDisplayName];
}

uint64_t __34__CCUISensorActivityData_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) displayName];
}

+ (id)_genericLocationSystemServiceActivity
{
  v2 = objc_alloc_init(CCUISensorActivityData);
  v3 = +[CCUISensorAttributionEntity genericLocationSystemServiceEntity];
  [(CCUISensorActivityData *)v2 setSensorType:2];
  id v4 = [v3 bundleIdentifier];
  [(CCUISensorActivityData *)v2 setBundleIdentifier:v4];

  [(CCUISensorActivityData *)v2 setIsSystemService:1];
  return v2;
}

- (UIColor)sensorIndicatorColor
{
  return self->_sensorIndicatorColor;
}

- (void)setSensorIndicatorColor:(id)a3
{
}

- (BOOL)launchToSettings
{
  return self->_launchToSettings;
}

- (void)setLaunchToSettings:(BOOL)a3
{
  self->_launchToSettings = a3;
}

@end