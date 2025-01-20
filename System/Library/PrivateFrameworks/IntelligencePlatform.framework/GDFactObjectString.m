@interface GDFactObjectString
- (GDFactObjectString)initWithValue:(id)a3;
- (NSString)value;
@end

@implementation GDFactObjectString

- (void).cxx_destruct
{
}

- (NSString)value
{
  return self->_value;
}

- (GDFactObjectString)initWithValue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GDFactObjectString;
  v6 = [(GDFactObjectString *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_value, a3);
  }

  return v7;
}

@end