@interface SKGFlight
- (BOOL)isEqual:(id)a3;
- (NSArray)components;
- (NSString)flight;
- (id)description;
- (void)addComponent:(id)a3;
- (void)setFlight:(id)a3;
@end

@implementation SKGFlight

- (void)addComponent:(id)a3
{
  id v4 = a3;
  components = self->_components;
  id v8 = v4;
  if (!components)
  {
    v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v7 = self->_components;
    self->_components = v6;

    id v4 = v8;
    components = self->_components;
  }
  [(NSMutableSet *)components addObject:v4];
}

- (NSArray)components
{
  components = self->_components;
  if (components)
  {
    v3 = [(NSMutableSet *)components allObjects];
  }
  else
  {
    v3 = &__NSArray0__struct;
  }

  return (NSArray *)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(SKGFlight *)self flight];
    v7 = [v5 flight];
    if ([v6 isEqualToString:v7])
    {
      v10.receiver = self;
      v10.super_class = (Class)SKGFlight;
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
  id v4 = [(SKGFlight *)self flight];
  [(SKGEntity *)self score];
  v6 = +[NSString stringWithFormat:@"<%@: %@ %f", v3, v4, v5];

  return v6;
}

- (NSString)flight
{
  return self->_flight;
}

- (void)setFlight:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flight, 0);

  objc_storeStrong((id *)&self->_components, 0);
}

@end