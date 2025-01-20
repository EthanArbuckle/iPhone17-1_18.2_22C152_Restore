@interface BKSSpringBoardDefaults
- (BKSSpringBoardDefaults)init;
- (void)_bindAndRegisterDefaults;
@end

@implementation BKSSpringBoardDefaults

- (void)_bindAndRegisterDefaults
{
  id v3 = [NSString stringWithUTF8String:"brightness"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:@"SBBacklightLevel2" toDefaultValue:&unk_1ED76CA78 options:1];
}

- (BKSSpringBoardDefaults)init
{
  return (BKSSpringBoardDefaults *)[(BSAbstractDefaultDomain *)self _initWithDomain:@"com.apple.springboard"];
}

@end