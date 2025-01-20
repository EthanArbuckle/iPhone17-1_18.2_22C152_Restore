@interface NTKDigitalSecondsComplicationBundleDataSource
+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4;
+ (id)bundleIdentifier;
+ (id)localizedComplicationName;
+ (id)sectionIdentifier;
- (BOOL)alwaysShowIdealizedTemplateInSwitcher;
- (BOOL)supportsTapAction;
- (id)_graphicTemplateWithOverrideDate:(id)a3;
- (id)currentSwitcherTemplate;
- (id)sampleTemplate;
- (void)getCurrentTimelineEntryWithHandler:(id)a3;
@end

@implementation NTKDigitalSecondsComplicationBundleDataSource

+ (id)bundleIdentifier
{
  return @"com.apple.NanoTimeKit.DigitalSeconds";
}

+ (id)sectionIdentifier
{
  return NTKComplicationTimeGroupIdentifier;
}

+ (id)localizedComplicationName
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"COMPLICATION_TITLE" value:&stru_10610 table:@"DigitalSeconds"];

  return v3;
}

- (BOOL)supportsTapAction
{
  return 0;
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

- (id)currentSwitcherTemplate
{
  return [(NTKDigitalSecondsComplicationBundleDataSource *)self sampleTemplate];
}

- (BOOL)alwaysShowIdealizedTemplateInSwitcher
{
  return 1;
}

- (id)sampleTemplate
{
  v3 = NTKIdealizedDate();
  v4 = [(NTKDigitalSecondsComplicationBundleDataSource *)self _graphicTemplateWithOverrideDate:v3];

  return v4;
}

- (void)getCurrentTimelineEntryWithHandler:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  id v5 = CLKForcedTime();

  if (v5)
  {
    uint64_t v6 = NTKIdealizedDate();
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v10 = (id)v6;
  unsigned int v7 = [(NTKDigitalSecondsComplicationBundleDataSource *)self _graphicTemplateWithOverrideDate:v6];
  v8 = +[NSDate date];
  v9 = +[CLKComplicationTimelineEntry entryWithDate:v8 complicationTemplate:v7];

  v4[2](v4, v9);
}

- (id)_graphicTemplateWithOverrideDate:(id)a3
{
  id v4 = a3;
  id v5 = (int *)[(NTKDigitalSecondsComplicationBundleDataSource *)self family];
  uint64_t v6 = +[CLKFullColorImageProvider fullColorImageProviderWithImageViewClass:objc_opt_class()];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CFStringRef v11 = @"NTKDigitalSecondsGraphicCircularViewOverrideDateKey";
    id v12 = v4;
    unsigned int v7 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    [v6 setMetadata:v7];
  }
  v8 = (Class *)CLKComplicationTemplateGraphicExtraLargeCircularImage_ptr;
  if (v5 != &dword_C) {
    v8 = (Class *)CLKComplicationTemplateGraphicCircularImage_ptr;
  }
  id v9 = [objc_alloc(*v8) initWithImageProvider:v6];

  return v9;
}

@end