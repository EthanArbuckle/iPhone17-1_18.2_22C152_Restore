@interface CNContainerUpdate
+ (id)updateWithValue:(id)a3 property:(id)a4;
- (CNContainerUpdate)initWithProperty:(id)a3 value:(id)a4;
- (NSString)description;
- (id)property;
- (id)value;
- (void)applyToMutableContainer:(id)a3;
@end

@implementation CNContainerUpdate

+ (id)updateWithValue:(id)a3 property:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithProperty:v6 value:v7];

  return v8;
}

- (CNContainerUpdate)initWithProperty:(id)a3 value:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNContainerUpdate;
  v9 = [(CNContainerUpdate *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_property, a3);
    objc_storeStrong(&v10->_value, a4);
    v11 = v10;
  }

  return v10;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  v4 = [(CNContainerPropertyDescription *)self->_property key];
  id v5 = (id)[v3 appendName:@"property" object:v4];

  id v6 = (id)[v3 appendName:@"value" object:self->_value];
  id v7 = [v3 build];

  return (NSString *)v7;
}

- (id)property
{
  return self->_property;
}

- (void)applyToMutableContainer:(id)a3
{
  id v4 = a3;
  id v5 = [(CNContainerUpdate *)self property];
  [v5 setCNValue:self->_value onContainer:v4];
}

- (id)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);

  objc_storeStrong((id *)&self->_property, 0);
}

@end