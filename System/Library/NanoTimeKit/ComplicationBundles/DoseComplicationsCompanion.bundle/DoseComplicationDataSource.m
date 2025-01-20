@interface DoseComplicationDataSource
+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4;
+ (id)appIdentifier;
+ (id)formatter;
+ (id)localizedAppName;
+ (id)localizedComplicationName;
- (id)alwaysOnTemplate;
- (id)currentSwitcherTemplate;
- (id)privacyTemplate;
- (void)getCurrentTimelineEntryWithHandler:(id)a3;
- (void)getSupportedTimeTravelDirectionsWithHandler:(id)a3;
@end

@implementation DoseComplicationDataSource

+ (id)formatter
{
  if (qword_10B10 != -1) {
    dispatch_once(&qword_10B10, &stru_C2A8);
  }
  v2 = (void *)qword_10B08;

  return v2;
}

+ (id)appIdentifier
{
  return @"com.apple.Noise";
}

+ (id)localizedAppName
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"APP_NAME" value:&stru_C3E0 table:0];
  v5 = [v2 localizedStringForKey:@"APP_NAME" value:v4 table:@"Noise"];

  return v5;
}

+ (id)localizedComplicationName
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"COMPLICATION_NAME" value:&stru_C3E0 table:0];
  v5 = [v2 localizedStringForKey:@"COMPLICATION_NAME" value:v4 table:@"Noise"];

  return v5;
}

+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [v6 nrDevice];
  if (v7
    && (v8 = (void *)v7,
        id v9 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"F5C2DAD0-38FB-4B3B-86D3-B264F4F8CBDA"], v10 = objc_msgSend(v6, "supportsCapability:", v9), v9, v8, !v10))
  {
    unsigned __int8 v12 = 0;
  }
  else
  {
    v11 = [a1 formatter];
    unsigned __int8 v12 = [v11 supportsFamily:a3 forDevice:v6];
  }
  return v12;
}

- (id)privacyTemplate
{
  return 0;
}

- (id)currentSwitcherTemplate
{
  v3 = [(id)objc_opt_class() formatter];
  id v4 = [(DoseComplicationDataSource *)self family];
  v5 = [(DoseComplicationDataSource *)self device];
  id v6 = [v3 switcherTemplateWithFamily:v4 forDevice:v5];

  return v6;
}

- (id)alwaysOnTemplate
{
  v3 = +[HUNoiseSettings sharedInstance];
  unsigned __int8 v4 = [v3 onboardingCompleted];

  v5 = [(id)objc_opt_class() formatter];
  id v6 = [(DoseComplicationDataSource *)self family];
  uint64_t v7 = [(DoseComplicationDataSource *)self device];
  if (v4) {
    [v5 alwaysOnTemplateWithFamily:v6 forDevice:v7];
  }
  else {
  v8 = [v5 setupNoiseTemplateWithFamily:v6 forDevice:v7];
  }

  return v8;
}

- (void)getSupportedTimeTravelDirectionsWithHandler:(id)a3
{
  if (a3) {
    (*((void (**)(id, void))a3 + 2))(a3, 0);
  }
}

- (void)getCurrentTimelineEntryWithHandler:(id)a3
{
  if (a3)
  {
    unsigned __int8 v4 = (void (**)(id, void *))a3;
    v5 = +[HUNoiseSettings sharedInstance];
    unsigned __int8 v6 = [v5 onboardingCompleted];

    uint64_t v7 = [(id)objc_opt_class() formatter];
    id v8 = [(DoseComplicationDataSource *)self family];
    id v9 = [(DoseComplicationDataSource *)self device];
    if (v6) {
      [v7 formattedTemplateWithFamily:v8 forDevice:v9];
    }
    else {
    id v12 = [v7 setupNoiseTemplateWithFamily:v8 forDevice:v9];
    }

    unsigned int v10 = +[NSDate date];
    v11 = +[CLKComplicationTimelineEntry entryWithDate:v10 complicationTemplate:v12];

    v4[2](v4, v11);
  }
}

@end