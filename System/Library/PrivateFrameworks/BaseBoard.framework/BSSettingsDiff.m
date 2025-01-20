@interface BSSettingsDiff
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (Class)_removalClass;
+ (id)diffFromSettings:(id)a3 toSettings:(id)a4;
- (BOOL)_isKeyed;
- (BOOL)isEmpty;
- (BOOL)settingChangedForKey:(id)a3;
- (BOOL)settingChangedForKey:(id)a3 type:(unint64_t *)a4;
- (BSSettingDescriptionProvider)descriptionProvider;
- (BSSettingsDiff)init;
- (BSSettingsDiff)initWithBSXPCCoder:(id)a3;
- (BSSettingsDiff)initWithCoder:(id)a3;
- (BSSettingsDiff)initWithXPCDictionary:(id)a3;
- (NSString)description;
- (id)_initWithChanges:(void *)a3 flagRemovals:(void *)a4 objectRemovals:;
- (id)_keyDescriptionForSetting:(unint64_t)a3;
- (id)allSettings;
- (id)copyWithKeys:(id)a3;
- (id)copyWithSettings:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)_diffTypesForKey:(id)a3;
- (unint64_t)_diffTypesForSetting:(unint64_t)a3;
- (void)_enumerateSettingsInSet:(void *)a3 withBlock:;
- (void)applyToSettings:(id)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
- (void)inspectChangesWithBlock:(id)a3;
- (void)setDescriptionProvider:(id)a3;
@end

@implementation BSSettingsDiff

void __46__BSSettingsDiff_diffFromSettings_toSettings___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v11 = a3;
  v5 = [*(id *)(a1 + 32) objectForSetting:a2];
  if (!v5 || ([v11 isEqual:v5] & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = +[BSSettingsDiff diffFromSettings:v5 toSettings:v11];

      id v11 = (id)v6;
    }
    v7 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (!v7)
    {
      uint64_t v8 = objc_opt_new();
      uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
      v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;

      v7 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    }
    [v7 setObject:v11 forSetting:a2];
  }
}

void __46__BSSettingsDiff_diffFromSettings_toSettings___block_invoke_4(void *a1, uint64_t a2, void *a3)
{
  id v17 = a3;
  v5 = (void *)a1[4];
  if (!v5
    || ([v5 objectForSetting:a2],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        !v6))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = +[BSSettingsDiff diffFromSettings:v17 toSettings:0];
      uint64_t v8 = *(void **)(*(void *)(a1[5] + 8) + 40);
      if (!v8)
      {
        uint64_t v9 = objc_opt_new();
        uint64_t v10 = *(void *)(a1[5] + 8);
        id v11 = *(void **)(v10 + 40);
        *(void *)(v10 + 40) = v9;

        uint64_t v8 = *(void **)(*(void *)(a1[5] + 8) + 40);
      }
      [v8 setObject:v7 forSetting:a2];
    }
    v12 = *(void **)(*(void *)(a1[6] + 8) + 40);
    if (!v12)
    {
      uint64_t v13 = objc_opt_new();
      uint64_t v14 = *(void *)(a1[6] + 8);
      v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;

      v12 = *(void **)(*(void *)(a1[6] + 8) + 40);
    }
    v16 = [NSNumber numberWithUnsignedInteger:a2];
    [v12 addObject:v16];
  }
}

uint64_t __46__BSSettingsDiff_diffFromSettings_toSettings___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)(a1 + 32);
  if (!v6 || (uint64_t result = [v6 flagForSetting:a2], result != a3))
  {
    uint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (!v8)
    {
      uint64_t v9 = objc_opt_new();
      uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
      id v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;

      uint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    }
    return [v8 setFlag:a3 forSetting:a2];
  }
  return result;
}

void __46__BSSettingsDiff_diffFromSettings_toSettings___block_invoke_3(uint64_t a1, uint64_t a2)
{
  v4 = *(void **)(a1 + 32);
  if (!v4 || [v4 flagForSetting:a2] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (!v5)
    {
      uint64_t v6 = objc_opt_new();
      uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;

      v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    }
    id v9 = [NSNumber numberWithUnsignedInteger:a2];
    objc_msgSend(v5, "addObject:");
  }
}

