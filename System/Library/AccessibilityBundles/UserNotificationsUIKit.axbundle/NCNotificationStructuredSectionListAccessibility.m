@interface NCNotificationStructuredSectionListAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIgnoreNotification;
- (id)axStringForRequest:(id)a3 label:(id)a4;
- (id)removeNotificationGroupListsForMigrationPassingTest:(id)a3 filterRequestsPassingTest:(id)a4 animate:(BOOL)a5;
- (void)_axSetIgnoreNotification:(BOOL)a3;
- (void)_toggleHiddenNotificationsOnAuthenticationChange:(BOOL)a3;
- (void)insertNotificationRequest:(id)a3;
- (void)mergeNotificationGroups:(id)a3 reorderGroupNotifications:(BOOL)a4;
@end

@implementation NCNotificationStructuredSectionListAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NCNotificationStructuredSectionList";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationRootList", @"incomingSectionList", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationStructuredSectionList", @"insertNotificationRequest:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationStructuredSectionList", @"_existingIndexOfGroupForNotificationRequest:", "Q", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationStructuredSectionList", @"_toggleHiddenNotificationsOnAuthenticationChange:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationStructuredSectionList", @"removeNotificationGroupListsForMigrationPassingTest:filterRequestsPassingTest:animate:", "@", "@?", "@?", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationStructuredSectionList", @"mergeNotificationGroups:reorderGroupNotifications:", "v", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationStructuredSectionList", @"notificationGroups", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationStructuredSectionList", @"delegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationStructuredSectionList", @"deviceAuthenticated", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationListPresentableGroup", @"listView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationListView", @"dataSource", "@", 0);
  [v3 validateProtocol:@"NCNotificationListViewDataSource" hasRequiredInstanceMethod:@"notificationListView:viewForItemAtIndex:"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationListCell", @"contentViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationViewController", @"_setupStaticContentProvider", "v", 0);
  if (AXProcessIsSpringBoard())
  {
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SpringBoard", @"notificationDispatcher", "@", 0);
    [v3 validateClass:@"SBNCNotificationDispatcher" hasInstanceVariable:@"_dispatcher" withType:"NCNotificationDispatcher"];
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBNCAlertingController", @"screenController", "@", 0);
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBNCScreenController", @"canTurnOnScreenForNotificationRequest:", "B", "@", 0);
  }
}

- (BOOL)_axIgnoreNotification
{
  return MEMORY[0x270F0A438](self, &__NCNotificationStructuredSectionListAccessibility___axIgnoreNotification);
}

- (void)_axSetIgnoreNotification:(BOOL)a3
{
}

- (void)insertNotificationRequest:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)NCNotificationStructuredSectionListAccessibility;
  [(NCNotificationStructuredSectionListAccessibility *)&v24 insertNotificationRequest:v4];
  if (![(NCNotificationStructuredSectionListAccessibility *)self _axIgnoreNotification]
    && ([(NCNotificationStructuredSectionListAccessibility *)self safeBoolForKey:@"deviceAuthenticated"] & 1) == 0)
  {
    v5 = [(NCNotificationStructuredSectionListAccessibility *)self safeValueForKey:@"delegate"];
    v6 = [v5 safeValueForKey:@"incomingSectionList"];

    if (v6 == self)
    {
      uint64_t v7 = [(NCNotificationStructuredSectionListAccessibility *)self _existingIndexOfGroupForNotificationRequest:v4];
      if (v7 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v8 = v7;
        v9 = [(NCNotificationStructuredSectionListAccessibility *)self safeArrayForKey:@"notificationGroups"];
        v10 = [v9 axSafeObjectAtIndex:v8];
        v11 = [v10 safeValueForKey:@"listView"];

        uint64_t v18 = 0;
        v19 = &v18;
        uint64_t v20 = 0x3032000000;
        v21 = __Block_byref_object_copy__0;
        v22 = __Block_byref_object_dispose__0;
        id v23 = 0;
        id v17 = v11;
        AXPerformSafeBlock();
        id v12 = (id)v19[5];

        _Block_object_dispose(&v18, 8);
        v16 = v12;
        id v13 = v12;
        AXPerformSafeBlock();
        v14 = [v13 accessibilityLabel];
        v15 = [(NCNotificationStructuredSectionListAccessibility *)self axStringForRequest:v4 label:v14];

        UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v15);
      }
    }
  }
}

