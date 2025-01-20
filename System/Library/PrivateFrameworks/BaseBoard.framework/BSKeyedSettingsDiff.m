@interface BSKeyedSettingsDiff
+ (BOOL)supportsBSXPCSecureCoding;
+ (Class)_removalClass;
+ (id)diffFromSettings:(id)a3 toSettings:(id)a4;
- (BOOL)_isKeyed;
- (id)_keyDescriptionForSetting:(unint64_t)a3;
- (id)allKeys;
- (id)allSettings;
- (id)copyWithKeys:(id)a3;
- (id)copyWithSettings:(id)a3;
- (unint64_t)_diffTypesForKey:(id)a3;
- (unint64_t)_diffTypesForSetting:(unint64_t)a3;
- (void)applyToSettings:(id)a3;
- (void)inspectKeyedChangesWithBlock:(id)a3;
@end

@implementation BSKeyedSettingsDiff

void __51__BSKeyedSettingsDiff_diffFromSettings_toSettings___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  v6 = *(void **)(a1 + 32);
  if (!v6
    || ([v6 objectForKey:v15],
        v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v5 isEqual:v7],
        v7,
        (v8 & 1) == 0))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [*(id *)(a1 + 32) objectForKey:v15];
      uint64_t v10 = +[BSSettingsDiff diffFromSettings:v9 toSettings:v5];

      id v5 = (id)v10;
    }
    v11 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (!v11)
    {
      uint64_t v12 = objc_opt_new();
      uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
      v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;

      v11 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    }
    [v11 setObject:v5 forKey:v15];
  }
}

void __51__BSKeyedSettingsDiff_diffFromSettings_toSettings___block_invoke_4(void *a1, void *a2, void *a3)
{
  id v17 = a2;
  id v5 = a3;
  v6 = (void *)a1[4];
  if (!v6
    || ([v6 objectForKey:v17], v7 = objc_claimAutoreleasedReturnValue(), v7, !v7))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v8 = +[BSSettingsDiff diffFromSettings:v5 toSettings:0];
      v9 = *(void **)(*(void *)(a1[5] + 8) + 40);
      if (!v9)
      {
        uint64_t v10 = objc_opt_new();
        uint64_t v11 = *(void *)(a1[5] + 8);
        uint64_t v12 = *(void **)(v11 + 40);
        *(void *)(v11 + 40) = v10;

        v9 = *(void **)(*(void *)(a1[5] + 8) + 40);
      }
      [v9 setObject:v8 forKey:v17];
    }
    uint64_t v13 = *(void **)(*(void *)(a1[6] + 8) + 40);
    if (!v13)
    {
      uint64_t v14 = objc_opt_new();
      uint64_t v15 = *(void *)(a1[6] + 8);
      v16 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v14;

      uint64_t v13 = *(void **)(*(void *)(a1[6] + 8) + 40);
    }
    [v13 addObject:v17];
  }
}

void __51__BSKeyedSettingsDiff_diffFromSettings_toSettings___block_invoke_3(uint64_t a1, void *a2)
{
  id v8 = a2;
  v3 = *(void **)(a1 + 32);
  if (!v3 || [v3 flagForKey:v8] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (!v4)
    {
      uint64_t v5 = objc_opt_new();
      uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
      v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;

      v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    }
    [v4 addObject:v8];
  }
}

- (BOOL)_isKeyed
{
  return 1;
}

