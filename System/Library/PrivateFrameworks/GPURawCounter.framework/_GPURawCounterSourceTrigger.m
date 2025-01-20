@interface _GPURawCounterSourceTrigger
- (NSDictionary)options;
- (NSString)description;
- (NSString)name;
- (_GPURawCounterSourceTrigger)initWithName:(id)a3 description:(id)a4 options:(id)a5;
- (void)dealloc;
@end

@implementation _GPURawCounterSourceTrigger

- (_GPURawCounterSourceTrigger)initWithName:(id)a3 description:(id)a4 options:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)_GPURawCounterSourceTrigger;
  v8 = [(_GPURawCounterSourceTrigger *)&v10 init];
  if (v8)
  {
    v8->_name = (NSString *)[a3 copy];
    v8->_description = (NSString *)[a4 copy];
    v8->_options = (NSDictionary *)[a5 copy];
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_GPURawCounterSourceTrigger;
  [(_GPURawCounterSourceTrigger *)&v3 dealloc];
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)description
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSDictionary)options
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

@end