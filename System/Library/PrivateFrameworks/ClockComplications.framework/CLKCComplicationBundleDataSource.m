@interface CLKCComplicationBundleDataSource
+ (BOOL)hasMigratedToWidgetForFamily:(int64_t)a3 device:(id)a4;
+ (BOOL)useComplicationDescriptorsOnCompanion;
+ (NSOrderedSet)complicationDescriptors;
+ (NSString)bundleIdentifier;
+ (NSString)complicationApplicationIdentifier;
+ (NSString)localizedAppName;
+ (NSString)localizedComplicationName;
+ (id)appGroupIdentifier;
+ (id)legacyNTKComplicationType;
- (CLKComplicationDescriptor)complicationDescriptor;
- (id)complicationApplicationIdentifier;
- (void)fetchWidgetMigrationForDescriptor:(id)a3 completion:(id)a4;
- (void)fetchWidgetMigrationForDescriptor:(id)a3 family:(int64_t)a4 completion:(id)a5;
- (void)getLaunchURLForTimelineEntryDate:(id)a3 timeTravelDate:(id)a4 withHandler:(id)a5;
@end

@implementation CLKCComplicationBundleDataSource

+ (NSString)bundleIdentifier
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:a1];
  v3 = [v2 bundleIdentifier];

  return (NSString *)v3;
}

+ (NSOrderedSet)complicationDescriptors
{
  return 0;
}

+ (BOOL)useComplicationDescriptorsOnCompanion
{
  return 0;
}

+ (BOOL)hasMigratedToWidgetForFamily:(int64_t)a3 device:(id)a4
{
  return 0;
}

+ (NSString)localizedAppName
{
  return 0;
}

+ (id)legacyNTKComplicationType
{
  return 0;
}

+ (id)appGroupIdentifier
{
  return 0;
}

+ (NSString)localizedComplicationName
{
  return 0;
}

- (CLKComplicationDescriptor)complicationDescriptor
{
  v2 = [(CLKCComplicationDataSource *)self complication];
  if (objc_opt_respondsToSelector())
  {
    v3 = [v2 complicationDescriptor];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (v3) {
        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  v3 = [MEMORY[0x1E4F196C8] legacyComplicationDescriptor];
LABEL_7:

  return (CLKComplicationDescriptor *)v3;
}

+ (NSString)complicationApplicationIdentifier
{
  return 0;
}

- (id)complicationApplicationIdentifier
{
  v2 = objc_opt_class();

  return (id)[v2 appIdentifier];
}

- (void)getLaunchURLForTimelineEntryDate:(id)a3 timeTravelDate:(id)a4 withHandler:(id)a5
{
  v11 = (void (**)(id, void *))a5;
  v6 = [(id)objc_opt_class() appIdentifier];
  if (![v6 length])
  {
    uint64_t v7 = [(CLKCComplicationBundleDataSource *)self complicationApplicationIdentifier];

    v6 = (void *)v7;
  }
  if ([v6 length])
  {
    v8 = (void *)MEMORY[0x1E4F1CB10];
    v9 = [NSString stringWithFormat:@"%@://", v6];
    v10 = [v8 URLWithString:v9];
  }
  else
  {
    v10 = 0;
  }
  v11[2](v11, v10);
}

- (void)fetchWidgetMigrationForDescriptor:(id)a3 family:(int64_t)a4 completion:(id)a5
{
}

- (void)fetchWidgetMigrationForDescriptor:(id)a3 completion:(id)a4
{
}

@end