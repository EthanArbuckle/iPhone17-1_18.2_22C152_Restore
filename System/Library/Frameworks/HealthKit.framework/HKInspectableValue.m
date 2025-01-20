@interface HKInspectableValue
+ (BOOL)supportsSecureCoding;
+ (HKInspectableValue)inspectableValueWithBoolean:(id)a3;
+ (HKInspectableValue)inspectableValueWithCodedQuantity:(id)a3;
+ (HKInspectableValue)inspectableValueWithCodedValueCollection:(id)a3;
+ (HKInspectableValue)inspectableValueWithDataAbsentReasonCodings:(id)a3;
+ (HKInspectableValue)inspectableValueWithDateComponents:(id)a3;
+ (HKInspectableValue)inspectableValueWithInteger:(id)a3;
+ (HKInspectableValue)inspectableValueWithMedicalCodings:(id)a3;
+ (HKInspectableValue)inspectableValueWithMedicalDate:(id)a3;
+ (HKInspectableValue)inspectableValueWithMedicalDateInterval:(id)a3;
+ (HKInspectableValue)inspectableValueWithNull;
+ (HKInspectableValue)inspectableValueWithRatio:(id)a3;
+ (HKInspectableValue)inspectableValueWithString:(id)a3;
+ (HKInspectableValue)inspectableValueWithValueType:(int64_t)a3 value:(id)a4;
+ (id)indexableKeyPathsWithPrefix:(id)a3;
- (BOOL)applyConcepts:(id)a3 forKeyPath:(id)a4 error:(id *)a5;
- (BOOL)isEqual:(id)a3;
- (HKCodedQuantity)codedQuantityValue;
- (HKCodedValueCollection)codedValueCollection;
- (HKConcept)dataAbsentReason;
- (HKConcept)ontologyConcept;
- (HKInspectableValue)init;
- (HKInspectableValue)initWithCoder:(id)a3;
- (HKMedicalDate)medicalDateValue;
- (HKMedicalDateInterval)medicalDateIntervalValue;
- (HKRatioValue)ratioValue;
- (HKUCUMUnitDisplayConverter)converter;
- (NSArray)dataAbsentReasonCodings;
- (NSArray)medicalCodings;
- (NSDate)dateValueForUTC;
- (NSDateComponents)dateComponentsValue;
- (NSNumber)BOOLeanValue;
- (NSNumber)inspectableIntegerValue;
- (NSObject)value;
- (NSString)description;
- (NSString)stringValue;
- (NSString)unitString;
- (id)_initWithValueType:(int64_t)a3 value:(id)a4;
- (id)_unitStringForCodedValueCollection:(id)a3;
- (id)codingsForKeyPath:(id)a3 error:(id *)a4;
- (int64_t)valueType;
- (unint64_t)hash;
- (void)_assertValueClass:(Class)a3;
- (void)_assertValueType;
- (void)_setDataAbsentReason:(id)a3;
- (void)_setOntologyConcept:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKInspectableValue

+ (id)indexableKeyPathsWithPrefix:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = +[HKCodedValueCollection indexableKeyPathsWithPrefix:@"codedValueCollection"];
  v5 = [v4 firstObject];

  if (v5)
  {
    v14 = @"medicalCodings";
    v15 = @"dataAbsentReasonCodings";
    v16 = v5;
    v6 = (void *)MEMORY[0x1E4F1C978];
    v7 = &v14;
    uint64_t v8 = 3;
  }
  else
  {
    v12 = @"medicalCodings";
    v13 = @"dataAbsentReasonCodings";
    v6 = (void *)MEMORY[0x1E4F1C978];
    v7 = &v12;
    uint64_t v8 = 2;
  }
  v9 = objc_msgSend(v6, "arrayWithObjects:count:", v7, v8, v12, v13, v14, v15, v16, v17);
  v10 = +[HKConceptIndexUtilities keyPaths:v9 prefix:v3];

  return v10;
}

