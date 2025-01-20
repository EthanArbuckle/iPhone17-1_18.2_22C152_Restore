@interface EDAMNoteCollectionCounts
+ (id)structFields;
+ (id)structName;
- (NSDictionary)notebookCounts;
- (NSDictionary)tagCounts;
- (NSNumber)trashCount;
- (void)setNotebookCounts:(id)a3;
- (void)setTagCounts:(id)a3;
- (void)setTrashCount:(id)a3;
@end

@implementation EDAMNoteCollectionCounts

+ (id)structFields
{
  v13[3] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_790;
  if (!structFields_structFields_790)
  {
    v3 = +[FATField fieldWithIndex:0 type:11 optional:1 name:0];
    v4 = +[FATField fieldWithIndex:0 type:8 optional:1 name:0];
    v5 = +[FATField fieldWithIndex:1 type:13 optional:1 name:@"notebookCounts" keyField:v3 valueField:v4];
    v6 = +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 0, 11, 1, 0, v5);
    v7 = +[FATField fieldWithIndex:0 type:8 optional:1 name:0];
    v8 = +[FATField fieldWithIndex:2 type:13 optional:1 name:@"tagCounts" keyField:v6 valueField:v7];
    v13[1] = v8;
    v9 = +[FATField fieldWithIndex:3 type:8 optional:1 name:@"trashCount"];
    v13[2] = v9;
    uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:3];
    v11 = (void *)structFields_structFields_790;
    structFields_structFields_790 = v10;

    v2 = (void *)structFields_structFields_790;
  }
  return v2;
}

+ (id)structName
{
  return @"NoteCollectionCounts";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trashCount, 0);
  objc_storeStrong((id *)&self->_tagCounts, 0);
  objc_storeStrong((id *)&self->_notebookCounts, 0);
}

- (void)setTrashCount:(id)a3
{
}

- (NSNumber)trashCount
{
  return self->_trashCount;
}

- (void)setTagCounts:(id)a3
{
}

- (NSDictionary)tagCounts
{
  return self->_tagCounts;
}

- (void)setNotebookCounts:(id)a3
{
}

- (NSDictionary)notebookCounts
{
  return self->_notebookCounts;
}

@end