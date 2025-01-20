@interface MTAddPodcastCellAccessoryViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation MTAddPodcastCellAccessoryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MTAddPodcastCellAccessoryView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2 = *MEMORY[0x263F1CEE8];
  v3 = [(MTAddPodcastCellAccessoryViewAccessibility *)self safeValueForKey:@"superview"];
  uint64_t v4 = [v3 accessibilityTraits];
  uint64_t v5 = *MEMORY[0x263F1CF20];

  if ((v5 & v4) != 0) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  return v6 | v2;
}

- (id)accessibilityLabel
{
  uint64_t v2 = [(MTAddPodcastCellAccessoryViewAccessibility *)self safeValueForKey:@"isAdded"];
  int v3 = [v2 BOOLValue];

  if (v3) {
    uint64_t v4 = @"selected";
  }
  else {
    uint64_t v4 = @"not.selected";
  }
  uint64_t v5 = accessibilityLocalizedString(v4);

  return v5;
}

@end