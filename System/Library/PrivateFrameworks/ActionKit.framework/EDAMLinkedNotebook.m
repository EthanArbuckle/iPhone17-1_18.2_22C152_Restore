@interface EDAMLinkedNotebook
+ (id)structFields;
+ (id)structName;
- (NSNumber)businessId;
- (NSNumber)updateSequenceNum;
- (NSString)guid;
- (NSString)noteStoreUrl;
- (NSString)shardId;
- (NSString)shareName;
- (NSString)sharedNotebookGlobalId;
- (NSString)stack;
- (NSString)uri;
- (NSString)username;
- (NSString)webApiUrlPrefix;
- (void)setBusinessId:(id)a3;
- (void)setGuid:(id)a3;
- (void)setNoteStoreUrl:(id)a3;
- (void)setShardId:(id)a3;
- (void)setShareName:(id)a3;
- (void)setSharedNotebookGlobalId:(id)a3;
- (void)setStack:(id)a3;
- (void)setUpdateSequenceNum:(id)a3;
- (void)setUri:(id)a3;
- (void)setUsername:(id)a3;
- (void)setWebApiUrlPrefix:(id)a3;
@end

@implementation EDAMLinkedNotebook

+ (id)structFields
{
  v17[11] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_2478;
  if (!structFields_structFields_2478)
  {
    v16 = +[FATField fieldWithIndex:2 type:11 optional:1 name:@"shareName"];
    v17[0] = v16;
    v15 = +[FATField fieldWithIndex:3 type:11 optional:1 name:@"username"];
    v17[1] = v15;
    v3 = +[FATField fieldWithIndex:4 type:11 optional:1 name:@"shardId"];
    v17[2] = v3;
    v4 = +[FATField fieldWithIndex:5 type:11 optional:1 name:@"sharedNotebookGlobalId"];
    v17[3] = v4;
    v5 = +[FATField fieldWithIndex:6 type:11 optional:1 name:@"uri"];
    v17[4] = v5;
    v6 = +[FATField fieldWithIndex:7 type:11 optional:1 name:@"guid"];
    v17[5] = v6;
    v7 = +[FATField fieldWithIndex:8 type:8 optional:1 name:@"updateSequenceNum"];
    v17[6] = v7;
    v8 = +[FATField fieldWithIndex:9 type:11 optional:1 name:@"noteStoreUrl"];
    v17[7] = v8;
    v9 = +[FATField fieldWithIndex:10 type:11 optional:1 name:@"webApiUrlPrefix"];
    v17[8] = v9;
    v10 = +[FATField fieldWithIndex:11 type:11 optional:1 name:@"stack"];
    v17[9] = v10;
    v11 = +[FATField fieldWithIndex:12 type:8 optional:1 name:@"businessId"];
    v17[10] = v11;
    uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:11];
    v13 = (void *)structFields_structFields_2478;
    structFields_structFields_2478 = v12;

    v2 = (void *)structFields_structFields_2478;
  }
  return v2;
}

+ (id)structName
{
  return @"LinkedNotebook";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_businessId, 0);
  objc_storeStrong((id *)&self->_stack, 0);
  objc_storeStrong((id *)&self->_webApiUrlPrefix, 0);
  objc_storeStrong((id *)&self->_noteStoreUrl, 0);
  objc_storeStrong((id *)&self->_updateSequenceNum, 0);
  objc_storeStrong((id *)&self->_guid, 0);
  objc_storeStrong((id *)&self->_uri, 0);
  objc_storeStrong((id *)&self->_sharedNotebookGlobalId, 0);
  objc_storeStrong((id *)&self->_shardId, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_shareName, 0);
}

- (void)setBusinessId:(id)a3
{
}

- (NSNumber)businessId
{
  return self->_businessId;
}

- (void)setStack:(id)a3
{
}

- (NSString)stack
{
  return self->_stack;
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

- (void)setUri:(id)a3
{
}

- (NSString)uri
{
  return self->_uri;
}

- (void)setSharedNotebookGlobalId:(id)a3
{
}

- (NSString)sharedNotebookGlobalId
{
  return self->_sharedNotebookGlobalId;
}

- (void)setShardId:(id)a3
{
}

- (NSString)shardId
{
  return self->_shardId;
}

- (void)setUsername:(id)a3
{
}

- (NSString)username
{
  return self->_username;
}

- (void)setShareName:(id)a3
{
}

- (NSString)shareName
{
  return self->_shareName;
}

@end