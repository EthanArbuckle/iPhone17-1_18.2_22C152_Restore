@interface HMBModelQueryArgument
+ (id)argumentWithPropertyName:(id)a3;
+ (id)argumentWithPropertyName:(id)a3 defaultValue:(id)a4;
- (HMBModelQueryArgument)initWithPropertyName:(id)a3 defaultValue:(id)a4;
- (HMBQueryableModelFieldCoder)defaultValue;
- (NSString)propertyName;
@end

@implementation HMBModelQueryArgument

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultValue, 0);
  objc_storeStrong((id *)&self->_propertyName, 0);
}

- (HMBQueryableModelFieldCoder)defaultValue
{
  return self->_defaultValue;
}

- (NSString)propertyName
{
  return self->_propertyName;
}

- (HMBModelQueryArgument)initWithPropertyName:(id)a3 defaultValue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMBModelQueryArgument;
  v9 = [(HMBModelQueryArgument *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_propertyName, a3);
    objc_storeStrong((id *)&v10->_defaultValue, a4);
  }

  return v10;
}

+ (id)argumentWithPropertyName:(id)a3 defaultValue:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[HMBModelQueryArgument alloc] initWithPropertyName:v6 defaultValue:v5];

  return v7;
}

+ (id)argumentWithPropertyName:(id)a3
{
  id v3 = a3;
  v4 = [[HMBModelQueryArgument alloc] initWithPropertyName:v3 defaultValue:0];

  return v4;
}

@end