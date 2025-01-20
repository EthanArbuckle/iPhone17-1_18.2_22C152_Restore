@interface HKWheelchairUseObject
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKWheelchairUse)wheelchairUse;
- (HKWheelchairUseObject)initWithCoder:(id)a3;
- (id)_initWithWheelchairUse:(int64_t)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKWheelchairUseObject

- (id)_initWithWheelchairUse:(int64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)HKWheelchairUseObject;
  v4 = [(HKWheelchairUseObject *)&v10 init];
  if (v4)
  {
    v5 = +[HKObjectType characteristicTypeForIdentifier:@"HKCharacteristicTypeIdentifierWheelchairUse"];
    v6 = [NSNumber numberWithInteger:a3];
    int v7 = [v5 _validateCharacteristic:v6 error:0];

    if (v7) {
      int64_t v8 = a3;
    }
    else {
      int64_t v8 = 0;
    }
    v4->_wheelchairUse = v8;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKWheelchairUseObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKWheelchairUseObject;
  v5 = [(HKWheelchairUseObject *)&v12 init];
  if (v5)
  {
    v6 = +[HKObjectType characteristicTypeForIdentifier:@"HKCharacteristicTypeIdentifierWheelchairUse"];
    uint64_t v7 = [v4 decodeIntegerForKey:@"wheelchairUse"];
    int64_t v8 = [NSNumber numberWithInteger:v7];
    int v9 = [v6 _validateCharacteristic:v8 error:0];

    if (!v9)
    {

      objc_super v10 = 0;
      goto LABEL_6;
    }
    v5->_wheelchairUse = v7;
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
    int64_t wheelchairUse = self->_wheelchairUse;
    BOOL v6 = wheelchairUse == [v4 wheelchairUse];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return self->_wheelchairUse;
}

- (HKWheelchairUse)wheelchairUse
{
  return self->_wheelchairUse;
}

@end