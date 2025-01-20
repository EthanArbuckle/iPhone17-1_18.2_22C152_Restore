@interface EDAMPublicUserInfo
+ (id)structFields;
+ (id)structName;
- (NSNumber)privilege;
- (NSNumber)serviceLevel;
- (NSNumber)userId;
- (NSString)noteStoreUrl;
- (NSString)shardId;
- (NSString)username;
- (NSString)webApiUrlPrefix;
- (void)setNoteStoreUrl:(id)a3;
- (void)setPrivilege:(id)a3;
- (void)setServiceLevel:(id)a3;
- (void)setShardId:(id)a3;
- (void)setUserId:(id)a3;
- (void)setUsername:(id)a3;
- (void)setWebApiUrlPrefix:(id)a3;
@end

@implementation EDAMPublicUserInfo

+ (id)structFields
{
  v13[7] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_24397;
  if (!structFields_structFields_24397)
  {
    v3 = +[FATField fieldWithIndex:1 type:8 optional:0 name:@"userId"];
    v4 = +[FATField fieldWithIndex:2, 11, 0, @"shardId", v3 type optional name];
    v13[1] = v4;
    v5 = +[FATField fieldWithIndex:3 type:8 optional:1 name:@"privilege"];
    v13[2] = v5;
    v6 = +[FATField fieldWithIndex:7 type:8 optional:1 name:@"serviceLevel"];
    v13[3] = v6;
    v7 = +[FATField fieldWithIndex:4 type:11 optional:1 name:@"username"];
    v13[4] = v7;
    v8 = +[FATField fieldWithIndex:5 type:11 optional:1 name:@"noteStoreUrl"];
    v13[5] = v8;
    v9 = +[FATField fieldWithIndex:6 type:11 optional:1 name:@"webApiUrlPrefix"];
    v13[6] = v9;
    uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:7];
    v11 = (void *)structFields_structFields_24397;
    structFields_structFields_24397 = v10;

    v2 = (void *)structFields_structFields_24397;
  }
  return v2;
}

+ (id)structName
{
  return @"PublicUserInfo";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webApiUrlPrefix, 0);
  objc_storeStrong((id *)&self->_noteStoreUrl, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_serviceLevel, 0);
  objc_storeStrong((id *)&self->_privilege, 0);
  objc_storeStrong((id *)&self->_shardId, 0);
  objc_storeStrong((id *)&self->_userId, 0);
}

- (void)setWebApiUrlPrefix:(id)a3
{
}

- (NSString)webApiUrlPrefix
{
  return self->_webApiUrlPrefix;
}

- (void)setNoteStoreUrl:(id)a3
{
}

- (NSString)noteStoreUrl
{
  return self->_noteStoreUrl;
}

- (void)setUsername:(id)a3
{
}

- (NSString)username
{
  return self->_username;
}

- (void)setServiceLevel:(id)a3
{
}

- (NSNumber)serviceLevel
{
  return self->_serviceLevel;
}

- (void)setPrivilege:(id)a3
{
}

- (NSNumber)privilege
{
  return self->_privilege;
}

- (void)setShardId:(id)a3
{
}

- (NSString)shardId
{
  return self->_shardId;
}

- (void)setUserId:(id)a3
{
}

- (NSNumber)userId
{
  return self->_userId;
}

@end