- (HKInspectableValue)init
{
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

+ (HKInspectableValue)inspectableValueWithValueType:(int64_t)a3 value:(id)a4
{
  id v6 = a4;
  v7 = (void *)[objc_alloc((Class)a1) _initWithValueType:a3 value:v6];

  return (HKInspectableValue *)v7;
}

+ (HKInspectableValue)inspectableValueWithString:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) _initWithValueType:0 value:v4];

  return (HKInspectableValue *)v5;
}

+ (HKInspectableValue)inspectableValueWithCodedQuantity:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) _initWithValueType:6 value:v4];

  return (HKInspectableValue *)v5;
}

+ (HKInspectableValue)inspectableValueWithRatio:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) _initWithValueType:1 value:v4];

  return (HKInspectableValue *)v5;
}

+ (HKInspectableValue)inspectableValueWithMedicalDate:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) _initWithValueType:2 value:v4];

  return (HKInspectableValue *)v5;
}

+ (HKInspectableValue)inspectableValueWithMedicalDateInterval:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) _initWithValueType:3 value:v4];

  return (HKInspectableValue *)v5;
}

+ (HKInspectableValue)inspectableValueWithDateComponents:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) _initWithValueType:4 value:v4];

  return (HKInspectableValue *)v5;
}

+ (HKInspectableValue)inspectableValueWithInteger:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) _initWithValueType:10 value:v4];

  return (HKInspectableValue *)v5;
}

+ (HKInspectableValue)inspectableValueWithBoolean:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) _initWithValueType:11 value:v4];

  return (HKInspectableValue *)v5;
}

+ (HKInspectableValue)inspectableValueWithNull
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__HKInspectableValue_inspectableValueWithNull__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (inspectableValueWithNull_onceToken != -1) {
    dispatch_once(&inspectableValueWithNull_onceToken, block);
  }
  v2 = (void *)inspectableValueWithNull__null;

  return (HKInspectableValue *)v2;
}

void __46__HKInspectableValue_inspectableValueWithNull__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc(*(Class *)(a1 + 32));
  id v4 = [MEMORY[0x1E4F1CA98] null];
  uint64_t v2 = [v1 _initWithValueType:5 value:v4];
  id v3 = (void *)inspectableValueWithNull__null;
  inspectableValueWithNull__null = v2;
}

+ (HKInspectableValue)inspectableValueWithMedicalCodings:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) _initWithValueType:7 value:v4];

  return (HKInspectableValue *)v5;
}

+ (HKInspectableValue)inspectableValueWithCodedValueCollection:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) _initWithValueType:8 value:v4];

  return (HKInspectableValue *)v5;
}

+ (HKInspectableValue)inspectableValueWithDataAbsentReasonCodings:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) _initWithValueType:9 value:v4];

  return (HKInspectableValue *)v5;
}

- (id)_initWithValueType:(int64_t)a3 value:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKInspectableValue;
  v7 = [(HKInspectableValue *)&v12 init];
  uint64_t v8 = v7;
  if (v7)
  {
    v7->_valueType = a3;
    uint64_t v9 = [v6 copy];
    value = v8->_value;
    v8->_value = v9;

    [(HKInspectableValue *)v8 _assertValueType];
  }

  return v8;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"%li: %@", self->_valueType, self->_value];
}

- (NSObject)value
{
  return self->_value;
}

- (NSString)stringValue
{
  if ([(HKInspectableValue *)self valueType])
  {
    id v3 = 0;
  }
  else
  {
    id v3 = [(HKInspectableValue *)self value];
  }

  return (NSString *)v3;
}

- (HKCodedQuantity)codedQuantityValue
{
  if ([(HKInspectableValue *)self valueType] == 6)
  {
    id v3 = [(HKInspectableValue *)self value];
  }
  else
  {
    id v3 = 0;
  }

  return (HKCodedQuantity *)v3;
}

- (HKRatioValue)ratioValue
{
  if ([(HKInspectableValue *)self valueType] == 1)
  {
    id v3 = [(HKInspectableValue *)self value];
  }
  else
  {
    id v3 = 0;
  }

  return (HKRatioValue *)v3;
}

