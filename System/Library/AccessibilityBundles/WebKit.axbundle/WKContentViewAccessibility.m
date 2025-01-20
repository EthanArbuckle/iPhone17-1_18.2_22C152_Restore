@interface WKContentViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityBeginUndoableTextInsertion;
- (BOOL)_accessibilityEndUndoableTextInsertion;
- (BOOL)_accessibilityHandlesRemoteFocusMovement;
- (BOOL)_accessibilityIsScrollAncestor;
- (BOOL)_accessibilityServesAsFirstResponder;
- (BOOL)accessibilityParentDiscardsChildrenContainerGroupingBehavior;
- (BOOL)canBecomeFocused;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (CGRect)accessibilityFrame;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)_accessibilityResponderElement;
- (id)_systemDefaultFocusGroupIdentifier;
- (id)_viewToAddFocusLayer;
- (id)accessibilityDragSourceDescriptors;
- (id)accessibilityElements;
- (int)_accessibilityRemotePid;
- (int64_t)accessibilityContainerType;
- (unint64_t)_accessibilityAutomationType;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityIncreaseSelection:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilityRegisterUIProcessTokens;
- (void)_accessibilityShare;
- (void)_axCleanupAfterTermination;
- (void)_axClearRemoteElements;
- (void)_didRelaunchProcess;
- (void)_hideKeyboard;
- (void)_pasteboardChanged:(id)a3;
- (void)_processDidExit;
- (void)_registerForNotificationsIfNecessary;
- (void)_setAccessibilityWebProcessToken:(id)a3;
- (void)_zoomToRevealFocusedElement;
- (void)accessibilityRelayNotification:(id)a3 notificationData:(id)a4;
- (void)copy:(id)a3;
- (void)cut:(id)a3;
- (void)dealloc;
- (void)decreaseSizeForWebView:(id)a3;
- (void)handleKeyEntry:(id)a3 withCompletionHandler:(id)a4;
- (void)handleKeyWebEvent:(id)a3 withCompletionHandler:(id)a4;
- (void)increaseSizeForWebView:(id)a3;
- (void)paste:(id)a3;
- (void)selectAll:(id)a3;
- (void)toggleBoldface:(id)a3;
- (void)toggleItalics:(id)a3;
- (void)toggleUnderline:(id)a3;
@end

@implementation WKContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WKContentView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"WebEvent" hasInstanceVariable:@"_characters" withType:"NSString"];
  [v3 validateClass:@"WebEvent" hasInstanceVariable:@"_charactersIgnoringModifiers" withType:"NSString"];
  [v3 validateClass:@"WebEvent" hasInstanceVariable:@"_modifierFlags" withType:"I"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WKContentView", @"webView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WKContentView", @"_setAccessibilityWebProcessToken:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WKContentView", @"_accessibilityRegisterUIProcessTokens", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WKContentView", @"_processDidExit", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WKContentView", @"_didRelaunchProcess", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WKContentView", @"_selectionChanged", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WKContentView", @"_updateChangedSelection", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WKContentView", @"_requiresKeyboardWhenFirstResponder", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WKContentView", @"_zoomToRevealFocusedElement", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WKContentView", @"_hideKeyboard", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WKContentView", @"shareForWebView:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WKContentView", @"handleKeyWebEvent:withCompletionHandler:", "v", "@", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WKContentView", @"copy:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WKContentView", @"paste:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WKContentView", @"selectAll:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WKContentView", @"toggleBoldface:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WKContentView", @"toggleItalics:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WKContentView", @"increaseSizeForWebView:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WKContentView", @"decreaseSizeForWebView:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WKContentView", @"toggleUnderline:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIResponder", @"_handleKeyUIEvent:", "v", "@", 0);
  [v3 validateClass:@"WKContentView" isKindOfClass:@"UIView"];
  [v3 validateClass:@"WKContentView" isKindOfClass:@"UIResponder"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WKContentView", @"canBecomeFocused", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIView", @"_systemDefaultFocusGroupIdentifier", "@", 0);
  [v3 validateClass:@"WKWebView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WKWebView", @"URL", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WKContentView", @"handleKeyEntry:withCompletionHandler:", "v", "@", "@?", 0);
}

