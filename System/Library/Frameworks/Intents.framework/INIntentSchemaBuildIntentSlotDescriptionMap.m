@interface INIntentSchemaBuildIntentSlotDescriptionMap
@end

@implementation INIntentSchemaBuildIntentSlotDescriptionMap

void ___INIntentSchemaBuildIntentSlotDescriptionMap_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v4 = NSNumber;
  uint64_t v5 = a3 + 1;
  id v6 = a2;
  v7 = [v4 numberWithUnsignedInteger:v5];
  [v6 setRank:v7];

  v8 = *(void **)(a1 + 32);
  id v9 = [v6 name];
  [v8 setObject:v6 forKey:v9];
}

@end