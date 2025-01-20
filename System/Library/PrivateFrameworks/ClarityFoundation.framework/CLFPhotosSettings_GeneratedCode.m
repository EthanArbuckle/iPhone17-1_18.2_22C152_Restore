@interface CLFPhotosSettings_GeneratedCode
+ (CLFPhotosSettings)sharedInstance;
+ (id)allPreferenceSelectorsAsStrings;
+ (id)domainName;
- (BOOL)includeSharedAlbums;
- (CLFPhotosSettings_GeneratedCode)init;
- (NSArray)selectedSharedAlbumCloudIdentifiers;
- (void)setIncludeSharedAlbums:(BOOL)a3;
- (void)setSelectedSharedAlbumCloudIdentifiers:(id)a3;
@end

@implementation CLFPhotosSettings_GeneratedCode

+ (CLFPhotosSettings)sharedInstance
{
  if (sharedInstance_onceToken_5 != -1) {
    dispatch_once(&sharedInstance_onceToken_5, &__block_literal_global_7);
  }
  v2 = (void *)sharedInstance_SharedSettings_4;
  return (CLFPhotosSettings *)v2;
}

- (CLFPhotosSettings_GeneratedCode)init
{
  v9.receiver = self;
  v9.super_class = (Class)CLFPhotosSettings_GeneratedCode;
  v2 = [(CLFBaseSettings *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v4 = -[CLFBaseSettings preferenceKeysBySelectorName]((uint64_t)v2);
    v5 = NSStringFromSelector(sel_includeSharedAlbums);
    [v4 setObject:@"IncludeSharedAlbums" forKeyedSubscript:v5];

    v6 = -[CLFBaseSettings preferenceKeysBySelectorName]((uint64_t)v3);
    v7 = NSStringFromSelector(sel_selectedSharedAlbumCloudIdentifiers);
    [v6 setObject:@"SelectedSharedAlbumCloudIdentifiers" forKeyedSubscript:v7];
  }
  return v3;
}

+ (id)domainName
{
  return @"com.apple.ClarityUI.Photos";
}

+ (id)allPreferenceSelectorsAsStrings
{
  v9[2] = *MEMORY[0x263EF8340];
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___CLFPhotosSettings_GeneratedCode;
  v2 = objc_msgSendSuper2(&v8, sel_allPreferenceSelectorsAsStrings);
  v3 = NSStringFromSelector(sel_includeSharedAlbums);
  v9[0] = v3;
  v4 = NSStringFromSelector(sel_selectedSharedAlbumCloudIdentifiers);
  v9[1] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:2];
  v6 = [v2 arrayByAddingObjectsFromArray:v5];

  return v6;
}

- (BOOL)includeSharedAlbums
{
  return [(AXBaseSettings *)self BOOLValueForPreferenceKey:@"IncludeSharedAlbums" defaultValue:0];
}

- (void)setIncludeSharedAlbums:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"IncludeSharedAlbums"];
}

- (NSArray)selectedSharedAlbumCloudIdentifiers
{
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = MEMORY[0x263EFFA68];
  return (NSArray *)[(AXBaseSettings *)self objectValueForPreferenceKey:@"SelectedSharedAlbumCloudIdentifiers" ofClass:v3 defaultValue:v4];
}

- (void)setSelectedSharedAlbumCloudIdentifiers:(id)a3
{
}

@end