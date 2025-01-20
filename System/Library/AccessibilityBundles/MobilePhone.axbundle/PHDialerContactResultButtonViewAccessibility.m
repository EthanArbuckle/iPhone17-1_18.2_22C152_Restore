@interface PHDialerContactResultButtonViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
@end

@implementation PHDialerContactResultButtonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PHDialerContactResultButtonView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

@end