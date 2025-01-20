@interface NTKDigitalWorldClockComplicationBundleDataSource
+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4;
+ (id)appIdentifier;
+ (id)bundleIdentifier;
+ (id)complicationDescriptors;
+ (id)localizedComplicationName;
- (BOOL)alwaysShowIdealizedTemplateInSwitcher;
- (NTKDigitalWorldClockComplicationBundleDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5;
- (id)_city;
- (id)_graphicTemplateWithOverrideDate:(id)a3;
- (id)currentSwitcherTemplate;
- (id)privacyTemplate;
- (id)sampleTemplate;
- (void)getCurrentTimelineEntryWithHandler:(id)a3;
- (void)getLaunchURLForTimelineEntryDate:(id)a3 timeTravelDate:(id)a4 withHandler:(id)a5;
@end

@implementation NTKDigitalWorldClockComplicationBundleDataSource

+ (id)bundleIdentifier
{
  return @"com.apple.NanoTimeKit.DigitalWorldClock";
}

+ (id)appIdentifier
{
  return NTKWorldClockApplicationBundleIdentifier;
}

+ (id)localizedComplicationName
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"COMPLICATION_TITLE" value:&stru_10610 table:@"DigitalWorldClock"];

  return v3;
}

+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4
{
  id v5 = a4;
  id v6 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"79129411-2004-4B40-89F6-B0E14651B97F"];
  unsigned int v7 = [v5 supportsCapability:v6];

  if (!v7) {
    return 0;
  }
  return a3 == 10 || a3 == 12;
}

+ (id)complicationDescriptors
{
  v2 = +[NTKWorldClockManager sharedManager];
  uint64_t v3 = [v2 cities];
  if (!v3 || (v4 = (void *)v3, unsigned int v5 = [v2 checkIfCitiesModified], v4, v5)) {
    [v2 loadCities];
  }
  v23 = +[NSMutableOrderedSet orderedSet];
  v21 = v2;
  [v2 cities];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v24 = *(void *)v26;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v26 != v24) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v10 = [v9 alCityId];
        v11 = [v10 stringValue];
        v12 = [v9 name];
        v13 = NTKWorldClockCityAbbreviation();
        v14 = +[NSMutableDictionary dictionary];
        v15 = v14;
        if (v13) {
          [v14 setObject:v13 forKey:@"name"];
        }
        if (v10) {
          [v15 setObject:v10 forKey:@"cityID"];
        }
        v16 = NTKClockFaceLocalizedString();
        v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v16, v12);
        id v18 = [objc_alloc((Class)CLKComplicationDescriptor) initWithIdentifier:v11 displayName:v17 supportedFamilies:&off_10B78 userInfo:v15];
        if (v18) {
          [v23 addObject:v18];
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v7);
  }
  id v19 = [v23 copy];

  return v19;
}

- (NTKDigitalWorldClockComplicationBundleDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5
{
  id v8 = a5;
  v11.receiver = self;
  v11.super_class = (Class)NTKDigitalWorldClockComplicationBundleDataSource;
  v9 = [(NTKDigitalWorldClockComplicationBundleDataSource *)&v11 initWithComplication:a3 family:a4 forDevice:v8];
  if (v9) {
    v9->_showGossamerUI = NTKShowGossamerUI();
  }

  return v9;
}

- (id)currentSwitcherTemplate
{
  return [(NTKDigitalWorldClockComplicationBundleDataSource *)self sampleTemplate];
}

- (BOOL)alwaysShowIdealizedTemplateInSwitcher
{
  return 1;
}

- (id)sampleTemplate
{
  uint64_t v3 = NTKIdealizedDate();
  v4 = [(NTKDigitalWorldClockComplicationBundleDataSource *)self _graphicTemplateWithOverrideDate:v3];

  return v4;
}

- (id)privacyTemplate
{
  if ([(NTKDigitalWorldClockComplicationBundleDataSource *)self family] == &dword_C)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&unk_18028);
    id WeakRetained = objc_loadWeakRetained(&qword_18030);
    if (WeakRetained)
    {
      uint64_t v3 = WeakRetained;
      v4 = +[CLKRenderingContext sharedRenderingContext];
      id v5 = [v4 device];
      id v6 = objc_loadWeakRetained(&qword_18030);
      if (v5 == v6)
      {
        v12 = +[CLKRenderingContext sharedRenderingContext];
        v13 = [v12 device];
        id v14 = [v13 version];
        uint64_t v15 = qword_18038;

        if (v14 == (id)v15)
        {
          v16 = &qword_18020;
          v17 = (Class *)CLKComplicationTemplateGraphicExtraLargeCircularImage_ptr;
          id v18 = (os_unfair_lock_s *)&unk_18028;
          goto LABEL_15;
        }
      }
      else
      {
      }
    }
    id v19 = +[CLKRenderingContext sharedRenderingContext];
    v20 = [v19 device];
    objc_storeWeak(&qword_18030, v20);

    id v21 = objc_loadWeakRetained(&qword_18030);
    qword_18038 = (uint64_t)[v21 version];

    v22 = +[CLKRenderingContext sharedRenderingContext];
    v23 = [v22 device];
    sub_476C((uint64_t)v23, (uint64_t)v23);
    v16 = &qword_18020;
    v17 = (Class *)CLKComplicationTemplateGraphicExtraLargeCircularImage_ptr;
    id v18 = (os_unfair_lock_s *)&unk_18028;
  }
  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)&unk_18048);
    id v7 = objc_loadWeakRetained(&qword_18050);
    if (v7)
    {
      id v8 = v7;
      v9 = +[CLKRenderingContext sharedRenderingContext];
      id v10 = [v9 device];
      id v11 = objc_loadWeakRetained(&qword_18050);
      if (v10 == v11)
      {
        uint64_t v24 = +[CLKRenderingContext sharedRenderingContext];
        long long v25 = [v24 device];
        id v26 = [v25 version];
        uint64_t v27 = qword_18058;

        if (v26 == (id)v27)
        {
          v16 = &qword_18040;
          v17 = (Class *)CLKComplicationTemplateGraphicCircularImage_ptr;
          id v18 = (os_unfair_lock_s *)&unk_18048;
          goto LABEL_15;
        }
      }
      else
      {
      }
    }
    long long v28 = +[CLKRenderingContext sharedRenderingContext];
    v29 = [v28 device];
    objc_storeWeak(&qword_18050, v29);

    id v30 = objc_loadWeakRetained(&qword_18050);
    qword_18058 = (uint64_t)[v30 version];

    v22 = +[CLKRenderingContext sharedRenderingContext];
    v23 = [v22 device];
    sub_489C();
    v16 = &qword_18040;
    v17 = (Class *)CLKComplicationTemplateGraphicCircularImage_ptr;
    id v18 = (os_unfair_lock_s *)&unk_18048;
  }

