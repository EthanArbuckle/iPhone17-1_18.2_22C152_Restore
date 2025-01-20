@interface SUUIWebDocumentViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityScrollRightPage;
@end

@implementation SUUIWebDocumentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIWebDocumentView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityScrollRightPage
{
  v3 = [(SUUIWebDocumentViewAccessibility *)self safeValueForKey:@"_scroller"];
  [v3 _accessibilityContentSize];
  double v5 = v4;
  [v3 visibleBounds];
  if (v3 && v5 != v6) {
    goto LABEL_9;
  }
  v7 = [NSClassFromString(&cfstr_Suclientcontro.isa) safeValueForKey:@"sharedController"];
  v8 = [v7 safeValueForKey:@"rootViewController"];
  NSClassFromString(&cfstr_Sutabbarcontro.isa);
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_8:

LABEL_9:
    v23.receiver = self;
    v23.super_class = (Class)SUUIWebDocumentViewAccessibility;
    BOOL v12 = [(SUUIWebDocumentViewAccessibility *)&v23 accessibilityScrollRightPage];
    goto LABEL_10;
  }
  v9 = [v8 safeValueForKey:@"overlayBackgroundViewController"];
  NSClassFromString(&cfstr_Suoverlaybackg.isa);
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_7:

    goto LABEL_8;
  }
  v10 = [v9 safeValueForKey:@"_viewControllers"];
  unint64_t v11 = [v10 count];
  if (v11 < 2)
  {

    goto LABEL_7;
  }
  unint64_t v14 = v11;
  v15 = [v9 safeValueForKey:@"_selectedViewControllerIndex"];
  uint64_t v16 = [v15 integerValue];

  v17 = [v10 objectAtIndex:v16];
  [v9 dismissOverlay:v17 animated:1];

  if (v14 == 2)
  {
    v18 = &stru_26F845BD8;
  }
  else
  {
    v19 = NSString;
    v20 = accessibilityLocalizedString(@"scroll.popup.summary");
    v21 = AXFormatInteger();
    v22 = AXFormatInteger();
    objc_msgSend(v19, "stringWithFormat:", v20, v21, v22);
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE30], v18);

  BOOL v12 = 1;
LABEL_10:

  return v12;
}

@end