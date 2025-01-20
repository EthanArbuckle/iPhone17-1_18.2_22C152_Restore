@interface VSPersistentSubscription
+ (id)keyPathsForValuesAffectingDerivedSubscriptionInfo;
- (BOOL)_validateNullableValue:(id *)a3 forKey:(id)a4 error:(id *)a5;
- (BOOL)validateAccessLevel:(id *)a3 error:(id *)a4;
- (BOOL)validateBillingIdentifier:(id *)a3 error:(id *)a4;
- (BOOL)validateCreationDate:(id *)a3 error:(id *)a4;
- (BOOL)validateExpirationDate:(id *)a3 error:(id *)a4;
- (BOOL)validateModificationDate:(id *)a3 error:(id *)a4;
- (BOOL)validateSubscriberIdentifierHash:(id *)a3 error:(id *)a4;
- (BOOL)validateTierIdentifiers:(id *)a3 error:(id *)a4;
- (void)_deriveValuesFromProvidedInfo:(id)a3;
- (void)_setNullResettableValue:(id)a3 forKey:(id)a4;
- (void)_updateDerivedSubscriptionInfo;
- (void)awakeFromFetch;
- (void)awakeFromInsert;
- (void)didChangeValueForKey:(id)a3;
- (void)setAccessLevel:(id)a3;
- (void)setBillingIdentifier:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setMostRecentSaveDate:(id)a3;
- (void)setProvidedSubscriptionInfo:(id)a3;
- (void)setSubscriberIdentifierHash:(id)a3;
- (void)setTierIdentifiers:(id)a3;
@end

@implementation VSPersistentSubscription

- (void)_setNullResettableValue:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    id v9 = 0;
    [(VSPersistentSubscription *)self validateValue:&v9 forKey:v7 error:0];
    id v6 = v9;
  }
  [(VSPersistentSubscription *)self willChangeValueForKey:v7];
  v8 = (void *)[v6 copy];
  [(VSPersistentSubscription *)self setPrimitiveValue:v8 forKey:v7];

  [(VSPersistentSubscription *)self didChangeValueForKey:v7];
}

- (BOOL)_validateNullableValue:(id *)a3 forKey:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if (!*a3)
  {
    v10 = [(VSPersistentSubscription *)self entity];
    v11 = [v10 attributesByName];
    v12 = [v11 objectForKey:v8];

    if ([v12 isOptional])
    {
      BOOL v9 = 1;
    }
    else
    {
      v13 = [v12 defaultValue];
      if (v13)
      {
        id v14 = v13;
        *a3 = v14;
        BOOL v9 = 1;
      }
      else
      {
        if (!a5)
        {
          BOOL v9 = 0;
          goto LABEL_10;
        }
        id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        [v14 setObject:self forKey:*MEMORY[0x1E4F1BFB8]];
        [v14 setObject:v8 forKey:*MEMORY[0x1E4F1BFB0]];
        [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:1570 userInfo:v14];
        BOOL v9 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
LABEL_10:

    goto LABEL_11;
  }
  BOOL v9 = 1;
LABEL_11:

  return v9;
}

+ (id)keyPathsForValuesAffectingDerivedSubscriptionInfo
{
  if (keyPathsForValuesAffectingDerivedSubscriptionInfo___vs_lazy_init_predicate != -1) {
    dispatch_once(&keyPathsForValuesAffectingDerivedSubscriptionInfo___vs_lazy_init_predicate, &__block_literal_global_4);
  }
  v2 = (void *)keyPathsForValuesAffectingDerivedSubscriptionInfo___vs_lazy_init_variable;

  return v2;
}

uint64_t __77__VSPersistentSubscription_keyPathsForValuesAffectingDerivedSubscriptionInfo__block_invoke()
{
  keyPathsForValuesAffectingDerivedSubscriptionInfo___vs_lazy_init_variable = __77__VSPersistentSubscription_keyPathsForValuesAffectingDerivedSubscriptionInfo__block_invoke_2();

  return MEMORY[0x1F41817F8]();
}

id __77__VSPersistentSubscription_keyPathsForValuesAffectingDerivedSubscriptionInfo__block_invoke_2()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  [v0 addObject:@"accessLevel"];
  [v0 addObject:@"tierIdentifiers"];
  [v0 addObject:@"subscriberIdentifierHash"];
  [v0 addObject:@"billingIdentifier"];
  [v0 addObject:@"providedSubscriptionInfo"];
  v1 = (void *)[v0 copy];

  return v1;
}

