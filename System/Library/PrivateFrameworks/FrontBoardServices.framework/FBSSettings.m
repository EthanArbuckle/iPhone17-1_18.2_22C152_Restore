@interface FBSSettings
+ (BOOL)supportsBSXPCSecureCoding;
+ (Class)_baseClass;
+ (Class)_counterpartClass;
+ (Class)_diffClass;
+ (Class)_mutableClass;
+ (Class)immutableSubclass;
+ (Class)mutableSubclass;
+ (Class)subclassExtension;
+ (id)_descriptionProvider;
+ (id)_legacyDescriptionProvider;
+ (id)_settingsExtensionsForSceneExtension:(Class)a3;
+ (id)allSettings;
+ (id)allSettingsFromExtension:(Class)a3;
+ (id)allSettingsFromProtocol:(id)a3;
+ (id)settingForProperty:(SEL)a3;
+ (id)settingForSubclassProperty:(SEL)a3;
+ (id)subclassExtensions;
+ (void)_setCounterpartClass:(Class)a3;
+ (void)allSettings;
+ (void)initialize;
- (BOOL)_hasAdditionalDescription;
- (BOOL)_hasAnySceneExtension;
- (BOOL)_indirect_isEmpty;
- (BOOL)_isEmptyForCoding:(BOOL)a3;
- (BOOL)_isEqualToSettings:(id)a3;
- (BOOL)_isMutable;
- (BOOL)appendDescriptionToBuilder:(id)a3 forFlag:(int64_t)a4 object:(id)a5 ofSetting:(unint64_t)a6;
- (BOOL)conformsToExtension:(Class)a3;
- (BOOL)containsSetting:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)settings:(id)a3 appendDescriptionToBuilder:(id)a4 forFlag:(int64_t)a5 object:(id)a6 ofSetting:(unint64_t)a7;
- (FBSSettings)init;
- (FBSSettings)initWithBSXPCCoder:(id)a3;
- (FBSSettings)initWithSettings:(id)a3;
- (FBSSettings)initWithXPCDictionary:(id)a3;
- (NSString)debugDescription;
- (NSString)description;
- (id)_allSceneExtensions;
- (id)_copyClearingProgenitor:(id)a3;
- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 debug:;
- (id)_legacyLocalSettings;
- (id)_legacyLocalSettings:(id *)a1;
- (id)_legacyOtherSettings;
- (id)_legacyOtherSettings:(id *)a1;
- (id)_localSettings;
- (id)_localSettings:(id *)a1;
- (id)_progenitor;
- (id)_rootSettingsForLocal:(int)a3 createIfNeeded:;
- (id)_sceneExtensionNames;
- (id)_sceneExtensionsCreatingIfNeeded:(void *)a1;
- (id)_settings;
- (id)_settings:(id *)a1;
- (id)_subSettingsForKey:(char)a3 local:(int)a4 createIfNeeded:;
- (id)_underlyingValueForSetting:(uint64_t)a1;
- (id)_valueForSetting:(uint64_t)a1;
- (id)copy:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescriptionWithMultilinePrefix:(void *)a1;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (id)mutableCopy:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)settings:(id)a3 keyDescriptionForSetting:(unint64_t)a4;
- (id)settings:(id)a3 valueDescriptionForFlag:(int64_t)a4 object:(id)a5 ofSetting:(unint64_t)a6;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5;
- (id)valueForProperty:(SEL)a3 expectedClass:(Class)a4;
- (id)valueForSetting:(id)a3;
- (unint64_t)hash;
- (void)_addSceneExtension:(Class)a3;
- (void)_addSceneExtension:(Class)a3 applyingSettings:(id)a4;
- (void)_applySettings:(uint64_t)a1;
- (void)_clearVolatileSettingsFromSettings:(uint64_t)a1;
- (void)_isEmpty;
- (void)_removeAllSceneExtensions;
- (void)_removeSceneExtension:(Class)a3;
- (void)_removeVolatileSettings;
- (void)_setValue:(void *)a3 forSetting:;
- (void)_setValue:(void *)a3 forSetting:(void *)a4 inSettings:;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
- (void)setValue:(id)a3 forProperty:(SEL)a4;
@end

@implementation FBSSettings

uint64_t __35__FBSSettings__sceneExtensionNames__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 compare:a3 options:64];
}

- (void)setValue:(id)a3 forProperty:(SEL)a4
{
  id v6 = a3;
  v7 = FBSSettingForExtensionSelector(self->_baseClass, a4);
  if (v7)
  {
    -[FBSSettings _setValue:forSetting:]((uint64_t)self, v6, v7);
  }
  else
  {
    v8 = FBLogSceneExtension();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[FBSSettings(FBSSceneExtension) valueForProperty:expectedClass:](a4);
    }
  }
}

- (void)_setValue:(void *)a3 forSetting:
{
  id v13 = a2;
  id v5 = a3;
  id v6 = v5;
  if (a1)
  {
    if (!v5)
    {
      v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"setting != ((void *)0)"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSSettings _setValue:forSetting:]();
      }
      [v11 UTF8String];
      _bs_set_crash_log_message();
    }
    if (!*(unsigned char *)(a1 + 64))
    {
      v12 = [NSString stringWithFormat:@"this class is not mutable"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSSettings _setValue:forSetting:]();
      }
      [v12 UTF8String];
      _bs_set_crash_log_message();
    }
    char v7 = -[FBSSetting isLocal]((BOOL)v5);
    v8 = -[FBSSetting extensionID]((uint64_t)v6);
    v9 = -[FBSSettings _rootSettingsForLocal:createIfNeeded:]((id *)a1, v7, 1);
    if (v8)
    {
      v10 = -[FBSSettings _subSettingsForKey:local:createIfNeeded:](a1, v8, v7, 1);
      -[FBSSettings _setValue:forSetting:inSettings:](a1, v13, v6, v10);
      BSSettingsIsEmpty();
    }
    -[FBSSettings _setValue:forSetting:inSettings:](a1, v13, v6, v9);
  }
}

- (id)_legacyOtherSettings
{
  if (a1)
  {
    a1 = -[FBSSettings _legacyOtherSettings:]((id *)a1, *(unsigned __int8 *)(a1 + 64));
    uint64_t v1 = vars8;
  }
  return (id)a1;
}

- (id)_legacyOtherSettings:(id *)a1
{
  if (a1)
  {
    v3 = a1;
    if (*((unsigned char *)a1 + 64)) {
      BOOL v4 = a2 == 0;
    }
    else {
      BOOL v4 = 1;
    }
    if (v4) {
      goto LABEL_12;
    }
    if (a1[5])
    {
      if (!*((unsigned char *)a1 + 65)) {
        goto LABEL_12;
      }
      uint64_t v5 = objc_opt_class();
      if (v5 != objc_opt_class()) {
        goto LABEL_12;
      }
      uint64_t v6 = [v3[5] mutableCopy];
    }
    else
    {
      uint64_t v6 = objc_opt_new();
    }
    id v7 = v3[5];
    v3[5] = (id)v6;

    id v8 = v3[5];
    v9 = [(id)objc_opt_class() _legacyDescriptionProvider];
    [v8 setDescriptionProvider:v9];

LABEL_12:
    a1 = (id *)v3[5];
    uint64_t v2 = vars8;
  }
  return a1;
}

