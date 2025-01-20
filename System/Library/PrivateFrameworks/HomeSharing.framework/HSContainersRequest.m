@interface HSContainersRequest
+ (id)requestWithDatabaseID:(unsigned int)a3;
- (BOOL)shouldParseResponse;
- (HSContainersRequest)initWithAction:(id)a3;
- (HSContainersRequest)initWithDatabaseID:(unsigned int)a3;
- (id)canonicalResponseForResponse:(id)a3;
- (void)setShouldParseResponse:(BOOL)a3;
@end

@implementation HSContainersRequest

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

    [v5 setContainers:v7];
    id v4 = v5;
  }
  return v4;
}

- (HSContainersRequest)initWithDatabaseID:(unsigned int)a3
{
  id v4 = objc_msgSend(NSString, "stringWithFormat:", @"databases/%u/containers", *(void *)&a3);
  v5 = [(HSContainersRequest *)self initWithAction:v4];

  return v5;
}

- (HSContainersRequest)initWithAction:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HSContainersRequest;
  result = [(HSRequest *)&v4 initWithAction:a3];
  if (result) {
    result->_shouldParseResponse = 1;
  }
  return result;
}

+ (id)requestWithDatabaseID:(unsigned int)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithDatabaseID:*(void *)&a3];
  return v3;
}

@end