- (unint64_t)_accessibilityAutomationType
{
  return 58;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)WKContentViewAccessibility;
  [(WKContentViewAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(WKContentViewAccessibility *)self _registerForNotificationsIfNecessary];
  [(WKContentViewAccessibility *)self _signalAccessibilityPageLoadCompleteForCatalyst];
  [(WKContentViewAccessibility *)self _accessibilitySetBoolValue:1 forKey:@"postedWebPageLoadedNotification"];
}

- (void)_registerForNotificationsIfNecessary
{
  if (([(WKContentViewAccessibility *)self _accessibilityBoolValueForKey:@"registerdForPBNotifications"] & 1) == 0)
  {
    objc_super v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:self selector:sel__pasteboardChanged_ name:*MEMORY[0x263F1D500] object:0];

    [(WKContentViewAccessibility *)self _accessibilitySetBoolValue:1 forKey:@"registerdForPBNotifications"];
  }
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  if (-[WKContentViewAccessibility pointInside:withEvent:](self, "pointInside:withEvent:", a4, a3.x, a3.y))
  {
    v5 = [(WKContentViewAccessibility *)self accessibilityElements];
    v6 = [v5 firstObject];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_axClearRemoteElements
{
  [(WKContentViewAccessibility *)self _accessibilityRemoveValueForKey:@"RemoteElements"];
  [MEMORY[0x263F811D0] postNotification:1001 withData:*MEMORY[0x263F21A08]];

  [(WKContentViewAccessibility *)self _accessibilitySetBoolValue:0 forKey:@"postedWebPageLoadedNotification"];
}

- (void)_accessibilityRegisterUIProcessTokens
{
  [(WKContentViewAccessibility *)self _axClearRemoteElements];
  v3.receiver = self;
  v3.super_class = (Class)WKContentViewAccessibility;
  [(WKContentViewAccessibility *)&v3 _accessibilityRegisterUIProcessTokens];
}

- (void)_axCleanupAfterTermination
{
  objc_super v3 = AXLogAppAccessibility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2404BB000, v3, OS_LOG_TYPE_INFO, "Process relaunched, clearing elements", v4, 2u);
  }

  objc_setAssociatedObject(self, (const void *)[@"ax-pid" hash], 0, 0);
  objc_setAssociatedObject(self, (const void *)[@"ax-uuid" hash], 0, 0);
  [(WKContentViewAccessibility *)self _axClearRemoteElements];
}

- (void)_didRelaunchProcess
{
  v3.receiver = self;
  v3.super_class = (Class)WKContentViewAccessibility;
  [(WKContentViewAccessibility *)&v3 _didRelaunchProcess];
  [(WKContentViewAccessibility *)self _axCleanupAfterTermination];
}

- (void)_processDidExit
{
  v3.receiver = self;
  v3.super_class = (Class)WKContentViewAccessibility;
  [(WKContentViewAccessibility *)&v3 _processDidExit];
  [(WKContentViewAccessibility *)self _axCleanupAfterTermination];
}

- (void)_setAccessibilityWebProcessToken:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WKContentViewAccessibility;
  [(WKContentViewAccessibility *)&v5 _setAccessibilityWebProcessToken:a3];
  char v4 = [(WKContentViewAccessibility *)self _accessibilityBoolValueForKey:@"postedWebPageLoadedNotification"];
  [(WKContentViewAccessibility *)self _axClearRemoteElements];
  if ((v4 & 1) == 0)
  {
    [(WKContentViewAccessibility *)self _signalAccessibilityPageLoadCompleteForCatalyst];
    [(WKContentViewAccessibility *)self _accessibilitySetBoolValue:1 forKey:@"postedWebPageLoadedNotification"];
  }
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF18];
}

