@interface SUScriptNotificationObserverAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (SUScriptNotificationObserverAccessibility)init;
- (void)_axActionOccurredForWeb:(id)a3;
- (void)dealloc;
@end

@implementation SUScriptNotificationObserverAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUScriptNotificationObserver";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (SUScriptNotificationObserverAccessibility)init
{
  v5.receiver = self;
  v5.super_class = (Class)SUScriptNotificationObserverAccessibility;
  v2 = [(SUScriptNotificationObserverAccessibility *)&v5 init];
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:v2 selector:sel__axActionOccurredForWeb_ name:@"AXActionForWebNotification" object:0];

  return v2;
}

- (void)_axActionOccurredForWeb:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  AXPerformBlockOnMainThreadAfterDelay();
}

void __69__SUScriptNotificationObserverAccessibility__axActionOccurredForWeb___block_invoke(uint64_t a1)
{
  id v10 = [*(id *)(a1 + 32) userInfo];
  v2 = [v10 objectForKey:@"key"];
  int v3 = [v2 isEqualToString:@"scroll"];

  if (v3)
  {
    id v4 = [v10 objectForKey:@"direction"];
    uint64_t v5 = (int)[v4 intValue];

    if ((unint64_t)(v5 - 1) >= 6) {
      goto LABEL_7;
    }
    v6 = off_26516B1E0[v5 - 1];
  }
  else
  {
    v7 = [v10 objectForKey:@"key"];
    int v8 = [v7 isEqualToString:@"escape"];

    if ((v8 & 1) == 0) {
      goto LABEL_7;
    }
    v6 = @"_accessibilityPerformEscape";
  }
  id v9 = (id)[*(id *)(a1 + 40) safeValueForKey:v6];
LABEL_7:
}

- (void)dealloc
{
  int v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:@"AXActionForWebNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)SUScriptNotificationObserverAccessibility;
  [(SUScriptNotificationObserverAccessibility *)&v4 dealloc];
}

@end