@interface NowPlayingQueueCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation NowPlayingQueueCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Music.NowPlayingQueueCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"Music.NowPlayingQueueCell" hasSwiftField:@"title" withSwiftType:"Optional<String>"];
  [v3 validateClass:@"Music.NowPlayingQueueCell" hasSwiftField:@"subtitle" withSwiftType:"Optional<String>"];
  [v3 validateClass:@"Music.NowPlayingQueueCell" hasSwiftField:@"explicitBadgeLabel" withSwiftType:"UILabel"];
  [v3 validateClass:@"Music.NowPlayingQueueCell" hasSwiftField:@"isExplicit" withSwiftType:"Bool"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  objc_opt_class();
  id v3 = [(NowPlayingQueueCellAccessibility *)self safeSwiftValueForKey:@"explicitBadgeLabel"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [(NowPlayingQueueCellAccessibility *)self safeSwiftStringForKey:@"title"];
  v6 = [(NowPlayingQueueCellAccessibility *)self safeSwiftStringForKey:@"subtitle"];
  if ([(NowPlayingQueueCellAccessibility *)self safeSwiftBoolForKey:@"isExplicit"])
  {
    v9 = [v4 accessibilityLabel];
    v7 = __AXStringForVariables();
  }
  else
  {
    v7 = __AXStringForVariables();
  }

  return v7;
}

@end