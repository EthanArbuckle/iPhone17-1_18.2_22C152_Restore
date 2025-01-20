@interface HKMedicationUserDomainConcept
+ (BOOL)supportsSecureCoding;
+ (id)_truncateStringValueIfNeeded:(unint64_t)a3 limit:;
+ (id)_typeIdentifier;
- (BOOL)canRequestSyncUponInsertion;
- (HKMedicationUserDomainConcept)init;
- (HKMedicationUserDomainConcept)initWithCoder:(id)a3;
- (HKMedicationUserDomainConcept)initWithCodingCollection:(id)a3 linkCollection:(id)a4 propertyCollection:(id)a5;
- (HKMedicationUserDomainConcept)initWithCodingCollection:(id)a3 supplementalPropertyCollection:(id)a4;
- (HKMedicationUserDomainConcept)initWithConceptIdentifier:(id)a3 userSpecifiedName:(id)a4 userSpecifiedNotes:(id)a5;
- (HKMedicationUserDomainConcept)initWithOntologyCoding:(id)a3 userSpecifiedName:(id)a4 userSpecifiedNotes:(id)a5;
- (HKMedicationUserDomainConcept)initWithOntologyCoding:(id)a3 userSpecifiedName:(id)a4 userSpecifiedNotes:(id)a5 medicationVisualizationConfig:(id)a6 freeTextProperties:(id)a7;
- (HKMedicationUserDomainConceptSemanticIdentifier)_computedPropertyLock_generateSemanticIdentifier;
- (HKOntologyLocalizedEducationContent)localizedOntologyEducationContent;
- (HKQuantity)freeTextMedicationStrengthQuantity;
- (NSArray)freeTextMedicationIngredientNamedStrengthQuantities;
- (NSDictionary)localizedOntologyBasicDoseForms;
- (NSDictionary)localizedOntologyBrandNames;
- (NSDictionary)localizedOntologyComponentNames;
- (NSDictionary)localizedOntologyGenericNames;
- (NSDictionary)localizedOntologyLoggingUnitPlural;
- (NSDictionary)localizedOntologyLoggingUnitSingular;
- (NSDictionary)localizedOntologyManufacturedDoseForms;
- (NSDictionary)localizedOntologyPreferredNames;
- (NSDictionary)localizedOntologyPregnancyTrimesterLactationRatings;
- (NSNumber)freeTextMedicationFormCode;
- (NSNumber)freeTextMedicationLoggingUnitCode;
- (NSString)freeTextMedicationName;
- (NSString)unlocalizedQuantifiedUnitStrengthPreferredDisplayString;
- (NSString)userSpecifiedName;
- (NSString)userSpecifiedNotes;
- (NSString)userVisualizationConfigJSONString;
- (id)_computedPropertyLock_generateListOfLocalizedNamesWithPropertyType:(os_unfair_lock *)a1;
- (id)_computedPropertyLock_generateLocalizedNamesWithPropertyType:(const os_unfair_lock *)a1;
- (id)_dataDescriptionAllowedForPublic:(BOOL)a3;
- (id)_deepCopy;
- (id)_generateDisplayNameComponents;
- (id)_generateLoggingUnit;
- (id)copyMedicationByUpdatingUserSpecifiedName:(id)a3 userSpecifiedNotes:(id)a4 userVisualizationConfigJSONString:(id)a5;
- (id)semanticIdentifier;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKMedicationUserDomainConcept

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)HKMedicationUserDomainConcept;
  [(HKMedicationUserDomainConcept *)&v3 encodeWithCoder:a3];
}

- (HKMedicationUserDomainConcept)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HKMedicationUserDomainConcept;
  return [(HKMedicationUserDomainConcept *)&v4 initWithCoder:a3];
}

