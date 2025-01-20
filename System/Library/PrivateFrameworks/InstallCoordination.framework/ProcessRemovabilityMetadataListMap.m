@interface ProcessRemovabilityMetadataListMap
@end

@implementation ProcessRemovabilityMetadataListMap

void ___ProcessRemovabilityMetadataListMap_block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  v8 = [a3 mostRestrictiveRemovabilityMetadata];
  [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v7];

  *a4 = 0;
}

@end