@interface SBScreenshotManagerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
@end

@implementation SBScreenshotManagerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBScreenshotManager";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

@end