- (NSDictionary)localizedOntologyBasicDoseForms
{
  p_computedPropertyLock = &self->_computedPropertyLock;
  os_unfair_lock_lock(&self->_computedPropertyLock);
  if (!self->_localizedOntologyBasicDoseForms)
  {
    -[HKMedicationUserDomainConcept _computedPropertyLock_generateLocalizedNamesWithPropertyType:]((const os_unfair_lock *)self, 160016);
    objc_super v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    localizedOntologyBasicDoseForms = self->_localizedOntologyBasicDoseForms;
    self->_localizedOntologyBasicDoseForms = v4;
  }
  os_unfair_lock_unlock(p_computedPropertyLock);
  v6 = self->_localizedOntologyBasicDoseForms;

  return v6;
}

- (NSDictionary)localizedOntologyManufacturedDoseForms
{
  p_computedPropertyLock = &self->_computedPropertyLock;
  os_unfair_lock_lock(&self->_computedPropertyLock);
  if (!self->_localizedOntologyManufacturedDoseForms)
  {
    -[HKMedicationUserDomainConcept _computedPropertyLock_generateLocalizedNamesWithPropertyType:]((const os_unfair_lock *)self, 160010);
    objc_super v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    localizedOntologyManufacturedDoseForms = self->_localizedOntologyManufacturedDoseForms;
    self->_localizedOntologyManufacturedDoseForms = v4;
  }
  os_unfair_lock_unlock(p_computedPropertyLock);
  v6 = self->_localizedOntologyManufacturedDoseForms;

  return v6;
}

- (NSDictionary)localizedOntologyPreferredNames
{
  p_computedPropertyLock = &self->_computedPropertyLock;
  os_unfair_lock_lock(&self->_computedPropertyLock);
  if (!self->_localizedOntologyPreferredNames)
  {
    -[HKMedicationUserDomainConcept _computedPropertyLock_generateLocalizedNamesWithPropertyType:]((const os_unfair_lock *)self, 160012);
    objc_super v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    localizedOntologyPreferredNames = self->_localizedOntologyPreferredNames;
    self->_localizedOntologyPreferredNames = v4;
  }
  os_unfair_lock_unlock(p_computedPropertyLock);
  v6 = self->_localizedOntologyPreferredNames;

  return v6;
}

- (NSDictionary)localizedOntologyLoggingUnitSingular
{
  p_computedPropertyLock = &self->_computedPropertyLock;
  os_unfair_lock_lock(&self->_computedPropertyLock);
  if (!self->_localizedOntologyLoggingUnitSingular)
  {
    -[HKMedicationUserDomainConcept _computedPropertyLock_generateLocalizedNamesWithPropertyType:]((const os_unfair_lock *)self, 160017);
    objc_super v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    localizedOntologyLoggingUnitSingular = self->_localizedOntologyLoggingUnitSingular;
    self->_localizedOntologyLoggingUnitSingular = v4;
  }
  os_unfair_lock_unlock(p_computedPropertyLock);
  v6 = self->_localizedOntologyLoggingUnitSingular;

  return v6;
}

- (NSDictionary)localizedOntologyPregnancyTrimesterLactationRatings
{
  p_computedPropertyLock = &self->_computedPropertyLock;
  os_unfair_lock_lock(&self->_computedPropertyLock);
  if (!self->_localizedOntologyPregnancyTrimesterLactationRatings)
  {
    -[HKMedicationUserDomainConcept _computedPropertyLock_generateLocalizedNamesWithPropertyType:]((const os_unfair_lock *)self, 180000);
    objc_super v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    localizedOntologyPregnancyTrimesterLactationRatings = self->_localizedOntologyPregnancyTrimesterLactationRatings;
    self->_localizedOntologyPregnancyTrimesterLactationRatings = v4;
  }
  os_unfair_lock_unlock(p_computedPropertyLock);
  v6 = self->_localizedOntologyPregnancyTrimesterLactationRatings;

  return v6;
}

