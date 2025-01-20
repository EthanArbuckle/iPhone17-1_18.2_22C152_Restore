@interface EDAMLinkedAccount
+ (id)structFields;
+ (id)structName;
- (NSNumber)inAccountUserId;
- (NSNumber)updateSequenceNum;
- (NSString)guid;
- (NSString)noteStoreUrl;
- (NSString)shardId;
- (NSString)webApiUrlPrefix;
- (void)setGuid:(id)a3;
- (void)setInAccountUserId:(id)a3;
- (void)setNoteStoreUrl:(id)a3;
- (void)setShardId:(id)a3;
- (void)setUpdateSequenceNum:(id)a3;
- (void)setWebApiUrlPrefix:(id)a3;
@end

@implementation EDAMLinkedAccount

+ (id)structFields
{
  v12[6] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_2948;
  if (!structFields_structFields_2948)
  {
    v3 = +[FATField fieldWithIndex:1 type:8 optional:1 name:@"inAccountUserId"];
    v12[0] = v3;
    v4 = +[FATField fieldWithIndex:2 type:11 optional:1 name:@"shardId"];
    v12[1] = v4;
    v5 = +[FATField fieldWithIndex:3 type:11 optional:1 name:@"guid"];
    v12[2] = v5;
    v6 = +[FATField fieldWithIndex:4 type:8 optional:1 name:@"updateSequenceNum"];
    v12[3] = v6;
    v7 = +[FATField fieldWithIndex:5 type:11 optional:1 name:@"noteStoreUrl"];
    v12[4] = v7;
    v8 = +[FATField fieldWithIndex:6 type:11 optional:1 name:@"webApiUrlPrefix"];
    v12[5] = v8;
    uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:6];
    v10 = (void *)structFields_structFields_2948;
    structFields_structFields_2948 = v9;

    v2 = (void *)structFields_structFields_2948;
  }
  return v2;
}

+ (id)structName
{
  return @"LinkedAccount";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webApiUrlPrefix, 0);
  objc_storeStrong((id *)&self->_noteStoreUrl, 0);
  objc_storeStrong((id *)&self->_updateSequenceNum, 0);
  objc_storeStrong((id *)&self->_guid, 0);
  objc_storeStrong((id *)&self->_shardId, 0);
  objc_storeStrong((id *)&self->_inAccountUserId, 0);
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

- (void)setUpdateSequenceNum:(id)a3
{
}

- (NSNumber)updateSequenceNum
{
  return self->_updateSequenceNum;
}

- (void)setGuid:(id)a3
{
}

- (NSString)guid
{
  return self->_guid;
}

- (void)setShardId:(id)a3
{
}

- (NSString)shardId
{
  return self->_shardId;
}

- (void)setInAccountUserId:(id)a3
{
}

- (NSNumber)inAccountUserId
{
  return self->_inAccountUserId;
}

@end