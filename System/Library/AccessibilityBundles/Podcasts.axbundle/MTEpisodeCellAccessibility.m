@interface MTEpisodeCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilitySupplementaryFooterViews;
- (id)_axLockup;
- (id)_privateAccessibilityCustomActions;
- (id)accessibilityLabel;
- (id)automationElements;
- (unint64_t)accessibilityTraits;
- (void)setExpanded:(BOOL)a3;
@end

@implementation MTEpisodeCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MTEpisodeCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTEpisodeCell", @"setExpanded:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UITableViewCell", @"_accessibilityClearChildren", "v", 0);
  [v3 validateClass:@"MTEpisodeCell" isKindOfClass:@"UITableViewCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTEpisodeCell", @"episodeLockup", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UITableViewCell", @"isSelected", "B", 0);
}

- (void)setExpanded:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MTEpisodeCellAccessibility;
  [(MTEpisodeCellAccessibility *)&v4 setExpanded:a3];
  [(MTEpisodeCellAccessibility *)self _accessibilityClearChildren];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (id)_axLockup
{
  v2 = [(MTEpisodeCellAccessibility *)self safeValueForKey:@"episodeLockup"];
  id v3 = v2;
  if (v2) {
    id v4 = v2;
  }

  return v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(MTEpisodeCellAccessibility *)self _axLockup];

  if (v3)
  {
    id v4 = [(MTEpisodeCellAccessibility *)self _axLockup];
    v5 = [v4 accessibilityLabel];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_accessibilitySupplementaryFooterViews
{
  id v3 = [(MTEpisodeCellAccessibility *)self _axLockup];

  if (v3)
  {
    id v4 = [(MTEpisodeCellAccessibility *)self _axLockup];
    v5 = [v4 _accessibilitySupplementaryFooterViews];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_privateAccessibilityCustomActions
{
  id v3 = [(MTEpisodeCellAccessibility *)self _axLockup];

  if (v3)
  {
    id v4 = [(MTEpisodeCellAccessibility *)self _axLockup];
    v5 = [v4 _privateAccessibilityCustomActions];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)accessibilityTraits
{
  v8.receiver = self;
  v8.super_class = (Class)MTEpisodeCellAccessibility;
  unint64_t v3 = *MEMORY[0x263F1CEE8] | [(MTEpisodeCellAccessibility *)&v8 accessibilityTraits] | *MEMORY[0x263F1CF40];
  id v4 = [(MTEpisodeCellAccessibility *)self safeValueForKey:@"isSelected"];
  int v5 = [v4 BOOLValue];

  uint64_t v6 = *MEMORY[0x263F1CF38];
  if (!v5) {
    uint64_t v6 = 0;
  }
  return v3 | v6;
}

- (id)automationElements
{
  unint64_t v3 = [(MTEpisodeCellAccessibility *)self _axLockup];

  if (v3)
  {
    id v4 = [(MTEpisodeCellAccessibility *)self _axLockup];
    int v5 = [v4 automationElements];
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

@end