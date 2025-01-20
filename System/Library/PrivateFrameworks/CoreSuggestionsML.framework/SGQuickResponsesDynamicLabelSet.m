@interface SGQuickResponsesDynamicLabelSet
+ (BOOL)isDynamicLabel:(id)a3;
+ (id)dynamicLabelSet;
@end

@implementation SGQuickResponsesDynamicLabelSet

+ (BOOL)isDynamicLabel:(id)a3
{
  id v4 = a3;
  v5 = [a1 dynamicLabelSet];
  char v6 = [v5 containsObject:v4];

  return v6;
}

+ (id)dynamicLabelSet
{
  if (dynamicLabelSet_onceToken != -1) {
    dispatch_once(&dynamicLabelSet_onceToken, &__block_literal_global_2127);
  }
  v2 = (void *)dynamicLabelSet_dynamicLabelSet;
  return v2;
}

void __50__SGQuickResponsesDynamicLabelSet_dynamicLabelSet__block_invoke()
{
  v0 = (void *)MEMORY[0x22A66BDC0]();
  uint64_t v1 = [objc_alloc(MEMORY[0x263EFFA08]) initWithArray:&unk_26DB016D8];
  v2 = (void *)dynamicLabelSet_dynamicLabelSet;
  dynamicLabelSet_dynamicLabelSet = v1;
}

@end