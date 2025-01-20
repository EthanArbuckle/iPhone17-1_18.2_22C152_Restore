@interface IKDataProperty
- (BOOL)isEqual:(id)a3;
- (IKDataProperty)initWithProperty:(id)a3;
- (NSString)property;
- (unint64_t)hash;
@end

@implementation IKDataProperty

- (IKDataProperty)initWithProperty:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IKDataProperty;
  v6 = [(IKDataProperty *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_property, a3);
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(IKDataProperty *)self property];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 property];
    v6 = [(IKDataProperty *)self property];
    char v7 = [v5 isEqualToString:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (NSString)property
{
  return self->_property;
}

- (void).cxx_destruct
{
}

@end