- (BOOL)_accessibilityServesAsFirstResponder
{
  return 1;
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (BOOL)accessibilityParentDiscardsChildrenContainerGroupingBehavior
{
  v2 = [(WKContentViewAccessibility *)self safeValueForKey:@"webView"];
  objc_super v3 = [v2 storedAccessibilityContainerType];
  if (v3)
  {
    char v4 = [v2 storedAccessibilityContainerType];
    BOOL v5 = [v4 integerValue] == 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)handleKeyWebEvent:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __70__WKContentViewAccessibility_handleKeyWebEvent_withCompletionHandler___block_invoke;
  v9[3] = &unk_2650B9500;
  id v10 = v6;
  v8.receiver = self;
  v8.super_class = (Class)WKContentViewAccessibility;
  id v7 = v6;
  [(WKContentViewAccessibility *)&v8 handleKeyWebEvent:a3 withCompletionHandler:v9];
}

uint64_t __70__WKContentViewAccessibility_handleKeyWebEvent_withCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  v20 = v5;
  if (v6) {
    (*(void (**)(uint64_t, id, uint64_t))(v6 + 16))(v6, v5, a3);
  }
  if (a3 && _AXSAutomationEnabled())
  {
    uint64_t v7 = [v20 safeValueForKey:@"_characters"];
    objc_super v8 = (void *)v7;
    if (v7) {
      v9 = (__CFString *)v7;
    }
    else {
      v9 = &stru_26F494210;
    }
    id v10 = v9;

    uint64_t v11 = [v20 safeValueForKey:@"_charactersIgnoringModifiers"];
    v12 = (void *)v11;
    if (v11) {
      v13 = (__CFString *)v11;
    }
    else {
      v13 = &stru_26F494210;
    }
    v14 = v13;

    uint64_t v15 = [v20 safeValueForKey:@"_modifierFlags"];
    v16 = (void *)v15;
    v17 = &unk_26F4952B0;
    if (v15) {
      v17 = (void *)v15;
    }
    id v18 = v17;

    AXUIAutomationHandleKeyComplete();
  }

  return MEMORY[0x270F9A758]();
}

- (void)handleKeyEntry:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __67__WKContentViewAccessibility_handleKeyEntry_withCompletionHandler___block_invoke;
  v9[3] = &unk_2650B9528;
  id v10 = v6;
  v8.receiver = self;
  v8.super_class = (Class)WKContentViewAccessibility;
  id v7 = v6;
  [(WKContentViewAccessibility *)&v8 handleKeyEntry:a3 withCompletionHandler:v9];
}

uint64_t __67__WKContentViewAccessibility_handleKeyEntry_withCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  v12 = v5;
  if (v6) {
    (*(void (**)(uint64_t, id, uint64_t))(v6 + 16))(v6, v5, a3);
  }
  if (a3 && _AXSAutomationEnabled())
  {
    id v7 = [v12 key];
    objc_super v8 = [v7 characters];
    v9 = [v7 charactersIgnoringModifiers];
    id v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "modifierFlags"));
    AXUIAutomationHandleKeyComplete();
  }

  return MEMORY[0x270F9A758]();
}

- (void)_pasteboardChanged:(id)a3
{
}

uint64_t __49__WKContentViewAccessibility__pasteboardChanged___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _accessibilityBoolValueForKey:@"needToAnnounceCopy"];
  if (result)
  {
    [*(id *)(a1 + 32) _accessibilityPostPasteboardTextForOperation:*MEMORY[0x263F21B78]];
    objc_super v3 = *(void **)(a1 + 32);
    return [v3 _accessibilitySetBoolValue:0 forKey:@"needToAnnounceCopy"];
  }
  return result;
}

- (void)accessibilityRelayNotification:(id)a3 notificationData:(id)a4
{
  v20[7] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if ([v6 length])
  {
    id v7 = (void *)MEMORY[0x263F08928];
    objc_super v8 = (void *)MEMORY[0x263EFFA08];
    v20[0] = objc_opt_class();
    v20[1] = objc_opt_class();
    v20[2] = objc_opt_class();
    v20[3] = objc_opt_class();
    v20[4] = objc_opt_class();
    v20[5] = objc_opt_class();
    v20[6] = objc_opt_class();
    v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:7];
    id v10 = [v8 setWithArray:v9];
    id v19 = 0;
    uint64_t v11 = [v7 unarchivedObjectOfClasses:v10 fromData:v6 error:&v19];
    id v12 = v19;

    if (v12)
    {
      v13 = AXLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[WKContentViewAccessibility accessibilityRelayNotification:notificationData:]((uint64_t)v12, v13);
      }
    }
  }
  else
  {
    id v12 = 0;
    uint64_t v11 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v14 = [objc_alloc(MEMORY[0x263F21660]) initWithStringOrAttributedString:v11];
LABEL_15:
    uint64_t v15 = v11;
    uint64_t v11 = (void *)v14;
LABEL_16:

    goto LABEL_17;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v15 = [v11 objectForKey:@"associatedElement"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16 = (const void *)_AXUIElementCreateWithData();
      _UIAccessibilitySetAssociatedElementContextForNextNotification();
      if (v16) {
        CFRelease(v16);
      }
    }
    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v17 = (const void *)_AXUIElementCreateWithData();
    uint64_t v14 = CFAutorelease(v17);
    goto LABEL_15;
  }
