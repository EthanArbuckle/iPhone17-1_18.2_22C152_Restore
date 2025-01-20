@interface HKMedicalUserDomainConcept
+ (BOOL)supportsSecureCoding;
+ (id)_typeIdentifier;
- (BOOL)canRequestSyncUponInsertion;
- (BOOL)chartsBloodPressure;
- (BOOL)hidesOutOfRangeFilter;
- (BOOL)isLowUtility;
- (BOOL)unitTesting_isIdentical:(id)a3;
- (HKMedicalUserDomainConcept)init;
- (HKMedicalUserDomainConcept)initWithCategoryTypes:(id)a3;
- (HKMedicalUserDomainConcept)initWithCategoryTypes:(id)a3 countryCode:(id)a4 codingCollection:(id)a5 propertyCollection:(id)a6;
- (HKMedicalUserDomainConcept)initWithCoder:(id)a3;
- (HKMedicalUserDomainConcept)initWithCodingCollection:(id)a3 linkCollection:(id)a4 propertyCollection:(id)a5;
- (HKOntologyLocalizedEducationContent)educationContent;
- (NSArray)categoryTypes;
- (NSDictionary)preferredNameByLocaleIdentifier;
- (NSString)countryCode;
- (NSString)ontologyPreferredName;
- (id)_dataDescriptionAllowedForPublic:(BOOL)a3;
- (id)_deepCopy;
- (id)_generateSemanticIdentifier;
- (id)medicalConceptByAddingCategoryType:(int64_t)a3;
- (id)medicalConceptByReplacingCategoryTypes:(id)a3;
- (id)medicalConceptByReplacingCategoryTypes:(id)a3 codingCollection:(id)a4 linkCollection:(id)a5;
- (id)semanticIdentifier;
- (void)_setCategoryTypes:(id)a3;
- (void)_setCountryCode:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKMedicalUserDomainConcept

- (HKMedicalUserDomainConcept)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKMedicalUserDomainConcept)initWithCodingCollection:(id)a3 linkCollection:(id)a4 propertyCollection:(id)a5
{
  v6 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v7 = *MEMORY[0x1E4F1C3C8];
  v8 = NSStringFromSelector(a2);
  [v6 raise:v7, @"The -%@ method is not available on %@", v8, objc_opt_class() format];

  return 0;
}

- (HKMedicalUserDomainConcept)initWithCategoryTypes:(id)a3 countryCode:(id)a4 codingCollection:(id)a5 propertyCollection:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HKMedicalUserDomainConcept;
  v12 = [(HKUserDomainConcept *)&v18 initWithCodingCollection:a5 linkCollection:0 propertyCollection:a6];
  if (v12)
  {
    uint64_t v13 = [v10 copy];
    categoryTypes = v12->_categoryTypes;
    v12->_categoryTypes = (NSArray *)v13;

    uint64_t v15 = [v11 copy];
    countryCode = v12->_countryCode;
    v12->_countryCode = (NSString *)v15;

    v12->_computedPropertyLock._os_unfair_lock_opaque = 0;
  }

  return v12;
}

- (HKMedicalUserDomainConcept)initWithCategoryTypes:(id)a3
{
  return [(HKMedicalUserDomainConcept *)self initWithCategoryTypes:a3 countryCode:0 codingCollection:0 propertyCollection:0];
}

- (id)medicalConceptByReplacingCategoryTypes:(id)a3 codingCollection:(id)a4 linkCollection:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(HKUserDomainConcept *)self modificationCopy];
  [v11 _setCategoryTypes:v10];

  [v11 _setCodingCollection:v9];
  [v11 _setLinkCollection:v8];

  return v11;
}

- (id)medicalConceptByReplacingCategoryTypes:(id)a3
{
  id v4 = a3;
  v5 = [(HKUserDomainConcept *)self modificationCopy];
  [v5 _setCategoryTypes:v4];

  return v5;
}

- (id)medicalConceptByAddingCategoryType:(int64_t)a3
{
  v5 = [(HKUserDomainConcept *)self modificationCopy];
  categoryTypes = self->_categoryTypes;
  uint64_t v7 = [NSNumber numberWithInteger:a3];
  id v8 = [(NSArray *)categoryTypes arrayByAddingObject:v7];
  [v5 _setCategoryTypes:v8];

  return v5;
}

