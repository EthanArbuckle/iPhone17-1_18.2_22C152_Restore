@interface EDAMCreateOrUpdateNotebookSharesResult
+ (id)structFields;
+ (id)structName;
- (NSArray)matchingShares;
- (NSNumber)updateSequenceNum;
- (void)setMatchingShares:(id)a3;
- (void)setUpdateSequenceNum:(id)a3;
@end

@implementation EDAMCreateOrUpdateNotebookSharesResult

+ (id)structFields
{
  v9[2] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_1824;
  if (!structFields_structFields_1824)
  {
    v3 = +[FATField fieldWithIndex:1 type:8 optional:1 name:@"updateSequenceNum"];
    v9[0] = v3;
    v4 = +[FATField fieldWithIndex:0 type:12 optional:1 name:0 structClass:objc_opt_class()];
    v5 = +[FATField fieldWithIndex:2 type:15 optional:1 name:@"matchingShares" valueField:v4];
    v9[1] = v5;
    uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:2];
    v7 = (void *)structFields_structFields_1824;
    structFields_structFields_1824 = v6;

    v2 = (void *)structFields_structFields_1824;
  }
  return v2;
}

+ (id)structName
{
  return @"CreateOrUpdateNotebookSharesResult";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchingShares, 0);
  objc_storeStrong((id *)&self->_updateSequenceNum, 0);
}

- (void)setMatchingShares:(id)a3
{
}

- (NSArray)matchingShares
{
  return self->_matchingShares;
}

- (void)setUpdateSequenceNum:(id)a3
{
}

- (NSNumber)updateSequenceNum
{
  return self->_updateSequenceNum;
}

@end