- (id)valueForProperty:(SEL)a3 expectedClass:(Class)a4
{
  if (!a4)
  {
    v16 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"clazz != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSSettings(FBSSceneExtension) valueForProperty:expectedClass:]();
    }
    [v16 UTF8String];
    _bs_set_crash_log_message();
  }
  uint64_t v6 = FBSSettingForExtensionSelector(self->_baseClass, a3);
  if (v6)
  {
    id v7 = -[FBSSettings _valueForSetting:]((uint64_t)self, v6);
    id v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      -[FBSSetting defaultValue](v6);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = v9;
  }
  else
  {
    v10 = FBLogSceneExtension();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[FBSSettings(FBSSceneExtension) valueForProperty:expectedClass:](a3);
    }

    v11 = 0;
  }
  id v12 = v11;
  if (objc_opt_isKindOfClass()) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }
  id v14 = v13;

  return v14;
}

- (id)_valueForSetting:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v2 = -[FBSSettings _underlyingValueForSetting:](a1, a2);
    if (![@"<explicitly nil>" isEqual:v2]) {
      goto LABEL_5;
    }
  }
  uint64_t v2 = 0;
LABEL_5:

  return v2;
}

- (id)_underlyingValueForSetting:(uint64_t)a1
{
  id v3 = a2;
  BOOL v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      id v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"setting != ((void *)0)"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSSettings _underlyingValueForSetting:]();
      }
      [v14 UTF8String];
      _bs_set_crash_log_message();
    }
    if (*(unsigned char *)(a1 + 64)) {
      BOOL v5 = -[FBSSetting isBSSettings]((BOOL)v3);
    }
    else {
      BOOL v5 = 0;
    }
    uint64_t v6 = -[FBSSetting extensionID]((uint64_t)v4);
    char v7 = -[FBSSetting isLocal]((BOOL)v4);
    id v8 = -[FBSSettings _rootSettingsForLocal:createIfNeeded:]((id *)a1, v7, v5);
    id v9 = v8;
    if (v6)
    {
      uint64_t v10 = [v8 objectForKey:v6];

      id v9 = (void *)v10;
    }
    if (v9)
    {
      uint64_t v11 = -[FBSSetting setting]((uint64_t)v4);
      id v12 = [v9 objectForSetting:v11];
      if (v12)
      {
LABEL_12:

        goto LABEL_13;
      }
      if ([v9 flagForSetting:v11] != 0x7FFFFFFFFFFFFFFFLL) {
        BSSettingFlagIsYes();
      }
    }
    id v12 = 0;
    goto LABEL_12;
  }
  id v12 = 0;
LABEL_13:

  return v12;
}

- (id)_rootSettingsForLocal:(int)a3 createIfNeeded:
{
  if (a1)
  {
    if (a2) {
      -[FBSSettings _localSettings:](a1, a3);
    }
    else {
      -[FBSSettings _settings:](a1, a3);
    }
    a1 = (id *)objc_claimAutoreleasedReturnValue();
    uint64_t v3 = vars8;
  }
  return a1;
}

- (id)_settings:(id *)a1
{
  if (a1)
  {
    uint64_t v3 = a1;
    if (*((unsigned char *)a1 + 64)) {
      BOOL v4 = a2 == 0;
    }
    else {
      BOOL v4 = 1;
    }
    if (v4) {
      goto LABEL_12;
    }
    if (a1[2])
    {
      if (!*((unsigned char *)a1 + 65)) {
        goto LABEL_12;
      }
      uint64_t v5 = objc_opt_class();
      if (v5 != objc_opt_class()) {
        goto LABEL_12;
      }
      uint64_t v6 = [v3[2] mutableCopy];
      id v7 = v3[2];
      v3[2] = (id)v6;
    }
    else
    {
      uint64_t v8 = objc_opt_new();
      id v9 = v3[2];
      v3[2] = (id)v8;

      id v10 = v3[2];
      id v7 = [(id)objc_opt_class() _descriptionProvider];
      [v10 setDescriptionProvider:v7];
    }

LABEL_12:
    a1 = (id *)v3[2];
    uint64_t v2 = vars8;
  }
  return a1;
}

- (id)_localSettings:(id *)a1
{
  if (a1)
  {
    uint64_t v3 = a1;
    if (*((unsigned char *)a1 + 64)) {
      BOOL v4 = a2 == 0;
    }
    else {
      BOOL v4 = 1;
    }
    if (v4) {
      goto LABEL_12;
    }
    if (a1[3])
    {
      if (!*((unsigned char *)a1 + 65)) {
        goto LABEL_12;
      }
      uint64_t v5 = objc_opt_class();
      if (v5 != objc_opt_class()) {
        goto LABEL_12;
      }
      uint64_t v6 = [v3[3] mutableCopy];
      id v7 = v3[3];
      v3[3] = (id)v6;
    }
    else
    {
      uint64_t v8 = objc_opt_new();
      id v9 = v3[3];
      v3[3] = (id)v8;

      id v10 = v3[3];
      id v7 = [(id)objc_opt_class() _descriptionProvider];
      [v10 setDescriptionProvider:v7];
    }

LABEL_12:
    a1 = (id *)v3[3];
    uint64_t v2 = vars8;
  }
  return a1;
}

- (void)_setValue:(void *)a3 forSetting:(void *)a4 inSettings:
{
  v17 = a2;
  id v7 = a4;
  if (a1)
  {
    uint64_t v8 = a3;
    [v7 setDescriptionProvider:-[FBSSetting extension]((uint64_t)v8)];
    id v9 = -[FBSSetting name]((uint64_t)v8);
    -[FBSSetting defaultValue](v8);
    id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    unsigned __int8 v11 = -[FBSSetting isNullPreserving](v8);

    if (v17 && (v12 = [(__CFString *)v17 isEqual:v10], id v13 = v17, !v12))
    {
      if ((__CFString *)*MEMORY[0x1E4F1CFD0] == v17 || *MEMORY[0x1E4F1CFC8] == (void)v17)
      {
        if (v11) {
          BSSettingFlagForBool();
        }
        if ((__CFString *)*MEMORY[0x1E4F1CFD0] == v17) {
          uint64_t v16 = 1;
        }
        else {
          uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
        }
        [v7 setFlag:v16 forKey:v9];
        [v7 setObject:0 forKey:v9];
        goto LABEL_18;
      }
    }
    else
    {
      if ((v11 & 1) == 0)
      {
        id v14 = v7;
        id v13 = 0;
LABEL_17:
        [v14 setObject:v13 forKey:v9];
        [v7 setFlag:0x7FFFFFFFFFFFFFFFLL forKey:v9];
LABEL_18:

        goto LABEL_19;
      }
      if (v10) {
        id v13 = v10;
      }
      else {
        id v13 = @"<explicitly nil>";
      }
    }
    id v14 = v7;
    goto LABEL_17;
  }
LABEL_19:
}

