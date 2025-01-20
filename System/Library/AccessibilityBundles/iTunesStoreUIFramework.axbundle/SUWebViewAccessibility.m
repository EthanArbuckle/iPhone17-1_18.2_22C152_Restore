@interface SUWebViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilitySUWebViewIsScrollAncestor;
- (BOOL)accessibilityPerformEscape;
- (BOOL)accessibilityScroll:(int64_t)a3;
- (BOOL)accessibilityScrollRightPage;
@end

@implementation SUWebViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUWebView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilitySUWebViewIsScrollAncestor
{
  v3 = [NSClassFromString(&cfstr_Suclientcontro.isa) safeValueForKey:@"sharedController"];
  v4 = [v3 safeValueForKey:@"rootViewController"];
  NSClassFromString(&cfstr_Sutabbarcontro.isa);
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 safeValueForKey:@"overlayBackgroundViewController"];
    NSClassFromString(&cfstr_Suoverlaybackg.isa);
    if (objc_opt_isKindOfClass())
    {
      v6 = [v5 safeValueForKey:@"_viewControllers"];
      unint64_t v7 = [v6 count];

      if (v7 > 1)
      {

        BOOL v8 = 1;
        goto LABEL_6;
      }
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)SUWebViewAccessibility;
  BOOL v8 = [(SUWebViewAccessibility *)&v10 _accessibilityIsScrollAncestor];
LABEL_6:

  return v8;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  v9[2] = *MEMORY[0x263EF8340];
  v4 = [MEMORY[0x263F08A00] defaultCenter];
  v8[0] = @"key";
  v8[1] = @"direction";
  v9[0] = @"scroll";
  v5 = [NSNumber numberWithInteger:a3];
  v9[1] = v5;
  v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];
  [v4 postNotificationName:@"AXActionForWebNotification" object:0 userInfo:v6];

  return 0;
}

- (BOOL)accessibilityPerformEscape
{
  v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"AXActionForWebNotification" object:0 userInfo:&unk_26F848928];

  return 0;
}

- (BOOL)accessibilityScrollRightPage
{
  v3 = [NSClassFromString(&cfstr_Suclientcontro.isa) safeValueForKey:@"sharedController"];
  v4 = [v3 safeValueForKey:@"rootViewController"];
  NSClassFromString(&cfstr_Sutabbarcontro.isa);
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_6;
  }
  v5 = [v4 safeValueForKey:@"overlayBackgroundViewController"];
  NSClassFromString(&cfstr_Suoverlaybackg.isa);
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_5:

LABEL_6:
    v19.receiver = self;
    v19.super_class = (Class)SUWebViewAccessibility;
    BOOL v8 = [(SUWebViewAccessibility *)&v19 accessibilityScrollRightPage];
    goto LABEL_7;
  }
  v6 = [v5 safeValueForKey:@"_viewControllers"];
  unint64_t v7 = [v6 count];
  if (v7 < 2)
  {

    goto LABEL_5;
  }
  unint64_t v10 = v7;
  v11 = [v5 safeValueForKey:@"_selectedViewControllerIndex"];
  uint64_t v12 = [v11 integerValue];

  v13 = [v6 objectAtIndex:v12];
  [v5 dismissOverlay:v13 animated:1];

  if (v10 == 2)
  {
    v14 = &stru_26F845BD8;
  }
  else
  {
    v15 = NSString;
    v16 = accessibilityLocalizedString(@"scroll.popup.summary");
    v17 = AXFormatInteger();
    v18 = AXFormatInteger();
    objc_msgSend(v15, "stringWithFormat:", v16, v17, v18);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE30], v14);

  BOOL v8 = 1;
LABEL_7:

  return v8;
}

@end