- (NSDictionary)localizedOntologyLoggingUnitPlural
{
  p_computedPropertyLock = &self->_computedPropertyLock;
  os_unfair_lock_lock(&self->_computedPropertyLock);
  if (!self->_localizedOntologyLoggingUnitPlural)
  {
    -[HKMedicationUserDomainConcept _computedPropertyLock_generateLocalizedNamesWithPropertyType:]((const os_unfair_lock *)self, 160018);
    objc_super v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    localizedOntologyLoggingUnitPlural = self->_localizedOntologyLoggingUnitPlural;
    self->_localizedOntologyLoggingUnitPlural = v4;
  }
  os_unfair_lock_unlock(p_computedPropertyLock);
  v6 = self->_localizedOntologyLoggingUnitPlural;

  return v6;
}

- (NSDictionary)localizedOntologyGenericNames
{
  p_computedPropertyLock = &self->_computedPropertyLock;
  os_unfair_lock_lock(&self->_computedPropertyLock);
  if (!self->_localizedOntologyGenericNames)
  {
    -[HKMedicationUserDomainConcept _computedPropertyLock_generateLocalizedNamesWithPropertyType:]((const os_unfair_lock *)self, 160009);
    objc_super v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    localizedOntologyGenericNames = self->_localizedOntologyGenericNames;
    self->_localizedOntologyGenericNames = v4;
  }
  os_unfair_lock_unlock(p_computedPropertyLock);
  v6 = self->_localizedOntologyGenericNames;

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedComponentNames, 0);
  objc_storeStrong((id *)&self->_localizedOntologyPregnancyTrimesterLactationRatings, 0);
  objc_storeStrong((id *)&self->_localizedOntologyLoggingUnitPlural, 0);
  objc_storeStrong((id *)&self->_localizedOntologyLoggingUnitSingular, 0);
  objc_storeStrong((id *)&self->_localizedOntologyBasicDoseForms, 0);
  objc_storeStrong((id *)&self->_localizedOntologyManufacturedDoseForms, 0);
  objc_storeStrong((id *)&self->_localizedOntologyGenericNames, 0);
  objc_storeStrong((id *)&self->_localizedOntologyBrandNames, 0);
  objc_storeStrong((id *)&self->_localizedOntologyPreferredNames, 0);

  objc_storeStrong((id *)&self->_semanticIdentifier, 0);
}

- (HKQuantity)freeTextMedicationStrengthQuantity
{
  v2 = [(HKMedicationUserDomainConcept *)self freeTextMedicationIngredientNamedStrengthQuantities];
  objc_super v3 = [v2 firstObject];
  objc_super v4 = [v3 quantity];

  return (HKQuantity *)v4;
}

- (NSArray)freeTextMedicationIngredientNamedStrengthQuantities
{
  v2 = [(HKMedicationUserDomainConcept *)self propertyCollection];
  objc_super v3 = [v2 propertiesWithType:160021];

  return (NSArray *)v3;
}

- (NSDictionary)localizedOntologyBrandNames
{
  p_computedPropertyLock = &self->_computedPropertyLock;
  os_unfair_lock_lock(&self->_computedPropertyLock);
  if (!self->_localizedOntologyBrandNames)
  {
    -[HKMedicationUserDomainConcept _computedPropertyLock_generateLocalizedNamesWithPropertyType:]((const os_unfair_lock *)self, 160007);
    objc_super v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    localizedOntologyBrandNames = self->_localizedOntologyBrandNames;
    self->_localizedOntologyBrandNames = v4;
  }
  os_unfair_lock_unlock(p_computedPropertyLock);
  v6 = self->_localizedOntologyBrandNames;

  return v6;
}

- (NSDictionary)localizedOntologyComponentNames
{
  p_computedPropertyLock = &self->_computedPropertyLock;
  os_unfair_lock_lock(&self->_computedPropertyLock);
  if (!self->_localizedComponentNames)
  {
    -[HKMedicationUserDomainConcept _computedPropertyLock_generateListOfLocalizedNamesWithPropertyType:]((os_unfair_lock *)self, 160022);
    objc_super v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    localizedComponentNames = self->_localizedComponentNames;
    self->_localizedComponentNames = v4;
  }
  os_unfair_lock_unlock(p_computedPropertyLock);
  v6 = self->_localizedComponentNames;

  return v6;
}

