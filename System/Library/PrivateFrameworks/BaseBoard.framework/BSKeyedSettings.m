@interface BSKeyedSettings
+ (BOOL)supportsSecureCoding;
+ (Class)_baseClass;
+ (Class)_mutableClass;
- (BOOL)BOOLForKey:(id)a3;
- (BOOL)isKeyedSettings;
- (BSKeyedSettings)initWithCoder:(id)a3;
- (BSKeyedSettings)initWithSettings:(id)a3;
- (BSKeyedSettings)initWithXPCDictionary:(id)a3;
- (id)_keyDescriptionForSetting:(unint64_t)a3;
- (id)_keyForSetting:(id *)a1;
- (id)_sortedSettingsForDescription;
- (id)allKeys;
- (id)keyForSetting:(unint64_t)a3;
- (id)objectForKey:(id)a3;
- (int64_t)flagForKey:(id)a3;
- (uint64_t)_settingForKey:(int)a3 saveKey:;
- (void)_addDecodedKeys:(id *)a1;
- (void)_applyToSettings:(id)a3;
- (void)_removeAllSettings;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
- (void)enumerateKeyedFlagsWithBlock:(id)a3;
- (void)enumerateKeyedObjectsWithBlock:(id)a3;
@end

@implementation BSKeyedSettings

- (BSKeyedSettings)initWithSettings:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v5 = (id *)a3;
  if (v5)
  {
    NSClassFromString(&cfstr_Bskeyedsetting.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:BSKeyedSettingsClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        id v15 = (id)objc_claimAutoreleasedReturnValue();
        v16 = (objc_class *)objc_opt_class();
        v17 = NSStringFromClass(v16);
        *(_DWORD *)buf = 138544642;
        id v20 = v15;
        __int16 v21 = 2114;
        v22 = v17;
        __int16 v23 = 2048;
        v24 = self;
        __int16 v25 = 2114;
        v26 = @"BSKeyedSettings.m";
        __int16 v27 = 1024;
        int v28 = 33;
        __int16 v29 = 2114;
        v30 = v14;
        _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      qword_1E911F420 = [v14 UTF8String];
      __break(0);
      JUMPOUT(0x18AAAC4BCLL);
    }
  }

  v18.receiver = self;
  v18.super_class = (Class)BSKeyedSettings;
  v6 = [(BSSettings *)&v18 initWithSettings:v5];
  if (v6)
  {
    if (v5)
    {
      uint64_t v7 = [v5[4] mutableCopy];
      keys = v6->_keys;
      v6->_keys = (NSMutableSet *)v7;

      v9 = (BSMutableIntegerMap *)[v5[5] mutableCopy];
    }
    else
    {
      uint64_t v11 = [MEMORY[0x1E4F1CA80] set];
      v12 = v6->_keys;
      v6->_keys = (NSMutableSet *)v11;

      v9 = objc_alloc_init(BSMutableIntegerMap);
    }
    keyMap = v6->_keyMap;
    v6->_keyMap = v9;
  }
  return v6;
}

- (int64_t)flagForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[BSKeyedSettings _settingForKey:saveKey:]((uint64_t)self, v4, 0);
  v8.receiver = self;
  v8.super_class = (Class)BSKeyedSettings;
  id v6 = [(BSSettings *)&v8 flagForSetting:v5];

  return (int64_t)v6;
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[BSKeyedSettings _settingForKey:saveKey:]((uint64_t)self, v4, 0);
  v8.receiver = self;
  v8.super_class = (Class)BSKeyedSettings;
  id v6 = [(BSSettings *)&v8 objectForSetting:v5];

  return v6;
}

