@interface HKMCComplicationDataSource
+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4;
+ (BOOL)hasMigratedToWidgetForFamily:(int64_t)a3 device:(id)a4;
+ (id)_tintColor;
+ (id)appIdentifier;
+ (id)bundleIdentifier;
+ (id)localizedAppName;
- (HKMCComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5;
- (id)_currentTimelineEntry;
- (id)currentSwitcherTemplate;
- (void)_configureTemplate;
- (void)fetchWidgetMigrationForDescriptor:(id)a3 completion:(id)a4;
- (void)getCurrentTimelineEntryWithHandler:(id)a3;
- (void)getLaunchURLForTimelineEntryDate:(id)a3 timeTravelDate:(id)a4 withHandler:(id)a5;
@end

@implementation HKMCComplicationDataSource

+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4
{
  int v5 = [a4 isRunningGraceOrLater];
  if (v5)
  {
    if (*MEMORY[0x263EFCF20] == a3)
    {
      LOBYTE(v5) = 1;
    }
    else if ((unint64_t)a3 <= 0xC)
    {
      LOBYTE(v5) = (0x1795u >> a3) & 1;
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

+ (id)bundleIdentifier
{
  return @"com.apple.NanoMenstrualCyclesComplication";
}

+ (id)appIdentifier
{
  return @"com.apple.NanoMenstrualCycles";
}

+ (id)localizedAppName
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"APP_NAME" value:&stru_26F0BC308 table:0];

  return v3;
}

+ (id)_tintColor
{
  return (id)MEMORY[0x270F9A6D0](MEMORY[0x263F1C550], sel_hkmc_menstruationColor);
}

- (HKMCComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v13.receiver = self;
  v13.super_class = (Class)HKMCComplicationDataSource;
  int v5 = [(CLKCComplicationDataSource *)&v13 initWithComplication:a3 family:a4 forDevice:a5];
  v6 = v5;
  if (v5)
  {
    [(HKMCComplicationDataSource *)v5 _configureTemplate];
    _HKInitializeLogging();
    v7 = (void *)*MEMORY[0x263F09930];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      v9 = objc_opt_class();
      v10 = v6->_template;
      *(_DWORD *)buf = 138543618;
      v15 = v9;
      __int16 v16 = 2112;
      v17 = v10;
      id v11 = v9;
      _os_log_impl(&dword_23CB1B000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Initializing with template: %@", buf, 0x16u);
    }
  }
  return v6;
}

- (void)_configureTemplate
{
  int64_t v3 = [(CLKCComplicationDataSource *)self family];
  if (v3 == *MEMORY[0x263EFCF20])
  {
    v4 = (void *)MEMORY[0x263EFCFA0];
    int v5 = objc_msgSend(MEMORY[0x263EFD1D0], "hkmc_imageProviderWithImageName:", @"Circular");
    v6 = [v4 templateWithImageProvider:v5];

    v7 = self->_template;
    self->_template = v6;
  }
  switch([(CLKCComplicationDataSource *)self family])
  {
    case 0:
      v8 = (void *)MEMORY[0x263EFD118];
      v9 = (void *)MEMORY[0x263EFD1D0];
      v10 = @"Modular";
      goto LABEL_8;
    case 2:
      v8 = (void *)MEMORY[0x263EFD160];
      v9 = (void *)MEMORY[0x263EFD1D0];
      v10 = @"Utilitarian";
      goto LABEL_8;
    case 4:
      v8 = (void *)MEMORY[0x263EFD118];
      v9 = (void *)MEMORY[0x263EFD1D0];
      v10 = @"Circular";
      goto LABEL_8;
    case 7:
      v8 = (void *)MEMORY[0x263EFCFF0];
      v9 = (void *)MEMORY[0x263EFD1D0];
      v10 = @"ExtraLarge";
LABEL_8:
      id v11 = objc_msgSend(v9, "hkmc_imageProviderWithImageName:", v10);
      v12 = [v8 templateWithImageProvider:v11];

      goto LABEL_14;
    case 8:
      objc_super v13 = (void *)MEMORY[0x263EFD060];
      v14 = (void *)MEMORY[0x263EFD1A8];
      v15 = @"GraphicCorner";
      goto LABEL_13;
    case 9:
      __int16 v16 = (void *)MEMORY[0x263EFD030];
      v17 = objc_msgSend(MEMORY[0x263EFD1A8], "hkmc_fullColorImageProviderWithImageName:", @"GraphicCircular");
      uint64_t v18 = [v16 templateWithImageProvider:v17];

      objc_msgSend(v18, "hkmc_addBackgroundColorMetadata");
      v19 = [MEMORY[0x263EFD018] templateWithCircularTemplate:v18];
      v20 = self->_template;
      self->_template = v19;

      break;
    case 10:
      objc_super v13 = (void *)MEMORY[0x263EFD030];
      v14 = (void *)MEMORY[0x263EFD1A8];
      v15 = @"GraphicCircular";
      goto LABEL_13;
    case 12:
      objc_super v13 = (void *)MEMORY[0x263EFD0A0];
      v14 = (void *)MEMORY[0x263EFD1A8];
      v15 = @"GraphicExtraLarge";
LABEL_13:
      v21 = objc_msgSend(v14, "hkmc_fullColorImageProviderWithImageName:", v15);
      v12 = [v13 templateWithImageProvider:v21];

      [(CLKComplicationTemplate *)v12 hkmc_addBackgroundColorMetadata];
LABEL_14:
      v22 = self->_template;
      self->_template = v12;

      break;
    default:
      break;
  }
  v23 = self->_template;
  id v24 = [(id)objc_opt_class() _tintColor];
  [(CLKComplicationTemplate *)v23 setTintColor:v24];
}

- (id)_currentTimelineEntry
{
  if (self->_template)
  {
    int64_t v3 = (void *)MEMORY[0x263EFD168];
    v4 = [MEMORY[0x263EFF910] date];
    int v5 = [v3 entryWithDate:v4 complicationTemplate:self->_template];
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

- (void)getCurrentTimelineEntryWithHandler:(id)a3
{
  id v5 = a3;
  id v6 = [(HKMCComplicationDataSource *)self _currentTimelineEntry];
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

- (id)currentSwitcherTemplate
{
  v2 = [(HKMCComplicationDataSource *)self _currentTimelineEntry];
  int64_t v3 = [v2 complicationTemplate];

  return v3;
}

- (void)getLaunchURLForTimelineEntryDate:(id)a3 timeTravelDate:(id)a4 withHandler:(id)a5
{
  id v6 = NSURL;
  v7 = NSString;
  id v8 = a5;
  id v10 = [v7 stringWithFormat:@"NanoMenstrualCycles://"];
  v9 = [v6 URLWithString:v10];
  (*((void (**)(id, void *))a5 + 2))(v8, v9);
}

- (void)fetchWidgetMigrationForDescriptor:(id)a3 completion:(id)a4
{
  v4 = (objc_class *)MEMORY[0x263EFD238];
  id v5 = (void (**)(id, id))a4;
  id v6 = [v4 alloc];
  id v7 = (id)[v6 initWithExtensionBundleIdentifier:*MEMORY[0x263F45000] containerBundleIdentifier:*MEMORY[0x263F44FF8] kind:*MEMORY[0x263F45008] intent:0];
  v5[2](v5, v7);
}

+ (BOOL)hasMigratedToWidgetForFamily:(int64_t)a3 device:(id)a4
{
  v4 = (objc_class *)MEMORY[0x263F08C38];
  id v5 = a4;
  id v6 = (void *)[[v4 alloc] initWithUUIDString:@"4A864DD3-D518-4FB7-9583-38E6B0581585"];
  char v7 = [v5 supportsCapability:v6];

  return v7;
}

- (void).cxx_destruct
{
}

@end