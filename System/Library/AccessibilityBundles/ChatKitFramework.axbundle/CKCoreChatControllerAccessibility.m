@interface CKCoreChatControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)sendTapback:(id)a3 chatItem:(id)a4 isRemoval:(BOOL)a5;
@end

@implementation CKCoreChatControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKCoreChatController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateProtocol:@"CKFullScreenBalloonViewControllerDelegate" hasOptionalInstanceMethod:@"fullScreenBalloonViewControllerHandleDismissTap:"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKCoreChatController", @"sendTapback:chatItem:isRemoval:", "v", "@", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKCoreChatController", @"balloonViewForChatItem:", "@", "@", 0);
}

- (void)sendTapback:(id)a3 chatItem:(id)a4 isRemoval:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CKCoreChatControllerAccessibility;
  [(CKCoreChatControllerAccessibility *)&v18 sendTapback:v8 chatItem:v9 isRemoval:v5];
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__6;
  v16 = __Block_byref_object_dispose__6;
  id v17 = 0;
  id v11 = v9;
  AXPerformSafeBlock();
  id v10 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], v10);
}

uint64_t __68__CKCoreChatControllerAccessibility_sendTapback_chatItem_isRemoval___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) balloonViewForChatItem:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

@end