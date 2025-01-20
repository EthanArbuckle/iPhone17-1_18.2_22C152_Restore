@interface TTRComplicationDataSource
+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4;
+ (BOOL)hasMigratedToWidgetForFamily:(int64_t)a3 device:(id)a4;
+ (id)appIdentifier;
+ (id)legacyNTKComplicationType;
+ (id)localizedAppName;
- (CLKComplicationTimelineEntry)currentTimelineEntry;
- (TTRComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5;
- (TTRComplicationModule)module;
- (TTRComplicationPresenting)presenter;
- (TTRComplicationViewModel)viewModel;
- (id)currentSwitcherTemplate;
- (id)lockedTemplate;
- (id)privacyTemplate;
- (void)complicationPresenterDidUpdateViewModel:(id)a3;
- (void)fetchWidgetMigrationForDescriptor:(id)a3 completion:(id)a4;
- (void)getCurrentTimelineEntryWithHandler:(id)a3;
- (void)getLaunchURLForTimelineEntryDate:(id)a3 timeTravelDate:(id)a4 withHandler:(id)a5;
- (void)getTimelineEndDateWithHandler:(id)a3;
- (void)getTimelineEntriesAfterDate:(id)a3 limit:(unint64_t)a4 withHandler:(id)a5;
- (void)pause;
- (void)resume;
@end

@implementation TTRComplicationDataSource

+ (id)legacyNTKComplicationType
{
  return &off_10D48;
}

+ (id)localizedAppName
{
  v2 = RemindersUICoreBundleGet();
  v3 = [v2 localizedStringForKey:@"Reminders" value:@"Reminders" table:@"Localizable"];

  return v3;
}

+ (id)appIdentifier
{
  return REMAppBundleIdentifier;
}

+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4
{
  id v5 = a4;
  if ([v5 isRunningGraceOrLater]) {
    BOOL v6 = TTRComplicationModuleAcceptsFamilyForDevice(a3);
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (TTRComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = +[REMLog ui];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    id v18 = v8;
    __int16 v19 = 2048;
    int64_t v20 = a4;
    __int16 v21 = 2112;
    id v22 = v9;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "TTRComplicationDataSource is being initialized {compliation: %@, family: %ld, device: %@}", buf, 0x20u);
  }

  v16.receiver = self;
  v16.super_class = (Class)TTRComplicationDataSource;
  v11 = [(TTRComplicationDataSource *)&v16 initWithComplication:v8 family:a4 forDevice:v9];
  if (v11)
  {
    uint64_t v12 = +[TTRComplicationAssembly assembleModuleForComplicationFamily:a4 isRunningInClockFace:0];
    module = v11->_module;
    v11->_module = (TTRComplicationModule *)v12;

    v14 = [(TTRComplicationModule *)v11->_module presenter];
    [v14 setDelegate:v11];
  }
  return v11;
}

- (void)pause
{
  v3 = +[REMLog ui];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "-[TTRComplicationDataSource pause]", buf, 2u);
  }

  v4 = [(TTRComplicationDataSource *)self presenter];
  [v4 pauseViewModelUpdates];

  v5.receiver = self;
  v5.super_class = (Class)TTRComplicationDataSource;
  [(TTRComplicationDataSource *)&v5 pause];
}

- (void)resume
{
  v3 = +[REMLog ui];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "-[TTRComplicationDataSource resume]", buf, 2u);
  }

  v4 = [(TTRComplicationDataSource *)self presenter];
  [v4 resumeViewModelUpdates];

  v5.receiver = self;
  v5.super_class = (Class)TTRComplicationDataSource;
  [(TTRComplicationDataSource *)&v5 resume];
}

- (id)currentSwitcherTemplate
{
  v2 = [(TTRComplicationDataSource *)self currentTimelineEntry];
  v3 = [v2 complicationTemplate];

  return v3;
}

