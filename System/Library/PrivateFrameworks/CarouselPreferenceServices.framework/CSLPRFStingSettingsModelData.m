@interface CSLPRFStingSettingsModelData
+ (BOOL)supportsSecureCoding;
+ (id)fromExportData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CSLPRFStingSettingsModelData)init;
- (CSLPRFStingSettingsModelData)initWithCoder:(id)a3;
- (NSArray)accessibilityShortcutsArray;
- (NSDictionary)actionsDictionary;
- (NSDictionary)secondaryActionsDictionary;
- (NSDictionary)shortcutsDictionary;
- (NSDictionary)startWorkoutsDictionary;
- (NSString)version;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)toExportData;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessibilityShortcutsArray:(id)a3;
- (void)setActionsDictionary:(id)a3;
- (void)setSecondaryActionsDictionary:(id)a3;
- (void)setShortcutsDictionary:(id)a3;
- (void)setStartWorkoutsDictionary:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation CSLPRFStingSettingsModelData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startWorkoutsDictionary, 0);
  objc_storeStrong((id *)&self->_accessibilityShortcutsArray, 0);
  objc_storeStrong((id *)&self->_shortcutsDictionary, 0);
  objc_storeStrong((id *)&self->_secondaryActionsDictionary, 0);
  objc_storeStrong((id *)&self->_actionsDictionary, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

- (void)setStartWorkoutsDictionary:(id)a3
{
}

- (NSDictionary)startWorkoutsDictionary
{
  return self->_startWorkoutsDictionary;
}

- (void)setAccessibilityShortcutsArray:(id)a3
{
}

- (NSArray)accessibilityShortcutsArray
{
  return self->_accessibilityShortcutsArray;
}

- (void)setShortcutsDictionary:(id)a3
{
}

- (NSDictionary)shortcutsDictionary
{
  return self->_shortcutsDictionary;
}

- (void)setSecondaryActionsDictionary:(id)a3
{
}

- (NSDictionary)secondaryActionsDictionary
{
  return self->_secondaryActionsDictionary;
}

- (void)setActionsDictionary:(id)a3
{
}

- (NSDictionary)actionsDictionary
{
  return self->_actionsDictionary;
}

- (void)setVersion:(id)a3
{
}

- (NSString)version
{
  return self->_version;
}

- (id)toExportData
{
  [(CSLPRFStingSettingsModelData *)self setVersion:@"0.3"];
  v3 = (void *)MEMORY[0x263F08910];
  return (id)[v3 archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
}

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  [v3 appendString:self->_version withName:@"version" skipIfEmpty:1];
  id v4 = (id)[v3 appendObject:self->_actionsDictionary withName:@"actions" skipIfNil:1];
  id v5 = (id)[v3 appendObject:self->_secondaryActionsDictionary withName:@"secondaryActions" skipIfNil:1];
  id v6 = (id)[v3 appendObject:self->_shortcutsDictionary withName:@"shortcuts" skipIfNil:1];
  id v7 = (id)[v3 appendObject:self->_accessibilityShortcutsArray withName:@"accessibilityShortcuts" skipIfNil:1];
  id v8 = (id)[v3 appendObject:self->_startWorkoutsDictionary withName:@"startWorkouts" skipIfNil:1];
  v9 = [v3 build];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F29C58] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  version = self->_version;
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __40__CSLPRFStingSettingsModelData_isEqual___block_invoke;
  v38[3] = &unk_264A0B520;
  id v7 = v4;
  id v39 = v7;
  id v8 = (id)[v5 appendString:version counterpart:v38];
  actionsDictionary = self->_actionsDictionary;
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __40__CSLPRFStingSettingsModelData_isEqual___block_invoke_2;
  v36[3] = &unk_264A0BBC8;
  id v10 = v7;
  id v37 = v10;
  id v11 = (id)[v5 appendObject:actionsDictionary counterpart:v36];
  secondaryActionsDictionary = self->_secondaryActionsDictionary;
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __40__CSLPRFStingSettingsModelData_isEqual___block_invoke_3;
  v34[3] = &unk_264A0BBC8;
  id v13 = v10;
  id v35 = v13;
  id v14 = (id)[v5 appendObject:secondaryActionsDictionary counterpart:v34];
  shortcutsDictionary = self->_shortcutsDictionary;
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __40__CSLPRFStingSettingsModelData_isEqual___block_invoke_4;
  v32[3] = &unk_264A0BBC8;
  id v16 = v13;
  id v33 = v16;
  id v17 = (id)[v5 appendObject:shortcutsDictionary counterpart:v32];
  accessibilityShortcutsArray = self->_accessibilityShortcutsArray;
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __40__CSLPRFStingSettingsModelData_isEqual___block_invoke_5;
  v30[3] = &unk_264A0BBC8;
  id v19 = v16;
  id v31 = v19;
  id v20 = (id)[v5 appendObject:accessibilityShortcutsArray counterpart:v30];
  startWorkoutsDictionary = self->_startWorkoutsDictionary;
  uint64_t v25 = MEMORY[0x263EF8330];
  uint64_t v26 = 3221225472;
  v27 = __40__CSLPRFStingSettingsModelData_isEqual___block_invoke_6;
  v28 = &unk_264A0BBC8;
  id v29 = v19;
  id v22 = v19;
  id v23 = (id)[v5 appendObject:startWorkoutsDictionary counterpart:&v25];
  LOBYTE(startWorkoutsDictionary) = objc_msgSend(v5, "isEqual", v25, v26, v27, v28);

  return (char)startWorkoutsDictionary;
}

