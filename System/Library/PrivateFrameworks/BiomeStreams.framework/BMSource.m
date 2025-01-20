@interface BMSource
- (BMSource)initWithIdentifier:(id)a3;
- (NSString)identifier;
- (id)description;
- (void)sendEvent:(id)a3;
- (void)sendEvent:(id)a3 date:(id)a4;
- (void)sendEvent:(id)a3 timestamp:(double)a4;
@end

@implementation BMSource

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
}

- (BMSource)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BMSource;
  v5 = [(BMSource *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;
  }
  return v5;
}

- (void)sendEvent:(id)a3 date:(id)a4
{
  id v6 = a3;
  [a4 timeIntervalSinceReferenceDate];
  -[BMSource sendEvent:timestamp:](self, "sendEvent:timestamp:", v6);
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BMSource;
  id v4 = [(BMSource *)&v8 description];
  v5 = [(BMSource *)self identifier];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (void)sendEvent:(id)a3
{
  uint64_t v5 = objc_opt_class();

  MEMORY[0x1F40E7228](self, a2, v5);
}

- (void)sendEvent:(id)a3 timestamp:(double)a4
{
  uint64_t v6 = objc_opt_class();

  MEMORY[0x1F40E7228](self, a2, v6);
}

@end