- (id)_legacyLocalSettings
{
  if (a1)
  {
    a1 = -[FBSSettings _legacyLocalSettings:]((id *)a1, *(unsigned __int8 *)(a1 + 64));
    uint64_t v1 = vars8;
  }
  return (id)a1;
}

- (id)_legacyLocalSettings:(id *)a1
{
  if (a1)
  {
    uint64_t v3 = a1;
    if (*((unsigned char *)a1 + 64)) {
      BOOL v4 = a2 == 0;
    }
    else {
      BOOL v4 = 1;
    }
    if (v4) {
      goto LABEL_12;
    }
    if (a1[4])
    {
      if (!*((unsigned char *)a1 + 65)) {
        goto LABEL_12;
      }
      uint64_t v5 = objc_opt_class();
      if (v5 != objc_opt_class()) {
        goto LABEL_12;
      }
      uint64_t v6 = [v3[4] mutableCopy];
    }
    else
    {
      uint64_t v6 = objc_opt_new();
    }
    id v7 = v3[4];
    v3[4] = (id)v6;

LABEL_12:
    a1 = (id *)v3[4];
    uint64_t v2 = vars8;
  }
  return a1;
}

+ (id)_descriptionProvider
{
  uint64_t v2 = (void *)[a1 _baseClass];

  return (id)[v2 subclassExtension];
}

- (FBSSettings)initWithSettings:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = [v5 _baseClass];
  if (v5 == (void *)v6)
  {
    v23 = [NSString stringWithFormat:@"abstract superclass should not be instantiated"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSSettings initWithSettings:]();
    }
    [v23 UTF8String];
    _bs_set_crash_log_message();
  }
  uint64_t v8 = (objc_class *)v7;
  if (v4 && v7 != *((void *)v4 + 1))
  {
    v24 = NSString;
    v25 = NSStringFromClass((Class)v5);
    v26 = [v24 stringWithFormat:@"%@ cannot init with %@", v25, v4];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSSettings initWithSettings:]();
    }
    [v26 UTF8String];
    _bs_set_crash_log_message();
  }
  v27.receiver = self;
  v27.super_class = (Class)FBSSettings;
  id v9 = [(FBSSettings *)&v27 init];
  id v10 = v9;
  if (v9)
  {
    v9->_baseClass = v8;
    [v5 _mutableClass];
    v10->_mutable = objc_opt_isKindOfClass() & 1;
    uint64_t v11 = [v4 _progenitor];
    int v12 = (void *)v11;
    if (v11) {
      id v13 = (void *)v11;
    }
    else {
      id v13 = v4;
    }
    objc_storeWeak((id *)&v10->_progenitor, v13);

    if (v4)
    {
      if (v10->_mutable)
      {
        if (*((unsigned char *)v4 + 64))
        {
          uint64_t v14 = [*((id *)v4 + 2) mutableCopy];
          settings = v10->_settings;
          v10->_settings = (BSKeyedSettings *)v14;

          uint64_t v16 = [*((id *)v4 + 3) mutableCopy];
          localSettings = v10->_localSettings;
          v10->_localSettings = (BSKeyedSettings *)v16;

          uint64_t v18 = [*((id *)v4 + 5) mutableCopy];
          legacyOtherSettings = v10->_legacyOtherSettings;
          v10->_legacyOtherSettings = (BSSettings *)v18;

          uint64_t v20 = [*((id *)v4 + 4) mutableCopy];
          legacyLocalSettings = v10->_legacyLocalSettings;
          v10->_legacyLocalSettings = (BSSettings *)v20;

          BSEqualBools();
        }
      }
      v10->_needsCoW = v10->_mutable;
      BSSettingsIsEmpty();
    }
    FBSRealizeSubclassExtension((objc_class *)v5);
  }

  return v10;
}

+ (id)_legacyDescriptionProvider
{
  return objc_getAssociatedObject(a1, (const void *)_FBSLegacyDescriptionProviderKey);
}

- (id)_progenitor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_progenitor);

  return WeakRetained;
}

+ (Class)_counterpartClass
{
  return (Class)objc_getAssociatedObject(a1, (const void *)_FBSCounterpartKey);
}

- (id)_sceneExtensionNames
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA70] orderedSet];
  id v4 = -[FBSSettings _sceneExtensionsCreatingIfNeeded:](self, 0);
  uint64_t v5 = [v4 allKeys];
  uint64_t v6 = [v5 allObjects];
  uint64_t v7 = [v6 sortedArrayUsingComparator:&__block_literal_global_91];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [v4 objectForKey:*(void *)(*((void *)&v15 + 1) + 8 * i) withTransitionContext:v15];
        [v3 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v3;
}