- (HKMedicalDate)medicalDateValue
{
  if ([(HKInspectableValue *)self valueType] == 2)
  {
    id v3 = [(HKInspectableValue *)self value];
  }
  else
  {
    id v3 = 0;
  }

  return (HKMedicalDate *)v3;
}

- (HKMedicalDateInterval)medicalDateIntervalValue
{
  if ([(HKInspectableValue *)self valueType] == 3)
  {
    id v3 = [(HKInspectableValue *)self value];
  }
  else
  {
    id v3 = 0;
  }

  return (HKMedicalDateInterval *)v3;
}

- (NSDateComponents)dateComponentsValue
{
  if ([(HKInspectableValue *)self valueType] == 4)
  {
    id v3 = [(HKInspectableValue *)self value];
  }
  else
  {
    id v3 = 0;
  }

  return (NSDateComponents *)v3;
}

- (NSArray)medicalCodings
{
  if ([(HKInspectableValue *)self valueType] == 7)
  {
    id v3 = [(HKInspectableValue *)self value];
  }
  else
  {
    id v3 = 0;
  }

  return (NSArray *)v3;
}

- (HKCodedValueCollection)codedValueCollection
{
  if ([(HKInspectableValue *)self valueType] == 8)
  {
    id v3 = [(HKInspectableValue *)self value];
  }
  else
  {
    id v3 = 0;
  }

  return (HKCodedValueCollection *)v3;
}

- (NSArray)dataAbsentReasonCodings
{
  if ([(HKInspectableValue *)self valueType] == 9)
  {
    id v3 = [(HKInspectableValue *)self value];
  }
  else
  {
    id v3 = 0;
  }

  return (NSArray *)v3;
}

- (NSNumber)inspectableIntegerValue
{
  if ([(HKInspectableValue *)self valueType] == 10)
  {
    id v3 = [(HKInspectableValue *)self value];
  }
  else
  {
    id v3 = 0;
  }

  return (NSNumber *)v3;
}

- (NSNumber)BOOLeanValue
{
  if ([(HKInspectableValue *)self valueType] == 11)
  {
    id v3 = [(HKInspectableValue *)self value];
  }
  else
  {
    id v3 = 0;
  }

  return (NSNumber *)v3;
}

- (NSDate)dateValueForUTC
{
  id v3 = [(HKInspectableValue *)self medicalDateValue];
  id v4 = v3;
  if (v3)
  {
    v5 = [v3 dateForUTC];
    goto LABEL_9;
  }
  id v6 = [(HKInspectableValue *)self medicalDateIntervalValue];
  v7 = [v6 startDate];

  if (v7)
  {
    uint64_t v8 = [v6 startDate];
LABEL_7:
    uint64_t v9 = v8;
    v5 = [v8 dateForUTC];

    goto LABEL_8;
  }
  v5 = [v6 endDate];

  if (v5)
  {
    uint64_t v8 = [v6 endDate];
    goto LABEL_7;
  }
LABEL_8:

LABEL_9:

  return (NSDate *)v5;
}

- (void)_setOntologyConcept:(id)a3
{
  id v5 = a3;
  id v9 = v5;
  if (!v5)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"HKInspectableValue.m", 330, @"Invalid parameter not satisfying: %@", @"ontologyConcept" object file lineNumber description];

    id v5 = 0;
  }
  id v6 = (HKConcept *)[v5 copy];
  ontologyConcept = self->_ontologyConcept;
  self->_ontologyConcept = v6;
}

- (void)_setDataAbsentReason:(id)a3
{
  id v5 = a3;
  id v9 = v5;
  if (!v5)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"HKInspectableValue.m", 335, @"Invalid parameter not satisfying: %@", @"dataAbsentReason" object file lineNumber description];

    id v5 = 0;
  }
  id v6 = (HKConcept *)[v5 copy];
  dataAbsentReason = self->_dataAbsentReason;
  self->_dataAbsentReason = v6;
}

- (HKUCUMUnitDisplayConverter)converter
{
  if (converter_onceToken != -1) {
    dispatch_once(&converter_onceToken, &__block_literal_global_46);
  }
  uint64_t v2 = (void *)converter_converter;

  return (HKUCUMUnitDisplayConverter *)v2;
}