- (void)_updateDerivedSubscriptionInfo
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DA674000, a2, OS_LOG_TYPE_ERROR, "Unable to serialize to JSON: %@", (uint8_t *)&v2, 0xCu);
}

void __58__VSPersistentSubscription__updateDerivedSubscriptionInfo__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  id v6 = (void *)MEMORY[0x1E0173AA0]();
  id v7 = objc_msgSend(v5, "vs_JSONKey");
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
    v10 = [*(id *)(a1 + 32) valueForKey:v14];
    v11 = objc_msgSend(v5, "vs_JSONValueTransformer");
    v12 = v11;
    if (v11)
    {
      uint64_t v13 = [v11 transformedValue:v10];

      v10 = (void *)v13;
    }
    if (v10) {
      [*(id *)(a1 + 40) setObject:v10 forKey:v9];
    }
  }
}

- (void)_deriveValuesFromProvidedInfo:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E0173AA0]();
  if ([v4 length])
  {
    id v6 = [v4 dataUsingEncoding:4];
    if (v6)
    {
      id v38 = 0;
      id v7 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v6 options:0 error:&v38];
      id v8 = v38;
      if (v7)
      {
        id v9 = v7;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v10 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v11 = *MEMORY[0x1E4F1C3C8];
            v12 = (objc_class *)objc_opt_class();
            uint64_t v13 = NSStringFromClass(v12);
            [v10 raise:v11, @"Unexpectedly, topLevelJSONValue was %@, instead of NSDictionary.", v13 format];
          }
          id v14 = v9;
          id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          v33 = [(VSPersistentSubscription *)self entity];
          v16 = [v33 attributesByName];
          v35[0] = MEMORY[0x1E4F143A8];
          v35[1] = 3221225472;
          v35[2] = __58__VSPersistentSubscription__deriveValuesFromProvidedInfo___block_invoke;
          v35[3] = &unk_1E6BD2D28;
          v17 = v14;
          v36 = v17;
          id v18 = v15;
          id v37 = v18;
          [v16 enumerateKeysAndObjectsUsingBlock:v35];

          if ([v18 count])
          {
            v34[0] = MEMORY[0x1E4F143A8];
            v34[1] = 3221225472;
            v34[2] = __58__VSPersistentSubscription__deriveValuesFromProvidedInfo___block_invoke_51;
            v34[3] = &unk_1E6BD2D50;
            v34[4] = self;
            [v18 enumerateKeysAndObjectsUsingBlock:v34];
          }
        }
        else
        {
          v17 = VSErrorLogObject();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
            -[VSPersistentSubscription _deriveValuesFromProvidedInfo:](v17, v26, v27, v28, v29, v30, v31, v32);
          }
        }
      }
      else
      {
        id v9 = VSErrorLogObject();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          -[VSPersistentSubscription _deriveValuesFromProvidedInfo:]((uint64_t)v8, v9);
        }
      }
    }
    else
    {
      id v8 = VSErrorLogObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[VSPersistentSubscription _deriveValuesFromProvidedInfo:](v8, v19, v20, v21, v22, v23, v24, v25);
      }
    }
  }
}