+ (id)diffFromSettings:(id)a3 toSettings:(id)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v7 && ([v7 isKeyedSettings] & 1) == 0)
  {
    v20 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"!from || [from isKeyedSettings]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      v22 = (objc_class *)objc_opt_class();
      v23 = NSStringFromClass(v22);
      *(_DWORD *)buf = 138544642;
      *(void *)&buf[4] = v21;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v23;
      *(_WORD *)&buf[22] = 2048;
      id v54 = a1;
      LOWORD(v55) = 2114;
      *(void *)((char *)&v55 + 2) = @"BSSettingsDiff.m";
      WORD5(v55) = 1024;
      HIDWORD(v55) = 404;
      __int16 v56 = 2114;
      v57 = v20;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v20 UTF8String];
    __break(0);
    JUMPOUT(0x18AAB28ACLL);
  }
  if (v8 && ([v8 isKeyedSettings] & 1) == 0)
  {
    v24 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"!to || [to isKeyedSettings]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v25 = (id)objc_claimAutoreleasedReturnValue();
      v26 = (objc_class *)objc_opt_class();
      v27 = NSStringFromClass(v26);
      *(_DWORD *)buf = 138544642;
      *(void *)&buf[4] = v25;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v27;
      *(_WORD *)&buf[22] = 2048;
      id v54 = a1;
      LOWORD(v55) = 2114;
      *(void *)((char *)&v55 + 2) = @"BSSettingsDiff.m";
      WORD5(v55) = 1024;
      HIDWORD(v55) = 405;
      __int16 v56 = 2114;
      v57 = v24;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v24 UTF8String];
    __break(0);
    JUMPOUT(0x18AAB29B0);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v54 = __Block_byref_object_copy__7;
  *(void *)&long long v55 = __Block_byref_object_dispose__7;
  *((void *)&v55 + 1) = 0;
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__7;
  v51 = __Block_byref_object_dispose__7;
  id v52 = 0;
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__7;
  v45 = __Block_byref_object_dispose__7;
  id v46 = 0;
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __51__BSKeyedSettingsDiff_diffFromSettings_toSettings___block_invoke;
  v38[3] = &unk_1E5446A08;
  id v9 = v7;
  id v39 = v9;
  v40 = buf;
  [v8 enumerateKeyedFlagsWithBlock:v38];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __51__BSKeyedSettingsDiff_diffFromSettings_toSettings___block_invoke_2;
  v35[3] = &unk_1E5446A30;
  id v10 = v9;
  id v36 = v10;
  v37 = buf;
  [v8 enumerateKeyedObjectsWithBlock:v35];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __51__BSKeyedSettingsDiff_diffFromSettings_toSettings___block_invoke_3;
  v32[3] = &unk_1E5446A08;
  id v11 = v8;
  id v33 = v11;
  v34 = &v47;
  [v10 enumerateKeyedFlagsWithBlock:v32];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __51__BSKeyedSettingsDiff_diffFromSettings_toSettings___block_invoke_4;
  v28[3] = &unk_1E5446A58;
  id v12 = v11;
  id v29 = v12;
  v30 = buf;
  v31 = &v41;
  [v10 enumerateKeyedObjectsWithBlock:v28];
  if (!BSSettingsIsEmpty(*(void **)(*(void *)&buf[8] + 40))
    || [(id)v48[5] count]
    || [(id)v42[5] count])
  {
    uint64_t v13 = [v12 descriptionProvider];
    uint64_t v14 = v13;
    if (v13)
    {
      id v15 = v13;
    }
    else
    {
      id v15 = [v10 descriptionProvider];
    }
    v16 = v15;

    [*(id *)(*(void *)&buf[8] + 40) setDescriptionProvider:v16];
    id v17 = (id *)objc_alloc((Class)a1);
    v18 = -[BSSettingsDiff _initWithChanges:flagRemovals:objectRemovals:](v17, *(void **)(*(void *)&buf[8] + 40), (void *)v48[5], (void *)v42[5]);
    [v18 setDescriptionProvider:v16];
  }
  else
  {
    v18 = 0;
  }

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v47, 8);

  _Block_object_dispose(buf, 8);
  return v18;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

+ (Class)_removalClass
{
  return (Class)objc_opt_class();
}

void __51__BSKeyedSettingsDiff_diffFromSettings_toSettings___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v10 = a2;
  uint64_t v5 = *(void **)(a1 + 32);
  if (!v5 || [v5 flagForKey:v10] != a3)
  {
    uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (!v6)
    {
      uint64_t v7 = objc_opt_new();
      uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
      id v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;

      uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    }
    [v6 setFlag:a3 forKey:v10];
  }
}

