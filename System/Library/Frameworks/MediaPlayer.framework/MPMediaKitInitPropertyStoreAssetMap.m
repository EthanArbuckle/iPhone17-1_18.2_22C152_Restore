@interface MPMediaKitInitPropertyStoreAssetMap
@end

@implementation MPMediaKitInitPropertyStoreAssetMap

id ___MPMediaKitInitPropertyStoreAssetMap_block_invoke_7(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 valueForKeyPath:@"attributes.playParams"];
  BOOL v4 = v3 != 0;

  v5 = [v2 objectForKeyedSubscript:@"_MPMKT_transformedType"];
  v6 = [v2 valueForKeyPath:@"attributes.videoKind"];

  if ([v5 isEqualToString:@"tv-episodes"]
    && ([v6 isEqualToString:@"tvtrailer"] & 1) != 0
    || ([v5 isEqualToString:@"uploaded-videos"] & 1) != 0
    || [v5 isEqualToString:@"uploaded-audios"])
  {
    BOOL v4 = 0;
  }
  v7 = [NSNumber numberWithBool:v4];

  return v7;
}

id ___MPMediaKitInitPropertyStoreAssetMap_block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = [a2 valueForKeyPath:@"attributes.playParams.reporting"];
  v3 = v2;
  if (v2) {
    uint64_t v4 = [v2 BOOLValue];
  }
  else {
    uint64_t v4 = 1;
  }
  v5 = [NSNumber numberWithBool:v4];

  return v5;
}

id ___MPMediaKitInitPropertyStoreAssetMap_block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 valueForKeyPath:@"attributes.playParams"];

  if (v3)
  {
    uint64_t v4 = 1;
  }
  else
  {
    v5 = [v2 objectForKeyedSubscript:@"_MPMKT_transformedType"];
    if (([v5 isEqual:@"uploaded-audios"] & 1) != 0
      || ([v5 isEqual:@"uploaded-videos"] & 1) != 0)
    {
      uint64_t v4 = 1;
    }
    else
    {
      v6 = [v2 valueForKeyPath:@"attributes.offers.kind"];
      uint64_t v4 = [v6 containsObject:@"subscription"];
    }
  }
  v7 = [NSNumber numberWithBool:v4];

  return v7;
}

id ___MPMediaKitInitPropertyStoreAssetMap_block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 valueForKeyPath:@"attributes.playParams"];

  if (v3)
  {
    uint64_t v4 = 3;
  }
  else
  {
    v5 = [v2 objectForKeyedSubscript:@"_MPMKT_transformedType"];
    if (([v5 isEqual:@"uploaded-audios"] & 1) != 0
      || ([v5 isEqual:@"uploaded-videos"] & 1) != 0)
    {
      uint64_t v4 = 3;
    }
    else
    {
      v6 = [v2 valueForKeyPath:@"attributes.offers.kind"];
      if ([v6 containsObject:@"subscription"]) {
        uint64_t v4 = 3;
      }
      else {
        uint64_t v4 = 0;
      }
    }
  }
  v7 = [NSNumber numberWithInteger:v4];

  return v7;
}

void ___MPMediaKitInitPropertyStoreAssetMap_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a2;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = ___MPMediaKitInitPropertyStoreAssetMap_block_invoke_2;
  v11[3] = &unk_1E57FA390;
  id v12 = v6;
  id v7 = v6;
  id v8 = a4;
  id v9 = a3;
  [v8 setUniversalStoreIdentifiersWithBlock:v11];
  v10 = [v9 personID];

  [v8 setPersonalStoreIdentifiersWithPersonID:v10 block:&__block_literal_global_812];
}

void ___MPMediaKitInitPropertyStoreAssetMap_block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
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