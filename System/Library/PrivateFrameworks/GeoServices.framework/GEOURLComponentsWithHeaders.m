@interface GEOURLComponentsWithHeaders
- (GEOURLComponentsWithHeaders)init;
- (GEOURLComponentsWithHeaders)initWithString:(id)a3;
- (GEOURLComponentsWithHeaders)initWithURL:(id)a3;
- (GEOURLComponentsWithHeaders)initWithURLComponents:(id)a3;
- (GEOURLWithHeaders)URLWithHeaders;
- (NSMutableDictionary)headerFields;
- (NSURL)URL;
- (NSURLComponents)URLComponents;
- (void)appendPathComponents:(id)a3;
- (void)updateQueryItemsWithBlock:(id)a3;
@end

@implementation GEOURLComponentsWithHeaders

- (GEOURLComponentsWithHeaders)initWithURLComponents:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v12.receiver = self;
    v12.super_class = (Class)GEOURLComponentsWithHeaders;
    v6 = [(GEOURLComponentsWithHeaders *)&v12 init];
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_URLComponents, a3);
      uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:10];
      headerFields = v7->_headerFields;
      v7->_headerFields = (NSMutableDictionary *)v8;
    }
    self = v7;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (GEOURLComponentsWithHeaders)init
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F29088]);
  v4 = [(GEOURLComponentsWithHeaders *)self initWithURLComponents:v3];

  return v4;
}

- (GEOURLComponentsWithHeaders)initWithURL:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F29088];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithURL:v5 resolvingAgainstBaseURL:1];

  v7 = [(GEOURLComponentsWithHeaders *)self initWithURLComponents:v6];
  return v7;
}

- (GEOURLComponentsWithHeaders)initWithString:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F29088];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithString:v5];

  v7 = [(GEOURLComponentsWithHeaders *)self initWithURLComponents:v6];
  return v7;
}

- (void)updateQueryItemsWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(GEOURLComponentsWithHeaders *)self URLComponents];
  objc_msgSend(v5, "geo_updateQueryItemsWithBlock:", v4);
}

- (void)appendPathComponents:(id)a3
{
  id v4 = a3;
  id v5 = [(GEOURLComponentsWithHeaders *)self URLComponents];
  v6 = [v5 path];

  v7 = [(GEOURLComponentsWithHeaders *)self URLComponents];
  id v11 = v7;
  if (v6)
  {
    uint64_t v8 = [v7 path];
    v9 = [v8 stringByAppendingPathComponent:v4];

    v10 = [(GEOURLComponentsWithHeaders *)self URLComponents];
    [v10 setPath:v9];

    id v4 = v8;
  }
  else
  {
    [v7 setPath:v4];
  }
}

- (NSURL)URL
{
  v2 = [(GEOURLComponentsWithHeaders *)self URLComponents];
  id v3 = [v2 URL];

  return (NSURL *)v3;
}

- (GEOURLWithHeaders)URLWithHeaders
{
  id v3 = [GEOURLWithHeaders alloc];
  id v4 = [(GEOURLComponentsWithHeaders *)self URL];
  id v5 = [(GEOURLComponentsWithHeaders *)self headerFields];
  v6 = [(GEOURLWithHeaders *)v3 initWithURL:v4 headerFields:v5];

  return v6;
}

- (NSURLComponents)URLComponents
{
  return self->_URLComponents;
}

- (NSMutableDictionary)headerFields
{
  return self->_headerFields;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerFields, 0);

  objc_storeStrong((id *)&self->_URLComponents, 0);
}

@end