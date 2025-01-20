@interface EDAMSearchSuggestionResultSpec
+ (id)structFields;
+ (id)structName;
- (NSNumber)maxTypeAheadSuggestions;
- (void)setMaxTypeAheadSuggestions:(id)a3;
@end

@implementation EDAMSearchSuggestionResultSpec

+ (id)structFields
{
  v7[1] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_1280;
  if (!structFields_structFields_1280)
  {
    v3 = +[FATField fieldWithIndex:1 type:8 optional:1 name:@"maxTypeAheadSuggestions"];
    v7[0] = v3;
    uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
    v5 = (void *)structFields_structFields_1280;
    structFields_structFields_1280 = v4;

    v2 = (void *)structFields_structFields_1280;
  }
  return v2;
}

+ (id)structName
{
  return @"SearchSuggestionResultSpec";
}

- (void).cxx_destruct
{
}

- (void)setMaxTypeAheadSuggestions:(id)a3
{
}

- (NSNumber)maxTypeAheadSuggestions
{
  return self->_maxTypeAheadSuggestions;
}

@end