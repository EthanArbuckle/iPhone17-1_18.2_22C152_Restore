@interface MKTransitArtworkManagerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
@end

@implementation MKTransitArtworkManagerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MKTransitArtworkManager";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

@end