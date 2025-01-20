@interface HKReferenceRange
+ (BOOL)supportsSecureCoding;
+ (id)referenceRangeWithIdentifier:(id)a3 inspectableValueRange:(id)a4;
+ (id)referenceRangeWithIdentifier:(id)a3 maxValue:(id)a4;
+ (id)referenceRangeWithIdentifier:(id)a3 minValue:(id)a4;
+ (id)referenceRangeWithIdentifier:(id)a3 minValue:(id)a4 maxValue:(id)a5;
- (BOOL)isEqual:(id)a3;
- (HKInspectableValueCollection)valueRange;
- (HKReferenceRange)initWithCoder:(id)a3;
- (NSString)referenceRangeIdentifier;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKReferenceRange

+ (id)referenceRangeWithIdentifier:(id)a3 minValue:(id)a4 maxValue:(id)a5
{
  v7 = (NSString *)a3;
  id v8 = a5;
  id v9 = a4;
  v10 = objc_alloc_init(HKReferenceRange);
  referenceRangeIdentifier = v10->_referenceRangeIdentifier;
  v10->_referenceRangeIdentifier = v7;
  v12 = v7;

  v13 = +[HKInspectableValue inspectableValueWithCodedQuantity:v9];

  v14 = +[HKInspectableValue inspectableValueWithCodedQuantity:v8];

  uint64_t v15 = +[HKInspectableValueCollection inspectableValueCollectionRangeWithMin:v13 max:v14];
  valueRange = v10->_valueRange;
  v10->_valueRange = (HKInspectableValueCollection *)v15;

  return v10;
}

+ (id)referenceRangeWithIdentifier:(id)a3 minValue:(id)a4
{
  v5 = (NSString *)a3;
  id v6 = a4;
  v7 = objc_alloc_init(HKReferenceRange);
  referenceRangeIdentifier = v7->_referenceRangeIdentifier;
  v7->_referenceRangeIdentifier = v5;
  id v9 = v5;

  v10 = +[HKInspectableValue inspectableValueWithCodedQuantity:v6];

  uint64_t v11 = +[HKInspectableValueCollection inspectableValueCollectionRangeWithMin:v10];
  valueRange = v7->_valueRange;
  v7->_valueRange = (HKInspectableValueCollection *)v11;

  return v7;
}

+ (id)referenceRangeWithIdentifier:(id)a3 maxValue:(id)a4
{
  v5 = (NSString *)a3;
  id v6 = a4;
  v7 = objc_alloc_init(HKReferenceRange);
  referenceRangeIdentifier = v7->_referenceRangeIdentifier;
  v7->_referenceRangeIdentifier = v5;
  id v9 = v5;

  v10 = +[HKInspectableValue inspectableValueWithCodedQuantity:v6];

  uint64_t v11 = +[HKInspectableValueCollection inspectableValueCollectionRangeWithMax:v10];
  valueRange = v7->_valueRange;
  v7->_valueRange = (HKInspectableValueCollection *)v11;

  return v7;
}

+ (id)referenceRangeWithIdentifier:(id)a3 inspectableValueRange:(id)a4
{
  v7 = (NSString *)a3;
  id v8 = (HKInspectableValueCollection *)a4;
  id v9 = objc_alloc_init(HKReferenceRange);
  if ([(HKInspectableValueCollection *)v8 collectionType] != 1)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:a1 file:@"HKReferenceRange.m" lineNumber:55 description:@"Only range collection should be used to create a reference range"];
  }
  referenceRangeIdentifier = v9->_referenceRangeIdentifier;
  v9->_referenceRangeIdentifier = v7;
  uint64_t v11 = v7;

  valueRange = v9->_valueRange;
  v9->_valueRange = v8;

  return v9;
}

- (HKReferenceRange)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKReferenceRange;
  v5 = [(HKReferenceRange *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"referenceRangeIdentifier"];
    referenceRangeIdentifier = v5->_referenceRangeIdentifier;
    v5->_referenceRangeIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"valueRange"];
    valueRange = v5->_valueRange;
    v5->_valueRange = (HKInspectableValueCollection *)v8;
  }
  return v5;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [(HKReferenceRange *)self referenceRangeIdentifier];
  v7 = [(HKReferenceRange *)self valueRange];
  uint64_t v8 = [v7 min];
  id v9 = [(HKReferenceRange *)self valueRange];
  v10 = [v9 max];
  objc_super v11 = [v3 stringWithFormat:@"<%@:%p referenceRangeIdentifier = %@, minValue = %@, maxValue = %@>", v5, self, v6, v8, v10, 0];

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HKReferenceRange *)a3;
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
      uint64_t v6 = [(HKReferenceRange *)v5 referenceRangeIdentifier];
      uint64_t v7 = [(HKReferenceRange *)self referenceRangeIdentifier];
      if (v6 == (void *)v7)
      {
      }
      else
      {
        uint64_t v8 = (void *)v7;
        uint64_t v9 = [(HKReferenceRange *)self referenceRangeIdentifier];
        if (!v9) {
          goto LABEL_14;
        }
        v10 = (void *)v9;
        objc_super v11 = [(HKReferenceRange *)v5 referenceRangeIdentifier];
        v12 = [(HKReferenceRange *)self referenceRangeIdentifier];
        int v13 = [v11 isEqual:v12];

        if (!v13) {
          goto LABEL_15;
        }
      }
      uint64_t v6 = [(HKReferenceRange *)v5 valueRange];
      uint64_t v15 = [(HKReferenceRange *)self valueRange];
      if (v6 == (void *)v15)
      {

LABEL_17:
        BOOL v14 = 1;
        goto LABEL_18;
      }
      uint64_t v8 = (void *)v15;
      uint64_t v16 = [(HKReferenceRange *)self valueRange];
      if (v16)
      {
        v17 = (void *)v16;
        v18 = [(HKReferenceRange *)v5 valueRange];
        v19 = [(HKReferenceRange *)self valueRange];
        char v20 = [v18 isEqual:v19];

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
  v9.receiver = self;
  v9.super_class = (Class)HKReferenceRange;
  unint64_t v3 = [(HKReferenceRange *)&v9 hash];
  id v4 = [(HKReferenceRange *)self referenceRangeIdentifier];
  uint64_t v5 = [v4 hash];
  uint64_t v6 = [(HKReferenceRange *)self valueRange];
  unint64_t v7 = v5 ^ [v6 hash] ^ v3;

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  referenceRangeIdentifier = self->_referenceRangeIdentifier;
  id v5 = a3;
  [v5 encodeObject:referenceRangeIdentifier forKey:@"referenceRangeIdentifier"];
  [v5 encodeObject:self->_valueRange forKey:@"valueRange"];
}

- (NSString)referenceRangeIdentifier
{
  return self->_referenceRangeIdentifier;
}

- (HKInspectableValueCollection)valueRange
{
  return self->_valueRange;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueRange, 0);

  objc_storeStrong((id *)&self->_referenceRangeIdentifier, 0);
}

@end