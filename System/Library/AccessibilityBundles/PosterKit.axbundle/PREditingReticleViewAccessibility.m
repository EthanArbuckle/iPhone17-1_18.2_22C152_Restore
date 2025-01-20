@interface PREditingReticleViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityShouldUseHostContextIDForPress;
- (BOOL)accessibilityElementsHidden;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityAXAttributedLabel;
- (id)_accessibilityGetRemoteElement;
- (id)_axPosterEditorViewController;
- (id)accessibilityElements;
- (id)accessibilityHint;
- (unint64_t)accessibilityTraits;
- (void)_accessibilitySetRemoteElement:(id)a3;
- (void)_axSetPosterEditorViewController:(id)a3;
- (void)_axSetRemoteViews;
@end

@implementation PREditingReticleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PREditingReticleView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityGetRemoteElement
{
}

- (void)_accessibilitySetRemoteElement:(id)a3
{
}

- (id)_axPosterEditorViewController
{
}

- (void)_axSetPosterEditorViewController:(id)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIScene", @"_FBSScene", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FBSScene", @"hostProcess", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FBSProcess", @"pid", "i", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PREditorRootViewController", @"isComplicationsRowConfigured", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PREditorRootViewController", @"isComplicationSidebarConfigured", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PREditorRootViewController", @"complicationHostViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PREditorRootViewController", @"complicationRowEmptyStateView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PREditorRootViewController", @"complicationSidebarEmptyStateView", "@", 0);
}

- (id)_accessibilityAXAttributedLabel
{
  id v3 = [(PREditingReticleViewAccessibility *)self accessibilityIdentifier];
  if (([v3 isEqualToString:@"grouped-widgets-reticle-view"] & 1) != 0
    || [v3 isEqualToString:@"grouped-widgets-reticle-sidebar-view"])
  {
    v4 = @"reticle.view.add.widget.button.label";
LABEL_4:
    uint64_t v5 = accessibilityLocalizedString(v4);
LABEL_5:
    v6 = (void *)v5;
    goto LABEL_6;
  }
  if ([v3 isEqualToString:@"clock-reticle-view"])
  {
    v4 = @"clock.complication.label";
    goto LABEL_4;
  }
  if ([v3 isEqualToString:@"contact-reticle-view"])
  {
    v4 = @"contact.complication.label";
    goto LABEL_4;
  }
  if (![v3 isEqualToString:@"inline-widget-reticle-view"])
  {
    v13.receiver = self;
    v13.super_class = (Class)PREditingReticleViewAccessibility;
    uint64_t v5 = [(PREditingReticleViewAccessibility *)&v13 _accessibilityAXAttributedLabel];
    goto LABEL_5;
  }
  [(PREditingReticleViewAccessibility *)self _axSetRemoteViews];
  v8 = [(PREditingReticleViewAccessibility *)self _accessibilityGetRemoteElement];
  id v9 = objc_alloc(MEMORY[0x263F21660]);
  v10 = accessibilityLocalizedString(@"inline.complication.label");
  v6 = (void *)[v9 initWithString:v10];

  if (v8)
  {
    v11 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "remotePid"));
    [v6 setAttribute:v11 forKey:*MEMORY[0x263F216B0]];

    v12 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v8, "uuidHash"));
    [v6 setAttribute:v12 forKey:*MEMORY[0x263F216B8]];
  }
LABEL_6:

  return v6;
}

- (id)accessibilityHint
{
  id v3 = [(PREditingReticleViewAccessibility *)self accessibilityIdentifier];
  if ([v3 isEqualToString:@"grouped-widgets-reticle-view"])
  {
    v8.receiver = self;
    v8.super_class = (Class)PREditingReticleViewAccessibility;
    uint64_t v4 = [(PREditingReticleViewAccessibility *)&v8 accessibilityHint];
  }
  else
  {
    if (([v3 isEqualToString:@"clock-reticle-view"] & 1) != 0
      || [v3 isEqualToString:@"contact-reticle-view"])
    {
      uint64_t v5 = @"font.reticle.view.hint";
    }
    else
    {
      uint64_t v5 = @"reticle.view.hint";
    }
    uint64_t v4 = accessibilityLocalizedString(v5);
  }
  v6 = (void *)v4;

  return v6;
}

