@interface WKContentViewAccessibility
@end

@implementation WKContentViewAccessibility

void __91__WKContentViewAccessibility__MessageUI__WebKit__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  if (*MEMORY[0x263F812B8] == a2)
  {
    v4 = (id *)(a1 + 32);
    id v5 = a4;
    id WeakRetained = objc_loadWeakRetained(v4);
    v7 = _axuiElementForNotificationData();
    int v8 = [v7 isEqual:v5];

    if (v8)
    {
      id v9 = objc_loadWeakRetained(v4);
      v10 = [NSNumber numberWithDouble:CFAbsoluteTimeGetCurrent()];
      [v9 _axSetFirstResponderStartRepost:v10];

      id v11 = objc_loadWeakRetained(v4);
      [v11 _axRepostFirstResponderWhenReady];
    }
  }
}

uint64_t __81__WKContentViewAccessibility__MessageUI__WebKit__axRepostFirstResponderWhenReady__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _axRepostFirstResponderWhenReady];
}

@end