void __58__VSPersistentSubscription__deriveValuesFromProvidedInfo___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = (void *)MEMORY[0x1E0173AA0]();
  v10 = objc_msgSend(v8, "vs_JSONKey");
  uint64_t v11 = v10;
  if (v10)
  {
    v50 = a4;
    id v12 = v10;
    uint64_t v13 = VSDefaultLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v56 = v12;
      _os_log_impl(&dword_1DA674000, v13, OS_LOG_TYPE_DEFAULT, "Examining %@ JSON key.", buf, 0xCu);
    }

    id v14 = [*(id *)(a1 + 32) valueForKey:v12];
    id v15 = objc_msgSend(v8, "vs_expectedJSONValueClasses");
    uint64_t v16 = [v15 count];
    if (!v16)
    {
      uint64_t v32 = VSErrorLogObject();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        __58__VSPersistentSubscription__deriveValuesFromProvidedInfo___block_invoke_cold_1(v32, v33, v34, v35, v36, v37, v38, v39);
      }

      goto LABEL_39;
    }
    uint64_t v17 = v16;
    aClass = (objc_class *)[v15 objectAtIndex:0];
    char isKindOfClass = objc_opt_isKindOfClass();
    char v19 = isKindOfClass;
    if (v17 == 2
      && (isKindOfClass & 1) != 0
      && [(objc_class *)aClass isEqual:objc_opt_class()])
    {
      id v46 = v12;
      v47 = v9;
      id v48 = v7;
      v45 = v15;
      uint64_t v20 = (void *)[v15 objectAtIndex:1];
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id v21 = v14;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v51 objects:v61 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v52;
        while (2)
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v52 != v24) {
              objc_enumerationMutation(v21);
            }
            uint64_t v26 = *(void **)(*((void *)&v51 + 1) + 8 * i);
            if ((objc_opt_isKindOfClass() & 1) == 0
              || [v20 isEqual:objc_opt_class()] && !objc_msgSend(v26, "length"))
            {

              id v9 = v47;
              id v7 = v48;
              id v12 = v46;
              id v15 = v45;
              goto LABEL_32;
            }
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v51 objects:v61 count:16];
          if (v23) {
            continue;
          }
          break;
        }
      }

      id v9 = v47;
      id v7 = v48;
      id v12 = v46;
      id v15 = v45;
    }
    else if ((v19 & 1) == 0)
    {
LABEL_32:
      if (objc_msgSend(v8, "vs_isRequiredJSONValue"))
      {
        v40 = VSErrorLogObject();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          v44 = NSStringFromClass(aClass);
          *(_DWORD *)buf = 138412802;
          id v56 = v14;
          __int16 v57 = 2112;
          id v58 = v8;
          __int16 v59 = 2112;
          v60 = v44;
          _os_log_error_impl(&dword_1DA674000, v40, OS_LOG_TYPE_ERROR, "Value %@ for required attribute %@ was not expected class %@.", buf, 0x20u);
        }
        [*(id *)(a1 + 40) removeAllObjects];
        unsigned char *v50 = 1;
      }
      else
      {
        v41 = VSDefaultLogObject();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v56 = v7;
          _os_log_impl(&dword_1DA674000, v41, OS_LOG_TYPE_DEFAULT, "Overwriting omitted value for %@ key.", buf, 0xCu);
        }

        v42 = *(void **)(a1 + 40);
        v43 = [MEMORY[0x1E4F1CA98] null];
        [v42 setObject:v43 forKey:v7];
      }
      goto LABEL_39;
    }
    uint64_t v27 = v15;
    uint64_t v28 = objc_msgSend(v8, "vs_JSONValueTransformer");
    uint64_t v29 = v28;
    if (v28)
    {
      uint64_t v30 = [v28 reverseTransformedValue:v14];

      id v14 = (id)v30;
    }
    if (!v14)
    {
      id v14 = [MEMORY[0x1E4F1CA98] null];
      if (!v14) {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The valueOrNil parameter must not be nil."];
      }
    }
    id v14 = v14;
    uint64_t v31 = VSDefaultLogObject();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v56 = v14;
      __int16 v57 = 2112;
      id v58 = v7;
      _os_log_impl(&dword_1DA674000, v31, OS_LOG_TYPE_DEFAULT, "Got value %@ for %@ key.", buf, 0x16u);
    }

    [*(id *)(a1 + 40) setObject:v14 forKey:v7];
    id v15 = v27;
LABEL_39:
  }
}

