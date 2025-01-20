@interface SBBookmarkIconAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
@end

@implementation SBBookmarkIconAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBBookmarkIcon";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

@end