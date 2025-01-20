@interface FBSSettingsDiff
+ (Class)_settingsClass;
+ (id)diffFromSettings:(id)a3 toSettings:(id)a4;
- (BOOL)_isSignifcant;
- (BOOL)containsLegacySetting:(unint64_t)a3;
- (BOOL)containsProperty:(SEL)a3;
- (BOOL)containsPropertyFromExtension:(Class)a3;
- (BOOL)containsSetting:(id)a3;
- (BOOL)containsSettingNamed:(id)a3;
- (FBSSettingsDiff)init;
- (FBSSettingsDiff)initWithChangesFromSettings:(id)a3 toSettings:(id)a4;
- (FBSSettingsDiff)initWithXPCDictionary:(id)a3;
- (NSString)description;
- (id)_allLegacySettings;
- (id)_allModernSettings;
- (id)_changedSettings;
- (id)_initWithSettingsDiff:(void *)a3 localDiff:(void *)a4 legacyDiff:(void *)a5 legacyLocalDiff:(void *)a6 settingsClass:;
- (id)descriptionBuilderWithMultilinePrefix:(uint64_t)a1;
- (id)descriptionWithMultilinePrefix:(uint64_t)a1;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (id)settings:(id)a3 keyDescriptionForSetting:(unint64_t)a4;
- (id)settings:(id)a3 valueDescriptionForFlag:(int64_t)a4 object:(id)a5 ofSetting:(unint64_t)a6;
- (id)settingsByApplyingToMutableCopyOfSettings:(id)a3;
- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5;
- (uint64_t)_containsAnySettingNamed:(uint64_t)a1;
- (uint64_t)_containsKey:(uint64_t)a1;
- (uint64_t)_containsSetting:(void *)a1;
- (void)_inspectDiff:(void *)a3 withBlock:;
- (void)applyToMutableSettings:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
- (void)evaluateWithInspector:(id)a3 context:(void *)a4;
- (void)inspectChangesWithBlock:(id)a3;
- (void)inspectOtherChangesWithBlock:(id)a3;
@end

@implementation FBSSettingsDiff

void __42__FBSSettingsDiff__inspectDiff_withBlock___block_invoke(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  if (!*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    (*(void (**)(void))(a1[5] + 16))();
    -[FBSSettingsDiff _inspectDiff:withBlock:](a1[4], v5, a1[5]);
  }
}

- (void)inspectChangesWithBlock:(id)a3
{
  if (a3)
  {
    diff = self->_diff;
    id v5 = a3;
    -[FBSSettingsDiff _inspectDiff:withBlock:]((uint64_t)self, diff, v5);
    -[FBSSettingsDiff _inspectDiff:withBlock:]((uint64_t)self, self->_localDiff, v5);
  }
}

- (void)_inspectDiff:(void *)a3 withBlock:
{
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (a1)
  {
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    char v12 = 0;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __42__FBSSettingsDiff__inspectDiff_withBlock___block_invoke;
    v8[3] = &unk_1E58F5F00;
    v10 = v11;
    v8[4] = a1;
    id v9 = v6;
    [v5 inspectKeyedChangesWithBlock:v8];

    _Block_object_dispose(v11, 8);
  }
}

uint64_t __37__FBSSettingsDiff__allModernSettings__block_invoke(uint64_t a1, NSString *aSelectorName)
{
  v3 = *(void **)(a1 + 40);
  SEL v4 = NSSelectorFromString(aSelectorName);
  uint64_t v5 = FBSSettingForExtensionSelector(v3, v4);
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v8 = v5;
    uint64_t v5 = [*(id *)(a1 + 32) addObject:v5];
    uint64_t v6 = v8;
  }

  return MEMORY[0x1F41817F8](v5, v6);
}

