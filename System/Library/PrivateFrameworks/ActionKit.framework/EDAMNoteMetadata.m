@interface EDAMNoteMetadata
+ (id)structFields;
+ (id)structName;
- (EDAMNoteAttributes)attributes;
- (NSArray)tagGuids;
- (NSNumber)contentLength;
- (NSNumber)created;
- (NSNumber)deleted;
- (NSNumber)largestResourceSize;
- (NSNumber)updateSequenceNum;
- (NSNumber)updated;
- (NSString)guid;
- (NSString)largestResourceMime;
- (NSString)notebookGuid;
- (NSString)title;
- (void)setAttributes:(id)a3;
- (void)setContentLength:(id)a3;
- (void)setCreated:(id)a3;
- (void)setDeleted:(id)a3;
- (void)setGuid:(id)a3;
- (void)setLargestResourceMime:(id)a3;
- (void)setLargestResourceSize:(id)a3;
- (void)setNotebookGuid:(id)a3;
- (void)setTagGuids:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUpdateSequenceNum:(id)a3;
- (void)setUpdated:(id)a3;
@end

@implementation EDAMNoteMetadata

+ (id)structFields
{
  v19[12] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_600;
  if (!structFields_structFields_600)
  {
    v18 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"guid"];
    v19[0] = v18;
    v17 = +[FATField fieldWithIndex:2 type:11 optional:1 name:@"title"];
    v19[1] = v17;
    v16 = +[FATField fieldWithIndex:5 type:8 optional:1 name:@"contentLength"];
    v19[2] = v16;
    v15 = +[FATField fieldWithIndex:6 type:10 optional:1 name:@"created"];
    v19[3] = v15;
    v3 = +[FATField fieldWithIndex:7 type:10 optional:1 name:@"updated"];
    v19[4] = v3;
    v4 = +[FATField fieldWithIndex:8 type:10 optional:1 name:@"deleted"];
    v19[5] = v4;
    v5 = +[FATField fieldWithIndex:10 type:8 optional:1 name:@"updateSequenceNum"];
    v19[6] = v5;
    v6 = +[FATField fieldWithIndex:11 type:11 optional:1 name:@"notebookGuid"];
    v19[7] = v6;
    v7 = +[FATField fieldWithIndex:0 type:11 optional:1 name:0];
    v8 = +[FATField fieldWithIndex:12 type:15 optional:1 name:@"tagGuids" valueField:v7];
    v19[8] = v8;
    v9 = +[FATField fieldWithIndex:14 type:12 optional:1 name:@"attributes" structClass:objc_opt_class()];
    v19[9] = v9;
    v10 = +[FATField fieldWithIndex:20 type:11 optional:1 name:@"largestResourceMime"];
    v19[10] = v10;
    v11 = +[FATField fieldWithIndex:21 type:8 optional:1 name:@"largestResourceSize"];
    v19[11] = v11;
    uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:12];
    v13 = (void *)structFields_structFields_600;
    structFields_structFields_600 = v12;

    v2 = (void *)structFields_structFields_600;
  }
  return v2;
}

+ (id)structName
{
  return @"NoteMetadata";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_largestResourceSize, 0);
  objc_storeStrong((id *)&self->_largestResourceMime, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_tagGuids, 0);
  objc_storeStrong((id *)&self->_notebookGuid, 0);
  objc_storeStrong((id *)&self->_updateSequenceNum, 0);
  objc_storeStrong((id *)&self->_deleted, 0);
  objc_storeStrong((id *)&self->_updated, 0);
  objc_storeStrong((id *)&self->_created, 0);
  objc_storeStrong((id *)&self->_contentLength, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_guid, 0);
}

- (void)setLargestResourceSize:(id)a3
{
}

- (NSNumber)largestResourceSize
{
  return self->_largestResourceSize;
}

- (void)setLargestResourceMime:(id)a3
{
}

- (NSString)largestResourceMime
{
  return self->_largestResourceMime;
}

- (void)setAttributes:(id)a3
{
}

- (EDAMNoteAttributes)attributes
{
  return self->_attributes;
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