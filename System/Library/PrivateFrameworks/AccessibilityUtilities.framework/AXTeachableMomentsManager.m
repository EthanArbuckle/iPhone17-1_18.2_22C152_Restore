@interface AXTeachableMomentsManager
+ (BOOL)teachableMomentSeenForNotification:(id)a3;
+ (id)_majorBuildVersion;
+ (id)_nameForFeature:(id)a3;
+ (id)_systemBuildVersion;
+ (id)notificationTitleForFeature:(id)a3;
+ (id)sharedManager;
+ (id)summaryForFeature:(id)a3;
+ (id)teachableItemsForFeature:(id)a3;
+ (void)markTeachableMomentSeenForNotification:(id)a3;
- (id)_teachableItemsForFeature:(id)a3;
- (id)_teachableItemsFromItems:(id)a3 feature:(id)a4;
@end

@implementation AXTeachableMomentsManager

+ (id)sharedManager
{
  if (sharedManager_onceToken_2 != -1) {
    dispatch_once(&sharedManager_onceToken_2, &__block_literal_global_27);
  }
  v2 = (void *)sharedManager_Manager_0;

  return v2;
}

uint64_t __42__AXTeachableMomentsManager_sharedManager__block_invoke()
{
  sharedManager_Manager_0 = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

+ (id)_majorBuildVersion
{
  v2 = NSString;
  v3 = NSNumber;
  v4 = [MEMORY[0x1E4F28F80] processInfo];
  v5 = v4;
  if (v4)
  {
    [v4 operatingSystemVersion];
    uint64_t v6 = v10;
  }
  else
  {
    uint64_t v6 = 0;
  }
  v7 = [v3 numberWithInteger:v6];
  v8 = [v2 stringWithFormat:@"%@.0", v7];

  return v8;
}

+ (id)_systemBuildVersion
{
  v2 = NSString;
  v3 = NSNumber;
  v4 = [MEMORY[0x1E4F28F80] processInfo];
  v5 = v4;
  if (v4)
  {
    [v4 operatingSystemVersion];
    uint64_t v6 = v16;
  }
  else
  {
    uint64_t v6 = 0;
  }
  v7 = [v3 numberWithInteger:v6];
  v8 = NSNumber;
  v9 = [MEMORY[0x1E4F28F80] processInfo];
  uint64_t v10 = v9;
  if (v9)
  {
    [v9 operatingSystemVersion];
    uint64_t v11 = v15;
  }
  else
  {
    uint64_t v11 = 0;
  }
  v12 = [v8 numberWithInteger:v11];
  v13 = [v2 stringWithFormat:@"%@.%@", v7, v12];

  return v13;
}

- (id)_teachableItemsForFeature:(id)a3
{
  id v4 = a3;
  data = self->_data;
  if (!data)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1C9E8];
    v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v8 = NSString;
    v9 = [(id)objc_opt_class() _majorBuildVersion];
    uint64_t v10 = [v8 stringWithFormat:@"TeachableMoments-%@-%@", v9, @"iOS"];
    uint64_t v11 = [v7 URLForResource:v10 withExtension:@"plist"];
    v12 = [v6 dictionaryWithContentsOfURL:v11];
    v13 = self->_data;
    self->_data = v12;

    data = self->_data;
  }
  v14 = [(NSDictionary *)data objectForKey:v4];
  uint64_t v15 = __UIAccessibilitySafeClass();

  uint64_t v16 = [v15 objectForKey:@"items"];
  v17 = __UIAccessibilitySafeClass();

  v18 = [(AXTeachableMomentsManager *)self _teachableItemsFromItems:v17 feature:v4];

  return v18;
}

+ (id)summaryForFeature:(id)a3
{
  id v4 = a3;
  v5 = [a1 _majorBuildVersion];
  uint64_t v6 = [NSString stringWithFormat:@"%@_SUMMARY_%@", v4, v5];

  v7 = LocalizedString(v6);

  return v7;
}