- (id)_allSceneExtensions
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  orderedExtensions = self->_orderedExtensions;
  if (orderedExtensions)
  {
    uint64_t v3 = orderedExtensions;
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA70] orderedSet];
    v34 = self;
    uint64_t v6 = [(FBSSettings *)self _sceneExtensionNames];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v41 objects:v51 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v42;
      v35 = v6;
      v36 = v5;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v42 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(NSString **)(*((void *)&v41 + 1) + 8 * i);
          Class v12 = NSClassFromString(v11);
          if (v12)
          {
            [v5 addObject:v12];
          }
          else if (MEMORY[0x19F398C00]("-[FBSSettings _allSceneExtensions]") {
                 && [(NSString *)v11 rangeOfString:@"|"] != 0x7FFFFFFFFFFFFFFFLL)
          }
          {
            id v13 = [(NSString *)v11 substringFromIndex:[(NSString *)v11 rangeOfString:@"|"] + 1];
            if ([v13 length])
            {
              long long v39 = 0u;
              long long v40 = 0u;
              long long v37 = 0u;
              long long v38 = 0u;
              uint64_t v14 = [@"/System/Library/Frameworks/" stringByAppendingFormat:@"%@.framework/%@", v13, v13];
              v49[0] = v14;
              long long v15 = [@"/System/Library/PrivateFrameworks/" stringByAppendingFormat:@"%@.framework/%@", v13, v13];
              v49[1] = v15;
              long long v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:2];

              uint64_t v17 = [v16 countByEnumeratingWithState:&v37 objects:v50 count:16];
              if (v17)
              {
                uint64_t v18 = v17;
                uint64_t v19 = *(void *)v38;
                while (2)
                {
                  for (uint64_t j = 0; j != v18; ++j)
                  {
                    if (*(void *)v38 != v19) {
                      objc_enumerationMutation(v16);
                    }
                    v21 = dlopen((const char *)[*(id *)(*((void *)&v37 + 1) + 8 * j) fileSystemRepresentation], 257);
                    if (v21)
                    {
                      v23 = v21;

                      Class v24 = NSClassFromString(v11);
                      if (v24
                        && (Class v25 = v24,
                            [(objc_class *)v24 isSubclassOfClass:objc_opt_class()])
                        && [(objc_class *)v25 softLinkExtensionFrameworkInClient])
                      {
                        v26 = FBLogCommon();
                        uint64_t v6 = v35;
                        uint64_t v5 = v36;
                        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = 138543618;
                          v46 = v11;
                          __int16 v47 = 2114;
                          v48 = v13;
                          _os_log_error_impl(&dword_19C680000, v26, OS_LOG_TYPE_ERROR, "Found \"%{public}@\" after loading \"%{public}@\"", buf, 0x16u);
                        }

                        objc_super v27 = objc_opt_class();
                        v28 = [MEMORY[0x1E4F29238] valueWithPointer:v23];
                        objc_setAssociatedObject(v27, v25, v28, 0);

                        FBSRealizeSceneExtension(v25);
                        [v36 addObject:v25];
                      }
                      else
                      {
                        v29 = FBLogCommon();
                        uint64_t v6 = v35;
                        uint64_t v5 = v36;
                        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = 138543618;
                          v46 = v11;
                          __int16 v47 = 2114;
                          v48 = v13;
                          _os_log_error_impl(&dword_19C680000, v29, OS_LOG_TYPE_ERROR, "Failed to find scene extension \"%{public}@\" after loading \"%{public}@\")", buf, 0x16u);
                        }

                        dlclose(v23);
                      }
                      goto LABEL_33;
                    }
                  }
                  uint64_t v18 = [v16 countByEnumeratingWithState:&v37 objects:v50 count:16];
                  if (v18) {
                    continue;
                  }
                  break;
                }
              }

              v22 = FBLogCommon();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              {
                v30 = dlerror();
                *(_DWORD *)buf = 138543618;
                v46 = (NSString *)v13;
                __int16 v47 = 2082;
                v48 = v30;
                _os_log_error_impl(&dword_19C680000, v22, OS_LOG_TYPE_ERROR, "Unable to dlopen(%{public}@): %{public}s", buf, 0x16u);
              }

              uint64_t v6 = v35;
              uint64_t v5 = v36;
            }
LABEL_33:
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v41 objects:v51 count:16];
      }
      while (v8);
    }
    uint64_t v31 = [v5 copy];
    v32 = v34->_orderedExtensions;
    v34->_orderedExtensions = (NSOrderedSet *)v31;

    uint64_t v3 = v34->_orderedExtensions;
  }

  return v3;
}

- (id)_sceneExtensionsCreatingIfNeeded:(void *)a1
{
  if (a1)
  {
    a1 = -[FBSSettings _subSettingsForKey:local:createIfNeeded:]((uint64_t)a1, @"FBSSceneExtensions", 0, a2);
    uint64_t v2 = vars8;
  }
  return a1;
}

- (id)_subSettingsForKey:(char)a3 local:(int)a4 createIfNeeded:
{
  id v7 = a2;
  uint64_t v8 = v7;
  if (a1)
  {
    if (!v7)
    {
      Class v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"key != ((void *)0)"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSSettings _subSettingsForKey:local:createIfNeeded:]();
      }
      [v12 UTF8String];
      _bs_set_crash_log_message();
    }
    uint64_t v9 = -[FBSSettings _rootSettingsForLocal:createIfNeeded:]((id *)a1, a3, a4);
    uint64_t v10 = [v9 objectForKey:v8];
    if (!v10 && a4)
    {
      if (!*(unsigned char *)(a1 + 64))
      {
        id v13 = [NSString stringWithFormat:@"this class is not mutable"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          -[FBSSettings _subSettingsForKey:local:createIfNeeded:]();
        }
        [v13 UTF8String];
        _bs_set_crash_log_message();
      }
      uint64_t v10 = objc_opt_new();
      [v9 setObject:v10 forKey:v8];
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

+ (void)_setCounterpartClass:(Class)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    uint64_t v20 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"counterpart"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[FBSSettings _setCounterpartClass:]();
    }
    [v20 UTF8String];
    _bs_set_crash_log_message();
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__FBSSettings__setCounterpartClass___block_invoke;
  block[3] = &__block_descriptor_48_e5_v8__0l;
  block[4] = a2;
  block[5] = a1;
  if (_setCounterpartClass__onceToken != -1) {
    dispatch_once(&_setCounterpartClass__onceToken, block);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&_setCounterpartClass__lock);
  uint64_t v5 = objc_getAssociatedObject(a1, (const void *)_FBSCounterpartKey);

  if (!v5)
  {
    if (([a1 isSubclassOfClass:objc_opt_class()] & 1) != 0
      || [a1 isSubclassOfClass:objc_opt_class()])
    {
      class_getMethodImplementation((Class)a1, sel_copyWithZone_);
      uint64_t v6 = dyld_image_header_containing_address();
      id v7 = a3;
    }
    else
    {
      class_getMethodImplementation(a3, sel_copyWithZone_);
      uint64_t v6 = dyld_image_header_containing_address();
      id v7 = (objc_class *)a1;
    }
    class_getMethodImplementation(v7, sel_mutableCopyWithZone_);
    uint64_t v8 = dyld_image_header_containing_address();
    uint64_t v9 = v8;
    if (v8 && v8 != _setCounterpartClass__fbsAddress && v8 == v6)
    {
      uint64_t v10 = FBLogSceneExtension();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = NSStringFromClass((Class)a1);
        Class v12 = NSStringFromClass(a3);
        *(_DWORD *)buf = 138543618;
        v23 = v11;
        __int16 v24 = 2114;
        Class v25 = v12;
        _os_log_impl(&dword_19C680000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ setting counterpart class: %{public}@", buf, 0x16u);
      }
      objc_setAssociatedObject(a1, (const void *)_FBSCounterpartKey, a3, 0);
      objc_setAssociatedObject(a3, (const void *)_FBSCounterpartKey, a1, 0);
    }
    else
    {
      id v13 = [NSString bs_stringWithUTF8String:dyld_image_path_containing_address()];
      uint64_t v14 = [v13 lastPathComponent];

      long long v15 = [NSString bs_stringWithUTF8String:dyld_image_path_containing_address()];
      long long v16 = [v15 lastPathComponent];

      uint64_t v17 = FBLogSceneExtension();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = NSStringFromClass((Class)a1);
        uint64_t v19 = NSStringFromClass(a3);
        *(_DWORD *)buf = 138544898;
        v23 = v18;
        __int16 v24 = 2114;
        Class v25 = v19;
        __int16 v26 = 2114;
        objc_super v27 = v14;
        __int16 v28 = 2048;
        uint64_t v29 = v9;
        __int16 v30 = 2114;
        uint64_t v31 = v16;
        __int16 v32 = 2048;
        uint64_t v33 = v6;
        __int16 v34 = 2048;
        uint64_t v35 = _setCounterpartClass__fbsAddress;
        _os_log_impl(&dword_19C680000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ ignoring counterpart %{public}@ that is not from the same executable (%{public}@:%p/%{public}@:%p/%p)!", buf, 0x48u);
      }
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_setCounterpartClass__lock);
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedExtensions, 0);
  objc_destroyWeak((id *)&self->_progenitor);
  objc_storeStrong((id *)&self->_legacyOtherSettings, 0);
  objc_storeStrong((id *)&self->_legacyLocalSettings, 0);
  objc_storeStrong((id *)&self->_localSettings, 0);

  objc_storeStrong((id *)&self->_settings, 0);
}

