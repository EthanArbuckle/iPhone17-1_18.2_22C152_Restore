@interface HKOntologyLocalizedEducationContent
+ (BOOL)supportsSecureCoding;
+ (id)_mergeDataFromSectionsInto:(id)a3 fromContent:(id)a4 options:(unint64_t)a5;
+ (id)mergeListsOfPropertiesWithType:(int64_t)a3 intoListOfProperties:(id)a4 fromListOfProperties:(id)a5 options:(unint64_t)a6;
+ (id)nullPropertyWithVersion:(int64_t)a3;
+ (id)nullPropertyWithVersion:(int64_t)a3 timestamp:(double)a4;
- (BOOL)isEqual:(id)a3;
- (HKOntologyLocalizedEducationContent)init;
- (HKOntologyLocalizedEducationContent)initWithCoder:(id)a3;
- (HKOntologyLocalizedEducationContent)initWithSections:(id)a3 version:(int64_t)a4 timestamp:(double)a5 deleted:(BOOL)a6;
- (HKOntologyLocalizedEducationContent)initWithType:(int64_t)a3 version:(int64_t)a4 timestamp:(double)a5 deleted:(BOOL)a6;
- (HKOntologyLocalizedEducationContentSection)primarySection;
- (NSArray)sections;
- (id)_sectionsUniquedByLocaleSectionTypePairing;
- (id)allSectionsWithType:(int64_t)a3;
- (id)firstSectionWithType:(int64_t)a3;
- (id)valueDescription;
- (int64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKOntologyLocalizedEducationContent

- (HKOntologyLocalizedEducationContent)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKOntologyLocalizedEducationContent)initWithType:(int64_t)a3 version:(int64_t)a4 timestamp:(double)a5 deleted:(BOOL)a6
{
  v7 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v8 = *MEMORY[0x1E4F1C3C8];
  v9 = NSStringFromSelector(a2);
  [v7 raise:v8, @"The -%@ method is not available on %@", v9, objc_opt_class() format];

  return 0;
}

- (HKOntologyLocalizedEducationContent)initWithSections:(id)a3 version:(int64_t)a4 timestamp:(double)a5 deleted:(BOOL)a6
{
  BOOL v6 = a6;
  id v11 = a3;
  if (!v11)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"HKOntologyLocalizedEducationContent.m", 39, @"Invalid parameter not satisfying: %@", @"sections != nil" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)HKOntologyLocalizedEducationContent;
  v12 = [(HKUserDomainConceptProperty *)&v17 initWithType:160019 version:a4 timestamp:v6 deleted:a5];
  if (v12)
  {
    uint64_t v13 = [v11 copy];
    sections = v12->_sections;
    v12->_sections = (NSArray *)v13;
  }
  return v12;
}

+ (id)nullPropertyWithVersion:(int64_t)a3
{
  double Current = CFAbsoluteTimeGetCurrent();

  return (id)[a1 nullPropertyWithVersion:a3 timestamp:Current];
}

+ (id)nullPropertyWithVersion:(int64_t)a3 timestamp:(double)a4
{
  id v6 = objc_alloc((Class)a1);
  v7 = (void *)[v6 initWithSections:MEMORY[0x1E4F1CBF0] version:a3 timestamp:1 deleted:a4];

  return v7;
}

- (id)valueDescription
{
  v3 = [(NSArray *)self->_sections hk_map:&__block_literal_global_54];
  uint64_t v4 = NSString;
  uint64_t v5 = objc_opt_class();
  NSUInteger v6 = [(NSArray *)self->_sections count];
  if ([(NSArray *)self->_sections count] == 1) {
    v7 = "";
  }
  else {
    v7 = "s";
  }
  uint64_t v8 = [v3 componentsJoinedByString:@", "];
  v9 = [v4 stringWithFormat:@"<%@:%p with %ld section%s (%@)>", v5, self, v6, v7, v8];

  return v9;
}

__CFString *__55__HKOntologyLocalizedEducationContent_valueDescription__block_invoke(uint64_t a1, void *a2)
{
  unint64_t v2 = [a2 sectionType];

  return HKStringFromOntologyLocalizedEducationContentSectionType(v2);
}

+ (id)mergeListsOfPropertiesWithType:(int64_t)a3 intoListOfProperties:(id)a4 fromListOfProperties:(id)a5 options:(unint64_t)a6
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  if (!v11 || ![v11 count])
  {
    id v18 = v10;
LABEL_14:
    v19 = v18;
    goto LABEL_15;
  }
  if (!v10 || ![v10 count])
  {
    id v18 = v12;
    goto LABEL_14;
  }
  if ([v10 count] != 1)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, a1, @"HKOntologyLocalizedEducationContent.m", 83, @"Invalid parameter not satisfying: %@", @"intoListOfProperties.count == 1" object file lineNumber description];
  }
  if ([v12 count] != 1)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, a1, @"HKOntologyLocalizedEducationContent.m", 84, @"Invalid parameter not satisfying: %@", @"fromListOfProperties.count == 1" object file lineNumber description];
  }
  uint64_t v13 = [v10 firstObject];
  v14 = [v12 firstObject];
  uint64_t v15 = [a1 _mergeDataFromSectionsInto:v13 fromContent:v14 options:a6];
  v16 = (void *)v15;
  if ((void *)v15 == v13)
  {
    id v17 = v10;
  }
  else if ((void *)v15 == v14)
  {
    id v17 = v12;
  }
  else
  {
    v23[0] = v15;
    id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  }
  v19 = v17;

