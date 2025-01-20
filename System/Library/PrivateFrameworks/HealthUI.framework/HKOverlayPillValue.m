@interface HKOverlayPillValue
- (HKOverlayPillValue)initWithAttributedValue:(id)a3;
- (HKOverlayPillValue)initWithValueString:(id)a3 unitString:(id)a4;
- (NSAttributedString)attributedValue;
- (NSString)unitString;
- (NSString)valueString;
@end

@implementation HKOverlayPillValue

- (HKOverlayPillValue)initWithValueString:(id)a3 unitString:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HKOverlayPillValue;
  v9 = [(HKOverlayPillValue *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_valueString, a3);
    objc_storeStrong((id *)&v10->_unitString, a4);
    attributedValue = v10->_attributedValue;
    v10->_attributedValue = 0;
  }
  return v10;
}

- (HKOverlayPillValue)initWithAttributedValue:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKOverlayPillValue;
  v6 = [(HKOverlayPillValue *)&v11 init];
  id v7 = v6;
  if (v6)
  {
    valueString = v6->_valueString;
    v6->_valueString = 0;

    unitString = v7->_unitString;
    v7->_unitString = 0;

    objc_storeStrong((id *)&v7->_attributedValue, a3);
  }

  return v7;
}

- (NSString)valueString
{
  return self->_valueString;
}

- (NSString)unitString
{
  return self->_unitString;
}

- (NSAttributedString)attributedValue
{
  return self->_attributedValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedValue, 0);
  objc_storeStrong((id *)&self->_unitString, 0);
  objc_storeStrong((id *)&self->_valueString, 0);
}

@end