@interface BSSettings
+ (BOOL)supportsSecureCoding;
+ (Class)_baseClass;
+ (Class)_mutableClass;
+ (void)_appendObject:(id)a3 toBuilder:(id)a4 forName:(id)a5;
- (BOOL)BOOLForSetting:(unint64_t)a3;
- (BOOL)_hasValueForSetting:(void *)a1;
- (BOOL)_isMutable;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isKeyedSettings;
- (BSSettingDescriptionProvider)descriptionProvider;
- (BSSettings)init;
- (BSSettings)initWithCoder:(id)a3;
- (BSSettings)initWithSettings:(id)a3;
- (BSSettings)initWithXPCDictionary:(id)a3;
- (NSString)description;
- (id)_keyDescriptionForSetting:(unint64_t)a3;
- (id)_sortedSettingsForDescription;
- (id)allSettings;
- (id)basicDescriptionWithPrefix:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectForSetting:(unint64_t)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)flagForSetting:(unint64_t)a3;
- (unint64_t)hash;
- (void)_appendDescriptionForSetting:(void *)a3 toBuilder:;
- (void)_appendValueDescriptionForFlag:(uint64_t)a1 object:(void *)a2 toBuilder:(void *)a3 forName:(void *)a4;
- (void)_applyToSettings:(id)a3;
- (void)_enumerateSettingsForFlagsWithBlock:(uint64_t)a1;
- (void)_enumerateSettingsForObjectsWithBlock:(uint64_t)a1;
- (void)_enumerateSettingsInMap:(void *)a3 withBlock:;
- (void)_removeAllSettings;
- (void)_setFlag:(uint64_t)a3 forSetting:;
- (void)_setObject:(uint64_t)a3 forSetting:;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
- (void)enumerateFlagsWithBlock:(id)a3;
- (void)enumerateObjectsWithBlock:(id)a3;
- (void)setDescriptionProvider:(id)a3;
@end

@implementation BSSettings

- (BOOL)BOOLForSetting:(unint64_t)a3
{
  settingToFlagMap = self->_settingToFlagMap;
  if (settingToFlagMap)
  {
    settingToFlagMap = BSIntegerMapObjectForKey(settingToFlagMap, a3);
    if (settingToFlagMap) {
      LOBYTE(settingToFlagMap) = CFBooleanGetValue((CFBooleanRef)settingToFlagMap) != 0;
    }
  }
  return (char)settingToFlagMap;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_descriptionProvider);
  objc_storeStrong((id *)&self->_settingToObjectMap, 0);
  objc_storeStrong((id *)&self->_settingToFlagMap, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  if ([(BSSettings *)self _isMutable])
  {
    v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_baseClass"), "allocWithZone:", a3);
    return (id)[v4 initWithSettings:self];
  }
  else
  {
    return self;
  }
}

- (BSSettings)initWithSettings:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)BSSettings;
  v5 = [(BSSettings *)&v20 init];
  v6 = v5;
  if (v4 && v5)
  {
    BOOL v7 = [(BSSettings *)v5 _isMutable];
    v8 = (void *)*((void *)v4 + 1);
    if (v7) {
      uint64_t v9 = [v8 mutableCopy];
    }
    else {
      uint64_t v9 = [v8 copy];
    }
    settingToFlagMap = v6->_settingToFlagMap;
    v6->_settingToFlagMap = (BSMutableIntegerMap *)v9;

    id v11 = *((id *)v4 + 2);
    BOOL v12 = [(BSSettings *)v6 _isMutable];
    if (v11) {
      v13 = (void *)[v11 mutableCopy];
    }
    else {
      v13 = objc_opt_new();
    }
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __27__BSSettings__deepCopyMap___block_invoke;
    v21[3] = &unk_1E5447108;
    BOOL v23 = v12;
    id v14 = v13;
    id v22 = v14;
    [v11 enumerateWithBlock:v21];
    if (v12) {
      v15 = (BSMutableIntegerMap *)v14;
    }
    else {
      v15 = (BSMutableIntegerMap *)[v14 copy];
    }
    v16 = v15;

    settingToObjectMap = v6->_settingToObjectMap;
    v6->_settingToObjectMap = v16;

    id WeakRetained = objc_loadWeakRetained((id *)v4 + 3);
    objc_storeWeak((id *)&v6->_descriptionProvider, WeakRetained);
  }
  return v6;
}

