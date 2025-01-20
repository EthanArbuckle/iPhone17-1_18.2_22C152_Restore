@interface PGHostedWindowAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (unsigned)_accessibilityContextId;
@end

@implementation PGHostedWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PGHostedWindow";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unsigned)_accessibilityContextId
{
  return 0;
}

@end