@interface MPMediaKitInitPropertyCuratorMap
@end

@implementation MPMediaKitInitPropertyCuratorMap

id ___MPMediaKitInitPropertyCuratorMap_block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v12[0] = @"_MPMKT_transformedType";
  v12[1] = @"type";
  v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  id v6 = a2;
  v7 = [v4 arrayWithObjects:v12 count:2];
  v8 = _MPKeyPathValueTransformFirstNonnullKeyPath(v7, v6);

  if ([v8 isEqualToString:@"activities"])
  {
    uint64_t v9 = 3;
  }
  else if ([v8 isEqualToString:@"apple-curators"])
  {
    uint64_t v9 = 1;
  }
  else if ([v8 isEqualToString:@"editorial-items"])
  {
    uint64_t v9 = 4;
  }
  else if ([v8 isEqualToString:@"curators"])
  {
    uint64_t v9 = 2;
  }
  else
  {
    uint64_t v9 = 0;
  }
  v10 = [NSNumber numberWithInteger:v9];

  return v10;
}

id ___MPMediaKitInitPropertyCuratorMap_block_invoke_4(uint64_t a1, void *a2)
{
  v2 = [a2 valueForKeyPath:@"attributes.kind"];
  if ([v2 isEqualToString:@"Show"])
  {
    uint64_t v3 = 3;
  }
  else if ([v2 isEqualToString:@"Genre"])
  {
    uint64_t v3 = 2;
  }
  else
  {
    uint64_t v3 = [v2 isEqualToString:@"Curator"];
  }
  v4 = [NSNumber numberWithInteger:v3];

  return v4;
}

void ___MPMediaKitInitPropertyCuratorMap_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a2;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = ___MPMediaKitInitPropertyCuratorMap_block_invoke_2;
  v11[3] = &unk_1E57FA390;
  id v12 = v6;
  id v7 = v6;
  id v8 = a4;
  id v9 = a3;
  [v8 setUniversalStoreIdentifiersWithBlock:v11];
  v10 = [v9 personID];

  [v8 setPersonalStoreIdentifiersWithPersonID:v10 block:&__block_literal_global_567];
}

void ___MPMediaKitInitPropertyCuratorMap_block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 objectForKeyedSubscript:@"id"];
  if (_NSIsNSNumber() & 1) != 0 || (_NSIsNSString() & 1) != 0 || (objc_opt_respondsToSelector()) {
    uint64_t v4 = [v5 longLongValue];
  }
  else {
    uint64_t v4 = 0;
  }

  [v3 setAdamID:v4];
}

@end