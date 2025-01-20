@interface _GPURawCounter
- (NSString)description;
- (NSString)name;
- (_GPURawCounter)initWithName:(id)a3 description:(id)a4 valueType:(unint64_t)a5;
- (unint64_t)counterValueType;
- (void)dealloc;
@end

@implementation _GPURawCounter

- (_GPURawCounter)initWithName:(id)a3 description:(id)a4 valueType:(unint64_t)a5
{
  v10.receiver = self;
  v10.super_class = (Class)_GPURawCounter;
  v8 = [(_GPURawCounter *)&v10 init];
  if (v8)
  {
    v8->_name = (NSString *)[a3 copy];
    v8->_description = (NSString *)[a4 copy];
    v8->_counterValueType = a5;
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_GPURawCounter;
  [(_GPURawCounter *)&v3 dealloc];
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)description
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)counterValueType
{
  return self->_counterValueType;
}

@end