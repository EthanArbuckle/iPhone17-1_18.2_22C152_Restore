@interface AACloudKitMigrationStateResponse
- (AACloudKitMigrationStateResponse)initWithHTTPResponse:(id)a3 data:(id)a4;
- (NSString)name;
@end

@implementation AACloudKitMigrationStateResponse

- (AACloudKitMigrationStateResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)AACloudKitMigrationStateResponse;
  v4 = [(AAResponse *)&v10 initWithHTTPResponse:a3 data:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(AAResponse *)v4 responseDictionary];
    uint64_t v7 = [v6 objectForKeyedSubscript:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v7;
  }
  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
}

@end