- (uint64_t)_settingForKey:(int)a3 saveKey:
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = v5;
  if (a1)
  {
    uint64_t v7 = [v5 hash];
    if (a3)
    {
      objc_super v8 = [*(id *)(a1 + 40) objectForKey:v7];
      if (v8)
      {
        if (([v6 isEqualToString:v8] & 1) == 0)
        {
          uint64_t v11 = [NSString stringWithFormat:@"Hash collision: '%@' and '%@' both hash to %lu", v6, v8, v7];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(sel__settingForKey_saveKey_);
            id v12 = (id)objc_claimAutoreleasedReturnValue();
            v13 = (objc_class *)objc_opt_class();
            NSStringFromClass(v13);
            *(_DWORD *)buf = 138544642;
            id v28 = v12;
            v14 = __int16 v29 = 2114;
            v30 = v14;
            __int16 v31 = 2048;
            uint64_t v32 = a1;
            __int16 v33 = 2114;
            v34 = @"BSKeyedSettings.m";
            __int16 v35 = 1024;
            int v36 = 190;
            __int16 v37 = 2114;
            v38 = v11;
            _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
          }
          qword_1E911F420 = [v11 UTF8String];
          __break(0);
          JUMPOUT(0x18AAACD9CLL);
        }
        uint64_t v9 = (uint64_t)v6;
      }
      else
      {
        if (!*(void *)(a1 + 32))
        {
          id v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_keys != nil"];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(sel__settingForKey_saveKey_);
            id v16 = (id)objc_claimAutoreleasedReturnValue();
            v17 = (objc_class *)objc_opt_class();
            NSStringFromClass(v17);
            *(_DWORD *)buf = 138544642;
            id v28 = v16;
            objc_super v18 = v29 = 2114;
            v30 = v18;
            __int16 v31 = 2048;
            uint64_t v32 = a1;
            __int16 v33 = 2114;
            v34 = @"BSKeyedSettings.m";
            __int16 v35 = 1024;
            int v36 = 183;
            __int16 v37 = 2114;
            v38 = v15;
            _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
          }
          qword_1E911F420 = [v15 UTF8String];
          __break(0);
          JUMPOUT(0x18AAACEA0);
        }
        if (!*(void *)(a1 + 40))
        {
          v19 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_keyMap != nil"];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(sel__settingForKey_saveKey_);
            id v20 = (id)objc_claimAutoreleasedReturnValue();
            __int16 v21 = (objc_class *)objc_opt_class();
            NSStringFromClass(v21);
            *(_DWORD *)buf = 138544642;
            id v28 = v20;
            v22 = __int16 v29 = 2114;
            v30 = v22;
            __int16 v31 = 2048;
            uint64_t v32 = a1;
            __int16 v33 = 2114;
            v34 = @"BSKeyedSettings.m";
            __int16 v35 = 1024;
            int v36 = 184;
            __int16 v37 = 2114;
            v38 = v19;
            _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
          }
          qword_1E911F420 = [v19 UTF8String];
          __break(0);
          JUMPOUT(0x18AAACFA4);
        }
        if (![v6 length])
        {
          __int16 v23 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[key length] > 0"];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(sel__settingForKey_saveKey_);
            id v24 = (id)objc_claimAutoreleasedReturnValue();
            __int16 v25 = (objc_class *)objc_opt_class();
            NSStringFromClass(v25);
            *(_DWORD *)buf = 138544642;
            id v28 = v24;
            v26 = __int16 v29 = 2114;
            v30 = v26;
            __int16 v31 = 2048;
            uint64_t v32 = a1;
            __int16 v33 = 2114;
            v34 = @"BSKeyedSettings.m";
            __int16 v35 = 1024;
            int v36 = 185;
            __int16 v37 = 2114;
            v38 = v23;
            _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
          }
          qword_1E911F420 = [v23 UTF8String];
          __break(0);
          JUMPOUT(0x18AAAD0A8);
        }
        uint64_t v9 = [v6 copy];

        [*(id *)(a1 + 32) addObject:v9];
        [*(id *)(a1 + 40) setObject:v9 forKey:v7];
      }

      id v6 = (void *)v9;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

