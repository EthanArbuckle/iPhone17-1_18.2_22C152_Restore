@interface HKConcept
+ (BOOL)supportsSecureCoding;
+ (HKConcept)conceptWithIdentifier:(id)a3 attributes:(id)a4 relationships:(id)a5;
+ (id)fallbackLanguagesForLocale:(id)a3;
+ (id)preferredLanguages;
- (BOOL)chartsBloodPressure;
- (BOOL)hidesOutOfRangeFilter;
- (BOOL)isAdHoc;
- (BOOL)isDeleted;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExcludedFromSearch;
- (BOOL)isGeneric;
- (BOOL)isInMemory;
- (BOOL)isLowUtility;
- (BOOL)isNebulous;
- (BOOL)isUndefined;
- (BOOL)relationshipsAreLoaded;
- (HKConcept)chartedWithConcept;
- (HKConcept)groupByConcept;
- (HKConcept)init;
- (HKConcept)initWithCoder:(id)a3;
- (HKConcept)initWithIdentifier:(id)a3 attributes:(id)a4 relationships:(id)a5 version:(int64_t)a6 deleted:(BOOL)a7 options:(unint64_t)a8;
- (HKConceptIdentifier)identifier;
- (HKMedicalCoding)LOINCCoding;
- (HKMedicalCoding)RxNormCoding;
- (HKMedicalCoding)coding;
- (NSArray)attributes;
- (NSArray)relationships;
- (NSArray)synonyms;
- (NSSet)validInRegions;
- (NSString)adHocCode;
- (NSString)localizedPreferredName;
- (NSString)preferredName;
- (id)_sortedRelationships;
- (id)allConceptsOfRelationshipType:(int64_t)a3;
- (id)attributesForType:(int64_t)a3;
- (id)copyWithRelationships:(id)a3;
- (id)description;
- (id)firstAttributeForType:(int64_t)a3;
- (id)firstConceptOfRelationshipType:(int64_t)a3;
- (id)stringsForAttributeType:(int64_t)a3;
- (id)treeDescription;
- (int64_t)version;
- (unint64_t)hash;
- (unint64_t)options;
- (void)_appendSortedAttributeTypeCountDescriptionToString:(id)a3;
- (void)_appendTreeDescriptionToString:(id)a3 visitedStack:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateAttributesWithType:(int64_t)a3 block:(id)a4;
- (void)mutateBySettingRelationships:(id)a3;
@end

@implementation HKConcept

+ (id)fallbackLanguagesForLocale:(id)a3
{
  v3 = [a3 countryCode];
  if ([v3 isEqualToString:@"CA"])
  {
    v4 = &unk_1EECE6720;
  }
  else if ([v3 isEqualToString:@"GB"])
  {
    v4 = &unk_1EECE6738;
  }
  else if ([v3 isEqualToString:@"US"])
  {
    v4 = &unk_1EECE6750;
  }
  else
  {
    v4 = &unk_1EECE6768;
  }

  return v4;
}

+ (id)preferredLanguages
{
  v3 = objc_msgSend(MEMORY[0x1E4F1CA20], "hk_testableCurrentLocale");
  v4 = objc_msgSend(MEMORY[0x1E4F1CA20], "hk_testablePreferredLanguages");
  v5 = [a1 fallbackLanguagesForLocale:v3];
  v6 = [v4 arrayByAddingObjectsFromArray:v5];

  return v6;
}

+ (HKConcept)conceptWithIdentifier:(id)a3 attributes:(id)a4 relationships:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[HKConcept alloc] initWithIdentifier:v9 attributes:v8 relationships:v7 version:0 deleted:0 options:0];

  return v10;
}

- (id)copyWithRelationships:(id)a3
{
  id v4 = a3;
  v5 = [[HKConcept alloc] initWithIdentifier:self->_identifier attributes:self->_attributes relationships:v4 version:self->_version deleted:self->_deleted options:self->_options];

  return v5;
}

