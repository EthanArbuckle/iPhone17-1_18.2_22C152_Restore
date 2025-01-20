@interface HKCardioFitnessMedicationsUseObject
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)medicationsAreSet;
- (BOOL)takingBetaBlockers;
- (BOOL)takingCalciumChannelBlockers;
- (HKCardioFitnessMedicationsUseObject)initWithCoder:(id)a3;
- (id)_initWithCardioFitnessMedicationsUseOptions:(unint64_t)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKCardioFitnessMedicationsUseObject

- (id)_initWithCardioFitnessMedicationsUseOptions:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)HKCardioFitnessMedicationsUseObject;
  v4 = [(HKCardioFitnessMedicationsUseObject *)&v10 init];
  if (v4)
  {
    v5 = +[HKObjectType characteristicTypeForIdentifier:@"HKCharacteristicTypeIdentifierCardioFitnessMedicationsUse"];
    v6 = [NSNumber numberWithUnsignedInteger:a3];
    int v7 = [v5 _validateCharacteristic:v6 error:0];

    if (v7) {
      unint64_t v8 = a3;
    }
    else {
      unint64_t v8 = 0;
    }
    v4->_options = v8;
  }
  return v4;
}

- (BOOL)takingCalciumChannelBlockers
{
  return self->_options & 1;
}

- (BOOL)takingBetaBlockers
{
  return (LOBYTE(self->_options) >> 1) & 1;
}

- (BOOL)medicationsAreSet
{
  return self->_options != 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKCardioFitnessMedicationsUseObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKCardioFitnessMedicationsUseObject;
  v5 = [(HKCardioFitnessMedicationsUseObject *)&v12 init];
  if (v5)
  {
    v6 = +[HKObjectType characteristicTypeForIdentifier:@"HKCharacteristicTypeIdentifierCardioFitnessMedicationsUse"];
    uint64_t v7 = [v4 decodeIntegerForKey:@"cardioFitnessMedicationsUse"];
    unint64_t v8 = [NSNumber numberWithInteger:v7];
    int v9 = [v6 _validateCharacteristic:v8 error:0];

    if (!v9)
    {

      objc_super v10 = 0;
      goto LABEL_6;
    }
    v5->_options = v7;
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
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_options == v4[1];

  return v5;
}

- (unint64_t)hash
{
  return self->_options;
}

@end