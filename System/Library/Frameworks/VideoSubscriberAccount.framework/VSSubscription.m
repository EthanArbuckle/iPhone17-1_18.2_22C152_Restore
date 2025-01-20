@interface VSSubscription
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffectingSubscriptionInfo;
+ (id)keyPathsForValuesAffectingVersionHash;
- (BOOL)isEqual:(id)a3;
- (NSArray)tierIdentifiers;
- (NSData)versionHash;
- (NSDate)creationDate;
- (NSDate)expirationDate;
- (NSDate)modificationDate;
- (NSString)billingIdentifier;
- (NSString)derivedSubscriptionInfo;
- (NSString)modifierIdentifier;
- (NSString)modifierType;
- (NSString)providedSubscriptionInfo;
- (NSString)subscriberIdentifierHash;
- (NSString)subscriptionInfo;
- (VSSubscription)init;
- (VSSubscription)initWithCoder:(id)a3;
- (VSSubscriptionAccessLevel)accessLevel;
- (VSSubscriptionSource)source;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)_updateHash:(id)a3 withValueForProperty:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessLevel:(VSSubscriptionAccessLevel)accessLevel;
- (void)setBillingIdentifier:(NSString *)billingIdentifier;
- (void)setCreationDate:(id)a3;
- (void)setDerivedSubscriptionInfo:(id)a3;
- (void)setExpirationDate:(NSDate *)expirationDate;
- (void)setModificationDate:(id)a3;
- (void)setModifierIdentifier:(id)a3;
- (void)setModifierType:(id)a3;
- (void)setNilValueForKey:(id)a3;
- (void)setProvidedSubscriptionInfo:(id)a3;
- (void)setSource:(id)a3;
- (void)setSubscriberIdentifierHash:(id)a3;
- (void)setTierIdentifiers:(NSArray *)tierIdentifiers;
@end

@implementation VSSubscription

- (VSSubscription)init
{
  v5.receiver = self;
  v5.super_class = (Class)VSSubscription;
  v2 = [(VSSubscription *)&v5 init];
  if (v2)
  {
    v3 = VSSubscriptionValueType();
    VSValueTypeInit(v3, v2);
  }
  return v2;
}

- (VSSubscription)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VSSubscription;
  objc_super v5 = [(VSSubscription *)&v8 init];
  if (v5)
  {
    v6 = VSSubscriptionValueType();
    VSValueTypeInitWithCoder(v6, v5, v4);
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  VSSubscriptionValueType();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  VSValueTypeEncodeWithCoder(v5, self, v4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = VSSubscriptionValueType();
  v6 = VSValueTypeCopyWithZone(v5, self, (uint64_t)a3);

  return v6;
}

- (unint64_t)hash
{
  v3 = VSSubscriptionValueType();
  unint64_t v4 = VSValueTypeHash(v3, self);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = VSSubscriptionValueType();
  LOBYTE(self) = VSValueTypeIsEqual(v5, self, v4);

  return (char)self;
}

- (id)description
{
  v3 = VSSubscriptionValueType();
  id v4 = VSValueTypeDescription(v3, self);

  return v4;
}

- (void)setCreationDate:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E4F1C9C8], "vs_currentDate");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v7 = v4;
  id v5 = (NSDate *)[v4 copy];
  creationDate = self->_creationDate;
  self->_creationDate = v5;
}

- (void)setModificationDate:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E4F1C9C8], "vs_currentDate");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v7 = v4;
  id v5 = (NSDate *)[v4 copy];
  modificationDate = self->_modificationDate;
  self->_modificationDate = v5;
}

- (NSDate)expirationDate
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_expirationDate;
  if (!v3)
  {
    v3 = [MEMORY[0x1E4F1C9C8] distantFuture];
    objc_storeStrong((id *)&v2->_expirationDate, v3);
  }
  objc_sync_exit(v2);

  if (!v3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The __orNil parameter must not be nil."];
  }

  return v3;
}