- (BOOL)_isMutable
{
  return 0;
}

void __27__BSSettings__deepCopyMap___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (*(unsigned char *)(a1 + 40)) {
      uint64_t v5 = [v7 mutableCopy];
    }
    else {
      uint64_t v5 = [v7 copy];
    }
    v6 = (void *)v5;

    id v7 = v6;
    [*(id *)(a1 + 32) setObject:v6 forKey:a2];
  }
}

- (int64_t)flagForSetting:(unint64_t)a3
{
  settingToFlagMap = self->_settingToFlagMap;
  if (settingToFlagMap && (CFBooleanRef v4 = (const __CFBoolean *)BSIntegerMapObjectForKey(settingToFlagMap, a3)) != 0) {
    return CFBooleanGetValue(v4) != 0;
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (id)objectForSetting:(unint64_t)a3
{
  settingToObjectMap = self->_settingToObjectMap;
  if (settingToObjectMap)
  {
    settingToObjectMap = BSIntegerMapObjectForKey(settingToObjectMap, a3);
  }
  return settingToObjectMap;
}

- (void)_setObject:(uint64_t)a3 forSetting:
{
  id v9 = a2;
  if (a1)
  {
    uint64_t v5 = *(void **)(a1 + 16);
    if (v9)
    {
      if (!v5)
      {
        v6 = objc_alloc_init(BSMutableIntegerMap);
        id v7 = *(void **)(a1 + 16);
        *(void *)(a1 + 16) = v6;

        uint64_t v5 = *(void **)(a1 + 16);
      }
      BSIntegerMapSetObjectForKey(v5, v9, a3);
    }
    else if (v5)
    {
      BSIntegerMapRemoveObjectForKey(v5, a3);
      if (!BSIntegerMapCount(*(void **)(a1 + 16)))
      {
        v8 = *(void **)(a1 + 16);
        *(void *)(a1 + 16) = 0;
      }
    }
  }
}

uint64_t __48__BSSettings__enumerateSettingsInMap_withBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __40__BSSettings_enumerateObjectsWithBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) objectForSetting:a2];
  (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, a2);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BSSettings *)a3;
  p_isa = (void **)&v4->super.isa;
  if (self == v4) {
    goto LABEL_16;
  }
  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
LABEL_17:
    BOOL v8 = 0;
    goto LABEL_18;
  }
  if (BSIntegerMapCount(self->_settingToFlagMap) || BSIntegerMapCount(p_isa[1]))
  {
    settingToFlagMap = self->_settingToFlagMap;
    id v7 = (BSMutableIntegerMap *)p_isa[1];
    if (settingToFlagMap != v7)
    {
      BOOL v8 = 0;
      if (!settingToFlagMap || !v7) {
        goto LABEL_18;
      }
      if (!-[BSIntegerMap isEqual:](settingToFlagMap, "isEqual:")) {
        goto LABEL_17;
      }
    }
  }
  if (!BSIntegerMapCount(self->_settingToObjectMap) && !BSIntegerMapCount(p_isa[2])) {
    goto LABEL_16;
  }
  settingToObjectMap = self->_settingToObjectMap;
  v10 = (BSMutableIntegerMap *)p_isa[2];
  if (settingToObjectMap == v10) {
    goto LABEL_16;
  }
  BOOL v8 = 0;
  if (settingToObjectMap && v10)
  {
    if (-[BSIntegerMap isEqual:](settingToObjectMap, "isEqual:"))
    {
LABEL_16:
      BOOL v8 = 1;
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_18:

  return v8;
}

- (void)_setFlag:(uint64_t)a3 forSetting:
{
  if (a1)
  {
    v6 = *(void **)(a1 + 8);
    if (a2 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v6)
      {
        BSIntegerMapRemoveObjectForKey(v6, a3);
        if (!BSIntegerMapCount(*(void **)(a1 + 8)))
        {
          id v11 = *(void **)(a1 + 8);
          *(void *)(a1 + 8) = 0;
        }
      }
    }
    else
    {
      if (!v6)
      {
        id v7 = objc_alloc_init(BSMutableIntegerMap);
        BOOL v8 = *(void **)(a1 + 8);
        *(void *)(a1 + 8) = v7;

        v6 = *(void **)(a1 + 8);
      }
      id v9 = (void **)MEMORY[0x1E4F1CFC8];
      if (a2) {
        id v9 = (void **)MEMORY[0x1E4F1CFD0];
      }
      v10 = *v9;
      BSIntegerMapSetObjectForKey(v6, v10, a3);
    }
  }
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_mutableClass"), "allocWithZone:", a3);
  return (id)[v4 initWithSettings:self];
}