- (id)_computedPropertyLock_generateListOfLocalizedNamesWithPropertyType:(os_unfair_lock *)a1
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    os_unfair_lock_assert_owner(a1 + 28);
    objc_super v4 = [(os_unfair_lock *)a1 propertyCollection];
    v5 = [v4 allPropertiesWithType:a2];

    if (v5 && [v5 count])
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v7 = v5;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v19;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v19 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
            v13 = objc_msgSend(v12, "locale", (void)v18);
            v14 = [v12 stringValue];
            id v15 = [v6 objectForKeyedSubscript:v13];
            if (!v15)
            {
              id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              [v6 setObject:v15 forKeyedSubscript:v13];
            }
            [v15 addObject:v14];
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v9);
      }

      v16 = (void *)[v6 copy];
    }
    else
    {
      v16 = (void *)MEMORY[0x1E4F1CC08];
    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (NSString)userSpecifiedName
{
  v2 = [(HKMedicationUserDomainConcept *)self propertyCollection];
  objc_super v3 = [v2 firstBasicPropertyWithType:160000];
  objc_super v4 = [v3 stringValue];

  return (NSString *)v4;
}

- (NSNumber)freeTextMedicationFormCode
{
  v2 = [(HKMedicationUserDomainConcept *)self propertyCollection];
  objc_super v3 = [v2 firstBasicPropertyWithType:160014];
  objc_super v4 = [v3 numberValue];

  return (NSNumber *)v4;
}

- (NSString)unlocalizedQuantifiedUnitStrengthPreferredDisplayString
{
  v2 = [(HKMedicationUserDomainConcept *)self propertyCollection];
  objc_super v3 = [v2 firstBasicPropertyWithType:160013];
  objc_super v4 = [v3 stringValue];

  return (NSString *)v4;
}

- (NSString)userVisualizationConfigJSONString
{
  v2 = [(HKMedicationUserDomainConcept *)self propertyCollection];
  objc_super v3 = [v2 firstBasicPropertyWithType:160008];
  objc_super v4 = [v3 stringValue];

  return (NSString *)v4;
}

- (NSString)freeTextMedicationName
{
  v2 = [(HKMedicationUserDomainConcept *)self propertyCollection];
  objc_super v3 = [v2 firstBasicPropertyWithType:160020];
  objc_super v4 = [v3 stringValue];

  return (NSString *)v4;
}

- (id)semanticIdentifier
{
  p_computedPropertyLock = &self->_computedPropertyLock;
  os_unfair_lock_lock(&self->_computedPropertyLock);
  if (!self->_semanticIdentifier)
  {
    -[HKMedicationUserDomainConcept _computedPropertyLock_generateSemanticIdentifier]((const os_unfair_lock *)self);
    objc_super v4 = (HKMedicationUserDomainConceptSemanticIdentifier *)objc_claimAutoreleasedReturnValue();
    semanticIdentifier = self->_semanticIdentifier;
    self->_semanticIdentifier = v4;
  }
  os_unfair_lock_unlock(p_computedPropertyLock);
  id v6 = self->_semanticIdentifier;

  return v6;
}

- (id)_computedPropertyLock_generateLocalizedNamesWithPropertyType:(const os_unfair_lock *)a1
{
  id v2 = (id)a1;
  if (a1)
  {
    os_unfair_lock_assert_owner(a1 + 28);
    objc_super v4 = [v2 propertyCollection];
    v5 = [v4 allPropertiesWithType:a2];

    if (v5 && [v5 count])
    {
      objc_msgSend(v5, "hk_mapToDictionary:", &__block_literal_global_311);
      id v2 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v2 = (id)MEMORY[0x1E4F1CC08];
    }
  }

  return v2;
}

void __94__HKMedicationUserDomainConcept__computedPropertyLock_generateLocalizedNamesWithPropertyType___block_invoke(uint64_t a1, void *a2, void (**a3)(void, void, void))
{
  v5 = a3;
  id v6 = a2;
  id v8 = [v6 locale];
  id v7 = [v6 stringValue];

  ((void (**)(void, id, void *))a3)[2](v5, v8, v7);
}

- (HKMedicationUserDomainConceptSemanticIdentifier)_computedPropertyLock_generateSemanticIdentifier
{
  v1 = (HKMedicationUserDomainConceptSemanticIdentifier *)a1;
  if (a1)
  {
    os_unfair_lock_assert_owner(a1 + 28);
    id v2 = [(HKMedicationUserDomainConceptSemanticIdentifier *)v1 firstOntologyCoding];
    objc_super v3 = [HKMedicationUserDomainConceptSemanticIdentifier alloc];
    objc_super v4 = v3;
    if (v2)
    {
      v1 = [(HKMedicationUserDomainConceptSemanticIdentifier *)v3 initWithUUID:0 medicalCoding:v2];
    }
    else
    {
      v5 = [(HKMedicationUserDomainConceptSemanticIdentifier *)v1 UUID];
      v1 = [(HKMedicationUserDomainConceptSemanticIdentifier *)v4 initWithUUID:v5 medicalCoding:0];
    }
  }

  return v1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKMedicationUserDomainConcept)init
{
  objc_super v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKMedicationUserDomainConcept)initWithCodingCollection:(id)a3 linkCollection:(id)a4 propertyCollection:(id)a5
{
  id v6 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v7 = *MEMORY[0x1E4F1C3C8];
  id v8 = NSStringFromSelector(a2);
  [v6 raise:v7, @"The -%@ method is not available on %@", v8, objc_opt_class() format];

  return 0;
}

- (HKMedicationUserDomainConcept)initWithOntologyCoding:(id)a3 userSpecifiedName:(id)a4 userSpecifiedNotes:(id)a5 medicationVisualizationConfig:(id)a6 freeTextProperties:(id)a7
{
  id v12 = a3;
  v13 = (void *)MEMORY[0x1E4F2B668];
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  v17 = +[HKMedicationUserDomainConcept _truncateStringValueIfNeeded:limit:]((uint64_t)HKMedicationUserDomainConcept, a4, 0x64uLL);
  long long v18 = +[HKMedicationUserDomainConcept _truncateStringValueIfNeeded:limit:]((uint64_t)HKMedicationUserDomainConcept, v16, 0x3E8uLL);

  long long v19 = [v13 propertyCollectionWithUserSpecifiedName:v17 userSpecifiedNotes:v18 medicationVisualizationConfig:v15 freeTextProperties:v14];

  if (v12)
  {
    long long v20 = [MEMORY[0x1E4F2B178] collectionWithCoding:v12];
  }
  else
  {
    long long v20 = 0;
  }
  long long v21 = [(HKMedicationUserDomainConcept *)self initWithCodingCollection:v20 supplementalPropertyCollection:v19];

  return v21;
}

+ (id)_truncateStringValueIfNeeded:(unint64_t)a3 limit:
{
  id v4 = a2;
  self;
  if ([v4 length] <= a3)
  {
    id v5 = v4;
  }
  else
  {
    id v5 = [v4 substringToIndex:a3];
  }
  id v6 = v5;

  return v6;
}

- (HKMedicationUserDomainConcept)initWithOntologyCoding:(id)a3 userSpecifiedName:(id)a4 userSpecifiedNotes:(id)a5
{
  return [(HKMedicationUserDomainConcept *)self initWithOntologyCoding:a3 userSpecifiedName:a4 userSpecifiedNotes:a5 medicationVisualizationConfig:0 freeTextProperties:0];
}

- (HKMedicationUserDomainConcept)initWithConceptIdentifier:(id)a3 userSpecifiedName:(id)a4 userSpecifiedNotes:(id)a5
{
  id v8 = (void *)MEMORY[0x1E4F2B170];
  id v9 = a5;
  id v10 = a4;
  v11 = [v8 appleOntologyCodingWithIdentifier:a3];
  id v12 = [(HKMedicationUserDomainConcept *)self initWithOntologyCoding:v11 userSpecifiedName:v10 userSpecifiedNotes:v9];

  return v12;
}

- (HKMedicationUserDomainConcept)initWithCodingCollection:(id)a3 supplementalPropertyCollection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 codings];
  if ((objc_msgSend(v9, "hk_containsObjectPassingTest:", &__block_literal_global_4) & 1) == 0)
  {
    id v10 = [v8 properties];
    char v11 = objc_msgSend(v10, "hk_containsObjectPassingTest:", &__block_literal_global_288);

    if (v11) {
      goto LABEL_5;
    }
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"HKMedicationUserDomainConcept.m", 95, @"Invalid parameter not satisfying: %@", @"[codingCollection.codings hk_containsObjectPassingTest:^BOOL(HKMedicalCoding *coding) { return coding.codingSystem == [HKMedicalCodingSystem appleOntologySystem]; }] || [supplementalPropertyCollection.properties hk_containsObjectPassingTest:^BOOL(HKUserDomainConceptProperty *property) { return property.type == HKUserDomainConceptPropertyTypeFreeTextMedicationName; }]" object file lineNumber description];
  }

