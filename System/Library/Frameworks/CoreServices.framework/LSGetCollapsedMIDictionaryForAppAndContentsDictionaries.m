@interface LSGetCollapsedMIDictionaryForAppAndContentsDictionaries
@end

@implementation LSGetCollapsedMIDictionaryForAppAndContentsDictionaries

void ___LSGetCollapsedMIDictionaryForAppAndContentsDictionaries_block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  v3 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F1CFF8]];
  v4 = [v7 objectForKeyedSubscript:@"ApplicationType"];
  if ([v4 isEqualToString:@"PluginKitPlugin"])
  {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v7 forKey:v3];
  }
  else if (([v4 isEqualToString:@"CoreServices"] & 1) != 0 {
         || ([v4 isEqualToString:@"Internal"] & 1) != 0
  }
         || ([v4 isEqualToString:@"User"] & 1) != 0
         || ([v4 isEqualToString:@"System"] & 1) != 0
         || ([v4 isEqualToString:@"SystemAppPlaceholder"] & 1) != 0
         || [v4 isEqualToString:@"VPNPlugin"])
  {
    v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    v6 = (void *)[v7 mutableCopy];
    [v5 setObject:v6 forKey:v3];
  }
}

void ___LSGetCollapsedMIDictionaryForAppAndContentsDictionaries_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  v6 = [v5 objectForKey:@"PluginOwnerBundleID"];
  id v7 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectForKey:v6];
  v8 = v7;
  if (v7)
  {
    v9 = [v7 objectForKeyedSubscript:@"_LSBundlePlugins"];
    v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    v12 = v11;

    [v12 setObject:v5 forKey:v13];
    [v8 setObject:v12 forKeyedSubscript:@"_LSBundlePlugins"];
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v8 forKey:v6];
  }
}

@end