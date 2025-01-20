@interface HKOntologyLocalizedEducationContentSection
+ (BOOL)supportsSecureCoding;
+ (id)sectionByMerging:(id)a3 sectionToMergeFrom:(id)a4 options:(unint64_t)a5;
- (BOOL)isEqual:(id)a3;
- (HKOntologyLocalizedEducationContentSection)init;
- (HKOntologyLocalizedEducationContentSection)initWithCoder:(id)a3;
- (HKOntologyLocalizedEducationContentSection)initWithSectionDataTypeMapping:(id)a3 sectionType:(int64_t)a4;
- (NSArray)attributions;
- (NSArray)citations;
- (NSArray)sectionData;
- (NSArray)validRegionCodes;
- (NSDictionary)sectionDataTypeMapping;
- (NSString)identifier;
- (NSString)localeIdentifier;
- (NSString)localizedText;
- (id)_arrayOfStringOfTypeOrNil:(int64_t)a3;
- (id)description;
- (int64_t)sectionType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKOntologyLocalizedEducationContentSection

- (HKOntologyLocalizedEducationContentSection)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKOntologyLocalizedEducationContentSection)initWithSectionDataTypeMapping:(id)a3 sectionType:(int64_t)a4
{
  id v7 = a3;
  v8 = [v7 objectForKeyedSubscript:&unk_1EECE3E18];

  if (!v8)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"HKOntologyLocalizedEducationContentSection.m", 38, @"Invalid parameter not satisfying: %@", @"sectionDataTypeMapping[@(HKOntologyEducationContentSectionDataTypeLocaleIdentifier)] != nil" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)HKOntologyLocalizedEducationContentSection;
  v9 = [(HKOntologyLocalizedEducationContentSection *)&v15 init];
  v10 = v9;
  if (v9)
  {
    v9->_sectionType = a4;
    uint64_t v11 = [v7 copy];
    sectionDataTypeMapping = v10->_sectionDataTypeMapping;
    v10->_sectionDataTypeMapping = (NSDictionary *)v11;
  }
  return v10;
}

- (NSArray)sectionData
{
  return [(NSDictionary *)self->_sectionDataTypeMapping allValues];
}

- (NSString)identifier
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v3 = [(HKOntologyLocalizedEducationContentSection *)self localeIdentifier];
  uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", self->_sectionType, v3);
  v8[1] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  v6 = [v5 componentsJoinedByString:@"/"];

  return (NSString *)v6;
}

- (NSString)localizedText
{
  v2 = [(NSDictionary *)self->_sectionDataTypeMapping objectForKeyedSubscript:&unk_1EECE3E30];
  v3 = [v2 stringValues];
  uint64_t v4 = [v3 firstObject];

  return (NSString *)v4;
}

- (NSString)localeIdentifier
{
  v2 = [(NSDictionary *)self->_sectionDataTypeMapping objectForKeyedSubscript:&unk_1EECE3E18];
  v3 = [v2 stringValues];
  uint64_t v4 = [v3 firstObject];

  return (NSString *)v4;
}

- (NSArray)validRegionCodes
{
  return (NSArray *)[(HKOntologyLocalizedEducationContentSection *)self _arrayOfStringOfTypeOrNil:3];
}

- (NSArray)attributions
{
  return (NSArray *)[(HKOntologyLocalizedEducationContentSection *)self _arrayOfStringOfTypeOrNil:4];
}

- (NSArray)citations
{
  return (NSArray *)[(HKOntologyLocalizedEducationContentSection *)self _arrayOfStringOfTypeOrNil:5];
}

- (id)_arrayOfStringOfTypeOrNil:(int64_t)a3
{
  sectionDataTypeMapping = self->_sectionDataTypeMapping;
  uint64_t v4 = [NSNumber numberWithLongLong:a3];
  v5 = [(NSDictionary *)sectionDataTypeMapping objectForKeyedSubscript:v4];

  if (v5)
  {
    v6 = [v5 stringValues];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v4 = [(HKOntologyLocalizedEducationContentSection *)self localizedText];
  uint64_t v5 = [v4 length];
  v6 = [(HKOntologyLocalizedEducationContentSection *)self localeIdentifier];
  id v7 = [v3 stringWithFormat:@"'Length of education content: %li, localeIdentifier: %@, '", v5, v6];

  v8 = [(HKOntologyLocalizedEducationContentSection *)self validRegionCodes];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    [v7 appendString:@", ["];
    v10 = [(HKOntologyLocalizedEducationContentSection *)self validRegionCodes];
    uint64_t v11 = [v10 componentsJoinedByString:@", "];
    [v7 appendString:v11];

    [v7 appendString:@"]"];
  }
  v12 = [(HKOntologyLocalizedEducationContentSection *)self attributions];
  uint64_t v13 = [v12 count];

  if (v13)
  {
    [v7 appendString:@", ["];
    v14 = [(HKOntologyLocalizedEducationContentSection *)self attributions];
    objc_super v15 = [v14 componentsJoinedByString:@", "];
    [v7 appendString:v15];

    [v7 appendString:@"]"];
  }
  v16 = [(HKOntologyLocalizedEducationContentSection *)self citations];
  uint64_t v17 = [v16 count];

  if (v17)
  {
    [v7 appendString:@", ["];
    v18 = [(HKOntologyLocalizedEducationContentSection *)self citations];
    v19 = [v18 componentsJoinedByString:@", "];
    [v7 appendString:v19];

    [v7 appendString:@"]"];
  }
  [v7 appendFormat:@">"];

  return v7;
}

