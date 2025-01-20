@interface HRETypeValueTuple
+ (id)type:(id)a3 value:(id)a4;
- (HRETypeValueTuple)initWithType:(id)a3 value:(id)a4;
- (NSString)type;
- (id)value;
@end

@implementation HRETypeValueTuple

- (HRETypeValueTuple)initWithType:(id)a3 value:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HRETypeValueTuple;
  v9 = [(HRETypeValueTuple *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_type, a3);
    objc_storeStrong(&v10->_value, a4);
  }

  return v10;
}

+ (id)type:(id)a3 value:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithType:v7 value:v6];

  return v8;
}

- (NSString)type
{
  return self->_type;
}

- (id)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);

  objc_storeStrong((id *)&self->_type, 0);
}

@end