@interface MFComposeRecipientAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation MFComposeRecipientAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MFComposeRecipient";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return (id)[(MFComposeRecipientAccessibility *)self safeValueForKey:@"displayString"];
}

@end