@interface EDAMBusinessQuery
+ (id)structFields;
+ (id)structName;
- (EDAMNoteFilter)filter;
- (NSNumber)includeNotebooks;
- (NSNumber)includeNotesCounts;
- (NSNumber)numExperts;
- (void)setFilter:(id)a3;
- (void)setIncludeNotebooks:(id)a3;
- (void)setIncludeNotesCounts:(id)a3;
- (void)setNumExperts:(id)a3;
@end

@implementation EDAMBusinessQuery

+ (id)structFields
{
  v10[4] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_1415;
  if (!structFields_structFields_1415)
  {
    v3 = +[FATField fieldWithIndex:1 type:12 optional:1 name:@"filter" structClass:objc_opt_class()];
    v10[0] = v3;
    v4 = +[FATField fieldWithIndex:2 type:8 optional:1 name:@"numExperts"];
    v10[1] = v4;
    v5 = +[FATField fieldWithIndex:3 type:2 optional:1 name:@"includeNotebooks"];
    v10[2] = v5;
    v6 = +[FATField fieldWithIndex:4 type:2 optional:1 name:@"includeNotesCounts"];
    v10[3] = v6;
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:4];
    v8 = (void *)structFields_structFields_1415;
    structFields_structFields_1415 = v7;

    v2 = (void *)structFields_structFields_1415;
  }
  return v2;
}

+ (id)structName
{
  return @"BusinessQuery";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_includeNotesCounts, 0);
  objc_storeStrong((id *)&self->_includeNotebooks, 0);
  objc_storeStrong((id *)&self->_numExperts, 0);
  objc_storeStrong((id *)&self->_filter, 0);
}

- (void)setIncludeNotesCounts:(id)a3
{
}

- (NSNumber)includeNotesCounts
{
  return self->_includeNotesCounts;
}

- (void)setIncludeNotebooks:(id)a3
{
}

- (NSNumber)includeNotebooks
{
  return self->_includeNotebooks;
}

- (void)setNumExperts:(id)a3
{
}

- (NSNumber)numExperts
{
  return self->_numExperts;
}

- (void)setFilter:(id)a3
{
}

- (EDAMNoteFilter)filter
{
  return self->_filter;
}

@end