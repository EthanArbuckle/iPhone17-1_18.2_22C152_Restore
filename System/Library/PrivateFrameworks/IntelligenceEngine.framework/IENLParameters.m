@interface IENLParameters
- (BOOL)isEqual:(id)a3;
- (NSDictionary)parameters;
- (NSString)name;
- (void)setName:(id)a3;
- (void)setParameters:(id)a3;
@end

@implementation IENLParameters

- (BOOL)isEqual:(id)a3
{
  v4 = (IENLParameters *)a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (self == v4)
    {
      char v11 = 1;
    }
    else
    {
      v5 = v4;
      v6 = [(IENLParameters *)self name];
      v7 = [(IENLParameters *)v5 name];
      char v8 = [v6 isEqualToString:v7];

      if (v8)
      {
        v9 = [(IENLParameters *)self parameters];
        v10 = [(IENLParameters *)v5 parameters];
        char v11 = [v9 isEqualToDictionary:v10];
      }
      else
      {
        char v11 = 0;
      }
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end