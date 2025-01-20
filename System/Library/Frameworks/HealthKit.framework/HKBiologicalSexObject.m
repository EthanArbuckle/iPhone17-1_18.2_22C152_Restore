@interface HKBiologicalSexObject
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKBiologicalSex)biologicalSex;
- (HKBiologicalSexObject)initWithCoder:(id)a3;
- (id)_initWithBiologicalSex:(int64_t)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKBiologicalSexObject

- (id)_initWithBiologicalSex:(int64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)HKBiologicalSexObject;
  v4 = [(HKBiologicalSexObject *)&v10 init];
  if (v4)
  {
    v5 = +[HKObjectType characteristicTypeForIdentifier:@"HKCharacteristicTypeIdentifierBiologicalSex"];
    v6 = [NSNumber numberWithInteger:a3];
    int v7 = [v5 _validateCharacteristic:v6 error:0];

    if (v7) {
      int64_t v8 = a3;
    }
    else {
      int64_t v8 = 0;
    }
    v4->_biologicalSex = v8;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKBiologicalSexObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKBiologicalSexObject;
  v5 = [(HKBiologicalSexObject *)&v12 init];
  if (v5)
  {
    v6 = +[HKObjectType characteristicTypeForIdentifier:@"HKCharacteristicTypeIdentifierBiologicalSex"];
    uint64_t v7 = [v4 decodeIntegerForKey:@"biologicalSex"];
    int64_t v8 = [NSNumber numberWithInteger:v7];
    int v9 = [v6 _validateCharacteristic:v8 error:0];

    if (!v9)
    {

      objc_super v10 = 0;
      goto LABEL_6;
    }
    v5->_biologicalSex = v7;
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
    int64_t biologicalSex = self->_biologicalSex;
    BOOL v6 = biologicalSex == [v4 biologicalSex];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return self->_biologicalSex;
}

- (HKBiologicalSex)biologicalSex
{
  return self->_biologicalSex;
}

@end