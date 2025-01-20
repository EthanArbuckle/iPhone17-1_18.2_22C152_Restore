@interface HKMedicalCodingConceptSelection
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKMedicalCoding)coding;
- (HKMedicalCodingConceptSelection)init;
- (HKMedicalCodingConceptSelection)initWithCoder:(id)a3;
- (HKMedicalCodingConceptSelection)initWithMedicalCoding:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKMedicalCodingConceptSelection

- (HKMedicalCodingConceptSelection)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKMedicalCodingConceptSelection)initWithMedicalCoding:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKMedicalCodingConceptSelection;
  v5 = [(HKConceptSelection *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    coding = v5->_coding;
    v5->_coding = (HKMedicalCoding *)v6;
  }
  return v5;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ %p: %@>", objc_opt_class(), self, self->_coding];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (HKMedicalCodingConceptSelection)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"coding"];
  if (v5)
  {
    self = [(HKMedicalCodingConceptSelection *)self initWithMedicalCoding:v5];
    uint64_t v6 = self;
  }
  else
  {
    id v7 = objc_alloc(MEMORY[0x1E4F28C58]);
    v8 = (void *)[v7 initWithDomain:*MEMORY[0x1E4F281F8] code:4865 userInfo:0];
    [v4 failWithError:v8];

    uint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HKMedicalCodingConceptSelection *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    uint64_t v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v14.receiver = self,
          v14.super_class = (Class)HKMedicalCodingConceptSelection,
          [(HKConceptSelection *)&v14 isEqual:v6]))
    {
      coding = self->_coding;
      v8 = [(HKMedicalCodingConceptSelection *)v6 coding];
      if (coding == v8)
      {
        char v12 = 1;
      }
      else
      {
        objc_super v9 = [(HKMedicalCodingConceptSelection *)v6 coding];
        if (v9)
        {
          v10 = self->_coding;
          v11 = [(HKMedicalCodingConceptSelection *)v6 coding];
          char v12 = [(HKMedicalCoding *)v10 isEqual:v11];
        }
        else
        {
          char v12 = 0;
        }
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  return v12;
}

- (HKMedicalCoding)coding
{
  return self->_coding;
}

- (void).cxx_destruct
{
}

@end