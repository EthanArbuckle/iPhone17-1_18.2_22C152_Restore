@interface DOCTag(Color)
+ (uint64_t)nonClearNoneTagColor;
- (id)_tagColorWithFallback:()Color;
- (uint64_t)tagBackgroundColor;
- (uint64_t)tagColor;
- (uint64_t)tagColorIfNotClear;
@end

@implementation DOCTag(Color)

- (uint64_t)tagColorIfNotClear
{
  return [a1 _tagColorWithFallback:&__block_literal_global_2_0];
}

- (id)_tagColorWithFallback:()Color
{
  v4 = a3;
  uint64_t v5 = [a1 labelIndex];
  if (v5) {
    objc_msgSend(MEMORY[0x263F825C8], "doc_colorForTagColor:", v5);
  }
  else {
  v6 = v4[2](v4);
  }

  return v6;
}

+ (uint64_t)nonClearNoneTagColor
{
  return objc_msgSend(MEMORY[0x263F825C8], "doc_colorForTagColor:", 0);
}

- (uint64_t)tagColor
{
  return [a1 _tagColorWithFallback:&__block_literal_global_4];
}

- (uint64_t)tagBackgroundColor
{
  v1 = (void *)MEMORY[0x263F825C8];
  uint64_t v2 = [a1 labelIndex];

  return objc_msgSend(v1, "doc_secondaryColorForTagColor:", v2);
}

@end