- (FBSSettingsDiff)initWithChangesFromSettings:(id)a3 toSettings:(id)a4
{
  uint64_t v6 = (id *)a3;
  v7 = (id *)a4;
  if (v6 != v7)
  {
    uint64_t v8 = -[FBSSettings _settings:](v6, 0);
    id v9 = -[FBSSettings _settings:](v7, 0);
    [off_1E58F4598 diffFromSettings:v8 toSettings:v9];
    objc_claimAutoreleasedReturnValue();

    v10 = -[FBSSettings _legacyOtherSettings:](v6, 0);
    v11 = -[FBSSettings _legacyOtherSettings:](v7, 0);
    [off_1E58F4598 diffFromSettings:v10 toSettings:v11];
    objc_claimAutoreleasedReturnValue();

    char v12 = -[FBSSettings _localSettings:](v6, 0);
    v13 = -[FBSSettings _localSettings:](v7, 0);
    [off_1E58F4598 diffFromSettings:v12 toSettings:v13];
    objc_claimAutoreleasedReturnValue();

    v14 = -[FBSSettings _legacyLocalSettings:](v6, 0);
    v15 = -[FBSSettings _legacyLocalSettings:](v7, 0);
    [off_1E58F4598 diffFromSettings:v14 toSettings:v15];
    objc_claimAutoreleasedReturnValue();

    BSSettingsDiffIsEmpty();
  }

  return 0;
}

- (id)_initWithSettingsDiff:(void *)a3 localDiff:(void *)a4 legacyDiff:(void *)a5 legacyLocalDiff:(void *)a6 settingsClass:
{
  id v12 = a2;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  if (a1)
  {
    v18.receiver = a1;
    v18.super_class = (Class)FBSSettingsDiff;
    v16 = (id *)[super init];
    a1 = v16;
    if (v16)
    {
      objc_storeStrong(v16 + 1, a2);
      objc_storeStrong(a1 + 3, a3);
      objc_storeStrong(a1 + 2, a4);
      objc_storeStrong(a1 + 4, a5);
      a1[5] = a6;
    }
  }

  return a1;
}

- (void)evaluateWithInspector:(id)a3 context:(void *)a4
{
}

+ (id)diffFromSettings:(id)a3 toSettings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((id)objc_opt_class() == a1)
  {
    id v9 = (void *)[(id)objc_opt_class() _diffClass];
    if (!v9) {
      id v9 = (void *)[(id)objc_opt_class() _diffClass];
    }
    uint64_t v8 = [v9 diffFromSettings:v6 toSettings:v7];
  }
  else
  {
    uint64_t v8 = [objc_alloc((Class)a1) initWithChangesFromSettings:v6 toSettings:v7];
  }
  v10 = (void *)v8;

  return v10;
}

- (id)settingsByApplyingToMutableCopyOfSettings:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    uint64_t v5 = (objc_class *)[(id)objc_opt_class() _settingsClass];
    Class settingsClass = self->_settingsClass;
    if (settingsClass && [(objc_class *)settingsClass isSubclassOfClass:v5]) {
      id v7 = (id)[objc_alloc(self->_settingsClass) initWithSettings:0];
    }
    else {
      id v7 = objc_alloc_init(v5);
    }
    id v4 = v7;
  }
  uint64_t v8 = (void *)[v4 mutableCopy];
  [(FBSSettingsDiff *)self applyToMutableSettings:v8];

  return v8;
}

- (void)applyToMutableSettings:(id)a3
{
  id v15 = a3;
  uint64_t v4 = [(id)objc_opt_class() _settingsClass];
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v13 = [NSString stringWithFormat:@"input %@ is not of expected class %@", objc_opt_class(), v4];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSSettingsDiff applyToMutableSettings:]();
    }
    [v13 UTF8String];
    _bs_set_crash_log_message();
  }
  if (!-[FBSSettings _isMutable]((BOOL)v15))
  {
    id v14 = [NSString stringWithFormat:@"settings must be mutable"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSSettingsDiff applyToMutableSettings:]();
    }
    [v14 UTF8String];
    _bs_set_crash_log_message();
  }
  diff = self->_diff;
  id v6 = -[FBSSettings _settings]((uint64_t)v15);
  [(BSSettingsDiff *)diff applyToSettings:v6];

  legacyDiff = self->_legacyDiff;
  uint64_t v8 = [v15 otherSettings];
  [(BSSettingsDiff *)legacyDiff applyToSettings:v8];

  localDiff = self->_localDiff;
  v10 = -[FBSSettings _localSettings]((uint64_t)v15);
  [(BSSettingsDiff *)localDiff applyToSettings:v10];

  legacyLocalDiff = self->_legacyLocalDiff;
  id v12 = -[FBSSettings _legacyLocalSettings]((uint64_t)v15);
  [(BSSettingsDiff *)legacyLocalDiff applyToSettings:v12];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changedLegacySettings, 0);
  objc_storeStrong((id *)&self->_changedSettings, 0);
  objc_storeStrong((id *)&self->_legacyLocalDiff, 0);
  objc_storeStrong((id *)&self->_localDiff, 0);
  objc_storeStrong((id *)&self->_legacyDiff, 0);

  objc_storeStrong((id *)&self->_diff, 0);
}