+ (id)diffFromSettings:(id)a3 toSettings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v6 isKeyedSettings] & 1) != 0 || objc_msgSend(v7, "isKeyedSettings"))
  {
    uint64_t v8 = +[BSKeyedSettingsDiff diffFromSettings:v6 toSettings:v7];
  }
  else
  {
    uint64_t v44 = 0;
    v45 = &v44;
    uint64_t v46 = 0x3032000000;
    v47 = __Block_byref_object_copy__7;
    v48 = __Block_byref_object_dispose__7;
    id v49 = 0;
    uint64_t v38 = 0;
    v39 = &v38;
    uint64_t v40 = 0x3032000000;
    v41 = __Block_byref_object_copy__7;
    v42 = __Block_byref_object_dispose__7;
    id v43 = 0;
    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__7;
    v36 = __Block_byref_object_dispose__7;
    id v37 = 0;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __46__BSSettingsDiff_diffFromSettings_toSettings___block_invoke;
    v29[3] = &unk_1E54468A0;
    id v9 = v6;
    id v30 = v9;
    v31 = &v44;
    [v7 enumerateFlagsWithBlock:v29];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __46__BSSettingsDiff_diffFromSettings_toSettings___block_invoke_2;
    v26[3] = &unk_1E54468C8;
    id v10 = v9;
    id v27 = v10;
    v28 = &v44;
    [v7 enumerateObjectsWithBlock:v26];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __46__BSSettingsDiff_diffFromSettings_toSettings___block_invoke_3;
    v23[3] = &unk_1E54468F0;
    id v11 = v7;
    id v24 = v11;
    v25 = &v38;
    -[BSSettings _enumerateSettingsForFlagsWithBlock:]((uint64_t)v10, v23);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __46__BSSettingsDiff_diffFromSettings_toSettings___block_invoke_4;
    v19[3] = &unk_1E5446918;
    id v12 = v11;
    id v20 = v12;
    v21 = &v44;
    v22 = &v32;
    [v10 enumerateObjectsWithBlock:v19];
    if (!BSSettingsIsEmpty((void *)v45[5])
      || [(id)v39[5] count]
      || [(id)v33[5] count])
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

      [(id)v45[5] setDescriptionProvider:v16];
      id v17 = (id *)objc_alloc((Class)a1);
      uint64_t v8 = -[BSSettingsDiff _initWithChanges:flagRemovals:objectRemovals:](v17, (void *)v45[5], (void *)v39[5], (void *)v33[5]);
      [v8 setDescriptionProvider:v16];
    }
    else
    {
      uint64_t v8 = 0;
    }

    _Block_object_dispose(&v32, 8);
    _Block_object_dispose(&v38, 8);

    _Block_object_dispose(&v44, 8);
  }

  return v8;
}

- (id)_initWithChanges:(void *)a3 flagRemovals:(void *)a4 objectRemovals:
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)BSSettingsDiff;
    id v11 = (id *)objc_msgSendSuper2(&v13, sel_init);
    a1 = v11;
    if (v11)
    {
      objc_storeStrong(v11 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
      objc_storeStrong(a1 + 3, a4);
    }
  }

  return a1;
}

- (void)setDescriptionProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_descriptionProvider);
  objc_storeStrong((id *)&self->_objectRemovals, 0);
  objc_storeStrong((id *)&self->_flagRemovals, 0);
  objc_storeStrong((id *)&self->_changes, 0);
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_changes forKey:@"_changes"];
  [v4 encodeCollection:self->_flagRemovals forKey:@"_flagRemovals"];
  [v4 encodeCollection:self->_objectRemovals forKey:@"_objectRemovals"];
}

