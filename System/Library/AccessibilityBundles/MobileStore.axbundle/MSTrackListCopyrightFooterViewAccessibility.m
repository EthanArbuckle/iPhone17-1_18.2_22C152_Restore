@interface MSTrackListCopyrightFooterViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation MSTrackListCopyrightFooterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MSTrackListCopyrightFooterView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)MEMORY[0x270F9A6F8](MEMORY[0x263F8B098], a2);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(MSTrackListCopyrightFooterViewAccessibility *)self safeValueForKey:@"text"];
}

@end