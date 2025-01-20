@interface CPAnalyticsDashboardDestination
- (BOOL)isMediaEvent:(id)a3;
- (CPAnalytics)cpAnalyticsInstance;
- (CPAnalyticsDashboardDestination)init;
- (CPAnalyticsDashboardDestination)initWithConfig:(id)a3 cpAnalyticsInstance:(id)a4;
- (NSArray)allErrorProperties;
- (NSArray)allMediaProperties;
- (NSArray)allStandardProperties;
- (id)buildCoreAnalyticsEventPayloadWithProperties:(id)a3 fromSourceEvent:(id)a4 intoTargetEventPayload:(id)a5;
- (void)processEvent:(id)a3;
- (void)reportMalformedEvent:(id)a3 malformationDescriptionWithFormat:(id)a4;
- (void)sendCoreAnalyticsEventWithStandardPropertiesForEventWithName:(id)a3 fromSourceEvent:(id)a4 payload:(id)a5;
@end

@implementation CPAnalyticsDashboardDestination

- (void).cxx_destruct
{
}

- (CPAnalytics)cpAnalyticsInstance
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cpAnalyticsInstance);
  return (CPAnalytics *)WeakRetained;
}

- (void)reportMalformedEvent:(id)a3 malformationDescriptionWithFormat:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = (objc_class *)NSString;
  id v7 = a4;
  v8 = (void *)[[v6 alloc] initWithFormat:v7 arguments:&v18];

  v9 = CPAnalyticsLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v10 = (void *)[v5 copyRawPayload];
    *(_DWORD *)buf = 138412802;
    id v12 = v5;
    __int16 v13 = 2112;
    v14 = v10;
    __int16 v15 = 2112;
    v16 = v8;
    _os_log_error_impl(&dword_215355000, v9, OS_LOG_TYPE_ERROR, "Malformed event %@ with payload %@: %@", buf, 0x20u);
  }
}

- (id)buildCoreAnalyticsEventPayloadWithProperties:(id)a3 fromSourceEvent:(id)a4 intoTargetEventPayload:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:v9];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v17 = objc_msgSend(v10, "objectForKeyedSubscript:", v16, (void)v22);

        if (!v17)
        {
          uint64_t v18 = [v8 propertyForKey:v16];
          if (v18) {
            [v10 setObject:v18 forKeyedSubscript:v16];
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v13);
  }

  if ([v10 count]) {
    v19 = v10;
  }
  else {
    v19 = 0;
  }
  id v20 = v19;

  return v20;
}

- (void)sendCoreAnalyticsEventWithStandardPropertiesForEventWithName:(id)a3 fromSourceEvent:(id)a4 payload:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(CPAnalyticsDashboardDestination *)self allStandardProperties];
  id v12 = [(CPAnalyticsDashboardDestination *)self buildCoreAnalyticsEventPayloadWithProperties:v11 fromSourceEvent:v9 intoTargetEventPayload:v8];

  +[CPAnalyticsCoreAnalyticsHelper sendCoreAnalyticsEvent:v10 withPayload:v12 shouldSanitize:0];
}

- (BOOL)isMediaEvent:(id)a3
{
  v3 = [a3 propertyForKey:@"cpa_media_localIdentifier"];
  BOOL v4 = [v3 length] != 0;

  return v4;
}

- (NSArray)allErrorProperties
{
  v4[5] = *MEMORY[0x263EF8340];
  v4[0] = @"cpa_error_domain";
  v4[1] = @"cpa_error_code";
  v4[2] = @"cpa_error_codeAsString";
  v4[3] = @"cpa_error_description";
  v4[4] = @"cpa_error_indepthErrors";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:5];
  return (NSArray *)v2;
}

- (NSArray)allMediaProperties
{
  v4[16] = *MEMORY[0x263EF8340];
  v4[0] = @"cpa_media_adjusted";
  v4[1] = @"cpa_media_cameraType";
  v4[2] = @"cpa_media_favorite";
  v4[3] = @"cpa_media_importSource";
  v4[4] = @"cpa_media_type";
  v4[5] = @"cpa_media_subType";
  void v4[6] = @"cpa_media_age";
  v4[7] = @"cpa_media_count";
  v4[8] = @"cpa_media_duration";
  v4[9] = @"cpa_media_orientation";
  v4[10] = @"cpa_media_sceneType";
  v4[11] = @"cpa_media_subject";
  v4[12] = @"cpa_media_libraryType";
  v4[13] = @"cpa_media_syndicationState";
  v4[14] = @"cpa_media_hasSyndicationIdentifier";
  v4[15] = @"cpa_media_sharedLibraryScope";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:16];
  return (NSArray *)v2;
}

- (NSArray)allStandardProperties
{
  v4[16] = *MEMORY[0x263EF8340];
  v4[0] = @"cpa_common_hourOfDay";
  v4[1] = @"cpa_common_dayOfWeek";
  v4[2] = @"cpa_common_deviceFreeSpace";
  v4[3] = @"cpa_common_deviceModel";
  v4[4] = @"cpa_common_osVersion";
  v4[5] = @"cpa_common_librarySizeRange";
  void v4[6] = @"cpa_common_processName";
  v4[7] = @"cpa_common_lowPowerModeEnabled";
  v4[8] = @"cpa_common_icpl_enabled";
  v4[9] = @"cpa_common_icpl_exceedingQuota";
  v4[10] = @"cpa_common_icpl_lowDiskSpace";
  v4[11] = @"cpa_common_icpl_veryLowDiskSpace";
  v4[12] = @"cpa_common_icpl_hasChangesToProcess";
  v4[13] = @"cpa_common_sharedLibraryEnabled";
  v4[14] = @"cpa_demographic_userGender";
  v4[15] = @"cpa_demographic_userAgeRange";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:16];
  return (NSArray *)v2;
}

- (void)processEvent:(id)a3
{
  id v3 = a3;
  abort();
}

- (CPAnalyticsDashboardDestination)initWithConfig:(id)a3 cpAnalyticsInstance:(id)a4
{
  id v5 = a4;
  v9.receiver = self;
  v9.super_class = (Class)CPAnalyticsDashboardDestination;
  v6 = [(CPAnalyticsDashboardDestination *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeWeak((id *)&v6->_cpAnalyticsInstance, v5);
  }

  return v7;
}

- (CPAnalyticsDashboardDestination)init
{
}

@end