LABEL_5:
  v15.receiver = self;
  v15.super_class = (Class)HKMedicationUserDomainConcept;
  id v12 = [(HKMedicationUserDomainConcept *)&v15 initWithCodingCollection:v7 linkCollection:0 propertyCollection:v8];
  v13 = v12;
  if (v12) {
    v12->_computedPropertyLock._os_unfair_lock_opaque = 0;
  }

  return v13;
}

BOOL __89__HKMedicationUserDomainConcept_initWithCodingCollection_supplementalPropertyCollection___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 codingSystem];
  objc_super v3 = [MEMORY[0x1E4F2B180] appleOntologySystem];
  BOOL v4 = v2 == v3;

  return v4;
}

BOOL __89__HKMedicationUserDomainConcept_initWithCodingCollection_supplementalPropertyCollection___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 type] == 160020;
}

- (id)copyMedicationByUpdatingUserSpecifiedName:(id)a3 userSpecifiedNotes:(id)a4 userVisualizationConfigJSONString:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  char v11 = self;
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v13 = [(HKMedicationUserDomainConcept *)v11 userSpecifiedName];
  id v14 = v8;
  if ((id)v13 == v8) {
    goto LABEL_8;
  }
  objc_super v15 = (void *)v13;
  uint64_t v16 = [(HKMedicationUserDomainConcept *)v11 userSpecifiedName];
  if (v16)
  {
    v17 = (void *)v16;
    long long v18 = [(HKMedicationUserDomainConcept *)v11 userSpecifiedName];
    char v19 = [v8 isEqualToString:v18];

    if (v19) {
      goto LABEL_9;
    }
    if (v8) {
      goto LABEL_5;
    }
LABEL_7:
    id v14 = [MEMORY[0x1E4F2B638] nullPropertyWithType:160000 version:1];
    [v12 addObject:v14];
    goto LABEL_8;
  }

  if (!v8) {
    goto LABEL_7;
  }
