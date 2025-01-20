@interface EDAMAuthenticationResult
+ (id)structFields;
+ (id)structName;
- (EDAMPublicUserInfo)publicUserInfo;
- (EDAMUser)user;
- (EDAMUserUrls)urls;
- (NSNumber)currentTime;
- (NSNumber)expiration;
- (NSNumber)secondFactorRequired;
- (NSString)authenticationToken;
- (NSString)noteStoreUrl;
- (NSString)secondFactorDeliveryHint;
- (NSString)webApiUrlPrefix;
- (void)setAuthenticationToken:(id)a3;
- (void)setCurrentTime:(id)a3;
- (void)setExpiration:(id)a3;
- (void)setNoteStoreUrl:(id)a3;
- (void)setPublicUserInfo:(id)a3;
- (void)setSecondFactorDeliveryHint:(id)a3;
- (void)setSecondFactorRequired:(id)a3;
- (void)setUrls:(id)a3;
- (void)setUser:(id)a3;
- (void)setWebApiUrlPrefix:(id)a3;
@end

@implementation EDAMAuthenticationResult

+ (id)structFields
{
  v16[10] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_116;
  if (!structFields_structFields_116)
  {
    v15 = +[FATField fieldWithIndex:1 type:10 optional:0 name:@"currentTime"];
    v16[0] = v15;
    v3 = +[FATField fieldWithIndex:2 type:11 optional:0 name:@"authenticationToken"];
    v16[1] = v3;
    v4 = +[FATField fieldWithIndex:3 type:10 optional:0 name:@"expiration"];
    v16[2] = v4;
    v5 = +[FATField fieldWithIndex:4 type:12 optional:1 name:@"user" structClass:objc_opt_class()];
    v16[3] = v5;
    v6 = +[FATField fieldWithIndex:5 type:12 optional:1 name:@"publicUserInfo" structClass:objc_opt_class()];
    v16[4] = v6;
    v7 = +[FATField fieldWithIndex:6 type:11 optional:1 name:@"noteStoreUrl"];
    v16[5] = v7;
    v8 = +[FATField fieldWithIndex:7 type:11 optional:1 name:@"webApiUrlPrefix"];
    v16[6] = v8;
    v9 = +[FATField fieldWithIndex:8 type:2 optional:1 name:@"secondFactorRequired"];
    v16[7] = v9;
    v10 = +[FATField fieldWithIndex:9 type:11 optional:1 name:@"secondFactorDeliveryHint"];
    v16[8] = v10;
    v11 = +[FATField fieldWithIndex:10 type:12 optional:1 name:@"urls" structClass:objc_opt_class()];
    v16[9] = v11;
    uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:10];
    v13 = (void *)structFields_structFields_116;
    structFields_structFields_116 = v12;

    v2 = (void *)structFields_structFields_116;
  }
  return v2;
}

+ (id)structName
{
  return @"AuthenticationResult";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urls, 0);
  objc_storeStrong((id *)&self->_secondFactorDeliveryHint, 0);
  objc_storeStrong((id *)&self->_secondFactorRequired, 0);
  objc_storeStrong((id *)&self->_webApiUrlPrefix, 0);
  objc_storeStrong((id *)&self->_noteStoreUrl, 0);
  objc_storeStrong((id *)&self->_publicUserInfo, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_expiration, 0);
  objc_storeStrong((id *)&self->_authenticationToken, 0);
  objc_storeStrong((id *)&self->_currentTime, 0);
}

- (void)setUrls:(id)a3
{
}

- (EDAMUserUrls)urls
{
  return self->_urls;
}

- (void)setSecondFactorDeliveryHint:(id)a3
{
}

- (NSString)secondFactorDeliveryHint
{
  return self->_secondFactorDeliveryHint;
}

- (void)setSecondFactorRequired:(id)a3
{
}

- (NSNumber)secondFactorRequired
{
  return self->_secondFactorRequired;
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

- (void)setPublicUserInfo:(id)a3
{
}

- (EDAMPublicUserInfo)publicUserInfo
{
  return self->_publicUserInfo;
}

- (void)setUser:(id)a3
{
}

- (EDAMUser)user
{
  return self->_user;
}

- (void)setExpiration:(id)a3
{
}

- (NSNumber)expiration
{
  return self->_expiration;
}

- (void)setAuthenticationToken:(id)a3
{
}

- (NSString)authenticationToken
{
  return self->_authenticationToken;
}

- (void)setCurrentTime:(id)a3
{
}

- (NSNumber)currentTime
{
  return self->_currentTime;
}

@end