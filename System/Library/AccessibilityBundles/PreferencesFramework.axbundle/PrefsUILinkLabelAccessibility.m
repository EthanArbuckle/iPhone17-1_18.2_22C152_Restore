@interface PrefsUILinkLabelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (unint64_t)accessibilityTraits;
@end

@implementation PrefsUILinkLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PrefsUILinkLabel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF10];
}

@end