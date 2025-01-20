@interface EDAMNotebookDescriptor
+ (id)structFields;
+ (id)structName;
- (NSNumber)hasSharedNotebook;
- (NSNumber)joinedUserCount;
- (NSString)contactName;
- (NSString)guid;
- (NSString)notebookDisplayName;
- (void)setContactName:(id)a3;
- (void)setGuid:(id)a3;
- (void)setHasSharedNotebook:(id)a3;
- (void)setJoinedUserCount:(id)a3;
- (void)setNotebookDisplayName:(id)a3;
@end

@implementation EDAMNotebookDescriptor

+ (id)structFields
{
  v11[5] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_2519;
  if (!structFields_structFields_2519)
  {
    v3 = +[FATField fieldWithIndex:1 type:11 optional:1 name:@"guid"];
    v4 = +[FATField fieldWithIndex:2, 11, 1, @"notebookDisplayName", v3 type optional name];
    v11[1] = v4;
    v5 = +[FATField fieldWithIndex:3 type:11 optional:1 name:@"contactName"];
    v11[2] = v5;
    v6 = +[FATField fieldWithIndex:4 type:2 optional:1 name:@"hasSharedNotebook"];
    v11[3] = v6;
    v7 = +[FATField fieldWithIndex:5 type:8 optional:1 name:@"joinedUserCount"];
    v11[4] = v7;
    uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:5];
    v9 = (void *)structFields_structFields_2519;
    structFields_structFields_2519 = v8;

    v2 = (void *)structFields_structFields_2519;
  }
  return v2;
}

+ (id)structName
{
  return @"NotebookDescriptor";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_joinedUserCount, 0);
  objc_storeStrong((id *)&self->_hasSharedNotebook, 0);
  objc_storeStrong((id *)&self->_contactName, 0);
  objc_storeStrong((id *)&self->_notebookDisplayName, 0);
  objc_storeStrong((id *)&self->_guid, 0);
}

- (void)setJoinedUserCount:(id)a3
{
}

- (NSNumber)joinedUserCount
{
  return self->_joinedUserCount;
}

- (void)setHasSharedNotebook:(id)a3
{
}

- (NSNumber)hasSharedNotebook
{
  return self->_hasSharedNotebook;
}

- (void)setContactName:(id)a3
{
}

- (NSString)contactName
{
  return self->_contactName;
}

- (void)setNotebookDisplayName:(id)a3
{
}

- (NSString)notebookDisplayName
{
  return self->_notebookDisplayName;
}

- (void)setGuid:(id)a3
{
}

- (NSString)guid
{
  return self->_guid;
}

@end