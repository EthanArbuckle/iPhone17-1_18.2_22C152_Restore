@interface WKAccessibilityWebPageObjectAccessibility
+ (BOOL)_isSerializableAccessibilityElement;
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (CGRect)accessibilityFrame;
- (WKAccessibilityWebPageObjectAccessibility)init;
- (id)_accessibilityApplication;
- (id)_accessibilityResponderElement;
- (id)_accessibilityTextViewTextOperationResponder;
- (id)_axUnarchivedTokenForData:(id)a3;
- (id)accessibilityContainer;
- (id)accessibilityElements;
- (id)accessibilityHitTest:(CGPoint)a3;
- (id)accessibilityRemoteSubstituteChildren:(id)a3;
- (int)_accessibilityHostPid;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axCachedRootObject;
- (void)_axListenForRemoteElement;
- (void)_axRemoteElementRegistered:(id)a3;
- (void)_axSetCachedRootObject:(id)a3;
- (void)_disableCaching;
- (void)_enableCaching;
- (void)_initializeRemoteElement:(id)a3;
- (void)_initializeRootIfNecessary;
- (void)dealloc;
- (void)setRemoteTokenData:(id)a3;
@end

@implementation WKAccessibilityWebPageObjectAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WKAccessibilityWebPageObject";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WKAccessibilityWebPageObject", @"setRemoteTokenData:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WKAccessibilityWebPageObject", @"_accessibilityCategoryInstalled:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WKAccessibilityWebPageObject", @"remoteTokenData", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WKAccessibilityWebPageObject", @"accessibilityHitTest:", "@", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WKAccessibilityWebPageObjectBase", @"accessibilityRootObjectWrapper", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WKAccessibilityWebPageObjectBase", @"accessibilityFocusedUIElement", "@", 0);
  [v3 validateClass:@"WKAccessibilityWebPageObject" isKindOfClass:@"WKAccessibilityWebPageObjectBase"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"enableAttributeCaching", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebAccessibilityObjectWrapper", @"disableAttributeCaching", "v", 0);
}

- (WKAccessibilityWebPageObjectAccessibility)init
{
  v4.receiver = self;
  v4.super_class = (Class)WKAccessibilityWebPageObjectAccessibility;
  v2 = [(WKAccessibilityWebPageObjectAccessibility *)&v4 init];
  [(WKAccessibilityWebPageObjectAccessibility *)v2 _accessibilityLoadAccessibilityInformation];

  return v2;
}

+ (BOOL)_isSerializableAccessibilityElement
{
  return 1;
}

- (void)dealloc
{
  id v3 = [(WKAccessibilityWebPageObjectAccessibility *)self _accessibilityValueForKey:@"axRemoteElement"];
  objc_super v4 = [v3 remoteChildrenDelegate];

  if (v4 == self)
  {
    [v3 setRemoteChildrenDelegate:0];
    [v3 unregister];
  }
  [(WKAccessibilityWebPageObjectAccessibility *)self _accessibilityUnregister];

  v5.receiver = self;
  v5.super_class = (Class)WKAccessibilityWebPageObjectAccessibility;
  [(WKAccessibilityWebPageObjectAccessibility *)&v5 dealloc];
}

- (void)_initializeRemoteElement:(id)a3
{
}

- (int)_accessibilityHostPid
{
  v2 = [(WKAccessibilityWebPageObjectAccessibility *)self _accessibilityValueForKey:@"axRemoteElement"];
  if ((int)[v2 remotePid] < 1) {
    int v3 = 0;
  }
  else {
    int v3 = [v2 remotePid];
  }

  return v3;
}

- (id)_accessibilityApplication
{
  v2 = [(WKAccessibilityWebPageObjectAccessibility *)self _accessibilityValueForKey:@"axRemoteElement"];
  if ((int)[v2 remotePid] < 1)
  {
    AppElementWithPid = 0;
  }
  else
  {
    [v2 remotePid];
    AppElementWithPid = (void *)_AXUIElementCreateAppElementWithPid();
  }

  return AppElementWithPid;
}

