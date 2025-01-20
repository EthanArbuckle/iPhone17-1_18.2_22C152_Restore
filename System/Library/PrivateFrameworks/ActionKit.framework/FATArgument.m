@interface FATArgument
+ (id)argumentWithField:(id)a3 value:(id)a4;
- (FATField)field;
- (id)value;
- (void)setField:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation FATArgument

+ (id)argumentWithField:(id)a3 value:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)a1);
  [v8 setField:v7];

  [v8 setValue:v6];
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_field, 0);
}

- (void)setValue:(id)a3
{
}

- (id)value
{
  return self->_value;
}

- (void)setField:(id)a3
{
}

- (FATField)field
{
  return self->_field;
}

@end