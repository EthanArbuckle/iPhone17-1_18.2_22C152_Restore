@interface EDAMLogRequest
+ (id)structFields;
+ (id)structName;
- (EDAMSearchRecord)searchRecord;
- (void)setSearchRecord:(id)a3;
@end

@implementation EDAMLogRequest

+ (id)structFields
{
  v7[1] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_2049;
  if (!structFields_structFields_2049)
  {
    v3 = +[FATField fieldWithIndex:1 type:12 optional:1 name:@"searchRecord" structClass:objc_opt_class()];
    v7[0] = v3;
    uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
    v5 = (void *)structFields_structFields_2049;
    structFields_structFields_2049 = v4;

    v2 = (void *)structFields_structFields_2049;
  }
  return v2;
}

+ (id)structName
{
  return @"LogRequest";
}

- (void).cxx_destruct
{
}

- (void)setSearchRecord:(id)a3
{
}

- (EDAMSearchRecord)searchRecord
{
  return self->_searchRecord;
}

@end