- (id)valueForSetting:(id)a3
{
  id v4 = (os_unfair_lock_s *)a3;
  if (!v4)
  {
    uint64_t v11 = 0;
    goto LABEL_41;
  }
  uint64_t v5 = -[FBSSettings _valueForSetting:]((uint64_t)self, v4);
  if (v5)
  {
    int v6 = -[FBSSetting type]((uint64_t)v4);
    if (v6 == 64)
    {
      id v7 = v5;
      if (!_NSIsNSValue()) {
        goto LABEL_27;
      }
      id v7 = v7;
      if (*(unsigned char *)[v7 objCType] != 64) {
        goto LABEL_27;
      }
      uint64_t v8 = objc_opt_class();
      id v9 = v7;
      if (v8) {
        id v10 = (objc_opt_isKindOfClass() & 1) != 0 ? v9 : 0;
      }
      else {
        id v10 = 0;
      }
      id v18 = v10;

      id v7 = [v18 weakObjectValue];

      if (v7)
      {
LABEL_27:
        -[FBSSetting expectedClass]((uint64_t)v4);
        if (-[FBSSetting specialCollection](v4) == (os_unfair_lock_s *)0x7FFFFFFFFFFFFFFFLL)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 || [v7 count]) {
            BSSettingFlagIsYes();
          }
        }
        BSSettingFlagIsYes();
      }
      id v17 = 0;
    }
    else
    {
      if ((v6 & 0xFFFFFFEF) != 0x2A && v6 != 123 && v6 == 35)
      {
        uint64_t v12 = objc_opt_class();
        id v13 = v5;
        if (v12)
        {
          if (objc_opt_isKindOfClass()) {
            uint64_t v14 = v13;
          }
          else {
            uint64_t v14 = 0;
          }
        }
        else
        {
          uint64_t v14 = 0;
        }
        uint64_t v20 = v14;

        NSClassFromString(v20);
        id v17 = (id)objc_claimAutoreleasedReturnValue();

        if (v17) {
          goto LABEL_34;
        }
        goto LABEL_38;
      }
      uint64_t v15 = objc_opt_class();
      id v7 = v5;
      if (v15)
      {
        if (objc_opt_isKindOfClass()) {
          long long v16 = v7;
        }
        else {
          long long v16 = 0;
        }
      }
      else
      {
        long long v16 = 0;
      }
      id v17 = v16;
    }

    if (v17)
    {
LABEL_34:
      id v19 = v17;
LABEL_39:
      uint64_t v11 = v19;

      goto LABEL_40;
    }
LABEL_38:
    -[FBSSetting defaultValue](v4);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_39;
  }
  uint64_t v11 = -[FBSSetting defaultValue](v4);
LABEL_40:

LABEL_41:

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (FBSSettings *)a3;
  p_isa = &v4->super.isa;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && self->_baseClass == p_isa[1]
      && [(FBSSettings *)self _isEqualToSettings:p_isa];

  return v6;
}

- (BOOL)_isEqualToSettings:(id)a3
{
  id v3 = a3;
  BSSettingsIsEmpty();
}

- (id)_copyClearingProgenitor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self)
  {
    BOOL v6 = self->_mutable;
    if (v4)
    {
LABEL_8:
      uint64_t v8 = [(FBSSettings *)self copy:v4];
      goto LABEL_9;
    }
  }
  else
  {
    BOOL v6 = 0;
    if (v4) {
      goto LABEL_8;
    }
  }
  if (v6) {
    goto LABEL_8;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_progenitor);

  if (WeakRetained) {
    uint64_t v8 = (FBSSettings *)[objc_alloc((Class)objc_opt_class()) initWithSettings:self];
  }
  else {
    uint64_t v8 = self;
  }
LABEL_9:
  id v9 = v8;
  objc_storeWeak((id *)&v8->_progenitor, 0);

  return v9;
}

- (BOOL)_isEmptyForCoding:(BOOL)a3
{
}

- (id)copy:(id)a3
{
  if (a3)
  {
    id v4 = -[FBSSettings mutableCopy:](self, "mutableCopy:");
    uint64_t v5 = (void *)[v4 copy];

    return v5;
  }
  else
  {
    return (id)[(FBSSettings *)self copy];
  }
}

- (id)_settings
{
  if (a1)
  {
    a1 = -[FBSSettings _settings:]((id *)a1, *(unsigned __int8 *)(a1 + 64));
    uint64_t v1 = vars8;
  }
  return (id)a1;
}

- (id)_localSettings
{
  if (a1)
  {
    a1 = -[FBSSettings _localSettings:]((id *)a1, *(unsigned __int8 *)(a1 + 64));
    uint64_t v1 = vars8;
  }
  return (id)a1;
}

- (BOOL)_isMutable
{
  if (result) {
    return *(unsigned char *)(result + 64) != 0;
  }
  return result;
}

- (id)mutableCopy:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  uint64_t v5 = (void *)[(FBSSettings *)self mutableCopy];
  if (v4) {
    v4[2](v4, v5);
  }

  return v5;
}

- (void)_removeVolatileSettings
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

- (void)_clearVolatileSettingsFromSettings:(uint64_t)a1
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v5 = [v3 allKeys];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (!v6) {
      goto LABEL_27;
    }
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (1)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(NSString **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v11 = [v4 objectForKey:v10];
        if (v11)
        {
          SEL v12 = NSSelectorFromString(v10);
          if (v12)
          {
            FBSSettingForExtensionSelector(*(void **)(a1 + 8), v12);
            id v13 = (unsigned char *)objc_claimAutoreleasedReturnValue();
            if ((-[FBSSetting isVolatile](v13) & 1) == 0)
            {
              if (!v13)
              {
LABEL_14:
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  -[FBSSettings _clearVolatileSettingsFromSettings:](a1, v11);
                }
                id v13 = 0;
              }
LABEL_17:

              goto LABEL_18;
            }
          }
          else
          {
            id v13 = 0;
            if (!-[FBSSetting isVolatile](0)) {
              goto LABEL_14;
            }
          }
          -[FBSSettings _setValue:forSetting:](a1, 0, v13);
          goto LABEL_17;
        }
