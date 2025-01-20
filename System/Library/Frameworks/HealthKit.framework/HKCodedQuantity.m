@interface HKCodedQuantity
+ (BOOL)supportsSecureCoding;
+ (HKCodedQuantity)codedQuantityWithValue:(id)a3 comparatorCoding:(id)a4 unitCoding:(id)a5;
+ (HKCodedQuantity)codedQuantityWithValue:(id)a3 unitCoding:(id)a4;
+ (id)_numberFormatter;
- (BOOL)isEqual:(id)a3;
- (HKCodedQuantity)init;
- (HKCodedQuantity)initWithCoder:(id)a3;
- (HKCodedQuantity)initWithRawValue:(id)a3 comparatorCoding:(id)a4 unitCoding:(id)a5;
- (HKMedicalCoding)comparatorCoding;
- (HKMedicalCoding)unitCoding;
- (NSNumber)numberValue;
- (NSString)localizedValue;
- (NSString)rawValue;
- (double)doubleValue;
- (id)description;
- (id)quantityRepresentationWithUCUMConverter:(id)a3 error:(id *)a4;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKCodedQuantity

+ (HKCodedQuantity)codedQuantityWithValue:(id)a3 comparatorCoding:(id)a4 unitCoding:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) initWithRawValue:v10 comparatorCoding:v9 unitCoding:v8];

  return (HKCodedQuantity *)v11;
}

+ (HKCodedQuantity)codedQuantityWithValue:(id)a3 unitCoding:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithRawValue:v7 comparatorCoding:0 unitCoding:v6];

  return (HKCodedQuantity *)v8;
}

- (HKCodedQuantity)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKCodedQuantity)initWithRawValue:(id)a3 comparatorCoding:(id)a4 unitCoding:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"HKCodedQuantity.m", 48, @"Invalid parameter not satisfying: %@", @"rawValue" object file lineNumber description];
  }
  v21.receiver = self;
  v21.super_class = (Class)HKCodedQuantity;
  v12 = [(HKCodedQuantity *)&v21 init];
  if (v12)
  {
    uint64_t v13 = [v9 copy];
    rawValue = v12->_rawValue;
    v12->_rawValue = (NSString *)v13;

    uint64_t v15 = [v10 copy];
    comparatorCoding = v12->_comparatorCoding;
    v12->_comparatorCoding = (HKMedicalCoding *)v15;

    uint64_t v17 = [v11 copy];
    unitCoding = v12->_unitCoding;
    v12->_unitCoding = (HKMedicalCoding *)v17;
  }
  return v12;
}

- (double)doubleValue
{
  v2 = [(HKCodedQuantity *)self rawValue];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (NSString)localizedValue
{
  double v3 = [(HKCodedQuantity *)self numberValue];
  if (v3)
  {
    double v4 = [(id)objc_opt_class() _numberFormatter];
    v5 = [v4 stringFromNumber:v3];
  }
  else
  {
    v5 = [(HKCodedQuantity *)self rawValue];
  }

  return (NSString *)v5;
}

- (NSNumber)numberValue
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  double v3 = [(HKCodedQuantity *)self rawValue];
  double v4 = [v3 dataUsingEncoding:4];
  v5 = [v2 JSONObjectWithData:v4 options:4 error:0];

  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  return (NSNumber *)v6;
}

+ (id)_numberFormatter
{
  if (_numberFormatter_onceToken != -1) {
    dispatch_once(&_numberFormatter_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)_numberFormatter_numberFormatter;

  return v2;
}

uint64_t __35__HKCodedQuantity__numberFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  v1 = (void *)_numberFormatter_numberFormatter;
  _numberFormatter_numberFormatter = (uint64_t)v0;

  [(id)_numberFormatter_numberFormatter setMaximumSignificantDigits:8];
  v2 = (void *)_numberFormatter_numberFormatter;

  return [v2 setRoundingMode:6];
}

- (id)description
{
  double v3 = NSString;
  double v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(HKCodedQuantity *)self rawValue];
  id v7 = [(HKCodedQuantity *)self comparatorCoding];
  id v8 = [(HKCodedQuantity *)self unitCoding];
  id v9 = [v3 stringWithFormat:@"<%@:%p value = %@, comparatorCoding = %@, unitCoding = %@>", v5, self, v6, v7, v8];

  return v9;
}

