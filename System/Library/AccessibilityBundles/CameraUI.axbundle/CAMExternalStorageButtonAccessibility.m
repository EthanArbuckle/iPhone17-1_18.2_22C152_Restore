@interface CAMExternalStorageButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityValue;
@end

@implementation CAMExternalStorageButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMExternalStorageButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityValue
{
  return accessibilityCameraUILocalizedString(@"on.state");
}

@end