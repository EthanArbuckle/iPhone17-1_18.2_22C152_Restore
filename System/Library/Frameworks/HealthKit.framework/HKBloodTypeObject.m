@interface HKBloodTypeObject
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKBloodType)bloodType;
- (HKBloodTypeObject)initWithCoder:(id)a3;
- (id)_initWithBloodType:(int64_t)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKBloodTypeObject

- (id)_initWithBloodType:(int64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)HKBloodTypeObject;
  v4 = [(HKBloodTypeObject *)&v10 init];
  if (v4)
  {
    v5 = +[HKObjectType characteristicTypeForIdentifier:@"HKCharacteristicTypeIdentifierBloodType"];
    v6 = [NSNumber numberWithInteger:a3];
    int v7 = [v5 _validateCharacteristic:v6 error:0];

    if (v7) {
      int64_t v8 = a3;
    }
    else {
      int64_t v8 = 0;
    }
    v4->_bloodType = v8;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKBloodTypeObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKBloodTypeObject;
  v5 = [(HKBloodTypeObject *)&v12 init];
  if (v5)
  {
    v6 = +[HKObjectType characteristicTypeForIdentifier:@"HKCharacteristicTypeIdentifierBloodType"];
    uint64_t v7 = [v4 decodeIntegerForKey:@"bloodType"];
    int64_t v8 = [NSNumber numberWithInteger:v7];
    int v9 = [v6 _validateCharacteristic:v8 error:0];

    if (!v9)
    {

      objc_super v10 = 0;
      goto LABEL_6;
    }
    v5->_bloodType = v7;
  }
  objc_super v10 = v5;
LABEL_6:

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int64_t bloodType = self->_bloodType;
    BOOL v6 = bloodType == [v4 bloodType];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return self->_bloodType;
}

- (HKBloodType)bloodType
{
  return self->_bloodType;
}

@end