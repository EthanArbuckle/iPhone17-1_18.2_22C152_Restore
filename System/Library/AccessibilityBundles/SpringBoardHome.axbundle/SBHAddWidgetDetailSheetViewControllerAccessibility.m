@interface SBHAddWidgetDetailSheetViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_addPage:(id)a3;
- (void)_createViews;
- (void)addButtonTapped:(id)a3;
@end

@implementation SBHAddWidgetDetailSheetViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBHAddWidgetDetailSheetViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHAddWidgetDetailSheetViewController", @"widgetGalleryStackView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHAddWidgetDetailSheetViewController", @"widgetGalleryScrollView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHAddWidgetDetailSheetViewController", @"_createViews", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHAddWidgetDetailSheetViewController", @"_addPage:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHAddWidgetDetailSheetViewController", @"scrollViewDidScroll:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHAddWidgetDetailSheetViewController", @"addButtonTapped:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHAddWidgetDetailSheetViewController", @"applicationWidgetCollection", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHApplicationWidgetCollection", @"displayName", "@", 0);
}

- (void)_createViews
{
  v4.receiver = self;
  v4.super_class = (Class)SBHAddWidgetDetailSheetViewControllerAccessibility;
  [(SBHAddWidgetDetailSheetViewControllerAccessibility *)&v4 _createViews];
  id v3 = [(SBHAddWidgetDetailSheetViewControllerAccessibility *)self safeValueForKey:@"widgetGalleryScrollView"];
  [v3 _accessibilitySetPagingEnabled:1];
}

- (void)_addPage:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v21.receiver = self;
  v21.super_class = (Class)SBHAddWidgetDetailSheetViewControllerAccessibility;
  id v9 = a3;
  -[SBHAddWidgetDetailSheetViewControllerAccessibility _addPage:](&v21, sel__addPage_);
  v10 = [(SBHAddWidgetDetailSheetViewControllerAccessibility *)self safeValueForKey:@"widgetGalleryStackView"];
  id val = [(SBHAddWidgetDetailSheetViewControllerAccessibility *)self safeValueForKey:@"widgetGalleryScrollView"];
  objc_initWeak(&location, val);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  objc_super v4 = [v10 arrangedSubviews];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_initWeak(&from, v8);
        v12[0] = MEMORY[0x263EF8330];
        v12[1] = 3221225472;
        v12[2] = __63__SBHAddWidgetDetailSheetViewControllerAccessibility__addPage___block_invoke;
        v12[3] = &unk_265157E68;
        objc_copyWeak(&v13, &from);
        objc_copyWeak(&v14, &location);
        [v8 _setAccessibilityElementsHiddenBlock:v12];
        objc_destroyWeak(&v14);
        objc_destroyWeak(&v13);
        objc_destroyWeak(&from);
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v5);
  }

  objc_destroyWeak(&location);
}

uint64_t __63__SBHAddWidgetDetailSheetViewControllerAccessibility__addPage___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained accessibilityFrame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;

  id v11 = objc_loadWeakRetained((id *)(a1 + 40));
  [v11 accessibilityFrame];
  v19.origin.x = v12;
  v19.origin.y = v13;
  v19.size.width = v14;
  v19.size.height = v15;
  v18.origin.x = v4;
  v18.origin.y = v6;
  v18.size.width = v8;
  v18.size.height = v10;
  CGRectIntersection(v18, v19);
  uint64_t v16 = AX_CGRectAlmostEqualToRect() ^ 1;

  return v16;
}

- (void)addButtonTapped:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SBHAddWidgetDetailSheetViewControllerAccessibility;
  [(SBHAddWidgetDetailSheetViewControllerAccessibility *)&v11 addButtonTapped:a3];
  CGFloat v4 = [(SBHAddWidgetDetailSheetViewControllerAccessibility *)self safeValueForKey:@"_applicationWidgetCollection"];
  double v5 = [v4 safeStringForKey:@"displayName"];

  CGFloat v6 = NSString;
  double v7 = accessibilityLocalizedString(@"widget.added");
  CGFloat v8 = &stru_26F7E8EF8;
  if (v5) {
    CGFloat v8 = v5;
  }
  double v9 = objc_msgSend(v6, "localizedStringWithFormat:", v7, v8);

  CGFloat v10 = [MEMORY[0x263F21660] axAttributedStringWithString:v9];
  [v10 setAttribute:&unk_26F7F1EB8 forKey:*MEMORY[0x263F216D8]];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v10);
}

@end