- (uint64_t)_containsKey:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      id v6 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"key != ((void *)0)"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSSettingsDiff _containsKey:]();
      }
      [v6 UTF8String];
      _bs_set_crash_log_message();
    }
    if ([*(id *)(a1 + 8) settingChangedForKey:v3]) {
      a1 = 1;
    }
    else {
      a1 = [*(id *)(a1 + 24) settingChangedForKey:v4];
    }
  }

  return a1;
}

- (FBSSettingsDiff)initWithXPCDictionary:(id)a3
{
  id v3 = [off_1E58F45A8 coderWithMessage:a3];
  [v3 decodeObjectOfClass:objc_opt_class() forKey:@"mainDiff"];
  objc_claimAutoreleasedReturnValue();
  [v3 decodeObjectOfClass:objc_opt_class() forKey:@"otherDiff"];
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"settingsClass"];
  NSClassFromString(v4);
  BSSettingsDiffIsEmpty();
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v5 = [off_1E58F45A8 coderWithMessage:a3];
  [v5 encodeObject:self->_diff forKey:@"mainDiff"];
  [v5 encodeObject:self->_legacyDiff forKey:@"otherDiff"];
  uint64_t v4 = NSStringFromClass(self->_settingsClass);
  [v5 encodeObject:v4 forKey:@"settingsClass"];
}

- (id)_changedSettings
{
  id v3 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v4 = -[FBSSettingsDiff _allModernSettings](self);
  [v3 unionSet:v4];

  id v5 = -[FBSSettingsDiff _allLegacySettings](self);
  [v3 unionSet:v5];

  return v3;
}

- (BOOL)containsProperty:(SEL)a3
{
  Class settingsClass = self->_settingsClass;
  if (!settingsClass) {
    Class settingsClass = (Class)[(id)objc_opt_class() _settingsClass];
  }
  id v6 = FBSSettingForSelector(settingsClass, a3);
  if (!v6 || (-[FBSSettingsDiff _containsSetting:](self, v6) & 1) == 0)
  {
    if ((Class)[(objc_class *)settingsClass _baseClass] == settingsClass
      || -[FBSSetting isLegacy]((BOOL)v6)
      || !FBSSubclassHasBeenIngested(settingsClass)
      && ((uint64_t v10 = [(objc_class *)settingsClass instanceMethodForSelector:a3],
           v10 == MEMORY[0x1E4FBA8C8])
       || v10 == [objc_class _baseClass](settingsClass, "_baseClass").instanceMethodForSelector(a3))|| (FBSSettingForLegacySelector(settingsClass, a3), (v11 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      if (v6)
      {
        BOOL v7 = 0;
        goto LABEL_17;
      }
      uint64_t v8 = NSStringFromSelector(a3);
      char v9 = -[FBSSettingsDiff _containsAnySettingNamed:]((uint64_t)self, v8);
    }
    else
    {
      uint64_t v8 = v11;
      char v9 = -[FBSSettingsDiff _containsSetting:](self, v11);
    }
    BOOL v7 = v9;

    goto LABEL_17;
  }
  BOOL v7 = 1;
LABEL_17:

  return v7;
}

- (uint64_t)_containsSetting:(void *)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      uint64_t v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"setting != ((void *)0)"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSSettingsDiff _containsSetting:]();
      }
      [v8 UTF8String];
      _bs_set_crash_log_message();
    }
    if (-[FBSSetting isLegacy]((BOOL)v3)) {
      -[FBSSettingsDiff _allLegacySettings](a1);
    }
    else {
    id v5 = -[FBSSettingsDiff _allModernSettings](a1);
    }
    uint64_t v6 = [v5 containsObject:v4];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)_allModernSettings
{
  if (a1)
  {
    id v1 = a1;
    objc_sync_enter(v1);
    if (!*((void *)v1 + 6))
    {
      v2 = [MEMORY[0x1E4F1CA80] set];
      uint64_t v3 = *((void *)v1 + 5);
      if (!v3) {
        uint64_t v3 = [(id)objc_opt_class() _settingsClass];
      }
      uint64_t v9 = MEMORY[0x1E4F143A8];
      uint64_t v10 = 3221225472;
      v11 = __37__FBSSettingsDiff__allModernSettings__block_invoke;
      id v12 = &unk_1E58F5F28;
      uint64_t v14 = v3;
      id v4 = v2;
      id v13 = v4;
      id v5 = (void *)MEMORY[0x19F3991F0](&v9);
      [v1 inspectChangesWithBlock:v5, v9, v10, v11, v12];
      uint64_t v6 = [v4 copy];
      BOOL v7 = (void *)*((void *)v1 + 6);
      *((void *)v1 + 6) = v6;
    }
    objc_sync_exit(v1);

    a1 = *((id *)v1 + 6);
  }

  return a1;
}

