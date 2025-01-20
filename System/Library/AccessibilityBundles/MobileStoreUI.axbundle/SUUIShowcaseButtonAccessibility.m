@interface SUUIShowcaseButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
@end

@implementation SUUIShowcaseButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUUIShowcaseButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

@end