- (id)firstConceptOfRelationshipType:(int64_t)a3
{
  if (![(HKConcept *)self relationshipsAreLoaded])
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"HKConcept.m", 89, @"Invalid parameter not satisfying: %@", @"self.relationshipsAreLoaded" object file lineNumber description];
  }
  relationships = self->_relationships;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __44__HKConcept_firstConceptOfRelationshipType___block_invoke;
  v11[3] = &__block_descriptor_40_e31_B16__0__HKConceptRelationship_8l;
  v11[4] = a3;
  id v7 = [(NSArray *)relationships hk_firstObjectPassingTest:v11];
  id v8 = [v7 destination];

  return v8;
}

BOOL __44__HKConcept_firstConceptOfRelationshipType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == *(void *)(a1 + 32);
}

- (id)allConceptsOfRelationshipType:(int64_t)a3
{
  if (![(HKConcept *)self relationshipsAreLoaded])
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"HKConcept.m", 97, @"Invalid parameter not satisfying: %@", @"self.relationshipsAreLoaded" object file lineNumber description];
  }
  relationships = self->_relationships;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __43__HKConcept_allConceptsOfRelationshipType___block_invoke;
  v10[3] = &__block_descriptor_40_e42___HKConcept_16__0__HKConceptRelationship_8l;
  v10[4] = a3;
  id v7 = [(NSArray *)relationships hk_map:v10];

  return v7;
}

id __43__HKConcept_allConceptsOfRelationshipType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 type] == *(void *)(a1 + 32))
  {
    id v4 = [v3 destination];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (HKConcept)initWithIdentifier:(id)a3 attributes:(id)a4 relationships:(id)a5 version:(int64_t)a6 deleted:(BOOL)a7 options:(unint64_t)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  if (v15)
  {
    if (v16) {
      goto LABEL_3;
    }
  }
  else
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"HKConcept.m", 112, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

    if (v16) {
      goto LABEL_3;
    }
  }
  v26 = [MEMORY[0x1E4F28B00] currentHandler];
  [v26 handleFailureInMethod:a2, self, @"HKConcept.m", 113, @"Invalid parameter not satisfying: %@", @"attributes" object file lineNumber description];

LABEL_3:
  v27.receiver = self;
  v27.super_class = (Class)HKConcept;
  v18 = [(HKConcept *)&v27 init];
  if (v18)
  {
    uint64_t v19 = [v15 copy];
    identifier = v18->_identifier;
    v18->_identifier = (HKConceptIdentifier *)v19;

    uint64_t v21 = [v16 copy];
    attributes = v18->_attributes;
    v18->_attributes = (NSArray *)v21;

    objc_storeStrong((id *)&v18->_relationships, a5);
    v18->_deleted = a7;
    BOOL v23 = v18->_relationships != 0;
    v18->_version = a6;
    v18->_options = v23 | a8;
  }

  return v18;
}

