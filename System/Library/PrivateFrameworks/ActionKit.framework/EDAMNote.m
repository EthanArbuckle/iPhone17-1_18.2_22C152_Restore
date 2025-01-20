@interface EDAMNote
+ (id)structFields;
+ (id)structName;
- (EDAMNoteAttributes)attributes;
- (EDAMNoteLimits)limits;
- (EDAMNoteRestrictions)restrictions;
- (NSArray)resources;
- (NSArray)sharedNotes;
- (NSArray)tagGuids;
- (NSArray)tagNames;
- (NSData)contentHash;
- (NSNumber)active;
- (NSNumber)contentLength;
- (NSNumber)created;
- (NSNumber)deleted;
- (NSNumber)updateSequenceNum;
- (NSNumber)updated;
- (NSString)content;
- (NSString)guid;
- (NSString)notebookGuid;
- (NSString)title;
- (void)setActive:(id)a3;
- (void)setAttributes:(id)a3;
- (void)setContent:(id)a3;
- (void)setContentHash:(id)a3;
- (void)setContentLength:(id)a3;
- (void)setCreated:(id)a3;
- (void)setDeleted:(id)a3;
- (void)setGuid:(id)a3;
- (void)setLimits:(id)a3;
- (void)setNotebookGuid:(id)a3;
- (void)setResources:(id)a3;
- (void)setRestrictions:(id)a3;
- (void)setSharedNotes:(id)a3;
- (void)setTagGuids:(id)a3;
- (void)setTagNames:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUpdateSequenceNum:(id)a3;
- (void)setUpdated:(id)a3;
@end

@implementation EDAMNote

+ (id)structFields
{
  v28[18] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_1784;
  if (!structFields_structFields_1784)
  {
    v27 = +[FATField fieldWithIndex:1 type:11 optional:1 name:@"guid"];
    v28[0] = v27;
    v26 = +[FATField fieldWithIndex:2 type:11 optional:1 name:@"title"];
    v28[1] = v26;
    v25 = +[FATField fieldWithIndex:3 type:11 optional:1 name:@"content"];
    v28[2] = v25;
    v24 = +[FATField fieldWithIndex:4 type:16 optional:1 name:@"contentHash"];
    v28[3] = v24;
    v23 = +[FATField fieldWithIndex:5 type:8 optional:1 name:@"contentLength"];
    v28[4] = v23;
    v22 = +[FATField fieldWithIndex:6 type:10 optional:1 name:@"created"];
    v28[5] = v22;
    v21 = +[FATField fieldWithIndex:7 type:10 optional:1 name:@"updated"];
    v28[6] = v21;
    v20 = +[FATField fieldWithIndex:8 type:10 optional:1 name:@"deleted"];
    v28[7] = v20;
    v19 = +[FATField fieldWithIndex:9 type:2 optional:1 name:@"active"];
    v28[8] = v19;
    v18 = +[FATField fieldWithIndex:10 type:8 optional:1 name:@"updateSequenceNum"];
    v28[9] = v18;
    v17 = +[FATField fieldWithIndex:11 type:11 optional:1 name:@"notebookGuid"];
    v28[10] = v17;
    v16 = +[FATField fieldWithIndex:0 type:11 optional:1 name:0];
    v3 = +[FATField fieldWithIndex:12 type:15 optional:1 name:@"tagGuids" valueField:v16];
    v28[11] = v3;
    v4 = +[FATField fieldWithIndex:0 type:12 optional:1 name:0 structClass:objc_opt_class()];
    v5 = +[FATField fieldWithIndex:13 type:15 optional:1 name:@"resources" valueField:v4];
    v28[12] = v5;
    v6 = +[FATField fieldWithIndex:14 type:12 optional:1 name:@"attributes" structClass:objc_opt_class()];
    v28[13] = v6;
    v7 = +[FATField fieldWithIndex:0 type:11 optional:1 name:0];
    v8 = +[FATField fieldWithIndex:15 type:15 optional:1 name:@"tagNames" valueField:v7];
    v28[14] = v8;
    v9 = +[FATField fieldWithIndex:0 type:12 optional:1 name:0 structClass:objc_opt_class()];
    v10 = +[FATField fieldWithIndex:16 type:15 optional:1 name:@"sharedNotes" valueField:v9];
    v28[15] = v10;
    v11 = +[FATField fieldWithIndex:17 type:12 optional:1 name:@"restrictions" structClass:objc_opt_class()];
    v28[16] = v11;
    v12 = +[FATField fieldWithIndex:18 type:12 optional:1 name:@"limits" structClass:objc_opt_class()];
    v28[17] = v12;
    uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:18];
    v14 = (void *)structFields_structFields_1784;
    structFields_structFields_1784 = v13;

    v2 = (void *)structFields_structFields_1784;
  }
  return v2;
}

+ (id)structName
{
  return @"Note";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_limits, 0);
  objc_storeStrong((id *)&self->_restrictions, 0);
  objc_storeStrong((id *)&self->_sharedNotes, 0);
  objc_storeStrong((id *)&self->_tagNames, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_resources, 0);
  objc_storeStrong((id *)&self->_tagGuids, 0);
  objc_storeStrong((id *)&self->_notebookGuid, 0);
  objc_storeStrong((id *)&self->_updateSequenceNum, 0);
  objc_storeStrong((id *)&self->_active, 0);
  objc_storeStrong((id *)&self->_deleted, 0);
  objc_storeStrong((id *)&self->_updated, 0);
  objc_storeStrong((id *)&self->_created, 0);
  objc_storeStrong((id *)&self->_contentLength, 0);
  objc_storeStrong((id *)&self->_contentHash, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_guid, 0);
}

- (void)setLimits:(id)a3
{
}

- (EDAMNoteLimits)limits
{
  return self->_limits;
}

- (void)setRestrictions:(id)a3
{
}

- (EDAMNoteRestrictions)restrictions
{
  return self->_restrictions;
}

- (void)setSharedNotes:(id)a3
{
}

- (NSArray)sharedNotes
{
  return self->_sharedNotes;
}

- (void)setTagNames:(id)a3
{
}

- (NSArray)tagNames
{
  return self->_tagNames;
}

- (void)setAttributes:(id)a3
{
}

- (EDAMNoteAttributes)attributes
{
  return self->_attributes;
}

- (void)setResources:(id)a3
{
}

- (NSArray)resources
{
  return self->_resources;
}

- (void)setTagGuids:(id)a3
{
}

- (NSArray)tagGuids
{
  return self->_tagGuids;
}

- (void)setNotebookGuid:(id)a3
{
}

- (NSString)notebookGuid
{
  return self->_notebookGuid;
}

- (void)setUpdateSequenceNum:(id)a3
{
}

- (NSNumber)updateSequenceNum
{
  return self->_updateSequenceNum;
}

- (void)setActive:(id)a3
{
}

- (NSNumber)active
{
  return self->_active;
}

- (void)setDeleted:(id)a3
{
}

- (NSNumber)deleted
{
  return self->_deleted;
}

- (void)setUpdated:(id)a3
{
}

- (NSNumber)updated
{
  return self->_updated;
}

- (void)setCreated:(id)a3
{
}

- (NSNumber)created
{
  return self->_created;
}

- (void)setContentLength:(id)a3
{
}

- (NSNumber)contentLength
{
  return self->_contentLength;
}

- (void)setContentHash:(id)a3
{
}

- (NSData)contentHash
{
  return self->_contentHash;
}

- (void)setContent:(id)a3
{
}

- (NSString)content
{
  return self->_content;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setGuid:(id)a3
{
}

- (NSString)guid
{
  return self->_guid;
}

@end