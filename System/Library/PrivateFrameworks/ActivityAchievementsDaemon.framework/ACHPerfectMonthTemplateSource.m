@interface ACHPerfectMonthTemplateSource
- (ACHPerfectMonthTemplateSource)init;
- (BOOL)sourceShouldRunForDate:(id)a3;
- (NSCalendar)utcGregorianCalendar;
- (NSString)identifier;
- (id)_modelsDirectoryBasePathForTemplate:(id)a3;
- (id)_monthlyAchievementsAssetsDirectoryBasePath;
- (id)localizationBundleURLForTemplate:(id)a3;
- (id)propertyListBundleURLForTemplate:(id)a3;
- (id)resourceBundleURLForTemplate:(id)a3;
- (id)stickerBundleURLForTemplate:(id)a3;
- (int64_t)runCadence;
- (void)setUtcGregorianCalendar:(id)a3;
- (void)templatesForDate:(id)a3 completion:(id)a4;
@end

@implementation ACHPerfectMonthTemplateSource

- (ACHPerfectMonthTemplateSource)init
{
  v6.receiver = self;
  v6.super_class = (Class)ACHPerfectMonthTemplateSource;
  v2 = [(ACHPerfectMonthTemplateSource *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendarWithUTCTimeZone");
    utcGregorianCalendar = v2->_utcGregorianCalendar;
    v2->_utcGregorianCalendar = (NSCalendar *)v3;
  }
  return v2;
}

- (NSString)identifier
{
  return (NSString *)(id)*MEMORY[0x263F23620];
}

- (int64_t)runCadence
{
  return 1;
}

- (BOOL)sourceShouldRunForDate:(id)a3
{
  return 1;
}

- (void)templatesForDate:(id)a3 completion:(id)a4
{
  id v22 = a3;
  id v21 = a4;
  objc_super v6 = [(ACHPerfectMonthTemplateSource *)self utcGregorianCalendar];
  v20 = ACHDateComponentsForYearMonthDay();
  v7 = objc_msgSend(v6, "dateFromComponents:");
  v8 = [MEMORY[0x263EFF910] date];
  [v6 component:4 fromDate:v8];

  v19 = ACHDateComponentsForYearMonthDay();
  v9 = objc_msgSend(v6, "dateFromComponents:");
  id v10 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v11 = v7;
  v12 = v11;
  if ([v11 compare:v9] != 1)
  {
    v13 = (void *)MEMORY[0x263F236E8];
    v14 = v11;
    do
    {
      v15 = (void *)MEMORY[0x223C50570]();
      v16 = [v6 components:*v13 fromDate:v14];
      v17 = PerfectMonthTemplateForDateComponents();
      [v10 addObject:v17];
      v12 = [v6 dateByAddingUnit:8 value:1 toDate:v14 options:0];

      v14 = v12;
    }
    while ([v12 compare:v9] != 1);
  }
  if (v21)
  {
    v18 = (void *)[v10 copy];
    (*((void (**)(id, void *, void, void))v21 + 2))(v21, v18, 0, 0);
  }
}

- (id)localizationBundleURLForTemplate:(id)a3
{
  uint64_t v3 = [(ACHPerfectMonthTemplateSource *)self _monthlyAchievementsAssetsDirectoryBasePath];
  v4 = [v3 stringByAppendingPathComponent:@"localization"];
  v5 = [v4 stringByAppendingPathComponent:@"perfect"];

  objc_super v6 = [NSURL fileURLWithPath:v5];

  return v6;
}

- (id)resourceBundleURLForTemplate:(id)a3
{
  uint64_t v3 = [(ACHPerfectMonthTemplateSource *)self _modelsDirectoryBasePathForTemplate:a3];
  v4 = [v3 stringByAppendingPathComponent:@"badgemodel"];

  v5 = [NSURL fileURLWithPath:v4];

  return v5;
}

- (id)propertyListBundleURLForTemplate:(id)a3
{
  uint64_t v3 = [(ACHPerfectMonthTemplateSource *)self _modelsDirectoryBasePathForTemplate:a3];
  v4 = [v3 stringByAppendingPathComponent:@"badgeproperties"];
  v5 = [v4 stringByAppendingPathComponent:@"perfect"];

  objc_super v6 = [NSURL fileURLWithPath:v5];

  return v6;
}

- (id)_monthlyAchievementsAssetsDirectoryBasePath
{
  if (_monthlyAchievementsAssetsDirectoryBasePath_onceToken != -1) {
    dispatch_once(&_monthlyAchievementsAssetsDirectoryBasePath_onceToken, &__block_literal_global_9);
  }
  v2 = (void *)_monthlyAchievementsAssetsDirectoryBasePath_monthlyAchievementsAssetsDirectoryBasePath;
  return v2;
}

uint64_t __76__ACHPerfectMonthTemplateSource__monthlyAchievementsAssetsDirectoryBasePath__block_invoke()
{
  uint64_t v0 = [(id)*MEMORY[0x263F235E8] stringByAppendingPathComponent:@"MonthlyAchievements"];
  uint64_t v1 = _monthlyAchievementsAssetsDirectoryBasePath_monthlyAchievementsAssetsDirectoryBasePath;
  _monthlyAchievementsAssetsDirectoryBasePath_monthlyAchievementsAssetsDirectoryBasePath = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (id)_modelsDirectoryBasePathForTemplate:(id)a3
{
  if (_modelsDirectoryBasePathForTemplate__onceToken != -1) {
    dispatch_once(&_modelsDirectoryBasePathForTemplate__onceToken, &__block_literal_global_297);
  }
  uint64_t v3 = (void *)_modelsDirectoryBasePathForTemplate__modelsDirecotryBasePath;
  return v3;
}

void __69__ACHPerfectMonthTemplateSource__modelsDirectoryBasePathForTemplate___block_invoke()
{
  id v2 = [(id)*MEMORY[0x263F235E8] stringByAppendingPathComponent:@"MonthlyAchievements"];
  uint64_t v0 = [v2 stringByAppendingPathComponent:@"models"];
  uint64_t v1 = (void *)_modelsDirectoryBasePathForTemplate__modelsDirecotryBasePath;
  _modelsDirectoryBasePathForTemplate__modelsDirecotryBasePath = v0;
}

- (id)stickerBundleURLForTemplate:(id)a3
{
  return 0;
}

- (NSCalendar)utcGregorianCalendar
{
  return self->_utcGregorianCalendar;
}

- (void)setUtcGregorianCalendar:(id)a3
{
}

- (void).cxx_destruct
{
}

@end