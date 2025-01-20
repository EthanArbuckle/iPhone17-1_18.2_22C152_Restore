@interface EDAMUserUrls
+ (id)structFields;
+ (id)structName;
- (NSString)communicationEngineUrl;
- (NSString)messageStoreUrl;
- (NSString)noteStoreUrl;
- (NSString)userStoreUrl;
- (NSString)userWebSocketUrl;
- (NSString)utilityUrl;
- (NSString)webApiUrlPrefix;
- (void)setCommunicationEngineUrl:(id)a3;
- (void)setMessageStoreUrl:(id)a3;
- (void)setNoteStoreUrl:(id)a3;
- (void)setUserStoreUrl:(id)a3;
- (void)setUserWebSocketUrl:(id)a3;
- (void)setUtilityUrl:(id)a3;
- (void)setWebApiUrlPrefix:(id)a3;
@end

@implementation EDAMUserUrls

+ (id)structFields
{
  v13[7] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_67;
  if (!structFields_structFields_67)
  {
    v3 = +[FATField fieldWithIndex:1 type:11 optional:1 name:@"noteStoreUrl"];
    v4 = +[FATField fieldWithIndex:2, 11, 1, @"webApiUrlPrefix", v3 type optional name];
    v13[1] = v4;
    v5 = +[FATField fieldWithIndex:3 type:11 optional:1 name:@"userStoreUrl"];
    v13[2] = v5;
    v6 = +[FATField fieldWithIndex:4 type:11 optional:1 name:@"utilityUrl"];
    v13[3] = v6;
    v7 = +[FATField fieldWithIndex:5 type:11 optional:1 name:@"messageStoreUrl"];
    v13[4] = v7;
    v8 = +[FATField fieldWithIndex:6 type:11 optional:1 name:@"userWebSocketUrl"];
    v13[5] = v8;
    v9 = +[FATField fieldWithIndex:7 type:11 optional:1 name:@"communicationEngineUrl"];
    v13[6] = v9;
    uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:7];
    v11 = (void *)structFields_structFields_67;
    structFields_structFields_67 = v10;

    v2 = (void *)structFields_structFields_67;
  }
  return v2;
}

+ (id)structName
{
  return @"UserUrls";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_communicationEngineUrl, 0);
  objc_storeStrong((id *)&self->_userWebSocketUrl, 0);
  objc_storeStrong((id *)&self->_messageStoreUrl, 0);
  objc_storeStrong((id *)&self->_utilityUrl, 0);
  objc_storeStrong((id *)&self->_userStoreUrl, 0);
  objc_storeStrong((id *)&self->_webApiUrlPrefix, 0);
  objc_storeStrong((id *)&self->_noteStoreUrl, 0);
}

- (void)setCommunicationEngineUrl:(id)a3
{
}

- (NSString)communicationEngineUrl
{
  return self->_communicationEngineUrl;
}

- (void)setUserWebSocketUrl:(id)a3
{
}

- (NSString)userWebSocketUrl
{
  return self->_userWebSocketUrl;
}

- (void)setMessageStoreUrl:(id)a3
{
}

- (NSString)messageStoreUrl
{
  return self->_messageStoreUrl;
}

- (void)setUtilityUrl:(id)a3
{
}

- (NSString)utilityUrl
{
  return self->_utilityUrl;
}

- (void)setUserStoreUrl:(id)a3
{
}

- (NSString)userStoreUrl
{
  return self->_userStoreUrl;
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

@end