- (BSSettingsDiff)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_changes"];
  uint64_t v6 = objc_opt_class();
  id v7 = objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v6, objc_msgSend((id)objc_opt_class(), "_removalClass"), @"_flagRemovals");
  uint64_t v8 = objc_opt_class();
  id v9 = objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v8, objc_msgSend((id)objc_opt_class(), "_removalClass"), @"_objectRemovals");
  id v10 = (BSSettingsDiff *)-[BSSettingsDiff _initWithChanges:flagRemovals:objectRemovals:]((id *)&self->super.isa, v5, v7, v9);

  return v10;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

+ (Class)_removalClass
{
  return (Class)objc_opt_class();
}

- (BOOL)settingChangedForKey:(id)a3 type:(unint64_t *)a4
{
  unint64_t v5 = [(BSSettingsDiff *)self _diffTypesForKey:a3];
  if (a4) {
    *a4 = v5;
  }
  return v5 != 0;
}

- (void)inspectChangesWithBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    unint64_t v5 = [(BSSettingsDiff *)self allSettings];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __42__BSSettingsDiff_inspectChangesWithBlock___block_invoke;
    v6[3] = &unk_1E5446968;
    v6[4] = self;
    id v7 = v4;
    [v5 enumerateWithBlock:v6];
  }
}

- (id)allSettings
{
  v3 = [(BSSettings *)self->_changes allSettings];
  id v4 = (void *)[v3 mutableCopy];
  unint64_t v5 = v4;
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = (id)objc_opt_new();
  }
  id v7 = v6;

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __29__BSSettingsDiff_allSettings__block_invoke;
  v12[3] = &unk_1E5446940;
  id v8 = v7;
  id v13 = v8;
  id v9 = (void *)MEMORY[0x18C125630](v12);
  -[BSSettingsDiff _enumerateSettingsInSet:withBlock:]((uint64_t)self, self->_flagRemovals, v9);
  -[BSSettingsDiff _enumerateSettingsInSet:withBlock:]((uint64_t)self, self->_objectRemovals, v9);
  id v10 = v8;

  return v10;
}

- (void)_enumerateSettingsInSet:(void *)a3 withBlock:
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v13 = a2;
  id v5 = a3;
  id v6 = (void (**)(void, void, void))v5;
  if (a1 && v5)
  {
    char v18 = 0;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = v13;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v15;
LABEL_5:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        if (v18) {
          break;
        }
        id v11 = *(void **)(*((void *)&v14 + 1) + 8 * v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          ((void (**)(void, uint64_t, char *))v6)[2](v6, [v11 unsignedIntegerValue], &v18);
        }
        else
        {
          id v12 = [MEMORY[0x1E4F28B00] currentHandler];
          [v12 handleFailureInMethod:sel__enumerateSettingsInSet_withBlock_ object:a1 file:@"BSSettingsDiff.m" lineNumber:256 description:@"Unexpected type found in the hashtable."];
        }
        if (v8 == ++v10)
        {
          uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
          if (v8) {
            goto LABEL_5;
          }
          break;
        }
      }
    }
  }
}

uint64_t __42__BSSettingsDiff_inspectChangesWithBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = [*(id *)(a1 + 32) _diffTypesForSetting:a2];
  id v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  return v5(v3, a2, v4);
}