- (void)inspectKeyedChangesWithBlock:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void, unint64_t, id))a3;
  uint64_t v13 = objc_opt_class();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(BSKeyedSettingsDiff *)self allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v14 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v14) {
          objc_enumerationMutation(v5);
        }
        uint64_t v8 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        unint64_t v9 = [(BSKeyedSettingsDiff *)self _diffTypesForKey:v8];
        if ((v9 & 2) != 0)
        {
          id v10 = [(BSSettings *)self->super._changes objectForKey:v8];
          if (v13)
          {
            if (objc_opt_isKindOfClass()) {
              id v11 = v10;
            }
            else {
              id v11 = 0;
            }
          }
          else
          {
            id v11 = 0;
          }
          id v12 = v11;

          v4[2](v4, v8, v9, v12);
        }
        else
        {
          v4[2](v4, v8, v9, 0);
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
}

- (unint64_t)_diffTypesForKey:(id)a3
{
  id v4 = a3;
  changes = self->super._changes;
  BOOL v6 = changes && [(BSSettings *)changes flagForKey:v4] != 0x7FFFFFFFFFFFFFFFLL
    || [(NSSet *)self->super._flagRemovals containsObject:v4];
  uint64_t v7 = self->super._changes;
  if (v7
    && ([(BSSettings *)self->super._changes objectForKey:v4],
        (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    BOOL v9 = 1;
  }
  else
  {
    BOOL v9 = [(NSSet *)self->super._objectRemovals containsObject:v4];
    if (!v7) {
      goto LABEL_12;
    }
    uint64_t v8 = 0;
  }

LABEL_12:
  if (v9) {
    unint64_t v10 = v6 | 2;
  }
  else {
    unint64_t v10 = v6;
  }

  return v10;
}

- (id)allKeys
{
  v3 = [(BSSettings *)self->super._changes allKeys];
  id v4 = (void *)[v3 mutableCopy];
  uint64_t v5 = v4;
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = (id)objc_opt_new();
  }
  uint64_t v7 = v6;

  [v7 unionSet:self->super._flagRemovals];
  [v7 unionSet:self->super._objectRemovals];
  return v7;
}

- (void)applyToSettings:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 applySettings:self->super._changes];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = self->super._flagRemovals;
  uint64_t v6 = [(NSSet *)v5 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v18;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v5);
        }
        [v4 setFlag:0x7FFFFFFFFFFFFFFFLL forKey:*(void *)(*((void *)&v17 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [(NSSet *)v5 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v6);
  }

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  BOOL v9 = self->super._objectRemovals;
  uint64_t v10 = [(NSSet *)v9 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(v4, "setObject:forKey:", 0, *(void *)(*((void *)&v13 + 1) + 8 * v12++), (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [(NSSet *)v9 countByEnumeratingWithState:&v13 objects:v21 count:16];
    }
    while (v10);
  }
}

- (id)allSettings
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [(BSKeyedSettingsDiff *)self allKeys];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v3, "addValue:", objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "hash"));
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  return v3;
}

- (id)copyWithKeys:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    uint64_t v5 = self->super._changes;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id obj = [(BSSettings *)v5 allKeys];
    uint64_t v6 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    id v21 = self;
    uint64_t v7 = 0;
    if (v6)
    {
      uint64_t v8 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v24 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          long long v11 = -[BSSettings objectForKey:](v5, "objectForKey:", v10, v21);
          uint64_t v12 = objc_opt_class();
          id v13 = v11;
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
          id v15 = v14;

          if (v15)
          {
            if (!v7) {
              uint64_t v7 = (void *)[(BSSettings *)v21->super._changes mutableCopy];
            }
            long long v16 = (void *)[v15 copyWithKeys:v4];

            [v7 setObject:v16 forKey:v10];
          }
          else if ([v4 containsObject:v10])
          {
            long long v16 = 0;
          }
          else
          {
            if (!v7) {
              uint64_t v7 = (void *)[(BSSettings *)v21->super._changes mutableCopy];
            }
            [v7 setObject:0 forKey:v10];
            [v7 setFlag:0x7FFFFFFFFFFFFFFFLL forKey:v10];
            long long v16 = 0;
          }
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v6);
    }

    long long v17 = (BSSettings *)[v7 copy];
    if (!v17)
    {
      long long v17 = v21->super._changes;
      if (!v17)
      {
        if (v21->super._flagRemovals)
        {
          long long v17 = 0;
        }
        else
        {
          long long v17 = 0;
          long long v18 = 0;
          if (!v21->super._objectRemovals)
          {
LABEL_30:

            goto LABEL_31;
          }
        }
      }
    }
    long long v18 = -[BSSettingsDiff _initWithChanges:flagRemovals:objectRemovals:]((id *)[BSKeyedSettingsDiff alloc], v17, v21->super._flagRemovals, v21->super._objectRemovals);
    long long v19 = [(BSSettingsDiff *)v21 descriptionProvider];
    [v18 setDescriptionProvider:v19];

    goto LABEL_30;
  }
  long long v18 = 0;