LABEL_18:
        if ([v4 flagForKey:v10] != 0x7FFFFFFFFFFFFFFFLL)
        {
          SEL v14 = NSSelectorFromString(v10);
          if (v14)
          {
            FBSSettingForExtensionSelector(*(void **)(a1 + 8), v14);
            uint64_t v15 = (unsigned char *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            uint64_t v15 = 0;
          }
          if (-[FBSSetting isVolatile](v15)) {
            -[FBSSettings _setValue:forSetting:](a1, 0, v15);
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (!v7)
      {
LABEL_27:

        break;
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (self && self->_mutable)
  {
    id v3 = [(objc_class *)self->_baseClass allocWithZone:a3];
    return [(objc_class *)v3 initWithSettings:self];
  }
  else
  {
    return self;
  }
}

- (void)encodeWithBSXPCCoder:(id)a3
{
}

- (void)_addSceneExtension:(Class)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    objc_super v27 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"extension != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSSettings _addSceneExtension:]();
    }
    [v27 UTF8String];
    _bs_set_crash_log_message();
  }
  if (!self || !self->_mutable)
  {
    __int16 v26 = [NSString stringWithFormat:@"this class is not mutable"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSSettings _addSceneExtension:]();
    }
    [v26 UTF8String];
    _bs_set_crash_log_message();
  }
  if (([(objc_class *)a3 isSubclassOfClass:objc_opt_class()] & 1) == 0)
  {
    __int16 v28 = [NSString stringWithFormat:@"%@ is not a FBSSceneExtension", a3];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSSettings _addSceneExtension:]();
    }
    [v28 UTF8String];
    _bs_set_crash_log_message();
  }
  FBSRealizeSceneExtension(a3);
  uint64_t v5 = [(FBSSettings *)self _allSceneExtensions];
  char v6 = [v5 containsObject:a3];

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = -[FBSSettings _sceneExtensionsCreatingIfNeeded:](self, 1);
    uint64_t v8 = NSString;
    uint8_t v9 = [v7 allKeys];
    id v10 = [v8 stringWithFormat:@"%llu", objc_msgSend(v9, "count") + 1];

    uint64_t v11 = NSStringFromClass(a3);
    if (MEMORY[0x19F398C00]("-[FBSSettings _addSceneExtension:]")
      && [(objc_class *)a3 softLinkExtensionFrameworkInClient])
    {
      SEL v12 = [(objc_class *)a3 _frameworkNameLoadingIfNeeded:1];
      uint64_t v13 = [v11 stringByAppendingFormat:@"|%@", v12];

      uint64_t v11 = (void *)v13;
    }
    [v7 setObject:v11 forKey:v10];
    orderedExtensions = self->_orderedExtensions;
    if (orderedExtensions)
    {
      uint64_t v15 = (NSOrderedSet *)[(NSOrderedSet *)orderedExtensions mutableCopy];
      [(NSOrderedSet *)v15 addObject:a3];
      long long v16 = (NSOrderedSet *)[(NSOrderedSet *)v15 copy];
      long long v17 = self->_orderedExtensions;
      self->_orderedExtensions = v16;
    }
    else
    {
      long long v18 = [MEMORY[0x1E4F1CAA0] orderedSetWithObject:a3];
      uint64_t v15 = self->_orderedExtensions;
      self->_orderedExtensions = v18;
    }

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v19 = [(id)objc_opt_class() _settingsExtensionsForSceneExtension:a3];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v30 != v22) {
            objc_enumerationMutation(v19);
          }
          __int16 v24 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          uint64_t v25 = objc_opt_class();
          FBSRealizeSettingsExtension(v25, v24);
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v21);
    }
  }
}

- (FBSSettings)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FBSSettings *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_settings"];
    settings = v5->_settings;
    v5->_settings = (BSKeyedSettings *)v6;

    uint64_t v8 = v5->_settings;
    uint8_t v9 = [(id)objc_opt_class() _descriptionProvider];
    [(BSKeyedSettings *)v8 setDescriptionProvider:v9];

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_legacyOtherSettings"];
    legacyOtherSettings = v5->_legacyOtherSettings;
    v5->_legacyOtherSettings = (BSSettings *)v10;

    SEL v12 = v5->_legacyOtherSettings;
    uint64_t v13 = [(id)objc_opt_class() _legacyDescriptionProvider];
    [(BSSettings *)v12 setDescriptionProvider:v13];
  }
  return v5;
}

- (FBSSettings)init
{
  return [(FBSSettings *)self initWithSettings:0];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  if (self && self->_mutable) {
    uint64_t v5 = objc_opt_class();
  }
  else {
    uint64_t v5 = (void *)[(id)objc_opt_class() _mutableClass];
  }
  uint64_t v6 = (void *)[v5 allocWithZone:a3];

  return (id)[v6 initWithSettings:self];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    return;
  }
  id v3 = (id)[a1 _baseClass];
  id v4 = (id)[a1 _mutableClass];
  if (v3 != a1)
  {
    if (v4 != a1)
    {
      value = objc_alloc((Class)a1);
      value[64] = [a1 isSubclassOfClass:[a1 _mutableClass]];
      *((void *)value + 1) = [a1 _baseClass];
      objc_setAssociatedObject(a1, (const void *)_FBSLegacyDescriptionProviderKey, value, (void *)1);

      return;
    }
    id v4 = (id)[a1 _baseClass];
  }
  objc_setAssociatedObject(a1, (const void *)_FBSCounterpartKey, v4, 0);
  uint64_t v5 = (const void *)_FBSCounterpartKey;

  objc_setAssociatedObject(v4, v5, a1, 0);
}

- (BOOL)_hasAnySceneExtension
{
}

uint64_t __36__FBSSettings__setCounterpartClass___block_invoke(uint64_t a1)
{
  uint64_t v2 = (objc_class *)objc_opt_class();
  class_getMethodImplementation(v2, sel_initWithSettings_);
  uint64_t result = dyld_image_header_containing_address();
  _setCounterpartClass__fbsAddress = result;
  if (!result)
  {
    id v4 = [NSString stringWithFormat:@"count not find executable name for FrontBoardServices"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      __36__FBSSettings__setCounterpartClass___block_invoke_cold_1(a1);
    }
    [v4 UTF8String];
    _bs_set_crash_log_message();
  }
  return result;
}

- (BOOL)_indirect_isEmpty
{
  if (self) {
    LOBYTE(self) = [(FBSSettings *)self _isEmptyForCoding:0];
  }
  return (char)self;
}

+ (Class)_diffClass
{
  return (Class)objc_opt_class();
}

+ (id)_settingsExtensionsForSceneExtension:(Class)a3
{
  return 0;
}