uint64_t __31__HKInspectableValue_converter__block_invoke()
{
  converter_converter = objc_alloc_init(HKUCUMUnitDisplayConverter);

  return MEMORY[0x1F41817F8]();
}

- (NSString)unitString
{
  int64_t v3 = [(HKInspectableValue *)self valueType];
  if (v3 == 1)
  {
    id v6 = [(HKInspectableValue *)self ratioValue];
    id v4 = [v6 numerator];

    v7 = [v4 unitCoding];
    uint64_t v8 = [v7 code];
    id v9 = v8;
    if (v8)
    {
      id v5 = v8;
    }
    else
    {
      v13 = [v4 unitCoding];
      id v5 = [v13 displayString];
    }
    goto LABEL_14;
  }
  if (v3 == 6)
  {
    v10 = [(HKInspectableValue *)self codedQuantityValue];
    id v4 = [v10 unitCoding];

    v11 = [v4 code];
    v7 = v11;
    if (v11)
    {
      objc_super v12 = v11;
    }
    else
    {
      objc_super v12 = [v4 displayString];
    }
    id v5 = v12;
LABEL_14:

    goto LABEL_15;
  }
  if (v3 != 8)
  {
    id v5 = 0;
    goto LABEL_16;
  }
  id v4 = [(HKInspectableValue *)self codedValueCollection];
  id v5 = [(HKInspectableValue *)self _unitStringForCodedValueCollection:v4];
LABEL_15:

LABEL_16:
  if ([(__CFString *)v5 length])
  {
    v14 = [(HKInspectableValue *)self converter];
    uint64_t v15 = [v14 synonymForUCUMUnitString:v5];

    id v5 = (__CFString *)v15;
  }
  if (v5) {
    v16 = v5;
  }
  else {
    v16 = &stru_1EEC60288;
  }
  uint64_t v17 = v16;

  return v17;
}

- (HKConcept)ontologyConcept
{
  if ([(HKInspectableValue *)self valueType] == 7)
  {
    ontologyConcept = self->_ontologyConcept;
    id v4 = [(HKInspectableValue *)self medicalCodings];
    id v5 = +[HKMedicalCodingCollection collectionWithCodings:v4];
    id v6 = HKSafeConcept(ontologyConcept, v5);
  }
  else
  {
    id v6 = 0;
  }

  return (HKConcept *)v6;
}

- (HKConcept)dataAbsentReason
{
  if ([(HKInspectableValue *)self valueType] == 9)
  {
    dataAbsentReason = self->_dataAbsentReason;
    id v4 = [(HKInspectableValue *)self dataAbsentReasonCodings];
    id v5 = +[HKMedicalCodingCollection collectionWithCodings:v4];
    id v6 = HKSafeConcept(dataAbsentReason, v5);
  }
  else
  {
    id v6 = 0;
  }

  return (HKConcept *)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HKInspectableValue *)a3;
  if (v4 == self)
  {
    BOOL v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      int64_t valueType = self->_valueType;
      if (valueType == [(HKInspectableValue *)v5 valueType])
      {
        value = self->_value;
        uint64_t v8 = [(HKInspectableValue *)v5 value];
        if (value == v8)
        {

          goto LABEL_11;
        }
        id v9 = (void *)v8;
        uint64_t v10 = [(HKInspectableValue *)v5 value];
        if (v10)
        {
          v11 = (void *)v10;
          objc_super v12 = self->_value;
          v13 = [(HKInspectableValue *)v5 value];
          LOBYTE(v12) = [v12 isEqual:v13];

          if ((v12 & 1) == 0) {
            goto LABEL_13;
          }
LABEL_11:
          BOOL v14 = 1;
LABEL_14:

          goto LABEL_15;
        }
      }
LABEL_13:
      BOOL v14 = 0;
      goto LABEL_14;
    }
    BOOL v14 = 0;
  }
LABEL_15:

  return v14;
}

- (unint64_t)hash
{
  int64_t v3 = [(HKInspectableValue *)self valueType];
  id v4 = [(HKInspectableValue *)self value];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (void)_assertValueClass:(Class)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:@"HKInconsistentValueTypeException", @"Inconsistent value type found in inspectable value, have: %@, expect: %@", objc_opt_class(), a3 format];
  }
}