- (id)accessibilityHitTest:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(WKAccessibilityWebPageObjectAccessibility *)self _initializeRootIfNecessary];
  v8.receiver = self;
  v8.super_class = (Class)WKAccessibilityWebPageObjectAccessibility;
  v6 = -[WKAccessibilityWebPageObjectAccessibility accessibilityHitTest:](&v8, sel_accessibilityHitTest_, x, y);

  return v6;
}

- (void)_enableCaching
{
  v2 = [(WKAccessibilityWebPageObjectAccessibility *)self accessibilityElements];
  id v4 = [v2 firstObject];

  if (objc_opt_respondsToSelector()) {
    id v3 = (id)[v4 safeValueForKey:@"enableAttributeCaching"];
  }
}

- (void)_disableCaching
{
  v2 = [(WKAccessibilityWebPageObjectAccessibility *)self accessibilityElements];
  id v4 = [v2 firstObject];

  if (objc_opt_respondsToSelector()) {
    id v3 = (id)[v4 safeValueForKey:@"disableAttributeCaching"];
  }
}

- (id)_accessibilityResponderElement
{
  [(WKAccessibilityWebPageObjectAccessibility *)self _initializeRootIfNecessary];
  id v3 = [(WKAccessibilityWebPageObjectAccessibility *)self safeValueForKey:@"accessibilityFocusedUIElement"];
  id v4 = [v3 _accessibilityFindDescendant:&__block_literal_global_0];

  return v4;
}

uint64_t __75__WKAccessibilityWebPageObjectAccessibility__accessibilityResponderElement__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isAccessibilityElement];
}

- (id)_accessibilityTextViewTextOperationResponder
{
  v2 = [(WKAccessibilityWebPageObjectAccessibility *)self accessibilityContainer];
  id v3 = __UIAccessibilitySafeClass();

  [v3 setOnClientSide:1];
  id v4 = (void *)_AXCreateAXUIElementWithElement();
  [v3 setOnClientSide:0];

  return v4;
}

- (void)_axCachedRootObject
{
  v2 = [(WKAccessibilityWebPageObjectAccessibility *)self _accessibilityValueForKey:@"AXRootObjectCache"];
  id v3 = (void *)[v2 pointerValue];

  return v3;
}

- (void)_axSetCachedRootObject:(id)a3
{
  id v4 = [MEMORY[0x263F08D40] valueWithPointer:a3];
  [(WKAccessibilityWebPageObjectAccessibility *)self _accessibilitySetRetainedValue:v4 forKey:@"AXRootObjectCache"];
}

- (void)_initializeRootIfNecessary
{
  id v7 = [(WKAccessibilityWebPageObjectAccessibility *)self safeValueForKey:@"accessibilityRootObjectWrapper"];
  uint64_t v3 = [v7 accessibilityContainer];
  if (v3)
  {
    id v4 = (void *)v3;
    id v5 = [(WKAccessibilityWebPageObjectAccessibility *)self _axCachedRootObject];

    v6 = v7;
    if (v7 && v7 != v5) {
      goto LABEL_4;
    }
  }
  else
  {
    v6 = v7;
    if (v7)
    {
LABEL_4:
      [v7 setAccessibilityContainer:self];
      [(WKAccessibilityWebPageObjectAccessibility *)self _axSetCachedRootObject:v7];
      v6 = v7;
    }
  }
}

