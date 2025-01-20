@interface APSInstallLogLevelListeners
@end

@implementation APSInstallLogLevelListeners

void ___APSInstallLogLevelListeners_block_invoke()
{
  sAPSAlertsEnabled = 0;
  CFPreferencesSynchronize(@"com.apple.apsalerts", @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3E0]);
  _APSLoadPreferences();
}

@end