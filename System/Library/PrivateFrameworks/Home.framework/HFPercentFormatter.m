@interface HFPercentFormatter
+ (id)_percentageFromValue:(id)a3 forMinimumValue:(id)a4 maximumValue:(id)a5;
+ (id)_valueFromPercentage:(id)a3 forMinimumValue:(id)a4 maximumValue:(id)a5;
- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 range:(_NSRange *)a5 error:(id *)a6;
- (HFPercentFormatter)init;
- (HFPercentFormatter)initWithMinimumValue:(id)a3 maximumValue:(id)a4;
- (NSNumber)maximumValue;
- (NSNumber)minimumValue;
- (NSString)unitDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)stringForNormalizedObjectValue:(id)a3;
- (id)stringForObjectValue:(id)a3;
- (id)stringForObjectValue:(id)a3 withUnit:(BOOL)a4;
- (id)stringForRelativePercentValue:(id)a3;
- (void)setMaximumValue:(id)a3;
- (void)setMinimumValue:(id)a3;
@end

@implementation HFPercentFormatter

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HFPercentFormatter;
  id v4 = [(HFPercentFormatter *)&v8 copyWithZone:a3];
  v5 = [(HFPercentFormatter *)self minimumValue];
  [v4 setMinimumValue:v5];

  v6 = [(HFPercentFormatter *)self maximumValue];
  [v4 setMaximumValue:v6];

  return v4;
}

- (id)stringForObjectValue:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [(HFPercentFormatter *)self numberStyle] == 3)
  {
    v5 = objc_opt_class();
    v6 = [(HFPercentFormatter *)self minimumValue];
    v7 = [(HFPercentFormatter *)self maximumValue];
    objc_super v8 = [v5 _percentageFromValue:v4 forMinimumValue:v6 maximumValue:v7];

    v12.receiver = self;
    v12.super_class = (Class)HFPercentFormatter;
    v9 = [(HFPercentFormatter *)&v12 stringForObjectValue:v8];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)HFPercentFormatter;
    v9 = [(HFPercentFormatter *)&v11 stringForObjectValue:v4];
  }

  return v9;
}

- (NSNumber)minimumValue
{
  return self->_minimumValue;
}

- (NSNumber)maximumValue
{
  return self->_maximumValue;
}

+ (id)_percentageFromValue:(id)a3 forMinimumValue:(id)a4 maximumValue:(id)a5
{
  v7 = NSNumber;
  id v8 = a5;
  id v9 = a4;
  [a3 doubleValue];
  double v11 = v10;
  [v9 doubleValue];
  double v13 = v11 - v12;
  [v8 doubleValue];
  double v15 = v14;

  [v9 doubleValue];
  double v17 = v16;

  return (id)[v7 numberWithDouble:v13 / (v15 - v17)];
}

- (HFPercentFormatter)initWithMinimumValue:(id)a3 maximumValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HFPercentFormatter;
  id v8 = [(HFPercentFormatter *)&v11 init];
  id v9 = v8;
  if (v8)
  {
    [(HFPercentFormatter *)v8 setMinimumValue:v6];
    [(HFPercentFormatter *)v9 setMaximumValue:v7];
    [(HFPercentFormatter *)v9 setNumberStyle:3];
    [(HFPercentFormatter *)v9 setMaximumFractionDigits:0];
  }

  return v9;
}

- (void)setMaximumValue:(id)a3
{
}

- (void)setMinimumValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumValue, 0);
  objc_storeStrong((id *)&self->_minimumValue, 0);
}

- (HFPercentFormatter)init
{
  return [(HFPercentFormatter *)self initWithMinimumValue:&unk_26C0F6F18 maximumValue:&unk_26C0F6F30];
}

- (id)stringForRelativePercentValue:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 minimumValue];
  id v6 = (void *)v5;
  id v7 = &unk_26C0F6F18;
  if (v5) {
    id v7 = (void *)v5;
  }
  id v8 = v7;

  uint64_t v9 = [v4 maximumValue];
  double v10 = (void *)v9;
  objc_super v11 = &unk_26C0F6F30;
  if (v9) {
    objc_super v11 = (void *)v9;
  }
  id v12 = v11;

  double v13 = objc_opt_class();
  double v14 = [v4 value];

  double v15 = [v13 _percentageFromValue:v14 forMinimumValue:v8 maximumValue:v12];

  v18.receiver = self;
  v18.super_class = (Class)HFPercentFormatter;
  double v16 = [(HFPercentFormatter *)&v18 stringForObjectValue:v15];

  return v16;
}

- (id)stringForNormalizedObjectValue:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HFPercentFormatter;
  v3 = [(HFPercentFormatter *)&v5 stringForObjectValue:a3];
  return v3;
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 range:(_NSRange *)a5 error:(id *)a6
{
  v14.receiver = self;
  v14.super_class = (Class)HFPercentFormatter;
  BOOL v8 = [(HFPercentFormatter *)&v14 getObjectValue:a3 forString:a4 range:a5 error:a6];
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = objc_opt_class();
      id v10 = *a3;
      objc_super v11 = [(HFPercentFormatter *)self minimumValue];
      id v12 = [(HFPercentFormatter *)self maximumValue];
      *a3 = [v9 _valueFromPercentage:v10 forMinimumValue:v11 maximumValue:v12];

      LOBYTE(v8) = 1;
    }
    else
    {
      LOBYTE(v8) = 0;
    }
  }
  return v8;
}

- (NSString)unitDescription
{
  return (NSString *)_HFLocalizedStringWithDefaultValue(@"HFCharacteristicTriggerValueRangePickerUnitSuffix_Percent", @"HFCharacteristicTriggerValueRangePickerUnitSuffix_Percent", 1);
}

- (id)stringForObjectValue:(id)a3 withUnit:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    id v7 = [(HFPercentFormatter *)self stringForObjectValue:v6];
  }
  else
  {
    BOOL v8 = (void *)[(HFPercentFormatter *)self copy];
    [v8 setNumberStyle:0];
    id v7 = [v8 stringForObjectValue:v6];

    id v6 = v8;
  }

  return v7;
}

+ (id)_valueFromPercentage:(id)a3 forMinimumValue:(id)a4 maximumValue:(id)a5
{
  id v7 = NSNumber;
  id v8 = a5;
  id v9 = a4;
  [a3 doubleValue];
  double v11 = v10;
  [v8 doubleValue];
  double v13 = v12;

  [v9 doubleValue];
  double v15 = v13 - v14;
  [v9 doubleValue];
  double v17 = v16;

  return (id)[v7 numberWithDouble:v17 + v11 * v15];
}

@end