uint64_t __40__CSLPRFStingSettingsModelData_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) version];
}

uint64_t __40__CSLPRFStingSettingsModelData_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) actionsDictionary];
}

uint64_t __40__CSLPRFStingSettingsModelData_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) secondaryActionsDictionary];
}

uint64_t __40__CSLPRFStingSettingsModelData_isEqual___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) shortcutsDictionary];
}

uint64_t __40__CSLPRFStingSettingsModelData_isEqual___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessibilityShortcutsArray];
}

uint64_t __40__CSLPRFStingSettingsModelData_isEqual___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) startWorkoutsDictionary];
}

- (unint64_t)hash
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F29C60] builder];
  id v4 = (id)[v3 appendString:self->_version];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v5 = self->_actionsDictionary;
  uint64_t v6 = [(NSDictionary *)v5 countByEnumeratingWithState:&v53 objects:v61 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v54;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v54 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = (id)[v3 appendObject:*(void *)(*((void *)&v53 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [(NSDictionary *)v5 countByEnumeratingWithState:&v53 objects:v61 count:16];
    }
    while (v7);
  }

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v11 = self->_secondaryActionsDictionary;
  uint64_t v12 = [(NSDictionary *)v11 countByEnumeratingWithState:&v49 objects:v60 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v50;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v50 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = (id)[v3 appendObject:*(void *)(*((void *)&v49 + 1) + 8 * v15++)];
      }
      while (v13 != v15);
      uint64_t v13 = [(NSDictionary *)v11 countByEnumeratingWithState:&v49 objects:v60 count:16];
    }
    while (v13);
  }

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v17 = self->_shortcutsDictionary;
  uint64_t v18 = [(NSDictionary *)v17 countByEnumeratingWithState:&v45 objects:v59 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v46;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v46 != v20) {
          objc_enumerationMutation(v17);
        }
        id v22 = (id)[v3 appendObject:*(void *)(*((void *)&v45 + 1) + 8 * v21++)];
      }
      while (v19 != v21);
      uint64_t v19 = [(NSDictionary *)v17 countByEnumeratingWithState:&v45 objects:v59 count:16];
    }
    while (v19);
  }

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v23 = self->_accessibilityShortcutsArray;
  uint64_t v24 = [(NSArray *)v23 countByEnumeratingWithState:&v41 objects:v58 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v42;
    do
    {
      uint64_t v27 = 0;
      do
      {
        if (*(void *)v42 != v26) {
          objc_enumerationMutation(v23);
        }
        id v28 = (id)[v3 appendObject:*(void *)(*((void *)&v41 + 1) + 8 * v27++)];
      }
      while (v25 != v27);
      uint64_t v25 = [(NSArray *)v23 countByEnumeratingWithState:&v41 objects:v58 count:16];
    }
    while (v25);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v29 = self->_startWorkoutsDictionary;
  uint64_t v30 = [(NSDictionary *)v29 countByEnumeratingWithState:&v37 objects:v57 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v38;
    do
    {
      uint64_t v33 = 0;
      do
      {
        if (*(void *)v38 != v32) {
          objc_enumerationMutation(v29);
        }
        id v34 = (id)objc_msgSend(v3, "appendObject:", *(void *)(*((void *)&v37 + 1) + 8 * v33++), (void)v37);
      }
      while (v31 != v33);
      uint64_t v31 = [(NSDictionary *)v29 countByEnumeratingWithState:&v37 objects:v57 count:16];
    }
    while (v31);
  }

  unint64_t v35 = [v3 hash];
  return v35;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(CSLPRFStingSettingsModelData);
  id v5 = (void *)[(NSString *)self->_version copy];
  [(CSLPRFStingSettingsModelData *)v4 setVersion:v5];

  uint64_t v6 = (void *)[(NSDictionary *)self->_actionsDictionary copy];
  [(CSLPRFStingSettingsModelData *)v4 setActionsDictionary:v6];

  uint64_t v7 = (void *)[(NSDictionary *)self->_secondaryActionsDictionary copy];
  [(CSLPRFStingSettingsModelData *)v4 setSecondaryActionsDictionary:v7];

  uint64_t v8 = (void *)[(NSDictionary *)self->_shortcutsDictionary copy];
  [(CSLPRFStingSettingsModelData *)v4 setShortcutsDictionary:v8];

  uint64_t v9 = (void *)[(NSArray *)self->_accessibilityShortcutsArray copy];
  [(CSLPRFStingSettingsModelData *)v4 setAccessibilityShortcutsArray:v9];

  id v10 = (void *)[(NSDictionary *)self->_startWorkoutsDictionary copy];
  [(CSLPRFStingSettingsModelData *)v4 setStartWorkoutsDictionary:v10];

  return v4;
}

