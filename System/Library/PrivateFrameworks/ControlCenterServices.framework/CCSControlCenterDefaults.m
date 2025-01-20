@interface CCSControlCenterDefaults
+ (id)standardDefaults;
- (CCSControlCenterDefaults)init;
- (unint64_t)_defaultPresentationGesture;
- (void)_bindAndRegisterDefaults;
@end

@implementation CCSControlCenterDefaults

+ (id)standardDefaults
{
  if (standardDefaults___once != -1) {
    dispatch_once(&standardDefaults___once, &__block_literal_global_0);
  }
  v2 = (void *)standardDefaults___instance;

  return v2;
}

uint64_t __44__CCSControlCenterDefaults_standardDefaults__block_invoke()
{
  standardDefaults___instance = objc_alloc_init(CCSControlCenterDefaults);

  return MEMORY[0x270F9A758]();
}

- (CCSControlCenterDefaults)init
{
  return (CCSControlCenterDefaults *)[(BSAbstractDefaultDomain *)self _initWithDomain:@"com.apple.springboard"];
}

- (void)_bindAndRegisterDefaults
{
  v3 = [NSString stringWithUTF8String:"presentationGesture"];
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CCSControlCenterDefaults _defaultPresentationGesture](self, "_defaultPresentationGesture"));
  [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:@"CCSPresentationGesture" toDefaultValue:v4 options:4];

  v5 = [NSString stringWithUTF8String:"userInvocationCount"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v5 withDefaultKey:@"CCUIUserInvocationCount" toDefaultValue:&unk_26D39B690 options:1];

  v6 = [NSString stringWithUTF8String:"shouldEnablePrototypeFeatures"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v6 withDefaultKey:@"SBEnableControlCenterPrototypeFeatures" toDefaultValue:MEMORY[0x263EFFA80] options:1];

  id v7 = [NSString stringWithUTF8String:"shouldEnableInternalModules"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v7 withDefaultKey:@"CCUIEnableInternalControlCenterModules" toDefaultValue:MEMORY[0x263EFFA88] options:1];
}

- (unint64_t)_defaultPresentationGesture
{
  v2 = [MEMORY[0x263F29CA0] sharedInstance];
  unint64_t v3 = [v2 homeButtonType] == 2 || objc_msgSend(v2, "deviceClass") == 2;

  return v3;
}

@end