- (BOOL)isAccessibilityElement
{
  id v3 = [(PREditingReticleViewAccessibility *)self _axPosterEditorViewController];
  char v4 = [v3 safeBoolForKey:@"isComplicationsRowConfigured"];
  char v5 = [v3 safeBoolForKey:@"isComplicationSidebarConfigured"];
  v6 = [v3 safeUIViewForKey:@"complicationRowEmptyStateView"];
  v7 = [v3 safeUIViewForKey:@"complicationSidebarEmptyStateView"];
  objc_super v8 = [(PREditingReticleViewAccessibility *)self accessibilityIdentifier];
  char v9 = [v8 isEqualToString:@"grouped-widgets-reticle-view"];

  if (v9)
  {
    v10 = v6;
    char v5 = v4;
  }
  else
  {
    v11 = [(PREditingReticleViewAccessibility *)self accessibilityIdentifier];
    int v12 = [v11 isEqualToString:@"grouped-widgets-reticle-sidebar-view"];

    v10 = v7;
    if (!v12)
    {
      char v14 = 1;
      goto LABEL_8;
    }
  }
  [v10 alpha];
  if (v13 == 1.0) {
    char v14 = v5 ^ 1;
  }
  else {
    char v14 = 0;
  }
LABEL_8:

  return v14;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)PREditingReticleViewAccessibility;
  return *MEMORY[0x263F1CEE8] | [(PREditingReticleViewAccessibility *)&v3 accessibilityTraits];
}

- (BOOL)_accessibilityShouldUseHostContextIDForPress
{
  v2 = [(PREditingReticleViewAccessibility *)self accessibilityIdentifier];
  if ([v2 isEqualToString:@"clock-reticle-view"]) {
    LOBYTE(v3) = 0;
  }
  else {
    int v3 = [v2 isEqualToString:@"contact-reticle-view"] ^ 1;
  }

  return v3;
}

- (id)accessibilityElements
{
  v18[1] = *MEMORY[0x263EF8340];
  int v3 = [(PREditingReticleViewAccessibility *)self _axPosterEditorViewController];
  objc_opt_class();
  char v4 = [v3 safeValueForKeyPath:@"complicationHostViewController"];
  char v5 = __UIAccessibilityCastAsClass();

  v6 = [v5 view];

  int v7 = [v3 safeBoolForKey:@"isComplicationsRowConfigured"];
  int v8 = [v3 safeBoolForKey:@"isComplicationSidebarConfigured"];
  char v9 = [(PREditingReticleViewAccessibility *)self accessibilityIdentifier];
  int v10 = [v9 isEqualToString:@"grouped-widgets-reticle-view"];

  if (v10) {
    BOOL v11 = v7 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    v18[0] = v6;
    char v14 = (void **)v18;
LABEL_8:
    v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
    goto LABEL_10;
  }
  int v12 = [(PREditingReticleViewAccessibility *)self accessibilityIdentifier];
  int v13 = [v12 isEqualToString:@"grouped-widgets-reticle-sidebar-view"] & v8;

  if (v13 == 1)
  {
    v17 = v6;
    char v14 = &v17;
    goto LABEL_8;
  }
  v15 = 0;
LABEL_10:

  return v15;
}

- (BOOL)accessibilityElementsHidden
{
  objc_opt_class();
  int v3 = __UIAccessibilityCastAsClass();
  char v4 = [v3 window];
  char v5 = [v4 windowScene];
  uint64_t v6 = [v5 interfaceOrientation];

  int v7 = [(PREditingReticleViewAccessibility *)self accessibilityIdentifier];
  if ([v7 isEqualToString:@"grouped-widgets-reticle-view"]) {
    BOOL v8 = (unint64_t)(v6 - 3) >= 2;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    unint64_t v9 = v6 - 1;
    int v10 = [(PREditingReticleViewAccessibility *)self accessibilityIdentifier];
    char v11 = [v10 isEqualToString:@"grouped-widgets-reticle-sidebar-view"];
    if (v9 < 2) {
      BOOL v12 = v11;
    }
    else {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 1;
  }

  return v12;
}

- (void)_axSetRemoteViews
{
  int v3 = [(PREditingReticleViewAccessibility *)self _accessibilityGetRemoteElement];
  if (!v3)
  {
    char v4 = [(PREditingReticleViewAccessibility *)self _accessibilityWindowScene];
    char v5 = [v4 safeValueForKeyPath:@"_FBSScene.hostProcess"];
    uint64_t v6 = [v5 safeIntForKey:@"pid"];

    uint64_t v7 = [(PREditingReticleViewAccessibility *)self _accessibilityContextId];
    int v3 = 0;
    if (v6)
    {
      if (v7)
      {
        BOOL v8 = (void *)[objc_alloc(MEMORY[0x263F21678]) initWithUUID:@"posterboard.posterkit.top.widget" andRemotePid:v6 andContextId:v7];
        [v8 setOnClientSide:1];
        [(PREditingReticleViewAccessibility *)self _accessibilitySetRemoteElement:v8];

        int v3 = 0;
      }
    }
  }
}

@end