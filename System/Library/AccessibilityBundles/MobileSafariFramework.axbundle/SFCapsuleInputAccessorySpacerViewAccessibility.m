@interface SFCapsuleInputAccessorySpacerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityIsKeyboardPassthroughInputAccessoryView;
@end

@implementation SFCapsuleInputAccessorySpacerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SFCapsuleInputAccessorySpacerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityIsKeyboardPassthroughInputAccessoryView
{
  return 1;
}

@end