LABEL_17:
  id v18 = AXWebNotificationWithName(v5);
  UIAccessibilityPostNotification([v18 unsignedIntValue], v11);
}

- (void)copy:(id)a3
{
  id v4 = a3;
  [(WKContentViewAccessibility *)self _registerForNotificationsIfNecessary];
  [(WKContentViewAccessibility *)self _accessibilitySetBoolValue:1 forKey:@"needToAnnounceCopy"];
  v5.receiver = self;
  v5.super_class = (Class)WKContentViewAccessibility;
  [(WKContentViewAccessibility *)&v5 copy:v4];
}

- (void)cut:(id)a3
{
  uint64_t v4 = *MEMORY[0x263F21B78];
  id v5 = a3;
  [(WKContentViewAccessibility *)self _accessibilityIgnoreNextPostPasteboardTextOperation:v4];
  v6.receiver = self;
  v6.super_class = (Class)WKContentViewAccessibility;
  [(WKContentViewAccessibility *)&v6 cut:v5];

  [(WKContentViewAccessibility *)self _accessibilityPostPasteboardTextForOperation:*MEMORY[0x263F21B80]];
}

- (void)paste:(id)a3
{
  uint64_t v4 = *MEMORY[0x263F21BC0];
  id v5 = a3;
  [(WKContentViewAccessibility *)self _accessibilityPostPasteboardTextForOperation:v4];
  v6.receiver = self;
  v6.super_class = (Class)WKContentViewAccessibility;
  [(WKContentViewAccessibility *)&v6 paste:v5];
}

- (void)selectAll:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WKContentViewAccessibility;
  [(WKContentViewAccessibility *)&v5 selectAll:a3];
  UIAccessibilityNotifications v3 = *MEMORY[0x263F1CDC8];
  uint64_t v4 = UIKitAccessibilityLocalizedString();
  UIAccessibilityPostNotification(v3, v4);
}

- (void)toggleBoldface:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WKContentViewAccessibility;
  [(WKContentViewAccessibility *)&v6 toggleBoldface:a3];
  UIAccessibilityNotifications v3 = (void *)MEMORY[0x263F21660];
  uint64_t v4 = UIKitAccessibilityLocalizedString();
  objc_super v5 = [v3 axAttributedStringWithString:v4];

  [v5 setAttribute:*MEMORY[0x263F216F0] forKey:*MEMORY[0x263F21858]];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v5);
}

- (void)increaseSizeForWebView:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WKContentViewAccessibility;
  [(WKContentViewAccessibility *)&v6 toggleBoldface:a3];
  UIAccessibilityNotifications v3 = (void *)MEMORY[0x263F21660];
  uint64_t v4 = UIKitAccessibilityLocalizedString();
  objc_super v5 = [v3 axAttributedStringWithString:v4];

  [v5 setAttribute:*MEMORY[0x263F21758] forKey:*MEMORY[0x263F21858]];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v5);
}

- (void)decreaseSizeForWebView:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WKContentViewAccessibility;
  [(WKContentViewAccessibility *)&v6 toggleBoldface:a3];
  UIAccessibilityNotifications v3 = (void *)MEMORY[0x263F21660];
  uint64_t v4 = UIKitAccessibilityLocalizedString();
  objc_super v5 = [v3 axAttributedStringWithString:v4];

  [v5 setAttribute:*MEMORY[0x263F21758] forKey:*MEMORY[0x263F21858]];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v5);
}

- (void)toggleItalics:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WKContentViewAccessibility;
  [(WKContentViewAccessibility *)&v6 toggleItalics:a3];
  UIAccessibilityNotifications v3 = (void *)MEMORY[0x263F21660];
  uint64_t v4 = UIKitAccessibilityLocalizedString();
  objc_super v5 = [v3 axAttributedStringWithString:v4];

  [v5 setAttribute:*MEMORY[0x263F217A0] forKey:*MEMORY[0x263F21858]];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v5);
}