- (void)_addSceneExtension:(Class)a3 applyingSettings:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (!v6)
  {
    uint64_t v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"fromSettings"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSSettings _addSceneExtension:applyingSettings:]();
    }
    [v10 UTF8String];
    _bs_set_crash_log_message();
  }
  uint64_t v7 = v6;
  if (self->_baseClass != (Class)*((void *)v6 + 1))
  {
    uint64_t v11 = [NSString stringWithFormat:@"class mismatch"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSSettings _addSceneExtension:applyingSettings:]();
    }
    [v11 UTF8String];
    _bs_set_crash_log_message();
  }
  [(FBSSettings *)self _addSceneExtension:a3];
  memset(v12, 0, sizeof(v12));
  uint64_t v8 = [(id)objc_opt_class() _settingsExtensionsForSceneExtension:a3];
  if ([v8 countByEnumeratingWithState:v12 objects:v13 count:16])
  {
    uint8_t v9 = NSStringFromClass(**((Class **)&v12[0] + 1));
    -[FBSSettings _subSettingsForKey:local:createIfNeeded:]((uint64_t)v7, v9, 0, 0);
    objc_claimAutoreleasedReturnValue();
    BSSettingsIsEmpty();
  }
}

- (void)_removeSceneExtension:(Class)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    objc_super v27 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"extensionToRemove != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSSettings _removeSceneExtension:]();
    }
    [v27 UTF8String];
    _bs_set_crash_log_message();
  }
  if (!self || !self->_mutable)
  {
    __int16 v26 = [NSString stringWithFormat:@"this class is not mutable"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSSettings _removeSceneExtension:]();
    }
    [v26 UTF8String];
    _bs_set_crash_log_message();
  }
  if (([(objc_class *)a3 isSubclassOfClass:objc_opt_class()] & 1) == 0)
  {
    __int16 v28 = [NSString stringWithFormat:@"%@ is not a FBSSceneExtension", a3];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSSettings _removeSceneExtension:]();
    }
    [v28 UTF8String];
    _bs_set_crash_log_message();
  }
  uint64_t v5 = [(FBSSettings *)self _allSceneExtensions];
  int v6 = [v5 containsObject:a3];

  if (v6)
  {
    uint64_t v7 = -[FBSSettings _sceneExtensionsCreatingIfNeeded:](self, 1);
    uint64_t v8 = [v7 allKeys];
    uint8_t v9 = [v8 allObjects];
    uint64_t v10 = [v9 sortedArrayUsingComparator:&__block_literal_global_29];

    uint64_t v11 = objc_opt_new();
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v12 = v10;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v34 != v15) {
            objc_enumerationMutation(v12);
          }
          long long v17 = [v7 objectForKey:*(void *)(*((void *)&v33 + 1) + 8 * i)];
          Class v18 = NSClassFromString(v17);

          if (v18) {
            BOOL v19 = v18 == a3;
          }
          else {
            BOOL v19 = 1;
          }
          if (!v19) {
            [v11 addObject:v18];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v14);
    }

    [v7 removeAllSettings];
    orderedExtensions = self->_orderedExtensions;
    self->_orderedExtensions = 0;

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v21 = v11;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v30;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v30 != v24) {
            objc_enumerationMutation(v21);
          }
          [(FBSSettings *)self _addSceneExtension:*(void *)(*((void *)&v29 + 1) + 8 * j)];
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v23);
    }
  }
}

uint64_t __37__FBSSettings__removeSceneExtension___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 compare:a3 options:64];
}

- (void)_removeAllSceneExtensions
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (BOOL)_hasAdditionalDescription
{
  return 0;
}

- (void)_isEmpty
{
  if (a1) {
    return (void *)[a1 _isEmptyForCoding:0];
  }
  return a1;
}

- (void)_applySettings:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    if (!*(unsigned char *)(a1 + 64))
    {
      id v12 = [NSString stringWithFormat:@"this class is not mutable"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSSettings _applySettings:]();
      }
      [v12 UTF8String];
      _bs_set_crash_log_message();
    }
    if (*(id *)(a1 + 8) != v3[1])
    {
      uint64_t v13 = [NSString stringWithFormat:@"class mismatch"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSSettings _applySettings:]();
      }
      [v13 UTF8String];
      _bs_set_crash_log_message();
    }
    uint64_t v14 = v3;
    uint64_t v4 = -[FBSSettings _settings:]((id *)a1, 1);
    uint64_t v5 = -[FBSSettings _settings:](v14, 0);
    [v4 applySettings:v5];

    uint64_t v6 = -[FBSSettings _localSettings:]((id *)a1, 1);
    uint64_t v7 = -[FBSSettings _localSettings:](v14, 0);
    [v6 applySettings:v7];

    uint64_t v8 = -[FBSSettings _legacyOtherSettings:]((id *)a1, 1);
    uint8_t v9 = -[FBSSettings _legacyOtherSettings:](v14, 0);
    [v8 applySettings:v9];

    uint64_t v10 = -[FBSSettings _legacyLocalSettings:]((id *)a1, 1);
    uint64_t v11 = -[FBSSettings _legacyLocalSettings:](v14, 0);
    [v10 applySettings:v11];

    id v3 = v14;
  }
}

- (BOOL)conformsToExtension:(Class)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(FBSSettings *)self _allSceneExtensions];
  char v6 = [v5 containsObject:a3];

  if (v6) {
    return 1;
  }
  if ([(objc_class *)a3 isSubclassOfClass:objc_opt_class()])
  {
    uint64_t v8 = [(id)objc_opt_class() _settingsExtensionsForSceneExtension:a3];
  }
  else
  {
    v20[0] = a3;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        if (!FBSSettingsExtensionIsRealized((uint64_t)self->_baseClass, *(void *)(*((void *)&v15 + 1) + 8 * i)))
        {
          BOOL v7 = 0;
          goto LABEL_16;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  BOOL v7 = 1;
LABEL_16:

  return v7;
}

+ (id)settingForProperty:(SEL)a3
{
  if ((id)objc_opt_class() == a1)
  {
    char v6 = [NSString stringWithFormat:@"must call on a concrete subclass"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[FBSSettings settingForProperty:]();
    }
    [v6 UTF8String];
    _bs_set_crash_log_message();
  }

  return FBSSettingForSelector(a1, a3);
}

+ (id)settingForSubclassProperty:(SEL)a3
{
  if ((id)objc_opt_class() == a1)
  {
    char v6 = [NSString stringWithFormat:@"must call on a concrete subclass"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[FBSSettings settingForSubclassProperty:]();
    }
    [v6 UTF8String];
    _bs_set_crash_log_message();
  }

  return FBSSettingForLegacySelector((objc_class *)a1, a3);
}

+ (id)allSettings
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v4 = [NSString stringWithFormat:@"must call on a concrete subclass"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[FBSSettings allSettings]();
    }
    [v4 UTF8String];
    _bs_set_crash_log_message();
  }

  return FBSAllSettings(a1);
}

