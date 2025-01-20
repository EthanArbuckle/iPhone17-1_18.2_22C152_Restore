@interface NearbyTransitComplicationDataSource
+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4;
+ (BOOL)hasMigratedToWidgetForFamily:(int64_t)a3 device:(id)a4;
+ (id)appIdentifier;
+ (id)bundleIdentifier;
+ (id)localizedAppName;
+ (id)localizedComplicationName;
- (id)currentSwitcherTemplate;
- (void)fetchWidgetMigrationForDescriptor:(id)a3 completion:(id)a4;
- (void)getCurrentTimelineEntryWithHandler:(id)a3;
- (void)getLaunchURLForTimelineEntryDate:(id)a3 timeTravelDate:(id)a4 withHandler:(id)a5;
@end

@implementation NearbyTransitComplicationDataSource

+ (id)appIdentifier
{
  return @"com.apple.NanoMaps";
}

+ (id)bundleIdentifier
{
  return @"com.apple.NanoMaps.NanoMapsComplications";
}

+ (id)localizedComplicationName
{
  v2 = +[NSBundle bundleForClass:NSClassFromString(@"NearbyTransitComplicationDataSource")];
  v3 = [v2 localizedStringForKey:@"[Nearby Transit Complication] Nearby Transit" value:@"localized string not found" table:0];

  return v3;
}

+ (id)localizedAppName
{
  v2 = +[NSBundle bundleForClass:NSClassFromString(@"NearbyTransitComplicationDataSource")];
  v3 = [v2 localizedStringForKey:@"[Localized App Name] Maps" value:@"localized string not found" table:0];

  return v3;
}

+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4
{
  return +[NearbyTransitComplicationFormatter supportsFamily:a3 forDevice:a4];
}

- (id)currentSwitcherTemplate
{
  id v3 = [(NearbyTransitComplicationDataSource *)self family];
  v4 = [(NearbyTransitComplicationDataSource *)self device];
  v5 = +[NearbyTransitComplicationFormatter formattedTemplateWithFamily:v3 forDevice:v4];

  return v5;
}

- (void)getCurrentTimelineEntryWithHandler:(id)a3
{
  if (a3)
  {
    v4 = (void (**)(id, void *))a3;
    id v5 = [(NearbyTransitComplicationDataSource *)self family];
    v6 = [(NearbyTransitComplicationDataSource *)self device];
    id v9 = +[NearbyTransitComplicationFormatter formattedTemplateWithFamily:v5 forDevice:v6];

    v7 = +[NSDate date];
    v8 = +[CLKComplicationTimelineEntry entryWithDate:v7 complicationTemplate:v9];

    v4[2](v4, v8);
  }
}

- (void)getLaunchURLForTimelineEntryDate:(id)a3 timeTravelDate:(id)a4 withHandler:(id)a5
{
  if (a5)
  {
    id v5 = (void (**)(id, id))a5;
    v6 = +[NSString stringWithFormat:@"NearbyTransit://"];
    id v7 = +[NSURL URLWithString:v6];

    v5[2](v5, v7);
  }
}

- (void)fetchWidgetMigrationForDescriptor:(id)a3 completion:(id)a4
{
  v4 = (void (**)(id, id))a4;
  id v5 = objc_alloc((Class)CLKWidgetComplicationDescriptor);
  v6 = [(id)objc_opt_class() appIdentifier];
  id v7 = [v5 initWithExtensionBundleIdentifier:@"com.apple.NanoMaps.NanoMapsWidgetKitComplications" containerBundleIdentifier:v6 kind:@"NearByTransitComplication" intent:0];

  v4[2](v4, v7);
}

+ (BOOL)hasMigratedToWidgetForFamily:(int64_t)a3 device:(id)a4
{
  return 1;
}

@end