LABEL_15:

  return v19;
}

+ (id)_mergeDataFromSectionsInto:(id)a3 fromContent:(id)a4 options:(unint64_t)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  uint64_t v9 = [v7 version];
  if (v9 > [v8 version]) {
    goto LABEL_2;
  }
  uint64_t v12 = [v7 version];
  uint64_t v13 = [v8 version];
  char v11 = 0;
  if ((a5 & 1) == 0)
  {
    id v10 = v8;
    if (v12 != v13) {
      goto LABEL_8;
    }
    [v7 timestamp];
    double v15 = v14;
    [v8 timestamp];
    if (v15 > v16)
    {
LABEL_2:
      id v10 = v7;

      char v11 = 1;
      goto LABEL_8;
    }
    char v11 = 0;
  }
  id v10 = v8;
LABEL_8:
  if ([v10 isDeleted])
  {
    id v17 = (HKOntologyLocalizedEducationContent *)v10;
  }
  else
  {
    char v36 = v11;
    v34 = v10;
    id v18 = [v8 _sectionsUniquedByLocaleSectionTypePairing];
    id v35 = v7;
    v19 = [v7 _sectionsUniquedByLocaleSectionTypePairing];
    v37 = (void *)[v18 mutableCopy];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v20 = v19;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v40 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = *(void *)(*((void *)&v39 + 1) + 8 * i);
          v26 = [v20 objectForKeyedSubscript:v25];
          v27 = [v18 objectForKeyedSubscript:v25];
          v28 = +[HKOntologyLocalizedEducationContentSection sectionByMerging:v27 sectionToMergeFrom:v26 options:a5];
          if (v28 != v27)
          {
            [v37 setObject:v28 forKeyedSubscript:v25];
            char v36 = 1;
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v39 objects:v43 count:16];
      }
      while (v22);
    }

    if (v36)
    {
      v29 = [HKOntologyLocalizedEducationContent alloc];
      v30 = v37;
      v31 = [v37 allValues];
      id v10 = v34;
      uint64_t v32 = [v34 version];
      [v34 timestamp];
      id v17 = -[HKOntologyLocalizedEducationContent initWithSections:version:timestamp:deleted:](v29, "initWithSections:version:timestamp:deleted:", v31, v32, 0);
    }
    else
    {
      id v17 = (HKOntologyLocalizedEducationContent *)v8;
      id v10 = v34;
      v30 = v37;
    }

    id v7 = v35;
  }

  return v17;
}

- (id)_sectionsUniquedByLocaleSectionTypePairing
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = self->_sections;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "identifier", (void)v12);
        [v3 setObject:v9 forKeyedSubscript:v10];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v3;
}

- (int64_t)count
{
  return [(NSArray *)self->_sections count];
}

- (unint64_t)hash
{
  return [(NSArray *)self->_sections hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HKOntologyLocalizedEducationContent *)a3;
  if (v4 == self)
  {
    char v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      v8.receiver = self;
      v8.super_class = (Class)HKOntologyLocalizedEducationContent;
      if ([(HKUserDomainConceptProperty *)&v8 isEqual:v5]) {
        char v6 = [(NSArray *)self->_sections isEqual:v5->_sections];
      }
      else {
        char v6 = 0;
      }
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKOntologyLocalizedEducationContent;
  id v4 = a3;
  [(HKUserDomainConceptProperty *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_sections, @"sections", v5.receiver, v5.super_class);
}

- (HKOntologyLocalizedEducationContent)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  char v6 = objc_msgSend(v4, "hk_typesForArrayOf:", objc_opt_class());
  uint64_t v7 = [v5 decodeObjectOfClasses:v6 forKey:@"sections"];

  v10.receiver = self;
  v10.super_class = (Class)HKOntologyLocalizedEducationContent;
  objc_super v8 = [(HKUserDomainConceptProperty *)&v10 initWithCoder:v5];

  if (v8) {
    objc_storeStrong((id *)&v8->_sections, v7);
  }

  return v8;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return [(NSArray *)self->_sections countByEnumeratingWithState:a3 objects:a4 count:a5];
}

- (HKOntologyLocalizedEducationContentSection)primarySection
{
  return (HKOntologyLocalizedEducationContentSection *)[(HKOntologyLocalizedEducationContent *)self firstSectionWithType:1];
}

- (id)firstSectionWithType:(int64_t)a3
{
  sections = self->_sections;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__HKOntologyLocalizedEducationContent_firstSectionWithType___block_invoke;
  v6[3] = &__block_descriptor_40_e52_B16__0__HKOntologyLocalizedEducationContentSection_8l;
  v6[4] = a3;
  id v4 = [(NSArray *)sections hk_firstObjectPassingTest:v6];

  return v4;
}

BOOL __60__HKOntologyLocalizedEducationContent_firstSectionWithType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 sectionType] == *(void *)(a1 + 32);
}

- (id)allSectionsWithType:(int64_t)a3
{
  sections = self->_sections;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__HKOntologyLocalizedEducationContent_allSectionsWithType___block_invoke;
  v6[3] = &__block_descriptor_40_e52_B16__0__HKOntologyLocalizedEducationContentSection_8l;
  v6[4] = a3;
  id v4 = [(NSArray *)sections hk_filter:v6];

  return v4;
}

BOOL __59__HKOntologyLocalizedEducationContent_allSectionsWithType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 sectionType] == *(void *)(a1 + 32);
}

- (NSArray)sections
{
  return self->_sections;
}

- (void).cxx_destruct
{
}

@end