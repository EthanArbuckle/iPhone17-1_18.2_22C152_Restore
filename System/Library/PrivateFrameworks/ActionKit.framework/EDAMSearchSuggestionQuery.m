@interface EDAMSearchSuggestionQuery
+ (id)structFields;
+ (id)structName;
- (EDAMNoteFilter)contextFilter;
- (NSString)prefix;
- (void)setContextFilter:(id)a3;
- (void)setPrefix:(id)a3;
@end

@implementation EDAMSearchSuggestionQuery

+ (id)structFields
{
  v8[2] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_1255;
  if (!structFields_structFields_1255)
  {
    v3 = +[FATField fieldWithIndex:1 type:11 optional:1 name:@"prefix"];
    v8[0] = v3;
    v4 = +[FATField fieldWithIndex:2 type:12 optional:1 name:@"contextFilter" structClass:objc_opt_class()];
    v8[1] = v4;
    uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:2];
    v6 = (void *)structFields_structFields_1255;
    structFields_structFields_1255 = v5;

    v2 = (void *)structFields_structFields_1255;
  }
  return v2;
}

+ (id)structName
{
  return @"SearchSuggestionQuery";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextFilter, 0);
  objc_storeStrong((id *)&self->_prefix, 0);
}

- (void)setContextFilter:(id)a3
{
}

- (EDAMNoteFilter)contextFilter
{
  return self->_contextFilter;
}

- (void)setPrefix:(id)a3
{
}

- (NSString)prefix
{
  return self->_prefix;
}

@end