uint64_t __38__BSSettings_enumerateFlagsWithBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = [*(id *)(a1 + 32) flagForSetting:a2];
  id v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 16);
  return v7(v5, a2, v6, a3);
}

+ (Class)_mutableClass
{
  return (Class)objc_opt_class();
}

void __31__BSSettings__applyToSettings___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v10 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [*(id *)(a1 + 32) objectForSetting:a2];
    if (!v5)
    {
      [v10 _isKeyed];
      uint64_t v5 = objc_opt_new();
      -[BSSettings _setObject:forSetting:](*(void *)(a1 + 32), v5, a2);
    }
    [v10 applyToSettings:v5];
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v7 = *(void **)(a1 + 32);
    if ((isKindOfClass & 1) == 0)
    {
      -[BSSettings _setObject:forSetting:]((uint64_t)v7, v10, a2);
      goto LABEL_12;
    }
    int v8 = [v7 _isMutable];
    uint64_t v9 = *(void *)(a1 + 32);
    if (v8) {
      uint64_t v5 = (void *)[v10 mutableCopy];
    }
    else {
      uint64_t v5 = (void *)[v10 copy];
    }
    -[BSSettings _setObject:forSetting:](v9, v5, a2);
  }

LABEL_12:
}

+ (Class)_baseClass
{
  return (Class)objc_opt_class();
}

void __31__BSSettings__applyToSettings___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

- (BOOL)isEmpty
{
  settingToFlagMap = self->_settingToFlagMap;
  if (settingToFlagMap) {
    BOOL v4 = BSIntegerMapCount(settingToFlagMap) == 0;
  }
  else {
    BOOL v4 = 1;
  }
  settingToObjectMap = self->_settingToObjectMap;
  if (settingToObjectMap) {
    BOOL v6 = BSIntegerMapCount(settingToObjectMap) == 0;
  }
  else {
    BOOL v6 = 1;
  }
  return v4 && v6;
}

- (void)enumerateObjectsWithBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __40__BSSettings_enumerateObjectsWithBlock___block_invoke;
    v6[3] = &unk_1E54470B8;
    v6[4] = self;
    id v7 = v4;
    -[BSSettings _enumerateSettingsForObjectsWithBlock:]((uint64_t)self, v6);
  }
}

- (void)setDescriptionProvider:(id)a3
{
}

- (void)_enumerateSettingsForFlagsWithBlock:(uint64_t)a1
{
  id v3 = a2;
  if (a1) {
    -[BSSettings _enumerateSettingsInMap:withBlock:](a1, *(void **)(a1 + 8), v3);
  }
}

- (void)_enumerateSettingsForObjectsWithBlock:(uint64_t)a1
{
  id v3 = a2;
  if (a1) {
    -[BSSettings _enumerateSettingsInMap:withBlock:](a1, *(void **)(a1 + 16), v3);
  }
}

- (void)_enumerateSettingsInMap:(void *)a3 withBlock:
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (a1 && v5 && v6)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __48__BSSettings__enumerateSettingsInMap_withBlock___block_invoke;
    v8[3] = &unk_1E5446D08;
    id v9 = v6;
    BSIntegerMapEnumerateKeysWithBlock(v5, v8);
  }
}

- (BSSettingDescriptionProvider)descriptionProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_descriptionProvider);
  return (BSSettingDescriptionProvider *)WeakRetained;
}