- (void)_assertValueType
{
  if (self->_valueType <= 0xBuLL)
  {
    uint64_t v3 = objc_opt_class();
    [(HKInspectableValue *)self _assertValueClass:v3];
  }
}

- (id)_unitStringForCodedValueCollection:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 codedValues];
  unint64_t v5 = [v4 firstObject];
  id v6 = [v5 value];
  v7 = [v6 unitString];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = objc_msgSend(v3, "codedValues", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = [*(id *)(*((void *)&v17 + 1) + 8 * i) value];
        BOOL v14 = [v13 unitString];

        LODWORD(v13) = [v14 isEqualToString:v7];
        if (!v13)
        {

          uint64_t v15 = &stru_1EEC60288;
          goto LABEL_11;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  uint64_t v15 = v7;
LABEL_11:

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKInspectableValue)initWithCoder:(id)a3
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HKInspectableValue;
  unint64_t v5 = [(HKInspectableValue *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeIntegerForKey:@"ValueTypeKey"];
    v5->_int64_t valueType = v6;
    switch(v6)
    {
      case 0:
      case 1:
      case 2:
      case 3:
      case 4:
      case 6:
      case 8:
      case 10:
      case 11:
        uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ValueKey"];
        value = v5->_value;
        v5->_value = v11;

        goto LABEL_6;
      case 5:
        v7 = +[HKInspectableValue inspectableValueWithNull];
        goto LABEL_9;
      case 7:
        uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
        v21[0] = objc_opt_class();
        v21[1] = objc_opt_class();
        uint64_t v9 = (void *)MEMORY[0x1E4F1C978];
        uint64_t v10 = v21;
        goto LABEL_13;
      case 9:
        uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
        v20[0] = objc_opt_class();
        v20[1] = objc_opt_class();
        uint64_t v9 = (void *)MEMORY[0x1E4F1C978];
        uint64_t v10 = v20;
LABEL_13:
        uint64_t v15 = [v9 arrayWithObjects:v10 count:2];
        v16 = [v8 setWithArray:v15];
        uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"ValueKey"];
        long long v18 = v5->_value;
        v5->_value = v17;

LABEL_6:
        if (v5->_value) {
          goto LABEL_7;
        }
        v13 = 0;
        goto LABEL_10;
      default:
LABEL_7:
        [(HKInspectableValue *)v5 _assertValueType];
        break;
    }
  }
  v7 = v5;
LABEL_9:
  v13 = v7;
LABEL_10:

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t valueType = self->_valueType;
  id v5 = a3;
  [v5 encodeInteger:valueType forKey:@"ValueTypeKey"];
  [v5 encodeObject:self->_value forKey:@"ValueKey"];
}