LABEL_5:
  id v14 = +[HKMedicationUserDomainConcept _truncateStringValueIfNeeded:limit:]((uint64_t)HKMedicationUserDomainConcept, v8, 0x64uLL);
  long long v20 = (void *)[objc_alloc(MEMORY[0x1E4F2B638]) initWithType:160000 version:1 stringValue:v14];
  [v12 addObject:v20];

LABEL_8:
LABEL_9:
  uint64_t v21 = [(HKMedicationUserDomainConcept *)v11 userSpecifiedNotes];
  v22 = v9;
  if ((id)v21 != v9)
  {
    uint64_t v23 = (void *)v21;
    uint64_t v24 = [(HKMedicationUserDomainConcept *)v11 userSpecifiedNotes];
    if (v24)
    {
      v25 = (void *)v24;
      v26 = [(HKMedicationUserDomainConcept *)v11 userSpecifiedNotes];
      char v27 = [v9 isEqualToString:v26];

      if (v27) {
        goto LABEL_17;
      }
      if (v9) {
        goto LABEL_13;
      }
    }
    else
    {

      if (v9)
      {
LABEL_13:
        v22 = +[HKMedicationUserDomainConcept _truncateStringValueIfNeeded:limit:]((uint64_t)HKMedicationUserDomainConcept, v9, 0x3E8uLL);
        v28 = (void *)[objc_alloc(MEMORY[0x1E4F2B638]) initWithType:160001 version:1 stringValue:v22];
        [v12 addObject:v28];

        goto LABEL_16;
      }
    }
    v22 = [MEMORY[0x1E4F2B638] nullPropertyWithType:160001 version:1];
    [v12 addObject:v22];
  }
