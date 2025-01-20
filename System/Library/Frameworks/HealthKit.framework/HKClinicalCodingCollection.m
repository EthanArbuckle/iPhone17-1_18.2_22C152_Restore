@interface HKClinicalCodingCollection
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKClinicalCodingCollection)init;
- (HKClinicalCodingCollection)initWithCoder:(id)a3;
- (HKClinicalCodingCollection)initWithText:(id)a3 codings:(id)a4;
- (NSSet)codings;
- (NSString)text;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKClinicalCodingCollection

- (HKClinicalCodingCollection)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKClinicalCodingCollection)initWithText:(id)a3 codings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKClinicalCodingCollection;
  v8 = [(HKClinicalCodingCollection *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    codings = v8->_codings;
    v8->_codings = (NSSet *)v9;

    uint64_t v11 = [v6 copy];
    text = v8->_text;
    v8->_text = (NSString *)v11;
  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HKClinicalCodingCollection *)a3;
  if (self == v4)
  {
    BOOL v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      id v6 = [(HKClinicalCodingCollection *)v5 codings];
      uint64_t v7 = [(HKClinicalCodingCollection *)self codings];
      if (v6 == (void *)v7)
      {
      }
      else
      {
        v8 = (void *)v7;
        uint64_t v9 = [(HKClinicalCodingCollection *)self codings];
        if (!v9) {
          goto LABEL_14;
        }
        v10 = (void *)v9;
        uint64_t v11 = [(HKClinicalCodingCollection *)v5 codings];
        v12 = [(HKClinicalCodingCollection *)self codings];
        int v13 = [v11 isEqualToSet:v12];

        if (!v13) {
          goto LABEL_15;
        }
      }
      id v6 = [(HKClinicalCodingCollection *)v5 text];
      uint64_t v15 = [(HKClinicalCodingCollection *)self text];
      if (v6 == (void *)v15)
      {

LABEL_17:
        BOOL v14 = 1;
        goto LABEL_18;
      }
      v8 = (void *)v15;
      uint64_t v16 = [(HKClinicalCodingCollection *)self text];
      if (v16)
      {
        v17 = (void *)v16;
        v18 = [(HKClinicalCodingCollection *)v5 text];
        v19 = [(HKClinicalCodingCollection *)self text];
        char v20 = [v18 isEqualToString:v19];

        if (v20) {
          goto LABEL_17;
        }
LABEL_15:
        BOOL v14 = 0;
LABEL_18:

        goto LABEL_19;
      }
LABEL_14:

      goto LABEL_15;
    }
    BOOL v14 = 0;
  }
LABEL_19:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSSet *)self->_codings hash];
  return [(NSString *)self->_text hash] ^ v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKClinicalCodingCollection)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HKClinicalCodingCollection;
  v5 = [(HKClinicalCodingCollection *)&v15 init];
  if (v5)
  {
    if (([v4 containsValueForKey:@"CodingsKey"] & 1) == 0)
    {
      id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
      int v13 = (void *)[v12 initWithDomain:*MEMORY[0x1E4F281F8] code:4865 userInfo:0];
      [v4 failWithError:v13];

      uint64_t v11 = 0;
      goto LABEL_6;
    }
    id v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForSetOf:", objc_opt_class());
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"CodingsKey"];
    codings = v5->_codings;
    v5->_codings = (NSSet *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TextKey"];
    text = v5->_text;
    v5->_text = (NSString *)v9;
  }
  uint64_t v11 = v5;
LABEL_6:

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  codings = self->_codings;
  id v5 = a3;
  [v5 encodeObject:codings forKey:@"CodingsKey"];
  [v5 encodeObject:self->_text forKey:@"TextKey"];
}

- (NSString)text
{
  return self->_text;
}

- (NSSet)codings
{
  return self->_codings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codings, 0);

  objc_storeStrong((id *)&self->_text, 0);
}

@end