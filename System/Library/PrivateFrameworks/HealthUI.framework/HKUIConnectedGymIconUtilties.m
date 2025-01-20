@interface HKUIConnectedGymIconUtilties
+ (id)iconForConnectedGymDevice:(id)a3 preferredIconWidth:(double)a4;
+ (void)initialize;
@end

@implementation HKUIConnectedGymIconUtilties

+ (void)initialize
{
  v2 = (void *)__HKUIManufacturerNameToLogoNameMapping;
  __HKUIManufacturerNameToLogoNameMapping = (uint64_t)&unk_1F3C22CB0;

  id v3 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  uint64_t v4 = _iconCache;
  _iconCache = (uint64_t)v3;
  MEMORY[0x1F41817F8](v3, v4);
}

+ (id)iconForConnectedGymDevice:(id)a3 preferredIconWidth:(double)a4
{
  v5 = [a3 manufacturer];
  v6 = [v5 lowercaseString];

  v7 = [v6 stringByReplacingOccurrencesOfString:@" " withString:&stru_1F3B9CF20];

  v8 = NSString;
  v9 = [(id)__HKUIManufacturerNameToLogoNameMapping objectForKeyedSubscript:v7];
  v10 = [v8 stringWithFormat:@"%@_%.0f", v9, *(void *)&a4];

  v11 = [(id)_iconCache objectForKeyedSubscript:v10];
  if (!v11)
  {
    v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v13 = [MEMORY[0x1E4FB1818] imageNamed:v10 inBundle:v12];
    v11 = objc_msgSend(v13, "hk_watchIconImage");

    if (v11)
    {
      [(id)_iconCache setObject:v11 forKeyedSubscript:v10];
    }
    else
    {
      _HKInitializeLogging();
      v14 = *MEMORY[0x1E4F29F28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_ERROR)) {
        +[HKUIConnectedGymIconUtilties iconForConnectedGymDevice:preferredIconWidth:]((uint64_t)v10, (uint64_t)v7, v14);
      }
    }
  }
  return v11;
}

+ (void)iconForConnectedGymDevice:(os_log_t)log preferredIconWidth:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1E0B26000, log, OS_LOG_TYPE_ERROR, "No GymKit icon found with name '%{public}@' for manufacturer '%{public}@'", (uint8_t *)&v3, 0x16u);
}

@end