- (id)codingsForKeyPath:(id)a3 error:(id *)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = +[HKConceptIndexUtilities firstComponentForKeyPath:v6 error:a4];
  uint64_t v8 = v7;
  if (v7)
  {
    if ([v7 isEqualToString:@"dataAbsentReasonCodings"])
    {
      uint64_t v9 = [(HKInspectableValue *)self dataAbsentReasonCodings];

      if (v9)
      {
        uint64_t v10 = [(HKInspectableValue *)self dataAbsentReasonCodings];
        uint64_t v11 = +[HKMedicalCodingCollection collectionWithCodings:v10];
        objc_super v12 = +[HKIndexableObject indexableObjectWithObject:v11];
        v22[0] = v12;
        v13 = (void *)MEMORY[0x1E4F1C978];
        BOOL v14 = (void **)v22;
LABEL_8:
        v16 = [v13 arrayWithObjects:v14 count:1];

        goto LABEL_16;
      }
      goto LABEL_13;
    }
    if ([v8 isEqualToString:@"medicalCodings"])
    {
      uint64_t v15 = [(HKInspectableValue *)self medicalCodings];

      if (v15)
      {
        uint64_t v10 = [(HKInspectableValue *)self medicalCodings];
        uint64_t v11 = +[HKMedicalCodingCollection collectionWithCodings:v10];
        objc_super v12 = +[HKIndexableObject indexableObjectWithObject:v11];
        v21 = v12;
        v13 = (void *)MEMORY[0x1E4F1C978];
        BOOL v14 = &v21;
        goto LABEL_8;
      }
      goto LABEL_13;
    }
    if ([v8 isEqualToString:@"codedValueCollection"])
    {
      uint64_t v17 = [(HKInspectableValue *)self codedValueCollection];

      if (v17)
      {
        long long v18 = +[HKConceptIndexUtilities keyPathRemovingFirstComponentFromKeyPath:v6 error:a4];
        if (v18)
        {
          objc_super v19 = [(HKInspectableValue *)self codedValueCollection];
          v16 = [v19 codingsForKeyPath:v18 error:a4];
        }
        else
        {
          v16 = 0;
        }

        goto LABEL_16;
      }
LABEL_13:
      v16 = (void *)MEMORY[0x1E4F1CBF0];
      goto LABEL_16;
    }
    +[HKConceptIndexUtilities assignError:a4 forInvalidKeyPath:v6 inClass:objc_opt_class()];
  }
  v16 = 0;
LABEL_16:

  return v16;
}

- (BOOL)applyConcepts:(id)a3 forKeyPath:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = +[HKConceptIndexUtilities firstComponentForKeyPath:v9 error:a5];
  uint64_t v11 = v10;
  if (!v10) {
    goto LABEL_14;
  }
  if ([v10 isEqualToString:@"dataAbsentReasonCodings"])
  {
    uint64_t v12 = [v8 count];
    v13 = [(HKInspectableValue *)self dataAbsentReasonCodings];
    BOOL v14 = HKIndexableObjectCheckCardinalityForIndexRestore(v12, v13 != 0, (uint64_t)v9, (uint64_t)a5);

    if (v14)
    {
      uint64_t v15 = [v8 firstObject];
      v16 = [v15 object];
      uint64_t v17 = (HKConcept *)[v16 copy];
      dataAbsentReason = self->_dataAbsentReason;
      self->_dataAbsentReason = v17;
LABEL_8:

      char v23 = 1;
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  if ([v11 isEqualToString:@"medicalCodings"])
  {
    uint64_t v19 = [v8 count];
    long long v20 = [(HKInspectableValue *)self medicalCodings];
    BOOL v21 = HKIndexableObjectCheckCardinalityForIndexRestore(v19, v20 != 0, (uint64_t)v9, (uint64_t)a5);

    if (v21)
    {
      uint64_t v15 = [v8 firstObject];
      v16 = [v15 object];
      uint64_t v22 = (HKConcept *)[v16 copy];
      dataAbsentReason = self->_ontologyConcept;
      self->_ontologyConcept = v22;
      goto LABEL_8;
    }
LABEL_14:
    char v23 = 0;
    goto LABEL_15;
  }
  if (![v11 isEqualToString:@"codedValueCollection"])
  {
    +[HKConceptIndexUtilities assignError:a5 forInvalidKeyPath:v9 inClass:objc_opt_class()];
    goto LABEL_14;
  }
  v24 = +[HKConceptIndexUtilities keyPathRemovingFirstComponentFromKeyPath:v9 error:a5];
  if (v24)
  {
    v25 = [(HKInspectableValue *)self codedValueCollection];

    if (v25)
    {
      v26 = [(HKInspectableValue *)self codedValueCollection];
      char v23 = [v26 applyConcepts:v8 forKeyPath:v24 error:a5];
    }
    else
    {
      char v23 = HKIndexableObjectCheckCardinalityForIndexRestore([v8 count], 0, (uint64_t)v9, (uint64_t)a5);
    }
  }
  else
  {
    char v23 = 0;
  }

LABEL_15:
  return v23;
}

- (int64_t)valueType
{
  return self->_valueType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataAbsentReason, 0);
  objc_storeStrong((id *)&self->_ontologyConcept, 0);

  objc_storeStrong((id *)&self->_value, 0);
}

@end