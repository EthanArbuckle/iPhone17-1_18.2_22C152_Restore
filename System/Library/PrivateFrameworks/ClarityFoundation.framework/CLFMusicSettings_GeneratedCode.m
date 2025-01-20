@interface CLFMusicSettings_GeneratedCode
+ (CLFMusicSettings)sharedInstance;
+ (id)allPreferenceSelectorsAsStrings;
+ (id)domainName;
- (CLFMusicSettings_GeneratedCode)init;
- (NSArray)selectedPlaylists;
- (void)setSelectedPlaylists:(id)a3;
@end

@implementation CLFMusicSettings_GeneratedCode

+ (CLFMusicSettings)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_3);
  }
  v2 = (void *)sharedInstance_SharedSettings_1;
  return (CLFMusicSettings *)v2;
}

- (CLFMusicSettings_GeneratedCode)init
{
  v7.receiver = self;
  v7.super_class = (Class)CLFMusicSettings_GeneratedCode;
  v2 = [(CLFBaseSettings *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v4 = -[CLFBaseSettings preferenceKeysBySelectorName]((uint64_t)v2);
    v5 = NSStringFromSelector(sel_selectedPlaylists);
    [v4 setObject:@"SelectedPlaylists" forKeyedSubscript:v5];
  }
  return v3;
}

+ (id)domainName
{
  return @"com.apple.ClarityUI.Music";
}

+ (id)allPreferenceSelectorsAsStrings
{
  v8[1] = *MEMORY[0x263EF8340];
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___CLFMusicSettings_GeneratedCode;
  v2 = objc_msgSendSuper2(&v7, sel_allPreferenceSelectorsAsStrings);
  v3 = NSStringFromSelector(sel_selectedPlaylists);
  v8[0] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  v5 = [v2 arrayByAddingObjectsFromArray:v4];

  return v5;
}

- (NSArray)selectedPlaylists
{
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = MEMORY[0x263EFFA68];
  return (NSArray *)[(AXBaseSettings *)self objectValueForPreferenceKey:@"SelectedPlaylists" ofClass:v3 defaultValue:v4];
}

- (void)setSelectedPlaylists:(id)a3
{
}

@end