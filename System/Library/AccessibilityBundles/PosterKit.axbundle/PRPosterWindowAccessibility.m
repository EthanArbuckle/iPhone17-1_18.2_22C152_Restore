@interface PRPosterWindowAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityIsUserInteractionEnabled;
@end

@implementation PRPosterWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PRPosterWindow";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityIsUserInteractionEnabled
{
  return 1;
}

@end