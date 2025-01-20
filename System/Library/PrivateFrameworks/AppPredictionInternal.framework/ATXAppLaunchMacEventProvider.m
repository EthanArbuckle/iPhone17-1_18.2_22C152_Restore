@interface ATXAppLaunchMacEventProvider
- (ATXAppLaunchMacEventProvider)init;
- (BOOL)isEventFromProvider:(id)a3;
- (BOOL)publisherIsCoreDuetWrapper;
- (id)aggregationEventsFromEvent:(id)a3;
- (id)biomePublisherWithBookmark:(id)a3;
- (id)biomePublisherWithBookmark:(id)a3 devicePlatform:(int64_t)a4 startTime:(double)a5;
- (id)dateIntervalFromEvent:(id)a3;
- (id)eventsFromPublisher;
- (id)iOSBundleIDForMacOSBundleID:(id)a3;
- (id)remoteDevicesForDevicePlatform:(int64_t)a3;
@end

@implementation ATXAppLaunchMacEventProvider

- (ATXAppLaunchMacEventProvider)init
{
  v9.receiver = self;
  v9.super_class = (Class)ATXAppLaunchMacEventProvider;
  v2 = [(ATXAppLaunchMacEventProvider *)&v9 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F1CA80]);
    v4 = +[_ATXAppIconState sharedInstance];
    v5 = [v4 allInstalledAppsKnownToSpringBoard];
    uint64_t v6 = [v3 initWithArray:v5];
    iOSInstalledApps = v2->_iOSInstalledApps;
    v2->_iOSInstalledApps = (NSSet *)v6;
  }
  return v2;
}

- (id)biomePublisherWithBookmark:(id)a3 devicePlatform:(int64_t)a4 startTime:(double)a5
{
  v8 = BiomeLibrary();
  objc_super v9 = [v8 App];
  v10 = [v9 InFocus];

  v11 = [(ATXAppLaunchMacEventProvider *)self remoteDevicesForDevicePlatform:a4];
  if ([v11 count])
  {
    v12 = [v10 publishersForDevices:v11 withUseCase:*MEMORY[0x1E4F4B5A0] startTime:0 includeLocal:&__block_literal_global_213 pipeline:a5];
    v13 = [v12 merge];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __84__ATXAppLaunchMacEventProvider_biomePublisherWithBookmark_devicePlatform_startTime___block_invoke_2;
    v16[3] = &__block_descriptor_34_e48___ATXBiomeAppLaunchWrapper_16__0__BMStoreEvent_8l;
    BOOL v17 = a4 == 4;
    BOOL v18 = a4 == 3;
    v14 = [v13 mapWithTransform:v16];
  }
  else
  {
    v12 = objc_opt_new();
    v14 = [v12 bpsPublisher];
  }

  return v14;
}

id __84__ATXAppLaunchMacEventProvider_biomePublisherWithBookmark_devicePlatform_startTime___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  return v2;
}

ATXBiomeAppLaunchWrapper *__84__ATXAppLaunchMacEventProvider_biomePublisherWithBookmark_devicePlatform_startTime___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [ATXBiomeAppLaunchWrapper alloc];
  v5 = [v3 eventBody];

  uint64_t v6 = [(ATXBiomeAppLaunchWrapper *)v4 initWithAppLaunch:v5 isLocal:0 isMacPortable:*(unsigned __int8 *)(a1 + 32) isMacDesktop:*(unsigned __int8 *)(a1 + 33)];
  return v6;
}

- (id)remoteDevicesForDevicePlatform:(int64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v4 = objc_opt_new();
  id v14 = 0;
  v5 = [v4 remoteDevicesWithError:&v14];
  id v6 = v14;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __63__ATXAppLaunchMacEventProvider_remoteDevicesForDevicePlatform___block_invoke;
  v13[3] = &__block_descriptor_40_e18_B16__0__BMDevice_8l;
  v13[4] = a3;
  v7 = objc_msgSend(v5, "_pas_filteredArrayWithTest:", v13);

  v8 = __atxlog_handle_modes();
  objc_super v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[ATXAppLaunchMacEventProvider remoteDevicesForDevicePlatform:]((uint64_t)v6, v9);
    }

    id v10 = 0;
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = [v7 count];
      *(_DWORD *)buf = 134218240;
      uint64_t v16 = v11;
      __int16 v17 = 2048;
      int64_t v18 = a3;
      _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_INFO, "ATXAppLaunchMacEventProvider: Got %lu remote devices for BMDevicePlatform: %ld", buf, 0x16u);
    }

    id v10 = v7;
  }

  return v10;
}

