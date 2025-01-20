@interface AACloudKitStartMigrationResponse
- (AACloudKitStartMigrationResponse)initWithHTTPResponse:(id)a3 data:(id)a4;
- (NSNumber)status;
@end

@implementation AACloudKitStartMigrationResponse

- (AACloudKitStartMigrationResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)AACloudKitStartMigrationResponse;
  v4 = [(AAResponse *)&v10 initWithHTTPResponse:a3 data:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(AAResponse *)v4 responseDictionary];
    uint64_t v7 = [v6 objectForKeyedSubscript:@"status"];
    status = v5->_status;
    v5->_status = (NSNumber *)v7;
  }
  return v5;
}

- (NSNumber)status
{
  return self->_status;
}

- (void).cxx_destruct
{
}

@end