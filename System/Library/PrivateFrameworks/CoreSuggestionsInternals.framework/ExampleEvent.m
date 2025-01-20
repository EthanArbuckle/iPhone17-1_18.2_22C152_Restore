@interface ExampleEvent
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (ExampleEvent)initWithFoo:(id)a3;
- (NSData)foo;
- (unsigned)dataVersion;
@end

@implementation ExampleEvent

- (void).cxx_destruct
{
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSData)foo
{
  return self->_foo;
}

- (ExampleEvent)initWithFoo:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ExampleEvent;
  v5 = [(ExampleEvent *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    foo = v5->_foo;
    v5->_foo = (NSData *)v6;
  }
  return v5;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)[objc_alloc((Class)a1) initWithFoo:v5];

  return v6;
}

@end