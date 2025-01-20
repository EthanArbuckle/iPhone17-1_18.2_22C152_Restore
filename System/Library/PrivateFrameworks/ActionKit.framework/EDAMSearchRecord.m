@interface EDAMSearchRecord
+ (id)structFields;
+ (id)structName;
- (EDAMNoteFilter)noteFilter;
- (NSNumber)noteCount;
- (NSNumber)noteRank;
- (NSNumber)searchScope;
- (NSNumber)searchTime;
- (NSNumber)selectTime;
- (NSString)selectedNoteGUID;
- (NSString)userQuery;
- (void)setNoteCount:(id)a3;
- (void)setNoteFilter:(id)a3;
- (void)setNoteRank:(id)a3;
- (void)setSearchScope:(id)a3;
- (void)setSearchTime:(id)a3;
- (void)setSelectTime:(id)a3;
- (void)setSelectedNoteGUID:(id)a3;
- (void)setUserQuery:(id)a3;
@end

@implementation EDAMSearchRecord

+ (id)structFields
{
  v14[8] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_1976;
  if (!structFields_structFields_1976)
  {
    v3 = +[FATField fieldWithIndex:1 type:11 optional:1 name:@"userQuery"];
    v14[0] = v3;
    v4 = +[FATField fieldWithIndex:2 type:12 optional:1 name:@"noteFilter" structClass:objc_opt_class()];
    v14[1] = v4;
    v5 = +[FATField fieldWithIndex:3 type:8 optional:1 name:@"searchScope"];
    v14[2] = v5;
    v6 = +[FATField fieldWithIndex:4 type:10 optional:1 name:@"searchTime"];
    v14[3] = v6;
    v7 = +[FATField fieldWithIndex:5 type:11 optional:1 name:@"selectedNoteGUID"];
    v14[4] = v7;
    v8 = +[FATField fieldWithIndex:6 type:10 optional:1 name:@"selectTime"];
    v14[5] = v8;
    v9 = +[FATField fieldWithIndex:7 type:8 optional:1 name:@"noteRank"];
    v14[6] = v9;
    v10 = +[FATField fieldWithIndex:8 type:8 optional:1 name:@"noteCount"];
    v14[7] = v10;
    uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:8];
    v12 = (void *)structFields_structFields_1976;
    structFields_structFields_1976 = v11;

    v2 = (void *)structFields_structFields_1976;
  }
  return v2;
}

+ (id)structName
{
  return @"SearchRecord";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noteCount, 0);
  objc_storeStrong((id *)&self->_noteRank, 0);
  objc_storeStrong((id *)&self->_selectTime, 0);
  objc_storeStrong((id *)&self->_selectedNoteGUID, 0);
  objc_storeStrong((id *)&self->_searchTime, 0);
  objc_storeStrong((id *)&self->_searchScope, 0);
  objc_storeStrong((id *)&self->_noteFilter, 0);
  objc_storeStrong((id *)&self->_userQuery, 0);
}

- (void)setNoteCount:(id)a3
{
}

- (NSNumber)noteCount
{
  return self->_noteCount;
}

- (void)setNoteRank:(id)a3
{
}

- (NSNumber)noteRank
{
  return self->_noteRank;
}

- (void)setSelectTime:(id)a3
{
}

- (NSNumber)selectTime
{
  return self->_selectTime;
}

- (void)setSelectedNoteGUID:(id)a3
{
}

- (NSString)selectedNoteGUID
{
  return self->_selectedNoteGUID;
}

- (void)setSearchTime:(id)a3
{
}

- (NSNumber)searchTime
{
  return self->_searchTime;
}

- (void)setSearchScope:(id)a3
{
}

- (NSNumber)searchScope
{
  return self->_searchScope;
}

- (void)setNoteFilter:(id)a3
{
}

- (EDAMNoteFilter)noteFilter
{
  return self->_noteFilter;
}

- (void)setUserQuery:(id)a3
{
}

- (NSString)userQuery
{
  return self->_userQuery;
}

@end