@interface OBContentViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityOverridesInvalidFrames;
@end

@implementation OBContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"OBContentView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityOverridesInvalidFrames
{
  return 1;
}

@end