- (BOOL)isKeyedSettings
{
  return 0;
}

- (BSSettings)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [(BSSettings *)self init];
  id v6 = v5;
  if (v4 && v5)
  {
    id v7 = xpc_dictionary_get_value(v4, "flags");
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __36__BSSettings_initWithXPCDictionary___block_invoke;
    v13[3] = &unk_1E5446F80;
    int v8 = v6;
    id v14 = v8;
    BSSettingsDecodeSettingEntries(v7, v13);
    id v9 = xpc_dictionary_get_value(v4, "objects");
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __36__BSSettings_initWithXPCDictionary___block_invoke_16;
    v11[3] = &unk_1E5446F80;
    BOOL v12 = v8;
    BSSettingsDecodeSettingEntries(v9, v11);
  }
  return v6;
}

- (BSSettings)init
{
  return [(BSSettings *)self initWithSettings:0];
}

void __36__BSSettings_initWithXPCDictionary___block_invoke_16(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = BSSettingsDecodeSettingObject(a3, a4);
  if (v6)
  {
    -[BSSettings _setObject:forSetting:](*(void *)(a1 + 32), v6, a2);
  }
  else
  {
    id v7 = BSLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315394;
      id v9 = "-[BSSettings initWithXPCDictionary:]_block_invoke";
      __int16 v10 = 2048;
      uint64_t v11 = a2;
      _os_log_error_impl(&dword_18AAA8000, v7, OS_LOG_TYPE_ERROR, "%s Could not decode object for setting %llu", (uint8_t *)&v8, 0x16u);
    }
  }
}

void __36__BSSettings_initWithXPCDictionary___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (object_getClass(v5) == (Class)MEMORY[0x1E4F14570])
  {
    uint64_t v7 = *(void *)(a1 + 32);
    BOOL value = xpc_BOOL_get_value(v5);
    -[BSSettings _setFlag:forSetting:](v7, value, a2);
  }
  else
  {
    id v6 = BSLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315650;
      __int16 v10 = "-[BSSettings initWithXPCDictionary:]_block_invoke";
      __int16 v11 = 2048;
      uint64_t v12 = a2;
      __int16 v13 = 2114;
      id v14 = v5;
      _os_log_error_impl(&dword_18AAA8000, v6, OS_LOG_TYPE_ERROR, "%s the encoded flag format for %llu is unknown -> %{public}@", (uint8_t *)&v9, 0x20u);
    }
  }
}

