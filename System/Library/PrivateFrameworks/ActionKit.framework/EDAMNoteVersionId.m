@interface EDAMNoteVersionId
+ (id)structFields;
+ (id)structName;
- (NSNumber)lastEditorId;
- (NSNumber)saved;
- (NSNumber)updateSequenceNum;
- (NSNumber)updated;
- (NSString)title;
- (void)setLastEditorId:(id)a3;
- (void)setSaved:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUpdateSequenceNum:(id)a3;
- (void)setUpdated:(id)a3;
@end

@implementation EDAMNoteVersionId

+ (id)structFields
{
  v11[5] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_1013;
  if (!structFields_structFields_1013)
  {
    v3 = +[FATField fieldWithIndex:1 type:8 optional:0 name:@"updateSequenceNum"];
    v4 = +[FATField fieldWithIndex:2, 10, 0, @"updated", v3 type optional name];
    v11[1] = v4;
    v5 = +[FATField fieldWithIndex:3 type:10 optional:0 name:@"saved"];
    v11[2] = v5;
    v6 = +[FATField fieldWithIndex:4 type:11 optional:0 name:@"title"];
    v11[3] = v6;
    v7 = +[FATField fieldWithIndex:5 type:8 optional:1 name:@"lastEditorId"];
    v11[4] = v7;
    uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:5];
    v9 = (void *)structFields_structFields_1013;
    structFields_structFields_1013 = v8;

    v2 = (void *)structFields_structFields_1013;
  }
  return v2;
}

+ (id)structName
{
  return @"NoteVersionId";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastEditorId, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_saved, 0);
  objc_storeStrong((id *)&self->_updated, 0);
  objc_storeStrong((id *)&self->_updateSequenceNum, 0);
}

- (void)setLastEditorId:(id)a3
{
}

- (NSNumber)lastEditorId
{
  return self->_lastEditorId;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setSaved:(id)a3
{
}

- (NSNumber)saved
{
  return self->_saved;
}

- (void)setUpdated:(id)a3
{
}

- (NSNumber)updated
{
  return self->_updated;
}

- (void)setUpdateSequenceNum:(id)a3
{
}

- (NSNumber)updateSequenceNum
{
  return self->_updateSequenceNum;
}

@end