+ (id)keyPathsForValuesAffectingSubscriptionInfo
{
  if (keyPathsForValuesAffectingSubscriptionInfo___vs_lazy_init_predicate != -1) {
    dispatch_once(&keyPathsForValuesAffectingSubscriptionInfo___vs_lazy_init_predicate, &__block_literal_global_15);
  }
  v2 = (void *)keyPathsForValuesAffectingSubscriptionInfo___vs_lazy_init_variable;

  return v2;
}

uint64_t __60__VSSubscription_keyPathsForValuesAffectingSubscriptionInfo__block_invoke()
{
  keyPathsForValuesAffectingSubscriptionInfo___vs_lazy_init_variable = __60__VSSubscription_keyPathsForValuesAffectingSubscriptionInfo__block_invoke_2();

  return MEMORY[0x1F41817F8]();
}

id __60__VSSubscription_keyPathsForValuesAffectingSubscriptionInfo__block_invoke_2()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  [v0 addObject:@"providedSubscriptionInfo"];
  [v0 addObject:@"derivedSubscriptionInfo"];
  v1 = (void *)[v0 copy];

  return v1;
}

- (NSString)subscriptionInfo
{
  v3 = [(VSSubscription *)self providedSubscriptionInfo];
  if (![v3 length])
  {
    uint64_t v4 = [(VSSubscription *)self derivedSubscriptionInfo];

    v3 = (void *)v4;
  }

  return (NSString *)v3;
}

- (NSString)providedSubscriptionInfo
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_providedSubscriptionInfo;
  if (!v3)
  {
    providedSubscriptionInfo = v2->_providedSubscriptionInfo;
    v3 = &stru_1F34B2EC8;
    v2->_providedSubscriptionInfo = (NSString *)&stru_1F34B2EC8;
  }
  objc_sync_exit(v2);

  return (NSString *)v3;
}

- (NSString)derivedSubscriptionInfo
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_derivedSubscriptionInfo;
  if (!v3)
  {
    derivedSubscriptionInfo = v2->_derivedSubscriptionInfo;
    v3 = &stru_1F34B2EC8;
    v2->_derivedSubscriptionInfo = (NSString *)&stru_1F34B2EC8;
  }
  objc_sync_exit(v2);

  return (NSString *)v3;
}

- (VSSubscriptionSource)source
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_source;
  if (!v3)
  {
    v3 = +[VSSubscriptionSource currentSource];
    objc_storeStrong((id *)&v2->_source, v3);
  }
  objc_sync_exit(v2);

  if (!v3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The __orNil parameter must not be nil."];
  }

  return v3;
}

- (NSString)billingIdentifier
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_billingIdentifier;
  if (!v3)
  {
    billingIdentifier = v2->_billingIdentifier;
    v3 = &stru_1F34B2EC8;
    v2->_billingIdentifier = (NSString *)&stru_1F34B2EC8;
  }
  objc_sync_exit(v2);

  return (NSString *)v3;
}

- (NSArray)tierIdentifiers
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_tierIdentifiers;
  if (!v3)
  {
    tierIdentifiers = v2->_tierIdentifiers;
    v3 = (NSArray *)MEMORY[0x1E4F1CBF0];
    v2->_tierIdentifiers = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  objc_sync_exit(v2);

  return v3;
}

- (NSString)subscriberIdentifierHash
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_subscriberIdentifierHash;
  if (!v3)
  {
    subscriberIdentifierHash = v2->_subscriberIdentifierHash;
    v3 = &stru_1F34B2EC8;
    v2->_subscriberIdentifierHash = (NSString *)&stru_1F34B2EC8;
  }
  objc_sync_exit(v2);

  return (NSString *)v3;
}

- (void)setNilValueForKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqual:@"accessLevel"])
  {
    [(VSSubscription *)self setValue:&unk_1F34D0CB8 forKey:v4];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)VSSubscription;
    [(VSSubscription *)&v5 setNilValueForKey:v4];
  }
}

