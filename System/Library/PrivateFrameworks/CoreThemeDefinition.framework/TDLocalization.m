@interface TDLocalization
- (NSString)name;
- (unsigned)identifier;
- (void)setIdentifier:(unsigned __int16)a3;
- (void)setName:(id)a3;
@end

@implementation TDLocalization

- (NSString)name
{
  [(TDLocalization *)self willAccessValueForKey:@"name"];
  v3 = (NSString *)(id)[(NSString *)self->_name copy];
  [(TDLocalization *)self didAccessValueForKey:@"name"];
  return v3;
}

- (void)setName:(id)a3
{
  [(TDLocalization *)self willChangeValueForKey:@"name"];

  self->_name = (NSString *)[a3 copy];

  [(TDLocalization *)self didChangeValueForKey:@"name"];
}

- (unsigned)identifier
{
  [(TDLocalization *)self willAccessValueForKey:@"identifier"];
  unsigned __int16 identifier = self->_identifier;
  [(TDLocalization *)self didAccessValueForKey:@"identifier"];
  return identifier;
}

- (void)setIdentifier:(unsigned __int16)a3
{
  [(TDLocalization *)self willChangeValueForKey:@"identifier"];
  self->_unsigned __int16 identifier = a3;

  [(TDLocalization *)self didChangeValueForKey:@"identifier"];
}

@end