@interface TVShowPlayBarViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityPerformMoreAction:(id)a3;
- (BOOL)_accessibilityPerformPlayAction:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_axContextActionButton;
- (id)_axPlayButton;
- (id)accessibilityCustomActions;
- (id)accessibilityLabel;
- (id)automationElements;
@end

@implementation TVShowPlayBarViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicApplication.TVShowPlayBarView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.TVShowPlayBarView", @"title", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.TVShowPlayBarView", @"accessibilityPlayButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.TVShowPlayBarView", @"accessibilityContextualActionsButton", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(TVShowPlayBarViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"title"];
}

- (id)_axPlayButton
{
  objc_opt_class();
  id v3 = [(TVShowPlayBarViewAccessibility *)self safeValueForKey:@"accessibilityPlayButton"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = accessibilityMusicLocalizedString(@"play.button");
  [v4 setAccessibilityLabel:v5];

  return v4;
}

- (id)_axContextActionButton
{
  objc_opt_class();
  id v3 = [(TVShowPlayBarViewAccessibility *)self safeValueForKey:@"accessibilityContextualActionsButton"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = accessibilityMusicLocalizedString(@"more.button");
  [v4 setAccessibilityLabel:v5];

  return v4;
}

- (BOOL)_accessibilityPerformMoreAction:(id)a3
{
  id v3 = [(TVShowPlayBarViewAccessibility *)self _axContextActionButton];
  [v3 accessibilityActivate];

  return 1;
}

- (BOOL)_accessibilityPerformPlayAction:(id)a3
{
  id v3 = [(TVShowPlayBarViewAccessibility *)self _axPlayButton];
  [v3 accessibilityActivate];

  return 1;
}

- (id)accessibilityCustomActions
{
  id v3 = [MEMORY[0x263EFF980] array];
  v4 = [(TVShowPlayBarViewAccessibility *)self _axPlayButton];

  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x263F1C390]);
    v6 = accessibilityMusicLocalizedString(@"play.button");
    v7 = (void *)[v5 initWithName:v6 target:self selector:sel__accessibilityPerformPlayAction_];

    [v3 addObject:v7];
  }
  v8 = [(TVShowPlayBarViewAccessibility *)self _axContextActionButton];

  if (v8)
  {
    id v9 = objc_alloc(MEMORY[0x263F1C390]);
    v10 = accessibilityMusicLocalizedString(@"more.button");
    v11 = (void *)[v9 initWithName:v10 target:self selector:sel__accessibilityPerformMoreAction_];

    [v3 addObject:v11];
  }
  v15.receiver = self;
  v15.super_class = (Class)TVShowPlayBarViewAccessibility;
  v12 = [(TVShowPlayBarViewAccessibility *)&v15 accessibilityCustomActions];
  v13 = [v3 arrayByAddingObjectsFromArray:v12];

  return v13;
}

- (id)automationElements
{
  v11.receiver = self;
  v11.super_class = (Class)TVShowPlayBarViewAccessibility;
  id v3 = [(TVShowPlayBarViewAccessibility *)&v11 automationElements];
  v4 = (void *)[v3 mutableCopy];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [MEMORY[0x263EFF980] array];
  }
  v7 = v6;

  v8 = [(TVShowPlayBarViewAccessibility *)self _axPlayButton];
  [v7 axSafelyAddObject:v8];

  id v9 = [(TVShowPlayBarViewAccessibility *)self _axContextActionButton];
  [v7 axSafelyAddObject:v9];

  return v7;
}

@end