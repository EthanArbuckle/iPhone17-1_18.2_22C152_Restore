@interface GPURawCounterSelect
+ (id)selectWithName:(id)a3 options:(id)a4;
- (GPURawCounterSelect)initWithName:(id)a3 options:(id)a4;
- (NSDictionary)options;
- (NSString)name;
- (id)description;
- (void)dealloc;
@end

@implementation GPURawCounterSelect

- (GPURawCounterSelect)initWithName:(id)a3 options:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)GPURawCounterSelect;
  v6 = [(GPURawCounterSelect *)&v8 init];
  if (v6)
  {
    v6->_name = (NSString *)[a3 copy];
    v6->_options = (NSDictionary *)[a4 copy];
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)GPURawCounterSelect;
  [(GPURawCounterSelect *)&v3 dealloc];
}

+ (id)selectWithName:(id)a3 options:(id)a4
{
  v4 = [[GPURawCounterSelect alloc] initWithName:a3 options:a4];

  return v4;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"name = %@ options = %@", self->_name, -[NSDictionary description](self->_options, "description")];
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSDictionary)options
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

@end