- (unint64_t)_diffTypesForSetting:(unint64_t)a3
{
  changes = self->_changes;
  unint64_t v8 = 1;
  if (!changes || [(BSSettings *)changes flagForSetting:a3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    flagRemovals = self->_flagRemovals;
    id v7 = [NSNumber numberWithUnsignedInteger:a3];
    LODWORD(flagRemovals) = [(NSSet *)flagRemovals containsObject:v7];

    if (!flagRemovals) {
      unint64_t v8 = 0;
    }
  }
  uint64_t v9 = self->_changes;
  if (v9
    && ([(BSSettings *)self->_changes objectForSetting:a3],
        (uint64_t v10 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    int v11 = 1;
  }
  else
  {
    objectRemovals = self->_objectRemovals;
    id v13 = [NSNumber numberWithUnsignedInteger:a3];
    int v11 = [(NSSet *)objectRemovals containsObject:v13];

    if (!v9) {
      goto LABEL_12;
    }
    uint64_t v10 = 0;
  }

LABEL_12:
  if (v11) {
    return v8 | 2;
  }
  else {
    return v8;
  }
}

uint64_t __29__BSSettingsDiff_allSettings__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addValue:a2];
}

- (BOOL)isEmpty
{
  int IsEmpty = BSSettingsIsEmpty(self->_changes);
  if (IsEmpty)
  {
    if ([(NSSet *)self->_flagRemovals count]) {
      LOBYTE(IsEmpty) = 0;
    }
    else {
      LOBYTE(IsEmpty) = [(NSSet *)self->_objectRemovals count] == 0;
    }
  }
  return IsEmpty;
}

- (void)applyToSettings:(id)a3
{
  id v4 = a3;
  [v4 applySettings:self->_changes];
  flagRemovals = self->_flagRemovals;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __34__BSSettingsDiff_applyToSettings___block_invoke;
  v11[3] = &unk_1E5446940;
  id v6 = v4;
  id v12 = v6;
  -[BSSettingsDiff _enumerateSettingsInSet:withBlock:]((uint64_t)self, flagRemovals, v11);
  objectRemovals = self->_objectRemovals;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __34__BSSettingsDiff_applyToSettings___block_invoke_2;
  v9[3] = &unk_1E5446940;
  id v8 = v6;
  id v10 = v8;
  -[BSSettingsDiff _enumerateSettingsInSet:withBlock:]((uint64_t)self, objectRemovals, v9);
}

- (BOOL)settingChangedForKey:(id)a3
{
  return [(BSSettingsDiff *)self settingChangedForKey:a3 type:0];
}

- (BSSettingsDiff)init
{
  return (BSSettingsDiff *)-[BSSettingsDiff _initWithChanges:flagRemovals:objectRemovals:]((id *)&self->super.isa, 0, 0, 0);
}

- (BSSettingsDiff)initWithXPCDictionary:(id)a3
{
  id v4 = +[BSXPCCoder coderWithMessage:a3];
  id v5 = [(BSSettingsDiff *)self initWithBSXPCCoder:v4];

  return v5;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4 = +[BSXPCCoder coderWithMessage:a3];
  -[BSSettingsDiff encodeWithBSXPCCoder:](self, "encodeWithBSXPCCoder:");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_changes forKey:@"changes"];
  [v4 encodeObject:self->_flagRemovals forKey:@"flagRemovals"];
  [v4 encodeObject:self->_objectRemovals forKey:@"objectRemovals"];
}

- (BSSettingsDiff)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"changes"];
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  id v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_msgSend((id)objc_opt_class(), "_removalClass"), 0);
  uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"flagRemovals"];
  id v10 = [v4 decodeObjectOfClasses:v8 forKey:@"objectRemovals"];
  int v11 = (BSSettingsDiff *)-[BSSettingsDiff _initWithChanges:flagRemovals:objectRemovals:]((id *)&self->super.isa, v5, v9, v10);

  return v11;
}

uint64_t __34__BSSettingsDiff_applyToSettings___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setFlag:0x7FFFFFFFFFFFFFFFLL forSetting:a2];
}

uint64_t __34__BSSettingsDiff_applyToSettings___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setObject:0 forSetting:a2];
}

- (id)copyWithSettings:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    uint64_t v13 = 0;
    long long v14 = &v13;
    uint64_t v15 = 0x3032000000;
    long long v16 = __Block_byref_object_copy__7;
    long long v17 = __Block_byref_object_dispose__7;
    id v18 = 0;
    id v5 = [(BSSettings *)self->_changes allSettings];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __35__BSSettingsDiff_copyWithSettings___block_invoke;
    v10[3] = &unk_1E5446990;
    v10[4] = self;
    id v11 = v4;
    id v12 = &v13;
    [v5 enumerateWithBlock:v10];

    id v6 = (BSSettings *)[(id)v14[5] copy];
    if (!v6)
    {
      id v6 = self->_changes;
      if (!v6)
      {
        if (self->_flagRemovals)
        {
          id v6 = 0;
        }
        else
        {
          id v6 = 0;
          uint64_t v7 = 0;
          if (!self->_objectRemovals)
          {
LABEL_9:

            _Block_object_dispose(&v13, 8);
            goto LABEL_10;
          }
        }
      }
    }
    uint64_t v7 = -[BSSettingsDiff _initWithChanges:flagRemovals:objectRemovals:]((id *)[BSSettingsDiff alloc], v6, self->_flagRemovals, self->_objectRemovals);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_descriptionProvider);
    [v7 setDescriptionProvider:WeakRetained];

    goto LABEL_9;
  }
  uint64_t v7 = 0;
