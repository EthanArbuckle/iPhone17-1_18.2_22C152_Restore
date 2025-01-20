@interface NSUserDefaults(FIUIBackupSupport)
+ (id)fu_npsManager;
+ (uint64_t)fu_backupStandardUserDefaultsKey:()FIUIBackupSupport;
+ (uint64_t)fu_synchronizeStandardUserDefaultsKey:()FIUIBackupSupport;
+ (void)fu_backupAndSetBool:()FIUIBackupSupport forKey:;
+ (void)fu_backupAndSetDouble:()FIUIBackupSupport forKey:;
+ (void)fu_backupAndSetFloat:()FIUIBackupSupport forKey:;
+ (void)fu_backupAndSetInteger:()FIUIBackupSupport forKey:;
+ (void)fu_backupAndSetObject:()FIUIBackupSupport forKey:;
+ (void)fu_backupAndSetURL:()FIUIBackupSupport forKey:;
+ (void)fu_backupStandardUserDefaultsKey:()FIUIBackupSupport useContainer:;
+ (void)fu_synchronizeStandardUserDefaultsKey:()FIUIBackupSupport useContainer:;
@end

@implementation NSUserDefaults(FIUIBackupSupport)

+ (uint64_t)fu_backupStandardUserDefaultsKey:()FIUIBackupSupport
{
  return objc_msgSend(a1, "fu_backupStandardUserDefaultsKey:useContainer:", a3, 0);
}

+ (id)fu_npsManager
{
  if (fu_npsManager_onceToken != -1) {
    dispatch_once(&fu_npsManager_onceToken, &__block_literal_global_14);
  }
  v0 = (void *)fu_npsManager_npsManager;
  return v0;
}

+ (void)fu_backupAndSetObject:()FIUIBackupSupport forKey:
{
  v6 = (void *)MEMORY[0x263EFFA40];
  id v9 = a4;
  id v7 = a3;
  v8 = [v6 standardUserDefaults];
  [v8 setObject:v7 forKey:v9];

  objc_msgSend(a1, "fu_backupStandardUserDefaultsKey:", v9);
}

+ (void)fu_backupAndSetInteger:()FIUIBackupSupport forKey:
{
  v6 = (void *)MEMORY[0x263EFFA40];
  id v8 = a4;
  id v7 = [v6 standardUserDefaults];
  [v7 setInteger:a3 forKey:v8];

  objc_msgSend(a1, "fu_backupStandardUserDefaultsKey:", v8);
}

+ (void)fu_backupAndSetFloat:()FIUIBackupSupport forKey:
{
  v6 = (void *)MEMORY[0x263EFFA40];
  id v9 = a4;
  id v7 = [v6 standardUserDefaults];
  *(float *)&double v8 = a2;
  [v7 setFloat:v9 forKey:v8];

  objc_msgSend(a1, "fu_backupStandardUserDefaultsKey:", v9);
}

+ (void)fu_backupAndSetDouble:()FIUIBackupSupport forKey:
{
  v6 = (void *)MEMORY[0x263EFFA40];
  id v8 = a4;
  id v7 = [v6 standardUserDefaults];
  [v7 setDouble:v8 forKey:a2];

  objc_msgSend(a1, "fu_backupStandardUserDefaultsKey:", v8);
}

+ (void)fu_backupAndSetBool:()FIUIBackupSupport forKey:
{
  v6 = (void *)MEMORY[0x263EFFA40];
  id v8 = a4;
  id v7 = [v6 standardUserDefaults];
  [v7 setBool:a3 forKey:v8];

  objc_msgSend(a1, "fu_backupStandardUserDefaultsKey:", v8);
}

+ (void)fu_backupAndSetURL:()FIUIBackupSupport forKey:
{
  v6 = (void *)MEMORY[0x263EFFA40];
  id v9 = a4;
  id v7 = a3;
  id v8 = [v6 standardUserDefaults];
  [v8 setURL:v7 forKey:v9];

  objc_msgSend(a1, "fu_backupStandardUserDefaultsKey:", v9);
}

+ (void)fu_backupStandardUserDefaultsKey:()FIUIBackupSupport useContainer:
{
  _HKInitializeLogging();
  v0 = *MEMORY[0x263F098C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_ERROR)) {
    +[NSUserDefaults(FIUIBackupSupport) fu_backupStandardUserDefaultsKey:useContainer:](v0);
  }
}

+ (uint64_t)fu_synchronizeStandardUserDefaultsKey:()FIUIBackupSupport
{
  return objc_msgSend(a1, "fu_synchronizeStandardUserDefaultsKey:useContainer:", a3, 0);
}

+ (void)fu_synchronizeStandardUserDefaultsKey:()FIUIBackupSupport useContainer:
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  _HKInitializeLogging();
  id v7 = *MEMORY[0x263F098C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v6;
    _os_log_impl(&dword_21E433000, v7, OS_LOG_TYPE_DEFAULT, "Synchronizing default with key: %@", (uint8_t *)&v13, 0xCu);
  }
  id v8 = [MEMORY[0x263F086E0] mainBundle];
  id v9 = [v8 bundleIdentifier];

  v10 = objc_msgSend(a1, "fu_npsManager");
  v11 = [MEMORY[0x263EFFA08] setWithObject:v6];
  if (a4) {
    v12 = v9;
  }
  else {
    v12 = 0;
  }
  [v10 synchronizeUserDefaultsDomain:v9 keys:v11 container:v12];
}

+ (void)fu_backupStandardUserDefaultsKey:()FIUIBackupSupport useContainer:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21E433000, log, OS_LOG_TYPE_ERROR, "NPS user defaults backup only supported on nano", v1, 2u);
}

@end