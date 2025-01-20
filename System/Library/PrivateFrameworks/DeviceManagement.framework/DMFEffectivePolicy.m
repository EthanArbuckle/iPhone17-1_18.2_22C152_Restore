@interface DMFEffectivePolicy
+ (BOOL)supportsSecureCoding;
+ (NSSet)downtimeCategoryIdentifiers;
+ (NSSet)systemCategoryIdentifiers;
+ (NSSet)unblockableBundleIdentifiers;
+ (NSSet)unblockableCategoryIdentifiers;
- (BOOL)downtimeEnforced;
- (BOOL)isEqual:(id)a3;
- (DMFEffectivePolicy)initWithCoder:(id)a3;
- (DMFEffectivePolicy)initWithType:(id)a3 defaultPolicy:(int64_t)a4 currentPoliciesByIdentifier:(id)a5 defaultPriority:(unint64_t)a6 prioritiesByIdentifier:(id)a7 excludedIdentifiers:(id)a8 downtimeEnforced:(BOOL)a9;
- (NSDictionary)currentPoliciesByIdentifier;
- (NSDictionary)prioritiesByIdentifier;
- (NSSet)excludedIdentifiers;
- (NSString)type;
- (id)_valueForMatchingHostName:(id)a3 inRegisteredHostNames:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)defaultPolicy;
- (int64_t)policyForHostName:(id)a3;
- (int64_t)policyForIdentifier:(id)a3 excludableIdentifiers:(id)a4;
- (int64_t)priorityForIdentifier:(id)a3;
- (unint64_t)defaultPriority;
- (unint64_t)hash;
- (unint64_t)priorityForHostName:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DMFEffectivePolicy

- (DMFEffectivePolicy)initWithType:(id)a3 defaultPolicy:(int64_t)a4 currentPoliciesByIdentifier:(id)a5 defaultPriority:(unint64_t)a6 prioritiesByIdentifier:(id)a7 excludedIdentifiers:(id)a8 downtimeEnforced:(BOOL)a9
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  v29.receiver = self;
  v29.super_class = (Class)DMFEffectivePolicy;
  v19 = [(DMFEffectivePolicy *)&v29 init];
  if (v19)
  {
    uint64_t v20 = [v15 copy];
    type = v19->_type;
    v19->_type = (NSString *)v20;

    v19->_defaultPolicy = a4;
    uint64_t v22 = [v16 copy];
    currentPoliciesByIdentifier = v19->_currentPoliciesByIdentifier;
    v19->_currentPoliciesByIdentifier = (NSDictionary *)v22;

    v19->_defaultPriority = a6;
    uint64_t v24 = [v17 copy];
    prioritiesByIdentifier = v19->_prioritiesByIdentifier;
    v19->_prioritiesByIdentifier = (NSDictionary *)v24;

    uint64_t v26 = [v18 copy];
    excludedIdentifiers = v19->_excludedIdentifiers;
    v19->_excludedIdentifiers = (NSSet *)v26;

    v19->_downtimeEnforced = a9;
  }

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  LOBYTE(v6) = self->_downtimeEnforced;
  return (id)[v4 initWithType:self->_type defaultPolicy:self->_defaultPolicy currentPoliciesByIdentifier:self->_currentPoliciesByIdentifier defaultPriority:self->_defaultPriority prioritiesByIdentifier:self->_prioritiesByIdentifier excludedIdentifiers:self->_excludedIdentifiers downtimeEnforced:v6];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  type = self->_type;
  id v5 = a3;
  [v5 encodeObject:type forKey:@"type"];
  [v5 encodeInteger:self->_defaultPolicy forKey:@"defaultPolicy"];
  [v5 encodeObject:self->_currentPoliciesByIdentifier forKey:@"currentPoliciesByIdentifier"];
  [v5 encodeInteger:self->_defaultPriority forKey:@"defaultPriority"];
  [v5 encodeObject:self->_prioritiesByIdentifier forKey:@"prioritiesByIdentifier"];
  [v5 encodeObject:self->_excludedIdentifiers forKey:@"excludedIdentifiers"];
  id v6 = [NSNumber numberWithBool:self->_downtimeEnforced];
  [v5 encodeObject:v6 forKey:@"downtimeEnforced"];
}

