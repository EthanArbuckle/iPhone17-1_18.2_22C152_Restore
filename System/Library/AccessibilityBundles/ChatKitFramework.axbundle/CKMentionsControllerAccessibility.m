@interface CKMentionsControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)setShowMentionSuggestions:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
@end

@implementation CKMentionsControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKMentionsController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMentionsController", @"setShowMentionSuggestions:animated:completion:", "v", "B", "B", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMentionsController", @"paddleOverlayView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMentionsController", @"currentMentionSuggestions", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMentionsController", @"mentionSuggestionView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMentionSuggestionView", @"collectionView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMentionsController", @"textView", "@", 0);
}

- (void)setShowMentionSuggestions:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  v20.receiver = self;
  v20.super_class = (Class)CKMentionsControllerAccessibility;
  [(CKMentionsControllerAccessibility *)&v20 setShowMentionSuggestions:v6 animated:v5 completion:v8];
  v9 = [(CKMentionsControllerAccessibility *)self safeArrayForKey:@"currentMentionSuggestions"];
  if ([v9 count])
  {
    LOBYTE(location) = 0;
    objc_opt_class();
    v10 = [(CKMentionsControllerAccessibility *)self safeValueForKey:@"mentionSuggestionView"];
    v11 = [v10 safeValueForKey:@"collectionView"];
    v12 = __UIAccessibilityCastAsClass();

    if ([v12 numberOfSections] >= 1 && objc_msgSend(v12, "numberOfItemsInSection:", 0) >= 1)
    {
      v13 = [MEMORY[0x263F088C8] indexPathForItem:0 inSection:0];
      v14 = [v12 cellForItemAtIndexPath:v13];

      UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], v14);
    }
  }
  v15 = [(CKMentionsControllerAccessibility *)self safeUIViewForKey:@"textView"];
  v16 = v15;
  if (v6)
  {
    objc_initWeak(&location, self);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __83__CKMentionsControllerAccessibility_setShowMentionSuggestions_animated_completion___block_invoke;
    v17[3] = &unk_265112E38;
    objc_copyWeak(&v18, &location);
    [v16 _setAccessibilityPerformEscapeBlock:v17];
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
    [v15 _setAccessibilityPerformEscapeBlock:0];
  }
}

uint64_t __83__CKMentionsControllerAccessibility_setShowMentionSuggestions_animated_completion___block_invoke(uint64_t a1)
{
  objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained safeUIViewForKey:@"paddleOverlayView"];
  v4 = __UIAccessibilityCastAsClass();

  [v4 dismiss];
  return 1;
}

@end