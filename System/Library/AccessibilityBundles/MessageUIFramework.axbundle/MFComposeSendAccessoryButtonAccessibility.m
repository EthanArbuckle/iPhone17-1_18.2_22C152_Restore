@interface MFComposeSendAccessoryButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation MFComposeSendAccessoryButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MFComposeSendAccessoryButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"send.button");
}

@end