void __50__BSKeyedSettings_enumerateKeyedObjectsWithBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = -[BSKeyedSettings _keyForSetting:](*(id **)(a1 + 32), a2);
  if (v6)
  {
    id v9 = v6;
    uint64_t v7 = *(void *)(a1 + 40);
    objc_super v8 = [*(id *)(a1 + 32) objectForSetting:a2];
    (*(void (**)(uint64_t, id, void *, uint64_t))(v7 + 16))(v7, v9, v8, a3);

    id v6 = v9;
  }
}

- (id)_keyForSetting:(id *)a1
{
  if (a1)
  {
    a1 = [a1[5] objectForKey:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

+ (Class)_baseClass
{
  return (Class)objc_opt_class();
}

+ (Class)_mutableClass
{
  return (Class)objc_opt_class();
}

void __48__BSKeyedSettings_enumerateKeyedFlagsWithBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  -[BSKeyedSettings _keyForSetting:](*(id **)(a1 + 32), a2);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6) {
    (*(void (**)(void, id, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v6, [*(id *)(a1 + 32) flagForSetting:a2], a3);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyMap, 0);
  objc_storeStrong((id *)&self->_keys, 0);
}

- (BOOL)isKeyedSettings
{
  return 1;
}

- (void)enumerateKeyedObjectsWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __50__BSKeyedSettings_enumerateKeyedObjectsWithBlock___block_invoke;
    v6[3] = &unk_1E5446C48;
    v6[4] = self;
    id v7 = v4;
    -[BSSettings _enumerateSettingsForObjectsWithBlock:]((uint64_t)self, v6);
  }
}

- (void)enumerateKeyedFlagsWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __48__BSKeyedSettings_enumerateKeyedFlagsWithBlock___block_invoke;
    v6[3] = &unk_1E5446C48;
    v6[4] = self;
    id v7 = v4;
    -[BSSettings _enumerateSettingsForFlagsWithBlock:]((uint64_t)self, v6);
  }
}

- (id)allKeys
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = [(BSIntegerMap *)self->_keyMap allValues];
  id v4 = [v2 setWithArray:v3];

  return v4;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)BSKeyedSettings;
  [(BSSettings *)&v6 encodeWithXPCDictionary:v4];
  id v5 = [(NSMutableSet *)self->_keys allObjects];
  if ([v5 count]) {
    BSSerializeCFValueToXPCDictionaryWithKey((uint64_t)v5, v4, "BSKeys");
  }
}

- (void)_applyToSettings:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v13.receiver = self;
    v13.super_class = (Class)BSKeyedSettings;
    [(BSSettings *)&v13 _applyToSettings:v4];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v5 = [(BSKeyedSettings *)self allKeys];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v5);
          }
          -[BSKeyedSettings _settingForKey:saveKey:]((uint64_t)v4, *(void **)(*((void *)&v9 + 1) + 8 * v8++), 1);
        }
        while (v6 != v8);
        uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v14 count:16];
      }
      while (v6);
    }
  }
}

- (BSKeyedSettings)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BSKeyedSettings;
  id v5 = [(BSSettings *)&v8 initWithXPCDictionary:v4];
  if (v5)
  {
    uint64_t v6 = (void *)BSCreateDeserializedCFValueFromXPCDictionaryWithKey(v4, "BSKeys");
    -[BSKeyedSettings _addDecodedKeys:]((id *)&v5->super.super.isa, v6);
  }
  return v5;
}

