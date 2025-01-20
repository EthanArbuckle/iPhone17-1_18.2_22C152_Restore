@interface CCUIControlCenterDefaults
+ (id)standardDefaults;
- (CCUIControlCenterDefaults)init;
- (void)_bindAndRegisterDefaults;
@end

@implementation CCUIControlCenterDefaults

+ (id)standardDefaults
{
  if (standardDefaults___once != -1) {
    dispatch_once(&standardDefaults___once, &__block_literal_global_11);
  }
  v2 = (void *)standardDefaults___instance;

  return v2;
}

uint64_t __45__CCUIControlCenterDefaults_standardDefaults__block_invoke()
{
  standardDefaults___instance = objc_alloc_init(CCUIControlCenterDefaults);

  return MEMORY[0x1F41817F8]();
}

- (CCUIControlCenterDefaults)init
{
  return (CCUIControlCenterDefaults *)[(BSAbstractDefaultDomain *)self _initWithDomain:@"com.apple.springboard"];
}

- (void)_bindAndRegisterDefaults
{
  v3 = [NSString stringWithUTF8String:"shouldAlwaysBeEnabled"];
  uint64_t v4 = MEMORY[0x1E4F1CC28];
  [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:@"SBControlCenterShouldAlwaysBeEnabled" toDefaultValue:MEMORY[0x1E4F1CC28] options:1];

  v5 = [NSString stringWithUTF8String:"shouldExcludeControlCenterFromStatusBarOverrides"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v5 withDefaultKey:@"SBExcludeControlCenterFromStatusBarOverrides" toDefaultValue:v4 options:4];

  v6 = [NSString stringWithUTF8String:"hasForceTouchedToExpandModule"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v6 withDefaultKey:@"CCUIHasForceTouchedToExpandControlCenterModule" toDefaultValue:v4 options:1];

  id v7 = [NSString stringWithUTF8String:"hasLongPressedToExpandModule"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v7 withDefaultKey:@"CCUIHasLongPressedToExpandControlCenterModule" toDefaultValue:v4 options:1];
}

@end