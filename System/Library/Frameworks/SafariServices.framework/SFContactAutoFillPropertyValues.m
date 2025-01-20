@interface SFContactAutoFillPropertyValues
- (NSArray)values;
- (NSString)property;
- (SFContactAutoFillPropertyValues)initWithValues:(id)a3 property:(id)a4;
- (SFContactAutoFillValue)selectedValue;
- (int64_t)selectedIndex;
- (void)setSelectedIndex:(int64_t)a3;
@end

@implementation SFContactAutoFillPropertyValues

- (SFContactAutoFillPropertyValues)initWithValues:(id)a3 property:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SFContactAutoFillPropertyValues;
  v8 = [(SFContactAutoFillPropertyValues *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    values = v8->_values;
    v8->_values = (NSArray *)v9;

    uint64_t v11 = [v7 copy];
    property = v8->_property;
    v8->_property = (NSString *)v11;

    v13 = v8;
  }

  return v8;
}

- (SFContactAutoFillValue)selectedValue
{
  return (SFContactAutoFillValue *)[(NSArray *)self->_values objectAtIndexedSubscript:self->_selectedIndex];
}

- (int64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (void)setSelectedIndex:(int64_t)a3
{
  self->_selectedIndex = a3;
}

- (NSArray)values
{
  return self->_values;
}

- (NSString)property
{
  return self->_property;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_property, 0);

  objc_storeStrong((id *)&self->_values, 0);
}

@end