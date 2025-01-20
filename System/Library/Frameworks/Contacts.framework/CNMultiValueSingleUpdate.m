@interface CNMultiValueSingleUpdate
- (CNLabeledValue)value;
- (CNMultiValueSingleUpdate)initWithValue:(id)a3;
- (id)description;
@end

@implementation CNMultiValueSingleUpdate

- (CNMultiValueSingleUpdate)initWithValue:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNMultiValueSingleUpdate;
  v6 = [(CNMultiValueSingleUpdate *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_value, a3);
    v8 = v7;
  }

  return v7;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendNamesAndObjects:", @"value", self->_value, 0);
  id v5 = [v3 build];

  return v5;
}

- (CNLabeledValue)value
{
  return self->_value;
}

- (void).cxx_destruct
{
}

@end