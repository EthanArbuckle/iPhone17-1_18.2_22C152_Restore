@interface CN
@end

@implementation CN

void __53__CN_ABSExtensions__contactPropertiesByABSPropertyID__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) allContactProperties];
  v1 = objc_msgSend(v5, "_cn_filter:", &__block_literal_global_58);
  v2 = objc_msgSend(v1, "_cn_indexBy:", &__block_literal_global_61);
  uint64_t v3 = [v2 copy];
  v4 = (void *)contactPropertiesByABSPropertyID_cn_once_object_1;
  contactPropertiesByABSPropertyID_cn_once_object_1 = v3;
}

uint64_t __53__CN_ABSExtensions__contactPropertiesByABSPropertyID__block_invoke_2(uint64_t a1, void *a2)
{
  int v3 = 0;
  return [a2 absPropertyID:&v3];
}

id __53__CN_ABSExtensions__contactPropertiesByABSPropertyID__block_invoke_3(uint64_t a1, void *a2)
{
  unsigned int v4 = 0;
  [a2 absPropertyID:&v4];
  v2 = [NSNumber numberWithInt:v4];

  return v2;
}

@end