- (DMFEffectivePolicy)initWithCoder:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)DMFEffectivePolicy;
  id v5 = [(DMFEffectivePolicy *)&v33 init];
  if (v5)
  {
    v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    uint64_t v32 = [v4 decodeIntegerForKey:@"defaultPolicy"];
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v10 = [v4 decodeObjectOfClasses:v9 forKey:@"currentPoliciesByIdentifier"];

    uint64_t v11 = [v4 decodeIntegerForKey:@"defaultPriority"];
    v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    id v15 = objc_msgSend(v12, "setWithObjects:", v13, v14, objc_opt_class(), 0);
    id v16 = [v4 decodeObjectOfClasses:v15 forKey:@"prioritiesByIdentifier"];

    id v17 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v18 = objc_opt_class();
    v19 = objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"excludedIdentifiers"];

    v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"downtimeEnforced"];
    uint64_t v22 = [v31 copy];
    type = v5->_type;
    v5->_type = (NSString *)v22;

    v5->_defaultPolicy = v32;
    uint64_t v24 = [v10 copy];
    currentPoliciesByIdentifier = v5->_currentPoliciesByIdentifier;
    v5->_currentPoliciesByIdentifier = (NSDictionary *)v24;

    v5->_defaultPriority = v11;
    uint64_t v26 = [v16 copy];
    prioritiesByIdentifier = v5->_prioritiesByIdentifier;
    v5->_prioritiesByIdentifier = (NSDictionary *)v26;

    uint64_t v28 = [v20 copy];
    excludedIdentifiers = v5->_excludedIdentifiers;
    v5->_excludedIdentifiers = (NSSet *)v28;

    v5->_downtimeEnforced = [v21 BOOLValue];
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = (DMFEffectivePolicy *)a3;
  if (self == v6)
  {
    LOBYTE(v15) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = v6;
      uint64_t v8 = [(DMFEffectivePolicy *)self type];
      v9 = [(DMFEffectivePolicy *)v7 type];
      if (![v8 isEqual:v9]
        || (int64_t v10 = [(DMFEffectivePolicy *)self defaultPolicy],
            v10 != [(DMFEffectivePolicy *)v7 defaultPolicy])
        || (unint64_t v11 = [(DMFEffectivePolicy *)self defaultPriority],
            v11 != [(DMFEffectivePolicy *)v7 defaultPriority]))
      {
        LOBYTE(v15) = 0;
LABEL_13:

        goto LABEL_14;
      }
      v12 = [(DMFEffectivePolicy *)self currentPoliciesByIdentifier];
      if (v12
        || ([(DMFEffectivePolicy *)v7 currentPoliciesByIdentifier],
            (v3 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        uint64_t v13 = [(DMFEffectivePolicy *)self currentPoliciesByIdentifier];
        id v4 = [(DMFEffectivePolicy *)v7 currentPoliciesByIdentifier];
        if (![v13 isEqual:v4])
        {
          LOBYTE(v15) = 0;
LABEL_42:

          goto LABEL_43;
        }
        uint64_t v28 = v4;
        objc_super v29 = v13;
        uint64_t v14 = 1;
      }
      else
      {
        uint64_t v14 = 0;
      }
      id v17 = [(DMFEffectivePolicy *)self prioritiesByIdentifier];
      if (v17
        || ([(DMFEffectivePolicy *)v7 prioritiesByIdentifier],
            (v23 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        id v4 = [(DMFEffectivePolicy *)self prioritiesByIdentifier];
        v30 = [(DMFEffectivePolicy *)v7 prioritiesByIdentifier];
        if (!objc_msgSend(v4, "isEqual:"))
        {
          LOBYTE(v15) = 0;
          goto LABEL_35;
        }
        uint64_t v24 = v3;
        int v25 = 1;
      }
      else
      {
        v23 = 0;
        uint64_t v24 = v3;
        int v25 = 0;
      }
      uint64_t v26 = v4;
      int v27 = v14;
      uint64_t v18 = [(DMFEffectivePolicy *)self excludedIdentifiers];
      if (v18
        || ([(DMFEffectivePolicy *)v7 excludedIdentifiers],
            (uint64_t v20 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        uint64_t v14 = [(DMFEffectivePolicy *)self excludedIdentifiers];
        id v4 = [(DMFEffectivePolicy *)v7 excludedIdentifiers];
        if (![(id)v14 isEqual:v4])
        {
          LOBYTE(v15) = 0;
LABEL_30:

LABEL_31:
          if (v18)
          {

            LODWORD(v14) = v27;
            id v4 = v26;
            if (!v25)
            {
              v3 = v24;
              if (v17)
              {
LABEL_37:

                if (!v14) {
                  goto LABEL_43;
                }
LABEL_41:
                id v4 = v28;
                uint64_t v13 = v29;
                goto LABEL_42;
              }
LABEL_40:

              if ((v14 & 1) == 0)
              {
LABEL_43:
                if (!v12) {

                }
                goto LABEL_13;
              }
              goto LABEL_41;
            }
            v3 = v24;
          }
          else
          {

            v3 = v24;
            LODWORD(v14) = v27;
            id v4 = v26;
            if ((v25 & 1) == 0) {
              goto LABEL_36;
            }
          }
LABEL_35:

LABEL_36:
          if (v17) {
            goto LABEL_37;
          }
          goto LABEL_40;
        }
        int v22 = 1;
      }
      else
      {
        v21 = 0;
        int v22 = 0;
      }
      BOOL v19 = [(DMFEffectivePolicy *)self downtimeEnforced];
      BOOL v15 = v19 ^ [(DMFEffectivePolicy *)v7 downtimeEnforced] ^ 1;
      if (!v22) {
        goto LABEL_31;
      }
      goto LABEL_30;
    }
    LOBYTE(v15) = 0;
  }
LABEL_14:

  return v15;
}

- (unint64_t)hash
{
  v3 = [(DMFEffectivePolicy *)self type];
  uint64_t v4 = [v3 hash];
  int64_t v5 = [(DMFEffectivePolicy *)self defaultPolicy] ^ v4;
  id v6 = [(DMFEffectivePolicy *)self currentPoliciesByIdentifier];
  uint64_t v7 = [v6 hash];
  unint64_t v8 = v5 ^ v7 ^ [(DMFEffectivePolicy *)self defaultPriority];
  v9 = [(DMFEffectivePolicy *)self prioritiesByIdentifier];
  uint64_t v10 = [v9 hash];
  unint64_t v11 = [(DMFEffectivePolicy *)self excludedIdentifiers];
  uint64_t v12 = v10 ^ [v11 hash];
  unint64_t v13 = v8 ^ v12 ^ [(DMFEffectivePolicy *)self downtimeEnforced];

  return v13;
}

+ (NSSet)unblockableBundleIdentifiers
{
  v2 = [MEMORY[0x1E4F580A8] systemHiddenBundleIdentifiersForDeviceFamily:101];
  v3 = [MEMORY[0x1E4F580A8] systemUnblockableBundleIdentifiersForDeviceFamily:101];
  uint64_t v4 = [v2 setByAddingObjectsFromSet:v3];

  return (NSSet *)v4;
}

+ (NSSet)unblockableCategoryIdentifiers
{
  if (unblockableCategoryIdentifiers_onceToken != -1) {
    dispatch_once(&unblockableCategoryIdentifiers_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)[(id)unblockableCategoryIdentifiers_unblockableCategoryIdentifiers copy];
  return (NSSet *)v2;
}

void __52__DMFEffectivePolicy_unblockableCategoryIdentifiers__block_invoke()
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = *MEMORY[0x1E4F58070];
  v5[0] = *MEMORY[0x1E4F58060];
  v5[1] = v1;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];
  uint64_t v3 = [v0 setWithArray:v2];
  uint64_t v4 = (void *)unblockableCategoryIdentifiers_unblockableCategoryIdentifiers;
  unblockableCategoryIdentifiers_unblockableCategoryIdentifiers = v3;
}

+ (NSSet)systemCategoryIdentifiers
{
  if (systemCategoryIdentifiers_onceToken != -1) {
    dispatch_once(&systemCategoryIdentifiers_onceToken, &__block_literal_global_26);
  }
  v2 = (void *)[(id)systemCategoryIdentifiers_systemCategoryIdentifiers copy];
  return (NSSet *)v2;
}

void __47__DMFEffectivePolicy_systemCategoryIdentifiers__block_invoke()
{
  void v5[3] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = *MEMORY[0x1E4F58058];
  v5[0] = *MEMORY[0x1E4F58060];
  v5[1] = v1;
  v5[2] = *MEMORY[0x1E4F58070];
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:3];
  uint64_t v3 = [v0 setWithArray:v2];
  uint64_t v4 = (void *)systemCategoryIdentifiers_systemCategoryIdentifiers;
  systemCategoryIdentifiers_systemCategoryIdentifiers = v3;
}

+ (NSSet)downtimeCategoryIdentifiers
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__DMFEffectivePolicy_downtimeCategoryIdentifiers__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (downtimeCategoryIdentifiers_onceToken != -1) {
    dispatch_once(&downtimeCategoryIdentifiers_onceToken, block);
  }
  v2 = (void *)[(id)downtimeCategoryIdentifiers_downtimeCategoryIdentifiers copy];
  return (NSSet *)v2;
}

void __49__DMFEffectivePolicy_downtimeCategoryIdentifiers__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v1 = [MEMORY[0x1E4F580A8] sharedCategories];
  v2 = [v1 availableCategoryIDs];
  uint64_t v3 = [v0 setWithArray:v2];
  uint64_t v4 = (void *)downtimeCategoryIdentifiers_downtimeCategoryIdentifiers;
  downtimeCategoryIdentifiers_downtimeCategoryIdentifiers = v3;

  int64_t v5 = (void *)downtimeCategoryIdentifiers_downtimeCategoryIdentifiers;
  id v6 = [(id)objc_opt_class() systemCategoryIdentifiers];
  [v5 minusSet:v6];
}

