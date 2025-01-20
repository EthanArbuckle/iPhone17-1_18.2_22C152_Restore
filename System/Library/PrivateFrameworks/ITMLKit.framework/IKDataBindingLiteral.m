@interface IKDataBindingLiteral
- (BOOL)isEqual:(id)a3;
- (IKDataBindingLiteral)initWithLiteral:(id)a3;
- (NSString)literal;
- (unint64_t)hash;
@end

@implementation IKDataBindingLiteral

- (IKDataBindingLiteral)initWithLiteral:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IKDataBindingLiteral;
  v6 = [(IKDataBindingLiteral *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_literal, a3);
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(IKDataBindingLiteral *)self literal];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 literal];
    v6 = [(IKDataBindingLiteral *)self literal];
    char v7 = [v5 isEqualToString:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (NSString)literal
{
  return self->_literal;
}

- (void).cxx_destruct
{
}

@end