- (id)lockedTemplate
{
  v2 = [(TTRComplicationDataSource *)self viewModel];
  v3 = [v2 lockedTemplate];

  return v3;
}

- (id)privacyTemplate
{
  v2 = [(TTRComplicationDataSource *)self viewModel];
  v3 = [v2 privacyTemplate];

  return v3;
}

- (void)getTimelineEndDateWithHandler:(id)a3
{
}

- (void)getCurrentTimelineEntryWithHandler:(id)a3
{
  id v5 = a3;
  id v6 = [(TTRComplicationDataSource *)self currentTimelineEntry];
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

- (void)getTimelineEntriesAfterDate:(id)a3 limit:(unint64_t)a4 withHandler:(id)a5
{
  id v9 = a5;
  id v10 = a3;
  id v12 = [(TTRComplicationDataSource *)self viewModel];
  v11 = [v12 entriesAfterDate:v10 limit:a4];

  (*((void (**)(id, void *))a5 + 2))(v9, v11);
}

- (void)getLaunchURLForTimelineEntryDate:(id)a3 timeTravelDate:(id)a4 withHandler:(id)a5
{
  id v6 = (void (**)(id, void *))a5;
  v7 = [(TTRComplicationDataSource *)self presenter];
  id v8 = [v7 launchURLForTimelineEntries];

  id v9 = +[REMLog ui];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412290;
    v11 = v8;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Returning launch URL {URL: %@}", (uint8_t *)&v10, 0xCu);
  }

  v6[2](v6, v8);
}

- (void)complicationPresenterDidUpdateViewModel:(id)a3
{
  id v3 = [(TTRComplicationDataSource *)self delegate];
  [v3 invalidateEntries];
}

- (void)fetchWidgetMigrationForDescriptor:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, id))a4;
  id v7 = [objc_alloc((Class)CLKWidgetComplicationDescriptor) initWithExtensionBundleIdentifier:@"com.apple.NanoReminders.WidgetExtension" containerBundleIdentifier:@"com.apple.NanoReminders" kind:@"com.apple.reminders.widget.today" intent:0];
  id v8 = +[REMLog ui];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412546;
    id v10 = v5;
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "TTRComplicationDataSource fetched widget migration {descriptor: %@, widgetDescriptor %@}", (uint8_t *)&v9, 0x16u);
  }

  v6[2](v6, v7);
}

+ (BOOL)hasMigratedToWidgetForFamily:(int64_t)a3 device:(id)a4
{
  id v5 = a4;
  id v6 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"A14F53B9-2C95-4293-B688-2D8D34A4239E"];
  unsigned int v7 = [v5 supportsCapability:v6];

  id v8 = +[REMLog ui];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    CFStringRef v9 = @"NO";
    int v11 = 138412802;
    if (v7) {
      CFStringRef v9 = @"YES";
    }
    CFStringRef v12 = v9;
    __int16 v13 = 2048;
    int64_t v14 = a3;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "TTRComplicationDataSource hasMigratedToWidgetForFamily returning %@ for {family: %ld, device %@}", (uint8_t *)&v11, 0x20u);
  }

  return v7;
}

- (TTRComplicationPresenting)presenter
{
  v2 = [(TTRComplicationDataSource *)self module];
  id v3 = [v2 presenter];

  return (TTRComplicationPresenting *)v3;
}

- (TTRComplicationViewModel)viewModel
{
  v2 = [(TTRComplicationDataSource *)self presenter];
  id v3 = [v2 viewModel];

  return (TTRComplicationViewModel *)v3;
}

- (CLKComplicationTimelineEntry)currentTimelineEntry
{
  v2 = [(TTRComplicationDataSource *)self viewModel];
  id v3 = [v2 currentEntry];

  return (CLKComplicationTimelineEntry *)v3;
}

- (TTRComplicationModule)module
{
  return self->_module;
}

- (void).cxx_destruct
{
}

@end