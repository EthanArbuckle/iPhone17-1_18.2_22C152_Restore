@interface PosterBoardUIApplicationAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation PosterBoardUIApplicationAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PosterBoardApplication";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return &stru_26F77D650;
}

@end