@interface EDAMBusinessQueryResult
+ (id)structFields;
+ (id)structName;
- (NSArray)experts;
- (NSArray)matchingNotebooks;
- (NSDictionary)totalNotesByNotebook;
- (NSNumber)totalNotebooks;
- (void)setExperts:(id)a3;
- (void)setMatchingNotebooks:(id)a3;
- (void)setTotalNotebooks:(id)a3;
- (void)setTotalNotesByNotebook:(id)a3;
@end

@implementation EDAMBusinessQueryResult

+ (id)structFields
{
  v14[4] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_1440;
  if (!structFields_structFields_1440)
  {
    v3 = +[FATField fieldWithIndex:1 type:8 optional:1 name:@"totalNotebooks"];
    v14[0] = v3;
    v4 = +[FATField fieldWithIndex:0 type:11 optional:1 name:0];
    v5 = +[FATField fieldWithIndex:0 type:8 optional:1 name:0];
    v6 = +[FATField fieldWithIndex:2 type:13 optional:1 name:@"totalNotesByNotebook" keyField:v4 valueField:v5];
    v14[1] = v6;
    v7 = +[FATField fieldWithIndex:0 type:12 optional:1 name:0 structClass:objc_opt_class()];
    v8 = +[FATField fieldWithIndex:3 type:15 optional:1 name:@"experts" valueField:v7];
    v14[2] = v8;
    v9 = +[FATField fieldWithIndex:0 type:12 optional:1 name:0 structClass:objc_opt_class()];
    v10 = +[FATField fieldWithIndex:4 type:15 optional:1 name:@"matchingNotebooks" valueField:v9];
    v14[3] = v10;
    uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:4];
    v12 = (void *)structFields_structFields_1440;
    structFields_structFields_1440 = v11;

    v2 = (void *)structFields_structFields_1440;
  }
  return v2;
}

+ (id)structName
{
  return @"BusinessQueryResult";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchingNotebooks, 0);
  objc_storeStrong((id *)&self->_experts, 0);
  objc_storeStrong((id *)&self->_totalNotesByNotebook, 0);
  objc_storeStrong((id *)&self->_totalNotebooks, 0);
}

- (void)setMatchingNotebooks:(id)a3
{
}

- (NSArray)matchingNotebooks
{
  return self->_matchingNotebooks;
}

- (void)setExperts:(id)a3
{
}

- (NSArray)experts
{
  return self->_experts;
}

- (void)setTotalNotesByNotebook:(id)a3
{
}

- (NSDictionary)totalNotesByNotebook
{
  return self->_totalNotesByNotebook;
}

- (void)setTotalNotebooks:(id)a3
{
}

- (NSNumber)totalNotebooks
{
  return self->_totalNotebooks;
}

@end