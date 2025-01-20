@interface FBSSetting
+ (id)settingWithName:(uint64_t)a3 settingsClass:(void *)a4 extension:(char)a5 local:(char)a6 type:(uint64_t)a7 legacySetting:(void *)a8 expectedClass:;
- (BOOL)indirect_isLegacy;
- (BOOL)indirect_isPropagating;
- (BOOL)isBSSettings;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLegacy;
- (BOOL)isLocal;
- (BOOL)matchesProperty:(SEL)a3;
- (BOOL)matchesPropertyName:(id)a3;
- (NSString)description;
- (_BYTE)isNullPreserving;
- (_BYTE)isRedacted;
- (_BYTE)isVolatile;
- (id)indirect_name;
- (os_unfair_lock_s)specialCollection;
- (uint64_t)expectedClass;
- (uint64_t)extension;
- (uint64_t)extensionID;
- (uint64_t)legacySetting;
- (uint64_t)name;
- (uint64_t)setting;
- (uint64_t)type;
- (unint64_t)hash;
- (unint64_t)indirect_legacySetting;
- (void)_finishInitializing;
- (void)defaultValue;
- (void)descriptionProvider;
- (void)setDefaultValue:(id)a3;
- (void)setDescriptionProvider:(id)a3;
- (void)setNullPreserving:(BOOL)a3;
- (void)setPrivacySensitive:(BOOL)a3;
- (void)setPropagating:(BOOL)a3;
- (void)setSpecialCollection:(uint64_t)a1;
- (void)setVolatile:(BOOL)a3;
@end

@implementation FBSSetting

- (unint64_t)hash
{
  return [(NSString *)self->_name hash];
}

- (uint64_t)extensionID
{
  if (result) {
    return *(void *)(result + 72);
  }
  return result;
}

- (BOOL)isLocal
{
  if (result) {
    return *(unsigned char *)(result + 25) != 0;
  }
  return result;
}

- (uint64_t)setting
{
  if (result) {
    return *(void *)(result + 48);
  }
  return result;
}

- (BOOL)isBSSettings
{
  if (result) {
    return *(unsigned char *)(result + 28) != 0;
  }
  return result;
}

- (uint64_t)name
{
  if (result) {
    return *(void *)(result + 40);
  }
  return result;
}

- (_BYTE)isNullPreserving
{
  if (result)
  {
    v1 = result;
    [result _finishInitializing];
    return (unsigned char *)(v1[32] != 0);
  }
  return result;
}

- (void)defaultValue
{
  if (a1)
  {
    v2 = a1;
    [a1 _finishInitializing];
    v3 = (void *)v2[12];
    if (v3 == (void *)*MEMORY[0x1E4F1D260]) {
      v3 = 0;
    }
    a1 = v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_finishInitializing
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_lock_initialized)
  {
    [(objc_class *)self->_extension configureSetting:self];
    self->_lock_initialized = 1;
  }

  os_unfair_lock_unlock(p_lock);
}

