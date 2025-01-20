@interface EDAMServiceAccessEntry
+ (id)structFields;
+ (id)structName;
- (NSNumber)accessTime;
- (NSNumber)apiKeyId;
- (NSNumber)authenticatedClientUserId;
- (NSNumber)businessAdmin;
- (NSNumber)userId;
- (NSString)serviceName;
- (void)setAccessTime:(id)a3;
- (void)setApiKeyId:(id)a3;
- (void)setAuthenticatedClientUserId:(id)a3;
- (void)setBusinessAdmin:(id)a3;
- (void)setServiceName:(id)a3;
- (void)setUserId:(id)a3;
@end

@implementation EDAMServiceAccessEntry

+ (id)structFields
{
  v12[6] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_2866;
  if (!structFields_structFields_2866)
  {
    v3 = +[FATField fieldWithIndex:1 type:10 optional:1 name:@"accessTime"];
    v12[0] = v3;
    v4 = +[FATField fieldWithIndex:2 type:11 optional:1 name:@"serviceName"];
    v12[1] = v4;
    v5 = +[FATField fieldWithIndex:3 type:8 optional:1 name:@"userId"];
    v12[2] = v5;
    v6 = +[FATField fieldWithIndex:4 type:8 optional:1 name:@"authenticatedClientUserId"];
    v12[3] = v6;
    v7 = +[FATField fieldWithIndex:5 type:8 optional:1 name:@"apiKeyId"];
    v12[4] = v7;
    v8 = +[FATField fieldWithIndex:6 type:2 optional:1 name:@"businessAdmin"];
    v12[5] = v8;
    uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:6];
    v10 = (void *)structFields_structFields_2866;
    structFields_structFields_2866 = v9;

    v2 = (void *)structFields_structFields_2866;
  }
  return v2;
}

+ (id)structName
{
  return @"ServiceAccessEntry";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_businessAdmin, 0);
  objc_storeStrong((id *)&self->_apiKeyId, 0);
  objc_storeStrong((id *)&self->_authenticatedClientUserId, 0);
  objc_storeStrong((id *)&self->_userId, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_accessTime, 0);
}

- (void)setBusinessAdmin:(id)a3
{
}

- (NSNumber)businessAdmin
{
  return self->_businessAdmin;
}

- (void)setApiKeyId:(id)a3
{
}

- (NSNumber)apiKeyId
{
  return self->_apiKeyId;
}

- (void)setAuthenticatedClientUserId:(id)a3
{
}

- (NSNumber)authenticatedClientUserId
{
  return self->_authenticatedClientUserId;
}

- (void)setUserId:(id)a3
{
}

- (NSNumber)userId
{
  return self->_userId;
}

- (void)setServiceName:(id)a3
{
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setAccessTime:(id)a3
{
}

- (NSNumber)accessTime
{
  return self->_accessTime;
}

@end