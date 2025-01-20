@interface AXSpringBoardAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_takeScreenshotAndEdit:(BOOL)a3;
@end

@implementation AXSpringBoardAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SpringBoard";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_takeScreenshotAndEdit:(BOOL)a3
{
  BOOL v3 = a3;
  if (_AXSVoiceOverTouchEnabled()
    || _AXSAssistiveTouchEnabled()
    || _AXSZoomTouchEnabled())
  {
    v5 = +[_AXSpringBoardServerInstance springBoardServerInstance];
    [v5 springBoardActionOccurred:6];

    uint64_t v7 = MEMORY[0x263EF8330];
    uint64_t v8 = 3221225472;
    v9 = __53__AXSpringBoardAccessibility__takeScreenshotAndEdit___block_invoke;
    v10 = &unk_2647F0B30;
    BOOL v12 = v3;
    v11 = self;
    AXPerformBlockOnMainThreadAfterDelay();
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)AXSpringBoardAccessibility;
    [(AXSpringBoardAccessibility *)&v6 _takeScreenshotAndEdit:v3];
  }
}

uint64_t __53__AXSpringBoardAccessibility__takeScreenshotAndEdit___block_invoke()
{
  return AXPerformBlockOnMainThreadAfterDelay();
}

id __53__AXSpringBoardAccessibility__takeScreenshotAndEdit___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(unsigned __int8 *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)AXSpringBoardAccessibility;
  return objc_msgSendSuper2(&v3, sel__takeScreenshotAndEdit_, v1);
}

void __53__AXSpringBoardAccessibility__takeScreenshotAndEdit___block_invoke_3()
{
  id v0 = +[_AXSpringBoardServerInstance springBoardServerInstance];
  [v0 springBoardActionOccurred:7];
}

@end