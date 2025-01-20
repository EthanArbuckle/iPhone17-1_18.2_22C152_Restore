@interface CKInlineReplyChatControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformEscape;
- (void)_animateIn:(BOOL)a3;
@end

@implementation CKInlineReplyChatControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKInlineReplyChatController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKInlineReplyChatController", @"_animateOut", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKInlineReplyChatController", @"_animateIn:", "v", "B", 0);
  [v3 validateClass:@"CKInlineReplyChatController" isKindOfClass:@"CKCoreChatController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKCoreChatController", @"collectionViewController", "@", 0);
  [v3 validateClass:@"CKInlineReplyCollectionViewController" isKindOfClass:@"CKTranscriptCollectionViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKTranscriptCollectionViewController", @"collectionView", "@", 0);
}

- (BOOL)accessibilityPerformEscape
{
  return 1;
}

uint64_t __70__CKInlineReplyChatControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _animateOut];
}

- (void)_animateIn:(BOOL)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)CKInlineReplyChatControllerAccessibility;
  [(CKInlineReplyChatControllerAccessibility *)&v14 _animateIn:a3];
  v4 = [(CKInlineReplyChatControllerAccessibility *)self safeValueForKeyPath:@"collectionViewController.collectionView"];
  if (v4)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x263F1C3A8]) initWithAccessibilityContainer:v4];
    objc_initWeak(&location, self);
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    v10 = __55__CKInlineReplyChatControllerAccessibility__animateIn___block_invoke;
    v11 = &unk_265112E80;
    objc_copyWeak(&v12, &location);
    [v5 _setAccessibilityFrameBlock:&v8];
    objc_msgSend(v5, "setAccessibilityTraits:", *MEMORY[0x263F1CEE8], v8, v9, v10, v11);
    v6 = accessibilityLocalizedString(@"inline.reply.dismiss.transcript");
    [v5 setAccessibilityLabel:v6];

    [v5 _accessibilitySetAdditionalElementOrderedLast:1];
    v15[0] = v5;
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
    [v4 _accessibilitySetAdditionalElements:v7];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

double __55__CKInlineReplyChatControllerAccessibility__animateIn___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained safeValueForKeyPath:@"collectionViewController.collectionView"];
  [v2 accessibilityFrame];
  double v4 = v3;

  return v4;
}

@end