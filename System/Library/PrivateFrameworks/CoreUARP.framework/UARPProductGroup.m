@interface UARPProductGroup
- (NSString)identifier;
- (UARPProductGroup)initWithIdentifier:(id)a3;
- (id)description;
@end

@implementation UARPProductGroup

- (UARPProductGroup)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UARPProductGroup;
  v5 = [(UARPProductGroup *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;
  }
  return v5;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"identifier=%@", self->_identifier];
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end