LABEL_10:

  return v7;
}

void __35__BSSettingsDiff_copyWithSettings___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(*(void *)(a1 + 32) + 8) objectForSetting:a2];
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 8) mutableCopy];
      uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
      id v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;
    }
    uint64_t v17 = [v8 copyWithSettings:*(void *)(a1 + 40)];

    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v17 forSetting:a2];
    id v12 = (void *)v17;
  }
  else if ([*(id *)(a1 + 40) containsValue:a2])
  {
    id v12 = 0;
  }
  else
  {
    uint64_t v13 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (!v13)
    {
      uint64_t v14 = [*(id *)(*(void *)(a1 + 32) + 8) mutableCopy];
      uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
      long long v16 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v14;

      uint64_t v13 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    }
    [v13 setObject:0 forSetting:a2];
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setFlag:0x7FFFFFFFFFFFFFFFLL forSetting:a2];
    id v12 = 0;
  }
}

- (id)copyWithKeys:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [NSString stringWithFormat:@"cannot call -copyWithKeys: on a non-keyed diff"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    int v11 = 138544642;
    id v12 = v7;
    __int16 v13 = 2114;
    uint64_t v14 = v9;
    __int16 v15 = 2048;
    long long v16 = self;
    __int16 v17 = 2114;
    id v18 = @"BSSettingsDiff.m";
    __int16 v19 = 1024;
    int v20 = 241;
    __int16 v21 = 2114;
    v22 = v6;
    _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v11, 0x3Au);
  }
  id result = (id) [v6 UTF8String];
  qword_1E911F420 = (uint64_t)result;
  __break(0);
  return result;
}

- (BOOL)_isKeyed
{
  return 0;
}

- (unint64_t)_diffTypesForKey:(id)a3
{
  return 0;
}

- (NSString)description
{
  return (NSString *)[(BSSettingsDiff *)self descriptionWithMultilinePrefix:0];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(BSSettingsDiff *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v5 = a3;
  id v6 = +[BSDescriptionBuilder builderWithObject:self];
  id v7 = [(BSSettingsDiff *)self allSettings];
  if ([v7 count])
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __56__BSSettingsDiff_descriptionBuilderWithMultilinePrefix___block_invoke;
    v13[3] = &unk_1E54469E0;
    id v14 = v7;
    __int16 v15 = self;
    id v8 = v6;
    id v16 = v8;
    SEL v17 = a2;
    [v8 appendBodySectionWithName:0 multilinePrefix:v5 block:v13];
    uint64_t v9 = v16;
    id v10 = v8;
  }
  else
  {
    id v11 = (id)[v6 appendObject:@"(empty)" withName:0];
  }

  return v6;
}

void __56__BSSettingsDiff_descriptionBuilderWithMultilinePrefix___block_invoke(void *a1)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__BSSettingsDiff_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v6[3] = &unk_1E54469B8;
  v2 = (void *)a1[4];
  uint64_t v3 = (void *)a1[6];
  v6[4] = a1[5];
  id v4 = v3;
  uint64_t v5 = a1[7];
  id v7 = v4;
  uint64_t v8 = v5;
  [v2 enumerateWithBlock:v6];
}