+ (id)sectionByMerging:(id)a3 sectionToMergeFrom:(id)a4 options:(unint64_t)a5
{
  char v37 = a5;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (!v8)
  {
    v31 = (HKOntologyLocalizedEducationContentSection *)v9;
LABEL_22:
    v32 = v31;
    goto LABEL_26;
  }
  if (!v9)
  {
    v31 = (HKOntologyLocalizedEducationContentSection *)v8;
    goto LABEL_22;
  }
  uint64_t v11 = [v8 sectionType];
  if (v11 != [v10 sectionType])
  {
    v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:a2, a1, @"HKOntologyLocalizedEducationContentSection.m", 121, @"Invalid parameter not satisfying: %@", @"sectionToMergeInto.sectionType == sectionToMergeFrom.sectionType" object file lineNumber description];
  }
  v12 = [v8 sectionDataTypeMapping];
  uint64_t v13 = [v10 sectionDataTypeMapping];
  v38 = (void *)[v12 mutableCopy];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v14 = v13;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (!v15)
  {

LABEL_24:
    v30 = (HKOntologyLocalizedEducationContentSection *)v8;
    goto LABEL_25;
  }
  uint64_t v16 = v15;
  v35 = v10;
  v36 = v8;
  char v17 = 0;
  uint64_t v18 = *(void *)v40;
  do
  {
    for (uint64_t i = 0; i != v16; ++i)
    {
      if (*(void *)v40 != v18) {
        objc_enumerationMutation(v14);
      }
      uint64_t v20 = *(void *)(*((void *)&v39 + 1) + 8 * i);
      v21 = [v12 objectForKeyedSubscript:v20];
      v22 = [v14 objectForKeyedSubscript:v20];
      v23 = v22;
      if (!v21
        || (uint64_t v24 = [v22 version], v24 > objc_msgSend(v21, "version"))
        || (uint64_t v25 = [v23 version], v26 = objc_msgSend(v21, "version"), (v37 & 1) == 0)
        && v25 == v26
        && ([v23 timestamp], double v28 = v27, objc_msgSend(v21, "timestamp"), v28 > v29))
      {
        [v38 setObject:v23 forKeyedSubscript:v20];
        char v17 = 1;
      }
    }
    uint64_t v16 = [v14 countByEnumeratingWithState:&v39 objects:v43 count:16];
  }
  while (v16);

  v10 = v35;
  id v8 = v36;
  if ((v17 & 1) == 0) {
    goto LABEL_24;
  }
  v30 = -[HKOntologyLocalizedEducationContentSection initWithSectionDataTypeMapping:sectionType:]([HKOntologyLocalizedEducationContentSection alloc], "initWithSectionDataTypeMapping:sectionType:", v38, [v36 sectionType]);
LABEL_25:
  v32 = v30;

LABEL_26:

  return v32;
}

- (unint64_t)hash
{
  int64_t sectionType = self->_sectionType;
  v3 = [(HKOntologyLocalizedEducationContentSection *)self localeIdentifier];
  unint64_t v4 = [v3 hash] ^ sectionType;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (HKOntologyLocalizedEducationContentSection *)a3;
  if (v4 == self)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      v6 = [(HKOntologyLocalizedEducationContentSection *)self identifier];
      id v7 = [(HKOntologyLocalizedEducationContentSection *)v5 identifier];
      if (v6 == v7)
      {
        char v11 = 1;
      }
      else
      {
        id v8 = [(HKOntologyLocalizedEducationContentSection *)v5 identifier];
        if (v8)
        {
          id v9 = [(HKOntologyLocalizedEducationContentSection *)self identifier];
          v10 = [(HKOntologyLocalizedEducationContentSection *)v5 identifier];
          char v11 = [v9 isEqual:v10];
        }
        else
        {
          char v11 = 0;
        }
      }
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t sectionType = self->_sectionType;
  id v5 = a3;
  [v5 encodeInteger:sectionType forKey:@"sectionType"];
  [v5 encodeObject:self->_sectionDataTypeMapping forKey:@"sectionDataTypeMapping"];
}

- (HKOntologyLocalizedEducationContentSection)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKOntologyLocalizedEducationContentSection;
  id v5 = [(HKOntologyLocalizedEducationContentSection *)&v12 init];
  if (v5)
  {
    v5->_int64_t sectionType = [v4 decodeIntegerForKey:@"sectionType"];
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    id v8 = objc_msgSend(v6, "hk_typesForDictionaryMapping:to:", v7, objc_opt_class());
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"sectionDataTypeMapping"];
    sectionDataTypeMapping = v5->_sectionDataTypeMapping;
    v5->_sectionDataTypeMapping = (NSDictionary *)v9;
  }
  return v5;
}

- (int64_t)sectionType
{
  return self->_sectionType;
}

- (NSDictionary)sectionDataTypeMapping
{
  return self->_sectionDataTypeMapping;
}

- (void).cxx_destruct
{
}

@end