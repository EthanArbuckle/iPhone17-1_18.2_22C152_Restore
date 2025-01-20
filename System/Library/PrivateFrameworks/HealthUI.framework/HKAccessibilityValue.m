@interface HKAccessibilityValue
- (HKAccessibilityValue)initWithValueTitle:(id)a3 valueType:(id)a4 valueDescription:(id)a5 valueAsNumber:(id)a6;
- (NSNumber)valueAsNumber;
- (NSString)valueDescription;
- (NSString)valueTitle;
- (NSString)valueType;
- (id)description;
@end

@implementation HKAccessibilityValue

- (HKAccessibilityValue)initWithValueTitle:(id)a3 valueType:(id)a4 valueDescription:(id)a5 valueAsNumber:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HKAccessibilityValue;
  v15 = [(HKAccessibilityValue *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_valueTitle, a3);
    objc_storeStrong((id *)&v16->_valueType, a4);
    objc_storeStrong((id *)&v16->_valueDescription, a5);
    objc_storeStrong((id *)&v16->_valueAsNumber, a6);
  }

  return v16;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"HKAccessibilityValue %p:", self);
  [v3 addObject:v4];

  v5 = NSString;
  v6 = [(HKAccessibilityValue *)self valueTitle];
  v7 = [v5 stringWithFormat:@"  valueTitle = '%@'", v6];
  [v3 addObject:v7];

  v8 = NSString;
  v9 = [(HKAccessibilityValue *)self valueType];
  v10 = [v8 stringWithFormat:@"  valueType = '%@'", v9];
  [v3 addObject:v10];

  id v11 = NSString;
  id v12 = [(HKAccessibilityValue *)self valueDescription];
  id v13 = [v11 stringWithFormat:@"  valueDescription = '%@'", v12];
  [v3 addObject:v13];

  id v14 = NSString;
  v15 = [(HKAccessibilityValue *)self valueAsNumber];
  v16 = [v14 stringWithFormat:@"  valueAsNumber = %@", v15];
  [v3 addObject:v16];

  v17 = [v3 componentsJoinedByString:@"\n"];

  return v17;
}

- (NSString)valueTitle
{
  return self->_valueTitle;
}

- (NSString)valueType
{
  return self->_valueType;
}

- (NSString)valueDescription
{
  return self->_valueDescription;
}

- (NSNumber)valueAsNumber
{
  return self->_valueAsNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueAsNumber, 0);
  objc_storeStrong((id *)&self->_valueDescription, 0);
  objc_storeStrong((id *)&self->_valueType, 0);
  objc_storeStrong((id *)&self->_valueTitle, 0);
}

@end