- (id)_deepCopy
{
  v5.receiver = self;
  v5.super_class = (Class)HKMedicalUserDomainConcept;
  v3 = [(HKUserDomainConcept *)&v5 _deepCopy];
  [v3 _setCategoryTypes:self->_categoryTypes];
  [v3 _setCountryCode:self->_countryCode];

  return v3;
}

- (id)_dataDescriptionAllowedForPublic:(BOOL)a3
{
  if (a3)
  {
    v3 = 0;
  }
  else
  {
    id v5 = objc_alloc(MEMORY[0x1E4F28E78]);
    v6 = [(HKMedicalUserDomainConcept *)self ontologyPreferredName];
    v3 = (void *)[v5 initWithFormat:@"\"%@\"", v6];

    if (self->_countryCode) {
      [v3 appendFormat:@" %@", self->_countryCode];
    }
    if ([(NSArray *)self->_categoryTypes count])
    {
      objc_msgSend(v3, "appendString:", @" (");
      objc_msgSend(v3, "hk_appendComponentsJoinedByString:container:componentGenerator:", @", ", self->_categoryTypes, &__block_literal_global_47);
      [v3 appendString:@""]);
    }
    uint64_t v7 = [(HKMedicalUserDomainConcept *)self educationContent];
    if (v7)
    {
      objc_msgSend(v3, "appendString:", @", education (");
      id v8 = [v7 sections];
      objc_msgSend(v3, "hk_appendComponentsJoinedByString:container:componentGenerator:", @", ", v8, &__block_literal_global_41);

      [v3 appendString:@""]);
    }
  }

  return v3;
}

__CFString *__63__HKMedicalUserDomainConcept__dataDescriptionAllowedForPublic___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v2 = [a2 integerValue];

  return HKStringFromMedicalRecordCategoryType(v2);
}

__CFString *__63__HKMedicalUserDomainConcept__dataDescriptionAllowedForPublic___block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v2 = [a2 sectionType];

  return HKStringFromOntologyLocalizedEducationContentSectionType(v2);
}

+ (id)_typeIdentifier
{
  return +[HKUserDomainConceptTypeIdentifier medicalUserDomainConceptIdentifier];
}

- (id)semanticIdentifier
{
  p_computedPropertyLock = &self->_computedPropertyLock;
  os_unfair_lock_lock(&self->_computedPropertyLock);
  if (!self->_semanticIdentifier)
  {
    id v4 = [(HKMedicalUserDomainConcept *)self _generateSemanticIdentifier];
    semanticIdentifier = self->_semanticIdentifier;
    self->_semanticIdentifier = v4;
  }
  os_unfair_lock_unlock(p_computedPropertyLock);
  v6 = self->_semanticIdentifier;

  return v6;
}

- (BOOL)canRequestSyncUponInsertion
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKMedicalUserDomainConcept;
  id v4 = a3;
  [(HKUserDomainConcept *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_categoryTypes, @"categoryTypes", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_countryCode forKey:@"countryCode"];
}

