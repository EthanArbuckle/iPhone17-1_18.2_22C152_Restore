@interface _CDEventStream
+ (id)eventStreamWithProperties:(id)a3;
- (_CDEventStream)initWithProperties:(id)a3;
- (_CDEventStreamProperties)eventStreamProperties;
- (id)description;
@end

@implementation _CDEventStream

- (_CDEventStreamProperties)eventStreamProperties
{
  return (_CDEventStreamProperties *)objc_getProperty(self, a2, 8, 1);
}

+ (id)eventStreamWithProperties:(id)a3
{
  id v3 = a3;
  v4 = [[_CDEventStream alloc] initWithProperties:v3];

  return v4;
}

- (_CDEventStream)initWithProperties:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_CDEventStream;
  v6 = [(_CDEventStream *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->eventStreamProperties, a3);
  }

  return v7;
}

- (id)description
{
  v2 = NSString;
  id v3 = [(_CDEventStream *)self eventStreamProperties];
  v4 = [v2 stringWithFormat:@"Event Stream Properties: %@ \n", v3];

  return v4;
}

- (void).cxx_destruct
{
}

@end