- (int64_t)policyForIdentifier:(id)a3 excludableIdentifiers:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = [(DMFEffectivePolicy *)self defaultPolicy];
  if (v6)
  {
    v9 = [(DMFEffectivePolicy *)self excludedIdentifiers];
    uint64_t v10 = [(DMFEffectivePolicy *)self type];
    int v11 = [v10 isEqualToString:@"websitecategories"];

    if (v11)
    {
      uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v9, "count"));
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __64__DMFEffectivePolicy_policyForIdentifier_excludableIdentifiers___block_invoke;
      v28[3] = &unk_1E63729C8;
      id v13 = v12;
      id v29 = v13;
      int64_t v30 = v8;
      v23 = v9;
      [v9 enumerateObjectsUsingBlock:v28];
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v14 = v7;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v31 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v25;
LABEL_5:
        uint64_t v18 = 0;
        while (1)
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = [(DMFEffectivePolicy *)self _valueForMatchingHostName:*(void *)(*((void *)&v24 + 1) + 8 * v18) inRegisteredHostNames:v13];
          if (v19) {
            break;
          }
          if (v16 == ++v18)
          {
            uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v31 count:16];
            if (v16) {
              goto LABEL_5;
            }
            goto LABEL_11;
          }
        }
      }
      else
      {
LABEL_11:

        id v14 = [(DMFEffectivePolicy *)self currentPoliciesByIdentifier];
        uint64_t v19 = [v14 objectForKeyedSubscript:v6];
      }
      uint64_t v20 = (void *)v19;

      v9 = v23;
      if (!v20) {
        goto LABEL_17;
      }
    }
    else
    {
      if ([v9 intersectsSet:v7]) {
        goto LABEL_17;
      }
      v21 = [(DMFEffectivePolicy *)self currentPoliciesByIdentifier];
      uint64_t v20 = [v21 objectForKeyedSubscript:v6];

      if (!v20) {
        goto LABEL_17;
      }
    }
    int64_t v8 = [v20 integerValue];