- (void)toggleUnderline:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WKContentViewAccessibility;
  [(WKContentViewAccessibility *)&v6 toggleUnderline:a3];
  UIAccessibilityNotifications v3 = (void *)MEMORY[0x263F21660];
  uint64_t v4 = UIKitAccessibilityLocalizedString();
  objc_super v5 = [v3 axAttributedStringWithString:v4];

  [v5 setAttribute:*MEMORY[0x263F218F0] forKey:*MEMORY[0x263F21858]];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v5);
}

- (BOOL)_accessibilityBeginUndoableTextInsertion
{
  return 0;
}

- (BOOL)_accessibilityEndUndoableTextInsertion
{
  return 0;
}

- (void)_accessibilityShare
{
}

uint64_t __49__WKContentViewAccessibility__accessibilityShare__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) shareForWebView:0];
}

- (id)_accessibilityResponderElement
{
  if ([(WKContentViewAccessibility *)self safeBoolForKey:@"_requiresKeyboardWhenFirstResponder"])
  {
    UIAccessibilityNotifications v3 = [(WKContentViewAccessibility *)self _accessibilityValueForKey:@"RemoteElements"];
    uint64_t v4 = [v3 lastObject];
    objc_super v5 = [v4 _accessibilityResponderElement];
  }
  else
  {
    objc_super v5 = 0;
  }

  return v5;
}

- (BOOL)_accessibilityIsScrollAncestor
{
  return 1;
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  UIAccessibilityNotifications v3 = [(WKContentViewAccessibility *)self _accessibilityValueForKey:@"RemoteElements"];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v7++) setAccessibilityContainer:0];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  objc_super v8 = [MEMORY[0x263F08A00] defaultCenter];
  [v8 removeObserver:self name:*MEMORY[0x263F1D500] object:0];

  v9.receiver = self;
  v9.super_class = (Class)WKContentViewAccessibility;
  [(WKContentViewAccessibility *)&v9 dealloc];
}

- (id)accessibilityElements
{
  v15[1] = *MEMORY[0x263EF8340];
  UIAccessibilityNotifications v3 = [(WKContentViewAccessibility *)self _accessibilityValueForKey:@"RemoteElements"];
  if (!v3)
  {
    uint64_t v4 = objc_getAssociatedObject(self, (const void *)[@"ax-uuid" hash]);
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = [v4 UUIDString];
      uint64_t v7 = objc_getAssociatedObject(self, (const void *)[@"ax-pid" hash]);
      uint64_t v8 = [v7 intValue];

      if (v8)
      {
        objc_super v9 = objc_getAssociatedObject(self, (const void *)[@"ax-machport" hash]);
        uint64_t v10 = [v9 intValue];

        uint64_t v14 = objc_getAssociatedObject(self, (const void *)[@"ax-pid" hash]);
        LOBYTE(v13) = 1;
        _AXLogWithFacility();

        long long v11 = (void *)[objc_alloc(MEMORY[0x263F21678]) initWithUUID:v6, v8, -[WKContentViewAccessibility _accessibilityContextId](self, "_accessibilityContextId", v13, @"WKContentView[%@] set up: %@ pid: %@ MACH_PORT %d", self, v6, v14, v10) andRemotePid andContextId];
        [v11 setOnClientSide:1];
        [v11 setAccessibilityContainer:self];
        [v11 setMachPort:0];
        [v11 setDeniesDirectAppConnection:1];
        v15[0] = v11;
        UIAccessibilityNotifications v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
        [(WKContentViewAccessibility *)self _accessibilitySetRetainedValue:v3 forKey:@"RemoteElements"];

        goto LABEL_8;
      }
      [(WKContentViewAccessibility *)self _accessibilityRegisterUIProcessTokens];
    }
    else
    {
      [(WKContentViewAccessibility *)self _accessibilityRegisterUIProcessTokens];
    }
    UIAccessibilityNotifications v3 = 0;
  }
LABEL_8:

  return v3;
}

