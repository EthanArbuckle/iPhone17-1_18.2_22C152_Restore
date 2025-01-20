@interface PUOneUpViewController_QSExtras
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)_accessibilityQuickSpeakContent;
@end

@implementation PUOneUpViewController_QSExtras

+ (id)safeCategoryTargetClassName
{
  return @"PUOneUpViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityQuickSpeakContent
{
  return 0;
}

@end