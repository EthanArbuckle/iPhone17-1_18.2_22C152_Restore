@interface SUSubtitledButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation SUSubtitledButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUSubtitledButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  v7.receiver = self;
  v7.super_class = (Class)SUSubtitledButtonAccessibility;
  v3 = [(SUSubtitledButtonAccessibility *)&v7 accessibilityLabel];
  v6 = [(SUSubtitledButtonAccessibility *)self safeValueForKey:@"currentSubtitle"];
  v4 = __UIAXStringForVariables();

  return v4;
}

@end