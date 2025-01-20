@interface EDAMSearchSuggestion
+ (id)structFields;
+ (id)structName;
- (NSString)suggestionText;
- (void)setSuggestionText:(id)a3;
@end

@implementation EDAMSearchSuggestion

+ (id)structFields
{
  v7[1] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_1297;
  if (!structFields_structFields_1297)
  {
    v3 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"suggestionText"];
    v7[0] = v3;
    uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
    v5 = (void *)structFields_structFields_1297;
    structFields_structFields_1297 = v4;

    v2 = (void *)structFields_structFields_1297;
  }
  return v2;
}

+ (id)structName
{
  return @"SearchSuggestion";
}

- (void).cxx_destruct
{
}

- (void)setSuggestionText:(id)a3
{
}

- (NSString)suggestionText
{
  return self->_suggestionText;
}

@end