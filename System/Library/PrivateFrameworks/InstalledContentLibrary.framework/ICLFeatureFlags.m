@interface ICLFeatureFlags
+ (BOOL)appReferencesEnabled;
+ (BOOL)fullFidelityIconsEnabled;
+ (BOOL)isRestackingEnabled;
+ (BOOL)systemAppDeletionEnabled;
+ (BOOL)transientBundleCleanupEnabled;
+ (BOOL)twoStageAppInstallEnabled;
@end

@implementation ICLFeatureFlags

+ (BOOL)isRestackingEnabled
{
  return 1;
}

+ (BOOL)appReferencesEnabled
{
  return MEMORY[0x1F40C9FB0]("InstalledContentLibrary", "MI_App_References");
}

+ (BOOL)systemAppDeletionEnabled
{
  return 1;
}

+ (BOOL)transientBundleCleanupEnabled
{
  return MEMORY[0x1F40C9FB0]("InstalledContentLibrary", "MI_Transient_Bundle_Cleanup");
}

+ (BOOL)fullFidelityIconsEnabled
{
  return MEMORY[0x1F40C9FB0]("InstalledContentLibrary", "MI_Full_Fidelity_Icons");
}

+ (BOOL)twoStageAppInstallEnabled
{
  return MEMORY[0x1F40C9FB0]("InstalledContentLibrary", "MI_Two_Stage_App_Install");
}

@end