- (HKConcept)init
{
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (unint64_t)hash
{
  id v3 = [(HKConcept *)self identifier];
  uint64_t v4 = [v3 hash];
  if ([(HKConceptIdentifier *)self->_identifier isInMemory])
  {
    v5 = [(HKConcept *)self adHocCode];
    uint64_t v6 = [v5 hash];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6 ^ v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HKConcept *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      if ([(HKConceptIdentifier *)self->_identifier isEqual:v5->_identifier])
      {
        if ([(HKConceptIdentifier *)self->_identifier isInMemory])
        {
          uint64_t v6 = [(HKConcept *)self adHocCode];
          id v7 = [(HKConcept *)v5 adHocCode];
          char v8 = [v6 isEqual:v7];
        }
        else
        {
          char v8 = 1;
        }
      }
      else
      {
        char v8 = 0;
      }
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (void)mutateBySettingRelationships:(id)a3
{
  self->_options |= 1uLL;
  self->_relationships = (NSArray *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (HKConcept)groupByConcept
{
  id v3 = [(HKConcept *)self firstConceptOfRelationshipType:1013];
  if (!v3) {
    id v3 = self;
  }

  return v3;
}

- (HKConcept)chartedWithConcept
{
  return (HKConcept *)[(HKConcept *)self firstConceptOfRelationshipType:54838];
}

- (NSSet)validInRegions
{
  v2 = [(HKConcept *)self firstAttributeForType:959];
  id v3 = v2;
  uint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
  if (v2)
  {
    v5 = [v2 stringValue];
    uint64_t v6 = [v5 componentsSeparatedByString:@","];
    id v7 = [v4 setWithArray:v6];
  }
  else
  {
    id v7 = [MEMORY[0x1E4F1CAD0] setWithObject:@"US"];
  }

  return (NSSet *)v7;
}

- (NSString)preferredName
{
  v2 = [(HKConcept *)self firstAttributeForType:1012];
  id v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (NSString)localizedPreferredName
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  [(id)objc_opt_class() preferredLanguages];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        id v9 = [&unk_1EECE6180 objectForKeyedSubscript:v8];
        if (v9)
        {
          v10 = v9;
          v11 = -[HKConcept firstAttributeForType:](self, "firstAttributeForType:", [v9 integerValue]);
          v12 = [v11 stringValue];

          if (v12)
          {
            if (_os_feature_enabled_impl())
            {
              id v15 = [NSString stringWithFormat:@"%@ [%@]", v12, v8, (void)v17];
            }
            else
            {
              id v15 = v12;
            }
            v14 = v15;

            id v13 = v3;
            goto LABEL_18;
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  id v13 = [(HKConcept *)self preferredName];
  if (v13) {
    id v13 = v13;
  }
  v14 = v13;
LABEL_18:

  return (NSString *)v14;
}

- (id)firstAttributeForType:(int64_t)a3
{
  attributes = self->_attributes;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__HKConcept_firstAttributeForType___block_invoke;
  v6[3] = &__block_descriptor_40_e28_B16__0__HKConceptAttribute_8l;
  v6[4] = a3;
  uint64_t v4 = [(NSArray *)attributes hk_firstObjectPassingTest:v6];

  return v4;
}

BOOL __35__HKConcept_firstAttributeForType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == *(void *)(a1 + 32);
}

- (id)attributesForType:(int64_t)a3
{
  attributes = self->_attributes;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __31__HKConcept_attributesForType___block_invoke;
  v6[3] = &__block_descriptor_40_e28_B16__0__HKConceptAttribute_8l;
  v6[4] = a3;
  uint64_t v4 = [(NSArray *)attributes hk_filter:v6];

  return v4;
}

BOOL __31__HKConcept_attributesForType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == *(void *)(a1 + 32);
}

- (void)enumerateAttributesWithType:(int64_t)a3 block:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void (**)(id, void *))a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = [(HKConcept *)self attributes];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v12 type] == a3) {
          v6[2](v6, v12);
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (id)stringsForAttributeType:(int64_t)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __37__HKConcept_stringsForAttributeType___block_invoke;
  v9[3] = &unk_1E58BEBB8;
  id v10 = v5;
  id v6 = v5;
  [(HKConcept *)self enumerateAttributesWithType:a3 block:v9];
  id v7 = (void *)[v6 copy];

  return v7;
}

void __37__HKConcept_stringsForAttributeType___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 stringValue];
  [v2 addObject:v3];
}

