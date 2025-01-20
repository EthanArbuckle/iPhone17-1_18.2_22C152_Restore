@interface TDThemeConstant
- (id)constantName;
- (id)copyDataFromAttributes;
- (id)displayName;
- (unsigned)identifier;
- (void)setAttributesFromCopyData:(id)a3;
- (void)setConstantName:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setIdentifier:(unsigned int)a3;
@end

@implementation TDThemeConstant

- (void)setIdentifier:(unsigned int)a3
{
  [(TDThemeConstant *)self willChangeValueForKey:@"identifier"];
  self->_identifier = a3;

  [(TDThemeConstant *)self didChangeValueForKey:@"identifier"];
}

- (unsigned)identifier
{
  [(TDThemeConstant *)self willAccessValueForKey:@"identifier"];
  unsigned int identifier = self->_identifier;
  [(TDThemeConstant *)self didAccessValueForKey:@"identifier"];
  return identifier;
}

- (void)setDisplayName:(id)a3
{
  if (a3)
  {
    [(TDThemeConstant *)self willChangeValueForKey:@"displayName"];
    [(TDThemeConstant *)self setPrimitiveValue:a3 forKey:@"displayName"];
    [(TDThemeConstant *)self didChangeValueForKey:@"displayName"];
  }
}

- (id)displayName
{
  [(TDThemeConstant *)self willAccessValueForKey:@"displayName"];
  v3 = (void *)[(TDThemeConstant *)self primitiveValueForKey:@"displayName"];
  [(TDThemeConstant *)self didAccessValueForKey:@"displayName"];
  return v3;
}

- (void)setConstantName:(id)a3
{
  if (a3)
  {
    [(TDThemeConstant *)self willChangeValueForKey:@"constantName"];
    [(TDThemeConstant *)self setPrimitiveValue:a3 forKey:@"constantName"];
    [(TDThemeConstant *)self didChangeValueForKey:@"constantName"];
  }
}

- (id)constantName
{
  [(TDThemeConstant *)self willAccessValueForKey:@"constantName"];
  v3 = (void *)[(TDThemeConstant *)self primitiveValueForKey:@"constantName"];
  [(TDThemeConstant *)self didAccessValueForKey:@"constantName"];
  return v3;
}

- (id)copyDataFromAttributes
{
  v3 = (void *)[MEMORY[0x263EFF9A0] dictionaryWithCapacity:3];
  uint64_t v4 = [(TDThemeConstant *)self valueForKey:@"constantName"];
  if (v4) {
    [v3 setObject:v4 forKey:@"constantName"];
  }
  uint64_t v5 = [(TDThemeConstant *)self valueForKey:@"displayName"];
  if (v5) {
    [v3 setObject:v5 forKey:@"displayName"];
  }
  uint64_t v6 = [(TDThemeConstant *)self valueForKey:@"identifier"];
  if (v6) {
    [v3 setObject:v6 forKey:@"identifier"];
  }
  v7 = (void *)[MEMORY[0x263F08AC0] dataWithPropertyList:v3 format:200 options:0 error:0];

  return (id)[v7 copy];
}

- (void)setAttributesFromCopyData:(id)a3
{
  uint64_t v4 = (void *)[MEMORY[0x263F08AC0] propertyListWithData:a3 options:0 format:0 error:0];
  uint64_t v5 = [v4 objectForKey:@"constantName"];
  if (v5) {
    [(TDThemeConstant *)self setValue:v5 forKey:@"constantName"];
  }
  uint64_t v6 = [v4 objectForKey:@"displayName"];
  if (v6) {
    [(TDThemeConstant *)self setValue:v6 forKey:@"displayName"];
  }
  uint64_t v7 = [v4 objectForKey:@"identifier"];
  if (v7)
  {
    [(TDThemeConstant *)self setValue:v7 forKey:@"identifier"];
  }
}

@end