LABEL_16:

LABEL_17:
  uint64_t v29 = [(HKMedicationUserDomainConcept *)v11 userVisualizationConfigJSONString];
  v30 = v10;
  if ((id)v29 == v10)
  {
LABEL_26:

    goto LABEL_27;
  }
  v31 = (void *)v29;
  uint64_t v32 = [(HKMedicationUserDomainConcept *)v11 userVisualizationConfigJSONString];
  if (!v32)
  {

    goto LABEL_22;
  }
  v33 = (void *)v32;
  v34 = [(HKMedicationUserDomainConcept *)v11 userVisualizationConfigJSONString];
  char v35 = [v10 isEqualToString:v34];

  if ((v35 & 1) == 0)
  {
LABEL_22:
    if (v10)
    {
      uint64_t v36 = [objc_alloc(MEMORY[0x1E4F2B638]) initWithType:160008 version:1 stringValue:v10];
    }
    else
    {
      uint64_t v36 = [MEMORY[0x1E4F2B638] nullPropertyWithType:160008 version:1];
    }
    v30 = (void *)v36;
    [v12 addObject:v36];
    goto LABEL_26;
  }
LABEL_27:
  if ([v12 count])
  {
    v37 = (void *)[objc_alloc(MEMORY[0x1E4F2B668]) initWithProperties:v12];
    v38 = (HKMedicationUserDomainConcept *)[(HKMedicationUserDomainConcept *)v11 copyUserDomainConceptByMergingInPropertyCollection:v37];
  }
  else
  {
    v38 = v11;
  }

  return v38;
}

- (id)_generateDisplayNameComponents
{
  id v1 = a1;
  if (a1)
  {
    id v2 = [a1 freeTextMedicationName];
    if (!v2)
    {
      objc_super v3 = [v1 localizedOntologyPreferredNames];
      id v2 = [v3 objectForKeyedSubscript:@"en_US"];
    }
    BOOL v4 = @"No Name";
    if (v2) {
      BOOL v4 = v2;
    }
    id v5 = v4;

    id v6 = [v1 localizedOntologyBrandNames];
    id v7 = [v6 objectForKeyedSubscript:@"en_US"];

    if (!v7)
    {
      id v8 = [v1 localizedOntologyGenericNames];
      id v7 = [v8 objectForKeyedSubscript:@"en_US"];
    }
    if (v7) {
      id v9 = v7;
    }
    else {
      id v9 = v5;
    }
    id v10 = v9;

    char v11 = [v1 freeTextMedicationIngredientNamedStrengthQuantities];
    id v12 = [v11 firstObject];

    if (!v12) {
      goto LABEL_13;
    }
    id v13 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    [v13 setNumberStyle:1];
    [v13 setMaximumFractionDigits:2];
    [v13 setRoundingMode:6];
    id v14 = NSNumber;
    [v12 value];
    objc_super v15 = objc_msgSend(v14, "numberWithDouble:");
    uint64_t v16 = [v13 stringFromNumber:v15];

    v17 = NSString;
    long long v18 = [v12 unitString];
    char v19 = [v17 stringWithFormat:@"%@ %@", v16, v18];

    if (!v19)
    {
LABEL_13:
      char v19 = [v1 unlocalizedQuantifiedUnitStrengthPreferredDisplayString];
    }
    id v1 = (id)[objc_alloc(MEMORY[0x1E4F2B1E0]) initWithFullDisplayName:v5 medicationDisplayName:v10 displayStrength:v19];
  }

  return v1;
}