void __28__BSSettings_initWithCoder___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = BSSettingsDecodeSettingObject(a3, a4);
  if (v6)
  {
    -[BSSettings _setObject:forSetting:](*(void *)(a1 + 32), v6, a2);
  }
  else
  {
    uint64_t v7 = BSLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315394;
      int v9 = "-[BSSettings initWithCoder:]_block_invoke";
      __int16 v10 = 2048;
      uint64_t v11 = a2;
      _os_log_error_impl(&dword_18AAA8000, v7, OS_LOG_TYPE_ERROR, "%s Could not decode object for setting %llu", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (id)allSettings
{
  id v3 = [(BSIntegerMap *)self->_settingToFlagMap allKeys];
  id v4 = [(BSIntegerMap *)self->_settingToObjectMap allKeys];
  id v5 = -[BSIntegerSet initWithCapacity:]([BSMutableIntegerSet alloc], "initWithCapacity:", [v4 count] + objc_msgSend(v3, "count"));
  [(BSMutableIntegerSet *)v5 unionSet:v3];
  [(BSMutableIntegerSet *)v5 unionSet:v4];

  return v5;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(BSSettings *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (unint64_t)hash
{
  id v3 = +[BSHashBuilder builder];
  id v4 = [v3 appendObject:self->_settingToFlagMap];
  id v5 = [v4 appendObject:self->_settingToObjectMap];
  unint64_t v6 = [v5 hash];

  return v6;
}

void __30__BSSettings_encodeWithCoder___block_invoke_37(uint64_t a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  id v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (!v5)
  {
    xpc_object_t v6 = xpc_array_create(0, 0);
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    int v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    id v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  BSSettingsEncodeAppendSettingArrayEntry(v5, a2, v9, &__block_literal_global_39);
}

void __38__BSSettings_encodeWithXPCDictionary___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(a1 + 32);
  BSIntegerMapObjectForKey(*(void **)(a1 + 40), a2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  BSSettingsEncodeAppendSettingArrayEntry(v4, a2, v5, *(void **)(a1 + 48));
}

id __38__BSSettings_encodeWithXPCDictionary___block_invoke_4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v4 = BSSettingsEncodeSettingObject(a3, a4);
  return v4;
}

id __38__BSSettings_encodeWithXPCDictionary___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  CFBooleanRef v3 = a3;
  BOOL v4 = CFBooleanGetValue(v3) != 0;
  xpc_object_t v5 = xpc_BOOL_create(v4);

  return v5;
}

id __30__BSSettings_encodeWithCoder___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  BOOL v4 = BSSettingsEncodeSettingObject(a3, a4);
  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v5 = a3;
  xpc_object_t v6 = [(BSSettings *)self succinctDescriptionBuilder];
  if ([(BSSettings *)self isEmpty])
  {
    id v7 = (id)[v6 appendObject:@"(empty)" withName:0];
  }
  else
  {
    BOOL v8 = [(BSSettings *)self isEmpty];
    if (v8)
    {
      id v9 = 0;
    }
    else
    {
      id v9 = v11;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __52__BSSettings_descriptionBuilderWithMultilinePrefix___block_invoke;
      v11[3] = &unk_1E54456B8;
      void v11[4] = self;
      CFBooleanRef v3 = &v12;
      id v12 = v6;
    }
    [v6 appendBodySectionWithName:0 multilinePrefix:v5 block:v9];
    if (!v8) {
  }
    }
  return v6;
}

- (id)succinctDescriptionBuilder
{
  return +[BSDescriptionBuilder builderWithObject:self];
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4 = a3;
  if (v4 && ![(BSSettings *)self isEmpty])
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __38__BSSettings_encodeWithXPCDictionary___block_invoke;
    v6[3] = &unk_1E5446FD0;
    v6[4] = self;
    id v7 = v4;
    id v5 = (void (**)(void, void, void, void))MEMORY[0x18C125630](v6);
    ((void (**)(void, BSMutableIntegerMap *, const char *, void *))v5)[2](v5, self->_settingToFlagMap, "flags", &__block_literal_global_35);
    ((void (**)(void, BSMutableIntegerMap *, const char *, void *))v5)[2](v5, self->_settingToObjectMap, "objects", &__block_literal_global_21);
  }
}

void __38__BSSettings_encodeWithXPCDictionary___block_invoke(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  if (v7)
  {
    uint64_t v9 = BSIntegerMapCount(v7);
    if (v8)
    {
      if (v9)
      {
        xpc_object_t v10 = xpc_array_create(0, 0);
        uint64_t v11 = *(void *)(a1 + 32);
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __38__BSSettings_encodeWithXPCDictionary___block_invoke_2;
        v13[3] = &unk_1E5446FA8;
        id v12 = v10;
        id v14 = v12;
        id v15 = v7;
        id v16 = v8;
        -[BSSettings _enumerateSettingsInMap:withBlock:](v11, v15, v13);
        xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 40), a3, v12);
      }
    }
  }
}

- (void)_applyToSettings:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __31__BSSettings__applyToSettings___block_invoke;
    v9[3] = &unk_1E5447018;
    id v6 = v4;
    id v10 = v6;
    [(BSSettings *)self enumerateFlagsWithBlock:v9];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __31__BSSettings__applyToSettings___block_invoke_2;
    v7[3] = &unk_1E54470E0;
    id v8 = v6;
    [(BSSettings *)self enumerateObjectsWithBlock:v7];
  }
}

- (void)enumerateFlagsWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __38__BSSettings_enumerateFlagsWithBlock___block_invoke;
    v6[3] = &unk_1E54470B8;
    v6[4] = self;
    id v7 = v4;
    -[BSSettings _enumerateSettingsForFlagsWithBlock:]((uint64_t)self, v6);
  }
}