+ (id)_nameForFeature:(id)a3
{
  v3 = [NSString stringWithFormat:@"%@_FEATURE_TITLE", a3];
  id v4 = LocalizedString(v3);

  return v4;
}

+ (id)notificationTitleForFeature:(id)a3
{
  id v4 = NSString;
  id v5 = a3;
  uint64_t v6 = [a1 _majorBuildVersion];
  v7 = [v4 stringWithFormat:@"WhatsNew_%@_%@", v5, v6];

  v8 = AXLocStringKeyForModel(v7);
  v9 = LocalizedString(v8);

  return v9;
}

- (id)_teachableItemsFromItems:(id)a3 feature:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v25 = a4;
  v23 = [(id)objc_opt_class() _majorBuildVersion];
  id v24 = (id)objc_opt_new();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  obuint64_t j = v5;
  uint64_t v28 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v28)
  {
    uint64_t v27 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v34 != v27) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        objc_opt_class();
        v8 = [v7 objectForKeyedSubscript:@"supportedPlatforms"];
        v9 = __UIAccessibilityCastAsClass();

        if (!v9) {
          goto LABEL_19;
        }
        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v10 = v9;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (!v11) {
          goto LABEL_20;
        }
        uint64_t v12 = v11;
        v26 = v7;
        int v13 = 0;
        uint64_t v14 = *(void *)v30;
        do
        {
          for (uint64_t j = 0; j != v12; ++j)
          {
            if (*(void *)v30 != v14) {
              objc_enumerationMutation(v10);
            }
            uint64_t v16 = *(void **)(*((void *)&v29 + 1) + 8 * j);
            if ([v16 isEqualToString:@"ipad"]) {
              v13 |= AXDeviceIsPad();
            }
            if ([v16 isEqualToString:@"iphone"]) {
              v13 |= AXDeviceIsPhone();
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v29 objects:v37 count:16];
        }
        while (v12);

        v7 = v26;
        if (v13)
        {
LABEL_19:
          id v10 = (id)objc_opt_new();
          v17 = [v7 objectForKeyedSubscript:@"title"];
          v18 = LocalizedItemString(v17, (uint64_t)v23);
          [v10 setItemTitle:v18];

          v19 = [v7 objectForKeyedSubscript:@"description"];
          v20 = LocalizedItemString(v19, (uint64_t)v23);
          [v10 setItemDescription:v20];

          [v10 setVersion:v23];
          [v10 setFeature:v25];
          [v24 addObject:v10];
LABEL_20:
        }
      }
      uint64_t v28 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v28);
  }

  return v24;
}

+ (BOOL)teachableMomentSeenForNotification:(id)a3
{
  id v4 = a3;
  id v5 = +[AXSettings sharedInstance];
  uint64_t v6 = [v5 teachableMomentsNotificationsSeen];

  v7 = [v6 objectForKeyedSubscript:v4];

  if (v7)
  {
    v8 = [a1 _majorBuildVersion];
    BOOL v9 = [v8 compare:v7 options:64] != -1;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

+ (void)markTeachableMomentSeenForNotification:(id)a3
{
  id v4 = a3;
  id v5 = +[AXSettings sharedInstance];
  uint64_t v6 = [v5 teachableMomentsNotificationsSeen];
  id v9 = (id)[v6 mutableCopy];

  if (!v9) {
    id v9 = (id)objc_opt_new();
  }
  v7 = [a1 _majorBuildVersion];
  [v9 setObject:v7 forKeyedSubscript:v4];

  v8 = +[AXSettings sharedInstance];
  [v8 setTeachableMomentsNotificationsSeen:v9];
}

+ (id)teachableItemsForFeature:(id)a3
{
  id v4 = a3;
  id v5 = [a1 sharedManager];
  uint64_t v6 = [v5 _teachableItemsForFeature:v4];

  return v6;
}

- (void).cxx_destruct
{
}

@end