LABEL_15:
  os_unfair_lock_unlock(v18);
  id v31 = [objc_alloc(*v17) initWithImageProvider:*v16];
  uint64_t v34 = NTKRichComplicationViewUsePlatterKey;
  v35 = &__kCFBooleanTrue;
  v32 = +[NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
  [v31 setMetadata:v32];

  return v31;
}

- (void)getCurrentTimelineEntryWithHandler:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  id v8 = +[NSDate date];
  id v5 = CLKForcedTime();

  if (v5)
  {
    id v5 = NTKIdealizedDate();
  }
  id v6 = [(NTKDigitalWorldClockComplicationBundleDataSource *)self _graphicTemplateWithOverrideDate:v5];
  id v7 = +[CLKComplicationTimelineEntry entryWithDate:v8 complicationTemplate:v6];
  v4[2](v4, v7);
}

- (void)getLaunchURLForTimelineEntryDate:(id)a3 timeTravelDate:(id)a4 withHandler:(id)a5
{
  id v6 = (void (**)(id, void *))a5;
  id v7 = [(NTKDigitalWorldClockComplicationBundleDataSource *)self _city];
  id v8 = [v7 alCityId];
  id v10 = +[NSString stringWithFormat:@"nwc://id/%@", v8];

  v9 = +[NSURL URLWithString:v10];
  v6[2](v6, v9);
}

- (id)_city
{
  v2 = [(NTKDigitalWorldClockComplicationBundleDataSource *)self complicationDescriptor];
  uint64_t v3 = [v2 userInfo];
  v4 = [v3 objectForKey:@"cityID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = objc_msgSend(objc_alloc((Class)WorldClockCity), "initWithALCityIdentifier:", objc_msgSend(v4, "intValue"));
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (id)_graphicTemplateWithOverrideDate:(id)a3
{
  id v4 = a3;
  id v5 = (int *)[(NTKDigitalWorldClockComplicationBundleDataSource *)self family];
  id v6 = +[NSMutableDictionary dictionary];
  id v7 = v6;
  if (v4) {
    [v6 setObject:v4 forKey:@"NTKDigitalWorldClockGraphicCircularViewOverrideDateKey"];
  }
  long long v25 = [(NTKDigitalWorldClockComplicationBundleDataSource *)self complicationDescriptor];
  id v8 = [v25 userInfo];
  v9 = [v8 objectForKey:@"name"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v9 = &stru_10610;
  }
  [v7 setObject:v9 forKey:@"NTKDigitalWorldClockGraphicCircularViewCityNameKey"];
  uint64_t v24 = v8;
  id v10 = [v8 objectForKey:@"cityID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = objc_msgSend(objc_alloc((Class)WorldClockCity), "initWithALCityIdentifier:", objc_msgSend(v10, "intValue"));
    v12 = [v11 alCity];

    if (v12) {
      [v7 setObject:v12 forKey:@"NTKDigitalWorldClockGraphicCircularViewCityKey"];
    }
  }
  else
  {
    v12 = 0;
  }
  v13 = [v12 timeZone];

  if (!v13
    || ([v12 timeZone],
        id v14 = objc_claimAutoreleasedReturnValue(),
        +[NSTimeZone timeZoneWithName:v14],
        uint64_t v15 = objc_claimAutoreleasedReturnValue(),
        v14,
        !v15))
  {
    uint64_t v15 = +[NSTimeZone localTimeZone];
  }
  v16 = +[CLKCurrentTimeTextProvider textProviderWithTimeZone:v15];
  [v16 setDisallowBothMinutesAndDesignator:1];
  [v16 setOverrideDate:v4];
  [v16 setPaused:v4 != 0];
  [v7 setObject:v16 forKey:@"NTKDigitalWorldClockGraphicCircularViewTimeTextProviderKey"];
  if (v5 == &dword_C) {
    v17 = (Class *)CLKComplicationTemplateGraphicExtraLargeCircularImage_ptr;
  }
  else {
    v17 = (Class *)CLKComplicationTemplateGraphicCircularImage_ptr;
  }
  id v18 = +[CLKFullColorImageProvider fullColorImageProviderWithImageViewClass:objc_opt_class()];
  id v19 = [v7 copy];
  [v18 setMetadata:v19];

  id v20 = [objc_alloc(*v17) initWithImageProvider:v18];
  if (*(unsigned char *)(v23 + 8))
  {
    uint64_t v26 = NTKRichComplicationViewUsePlatterKey;
    uint64_t v27 = &__kCFBooleanTrue;
    id v21 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    [v20 setMetadata:v21];
  }

  return v20;
}

@end