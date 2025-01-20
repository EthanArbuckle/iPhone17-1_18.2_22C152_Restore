@interface GEOURLWithHeaders
- (GEOURLWithHeaders)init;
- (GEOURLWithHeaders)initWithURL:(id)a3 headerFields:(id)a4;
- (NSDictionary)headerFields;
- (NSURL)URL;
@end

@implementation GEOURLWithHeaders

- (GEOURLWithHeaders)init
{
  result = (GEOURLWithHeaders *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOURLWithHeaders)initWithURL:(id)a3 headerFields:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)GEOURLWithHeaders;
  v9 = [(GEOURLWithHeaders *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_URL, a3);
    uint64_t v11 = [v8 copy];
    headerFields = v10->_headerFields;
    v10->_headerFields = (NSDictionary *)v11;
  }
  return v10;
}

- (NSURL)URL
{
  return self->_URL;
}

- (NSDictionary)headerFields
{
  return self->_headerFields;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerFields, 0);

  objc_storeStrong((id *)&self->_URL, 0);
}

@end