@interface SFDialogViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (int64_t)accessibilityContainerType;
@end

@implementation SFDialogViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SFDialogView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (int64_t)accessibilityContainerType
{
  return 10;
}

@end