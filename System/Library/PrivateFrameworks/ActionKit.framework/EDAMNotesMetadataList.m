@interface EDAMNotesMetadataList
+ (id)structFields;
+ (id)structName;
- (NSArray)notes;
- (NSArray)searchedWords;
- (NSArray)stoppedWords;
- (NSNumber)startIndex;
- (NSNumber)totalNotes;
- (NSNumber)updateCount;
- (void)setNotes:(id)a3;
- (void)setSearchedWords:(id)a3;
- (void)setStartIndex:(id)a3;
- (void)setStoppedWords:(id)a3;
- (void)setTotalNotes:(id)a3;
- (void)setUpdateCount:(id)a3;
@end

@implementation EDAMNotesMetadataList

+ (id)structFields
{
  v15[6] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_683;
  if (!structFields_structFields_683)
  {
    v3 = +[FATField fieldWithIndex:1 type:8 optional:0 name:@"startIndex"];
    v15[0] = v3;
    v4 = +[FATField fieldWithIndex:2 type:8 optional:0 name:@"totalNotes"];
    v15[1] = v4;
    v5 = +[FATField fieldWithIndex:0 type:12 optional:1 name:0 structClass:objc_opt_class()];
    v6 = +[FATField fieldWithIndex:3 type:15 optional:0 name:@"notes" valueField:v5];
    v15[2] = v6;
    v7 = +[FATField fieldWithIndex:0 type:11 optional:1 name:0];
    v8 = +[FATField fieldWithIndex:4 type:15 optional:1 name:@"stoppedWords" valueField:v7];
    v15[3] = v8;
    v9 = +[FATField fieldWithIndex:0 type:11 optional:1 name:0];
    v10 = +[FATField fieldWithIndex:5 type:15 optional:1 name:@"searchedWords" valueField:v9];
    v15[4] = v10;
    v11 = +[FATField fieldWithIndex:6 type:8 optional:1 name:@"updateCount"];
    v15[5] = v11;
    uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:6];
    v13 = (void *)structFields_structFields_683;
    structFields_structFields_683 = v12;

    v2 = (void *)structFields_structFields_683;
  }
  return v2;
}

+ (id)structName
{
  return @"NotesMetadataList";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateCount, 0);
  objc_storeStrong((id *)&self->_searchedWords, 0);
  objc_storeStrong((id *)&self->_stoppedWords, 0);
  objc_storeStrong((id *)&self->_notes, 0);
  objc_storeStrong((id *)&self->_totalNotes, 0);
  objc_storeStrong((id *)&self->_startIndex, 0);
}

- (void)setUpdateCount:(id)a3
{
}

- (NSNumber)updateCount
{
  return self->_updateCount;
}

- (void)setSearchedWords:(id)a3
{
}

- (NSArray)searchedWords
{
  return self->_searchedWords;
}

- (void)setStoppedWords:(id)a3
{
}

- (NSArray)stoppedWords
{
  return self->_stoppedWords;
}

- (void)setNotes:(id)a3
{
}

- (NSArray)notes
{
  return self->_notes;
}

- (void)setTotalNotes:(id)a3
{
}

- (NSNumber)totalNotes
{
  return self->_totalNotes;
}

- (void)setStartIndex:(id)a3
{
}

- (NSNumber)startIndex
{
  return self->_startIndex;
}

@end