- (HKMedicalUserDomainConcept)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"categoryTypes"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"countryCode"];
  v9.receiver = self;
  v9.super_class = (Class)HKMedicalUserDomainConcept;
  uint64_t v7 = [(HKUserDomainConcept *)&v9 initWithCoder:v4];

  if (v7)
  {
    objc_storeStrong((id *)&v7->_categoryTypes, v5);
    objc_storeStrong((id *)&v7->_countryCode, v6);
    v7->_computedPropertyLock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (NSString)ontologyPreferredName
{
  unint64_t v2 = [(HKMedicalUserDomainConcept *)self preferredNameByLocaleIdentifier];
  v3 = [v2 objectForKeyedSubscript:@"(null)"];

  return (NSString *)v3;
}

- (NSDictionary)preferredNameByLocaleIdentifier
{
  p_computedPropertyLock = &self->_computedPropertyLock;
  os_unfair_lock_lock(&self->_computedPropertyLock);
  if (!self->_preferredNameByLocaleIdentifier)
  {
    id v4 = [(HKUserDomainConcept *)self propertyCollection];
    objc_super v5 = [v4 allPropertiesWithType:160012];

    if (!v5 || ![v5 count])
    {
      preferredNameByLocaleIdentifier = self->_preferredNameByLocaleIdentifier;
      self->_preferredNameByLocaleIdentifier = (NSDictionary *)MEMORY[0x1E4F1CC08];
    }
    objc_msgSend(v5, "hk_mapToDictionary:", &__block_literal_global_53);
    uint64_t v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    id v8 = self->_preferredNameByLocaleIdentifier;
    self->_preferredNameByLocaleIdentifier = v7;
  }
  os_unfair_lock_unlock(p_computedPropertyLock);
  objc_super v9 = self->_preferredNameByLocaleIdentifier;

  return v9;
}

void __61__HKMedicalUserDomainConcept_preferredNameByLocaleIdentifier__block_invoke(uint64_t a1, void *a2, void (**a3)(void, void, void))
{
  objc_super v5 = a3;
  id v6 = a2;
  id v8 = [v6 locale];
  uint64_t v7 = [v6 stringValue];

  ((void (**)(void, id, void *))a3)[2](v5, v8, v7);
}

- (BOOL)chartsBloodPressure
{
  unint64_t v2 = [(HKUserDomainConcept *)self propertyCollection];
  v3 = [v2 firstBasicPropertyWithType:150004];
  id v4 = [v3 numberValue];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (BOOL)hidesOutOfRangeFilter
{
  unint64_t v2 = [(HKUserDomainConcept *)self propertyCollection];
  v3 = [v2 firstBasicPropertyWithType:150005];
  id v4 = [v3 numberValue];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (BOOL)isLowUtility
{
  unint64_t v2 = [(HKUserDomainConcept *)self propertyCollection];
  v3 = [v2 firstBasicPropertyWithType:150009];
  id v4 = [v3 numberValue];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (HKOntologyLocalizedEducationContent)educationContent
{
  unint64_t v2 = [(HKUserDomainConcept *)self propertyCollection];
  v3 = [v2 firstPropertyWithType:160019];

  return (HKOntologyLocalizedEducationContent *)v3;
}

- (void)_setCategoryTypes:(id)a3
{
  self->_categoryTypes = (NSArray *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)_setCountryCode:(id)a3
{
  self->_countryCode = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (id)_generateSemanticIdentifier
{
  v3 = [(HKUserDomainConcept *)self firstOntologyCoding];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
LABEL_4:
    id v6 = [HKMedicalUserDomainConceptSemanticIdentifier alloc];
    uint64_t v7 = [(NSString *)self->_countryCode uppercaseString];
    id v8 = [(HKMedicalUserDomainConceptSemanticIdentifier *)v6 initWithUUID:0 countryCode:v7 medicalCoding:v5];
    goto LABEL_5;
  }
  id v5 = [(HKUserDomainConcept *)self firstAdhocCoding];
  if (v5) {
    goto LABEL_4;
  }
  id v10 = [HKMedicalUserDomainConceptSemanticIdentifier alloc];
  uint64_t v7 = [(HKUserDomainConcept *)self UUID];
  id v11 = [(NSString *)self->_countryCode uppercaseString];
  id v8 = [(HKMedicalUserDomainConceptSemanticIdentifier *)v10 initWithUUID:v7 countryCode:v11 medicalCoding:0];

  id v5 = 0;
LABEL_5:

  return v8;
}

- (BOOL)unitTesting_isIdentical:(id)a3
{
  id v4 = a3;
  if ([(HKUserDomainConcept *)self isEqual:v4]
    && (v16.receiver = self,
        v16.super_class = (Class)HKMedicalUserDomainConcept,
        [(HKUserDomainConcept *)&v16 unitTesting_isIdentical:v4])
    && ((categoryTypes = self->_categoryTypes, id v6 = (NSArray *)v4[17], categoryTypes == v6)
     || v6 && -[NSArray isEqual:](categoryTypes, "isEqual:"))
    && ((countryCode = self->_countryCode, id v8 = (NSString *)v4[18], countryCode == v8)
     || v8 && -[NSString isEqual:](countryCode, "isEqual:")))
  {
    objc_super v9 = [(HKMedicalUserDomainConcept *)self educationContent];
    id v10 = [v4 educationContent];
    if (v9 == v10)
    {
      char v14 = 1;
    }
    else
    {
      id v11 = [v4 educationContent];
      if (v11)
      {
        v12 = [(HKMedicalUserDomainConcept *)self educationContent];
        uint64_t v13 = [v4 educationContent];
        char v14 = [v12 isEqual:v13];
      }
      else
      {
        char v14 = 0;
      }
    }
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (NSArray)categoryTypes
{
  return self->_categoryTypes;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_categoryTypes, 0);
  objc_storeStrong((id *)&self->_semanticIdentifier, 0);

  objc_storeStrong((id *)&self->_preferredNameByLocaleIdentifier, 0);
}

@end