BOOL __63__ATXAppLaunchMacEventProvider_remoteDevicesForDevicePlatform___block_invoke(uint64_t a1, void *a2)
{
  return [a2 platform] == *(void *)(a1 + 32);
}

- (id)biomePublisherWithBookmark:(id)a3
{
  return 0;
}

- (id)eventsFromPublisher
{
  id v3 = objc_opt_new();
  v4 = [(ATXAppLaunchMacEventProvider *)self biomePublisherWithBookmark:0];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__ATXAppLaunchMacEventProvider_eventsFromPublisher__block_invoke_2;
  v10[3] = &unk_1E68AD360;
  v10[4] = self;
  id v5 = v3;
  id v11 = v5;
  id v6 = (id)[v4 sinkWithCompletion:&__block_literal_global_25_3 receiveInput:v10];

  v7 = v11;
  id v8 = v5;

  return v8;
}

void __51__ATXAppLaunchMacEventProvider_eventsFromPublisher__block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 eventBody];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id v5 = v7;
  if (isKindOfClass)
  {
    id v6 = [*(id *)(a1 + 32) aggregationEventsFromEvent:v7];
    if ([v6 count]) {
      [*(id *)(a1 + 40) addObjectsFromArray:v6];
    }

    id v5 = v7;
  }
}

- (id)aggregationEventsFromEvent:(id)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(ATXAppLaunchMacEventProvider *)self isEventFromProvider:v4])
  {
    id v5 = [v4 appLaunchEvent];
    if ([v5 starting])
    {
      id v6 = [v5 bundleID];
      id v7 = [(ATXAppLaunchMacEventProvider *)self iOSBundleIDForMacOSBundleID:v6];

      if (v7 && [(NSSet *)self->_iOSInstalledApps containsObject:v7])
      {
        uint64_t v8 = +[ATXSessionTaggingAppEntity genreIdForBundleId:v7];
        objc_super v9 = (void *)v8;
        id v10 = &unk_1F27F22F8;
        if (v8) {
          id v10 = (void *)v8;
        }
        id v11 = v10;

        id v12 = objc_alloc(MEMORY[0x1E4F4AED8]);
        v22[0] = v11;
        v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
        id v14 = (void *)[v12 initWithBundleId:v7 itunesGenreIds:v13];

        v15 = [ATXModeEvent alloc];
        uint64_t v16 = [v5 absoluteTimestamp];
        __int16 v17 = [v5 absoluteTimestamp];
        int64_t v18 = [(ATXModeEvent *)v15 initWithStartDate:v16 endDate:v17 entity:v14];

        id v19 = objc_alloc(MEMORY[0x1E4F1C978]);
        v20 = objc_msgSend(v19, "initWithObjects:", v18, 0);
      }
      else
      {
        v20 = 0;
      }
    }
    else
    {
      v20 = 0;
    }
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (BOOL)publisherIsCoreDuetWrapper
{
  return 0;
}

- (BOOL)isEventFromProvider:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  BOOL v4 = (objc_opt_isKindOfClass() & 1) != 0 && ![v3 isLocal];

  return v4;
}

- (id)dateIntervalFromEvent:(id)a3
{
  id v4 = a3;
  if ([(ATXAppLaunchMacEventProvider *)self isEventFromProvider:v4])
  {
    id v5 = (objc_class *)MEMORY[0x1E4F28C18];
    id v6 = v4;
    id v7 = [v5 alloc];
    uint64_t v8 = [v6 launchTimestamp];
    objc_super v9 = [v6 launchTimestamp];

    id v10 = (void *)[v7 initWithStartDate:v8 endDate:v9];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)iOSBundleIDForMacOSBundleID:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1D25F6CC0]();
  id v5 = [MEMORY[0x1E4F580A0] sharedCategories];
  id v6 = [v5 bundleIDForPlatform:*MEMORY[0x1E4F58090] fromBundleID:v3 platform:*MEMORY[0x1E4F58098]];

  return v6;
}

- (void).cxx_destruct
{
}

- (void)remoteDevicesForDevicePlatform:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "ATXAppLaunchMacEventProvider: Biome couldn't fetch remote devices with error: %@", (uint8_t *)&v2, 0xCu);
}

@end