- (id)_generateLoggingUnit
{
  if (a1)
  {
    id v2 = [a1 freeTextMedicationLoggingUnitCode];
    if (v2)
    {
      objc_super v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F2B208]), "initWithLoggingUnitCode:", objc_msgSend(v2, "integerValue"));
    }
    else
    {
      BOOL v4 = [a1 localizedOntologyLoggingUnitSingular];
      id v5 = [v4 objectForKeyedSubscript:@"en_US"];

      id v6 = [a1 localizedOntologyLoggingUnitPlural];
      id v7 = [v6 objectForKeyedSubscript:@"en_US"];

      id v8 = [a1 localizedOntologyLoggingUnitSingular];
      id v9 = [v8 objectForKeyedSubscript:@"en-US"];

      id v10 = [a1 localizedOntologyLoggingUnitPlural];
      char v11 = [v10 objectForKeyedSubscript:@"en-US"];

      if (v5) {
        id v12 = v5;
      }
      else {
        id v12 = v9;
      }
      if (v7) {
        id v13 = v7;
      }
      else {
        id v13 = v11;
      }
      if (v12 && v13)
      {
        uint64_t v14 = objc_msgSend(MEMORY[0x1E4F2B208], "loggingUnitByResolvingSingularLoggingUnitString:fallbackPluralLoggingUnitString:");
      }
      else
      {
        uint64_t v14 = [objc_alloc(MEMORY[0x1E4F2B208]) initWithLoggingUnitCode:12];
      }
      objc_super v3 = (void *)v14;
    }
  }
  else
  {
    objc_super v3 = 0;
  }

  return v3;
}

- (BOOL)canRequestSyncUponInsertion
{
  return 1;
}

- (id)_deepCopy
{
  v4.receiver = self;
  v4.super_class = (Class)HKMedicationUserDomainConcept;
  id v2 = [(HKMedicationUserDomainConcept *)&v4 _deepCopy];

  return v2;
}

- (id)_dataDescriptionAllowedForPublic:(BOOL)a3
{
  if (a3)
  {
    objc_super v3 = 0;
  }
  else
  {
    id v5 = objc_alloc(MEMORY[0x1E4F28E78]);
    id v6 = [(HKMedicationUserDomainConcept *)self userSpecifiedName];
    id v7 = [(HKMedicationUserDomainConcept *)self userSpecifiedNotes];
    objc_super v3 = (void *)[v5 initWithFormat:@"userSpecifiedName: \"%@\", userSpecifiedNotes: %lu", v6, objc_msgSend(v7, "length")];
  }

  return v3;
}

+ (id)_typeIdentifier
{
  return (id)[MEMORY[0x1E4F2B690] medicationUserDomainConceptTypeIdentifier];
}

- (NSString)userSpecifiedNotes
{
  id v2 = [(HKMedicationUserDomainConcept *)self propertyCollection];
  objc_super v3 = [v2 firstBasicPropertyWithType:160001];
  objc_super v4 = [v3 stringValue];

  return (NSString *)v4;
}

- (NSNumber)freeTextMedicationLoggingUnitCode
{
  id v2 = [(HKMedicationUserDomainConcept *)self freeTextMedicationFormCode];
  objc_super v3 = v2;
  if (v2 && (unint64_t v4 = (int)[v2 intValue] - 1, v4 <= 0x10)) {
    id v5 = (NSNumber *)qword_1E62EB4E0[v4];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (HKOntologyLocalizedEducationContent)localizedOntologyEducationContent
{
  id v2 = [(HKMedicationUserDomainConcept *)self propertyCollection];
  objc_super v3 = [v2 firstPropertyWithType:160019];

  return (HKOntologyLocalizedEducationContent *)v3;
}

@end