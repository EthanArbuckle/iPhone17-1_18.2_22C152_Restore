@interface HUHomeEnergyWrapper
+ (void)setupGridForecastSnapshotsFor:(id)a3;
@end

@implementation HUHomeEnergyWrapper

+ (void)setupGridForecastSnapshotsFor:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    v7 = "+[HUHomeEnergyWrapper setupGridForecastSnapshotsFor:]";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v6, 0x16u);
  }

  if (v3)
  {
    v5 = [[HUHomeEnergyManagerHelper alloc] initWithHome:v3];
    [(HUHomeEnergyManagerHelper *)v5 initializeGridForecastSnapshots];
  }
}

@end