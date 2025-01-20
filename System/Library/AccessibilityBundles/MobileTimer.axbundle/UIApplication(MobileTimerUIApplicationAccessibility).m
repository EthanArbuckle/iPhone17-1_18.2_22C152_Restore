@interface UIApplication(MobileTimerUIApplicationAccessibility)
+ (void)_accessibilityPerformValidations:()MobileTimerUIApplicationAccessibility;
- (BOOL)accessibilityPerformMagicTap;
- (id)accessibilityLabel;
@end

@implementation UIApplication(MobileTimerUIApplicationAccessibility)

+ (void)_accessibilityPerformValidations:()MobileTimerUIApplicationAccessibility
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTATimerViewController", @"timerManager", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTTimer", @"state", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MobileTimerTabBarController", @"stopwatchViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MobileTimerTabBarController", @"timerViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTTimerManager", @"getCurrentTimerSync", "@", 0);
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"app.name");
}

- (BOOL)accessibilityPerformMagicTap
{
  v26[1] = *MEMORY[0x263EF8340];
  objc_opt_class();
  v2 = [a1 safeValueForKey:@"_tabBarController"];
  id v3 = __UIAccessibilityCastAsClass();

  v4 = [v3 selectedViewController];
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  v5 = [v3 safeValueForKey:@"stopwatchViewController"];
  v6 = [v3 safeValueForKey:@"timerViewController"];
  if (v4)
  {
    v26[0] = v4;
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:1];
    v8 = (void *)[v7 mutableCopy];
  }
  else
  {
    v8 = 0;
  }
  while ([v8 count])
  {
    uint64_t v9 = [v8 firstObject];
    v10 = (void *)v9;
    if ((void *)v9 == v5)
    {
      MEMORY[0x245657200](@"MTAStopwatchViewController");
      id v12 = v5;
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_15;
      }
      v13 = [v5 safeValueForKey:@"_mode"];
      int v14 = [v13 intValue];

      if (v14 == 1)
      {
        v15 = v20;
        v20[0] = MEMORY[0x263EF8330];
        v20[1] = 3221225472;
        v20[2] = __84__UIApplication_MobileTimerUIApplicationAccessibility__accessibilityPerformMagicTap__block_invoke_2;
        v20[3] = &unk_265139F80;
        id v12 = v5;
        v20[4] = v12;
        v20[5] = &v22;
        AXPerformSafeBlock();
      }
      else
      {
        if (v14 != 3)
        {
          id v12 = v5;
          if (v14 == 2)
          {
            v15 = v21;
            v21[0] = MEMORY[0x263EF8330];
            v21[1] = 3221225472;
            v21[2] = __84__UIApplication_MobileTimerUIApplicationAccessibility__accessibilityPerformMagicTap__block_invoke;
            v21[3] = &unk_265139F80;
            id v12 = v5;
            v21[4] = v12;
            v21[5] = &v22;
            AXPerformSafeBlock();
            goto LABEL_14;
          }
LABEL_15:

          break;
        }
        v15 = v19;
        v19[0] = MEMORY[0x263EF8330];
        v19[1] = 3221225472;
        v19[2] = __84__UIApplication_MobileTimerUIApplicationAccessibility__accessibilityPerformMagicTap__block_invoke_3;
        v19[3] = &unk_265139F80;
        id v12 = v5;
        v19[4] = v12;
        v19[5] = &v22;
        AXPerformSafeBlock();
      }
LABEL_14:

      goto LABEL_15;
    }
    if ((void *)v9 == v6)
    {
      v15 = v18;
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __84__UIApplication_MobileTimerUIApplicationAccessibility__accessibilityPerformMagicTap__block_invoke_4;
      v18[3] = &unk_265139F80;
      id v12 = v6;
      v18[4] = v12;
      v18[5] = &v22;
      AXPerformSafeBlock();
      goto LABEL_14;
    }
    [v8 removeObject:v9];
    v11 = [v10 childViewControllers];
    [v8 addObjectsFromArray:v11];
  }
  BOOL v16 = *((unsigned char *)v23 + 24) != 0;

  _Block_object_dispose(&v22, 8);
  return v16;
}

@end