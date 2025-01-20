@interface QLToolbarButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)barButtonWithTarget:(id)a3 action:(SEL)a4 maxSize:(CGSize)a5;
@end

@implementation QLToolbarButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"QLToolbarButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"QLToolbarButton", @"barButtonWithTarget: action: maxSize:", "@", "@", ":", "{CGSize=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"QLToolbarButton", @"identifier", "@", 0);
}

- (id)barButtonWithTarget:(id)a3 action:(SEL)a4 maxSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)QLToolbarButtonAccessibility;
  v10 = -[QLToolbarButtonAccessibility barButtonWithTarget:action:maxSize:](&v26, sel_barButtonWithTarget_action_maxSize_, v9, a4, width, height);
  LOBYTE(location) = 0;
  objc_opt_class();
  v11 = __UIAccessibilityCastAsClass();
  v12 = [v11 customView];

  v13 = [(QLToolbarButtonAccessibility *)self safeStringForKey:@"identifier"];
  if (([v13 isEqualToString:@"QLInlineMarkup"] & 1) != 0
    || [v13 isEqualToString:@"QLOverlayMarkupButtonAccessibilityIdentifier"])
  {
    v14 = accessibilityLocalizedString(@"markup.button");
    [(QLToolbarButtonAccessibility *)self setAccessibilityLabel:v14];

    objc_initWeak(&location, self);
    [v10 _setAccessibilityTraitsBlock:&__block_literal_global_0];
    uint64_t v20 = MEMORY[0x263EF8330];
    uint64_t v21 = 3221225472;
    v22 = __67__QLToolbarButtonAccessibility_barButtonWithTarget_action_maxSize___block_invoke_2;
    v23 = &unk_2650A9720;
    objc_copyWeak(&v24, &location);
    [v10 _setAccessibilityValueBlock:&v20];
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
    goto LABEL_15;
  }
  if ([v13 isEqualToString:@"QLMarkupRedo"])
  {
    v15 = @"redo.button";
  }
  else if ([v13 isEqualToString:@"QLMarkupUndo"])
  {
    v15 = @"undo.button";
  }
  else if ([v13 isEqualToString:@"QLMarkupUndoAll"])
  {
    v15 = @"undo.all.button";
  }
  else if ([v13 isEqualToString:@"QLMediaItemViewControllerBarTrimButtonAccessibilityIdentifier"])
  {
    v15 = @"ql.trim";
  }
  else
  {
    if (![v13 isEqualToString:@"QLMediaItemViewControllerBarRotateRightButtonAccessibilityIdentifier"])goto LABEL_15; {
    v15 = @"ql.rotate.right";
    }
  }
  v16 = accessibilityLocalizedString(v15);
  [(QLToolbarButtonAccessibility *)self setAccessibilityLabel:v16];

LABEL_15:
  v17 = [(QLToolbarButtonAccessibility *)self accessibilityLabel];
  [v12 setAccessibilityLabel:v17];

  v18 = [(QLToolbarButtonAccessibility *)self accessibilityLabel];
  [v10 setAccessibilityLabel:v18];

  return v10;
}

uint64_t __67__QLToolbarButtonAccessibility_barButtonWithTarget_action_maxSize___block_invoke()
{
  return *MEMORY[0x263F81418];
}

__CFString *__67__QLToolbarButtonAccessibility_barButtonWithTarget_action_maxSize___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained safeBoolForKey:@"selected"]) {
    v2 = @"1";
  }
  else {
    v2 = @"0";
  }
  id v3 = v2;

  return v3;
}

@end