- (BOOL)_hasValueForSetting:(void *)a1
{
  if (!a1) {
    return 0;
  }
  id v4 = [a1 objectForSetting:a2];
  if (v4) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = [a1 flagForSetting:a2] != 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    settingToFlagMap = self->_settingToFlagMap;
    if (settingToFlagMap)
    {
      uint64_t v7 = BSIntegerMapCount(settingToFlagMap);
      if (v7)
      {
        id v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v7];
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __30__BSSettings_encodeWithCoder___block_invoke;
        v23[3] = &unk_1E5447018;
        id v9 = v8;
        id v24 = v9;
        [(BSSettings *)self enumerateFlagsWithBlock:v23];
        id v10 = (void *)[v9 copy];
        [v5 encodeObject:v10 forKey:@"flags"];
      }
    }
    settingToObjectMap = self->_settingToObjectMap;
    if (settingToObjectMap && BSIntegerMapCount(settingToObjectMap))
    {
      uint64_t v17 = 0;
      v18 = &v17;
      uint64_t v19 = 0x3032000000;
      objc_super v20 = __Block_byref_object_copy__10;
      v21 = __Block_byref_object_dispose__10;
      id v22 = xpc_array_create(0, 0);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __30__BSSettings_encodeWithCoder___block_invoke_37;
      v16[3] = &unk_1E5447040;
      v16[4] = &v17;
      [(BSSettings *)self enumerateObjectsWithBlock:v16];
      [v5 encodeXPCObject:v18[5] forKey:@"objects"];
      _Block_object_dispose(&v17, 8);
    }
  }
  else
  {
    id v12 = (void *)MEMORY[0x1E4F1CA00];
    __int16 v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    id v14 = (objc_class *)objc_opt_class();
    id v15 = NSStringFromClass(v14);
    objc_msgSend(v12, "raise:format:", *MEMORY[0x1E4F1C3C8], @"An %@ can only be encoded with an instance of NSXPCCoder; attempting to encode with %@",
      v5,
      v15);
  }
}

- (BSSettings)initWithCoder:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    self = [(BSSettings *)self init];
    if (!self) {
      goto LABEL_17;
    }
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F1CA00];
    id v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    id v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    objc_msgSend(v5, "raise:format:", *MEMORY[0x1E4F1C3C8], @"An %@ can only be decoded with an instance of NSXPCCoder; attempting to decode with %@",
      v7,
      v9);

    if (!self) {
      goto LABEL_17;
    }
  }
  id v10 = v4;
  uint64_t v11 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v12 = objc_opt_class();
  BOOL v23 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  if ([v10 containsValueForKey:@"flags"])
  {
    __int16 v13 = [v10 decodeObjectOfClasses:v23 forKey:@"flags"];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v14 = [v13 allKeys];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v27 != v16) {
            objc_enumerationMutation(v14);
          }
          v18 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          uint64_t v19 = [v18 unsignedIntegerValue];
          objc_super v20 = [v13 objectForKey:v18];
          -[BSSettings _setFlag:forSetting:]((uint64_t)self, [v20 BOOLValue], v19);
        }
        uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v15);
    }
  }
  if ([v10 containsValueForKey:@"objects"])
  {
    v21 = [v10 decodeXPCObjectOfType:MEMORY[0x1E4F14568] forKey:@"objects"];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __28__BSSettings_initWithCoder___block_invoke;
    v24[3] = &unk_1E5446F80;
    v25 = self;
    BSSettingsDecodeSettingEntries(v21, v24);
  }
LABEL_17:

  return self;
}

- (void)_removeAllSettings
{
  settingToFlagMap = self->_settingToFlagMap;
  if (settingToFlagMap) {
    BSIntegerMapRemoveAllObjects(settingToFlagMap);
  }
  settingToObjectMap = self->_settingToObjectMap;
  if (settingToObjectMap)
  {
    BSIntegerMapRemoveAllObjects(settingToObjectMap);
  }
}