- (id)accessibilityElements
{
  v6[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(WKAccessibilityWebPageObjectAccessibility *)self safeValueForKey:@"accessibilityRootObjectWrapper"];
  [(WKAccessibilityWebPageObjectAccessibility *)self _initializeRootIfNecessary];
  if (v3)
  {
    v6[0] = v3;
    id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)accessibilityRemoteSubstituteChildren:(id)a3
{
  v5[1] = *MEMORY[0x263EF8340];
  v5[0] = self;
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return v3;
}

- (void)_axRemoteElementRegistered:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  v6 = [v5 objectForKey:@"element"];

  if (!v6) {
    _AXAssert();
  }
  id v7 = [(WKAccessibilityWebPageObjectAccessibility *)self safeValueForKey:@"remoteTokenData"];
  objc_super v8 = __UIAccessibilitySafeClass();

  v9 = [(WKAccessibilityWebPageObjectAccessibility *)self _axUnarchivedTokenForData:v8];
  v10 = [v6 uuid];
  v11 = [v9 objectForKey:@"ax-uuid"];
  int v12 = [v10 isEqual:v11];

  if (v12)
  {
    v13 = [(WKAccessibilityWebPageObjectAccessibility *)self _accessibilityValueForKey:@"axRemoteElement"];
    v14 = v13;
    if (v13 != v6)
    {
      [v13 setRemoteChildrenDelegate:0];
      [v14 unregister];
      [v6 setRemoteChildrenDelegate:self];
      [(WKAccessibilityWebPageObjectAccessibility *)self _accessibilitySetRetainedValue:v6 forKey:@"axRemoteElement"];
    }
  }
}

- (id)accessibilityContainer
{
  return (id)[(WKAccessibilityWebPageObjectAccessibility *)self _accessibilityValueForKey:@"axRemoteElement"];
}

- (void)_axListenForRemoteElement
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__axRemoteElementRegistered_ name:@"ax_remote_element_registered" object:0];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)WKAccessibilityWebPageObjectAccessibility;
  [(WKAccessibilityWebPageObjectAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  _AXAddToElementCache();
  [(WKAccessibilityWebPageObjectAccessibility *)self _axListenForRemoteElement];
  id v3 = [(WKAccessibilityWebPageObjectAccessibility *)self remoteTokenData];
  if (v3)
  {
    id v4 = [(WKAccessibilityWebPageObjectAccessibility *)self _axUnarchivedTokenForData:v3];
    [(WKAccessibilityWebPageObjectAccessibility *)self _initializeRemoteElement:v4];
  }
}

- (void)setRemoteTokenData:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WKAccessibilityWebPageObjectAccessibility;
  id v4 = a3;
  [(WKAccessibilityWebPageObjectAccessibility *)&v6 setRemoteTokenData:v4];
  objc_super v5 = -[WKAccessibilityWebPageObjectAccessibility _axUnarchivedTokenForData:](self, "_axUnarchivedTokenForData:", v4, v6.receiver, v6.super_class);

  [(WKAccessibilityWebPageObjectAccessibility *)self _initializeRemoteElement:v5];
}

- (CGRect)accessibilityFrame
{
  v2 = [(WKAccessibilityWebPageObjectAccessibility *)self safeValueForKey:@"accessibilityRootObjectWrapper"];
  [v2 accessibilityFrame];
  double v4 = v3;
  double v6 = v5;
  double v7 = *MEMORY[0x263F00148];
  double v8 = *(double *)(MEMORY[0x263F00148] + 8);

  double v9 = v7;
  double v10 = v8;
  double v11 = v4;
  double v12 = v6;
  result.size.height = v12;
  result.size.width = v11;
  result.origin.double y = v10;
  result.origin.double x = v9;
  return result;
}

- (id)_axUnarchivedTokenForData:(id)a3
{
  id v3 = a3;
  double v4 = (void *)MEMORY[0x263F08928];
  double v5 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  double v8 = objc_msgSend(v5, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  id v13 = 0;
  double v9 = [v4 unarchivedObjectOfClasses:v8 fromData:v3 error:&v13];
  id v10 = v13;

  if (v10)
  {
    double v11 = AXLogAppAccessibility();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      [(WKAccessibilityWebPageObjectAccessibility *)(uint64_t)v10 _axUnarchivedTokenForData:v11];
    }
  }

  return v9;
}

- (void)_axUnarchivedTokenForData:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_2404CB000, log, OS_LOG_TYPE_ERROR, "Problem with unarchiving remote token data: %@ %@", (uint8_t *)&v3, 0x16u);
}

@end