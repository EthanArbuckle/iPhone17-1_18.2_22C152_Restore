@interface HSItemsRequest
+ (id)requestWithDatabaseID:(unsigned int)a3;
+ (id)requestWithDatabaseID:(unsigned int)a3 containerID:(unsigned int)a4;
- (BOOL)includeHiddenItems;
- (BOOL)shouldParseResponse;
- (HSItemsRequest)initWithAction:(id)a3;
- (HSItemsRequest)initWithDatabaseID:(unsigned int)a3;
- (HSItemsRequest)initWithDatabaseID:(unsigned int)a3 containerID:(unsigned int)a4;
- (double)timeoutInterval;
- (id)canonicalResponseForResponse:(id)a3;
- (void)setIncludeHiddenItems:(BOOL)a3;
- (void)setShouldParseResponse:(BOOL)a3;
@end

@implementation HSItemsRequest

- (void)setIncludeHiddenItems:(BOOL)a3
{
  self->_includeHiddenItems = a3;
}

- (BOOL)includeHiddenItems
{
  return self->_includeHiddenItems;
}

- (void)setShouldParseResponse:(BOOL)a3
{
  self->_shouldParseResponse = a3;
}

- (BOOL)shouldParseResponse
{
  return self->_shouldParseResponse;
}

- (id)canonicalResponseForResponse:(id)a3
{
  id v4 = a3;
  if (self->_shouldParseResponse)
  {
    v5 = +[HSResponse responseWithResponse:v4];

    v6 = [v5 responseData];
    v7 = +[HSResponseDataParser parseResponseData:v6];

    [v5 setItems:v7];
    id v4 = v5;
  }
  return v4;
}

- (double)timeoutInterval
{
  return 120.0;
}

- (HSItemsRequest)initWithDatabaseID:(unsigned int)a3 containerID:(unsigned int)a4
{
  v5 = objc_msgSend(NSString, "stringWithFormat:", @"databases/%u/containers/%u/items", *(void *)&a3, *(void *)&a4);
  v6 = [(HSItemsRequest *)self initWithAction:v5];

  return v6;
}

- (HSItemsRequest)initWithDatabaseID:(unsigned int)a3
{
  id v4 = objc_msgSend(NSString, "stringWithFormat:", @"databases/%u/items", *(void *)&a3);
  v5 = [(HSItemsRequest *)self initWithAction:v4];

  return v5;
}

- (HSItemsRequest)initWithAction:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HSItemsRequest;
  result = [(HSRequest *)&v4 initWithAction:a3];
  if (result)
  {
    result->_shouldParseResponse = 1;
    result->_includeHiddenItems = 0;
  }
  return result;
}

+ (id)requestWithDatabaseID:(unsigned int)a3 containerID:(unsigned int)a4
{
  objc_super v4 = (void *)[objc_alloc((Class)a1) initWithDatabaseID:*(void *)&a3 containerID:*(void *)&a4];
  return v4;
}

+ (id)requestWithDatabaseID:(unsigned int)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithDatabaseID:*(void *)&a3];
  return v3;
}

@end