- (id)_allLegacySettings
{
  if (a1)
  {
    id v1 = a1;
    objc_sync_enter(v1);
    if (!*((void *)v1 + 7))
    {
      v2 = [MEMORY[0x1E4F1CA80] set];
      uint64_t v3 = *((void *)v1 + 5);
      if (!v3) {
        uint64_t v3 = [(id)objc_opt_class() _settingsClass];
      }
      uint64_t v9 = MEMORY[0x1E4F143A8];
      uint64_t v10 = 3221225472;
      v11 = __37__FBSSettingsDiff__allLegacySettings__block_invoke;
      id v12 = &unk_1E58F5F50;
      uint64_t v14 = v3;
      id v4 = v2;
      id v13 = v4;
      id v5 = (void *)MEMORY[0x19F3991F0](&v9);
      [v1 inspectOtherChangesWithBlock:v5, v9, v10, v11, v12];
      uint64_t v6 = [v4 copy];
      BOOL v7 = (void *)*((void *)v1 + 7);
      *((void *)v1 + 7) = v6;
    }
    objc_sync_exit(v1);

    a1 = *((id *)v1 + 7);
  }

  return a1;
}

- (void)inspectOtherChangesWithBlock:(id)a3
{
  if (a3)
  {
    legacyDiff = self->_legacyDiff;
    id v5 = a3;
    [(BSSettingsDiff *)legacyDiff inspectChangesWithBlock:v5];
    [(BSSettingsDiff *)self->_legacyLocalDiff inspectChangesWithBlock:v5];
  }
}

uint64_t __37__FBSSettingsDiff__allLegacySettings__block_invoke(uint64_t a1, const void *a2)
{
  uint64_t v3 = FBSSettingForLegacySetting(*(void **)(a1 + 40), a2);
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v6 = v3;
    uint64_t v3 = [*(id *)(a1 + 32) addObject:v3];
    uint64_t v4 = v6;
  }

  return MEMORY[0x1F41817F8](v3, v4);
}

- (BOOL)_isSignifcant
{
}

- (FBSSettingsDiff)init
{
  return [(FBSSettingsDiff *)self initWithChangesFromSettings:0 toSettings:0];
}

- (uint64_t)_containsAnySettingNamed:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      uint64_t v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"settingName != ((void *)0)"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSSettingsDiff _containsAnySettingNamed:](sel__containsAnySettingNamed_);
      }
      [v8 UTF8String];
      _bs_set_crash_log_message();
    }
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x2020000000;
    char v16 = 0;
    char v16 = -[FBSSettingsDiff _containsKey:](a1, v3);
    if (*((unsigned char *)v14 + 24))
    {
      a1 = 1;
    }
    else
    {
      id v5 = [*(id *)(a1 + 40) _legacyDescriptionProvider];
      uint64_t v6 = v5;
      if (v5)
      {
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __44__FBSSettingsDiff__containsAnySettingNamed___block_invoke;
        v9[3] = &unk_1E58F5ED8;
        id v12 = &v13;
        id v10 = v5;
        id v11 = v4;
        [(id)a1 inspectOtherChangesWithBlock:v9];
      }
      a1 = *((unsigned char *)v14 + 24) != 0;
    }
    _Block_object_dispose(&v13, 8);
  }

  return a1;
}

