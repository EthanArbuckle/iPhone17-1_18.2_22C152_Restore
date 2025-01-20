@interface SKGEmailAddress
- (BOOL)isEqual:(id)a3;
- (NSArray)components;
- (NSString)email;
- (id)description;
- (void)setComponents:(id)a3;
- (void)setEmail:(id)a3;
@end

@implementation SKGEmailAddress

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(SKGEmailAddress *)self email];
    v7 = [v5 email];
    if ([v6 isEqualToString:v7])
    {
      v10.receiver = self;
      v10.super_class = (Class)SKGEmailAddress;
      BOOL v8 = [(SKGEntity *)&v10 isEqual:v5];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(SKGEmailAddress *)self email];
  [(SKGEntity *)self score];
  v6 = +[NSString stringWithFormat:@"<%@: %@ %f", v3, v4, v5];

  return v6;
}

- (NSString)email
{
  return self->_email;
}

- (void)setEmail:(id)a3
{
}

- (NSArray)components
{
  return self->_components;
}

- (void)setComponents:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_components, 0);

  objc_storeStrong((id *)&self->_email, 0);
}

@end