- (uint64_t)extension
{
  if (result) {
    return *(void *)(result + 64);
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (FBSSetting *)a3;
  if (v4)
  {
    if (v4 == self)
    {
      BOOL v5 = 1;
      goto LABEL_11;
    }
    if (self->_type == v4->_type
      && self->_setting == v4->_setting
      && self->_legacySetting == v4->_legacySetting
      && self->_expectedClass == v4->_expectedClass
      && self->_settingsClass == v4->_settingsClass)
    {
      BSEqualBools();
    }
  }
  BOOL v5 = 0;
LABEL_11:

  return v5;
}

- (BOOL)indirect_isLegacy
{
  return self->_legacy;
}

- (BOOL)indirect_isPropagating
{
  if (self)
  {
    v2 = self;
    [(FBSSetting *)self _finishInitializing];
    LOBYTE(self) = v2->_propagating;
  }
  return (char)self;
}

- (uint64_t)type
{
  if (a1) {
    return *(char *)(a1 + 27);
  }
  else {
    return 0;
  }
}

- (os_unfair_lock_s)specialCollection
{
  uint64_t v1 = a1;
  if (a1)
  {
    v2 = a1 + 2;
    os_unfair_lock_lock(a1 + 2);
    uint64_t v1 = *(os_unfair_lock_s **)&v1[22]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (uint64_t)expectedClass
{
  if (result) {
    return *(void *)(result + 80);
  }
  return result;
}

- (BOOL)matchesProperty:(SEL)a3
{
  v3 = self;
  FBSSettingForSelector(self->_settingsClass, a3);
  v4 = (FBSSetting *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = v4 == v3;

  return (char)v3;
}

- (BOOL)isLegacy
{
  if (result) {
    return *(unsigned char *)(result + 26) != 0;
  }
  return result;
}

+ (id)settingWithName:(uint64_t)a3 settingsClass:(void *)a4 extension:(char)a5 local:(char)a6 type:(uint64_t)a7 legacySetting:(void *)a8 expectedClass:
{
  id v14 = a2;
  self;
  if (([a4 isSubclassOfClass:objc_opt_class()] & 1) == 0)
  {
    v24 = [NSString stringWithFormat:@"%@ is not a valid FBSSettingsExtension", a4];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[FBSSetting settingWithName:settingsClass:extension:local:type:legacySetting:expectedClass:]();
    }
    [v24 UTF8String];
    _bs_set_crash_log_message();
  }
  id v15 = v14;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v15)
  {
    v25 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[FBSSetting settingWithName:settingsClass:extension:local:type:legacySetting:expectedClass:]();
    }
    [v25 UTF8String];
    _bs_set_crash_log_message();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v26 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[FBSSetting settingWithName:settingsClass:extension:local:type:legacySetting:expectedClass:]();
    }
    [v26 UTF8String];
    _bs_set_crash_log_message();
  }

  v16 = NSStringFromClass((Class)a4);
  if ([a4 isSubclassOfClass:objc_opt_class()])
  {

    v16 = 0;
  }
  uint64_t v17 = objc_opt_new();
  *(void *)(v17 + 16) = a3;
  *(_DWORD *)(v17 + 8) = 0;
  uint64_t v18 = [v15 copy];
  v19 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = v18;

  uint64_t v20 = MEMORY[0x19F398920](v15);
  *(unsigned char *)(v17 + 26) = a7 != 0x7FFFFFFFFFFFFFFFLL;
  *(void *)(v17 + 48) = v20;
  *(void *)(v17 + 56) = a7;
  objc_storeStrong((id *)(v17 + 64), a4);
  uint64_t v21 = [v16 copy];
  v22 = *(void **)(v17 + 72);
  *(void *)(v17 + 72) = v21;

  *(unsigned char *)(v17 + 25) = a5;
  *(unsigned char *)(v17 + 27) = a6;
  objc_storeStrong((id *)(v17 + 80), a8);
  *(void *)(v17 + 88) = 0x7FFFFFFFFFFFFFFFLL;
  *(unsigned char *)(v17 + 28) = [a8 isSubclassOfClass:objc_opt_class()];

  return (id)v17;
}

- (void)setSpecialCollection:(uint64_t)a1
{
  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    *(void *)(a1 + 88) = a2;
    os_unfair_lock_unlock(v4);
  }
}

- (void)setPropagating:(BOOL)a3
{
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_lock_initialized)
  {
    BOOL v5 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"!_lock_initialized"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSSetting setPropagating:]();
    }
    [v5 UTF8String];
    _bs_set_crash_log_message();
  }
  self->_propagating = a3;
}

- (void)setPrivacySensitive:(BOOL)a3
{
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_lock_initialized)
  {
    BOOL v5 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"!_lock_initialized"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSSetting setPrivacySensitive:]();
    }
    [v5 UTF8String];
    _bs_set_crash_log_message();
  }
  self->_redacted = a3;
}

