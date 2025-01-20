@interface _SFSearchRequest
- (NSDictionary)headerFields;
- (NSDictionary)queryParameters;
- (int64_t)searchTypes;
- (void)setHeaderFields:(id)a3;
- (void)setQueryParameters:(id)a3;
- (void)setSearchTypes:(int64_t)a3;
@end

@implementation _SFSearchRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryParameters, 0);

  objc_storeStrong((id *)&self->_headerFields, 0);
}

- (void)setQueryParameters:(id)a3
{
}

- (NSDictionary)queryParameters
{
  return self->_queryParameters;
}

- (void)setHeaderFields:(id)a3
{
}

- (NSDictionary)headerFields
{
  return self->_headerFields;
}

- (void)setSearchTypes:(int64_t)a3
{
  self->_searchTypes = a3;
}

- (int64_t)searchTypes
{
  return self->_searchTypes;
}

@end