- (BOOL)isAdHoc
{
  v2 = [(HKConcept *)self firstAttributeForType:2];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isNebulous
{
  v2 = [(HKConcept *)self firstAttributeForType:1011];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isGeneric
{
  v2 = [(HKConcept *)self firstAttributeForType:846];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isLowUtility
{
  v2 = [(HKConcept *)self firstAttributeForType:989];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isExcludedFromSearch
{
  v2 = [(HKConcept *)self firstAttributeForType:620];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isInMemory
{
  return [(HKConceptIdentifier *)self->_identifier isInMemory];
}

- (BOOL)chartsBloodPressure
{
  v2 = [(HKConcept *)self firstAttributeForType:61813];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)hidesOutOfRangeFilter
{
  v2 = [(HKConcept *)self firstAttributeForType:61839];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (NSArray)synonyms
{
  return (NSArray *)[(HKConcept *)self stringsForAttributeType:56926];
}

- (NSString)adHocCode
{
  v2 = [(HKConcept *)self firstAttributeForType:2];
  char v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (HKMedicalCoding)LOINCCoding
{
  v2 = [(HKConcept *)self firstAttributeForType:1009];
  char v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 stringValue];
    if (v4)
    {
      id v5 = +[HKMedicalCodingSystem LOINCCodeSystem];
      id v6 = +[HKMedicalCoding medicalCodingWithSystem:v5 codingVersion:0 code:v4 displayString:0];
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return (HKMedicalCoding *)v6;
}

- (HKMedicalCoding)RxNormCoding
{
  v2 = [(HKConcept *)self firstAttributeForType:1008];
  char v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 stringValue];
    if (v4)
    {
      id v5 = +[HKMedicalCodingSystem RxNormCodeSystem];
      id v6 = +[HKMedicalCoding medicalCodingWithSystem:v5 codingVersion:0 code:v4 displayString:0];
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return (HKMedicalCoding *)v6;
}

- (HKMedicalCoding)coding
{
  char v3 = [(HKConcept *)self firstAttributeForType:2];
  if (v3)
  {
    uint64_t v4 = +[HKMedicalCodingSystem adHocConceptSystem];
    id v5 = [v3 stringValue];
  }
  else
  {
    uint64_t v4 = +[HKMedicalCodingSystem appleOntologySystem];
    id v6 = [(HKConcept *)self identifier];
    id v7 = [v6 numberRepresentation];
    id v5 = [v7 stringValue];
  }
  uint64_t v8 = [[HKMedicalCoding alloc] initWithCodingSystem:v4 codingVersion:0 code:v5 displayString:0];

  return v8;
}

- (BOOL)relationshipsAreLoaded
{
  return self->_options & 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKConcept)initWithCoder:(id)a3
{
  v19[6] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if (([v5 _decodingCyclesIsAllowed] & 1) == 0) {
      [v5 _allowDecodingCyclesInSecureMode];
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)HKConcept;
  id v6 = [(HKConcept *)&v18 init];
  if (v6)
  {
    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Identifier"];
    id v8 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    v19[2] = objc_opt_class();
    v19[3] = objc_opt_class();
    v19[4] = objc_opt_class();
    v19[5] = objc_opt_class();
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:6];
    id v10 = (void *)[v8 initWithArray:v9];

    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"Attributes"];
    attributes = v6->_attributes;
    v6->_attributes = (NSArray *)v11;

    identifier = v6->_identifier;
    v6->_identifier = v7;
    long long v14 = v7;

    uint64_t v15 = [v4 decodeObjectOfClasses:v10 forKey:@"Relationships"];
    relationships = v6->_relationships;
    v6->_relationships = (NSArray *)v15;

    v6->_version = [v4 decodeInt64ForKey:@"Version"];
    v6->_deleted = [v4 decodeBoolForKey:@"Deleted"];
    v6->_options = [v4 decodeIntegerForKey:@"Options"];
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  attributes = self->_attributes;
  id v5 = a3;
  [v5 encodeObject:attributes forKey:@"Attributes"];
  [v5 encodeObject:self->_identifier forKey:@"Identifier"];
  [v5 encodeObject:self->_relationships forKey:@"Relationships"];
  [v5 encodeInt64:self->_version forKey:@"Version"];
  [v5 encodeBool:self->_deleted forKey:@"Deleted"];
  [v5 encodeInteger:self->_options forKey:@"Options"];
}

- (id)description
{
  char v3 = NSString;
  int64_t v4 = [(HKConceptIdentifier *)self->_identifier rawIdentifier];
  id v5 = [(HKConcept *)self preferredName];
  id v6 = [v3 stringWithFormat:@"HKConcept: Identifier: %lld, Preferred Name: %@", v4, v5];

  return v6;
}

- (id)treeDescription
{
  char v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@, Tree:\n", self];
  id v4 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v5 = [(HKConcept *)self identifier];
  id v6 = objc_msgSend(v4, "initWithObjects:", v5, 0);

  [(HKConcept *)self _appendTreeDescriptionToString:v3 visitedStack:v6];

  return v3;
}

- (void)_appendTreeDescriptionToString:(id)a3 visitedStack:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_msgSend(v6, "appendFormat:", @"%012lld", -[HKConceptIdentifier rawIdentifier](self->_identifier, "rawIdentifier"));
  if ([(NSArray *)self->_attributes count])
  {
    [v6 appendFormat:@" ["];
    [(HKConcept *)self _appendSortedAttributeTypeCountDescriptionToString:v6];
    [v6 appendFormat:@"]"];
  }
  [v6 appendFormat:@"\n"];
  int v8 = [v7 count];
  uint64_t v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"%*s", (10 * v8 - 8), "");
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = [(HKConcept *)self _sortedRelationships];
  uint64_t v10 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(obj);
        }
        long long v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        [v6 appendString:v9];
        uint64_t v15 = [v14 destination];
        long long v16 = [v15 identifier];
        int v17 = [v7 containsObject:v16];

        if (v17)
        {
          uint64_t v18 = [v14 type];
          long long v19 = [v14 destination];
          long long v20 = [v19 identifier];
          objc_msgSend(v6, "appendFormat:", @"%04lld -> %012lld [CYCLE DETECTED]\n", v18, objc_msgSend(v20, "rawIdentifier"));
        }
        else
        {
          uint64_t v21 = [v14 destination];
          uint64_t v22 = [v21 identifier];
          [v7 addObject:v22];

          objc_msgSend(v6, "appendFormat:", @"%04lld -> ", objc_msgSend(v14, "type"));
          BOOL v23 = [v14 destination];
          [v23 _appendTreeDescriptionToString:v6 visitedStack:v7];

          [v7 removeLastObject];
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v11);
  }
}

- (id)_sortedRelationships
{
  return [(NSArray *)self->_relationships sortedArrayUsingComparator:&__block_literal_global_10];
}

uint64_t __33__HKConcept__sortedRelationships__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = HKCompareIntegers([v4 type], objc_msgSend(v5, "type"));
  if (!v6)
  {
    id v7 = [v4 destination];
    int v8 = [v7 identifier];
    uint64_t v9 = [v8 rawIdentifier];
    uint64_t v10 = [v5 destination];
    uint64_t v11 = [v10 identifier];
    uint64_t v6 = HKCompareIntegers(v9, [v11 rawIdentifier]);
  }
  return v6;
}

- (void)_appendSortedAttributeTypeCountDescriptionToString:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v6 = self->_attributes;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v10), "type"));
        uint64_t v12 = [v5 objectForKeyedSubscript:v11];
        long long v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v12, "integerValue") + 1);
        [v5 setObject:v13 forKeyedSubscript:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  long long v14 = objc_msgSend(v5, "hk_sortedKeys");
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __64__HKConcept__appendSortedAttributeTypeCountDescriptionToString___block_invoke;
  v16[3] = &unk_1E58BEC00;
  id v17 = v5;
  id v15 = v5;
  objc_msgSend(v4, "hk_appendComponentsJoinedByString:container:componentGenerator:", @", ", v14, v16);
}

id __64__HKConcept__appendSortedAttributeTypeCountDescriptionToString___block_invoke(uint64_t a1, void *a2)
{
  char v3 = (objc_class *)NSString;
  id v4 = a2;
  id v5 = [v3 alloc];
  uint64_t v6 = [v4 longLongValue];
  uint64_t v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];

  uint64_t v8 = objc_msgSend(v5, "initWithFormat:", @"%04lld: %04lld", v6, objc_msgSend(v7, "longLongValue"));

  return v8;
}

- (NSArray)attributes
{
  return self->_attributes;
}

- (HKConceptIdentifier)identifier
{
  return self->_identifier;
}

- (int64_t)version
{
  return self->_version;
}

- (BOOL)isUndefined
{
  return self->_isUndefined;
}

- (NSArray)relationships
{
  return self->_relationships;
}

- (BOOL)isDeleted
{
  return self->_deleted;
}

- (unint64_t)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_attributes, 0);

  objc_storeStrong((id *)&self->_relationships, 0);
}

@end