- (void)_addDecodedKeys:(id *)a1
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v14 = a2;
  if (!a1[4] || !a1[5])
  {
    long long v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_keys && _keyMap", v14];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__addDecodedKeys_);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      long long v12 = (objc_class *)objc_opt_class();
      objc_super v13 = NSStringFromClass(v12);
      *(_DWORD *)buf = 138544642;
      id v21 = v11;
      __int16 v22 = 2114;
      uint64_t v23 = (uint64_t)v13;
      __int16 v24 = 2048;
      __int16 v25 = a1;
      __int16 v26 = 2114;
      __int16 v27 = @"BSKeyedSettings.m";
      __int16 v28 = 1024;
      int v29 = 198;
      __int16 v30 = 2114;
      __int16 v31 = v10;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v10 UTF8String];
    __break(0);
    JUMPOUT(0x18AAD5814);
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = v14;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v8 = [v7 hash];
        if (-[BSSettings _hasValueForSetting:](a1, v8))
        {
          [a1[4] addObject:v7];
          [a1[5] setObject:v7 forKey:v8];
        }
        else
        {
          long long v9 = BSLogCommon();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            id v21 = v7;
            __int16 v22 = 2048;
            uint64_t v23 = v8;
            _os_log_error_impl(&dword_18AAA8000, v9, OS_LOG_TYPE_ERROR, "No value decoded for key \"%@\" (%llu). Ignoring.", buf, 0x16u);
          }
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v4);
  }
}

id __48__BSKeyedSettings__sortedSettingsForDescription__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[BSKeyedSettings _settingForKey:saveKey:](*(void *)(a1 + 32), v3, 0));

  return v4;
}

- (BOOL)BOOLForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[BSKeyedSettings _settingForKey:saveKey:]((uint64_t)self, v4, 0);
  v7.receiver = self;
  v7.super_class = (Class)BSKeyedSettings;
  LOBYTE(self) = [(BSSettings *)&v7 BOOLForSetting:v5];

  return (char)self;
}

- (id)keyForSetting:(unint64_t)a3
{
  return -[BSKeyedSettings _keyForSetting:]((id *)&self->super.super.isa, a3);
}

- (void)_removeAllSettings
{
  v3.receiver = self;
  v3.super_class = (Class)BSKeyedSettings;
  [(BSSettings *)&v3 _removeAllSettings];
  [(BSMutableIntegerMap *)self->_keyMap removeAllObjects];
  [(NSMutableSet *)self->_keys removeAllObjects];
}

- (id)_sortedSettingsForDescription
{
  objc_super v3 = [(BSIntegerMap *)self->_keyMap allValues];
  id v4 = (void *)[v3 mutableCopy];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__BSKeyedSettings__sortedSettingsForDescription__block_invoke;
  v8[3] = &unk_1E5446C70;
  v8[4] = self;
  [v4 sortUsingComparator:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__BSKeyedSettings__sortedSettingsForDescription__block_invoke_2;
  v7[3] = &unk_1E5446C98;
  v7[4] = self;
  uint64_t v5 = objc_msgSend(v4, "bs_map:", v7);

  return v5;
}

uint64_t __48__BSKeyedSettings__sortedSettingsForDescription__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_super v7 = [*(id *)(a1 + 32) objectForKey:v5];
  objc_opt_class();
  int isKindOfClass = objc_opt_isKindOfClass();

  long long v9 = [*(id *)(a1 + 32) objectForKey:v6];
  objc_opt_class();
  LODWORD(a1) = objc_opt_isKindOfClass();

  if ((isKindOfClass ^ a1))
  {
    if (isKindOfClass) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = -1;
    }
  }
  else
  {
    uint64_t v10 = [v5 compare:v6];
  }

  return v10;
}

- (id)_keyDescriptionForSetting:(unint64_t)a3
{
  return -[BSKeyedSettings _keyForSetting:]((id *)&self->super.super.isa, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BSKeyedSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BSKeyedSettings;
  id v5 = [(BSSettings *)&v8 initWithCoder:v4];
  if (v5)
  {
    id v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"BSKeys"];
    -[BSKeyedSettings _addDecodedKeys:]((id *)&v5->super.super.isa, v6);
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)BSKeyedSettings;
  [(BSSettings *)&v6 encodeWithCoder:v4];
  id v5 = [(NSMutableSet *)self->_keys allObjects];
  [v4 encodeObject:v5 forKey:@"BSKeys"];
}

@end