@interface AMSOptional
+ (id)optionalWithNil;
+ (id)optionalWithValue:(id)a3;
- (AMSOptional)init;
- (AMSOptional)initWithValue:(id)a3;
- (id)value;
@end

@implementation AMSOptional

- (void).cxx_destruct
{
}

- (AMSOptional)initWithValue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSOptional;
  v6 = [(AMSOptional *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong(&v6->_value, a3);
  }

  return v7;
}

- (id)value
{
  return self->_value;
}

+ (id)optionalWithValue:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithValue:v4];

  return v5;
}

+ (id)optionalWithNil
{
  v2 = (void *)[objc_alloc((Class)a1) initWithValue:0];
  return v2;
}

- (AMSOptional)init
{
  return [(AMSOptional *)self initWithValue:0];
}

@end