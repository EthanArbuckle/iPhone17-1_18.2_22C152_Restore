@interface HKConceptResolutionDefinition
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKConceptResolutionDefinition)init;
- (HKConceptResolutionDefinition)initWithCoder:(id)a3;
- (HKConceptResolutionDefinition)initWithCodingCollection:(id)a3 countryCode:(id)a4;
- (HKConceptResolutionDefinition)initWithCodingCollection:(id)a3 countryCode:(id)a4 recordCategoryType:(int64_t)a5;
- (HKMedicalCodingCollection)codingCollection;
- (NSString)countryCode;
- (id)description;
- (int64_t)recordCategoryType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKConceptResolutionDefinition

- (HKConceptResolutionDefinition)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKConceptResolutionDefinition)initWithCodingCollection:(id)a3 countryCode:(id)a4
{
  return [(HKConceptResolutionDefinition *)self initWithCodingCollection:a3 countryCode:a4 recordCategoryType:0];
}

- (HKConceptResolutionDefinition)initWithCodingCollection:(id)a3 countryCode:(id)a4 recordCategoryType:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HKConceptResolutionDefinition;
  v10 = [(HKConceptResolutionDefinition *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    codingCollection = v10->_codingCollection;
    v10->_codingCollection = (HKMedicalCodingCollection *)v11;

    uint64_t v13 = [v9 copy];
    countryCode = v10->_countryCode;
    v10->_countryCode = (NSString *)v13;

    v10->_recordCategoryType = a5;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  codingCollection = self->_codingCollection;
  id v5 = a3;
  [v5 encodeObject:codingCollection forKey:@"ConceptResolutionDefinitionCodingCollectionKey"];
  [v5 encodeObject:self->_countryCode forKey:@"ConceptResolutionDefinitionCountryCodeKey"];
  [v5 encodeInteger:self->_recordCategoryType forKey:@"ConceptResolutionDefinitionCountryCategoryTypeKey"];
}

- (HKConceptResolutionDefinition)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKConceptResolutionDefinition;
  id v5 = [(HKConceptResolutionDefinition *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ConceptResolutionDefinitionCodingCollectionKey"];
    codingCollection = v5->_codingCollection;
    v5->_codingCollection = (HKMedicalCodingCollection *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ConceptResolutionDefinitionCountryCodeKey"];
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v8;

    v5->_recordCategoryType = [v4 decodeIntegerForKey:@"ConceptResolutionDefinitionCountryCategoryTypeKey"];
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HKConceptResolutionDefinition *)a3;
  if (self == v4)
  {
    BOOL v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      codingCollection = self->_codingCollection;
      uint64_t v7 = [(HKConceptResolutionDefinition *)v5 codingCollection];
      if (codingCollection == (HKMedicalCodingCollection *)v7)
      {
      }
      else
      {
        uint64_t v8 = (void *)v7;
        uint64_t v9 = [(HKConceptResolutionDefinition *)v5 codingCollection];
        if (!v9) {
          goto LABEL_14;
        }
        v10 = (void *)v9;
        objc_super v11 = self->_codingCollection;
        v12 = [(HKConceptResolutionDefinition *)v5 codingCollection];
        LODWORD(v11) = [(HKMedicalCodingCollection *)v11 isEqual:v12];

        if (!v11) {
          goto LABEL_15;
        }
      }
      countryCode = self->_countryCode;
      uint64_t v15 = [(HKConceptResolutionDefinition *)v5 countryCode];
      if (countryCode == (NSString *)v15)
      {

LABEL_17:
        int64_t recordCategoryType = self->_recordCategoryType;
        BOOL v13 = recordCategoryType == [(HKConceptResolutionDefinition *)v5 recordCategoryType];
        goto LABEL_18;
      }
      uint64_t v8 = (void *)v15;
      uint64_t v16 = [(HKConceptResolutionDefinition *)v5 countryCode];
      if (v16)
      {
        v17 = (void *)v16;
        v18 = self->_countryCode;
        v19 = [(HKConceptResolutionDefinition *)v5 countryCode];
        LODWORD(v18) = [(NSString *)v18 isEqual:v19];

        if (v18) {
          goto LABEL_17;
        }
LABEL_15:
        BOOL v13 = 0;
LABEL_18:

        goto LABEL_19;
      }
LABEL_14:

      goto LABEL_15;
    }
    BOOL v13 = 0;
  }
LABEL_19:

  return v13;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HKMedicalCodingCollection *)self->_codingCollection hash];
  return [(NSString *)self->_countryCode hash] ^ v3 ^ self->_recordCategoryType;
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  codingCollection = self->_codingCollection;
  countryCode = self->_countryCode;
  uint64_t v7 = HKStringFromMedicalRecordCategoryType(self->_recordCategoryType);
  uint64_t v8 = [v3 stringWithFormat:@"<%@:%p %@ %@ /'%@/'>", v4, self, codingCollection, countryCode, v7];

  return v8;
}

- (HKMedicalCodingCollection)codingCollection
{
  return self->_codingCollection;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (int64_t)recordCategoryType
{
  return self->_recordCategoryType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countryCode, 0);

  objc_storeStrong((id *)&self->_codingCollection, 0);
}

@end