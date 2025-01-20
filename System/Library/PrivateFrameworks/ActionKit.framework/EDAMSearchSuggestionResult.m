@interface EDAMSearchSuggestionResult
+ (id)structFields;
+ (id)structName;
- (NSArray)typeAheadSuggestions;
- (void)setTypeAheadSuggestions:(id)a3;
@end

@implementation EDAMSearchSuggestionResult

+ (id)structFields
{
  v8[1] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_1314;
  if (!structFields_structFields_1314)
  {
    v3 = +[FATField fieldWithIndex:0 type:12 optional:1 name:0 structClass:objc_opt_class()];
    v4 = +[FATField fieldWithIndex:1 type:15 optional:1 name:@"typeAheadSuggestions" valueField:v3];
    v8[0] = v4;
    uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
    v6 = (void *)structFields_structFields_1314;
    structFields_structFields_1314 = v5;

    v2 = (void *)structFields_structFields_1314;
  }
  return v2;
}

+ (id)structName
{
  return @"SearchSuggestionResult";
}

- (void).cxx_destruct
{
}

- (void)setTypeAheadSuggestions:(id)a3
{
}

- (NSArray)typeAheadSuggestions
{
  return self->_typeAheadSuggestions;
}

@end