void __58__VSPersistentSubscription__deriveValuesFromProvidedInfo___block_invoke_51(uint64_t a1, void *a2, void *a3)
{
  id v10 = a3;
  id v5 = (void *)MEMORY[0x1E4F1CA98];
  id v6 = a2;
  id v7 = [v5 null];
  int v8 = [v10 isEqual:v7];

  if (v8) {
    id v9 = 0;
  }
  else {
    id v9 = v10;
  }
  [*(id *)(a1 + 32) _setNullResettableValue:v9 forKey:v6];
}

- (void)setProvidedSubscriptionInfo:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(VSPersistentSubscription *)self willChangeValueForKey:@"providedSubscriptionInfo"];
  id v5 = (void *)[v4 copy];

  [(VSPersistentSubscription *)self _deriveValuesFromProvidedInfo:v5];
  id v6 = VSDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    int v8 = v5;
    _os_log_impl(&dword_1DA674000, v6, OS_LOG_TYPE_DEFAULT, "Will set primitive value: %@", (uint8_t *)&v7, 0xCu);
  }

  [(VSPersistentSubscription *)self setPrimitiveValue:v5 forKey:@"providedSubscriptionInfo"];
  [(VSPersistentSubscription *)self didChangeValueForKey:@"providedSubscriptionInfo"];
}

- (void)setAccessLevel:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(VSPersistentSubscription *)self providedSubscriptionInfo];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    int v7 = VSDefaultLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v4;
      _os_log_impl(&dword_1DA674000, v7, OS_LOG_TYPE_DEFAULT, "Ignoring access level %@ because of subscription info.", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    [(VSPersistentSubscription *)self _setNullResettableValue:v4 forKey:@"accessLevel"];
  }
}

- (void)setCreationDate:(id)a3
{
}

- (void)setExpirationDate:(id)a3
{
}

- (void)setMostRecentSaveDate:(id)a3
{
}

- (void)setSubscriberIdentifierHash:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(VSPersistentSubscription *)self providedSubscriptionInfo];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    int v7 = VSDefaultLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v4;
      _os_log_impl(&dword_1DA674000, v7, OS_LOG_TYPE_DEFAULT, "Ignoring subscriber identifier hash %@ because of subscription info.", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    [(VSPersistentSubscription *)self _setNullResettableValue:v4 forKey:@"subscriberIdentifierHash"];
  }
}

- (void)setBillingIdentifier:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(VSPersistentSubscription *)self providedSubscriptionInfo];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    int v7 = VSDefaultLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v4;
      _os_log_impl(&dword_1DA674000, v7, OS_LOG_TYPE_DEFAULT, "Ignoring billing identifier %@ because of subscription info.", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    [(VSPersistentSubscription *)self _setNullResettableValue:v4 forKey:@"billingIdentifier"];
  }
}

- (void)setTierIdentifiers:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(VSPersistentSubscription *)self providedSubscriptionInfo];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    int v7 = VSDefaultLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v4;
      _os_log_impl(&dword_1DA674000, v7, OS_LOG_TYPE_DEFAULT, "Ignoring tier identifiers %@ because of subscription info.", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    [(VSPersistentSubscription *)self _setNullResettableValue:v4 forKey:@"tierIdentifiers"];
  }
}

- (void)awakeFromInsert
{
  v5.receiver = self;
  v5.super_class = (Class)VSPersistentSubscription;
  [(VSPersistentSubscription *)&v5 awakeFromInsert];
  uint64_t v3 = VSDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1DA674000, v3, OS_LOG_TYPE_DEFAULT, "Awake from insert.", v4, 2u);
  }

  [(VSPersistentSubscription *)self setAccessLevel:0];
  [(VSPersistentSubscription *)self setCreationDate:0];
  [(VSPersistentSubscription *)self setExpirationDate:0];
  [(VSPersistentSubscription *)self setTierIdentifiers:0];
  [(VSPersistentSubscription *)self setSubscriberIdentifierHash:0];
  [(VSPersistentSubscription *)self setBillingIdentifier:0];
}

