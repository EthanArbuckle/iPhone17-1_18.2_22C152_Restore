@interface MPAVItemAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabelForAlbum;
@end

@implementation MPAVItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MPAVItem";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabelForAlbum
{
  return (id)[(MPAVItemAccessibility *)self safeValueForKey:@"album"];
}

@end