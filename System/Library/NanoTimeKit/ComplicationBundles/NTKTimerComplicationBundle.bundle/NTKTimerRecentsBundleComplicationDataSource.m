@interface NTKTimerRecentsBundleComplicationDataSource
+ (id)_defaultPresets;
+ (id)bundleIdentifier;
+ (id)complicationDescriptors;
+ (id)legacyNTKComplicationType;
- (id)currentSwitcherTemplate;
- (id)sampleTemplate;
@end

@implementation NTKTimerRecentsBundleComplicationDataSource

+ (id)legacyNTKComplicationType
{
  return 0;
}

+ (id)_defaultPresets
{
  return &off_D0A0;
}

+ (id)complicationDescriptors
{
  v28[0] = &off_CF28;
  v28[1] = &off_CF40;
  v28[2] = &off_CF58;
  v2 = +[NSNumber numberWithInteger:CLKComplicationFamilyCircularMedium];
  v28[3] = v2;
  v28[4] = &off_CF70;
  v28[5] = &off_CF88;
  v28[6] = &off_CFA0;
  v28[7] = &off_CFB8;
  v28[8] = &off_CFD0;
  v28[9] = &off_CFE8;
  v28[10] = &off_D000;
  v28[11] = &off_D018;
  v3 = +[NSNumber numberWithInteger:CLKComplicationFamilySimpleText];
  v28[12] = v3;
  v20 = +[NSArray arrayWithObjects:v28 count:13];

  id v4 = objc_alloc_init((Class)NSDateComponentsFormatter);
  [v4 setAllowedUnits:224];
  [v4 setFormattingContext:2];
  [v4 setUnitsStyle:2];
  v5 = [(id)objc_opt_class() _defaultPresets];
  id v6 = objc_alloc_init((Class)NSMutableOrderedSet);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v5;
  id v7 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        [v11 floatValue];
        v13 = [v4 stringFromTimeInterval:v12];
        id v14 = objc_alloc((Class)CLKComplicationDescriptor);
        v15 = [v11 stringValue];
        CFStringRef v25 = @"Duration";
        v26 = v11;
        v16 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
        id v17 = [v14 initWithIdentifier:v15 displayName:v13 supportedFamilies:v20 userInfo:v16];

        [v6 addObject:v17];
      }
      id v8 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v8);
  }

  return v6;
}

+ (id)bundleIdentifier
{
  return @"com.apple.nanotimer.complication.recents";
}

- (id)sampleTemplate
{
  return [(NTKTimerRecentsBundleComplicationDataSource *)self currentSwitcherTemplate];
}

- (id)currentSwitcherTemplate
{
  v3 = [NTKTimerBundleTimelineEntry alloc];
  id v4 = [(NTKTimerRecentsBundleComplicationDataSource *)self device];
  v5 = [(NTKTimerBundleTimelineEntry *)v3 initWithDevice:v4];

  id v6 = +[NTKDate unmodifiedDate];
  [(NTKTimerBundleTimelineEntry *)v5 setEntryDate:v6];

  [(NTKTimerBundleTimelineEntry *)v5 setNumRunningTimers:0];
  [(NTKTimerBundleTimelineEntry *)v5 setNumPausedTimers:0];
  [(NTKTimerBundleComplicationDataSource *)self complicationDuration];
  -[NTKTimerBundleTimelineEntry setCountdownDuration:](v5, "setCountdownDuration:");
  [(NTKTimerBundleTimelineEntry *)v5 countdownDuration];
  -[NTKTimerBundleTimelineEntry setRemainingTime:](v5, "setRemainingTime:");
  [(NTKTimerBundleTimelineEntry *)v5 setTitle:0];
  [(NTKTimerBundleTimelineEntry *)v5 setState:1];
  id v7 = [(NTKTimerBundleTimelineEntry *)v5 entryForComplicationFamily:[(NTKTimerRecentsBundleComplicationDataSource *)self family]];
  id v8 = [v7 complicationTemplate];

  return v8;
}

@end