LABEL_17:
  }

  return v8;
}

void __64__DMFEffectivePolicy_policyForIdentifier_excludableIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = NSNumber;
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  id v6 = [v3 numberWithInteger:v4];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

- (int64_t)priorityForIdentifier:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(DMFEffectivePolicy *)self defaultPriority];
  if (v4)
  {
    id v6 = [(DMFEffectivePolicy *)self prioritiesByIdentifier];
    id v7 = [v6 objectForKeyedSubscript:v4];

    if (v7) {
      int64_t v5 = [v7 integerValue];
    }
  }
  return v5;
}

- (id)_valueForMatchingHostName:(id)a3 inRegisteredHostNames:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy_;
  uint64_t v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__DMFEffectivePolicy__valueForMatchingHostName_inRegisteredHostNames___block_invoke;
  v10[3] = &unk_1E63729F0;
  id v7 = v5;
  id v11 = v7;
  uint64_t v12 = &v13;
  [v6 enumerateKeysAndObjectsUsingBlock:v10];
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __70__DMFEffectivePolicy__valueForMatchingHostName_inRegisteredHostNames___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v11 = a2;
  id v7 = a3;
  if (![*(id *)(a1 + 32) caseInsensitiveCompare:v11])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
    goto LABEL_10;
  }
  if (![v11 hasPrefix:@"*."]) {
    goto LABEL_10;
  }
  id v8 = [v11 substringFromIndex:2];
  if ([*(id *)(a1 + 32) caseInsensitiveCompare:v8])
  {
    v9 = [v11 substringFromIndex:1];

    objc_msgSend(*(id *)(a1 + 32), "rangeOfString:options:range:", v9, 13, 0, objc_msgSend(*(id *)(a1 + 32), "length"));
    if (!v10) {
      goto LABEL_9;
    }
  }
  else
  {
    v9 = v8;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
LABEL_9:

LABEL_10:
}