- (void)awakeFromFetch
{
  v6.receiver = self;
  v6.super_class = (Class)VSPersistentSubscription;
  [(VSPersistentSubscription *)&v6 awakeFromFetch];
  uint64_t v3 = VSDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v5 = 0;
    _os_log_impl(&dword_1DA674000, v3, OS_LOG_TYPE_DEFAULT, "Awake from fetch.", v5, 2u);
  }

  [(VSPersistentSubscription *)self _updateDerivedSubscriptionInfo];
  id v4 = [(VSPersistentSubscription *)self providedSubscriptionInfo];
  [(VSPersistentSubscription *)self _deriveValuesFromProvidedInfo:v4];
}

- (void)didChangeValueForKey:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VSPersistentSubscription;
  [(VSPersistentSubscription *)&v9 didChangeValueForKey:v4];
  objc_super v5 = [(id)objc_opt_class() keyPathsForValuesAffectingDerivedSubscriptionInfo];
  int v6 = [v5 containsObject:v4];

  if (v6)
  {
    int v7 = VSDefaultLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = [(VSPersistentSubscription *)self valueForKey:v4];
      *(_DWORD *)buf = 138412546;
      id v11 = v4;
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      _os_log_impl(&dword_1DA674000, v7, OS_LOG_TYPE_DEFAULT, "Did change value for %@ key to %@, triggering derivation.", buf, 0x16u);
    }
    [(VSPersistentSubscription *)self _updateDerivedSubscriptionInfo];
  }
}

- (BOOL)validateAccessLevel:(id *)a3 error:(id *)a4
{
  return [(VSPersistentSubscription *)self _validateNullableValue:a3 forKey:@"accessLevel" error:a4];
}

- (BOOL)validateCreationDate:(id *)a3 error:(id *)a4
{
  if (!*a3)
  {
    objc_super v5 = (void *)MEMORY[0x1E4F1C9C8];
    id v6 = 0;
    objc_msgSend(v5, "vs_currentDate");
    id v7 = (id)objc_claimAutoreleasedReturnValue();

    *a3 = v7;
  }
  return 1;
}

- (BOOL)validateModificationDate:(id *)a3 error:(id *)a4
{
  if (!*a3)
  {
    objc_super v5 = (void *)MEMORY[0x1E4F1C9C8];
    id v6 = 0;
    objc_msgSend(v5, "vs_currentDate");
    id v7 = (id)objc_claimAutoreleasedReturnValue();

    *a3 = v7;
  }
  return 1;
}

- (BOOL)validateExpirationDate:(id *)a3 error:(id *)a4
{
  return [(VSPersistentSubscription *)self _validateNullableValue:a3 forKey:@"expirationDate" error:a4];
}

- (BOOL)validateSubscriberIdentifierHash:(id *)a3 error:(id *)a4
{
  return [(VSPersistentSubscription *)self _validateNullableValue:a3 forKey:@"subscriberIdentifierHash" error:a4];
}

- (BOOL)validateTierIdentifiers:(id *)a3 error:(id *)a4
{
  id v7 = *a3;
  if (v7)
  {
    int v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v7];
    objc_super v9 = [v8 allObjects];

    *a3 = [v9 sortedArrayUsingSelector:sel_compare_];

    BOOL v10 = 1;
  }
  else
  {
    BOOL v10 = [(VSPersistentSubscription *)self _validateNullableValue:a3 forKey:@"tierIdentifiers" error:a4];
  }

  return v10;
}

- (BOOL)validateBillingIdentifier:(id *)a3 error:(id *)a4
{
  return [(VSPersistentSubscription *)self _validateNullableValue:a3 forKey:@"billingIdentifier" error:a4];
}

- (void)_deriveValuesFromProvidedInfo:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_deriveValuesFromProvidedInfo:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DA674000, a2, OS_LOG_TYPE_ERROR, "Error deserializing subscription info: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_deriveValuesFromProvidedInfo:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __58__VSPersistentSubscription__deriveValuesFromProvidedInfo___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end