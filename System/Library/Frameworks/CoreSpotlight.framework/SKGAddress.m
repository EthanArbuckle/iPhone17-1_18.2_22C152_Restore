@interface SKGAddress
- (BOOL)isEqual:(id)a3;
- (NSArray)synonyms;
- (NSString)address;
- (NSString)city;
- (NSString)country;
- (NSString)state;
- (id)description;
- (void)addComponent:(id)a3;
- (void)setAddress:(id)a3;
- (void)setCity:(id)a3;
- (void)setCountry:(id)a3;
- (void)setState:(id)a3;
@end

@implementation SKGAddress

- (void)addComponent:(id)a3
{
  id v4 = a3;
  components = self->_components;
  id v9 = v4;
  if (!components)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_components;
    self->_components = v6;

    id v4 = v9;
    components = self->_components;
  }
  [(NSMutableArray *)components addObject:v4];
  [(SKGEntity *)self score];
  [(SKGEntity *)self setScore:v8 + 1.0];
}

- (NSArray)synonyms
{
  if (self->_components) {
    return (NSArray *)self->_components;
  }
  else {
    return (NSArray *)&__NSArray0__struct;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(SKGAddress *)self address];
    v7 = [v5 address];
    if ([v6 isEqualToString:v7])
    {
      v10.receiver = self;
      v10.super_class = (Class)SKGAddress;
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
  id v4 = [(SKGAddress *)self address];
  [(SKGEntity *)self score];
  v6 = +[NSString stringWithFormat:@"<%@: %@ %f>", v3, v4, v5];

  return v6;
}

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
}

- (NSString)city
{
  return self->_city;
}

- (void)setCity:(id)a3
{
}

- (NSString)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (NSString)country
{
  return self->_country;
}

- (void)setCountry:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_locationValues, 0);

  objc_storeStrong((id *)&self->_components, 0);
}

@end