- (NSString)type
{
  return self->_type;
}

- (BOOL)downtimeEnforced
{
  return self->_downtimeEnforced;
}

- (NSSet)excludedIdentifiers
{
  return self->_excludedIdentifiers;
}

- (NSDictionary)currentPoliciesByIdentifier
{
  return self->_currentPoliciesByIdentifier;
}

- (NSDictionary)prioritiesByIdentifier
{
  return self->_prioritiesByIdentifier;
}

- (int64_t)defaultPolicy
{
  return self->_defaultPolicy;
}

- (unint64_t)defaultPriority
{
  return self->_defaultPriority;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prioritiesByIdentifier, 0);
  objc_storeStrong((id *)&self->_currentPoliciesByIdentifier, 0);
  objc_storeStrong((id *)&self->_excludedIdentifiers, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

- (int64_t)policyForHostName:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(DMFEffectivePolicy *)self defaultPolicy];
  if (v4)
  {
    id v6 = [(DMFEffectivePolicy *)self currentPoliciesByIdentifier];
    id v7 = [(DMFEffectivePolicy *)self _valueForMatchingHostName:v4 inRegisteredHostNames:v6];
    id v8 = v7;
    if (v7) {
      int64_t v5 = [v7 integerValue];
    }
  }
  return v5;
}

- (unint64_t)priorityForHostName:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(DMFEffectivePolicy *)self defaultPriority];
  if (v4)
  {
    id v6 = [(DMFEffectivePolicy *)self prioritiesByIdentifier];
    id v7 = [(DMFEffectivePolicy *)self _valueForMatchingHostName:v4 inRegisteredHostNames:v6];
    id v8 = v7;
    if (v7) {
      unint64_t v5 = [v7 integerValue];
    }
  }
  return v5;
}

@end