LABEL_31:

  return v18;
}

- (id)copyWithSettings:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [NSString stringWithFormat:@"cannot call -copyWithSettings: on a keyed diff"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = (objc_class *)objc_opt_class();
    long long v9 = NSStringFromClass(v8);
    int v11 = 138544642;
    id v12 = v7;
    __int16 v13 = 2114;
    uint64_t v14 = v9;
    __int16 v15 = 2048;
    long long v16 = self;
    __int16 v17 = 2114;
    long long v18 = @"BSSettingsDiff.m";
    __int16 v19 = 1024;
    int v20 = 542;
    __int16 v21 = 2114;
    v22 = v6;
    _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v11, 0x3Au);
  }
  id result = (id) [v6 UTF8String];
  qword_1E911F420 = (uint64_t)result;
  __break(0);
  return result;
}

- (unint64_t)_diffTypesForSetting:(unint64_t)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v5 = [(BSSettings *)self->super._changes allKeys];
  unint64_t v6 = 0;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v31 + 1) + 8 * i) hash] == a3)
        {
          int64_t v10 = [(BSSettings *)self->super._changes flagForSetting:a3];
          int v11 = [(BSSettings *)self->super._changes objectForSetting:a3];
          BOOL v12 = v10 != 0x7FFFFFFFFFFFFFFFLL;
          BOOL v13 = v11 == 0;

          if (v13) {
            v6 |= v12;
          }
          else {
            v6 |= v12 | 2;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v7);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v14 = self->super._flagRemovals;
  uint64_t v15 = [(NSSet *)v14 countByEnumeratingWithState:&v27 objects:v36 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v28 != v16) {
          objc_enumerationMutation(v14);
        }
        v6 |= [*(id *)(*((void *)&v27 + 1) + 8 * j) hash] == a3;
      }
      uint64_t v15 = [(NSSet *)v14 countByEnumeratingWithState:&v27 objects:v36 count:16];
    }
    while (v15);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v18 = self->super._objectRemovals;
  uint64_t v19 = [(NSSet *)v18 countByEnumeratingWithState:&v23 objects:v35 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v24;
    do
    {
      for (uint64_t k = 0; k != v19; ++k)
      {
        if (*(void *)v24 != v20) {
          objc_enumerationMutation(v18);
        }
        if (objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * k), "hash", (void)v23) == a3) {
          v6 |= 2uLL;
        }
      }
      uint64_t v19 = [(NSSet *)v18 countByEnumeratingWithState:&v23 objects:v35 count:16];
    }
    while (v19);
  }

  return v6;
}

- (id)_keyDescriptionForSetting:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(BSKeyedSettingsDiff *)self allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v14 != v7) {
        objc_enumerationMutation(v5);
      }
      long long v9 = *(void **)(*((void *)&v13 + 1) + 8 * v8);
      if ([v9 hash] == a3) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v10 = v9;

    if (v10) {
      goto LABEL_12;
    }
  }
  else
  {
LABEL_9:
  }
  v12.receiver = self;
  v12.super_class = (Class)BSKeyedSettingsDiff;
  id v10 = [(BSSettingsDiff *)&v12 _keyDescriptionForSetting:a3];
LABEL_12:
  return v10;
}

@end