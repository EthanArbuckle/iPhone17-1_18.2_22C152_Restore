@interface HKMedicationComponent
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKMedicationComponent)init;
- (HKMedicationComponent)initWithCoder:(id)a3;
- (HKMedicationComponent)initWithComponentForm:(int64_t)a3 ingredients:(id)a4;
- (NSSet)ingredients;
- (int64_t)componentForm;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKMedicationComponent

- (HKMedicationComponent)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKMedicationComponent)initWithComponentForm:(int64_t)a3 ingredients:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKMedicationComponent;
  v7 = [(HKMedicationComponent *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_componentForm = a3;
    uint64_t v9 = [v6 copy];
    ingredients = v8->_ingredients;
    v8->_ingredients = (NSSet *)v9;
  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HKMedicationComponent *)a3;
  if (self == v4)
  {
    BOOL v15 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [(HKMedicationComponent *)v5 componentForm];
      if (v6 == [(HKMedicationComponent *)self componentForm])
      {
        v7 = [(HKMedicationComponent *)v5 ingredients];
        uint64_t v8 = [(HKMedicationComponent *)self ingredients];
        if (v7 == (void *)v8)
        {

          goto LABEL_11;
        }
        uint64_t v9 = (void *)v8;
        uint64_t v10 = [(HKMedicationComponent *)self ingredients];
        if (v10)
        {
          v11 = (void *)v10;
          objc_super v12 = [(HKMedicationComponent *)v5 ingredients];
          v13 = [(HKMedicationComponent *)self ingredients];
          char v14 = [v12 isEqualToSet:v13];

          if ((v14 & 1) == 0) {
            goto LABEL_13;
          }
LABEL_11:
          BOOL v15 = 1;
LABEL_14:

          goto LABEL_15;
        }
      }
LABEL_13:
      BOOL v15 = 0;
      goto LABEL_14;
    }
    BOOL v15 = 0;
  }
LABEL_15:

  return v15;
}

- (unint64_t)hash
{
  int64_t componentForm = self->_componentForm;
  return [(NSSet *)self->_ingredients hash] ^ componentForm;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKMedicationComponent)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKMedicationComponent;
  v5 = [(HKMedicationComponent *)&v10 init];
  if (v5)
  {
    v5->_int64_t componentForm = [v4 decodeIntegerForKey:@"Form"];
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForSetOf:", objc_opt_class());
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"Ingredients"];
    ingredients = v5->_ingredients;
    v5->_ingredients = (NSSet *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t componentForm = self->_componentForm;
  id v5 = a3;
  [v5 encodeInteger:componentForm forKey:@"Form"];
  [v5 encodeObject:self->_ingredients forKey:@"Ingredients"];
}

- (int64_t)componentForm
{
  return self->_componentForm;
}

- (NSSet)ingredients
{
  return self->_ingredients;
}

- (void).cxx_destruct
{
}

@end