+ (id)allSettingsFromProtocol:(id)a3
{
  id v4 = a3;
  if ((id)objc_opt_class() == a1)
  {
    BOOL v7 = [NSString stringWithFormat:@"must call on a concrete subclass"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[FBSSettings allSettingsFromProtocol:]();
    }
    [v7 UTF8String];
    _bs_set_crash_log_message();
  }
  uint64_t v5 = FBSAllSettingsFromProtocol(a1, v4);

  return v5;
}

+ (id)allSettingsFromExtension:(Class)a3
{
  if (([(objc_class *)a3 isSubclassOfClass:objc_opt_class()] & 1) == 0)
  {
    uint64_t v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[extension isSubclassOfClass:[FBSSettingsExtension class]]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[FBSSettings allSettingsFromExtension:]();
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
  }
  uint64_t v5 = [(objc_class *)a3 protocol];
  char v6 = [a1 allSettingsFromProtocol:v5];

  return v6;
}

- (BOOL)containsSetting:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = -[FBSSettings _underlyingValueForSetting:]((uint64_t)self, a3);

  return v3 != 0;
}

- (unint64_t)hash
{
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  unint64_t v5 = [v4 hash];

  if (!self || !self->_mutable)
  {
    unint64_t v6 = 0x94D049BB133111EBLL
       * ((0xBF58476D1CE4E5B9 * (v5 ^ (v5 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v5 ^ (v5 >> 30))) >> 27));
    unint64_t v7 = [(BSKeyedSettings *)self->_settings hash];
    unint64_t v8 = 0x94D049BB133111EBLL
       * ((0xBF58476D1CE4E5B9 * (v7 ^ (v7 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v7 ^ (v7 >> 30))) >> 27));
    return v6 ^ ((v8 ^ v6) >> 31) ^ v8;
  }
  return v5;
}

- (NSString)description
{
  return (NSString *)[(FBSSettings *)self descriptionWithMultilinePrefix:0];
}

- (NSString)debugDescription
{
  return (NSString *)-[FBSSettings debugDescriptionWithMultilinePrefix:](self, 0);
}

- (id)debugDescriptionWithMultilinePrefix:(void *)a1
{
  if (a1)
  {
    uint64_t v2 = -[FBSSettings _descriptionBuilderWithMultilinePrefix:debug:](a1, a2, 1);
    id v3 = [v2 build];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)succinctDescription
{
  uint64_t v2 = [(FBSSettings *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[off_1E58F44F0 builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(FBSSettings *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[FBSSettings _descriptionBuilderWithMultilinePrefix:debug:](self, a3, 0);
}

- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 debug:
{
  id v5 = a2;
  if (a1)
  {
    [a1 succinctDescriptionBuilder];
    [(id)objc_claimAutoreleasedReturnValue() setUseDebugDescription:a3];
    BSSettingsIsEmpty();
  }

  return 0;
}

void __60__FBSSettings__descriptionBuilderWithMultilinePrefix_debug___block_invoke()
{
}

- (FBSSettings)initWithXPCDictionary:(id)a3
{
  id v4 = [off_1E58F45A8 coderWithMessage:a3];
  id v5 = [(FBSSettings *)self initWithBSXPCCoder:v4];

  return v5;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4 = [off_1E58F45A8 coderWithMessage:a3];
  [(FBSSettings *)self encodeWithBSXPCCoder:v4];
}

- (BOOL)settings:(id)a3 appendDescriptionToBuilder:(id)a4 forFlag:(int64_t)a5 object:(id)a6 ofSetting:(unint64_t)a7
{
  return 0;
}

- (id)settings:(id)a3 keyDescriptionForSetting:(unint64_t)a4
{
  return [(FBSSettings *)self keyDescriptionForSetting:a4];
}

- (id)settings:(id)a3 valueDescriptionForFlag:(int64_t)a4 object:(id)a5 ofSetting:(unint64_t)a6
{
  return [(FBSSettings *)self valueDescriptionForFlag:a4 object:a5 ofSetting:a6];
}

- (BOOL)appendDescriptionToBuilder:(id)a3 forFlag:(int64_t)a4 object:(id)a5 ofSetting:(unint64_t)a6
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

+ (Class)_baseClass
{
  OUTLINED_FUNCTION_7_2();
  uint64_t v2 = objc_opt_class();
  OUTLINED_FUNCTION_6_4(v2);
  return 0;
}

+ (Class)_mutableClass
{
  OUTLINED_FUNCTION_7_2();
  uint64_t v2 = objc_opt_class();
  OUTLINED_FUNCTION_6_4(v2);
  return 0;
}

+ (Class)subclassExtension
{
  OUTLINED_FUNCTION_7_2();
  uint64_t v2 = objc_opt_class();
  OUTLINED_FUNCTION_6_4(v2);
  return 0;
}

+ (id)subclassExtensions
{
  OUTLINED_FUNCTION_7_2();
  uint64_t v2 = objc_opt_class();
  OUTLINED_FUNCTION_6_4(v2);
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (Class)mutableSubclass
{
  OUTLINED_FUNCTION_7_2();
  uint64_t v2 = objc_opt_class();
  OUTLINED_FUNCTION_6_4(v2);
  return 0;
}

+ (Class)immutableSubclass
{
  OUTLINED_FUNCTION_7_2();
  uint64_t v2 = objc_opt_class();
  OUTLINED_FUNCTION_6_4(v2);
  return 0;
}

- (void)initWithSettings:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithSettings:.cold.2()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)_setCounterpartClass:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __36__FBSSettings__setCounterpartClass___block_invoke_cold_1(uint64_t a1)
{
  SEL v1 = NSStringFromSelector(*(SEL *)(a1 + 32));
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v3, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, v5, v6, v7, 2u);
}

- (void)_underlyingValueForSetting:.cold.1()
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

- (void)_setValue:forSetting:.cold.1()
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

- (void)_setValue:forSetting:.cold.2()
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

- (void)_subSettingsForKey:local:createIfNeeded:.cold.1()
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

- (void)_subSettingsForKey:local:createIfNeeded:.cold.2()
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

- (void)_addSceneExtension:.cold.1()
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

- (void)_addSceneExtension:.cold.2()
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

- (void)_addSceneExtension:.cold.3()
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

- (void)_addSceneExtension:applyingSettings:.cold.1()
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

- (void)_addSceneExtension:applyingSettings:.cold.2()
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

- (void)_removeSceneExtension:.cold.1()
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

- (void)_removeSceneExtension:.cold.2()
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

- (void)_removeSceneExtension:.cold.3()
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

- (void)_applySettings:.cold.1()
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

- (void)_applySettings:.cold.2()
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

+ (void)settingForProperty:.cold.1()
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

+ (void)settingForSubclassProperty:.cold.1()
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

+ (void)allSettings
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

+ (void)allSettingsFromProtocol:.cold.1()
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

+ (void)allSettingsFromExtension:.cold.1()
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

- (void)valueForSetting:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1 = *MEMORY[0x1E4F143B8];
  -[FBSSetting name](a1);
  objc_claimAutoreleasedReturnValue();
  BSSettingFlagIsYes();
}

@end