@interface CPAnalyticsSystemProperties
+ (NSArray)dynamicPhotoLibraryProperties;
+ (NSArray)staticPhotoLibraryProperties;
- (CPAnalyticsSystemProperties)init;
- (NSMutableDictionary)dynamicProperties;
- (NSMutableDictionary)systemProperties;
- (id)propertyForKey:(id)a3 forEventName:(id)a4 payloadForSystemPropertyExtraction:(id)a5;
- (void)addDynamicProperty:(id)a3 withProvider:(id)a4;
- (void)addProperty:(id)a3 withValue:(id)a4;
- (void)removePhotoLibraryProperties;
- (void)setDynamicProperties:(id)a3;
- (void)setSystemProperties:(id)a3;
@end

@implementation CPAnalyticsSystemProperties

- (CPAnalyticsSystemProperties)init
{
  v6.receiver = self;
  v6.super_class = (Class)CPAnalyticsSystemProperties;
  v2 = [(CPAnalyticsSystemProperties *)&v6 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [(CPAnalyticsSystemProperties *)v2 setSystemProperties:v3];

    id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [(CPAnalyticsSystemProperties *)v2 setDynamicProperties:v4];
  }
  return v2;
}

- (void)setSystemProperties:(id)a3
{
}

- (void)setDynamicProperties:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynamicProperties, 0);
  objc_storeStrong((id *)&self->_systemProperties, 0);
}

- (NSMutableDictionary)dynamicProperties
{
  return self->_dynamicProperties;
}

- (NSMutableDictionary)systemProperties
{
  return self->_systemProperties;
}

- (void)removePhotoLibraryProperties
{
  id v3 = [(CPAnalyticsSystemProperties *)self systemProperties];
  id v4 = [(id)objc_opt_class() staticPhotoLibraryProperties];
  [v3 removeObjectsForKeys:v4];

  id v6 = [(CPAnalyticsSystemProperties *)self dynamicProperties];
  v5 = [(id)objc_opt_class() dynamicPhotoLibraryProperties];
  [v6 removeObjectsForKeys:v5];
}

- (id)propertyForKey:(id)a3 forEventName:(id)a4 payloadForSystemPropertyExtraction:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(CPAnalyticsSystemProperties *)self systemProperties];
  v12 = [v11 objectForKey:v8];

  if (v12)
  {
    id v13 = v12;
  }
  else
  {
    v14 = [(CPAnalyticsSystemProperties *)self dynamicProperties];
    v15 = [v14 objectForKey:v8];

    id v13 = [v15 getDynamicProperty:v8 forEventName:v9 payloadForSystemPropertyExtraction:v10];
  }
  return v13;
}

- (void)addDynamicProperty:(id)a3 withProvider:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CPAnalyticsSystemProperties *)self dynamicProperties];
  [v8 setObject:v6 forKey:v7];
}

- (void)addProperty:(id)a3 withValue:(id)a4
{
  if (a4)
  {
    id v6 = a4;
    id v7 = a3;
    id v8 = [(CPAnalyticsSystemProperties *)self systemProperties];
    [v8 setValue:v6 forKey:v7];
  }
}

+ (NSArray)dynamicPhotoLibraryProperties
{
  v4[15] = *MEMORY[0x263EF8340];
  v4[0] = @"cpa_common_icpl_enabled";
  v4[1] = @"cpa_common_icpl_exceedingQuota";
  v4[2] = @"cpa_common_icpl_lowDiskSpace";
  v4[3] = @"cpa_common_icpl_veryLowDiskSpace";
  v4[4] = @"cpa_common_icpl_hasChangesToProcess";
  v4[5] = @"cpa_media_type";
  v4[6] = @"cpa_media_subType";
  v4[7] = @"cpa_media_age";
  v4[8] = @"cpa_media_duration";
  v4[9] = @"cpa_media_localIdentifier";
  v4[10] = @"cpa_media_ageInMinutes";
  v4[11] = @"cpa_media_sceneType";
  v4[12] = @"cpa_media_subject";
  v4[13] = @"cpa_media_uuid";
  v4[14] = @"cpa_common_sharedLibraryEnabled";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:15];
  return (NSArray *)v2;
}

+ (NSArray)staticPhotoLibraryProperties
{
  v4[4] = *MEMORY[0x263EF8340];
  v4[0] = @"cpa_common_photoCount";
  v4[1] = @"cpa_common_videoCount";
  v4[2] = @"cpa_common_collectionCount";
  v4[3] = @"cpa_common_librarySizeRange";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:4];
  return (NSArray *)v2;
}

@end