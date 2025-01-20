@interface CKTranscriptCollectionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityOpaqueElementScrollsContentIntoView;
- (BOOL)accessibilityElementsHidden;
- (BOOL)accessibilityScroll:(int64_t)a3;
- (BOOL)accessibilityViewIsModal;
- (BOOL)isAccessibilityOpaqueElementProvider;
- (id)_accessibilityElementToFocusForAppearanceScreenChange;
- (id)accessibilityLabel;
- (void)_accessibilityEnsureViewsAroundAreLoaded;
- (void)_accessibilityScrollOpaqueElementIntoView:(int64_t)a3 previousScroller:(id)a4;
@end

@implementation CKTranscriptCollectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKTranscriptCollectionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CKTranscriptCollectionView" isKindOfClass:@"UICollectionView"];
  [v3 validateClass:@"UICollectionView" hasProperty:@"delegate" withType:"@"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKTranscriptCollectionViewController", @"delegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKCoreChatController", @"fullScreenBalloonViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKFullScreenBalloonViewController", @"displayConfiguration", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKFullScreenBalloonViewDisplayConfiguration", @"type", "q", 0);
  [v3 validateClass:@"CKChatController" isKindOfClass:@"CKCoreChatController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKChatController", @"entryView", "@", 0);
  [v3 validateClass:@"CKSocialLayerChatController"];
  [v3 validateClass:@"CKFullScreenBalloonViewControllerPhone" isKindOfClass:@"CKFullScreenBalloonViewController"];
  [v3 validateClass:@"CKTranscriptMessageCell"];
}

- (id)accessibilityLabel
{
  v2 = [(CKTranscriptCollectionViewAccessibility *)self accessibilityUserDefinedLabel];
  if ([v2 length])
  {
    id v3 = v2;
  }
  else
  {
    accessibilityLocalizedString(@"group.transcripts.collection");
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;

  return v4;
}

- (BOOL)accessibilityViewIsModal
{
  v2 = [(CKTranscriptCollectionViewAccessibility *)self safeValueForKeyPath:@"delegate.delegate.fullScreenBalloonViewController.displayConfiguration"];
  BOOL v3 = [v2 safeIntegerForKey:@"type"] == 1;

  return v3;
}

- (BOOL)accessibilityElementsHidden
{
  BOOL v3 = [(CKTranscriptCollectionViewAccessibility *)self storedAccessibilityElementsHidden];

  if (v3)
  {
    v4 = [(CKTranscriptCollectionViewAccessibility *)self storedAccessibilityElementsHidden];
    char v5 = [v4 BOOLValue];
LABEL_6:

    return v5;
  }
  v6 = [(CKTranscriptCollectionViewAccessibility *)self safeValueForKey:@"delegate"];
  v7 = [v6 safeValueForKey:@"delegate"];
  NSClassFromString(&cfstr_Cksociallayerc.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v4 = [(CKTranscriptCollectionViewAccessibility *)self safeValueForKey:@"delegate"];
    v9 = [v4 safeValueForKey:@"delegate"];
    v10 = [v9 safeValueForKey:@"entryView"];
    char v5 = [v10 accessibilityViewIsModal];

    goto LABEL_6;
  }
  return 1;
}

- (BOOL)isAccessibilityOpaqueElementProvider
{
  if ([(CKTranscriptCollectionViewAccessibility *)self accessibilityElementsHidden]) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CKTranscriptCollectionViewAccessibility;
  return [(CKTranscriptCollectionViewAccessibility *)&v4 isAccessibilityOpaqueElementProvider];
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CKTranscriptCollectionViewAccessibility;
  BOOL v5 = -[CKTranscriptCollectionViewAccessibility accessibilityScroll:](&v8, sel_accessibilityScroll_);
  uint64_t v6 = [(CKTranscriptCollectionViewAccessibility *)self _accessibilityPageIndex];
  if (a3 == 3 && v6 <= 1) {
    [(CKTranscriptCollectionViewAccessibility *)self _accessibilityEnsureViewsAroundAreLoaded];
  }
  return v5;
}

- (void)_accessibilityEnsureViewsAroundAreLoaded
{
  objc_opt_class();
  BOOL v3 = __UIAccessibilityCastAsClass();
  objc_super v4 = [v3 delegate];
  char v7 = 0;
  objc_opt_class();
  BOOL v5 = __UIAccessibilityCastAsSafeCategory();
  [v5 _accessibilityLoadMessagesIfNeeded];

  v6.receiver = self;
  v6.super_class = (Class)CKTranscriptCollectionViewAccessibility;
  [(CKTranscriptCollectionViewAccessibility *)&v6 _accessibilityEnsureViewsAroundAreLoaded];
}

- (void)_accessibilityScrollOpaqueElementIntoView:(int64_t)a3 previousScroller:(id)a4
{
  if (a3 != 1)
  {
    uint64_t v7 = v4;
    uint64_t v8 = v5;
    v6.receiver = self;
    v6.super_class = (Class)CKTranscriptCollectionViewAccessibility;
    [(CKTranscriptCollectionViewAccessibility *)&v6 _accessibilityScrollOpaqueElementIntoView:a3 previousScroller:a4];
  }
}

- (BOOL)_accessibilityOpaqueElementScrollsContentIntoView
{
  return 1;
}

- (id)_accessibilityElementToFocusForAppearanceScreenChange
{
  NSClassFromString(&cfstr_Cktranscriptme_0.isa);
  objc_opt_class();
  BOOL v3 = __UIAccessibilityCastAsClass();
  uint64_t v4 = [(CKTranscriptCollectionViewAccessibility *)self safeValueForKey:@"dataSource"];
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v25[3] = 0;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  v15 = __96__CKTranscriptCollectionViewAccessibility__accessibilityElementToFocusForAppearanceScreenChange__block_invoke;
  v16 = &unk_2651135A0;
  v19 = v25;
  id v5 = v4;
  v17 = v5;
  id v6 = v3;
  v18 = v6;
  v20 = &v21;
  AXPerformSafeBlock();
  uint64_t v7 = v22[3];
  if (v7 < 2)
  {
LABEL_5:
    v11 = 0;
  }
  else
  {
    uint64_t v8 = v7 + 1;
    while (1)
    {
      v9 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForItem:inSection:", v8 - 2, 0, v13, v14, v15, v16, v17, v18, v19, v20);
      v10 = [v6 cellForItemAtIndexPath:v9];
      if (objc_opt_isKindOfClass()) {
        break;
      }

      if ((unint64_t)--v8 <= 2) {
        goto LABEL_5;
      }
    }
    v11 = [v10 _accessibilityElementToFocusForAppearanceScreenChange];
  }
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(v25, 8);

  return v11;
}

uint64_t __96__CKTranscriptCollectionViewAccessibility__accessibilityElementToFocusForAppearanceScreenChange__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) numberOfSectionsInCollectionView:*(void *)(a1 + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  if (*(uint64_t *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) >= 1)
  {
    uint64_t result = [*(id *)(a1 + 32) collectionView:*(void *)(a1 + 40) numberOfItemsInSection:0];
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  }
  return result;
}

@end