- (BOOL)containsSetting:(id)a3
{
  return -[FBSSettingsDiff _containsSetting:](self, a3);
}

- (BOOL)containsSettingNamed:(id)a3
{
  return -[FBSSettingsDiff _containsKey:]((uint64_t)self, a3);
}

- (BOOL)containsPropertyFromExtension:(Class)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([(objc_class *)a3 isSubclassOfClass:objc_opt_class()])
  {
    Class settingsClass = self->_settingsClass;
    if (!settingsClass) {
      Class settingsClass = (Class)[(id)objc_opt_class() _settingsClass];
    }
    if ([(objc_class *)settingsClass isSubclassOfClass:objc_opt_class()]) {
      [(objc_class *)a3 settingsExtensions];
    }
    else {
      [(objc_class *)a3 clientSettingsExtensions];
    }
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v6);
          }
          id v12 = NSStringFromClass(*(Class *)(*((void *)&v15 + 1) + 8 * i));
          char v13 = -[FBSSettingsDiff _containsKey:]((uint64_t)self, v12);

          if (v13)
          {
            char v7 = 1;
            goto LABEL_18;
          }
        }
        uint64_t v9 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    char v7 = 0;
LABEL_18:
  }
  else
  {
    NSStringFromClass(a3);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    char v7 = -[FBSSettingsDiff _containsKey:]((uint64_t)self, v6);
  }

  return v7;
}

- (BOOL)containsLegacySetting:(unint64_t)a3
{
  Class settingsClass = self->_settingsClass;
  if (!settingsClass) {
    Class settingsClass = (Class)[(id)objc_opt_class() _settingsClass];
  }
  id v6 = FBSSettingForLegacySetting(settingsClass, (const void *)a3);
  if (v6)
  {
    char v7 = -[FBSSettingsDiff _containsSetting:](self, v6);
  }
  else
  {
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __41__FBSSettingsDiff_containsLegacySetting___block_invoke;
    v10[3] = &unk_1E58F5EB0;
    v10[4] = &v11;
    v10[5] = a3;
    uint64_t v8 = (void *)MEMORY[0x19F3991F0](v10);
    [(BSSettingsDiff *)self->_legacyDiff inspectChangesWithBlock:v8];
    [(BSSettingsDiff *)self->_legacyLocalDiff inspectChangesWithBlock:v8];
    char v7 = *((unsigned char *)v12 + 24) != 0;

    _Block_object_dispose(&v11, 8);
  }

  return v7;
}

uint64_t __41__FBSSettingsDiff_containsLegacySetting___block_invoke(uint64_t result, uint64_t a2)
{
  if (*(void *)(result + 40) == a2) {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  }
  return result;
}

- (NSString)description
{
  return (NSString *)-[FBSSettingsDiff descriptionWithMultilinePrefix:]((uint64_t)self, 0);
}

- (id)descriptionWithMultilinePrefix:(uint64_t)a1
{
  if (a1)
  {
    v2 = -[FBSSettingsDiff descriptionBuilderWithMultilinePrefix:](a1, a2);
    id v3 = [v2 build];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

+ (Class)_settingsClass
{
  uint64_t v4 = [NSString stringWithFormat:@"requires concrete implementation"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v5 = NSStringFromSelector(a2);
    id v6 = (objc_class *)objc_opt_class();
    char v7 = NSStringFromClass(v6);
    int v8 = 138544642;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    uint64_t v11 = v7;
    __int16 v12 = 2048;
    id v13 = a1;
    __int16 v14 = 2114;
    long long v15 = @"FBSSettingsDiff.m";
    __int16 v16 = 1024;
    int v17 = 167;
    __int16 v18 = 2114;
    v19 = v4;
    _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
  }
  [v4 UTF8String];
  _bs_set_crash_log_message();
}

void __44__FBSSettingsDiff__containsAnySettingNamed___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    id v3 = [*(id *)(a1 + 32) keyDescriptionForSetting:a2];
    int v4 = [v3 isEqualToString:*(void *)(a1 + 40)];

    if (v4) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
  }
}