void __52__BSSettings_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _sortedSettingsForDescription];
  if (v2)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __52__BSSettings_descriptionBuilderWithMultilinePrefix___block_invoke_2;
    v9[3] = &unk_1E5447068;
    CFBooleanRef v3 = *(void **)(a1 + 40);
    void v9[4] = *(void *)(a1 + 32);
    id v10 = v3;
    [v2 enumerateObjectsUsingBlock:v9];
    id v4 = &v10;
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) allSettings];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __52__BSSettings_descriptionBuilderWithMultilinePrefix___block_invoke_3;
    v7[3] = &unk_1E5447090;
    id v6 = *(void **)(a1 + 40);
    void v7[4] = *(void *)(a1 + 32);
    id v8 = v6;
    [v5 enumerateSortedWithBlock:v7];
    id v4 = &v8;
  }
}

- (id)_sortedSettingsForDescription
{
  return 0;
}

void __52__BSSettings_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1, uint64_t a2)
{
}

- (void)_appendDescriptionForSetting:(void *)a3 toBuilder:
{
  id v13 = a3;
  if (a1)
  {
    uint64_t v5 = [a1 flagForSetting:a2];
    id v6 = [a1 objectForSetting:a2];
    id WeakRetained = objc_loadWeakRetained(a1 + 3);
    if (!WeakRetained) {
      goto LABEL_13;
    }
    if (objc_opt_respondsToSelector())
    {
      char v8 = [WeakRetained settings:a1 appendDescriptionToBuilder:v13 forFlag:v5 object:v6 ofSetting:a2];
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        goto LABEL_8;
      }
      char v8 = [WeakRetained appendDescriptionToBuilder:v13 forFlag:v5 object:v6 ofSetting:a2];
    }
    if (v8)
    {
LABEL_22:

      goto LABEL_23;
    }
LABEL_8:
    if (objc_opt_respondsToSelector())
    {
      uint64_t v9 = [WeakRetained settings:a1 keyDescriptionForSetting:a2];
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        goto LABEL_13;
      }
      uint64_t v9 = [WeakRetained keyDescriptionForSetting:a2];
    }
    id v10 = (void *)v9;
    if (v9)
    {
LABEL_14:
      if (objc_opt_respondsToSelector())
      {
        uint64_t v11 = [WeakRetained settings:a1 valueDescriptionForFlag:v5 object:v6 ofSetting:a2];
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) == 0) {
          goto LABEL_20;
        }
        uint64_t v11 = [WeakRetained valueDescriptionForFlag:v5 object:v6 ofSetting:a2];
      }
      uint64_t v12 = v11;
      if (v11)
      {
        -[BSSettings _appendValueDescriptionForFlag:object:toBuilder:forName:](0x7FFFFFFFFFFFFFFFLL, v11, v13, v10);
LABEL_21:

        goto LABEL_22;
      }
LABEL_20:
      uint64_t v12 = 0;
      -[BSSettings _appendValueDescriptionForFlag:object:toBuilder:forName:](v5, v6, v13, v10);
      goto LABEL_21;
    }
LABEL_13:
    id v10 = [a1 _keyDescriptionForSetting:a2];
    if (!WeakRetained) {
      goto LABEL_20;
    }
    goto LABEL_14;
  }
LABEL_23:
}

- (void)_appendValueDescriptionForFlag:(uint64_t)a1 object:(void *)a2 toBuilder:(void *)a3 forName:(void *)a4
{
  uint64_t v15 = a2;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v15;
  id v10 = v8;
  if (a1 == 0x7FFFFFFFFFFFFFFFLL || !v15)
  {
    if (a1 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (a1) {
        uint64_t v9 = @"Yes";
      }
      else {
        uint64_t v9 = @"No";
      }
    }
    +[BSSettings _appendObject:v9 toBuilder:v7 forName:v8];
  }
  else
  {
    uint64_t v11 = @"Yes";
    if (!a1) {
      uint64_t v11 = @"No";
    }
    uint64_t v12 = v11;
    id v13 = [NSString stringWithFormat:@"%@ [flag]", v10];
    +[BSSettings _appendObject:v12 toBuilder:v7 forName:v13];

    id v14 = [NSString stringWithFormat:@"%@ [obj]", v10];
    +[BSSettings _appendObject:v15 toBuilder:v7 forName:v14];
  }
}

