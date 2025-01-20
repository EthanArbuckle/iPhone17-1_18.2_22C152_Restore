@interface SKGLink
- (BOOL)isEqual:(id)a3;
- (NSString)domain;
- (NSString)link;
- (id)description;
- (void)setDomain:(id)a3;
- (void)setLink:(id)a3;
@end

@implementation SKGLink

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(SKGLink *)self link];
    v7 = [v5 link];
    if ([v6 isEqualToString:v7])
    {
      v10.receiver = self;
      v10.super_class = (Class)SKGLink;
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
  id v4 = [(SKGLink *)self link];
  [(SKGEntity *)self score];
  v6 = +[NSString stringWithFormat:@"<%@: %@ %f", v3, v4, v5];

  return v6;
}

- (NSString)link
{
  return self->_link;
}

- (void)setLink:(id)a3
{
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domain, 0);

  objc_storeStrong((id *)&self->_link, 0);
}

@end