- (id)quantityRepresentationWithUCUMConverter:(id)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (self->_comparatorCoding)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"Unable to create HKQuantity from a coded quantity that has a comparator: %@", self);
    id v7 = 0;
    goto LABEL_23;
  }
  unitCoding = self->_unitCoding;
  if (!unitCoding)
  {
    v23 = +[HKUnit _nullUnit];
    [(HKCodedQuantity *)self doubleValue];
    id v7 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v23);

    goto LABEL_23;
  }
  id v9 = [(HKMedicalCoding *)unitCoding displayString];
  id v10 = [(HKMedicalCoding *)self->_unitCoding code];
  if (v10)
  {
    id v11 = [(HKMedicalCoding *)self->_unitCoding codingSystem];
    v12 = +[HKMedicalCodingSystem UCUMSystem];
    int v13 = [v11 isEqual:v12];

    if (v13)
    {
      if (v6)
      {
        v14 = [(HKMedicalCoding *)self->_unitCoding code];
        uint64_t v15 = [v6 hkUnitNameForUCUMUnitCode:v14];

        id v9 = (void *)v15;
        if (v15) {
          goto LABEL_20;
        }
        _HKInitializeLogging();
        v16 = (void *)HKLogHealthRecords;
        if (os_log_type_enabled((os_log_t)HKLogHealthRecords, OS_LOG_TYPE_INFO))
        {
          uint64_t v17 = self->_unitCoding;
          v18 = v16;
          v19 = [(HKMedicalCoding *)v17 code];
          *(_DWORD *)buf = 138543362;
          v28 = v19;
          _os_log_impl(&dword_19C023000, v18, OS_LOG_TYPE_INFO, "Got a UCUM unit code the UCUM converter doesn't know: \"%{public}@\"", buf, 0xCu);
        }
        v20 = [(HKMedicalCoding *)self->_unitCoding displayString];
        objc_super v21 = v20;
        if (v20)
        {
          id v22 = v20;
        }
        else
        {
          id v22 = [(HKMedicalCoding *)self->_unitCoding code];
        }
        id v9 = v22;
      }
      else
      {
        _HKInitializeLogging();
        v24 = HKLogHealthRecords;
        if (os_log_type_enabled((os_log_t)HKLogHealthRecords, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19C023000, v24, OS_LOG_TYPE_INFO, "Got a UCUM unit code but you didn't provide a UCUM code converter. Will prefer unitCoding.displayString to unitCoding.code.", buf, 2u);
        }
        if (v9) {
          goto LABEL_20;
        }
        id v9 = [(HKMedicalCoding *)self->_unitCoding code];
      }
    }
  }
  if (!v9)
  {
    id v7 = 0;
    goto LABEL_22;
  }
LABEL_20:
  v25 = +[HKUnit unitFromString:v9];
  [(HKCodedQuantity *)self doubleValue];
  id v7 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v25);

LABEL_22:
LABEL_23:

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKCodedQuantity)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKCodedQuantity;
  v5 = [(HKCodedQuantity *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Value"];
    rawValue = v5->_rawValue;
    v5->_rawValue = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ComparatorCoding"];
    comparatorCoding = v5->_comparatorCoding;
    v5->_comparatorCoding = (HKMedicalCoding *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UnitCoding"];
    unitCoding = v5->_unitCoding;
    v5->_unitCoding = (HKMedicalCoding *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  rawValue = self->_rawValue;
  id v5 = a3;
  [v5 encodeObject:rawValue forKey:@"Value"];
  [v5 encodeObject:self->_comparatorCoding forKey:@"ComparatorCoding"];
  [v5 encodeObject:self->_unitCoding forKey:@"UnitCoding"];
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_rawValue hash];
  unint64_t v4 = [(HKMedicalCoding *)self->_comparatorCoding hash] ^ v3;
  return v4 ^ [(HKMedicalCoding *)self->_unitCoding hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (HKCodedQuantity *)a3;
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
      rawValue = self->_rawValue;
      uint64_t v7 = [(HKCodedQuantity *)v5 rawValue];
      if (rawValue == (NSString *)v7)
      {
      }
      else
      {
        uint64_t v8 = (void *)v7;
        uint64_t v9 = [(HKCodedQuantity *)v5 rawValue];
        if (!v9) {
          goto LABEL_19;
        }
        uint64_t v10 = (void *)v9;
        id v11 = self->_rawValue;
        v12 = [(HKCodedQuantity *)v5 rawValue];
        LODWORD(v11) = [(NSString *)v11 isEqualToString:v12];

        if (!v11) {
          goto LABEL_20;
        }
      }
      comparatorCoding = self->_comparatorCoding;
      uint64_t v15 = [(HKCodedQuantity *)v5 comparatorCoding];
      if (comparatorCoding == (HKMedicalCoding *)v15)
      {
      }
      else
      {
        uint64_t v8 = (void *)v15;
        uint64_t v16 = [(HKCodedQuantity *)v5 comparatorCoding];
        if (!v16) {
          goto LABEL_19;
        }
        uint64_t v17 = (void *)v16;
        v18 = self->_comparatorCoding;
        v19 = [(HKCodedQuantity *)v5 comparatorCoding];
        LODWORD(v18) = [(HKMedicalCoding *)v18 isEqual:v19];

        if (!v18) {
          goto LABEL_20;
        }
      }
      unitCoding = self->_unitCoding;
      uint64_t v21 = [(HKCodedQuantity *)v5 unitCoding];
      if (unitCoding == (HKMedicalCoding *)v21)
      {

LABEL_24:
        BOOL v13 = 1;
        goto LABEL_21;
      }
      uint64_t v8 = (void *)v21;
      uint64_t v22 = [(HKCodedQuantity *)v5 unitCoding];
      if (v22)
      {
        v23 = (void *)v22;
        v24 = self->_unitCoding;
        v25 = [(HKCodedQuantity *)v5 unitCoding];
        LOBYTE(v24) = [(HKMedicalCoding *)v24 isEqual:v25];

        if (v24) {
          goto LABEL_24;
        }
LABEL_20:
        BOOL v13 = 0;
LABEL_21:

        goto LABEL_22;
      }
LABEL_19:

      goto LABEL_20;
    }
    BOOL v13 = 0;
  }
LABEL_22:

  return v13;
}

- (NSString)rawValue
{
  return self->_rawValue;
}

- (HKMedicalCoding)comparatorCoding
{
  return self->_comparatorCoding;
}

- (HKMedicalCoding)unitCoding
{
  return self->_unitCoding;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitCoding, 0);
  objc_storeStrong((id *)&self->_comparatorCoding, 0);

  objc_storeStrong((id *)&self->_rawValue, 0);
}

@end