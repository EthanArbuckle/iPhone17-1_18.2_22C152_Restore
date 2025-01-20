@interface NSUserDefaults
@end

@implementation NSUserDefaults

void __58__NSUserDefaults_MobileSafariExtras__safari_sfAppDefaults__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1CB18]);
  _SFSFAppContainerURL();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 _initWithSuiteName:@"com.apple.sfapp" container:v3];
  v2 = (void *)safari_sfAppDefaults_sfAppDefaults;
  safari_sfAppDefaults_sfAppDefaults = v1;
}

@end