@interface HDFHIREndpointSchemaParseResult
- (NSArray)resourceSchemas;
- (NSDictionary)authorizationSchemas;
- (void)setAuthorizationSchemas:(id)a3;
- (void)setResourceSchemas:(id)a3;
@end

@implementation HDFHIREndpointSchemaParseResult

- (NSDictionary)authorizationSchemas
{
  return self->_authorizationSchemas;
}

- (void)setAuthorizationSchemas:(id)a3
{
}

- (NSArray)resourceSchemas
{
  return self->_resourceSchemas;
}

- (void)setResourceSchemas:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceSchemas, 0);

  objc_storeStrong((id *)&self->_authorizationSchemas, 0);
}

@end