- (void)setDefaultValue:(id)a3
{
  id v7 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_lock_initialized)
  {
    BOOL v5 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"!_lock_initialized"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSSetting setDefaultValue:]();
    }
    [v5 UTF8String];
    _bs_set_crash_log_message();
  }
  if ((id)*MEMORY[0x1E4F1D260] == v7)
  {
    v6 = [NSString stringWithFormat:@"NSNull as a default value is reserved"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSSetting setDefaultValue:]();
    }
    [v6 UTF8String];
    _bs_set_crash_log_message();
  }
  if (v7) {
    v4 = v7;
  }
  else {
    v4 = (void *)*MEMORY[0x1E4F1D260];
  }
  objc_storeStrong(&self->_defaultValue, v4);
}

- (void)setVolatile:(BOOL)a3
{
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_lock_initialized)
  {
    BOOL v5 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"!_lock_initialized"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSSetting setVolatile:]();
    }
    [v5 UTF8String];
    _bs_set_crash_log_message();
  }
  self->_volatile = a3;
}

- (void)setNullPreserving:(BOOL)a3
{
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_lock_initialized)
  {
    BOOL v5 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"!_lock_initialized"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSSetting setNullPreserving:]();
    }
    [v5 UTF8String];
    _bs_set_crash_log_message();
  }
  self->_nullPreserving = a3;
}

- (_BYTE)isRedacted
{
  if (result)
  {
    uint64_t v1 = result;
    [result _finishInitializing];
    return (unsigned char *)(v1[29] != 0);
  }
  return result;
}

- (void)descriptionProvider
{
  if (a1)
  {
    v2 = a1;
    [a1 _finishInitializing];
    a1 = (void *)MEMORY[0x19F3991F0](v2[13]);
    uint64_t v1 = vars8;
  }
  return a1;
}

- (_BYTE)isVolatile
{
  if (result)
  {
    uint64_t v1 = result;
    [result _finishInitializing];
    return (unsigned char *)(v1[30] != 0);
  }
  return result;
}

- (unint64_t)indirect_legacySetting
{
  return self->_legacySetting;
}

- (id)indirect_name
{
  return self->_name;
}

- (NSString)description
{
  expectedClass = self->_expectedClass;
  if (expectedClass) {
    NSStringFromClass(expectedClass);
  }
  else {
  v4 = [NSString stringWithFormat:@"%c", self->_type];
  }
  extensionID = (__CFString *)self->_extensionID;
  if (!extensionID) {
    extensionID = @"<FBSCore>";
  }
  [NSString stringWithFormat:@"<FBSSetting: %p; \"%@\" (%@) %@",
    self,
    self->_name,
    v4,
  v6 = extensionID);
  id v7 = v6;
  if (self->_local)
  {
    uint64_t v8 = [v6 stringByAppendingString:@"; local"];

    id v7 = (void *)v8;
  }
  if (self->_legacy)
  {
    uint64_t v9 = [v7 stringByAppendingFormat:@" legacy (%lu)", self->_legacySetting];

    id v7 = (void *)v9;
  }
  v10 = [v7 stringByAppendingString:@">"];

  return (NSString *)v10;
}

- (BOOL)matchesPropertyName:(id)a3
{
  return [(NSString *)self->_name isEqualToString:a3];
}

- (void)setDescriptionProvider:(id)a3
{
  id v7 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_lock_initialized)
  {
    v6 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"!_lock_initialized"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSSetting setDescriptionProvider:]();
    }
    [v6 UTF8String];
    _bs_set_crash_log_message();
  }
  v4 = (void *)[v7 copy];
  id descriptionProvider = self->_descriptionProvider;
  self->_id descriptionProvider = v4;
}

- (uint64_t)legacySetting
{
  if (result) {
    return *(void *)(result + 56);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_descriptionProvider, 0);
  objc_storeStrong(&self->_defaultValue, 0);
  objc_storeStrong((id *)&self->_expectedClass, 0);
  objc_storeStrong((id *)&self->_extensionID, 0);
  objc_storeStrong((id *)&self->_extension, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

+ (void)settingWithName:settingsClass:extension:local:type:legacySetting:expectedClass:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)settingWithName:settingsClass:extension:local:type:legacySetting:expectedClass:.cold.3()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)setPrivacySensitive:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)setDescriptionProvider:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)setDefaultValue:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)setDefaultValue:.cold.2()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)setPropagating:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)setNullPreserving:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)setVolatile:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end