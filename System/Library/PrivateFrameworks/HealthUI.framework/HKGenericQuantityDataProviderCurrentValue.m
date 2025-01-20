@interface HKGenericQuantityDataProviderCurrentValue
- (HKGenericQuantityDataProviderCurrentValue)initWithQuantity:(id)a3;
- (NSDate)date;
- (id)attributedStringWithDisplayType:(id)a3 unitController:(id)a4 valueFont:(id)a5 unitFont:(id)a6 dateCache:(id)a7;
- (id)lastUpdatedDescriptionWithDateCache:(id)a3;
- (id)stringWithDisplayType:(id)a3 unitController:(id)a4;
- (void)setDate:(id)a3;
@end

@implementation HKGenericQuantityDataProviderCurrentValue

- (HKGenericQuantityDataProviderCurrentValue)initWithQuantity:(id)a3
{
  id v5 = a3;
  v6 = [(HKGenericQuantityDataProviderCurrentValue *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_quantity, a3);
  }

  return v7;
}

- (id)attributedStringWithDisplayType:(id)a3 unitController:(id)a4 valueFont:(id)a5 unitFont:(id)a6 dateCache:(id)a7
{
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  v15 = [v13 unitForDisplayType:v14];
  v16 = NSNumber;
  [(HKQuantity *)self->_quantity doubleValueForUnit:v15];
  v17 = objc_msgSend(v16, "numberWithDouble:");
  v18 = [v14 presentation];
  v19 = [v18 adjustedValueForDaemonValue:v17];

  v20 = objc_msgSend(v14, "hk_valueFormatterForUnit:", v15);
  v21 = [v20 attributedStringFromValue:v19 displayType:v14 unitController:v13 valueFont:v12 unitFont:v11];

  return v21;
}

- (id)stringWithDisplayType:(id)a3 unitController:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v6 unitForDisplayType:v7];
  v9 = NSNumber;
  [(HKQuantity *)self->_quantity doubleValueForUnit:v8];
  v10 = objc_msgSend(v9, "numberWithDouble:");
  id v11 = [v7 presentation];
  id v12 = [v11 adjustedValueForDaemonValue:v10];

  id v13 = objc_msgSend(v7, "hk_valueFormatterForUnit:", v8);
  id v14 = [v13 stringFromValue:v12 displayType:v7 unitController:v6];

  return v14;
}

- (id)lastUpdatedDescriptionWithDateCache:(id)a3
{
  id v4 = a3;
  id v5 = [(HKGenericQuantityDataProviderCurrentValue *)self date];
  id v6 = HKLastUpdatedText(v5, v4);

  return v6;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_quantity, 0);
}

@end