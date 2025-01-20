@interface AXSB_SBSceneManagerSafeCategory
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)userInterfaceStyleProvider:(id)a3 didUpdateStyle:(int64_t)a4 preferredAnimationSettings:(id)a5 completion:(id)a6;
@end

@implementation AXSB_SBSceneManagerSafeCategory

+ (id)safeCategoryTargetClassName
{
  return @"SBSceneManager";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SBSceneManager" conformsToProtocol:@"SBUserInterfaceStyleObserver"];
  [v3 validateProtocol:@"SBUserInterfaceStyleObserver" hasRequiredInstanceMethod:@"userInterfaceStyleProvider:didUpdateStyle:preferredAnimationSettings:completion:"];
}

- (void)userInterfaceStyleProvider:(id)a3 didUpdateStyle:(int64_t)a4 preferredAnimationSettings:(id)a5 completion:(id)a6
{
  v13[1] = *MEMORY[0x263EF8340];
  v11.receiver = self;
  v11.super_class = (Class)AXSB_SBSceneManagerSafeCategory;
  [(AXSB_SBSceneManagerSafeCategory *)&v11 userInterfaceStyleProvider:a3 didUpdateStyle:a4 preferredAnimationSettings:a5 completion:a6];
  v6 = +[AXSpringBoardServerHelper sharedServerHelper];
  if ([v6 _isDarkModeActive]) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 1;
  }

  v8 = +[_AXSpringBoardServerInstance springBoardServerInstance];
  uint64_t v12 = *MEMORY[0x263F226F8];
  v9 = [NSNumber numberWithInteger:v7];
  v13[0] = v9;
  v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
  [v8 springBoardActionOccurred:13 withPayload:v10];
}

@end