@interface HDRapportRequestIdentifier
- (HDRapportRequestIdentifier)initWithSchemaIdentifier:(int64_t)a3 name:(id)a4;
- (NSString)name;
- (id)description;
- (int64_t)schemaIdentifier;
@end

@implementation HDRapportRequestIdentifier

- (HDRapportRequestIdentifier)initWithSchemaIdentifier:(int64_t)a3 name:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HDRapportRequestIdentifier;
  v7 = [(HDRapportRequestIdentifier *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_schemaIdentifier = a3;
    uint64_t v9 = [v6 copy];
    name = v8->_name;
    v8->_name = (NSString *)v9;
  }
  return v8;
}

- (id)description
{
  v3 = NSString;
  v4 = NSStringForRapportSchemaIdentifier(self->_schemaIdentifier);
  v5 = [v3 stringWithFormat:@"<%@-%@>", v4, self->_name];

  return v5;
}

- (int64_t)schemaIdentifier
{
  return self->_schemaIdentifier;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
}

@end