+ (void)_appendObject:(id)a3 toBuilder:(id)a4 forName:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_15;
  }
  if ([v7 isNSArray])
  {
    id v10 = v7;
  }
  else if ([v7 isNSSet])
  {
    id v10 = [v7 allObjects];
  }
  else
  {
    if (([v7 isNSOrderedSet] & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_12;
      }
    }
    id v10 = [v7 array];
  }
  uint64_t v11 = v10;
  if (v10)
  {
    uint64_t v12 = NSStringFromClass((Class)[v7 classForCoder]);
    id v13 = [v9 stringByAppendingFormat:@" <%@; %p>", v12, v7];

    if ([v11 count])
    {
      id v14 = [v8 activeMultilinePrefix];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __46__BSSettings__appendObject_toBuilder_forName___block_invoke;
      v26[3] = &unk_1E54456B8;
      id v27 = v11;
      id v28 = v8;
      id v15 = v11;
      [v28 appendBodySectionWithName:v13 multilinePrefix:v14 block:v26];
    }
    else
    {
      id v21 = (id)[v8 appendObject:@"(empty)" withName:v13];
    }
    goto LABEL_21;
  }
LABEL_12:
  if ([v7 isNSDictionary])
  {
    uint64_t v16 = NSStringFromClass((Class)[v7 classForCoder]);
    id v13 = [v9 stringByAppendingFormat:@" <%@; %p>", v16, v7];

    if ([v7 count])
    {
      uint64_t v17 = [v8 activeMultilinePrefix];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __46__BSSettings__appendObject_toBuilder_forName___block_invoke_2;
      v23[3] = &unk_1E54456B8;
      id v24 = v7;
      id v25 = v8;
      [v25 appendBodySectionWithName:v13 multilinePrefix:v17 block:v23];
    }
    else
    {
      id v22 = (id)[v8 appendObject:@"(empty)" withName:v13];
    }
    goto LABEL_21;
  }
LABEL_15:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_respondsToSelector() & 1) == 0)
  {
    id v20 = (id)[v8 appendObject:v7 withName:v9];
  }
  else
  {
    v18 = [v7 succinctDescription];
    id v19 = (id)[v8 appendObject:v18 withName:v9];
  }
  id v13 = v9;
LABEL_21:
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __30__BSSettings_encodeWithCoder___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v8 = [NSNumber numberWithUnsignedInteger:a2];
  BOOL v6 = a3 != 0x7FFFFFFFFFFFFFFFLL && a3 != 0;
  id v7 = [NSNumber numberWithBool:v6];
  [*(id *)(a1 + 32) setObject:v7 forKey:v8];
}

- (id)succinctDescription
{
  v2 = [(BSSettings *)self succinctDescriptionBuilder];
  CFBooleanRef v3 = [v2 build];

  return v3;
}

void __52__BSSettings_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  -[BSSettings _appendDescriptionForSetting:toBuilder:](*(id **)(a1 + 32), [v3 integerValue], *(void **)(a1 + 40));
}

- (NSString)description
{
  return (NSString *)[(BSSettings *)self descriptionWithMultilinePrefix:0];
}

- (id)_keyDescriptionForSetting:(unint64_t)a3
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"(%llu)", a3);
}

void __46__BSSettings__appendObject_toBuilder_forName___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v2);
        }
        +[BSSettings _appendObject:toBuilder:forName:](BSSettings, "_appendObject:toBuilder:forName:", *(void *)(*((void *)&v6 + 1) + 8 * v5++), *(void *)(a1 + 40), 0, (void)v6);
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

void __46__BSSettings__appendObject_toBuilder_forName___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        long long v6 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        long long v7 = objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v6, (void)v10);
        uint64_t v8 = *(void *)(a1 + 40);
        long long v9 = [v6 description];
        +[BSSettings _appendObject:v7 toBuilder:v8 forName:v9];
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v3);
  }
}

- (id)basicDescriptionWithPrefix:(id)a3
{
  uint64_t v3 = [(BSSettings *)self descriptionWithMultilinePrefix:a3];
  return v3;
}

@end