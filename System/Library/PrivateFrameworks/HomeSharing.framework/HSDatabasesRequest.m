@interface HSDatabasesRequest
- (HSDatabasesRequest)init;
- (id)canonicalResponseForResponse:(id)a3;
@end

@implementation HSDatabasesRequest

- (id)canonicalResponseForResponse:(id)a3
{
  v3 = +[HSResponse responseWithResponse:a3];
  v4 = [v3 responseData];
  v5 = +[HSResponseDataParser parseResponseData:v4];

  [v3 setDatabases:v5];
  return v3;
}

- (HSDatabasesRequest)init
{
  return [(HSRequest *)self initWithAction:@"databases"];
}

@end