- (void)_updateHash:(id)a3 withValueForProperty:(id)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [v7 name];
  v9 = [(VSSubscription *)self valueForKey:v8];

  uint64_t v10 = [v7 kind];
  switch(v10)
  {
    case 2:
      v11 = [v7 allowedClasses];
      if ([v11 count] != 1)
      {
        if ([v11 count] == 2
          && [v11 containsObject:objc_opt_class()]
          && [v11 containsObject:objc_opt_class()])
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (!v9) {
              [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The valueOrNil parameter must not be nil."];
            }
            v50 = v11;
            v51 = v9;
            id v18 = v9;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v19 = (void *)MEMORY[0x1E4F1CA00];
              uint64_t v20 = *MEMORY[0x1E4F1C3C8];
              v21 = (objc_class *)objc_opt_class();
              v22 = NSStringFromClass(v21);
              [v19 raise:v20, @"Unexpectedly, value was %@, instead of NSArray.", v22 format];
            }
            id v23 = v18;
            long long v52 = 0u;
            long long v53 = 0u;
            long long v54 = 0u;
            long long v55 = 0u;
            uint64_t v24 = [v23 countByEnumeratingWithState:&v52 objects:v56 count:16];
            if (v24)
            {
              uint64_t v25 = v24;
              uint64_t v26 = *(void *)v53;
              uint64_t v27 = *MEMORY[0x1E4F1C3C8];
              do
              {
                for (uint64_t i = 0; i != v25; ++i)
                {
                  if (*(void *)v53 != v26) {
                    objc_enumerationMutation(v23);
                  }
                  v29 = *(void **)(*((void *)&v52 + 1) + 8 * i);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      id v30 = v6;
                      v31 = (void *)MEMORY[0x1E4F1CA00];
                      v32 = (objc_class *)objc_opt_class();
                      v33 = NSStringFromClass(v32);
                      v34 = v31;
                      id v6 = v30;
                      [v34 raise:v27, @"Unexpectedly, containedObject was %@, instead of NSString.", v33 format];
                    }
                    id v35 = v29;
                    if ([v35 length]) {
                      [v6 updateWithString:v35];
                    }
                    else {
                      [MEMORY[0x1E4F1CA00] raise:v27 format:@"Array contained empty string."];
                    }
                  }
                  else
                  {
                    [MEMORY[0x1E4F1CA00] raise:v27, @"Array contained a non-string (%@) value: %@", objc_opt_class(), v29 format];
                  }
                }
                uint64_t v25 = [v23 countByEnumeratingWithState:&v52 objects:v56 count:16];
              }
              while (v25);
            }

            v9 = v51;
            v11 = v50;
          }
          else
          {
            [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Value was a %@ instead of an array.", objc_opt_class() format];
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"Unexpected number of allowed classes.", v49);
        }
        goto LABEL_55;
      }
      v12 = (void *)[v11 anyObject];
      if ([v12 isEqual:objc_opt_class()]
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        if (!v9) {
          [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The valueOrNil parameter must not be nil."];
        }
        id v13 = v9;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v14 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v15 = *MEMORY[0x1E4F1C3C8];
          v16 = (objc_class *)objc_opt_class();
          v17 = NSStringFromClass(v16);
          [v14 raise:v15, @"Unexpectedly, value was %@, instead of NSString.", v17 format];
        }
        [v6 updateWithString:v13];
      }
      else if ([v12 isEqual:objc_opt_class()] {
             && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      }
      {
        if (!v9)
        {
LABEL_55:

          break;
        }
        id v13 = v9;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v36 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v37 = *MEMORY[0x1E4F1C3C8];
          v38 = (objc_class *)objc_opt_class();
          v39 = NSStringFromClass(v38);
          [v36 raise:v37, @"Unexpectedly, value was %@, instead of NSDate.", v39 format];
        }
        [v6 updateWithDate:v13];
      }
      else
      {
        if (![v12 isEqual:objc_opt_class()]
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          v46 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v47 = *MEMORY[0x1E4F1C3C8];
          v48 = [v7 name];
          [v46 raise:v47, @"Unexpected value (%@) for property %@ of class: %@", v9, v48, v12 format];

          goto LABEL_55;
        }
        if (!v9) {
          [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The valueOrNil parameter must not be nil."];
        }
        id v40 = v9;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v41 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v42 = *MEMORY[0x1E4F1C3C8];
          v43 = (objc_class *)objc_opt_class();
          v44 = NSStringFromClass(v43);
          [v41 raise:v42, @"Unexpectedly, value was %@, instead of VSSubscriptionSource.", v44 format];
        }
        id v13 = v40;
        objc_msgSend(v6, "updateWithInteger:", objc_msgSend(v13, "kind"));
        v45 = [v13 identifier];

        [v6 updateWithString:v45];
      }

      goto LABEL_55;
    case 1:
      objc_msgSend(v6, "updateWithInteger:", objc_msgSend(v9, "integerValue"));
      break;
    case 0:
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Unexpected Boolean property kind."];
      break;
  }
}