- (CSLPRFStingSettingsModelData)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CSLPRFStingSettingsModelData;
  id v5 = [(CSLPRFStingSettingsModelData *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"version"];
    version = v5->_version;
    v5->_version = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectForKey:@"actions"];
    actionsDictionary = v5->_actionsDictionary;
    v5->_actionsDictionary = (NSDictionary *)v8;

    uint64_t v10 = [v4 decodeObjectForKey:@"secondaryActions"];
    secondaryActionsDictionary = v5->_secondaryActionsDictionary;
    v5->_secondaryActionsDictionary = (NSDictionary *)v10;

    uint64_t v12 = [v4 decodeObjectForKey:@"shortcuts"];
    shortcutsDictionary = v5->_shortcutsDictionary;
    v5->_shortcutsDictionary = (NSDictionary *)v12;

    uint64_t v14 = [v4 decodeObjectForKey:@"accessibilityShortcuts"];
    accessibilityShortcutsArray = v5->_accessibilityShortcutsArray;
    v5->_accessibilityShortcutsArray = (NSArray *)v14;

    uint64_t v16 = [v4 decodeObjectForKey:@"startWorkouts"];
    startWorkoutsDictionary = v5->_startWorkoutsDictionary;
    v5->_startWorkoutsDictionary = (NSDictionary *)v16;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  version = self->_version;
  id v5 = a3;
  [v5 encodeObject:version forKey:@"version"];
  [v5 encodeObject:self->_actionsDictionary forKey:@"actions"];
  [v5 encodeObject:self->_secondaryActionsDictionary forKey:@"secondaryActions"];
  [v5 encodeObject:self->_shortcutsDictionary forKey:@"shortcuts"];
  [v5 encodeObject:self->_accessibilityShortcutsArray forKey:@"accessibilityShortcuts"];
  [v5 encodeObject:self->_startWorkoutsDictionary forKey:@"startWorkouts"];
}

- (CSLPRFStingSettingsModelData)init
{
  v5.receiver = self;
  v5.super_class = (Class)CSLPRFStingSettingsModelData;
  v2 = [(CSLPRFStingSettingsModelData *)&v5 init];
  v3 = v2;
  if (v2) {
    [(CSLPRFStingSettingsModelData *)v2 setVersion:@"0.3"];
  }
  return v3;
}

+ (id)fromExportData:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v21 = a1;
    objc_super v5 = [objc_alloc(MEMORY[0x263F08928]) initForReadingFromData:v4 error:0];
    uint64_t v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
    uint64_t v15 = [v5 decodeObjectOfClasses:v14 forKey:*MEMORY[0x263F081D0]];
    uint64_t v16 = [v15 version];
    LOBYTE(v8) = [v16 isEqualToString:@"0.3"];

    if (v8)
    {
      id v17 = v15;
    }
    else
    {
      uint64_t v18 = cslprf_sting_settings_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        uint64_t v20 = [v15 version];
        *(_DWORD *)buf = 138412802;
        id v23 = v21;
        __int16 v24 = 2112;
        id v25 = v20;
        __int16 v26 = 2112;
        uint64_t v27 = @"0.3";
        _os_log_error_impl(&dword_22F4EA000, v18, OS_LOG_TYPE_ERROR, "%@ unexpected model data version %@, expected %@", buf, 0x20u);
      }
      id v17 = 0;
    }
  }
  else
  {
    objc_super v5 = cslprf_sting_settings_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v23 = a1;
      __int16 v24 = 2112;
      id v25 = v4;
      _os_log_error_impl(&dword_22F4EA000, v5, OS_LOG_TYPE_ERROR, "%@ incorrect data %@", buf, 0x16u);
    }
    id v17 = 0;
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end