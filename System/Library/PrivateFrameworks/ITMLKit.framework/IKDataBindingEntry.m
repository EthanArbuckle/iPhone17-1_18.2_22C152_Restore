@interface IKDataBindingEntry
- (IKDataBindingEntry)initWithKey:(id)a3 value:(id)a4 attributes:(unint64_t)a5;
- (IKDataBindingValue)value;
- (NSString)key;
- (unint64_t)attributes;
@end

@implementation IKDataBindingEntry

- (IKDataBindingEntry)initWithKey:(id)a3 value:(id)a4 attributes:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IKDataBindingEntry;
  v10 = [(IKDataBindingEntry *)&v14 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    key = v10->_key;
    v10->_key = (NSString *)v11;

    objc_storeStrong((id *)&v10->_value, a4);
    v10->_attributes = a5;
  }

  return v10;
}

- (NSString)key
{
  return self->_key;
}

- (IKDataBindingValue)value
{
  return self->_value;
}

- (unint64_t)attributes
{
  return self->_attributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end