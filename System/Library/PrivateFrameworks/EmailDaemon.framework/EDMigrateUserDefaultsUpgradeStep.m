@interface EDMigrateUserDefaultsUpgradeStep
+ (BOOL)run;
+ (id)propertiesToMigrate;
@end

@implementation EDMigrateUserDefaultsUpgradeStep

+ (BOOL)run
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = objc_msgSend(a1, "propertiesToMigrate", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(MEMORY[0x1E4F1CB18], "em_migrateDefault:", *(void *)(*((void *)&v7 + 1) + 8 * v5++));
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }

  return 1;
}

+ (id)propertiesToMigrate
{
  v7[6] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F60140];
  v7[0] = *MEMORY[0x1E4F600D8];
  v7[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F60148];
  v7[2] = *MEMORY[0x1E4F60100];
  v7[3] = v3;
  uint64_t v4 = *MEMORY[0x1E4F60170];
  v7[4] = *MEMORY[0x1E4F60158];
  v7[5] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:6];

  return v5;
}

@end