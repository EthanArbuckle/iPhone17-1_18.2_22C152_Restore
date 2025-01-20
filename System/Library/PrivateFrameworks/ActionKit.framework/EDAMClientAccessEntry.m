@interface EDAMClientAccessEntry
+ (id)structFields;
+ (id)structName;
- (NSNumber)accessTime;
- (NSNumber)apiKeyId;
- (NSNumber)authenticatedClientUserId;
- (NSNumber)browserType;
- (NSNumber)businessAdmin;
- (NSNumber)longSessionCreated;
- (NSNumber)userId;
- (NSString)appName;
- (NSString)deviceName;
- (NSString)ipAddress;
- (NSString)location;
- (void)setAccessTime:(id)a3;
- (void)setApiKeyId:(id)a3;
- (void)setAppName:(id)a3;
- (void)setAuthenticatedClientUserId:(id)a3;
- (void)setBrowserType:(id)a3;
- (void)setBusinessAdmin:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setIpAddress:(id)a3;
- (void)setLocation:(id)a3;
- (void)setLongSessionCreated:(id)a3;
- (void)setUserId:(id)a3;
@end

@implementation EDAMClientAccessEntry

+ (id)structFields
{
  v17[11] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_2785;
  if (!structFields_structFields_2785)
  {
    v16 = +[FATField fieldWithIndex:1 type:10 optional:1 name:@"accessTime"];
    v17[0] = v16;
    v15 = +[FATField fieldWithIndex:2 type:11 optional:1 name:@"appName"];
    v17[1] = v15;
    v3 = +[FATField fieldWithIndex:3 type:11 optional:1 name:@"deviceName"];
    v17[2] = v3;
    v4 = +[FATField fieldWithIndex:4 type:11 optional:1 name:@"ipAddress"];
    v17[3] = v4;
    v5 = +[FATField fieldWithIndex:5 type:11 optional:1 name:@"location"];
    v17[4] = v5;
    v6 = +[FATField fieldWithIndex:6 type:8 optional:1 name:@"browserType"];
    v17[5] = v6;
    v7 = +[FATField fieldWithIndex:7 type:8 optional:1 name:@"apiKeyId"];
    v17[6] = v7;
    v8 = +[FATField fieldWithIndex:8 type:10 optional:1 name:@"longSessionCreated"];
    v17[7] = v8;
    v9 = +[FATField fieldWithIndex:9 type:8 optional:1 name:@"userId"];
    v17[8] = v9;
    v10 = +[FATField fieldWithIndex:10 type:8 optional:1 name:@"authenticatedClientUserId"];
    v17[9] = v10;
    v11 = +[FATField fieldWithIndex:11 type:2 optional:1 name:@"businessAdmin"];
    v17[10] = v11;
    uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:11];
    v13 = (void *)structFields_structFields_2785;
    structFields_structFields_2785 = v12;

    v2 = (void *)structFields_structFields_2785;
  }
  return v2;
}

+ (id)structName
{
  return @"ClientAccessEntry";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_businessAdmin, 0);
  objc_storeStrong((id *)&self->_authenticatedClientUserId, 0);
  objc_storeStrong((id *)&self->_userId, 0);
  objc_storeStrong((id *)&self->_longSessionCreated, 0);
  objc_storeStrong((id *)&self->_apiKeyId, 0);
  objc_storeStrong((id *)&self->_browserType, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_ipAddress, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_accessTime, 0);
}

- (void)setBusinessAdmin:(id)a3
{
}

- (NSNumber)businessAdmin
{
  return self->_businessAdmin;
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

- (void)setLongSessionCreated:(id)a3
{
}

- (NSNumber)longSessionCreated
{
  return self->_longSessionCreated;
}

- (void)setApiKeyId:(id)a3
{
}

- (NSNumber)apiKeyId
{
  return self->_apiKeyId;
}

- (void)setBrowserType:(id)a3
{
}

- (NSNumber)browserType
{
  return self->_browserType;
}

- (void)setLocation:(id)a3
{
}

- (NSString)location
{
  return self->_location;
}

- (void)setIpAddress:(id)a3
{
}

- (NSString)ipAddress
{
  return self->_ipAddress;
}

- (void)setDeviceName:(id)a3
{
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setAppName:(id)a3
{
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAccessTime:(id)a3
{
}

- (NSNumber)accessTime
{
  return self->_accessTime;
}

@end