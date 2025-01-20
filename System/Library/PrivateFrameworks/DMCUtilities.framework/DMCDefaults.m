@interface DMCDefaults
+ (BOOL)ADETestModeEnabled;
+ (BOOL)BOOLForDefaultsKey:(id)a3;
+ (BOOL)DSLiveOnModeEnabled;
+ (BOOL)ESSOTestModeEnabled;
+ (id)dictForDefaultsKey:(id)a3;
+ (id)numberForDefaultsKey:(id)a3;
+ (id)objectForDefaultsKey:(id)a3;
+ (id)stringForDefaultsKey:(id)a3;
@end

@implementation DMCDefaults

+ (id)stringForDefaultsKey:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CB18];
  id v4 = a3;
  v5 = [v3 standardUserDefaults];
  v6 = [v5 stringForKey:v4];

  return v6;
}

+ (id)numberForDefaultsKey:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v5 = [v4 objectForKey:v3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v7 = [v6 objectForKey:v3];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)dictForDefaultsKey:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v5 = [v4 objectForKey:v3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v7 = [v6 objectForKey:v3];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)BOOLForDefaultsKey:(id)a3
{
  id v3 = [a1 numberForDefaultsKey:a3];
  char v4 = [v3 BOOLValue];

  return v4;
}

+ (id)objectForDefaultsKey:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CB18];
  id v4 = a3;
  v5 = [v3 standardUserDefaults];
  v6 = [v5 objectForKey:v4];

  return v6;
}

+ (BOOL)ESSOTestModeEnabled
{
  return [a1 BOOLForDefaultsKey:@"DMCESSOTestModeEnabled"];
}

+ (BOOL)DSLiveOnModeEnabled
{
  return [a1 BOOLForDefaultsKey:@"DMCDataSeparationLiveOnModeEnabled"];
}

+ (BOOL)ADETestModeEnabled
{
  return [a1 BOOLForDefaultsKey:@"DMCADETestModeEnabled"];
}

@end