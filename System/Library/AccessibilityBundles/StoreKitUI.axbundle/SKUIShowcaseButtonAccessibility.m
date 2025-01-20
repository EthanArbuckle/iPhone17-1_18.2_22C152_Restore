@interface SKUIShowcaseButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
@end

@implementation SKUIShowcaseButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKUIShowcaseButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

@end