+ (id)keyPathsForValuesAffectingVersionHash
{
  if (keyPathsForValuesAffectingVersionHash___vs_lazy_init_predicate != -1) {
    dispatch_once(&keyPathsForValuesAffectingVersionHash___vs_lazy_init_predicate, &__block_literal_global_62);
  }
  v2 = (void *)keyPathsForValuesAffectingVersionHash___vs_lazy_init_variable;

  return v2;
}

uint64_t __55__VSSubscription_keyPathsForValuesAffectingVersionHash__block_invoke()
{
  keyPathsForValuesAffectingVersionHash___vs_lazy_init_variable = __55__VSSubscription_keyPathsForValuesAffectingVersionHash__block_invoke_2();

  return MEMORY[0x1F41817F8]();
}

id __55__VSSubscription_keyPathsForValuesAffectingVersionHash__block_invoke_2()
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v1 = VSSubscriptionValueType();
  v2 = objc_msgSend(v1, "properties", 0);

  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = [*(id *)(*((void *)&v10 + 1) + 8 * i) name];
        [v0 addObject:v7];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }

  objc_super v8 = (void *)[v0 copy];

  return v8;
}

- (NSData)versionHash
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_alloc_init(VSHash);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = VSSubscriptionValueType();
  uint64_t v5 = objc_msgSend(v4, "properties", 0);

  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        [(VSSubscription *)self _updateHash:v3 withValueForProperty:*(void *)(*((void *)&v12 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  long long v10 = [(VSHash *)v3 finalData];

  return (NSData *)v10;
}

- (void)setExpirationDate:(NSDate *)expirationDate
{
}

- (VSSubscriptionAccessLevel)accessLevel
{
  return self->_accessLevel;
}

- (void)setAccessLevel:(VSSubscriptionAccessLevel)accessLevel
{
  self->_accessLevel = accessLevel;
}

- (void)setTierIdentifiers:(NSArray *)tierIdentifiers
{
}

- (void)setBillingIdentifier:(NSString *)billingIdentifier
{
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (void)setDerivedSubscriptionInfo:(id)a3
{
}

- (void)setProvidedSubscriptionInfo:(id)a3
{
}

- (void)setSource:(id)a3
{
}

- (void)setSubscriberIdentifierHash:(id)a3
{
}

- (NSString)modifierIdentifier
{
  return self->_modifierIdentifier;
}

- (void)setModifierIdentifier:(id)a3
{
}

- (NSString)modifierType
{
  return self->_modifierType;
}

- (void)setModifierType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modifierType, 0);
  objc_storeStrong((id *)&self->_modifierIdentifier, 0);
  objc_storeStrong((id *)&self->_subscriberIdentifierHash, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_providedSubscriptionInfo, 0);
  objc_storeStrong((id *)&self->_derivedSubscriptionInfo, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_billingIdentifier, 0);
  objc_storeStrong((id *)&self->_tierIdentifiers, 0);

  objc_storeStrong((id *)&self->_expirationDate, 0);
}

@end