- (id)descriptionBuilderWithMultilinePrefix:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    int v4 = [off_1E58F44F0 builderWithObject:a1];
    id v5 = NSStringFromClass(*(Class *)(a1 + 40));
    id v6 = (id)[v4 appendObject:v5 withName:0 skipIfNil:1];

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __57__FBSSettingsDiff_descriptionBuilderWithMultilinePrefix___block_invoke;
    void v11[3] = &unk_1E58F4AB0;
    v11[4] = a1;
    id v7 = v4;
    id v12 = v7;
    [v7 appendBodySectionWithName:0 multilinePrefix:v3 block:v11];

    int v8 = v12;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

uint64_t __57__FBSSettingsDiff_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 8))
  {
    char v3 = [*(id *)(v2 + 8) isEmpty];
    uint64_t v2 = *(void *)(a1 + 32);
    if ((v3 & 1) == 0)
    {
      int v4 = *(void **)(v2 + 8);
      id v5 = [[[objc_opt_class() _settingsClass] _descriptionProvider] description];
      [v4 setDescriptionProvider:v5];

      id v6 = (id)[*(id *)(a1 + 40) appendObject:*(void *)(*(void *)(a1 + 32) + 8) withName:@"settings"];
      uint64_t v2 = *(void *)(a1 + 32);
    }
  }
  if (*(void *)(v2 + 16))
  {
    char v7 = [*(id *)(v2 + 16) isEmpty];
    uint64_t v2 = *(void *)(a1 + 32);
    if ((v7 & 1) == 0)
    {
      int v8 = *(void **)(v2 + 16);
      id v9 = [*(id *)(v2 + 40) _legacyDescriptionProvider];
      [v8 setDescriptionProvider:v9];

      id v10 = (id)[*(id *)(a1 + 40) appendObject:*(void *)(*(void *)(a1 + 32) + 16) withName:@"subclassSettings"];
      uint64_t v2 = *(void *)(a1 + 32);
    }
  }
  if (*(void *)(v2 + 24))
  {
    char v11 = [*(id *)(v2 + 24) isEmpty];
    uint64_t v2 = *(void *)(a1 + 32);
    if ((v11 & 1) == 0)
    {
      id v12 = *(void **)(v2 + 24);
      id v13 = [[[objc_opt_class() _settingsClass] _descriptionProvider] copy];
      [v12 setDescriptionProvider:v13];

      id v14 = (id)[*(id *)(a1 + 40) appendObject:*(void *)(*(void *)(a1 + 32) + 24) withName:@"localSettings"];
      uint64_t v2 = *(void *)(a1 + 32);
    }
  }
  uint64_t result = *(void *)(v2 + 32);
  if (result)
  {
    uint64_t result = [(id)result isEmpty];
    if ((result & 1) == 0)
    {
      uint64_t v16 = *(void *)(a1 + 32);
      int v17 = *(void **)(v16 + 32);
      __int16 v18 = [*(id *)(v16 + 40) _legacyDescriptionProvider];
      [v17 setDescriptionProvider:v18];

      return (uint64_t)(id)[*(id *)(a1 + 40) appendObject:*(void *)(*(void *)(a1 + 32) + 32) withName:@"subclassLocalSettings"];
    }
  }
  return result;
}

- (id)settings:(id)a3 keyDescriptionForSetting:(unint64_t)a4
{
  return 0;
}

- (id)settings:(id)a3 valueDescriptionForFlag:(int64_t)a4 object:(id)a5 ofSetting:(unint64_t)a6
{
  return 0;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  return 0;
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  return 0;
}

- (void)initWithChangesFromSettings:toSettings:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  char v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_containsSetting:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  char v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_containsAnySettingNamed:(const char *)a1 .cold.1(const char *a1)
{
  SEL v1 = NSStringFromSelector(a1);
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v3, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, v5, v6, v7, 2u);
}

- (void)_containsKey:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)applyToMutableSettings:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)applyToMutableSettings:.cold.2()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end