void __56__BSSettingsDiff_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 8);
  if (v5)
  {
    uint64_t v6 = [v5 flagForSetting:a2];
    uint64_t v4 = *(void *)(a1 + 32);
    id v7 = *(void **)(v4 + 8);
    if (v7)
    {
      id v25 = [v7 objectForSetting:a2];
      uint64_t v4 = *(void *)(a1 + 32);
    }
    else
    {
      id v25 = 0;
    }
  }
  else
  {
    id v25 = 0;
    uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(v4 + 32));
  if (*(void *)(*(void *)(a1 + 32) + 8) && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v9 = [WeakRetained settings:*(void *)(*(void *)(a1 + 32) + 8) keyDescriptionForSetting:a2];
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
LABEL_12:
      id v10 = [*(id *)(a1 + 32) _keyDescriptionForSetting:a2];
      goto LABEL_13;
    }
    uint64_t v9 = [WeakRetained keyDescriptionForSetting:a2];
  }
  id v10 = (void *)v9;
  if (!v9) {
    goto LABEL_12;
  }
LABEL_13:
  if (*(void *)(*(void *)(a1 + 32) + 8) && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v11 = [WeakRetained settings:*(void *)(*(void *)(a1 + 32) + 8) valueDescriptionForFlag:v6 object:v25 ofSetting:a2];
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_20;
    }
    uint64_t v11 = [WeakRetained valueDescriptionForFlag:v6 object:v25 ofSetting:a2];
  }
  id v12 = (void *)v11;
  if (v11)
  {
    +[BSSettings _appendObject:v11 toBuilder:*(void *)(a1 + 40) forName:v10];
    goto LABEL_30;
  }
LABEL_20:
  uint64_t v13 = [*(id *)(a1 + 32) _diffTypesForSetting:a2];
  unint64_t v14 = (unint64_t)v25;
  if (!v25) {
    unint64_t v14 = (unint64_t)@"(removed)" & (v13 << 62 >> 63);
  }
  id v25 = (id)v14;
  if ((~(_BYTE)v13 & 3) != 0)
  {
    if ((v13 & 1) == 0)
    {
      if ((v13 & 2) == 0)
      {
        int v20 = [NSString stringWithFormat:@"invalid diff type for %@", v10];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(*(SEL *)(a1 + 48));
          id v21 = (id)objc_claimAutoreleasedReturnValue();
          v22 = (objc_class *)objc_opt_class();
          uint64_t v23 = NSStringFromClass(v22);
          uint64_t v24 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138544642;
          id v27 = v21;
          __int16 v28 = 2114;
          v29 = v23;
          __int16 v30 = 2048;
          uint64_t v31 = v24;
          __int16 v32 = 2114;
          v33 = @"BSSettingsDiff.m";
          __int16 v34 = 1024;
          int v35 = 374;
          __int16 v36 = 2114;
          id v37 = v20;
          _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
        }
        qword_1E911F420 = [v20 UTF8String];
        __break(0);
        JUMPOUT(0x18AB345DCLL);
      }
      +[BSSettings _appendObject:v14 toBuilder:*(void *)(a1 + 40) forName:v10];
      goto LABEL_29;
    }
    __int16 v19 = BSSettingFlagDescription(v6);
    +[BSSettings _appendObject:v19 toBuilder:*(void *)(a1 + 40) forName:v10];
  }
  else
  {
    __int16 v15 = BSSettingFlagDescription(v6);
    uint64_t v16 = *(void *)(a1 + 40);
    SEL v17 = [NSString stringWithFormat:@"%@ [flag]", v10];
    +[BSSettings _appendObject:v15 toBuilder:v16 forName:v17];

    uint64_t v18 = *(void *)(a1 + 40);
    __int16 v19 = [NSString stringWithFormat:@"%@ [obj]", v10];
    +[BSSettings _appendObject:v25 toBuilder:v18 forName:v19];
  }

LABEL_29:
  id v12 = 0;
LABEL_30:
}

- (id)_keyDescriptionForSetting:(unint64_t)a3
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"(%lu)", a3);
}

- (id)succinctDescription
{
  return [(BSSettingsDiff *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescriptionBuilder
{
  return [(BSSettingsDiff *)self descriptionBuilderWithMultilinePrefix:0];
}

- (BSSettingDescriptionProvider)descriptionProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_descriptionProvider);
  return (BSSettingDescriptionProvider *)WeakRetained;
}

@end