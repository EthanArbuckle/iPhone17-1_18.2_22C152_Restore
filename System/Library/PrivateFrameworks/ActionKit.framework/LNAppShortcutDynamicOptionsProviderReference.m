@interface LNAppShortcutDynamicOptionsProviderReference
@end

@implementation LNAppShortcutDynamicOptionsProviderReference

void __75__LNAppShortcutDynamicOptionsProviderReference_TopHits__appShortcutMapping__block_invoke()
{
  v15[5] = *MEMORY[0x263EF8340];
  v12[0] = &unk_26F075450;
  v12[1] = &unk_26F075468;
  v13[0] = @"WFStartCallActionCollectionIdentifierFavorites";
  v13[1] = @"WFStartCallActionCollectionIdentifierRecents";
  v14[0] = &unk_26F075438;
  v0 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  v15[0] = v0;
  v14[1] = &unk_26F075480;
  v10 = &unk_26F075450;
  uint64_t v11 = *MEMORY[0x263F85808];
  v1 = [NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  v15[1] = v1;
  v14[2] = &unk_26F075498;
  v8 = &unk_26F075450;
  uint64_t v9 = *MEMORY[0x263F85810];
  v2 = [NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  v15[2] = v2;
  v14[3] = &unk_26F0754B0;
  v6 = &unk_26F075450;
  v7 = @"WFStartCallActionCollectionIdentifierFaceTimeRecents";
  v3 = [NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  v14[4] = &unk_26F0754C8;
  v15[3] = v3;
  v15[4] = MEMORY[0x263EFFA78];
  uint64_t v4 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:5];
  v5 = (void *)appShortcutMapping_mapping;
  appShortcutMapping_mapping = v4;
}

@end