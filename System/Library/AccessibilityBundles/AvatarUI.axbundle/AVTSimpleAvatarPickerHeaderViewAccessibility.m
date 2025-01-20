@interface AVTSimpleAvatarPickerHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation AVTSimpleAvatarPickerHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVTSimpleAvatarPickerHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (id)accessibilityLabel
{
  v3 = [(AVTSimpleAvatarPickerHeaderViewAccessibility *)self safeStringForKey:@"currentSymbolName"];
  if ([v3 isEqualToString:@"ellipsis"])
  {
    v4 = @"more.options";
LABEL_5:
    uint64_t v5 = accessibilityLocalizedString(v4);
    goto LABEL_7;
  }
  if ([v3 isEqualToString:@"plus"])
  {
    v4 = @"starfish.add";
    goto LABEL_5;
  }
  v8.receiver = self;
  v8.super_class = (Class)AVTSimpleAvatarPickerHeaderViewAccessibility;
  uint64_t v5 = [(AVTSimpleAvatarPickerHeaderViewAccessibility *)&v8 accessibilityLabel];
LABEL_7:
  v6 = (void *)v5;

  return v6;
}

@end