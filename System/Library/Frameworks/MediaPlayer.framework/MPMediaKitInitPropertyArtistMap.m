@interface MPMediaKitInitPropertyArtistMap
@end

@implementation MPMediaKitInitPropertyArtistMap

void ___MPMediaKitInitPropertyArtistMap_block_invoke_5(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v7 = [a2 objectForKeyedSubscript:@"genreNames"];
  v6 = [v7 firstObject];
  [v5 setObject:v6 forKeyedSubscript:@"name"];
}

id ___MPMediaKitInitPropertyArtistMap_block_invoke_4(uint64_t a1, void *a2)
{
  v2 = [a2 valueForKeyPath:@"attributes.classicalUrl"];
  if (v2) {
    v3 = (void *)MEMORY[0x1E4F1CC38];
  }
  else {
    v3 = (void *)MEMORY[0x1E4F1CC28];
  }
  id v4 = v3;

  return v4;
}

void ___MPMediaKitInitPropertyArtistMap_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a2;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = ___MPMediaKitInitPropertyArtistMap_block_invoke_2;
  v11[3] = &unk_1E57FA390;
  id v12 = v6;
  id v7 = v6;
  id v8 = a4;
  id v9 = a3;
  [v8 setUniversalStoreIdentifiersWithBlock:v11];
  v10 = [v9 personID];

  [v8 setPersonalStoreIdentifiersWithPersonID:v10 block:&__block_literal_global_349];
}

void ___MPMediaKitInitPropertyArtistMap_block_invoke_2(uint64_t a1, void *a2)
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