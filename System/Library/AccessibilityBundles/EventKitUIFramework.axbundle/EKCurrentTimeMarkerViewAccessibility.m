@interface EKCurrentTimeMarkerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilitySupportsContentSizeCategory:(id)a3;
@end

@implementation EKCurrentTimeMarkerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"EKCurrentTimeMarkerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilitySupportsContentSizeCategory:(id)a3
{
  return (id)*MEMORY[0x263F1D180] == a3 || *MEMORY[0x263F1D130] == (void)a3;
}

@end