- (CGPoint)accessibilityActivationPoint
{
  [(WKContentViewAccessibility *)self bounds];
  CGRect v8 = UIAccessibilityConvertFrameToScreenCoordinates(v7, (UIView *)self);

  MEMORY[0x270F0A3B0]((__n128)v8.origin, *(__n128 *)&v8.origin.y, (__n128)v8.size, *(__n128 *)&v8.size.height);
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGRect)accessibilityFrame
{
  v2 = [(WKContentViewAccessibility *)self accessibilityContainer];
  [v2 accessibilityFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)_accessibilityIncreaseSelection:(id)a3
{
  id v4 = (id)[(WKContentViewAccessibility *)self safeValueForKey:@"_selectionChanged"];
  id v5 = (id)[(WKContentViewAccessibility *)self safeValueForKey:@"_updateChangedSelection"];
}

- (void)_zoomToRevealFocusedElement
{
  v2.receiver = self;
  v2.super_class = (Class)WKContentViewAccessibility;
  [(WKContentViewAccessibility *)&v2 _zoomToRevealFocusedElement];
  AXPerformBlockOnMainThreadAfterDelay();
}

void __57__WKContentViewAccessibility__zoomToRevealFocusedElement__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _accessibilitySetBoolValue:1 forKey:@"WebFormControlStarted"];
  UIAccessibilityNotifications v1 = *MEMORY[0x263F81450];

  UIAccessibilityPostNotification(v1, 0);
}

- (void)_hideKeyboard
{
  v3.receiver = self;
  v3.super_class = (Class)WKContentViewAccessibility;
  [(WKContentViewAccessibility *)&v3 _hideKeyboard];
  if ([(WKContentViewAccessibility *)self _accessibilityBoolValueForKey:@"WebFormControlStarted"])UIAccessibilityPostNotification(*MEMORY[0x263F81448], 0); {
  [(WKContentViewAccessibility *)self _accessibilitySetBoolValue:0 forKey:@"WebFormControlStarted"];
  }
}

- (id)accessibilityDragSourceDescriptors
{
  v8[1] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263F1C3B8]);
  objc_super v3 = accessibilityUIKitLocalizedString();
  objc_opt_class();
  id v4 = __UIAccessibilityCastAsClass();
  id v5 = objc_msgSend(v2, "initWithName:point:inView:", v3, v4, 0.0, 0.0);
  v8[0] = v5;
  double v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];

  return v6;
}

- (BOOL)canBecomeFocused
{
  if ([(WKContentViewAccessibility *)self _accessibilityIsFKARunningForFocusItem])
  {
    objc_super v3 = [(WKContentViewAccessibility *)self _accessibilityAncestorIsKindOf:MEMORY[0x2455E78E0](@"WKWebView")];
    id v4 = [v3 safeValueForKey:@"URL"];
    if (v4)
    {
    }
    else
    {
      double v8 = [(WKContentViewAccessibility *)self _accessibilityResponderElement];

      if (v8)
      {
        char v7 = 0;
LABEL_11:

        return v7;
      }
    }
    objc_opt_class();
    id v5 = __UIAccessibilityCastAsClass();
    double v6 = [v5 UIDelegate];

    if (objc_opt_respondsToSelector()) {
      char v7 = [v6 _webViewCanBecomeFocused:v3];
    }
    else {
      char v7 = 1;
    }

    goto LABEL_11;
  }
  v10.receiver = self;
  v10.super_class = (Class)WKContentViewAccessibility;
  return [(WKContentViewAccessibility *)&v10 canBecomeFocused];
}

- (id)_systemDefaultFocusGroupIdentifier
{
  if ([(WKContentViewAccessibility *)self _accessibilityIsFKARunningForFocusItem])
  {
    objc_super v3 = [(WKContentViewAccessibility *)self _accessibilityDefaultFocusGroupIdentifier];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)WKContentViewAccessibility;
    objc_super v3 = [(WKContentViewAccessibility *)&v5 _systemDefaultFocusGroupIdentifier];
  }

  return v3;
}

- (id)_viewToAddFocusLayer
{
  return 0;
}

- (BOOL)_accessibilityHandlesRemoteFocusMovement
{
  return 1;
}

- (int)_accessibilityRemotePid
{
  id v2 = objc_getAssociatedObject(self, (const void *)[@"ax-pid" hash]);
  int v3 = [v2 intValue];

  return v3;
}

- (void)accessibilityRelayNotification:(uint64_t)a1 notificationData:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2404BB000, a2, OS_LOG_TYPE_ERROR, "Could not de-archive: %@", (uint8_t *)&v2, 0xCu);
}

@end