void __78__NCNotificationStructuredSectionListAccessibility_insertNotificationRequest___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) safeValueForKey:@"dataSource"];
  uint64_t v2 = [v5 notificationListView:*(void *)(a1 + 32) viewForItemAtIndex:0];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __78__NCNotificationStructuredSectionListAccessibility_insertNotificationRequest___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) safeValueForKey:@"contentViewController"];
  [v1 _setupStaticContentProvider];
}

- (id)axStringForRequest:(id)a3 label:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  char v28 = 0;
  uint64_t v7 = __UIAccessibilitySafeClass();
  uint64_t v8 = [v7 safeValueForKey:@"notificationDispatcher"];
  v9 = __UIAccessibilitySafeClass();

  v10 = [v9 safeValueForKey:@"_dispatcher"];
  v11 = __UIAccessibilitySafeClass();

  id v12 = [v11 safeValueForKey:@"alertingController"];
  id v13 = __UIAccessibilitySafeClass();

  v14 = [v13 safeValueForKey:@"screenController"];
  v15 = __UIAccessibilitySafeClass();

  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  uint64_t v23 = MEMORY[0x263EF8330];
  id v16 = v15;
  id v17 = v5;
  AXPerformSafeBlock();
  uint64_t v18 = objc_msgSend(MEMORY[0x263F21660], "axAttributedStringWithString:", v6, v23, 3221225472, __77__NCNotificationStructuredSectionListAccessibility_axStringForRequest_label___block_invoke, &unk_265161800);
  [v18 setAttribute:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F218C8]];
  v19 = [v17 options];
  uint64_t v20 = [v19 lockScreenPersistence];

  if (v20 == 2) {
    [v18 setAttribute:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F21828]];
  }
  v21 = [NSNumber numberWithBool:*((unsigned __int8 *)v25 + 24)];
  [v18 setAttribute:v21 forKey:*MEMORY[0x263F216D0]];

  _Block_object_dispose(&v24, 8);

  return v18;
}

uint64_t __77__NCNotificationStructuredSectionListAccessibility_axStringForRequest_label___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) canTurnOnScreenForNotificationRequest:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (void)_toggleHiddenNotificationsOnAuthenticationChange:(BOOL)a3
{
  BOOL v3 = a3;
  [(NCNotificationStructuredSectionListAccessibility *)self _axSetIgnoreNotification:1];
  v5.receiver = self;
  v5.super_class = (Class)NCNotificationStructuredSectionListAccessibility;
  [(NCNotificationStructuredSectionListAccessibility *)&v5 _toggleHiddenNotificationsOnAuthenticationChange:v3];
  [(NCNotificationStructuredSectionListAccessibility *)self _axSetIgnoreNotification:0];
}

- (id)removeNotificationGroupListsForMigrationPassingTest:(id)a3 filterRequestsPassingTest:(id)a4 animate:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  [(NCNotificationStructuredSectionListAccessibility *)self _axSetIgnoreNotification:1];
  v12.receiver = self;
  v12.super_class = (Class)NCNotificationStructuredSectionListAccessibility;
  v10 = [(NCNotificationStructuredSectionListAccessibility *)&v12 removeNotificationGroupListsForMigrationPassingTest:v9 filterRequestsPassingTest:v8 animate:v5];

  [(NCNotificationStructuredSectionListAccessibility *)self _axSetIgnoreNotification:0];

  return v10;
}

- (void)mergeNotificationGroups:(id)a3 reorderGroupNotifications:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(NCNotificationStructuredSectionListAccessibility *)self _axSetIgnoreNotification:1];
  v7.receiver = self;
  v7.super_class = (Class)NCNotificationStructuredSectionListAccessibility;
  [(NCNotificationStructuredSectionListAccessibility *)&v7 mergeNotificationGroups:v6 reorderGroupNotifications:v4];

  [(NCNotificationStructuredSectionListAccessibility *)self _axSetIgnoreNotification:0];
}

@end