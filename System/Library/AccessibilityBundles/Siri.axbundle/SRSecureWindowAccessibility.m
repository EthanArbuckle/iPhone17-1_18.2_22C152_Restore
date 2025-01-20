@interface SRSecureWindowAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityShouldIncludeKeyboardInRemoteSubstituteChildren;
@end

@implementation SRSecureWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SRSecureWindow";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityShouldIncludeKeyboardInRemoteSubstituteChildren
{
  return 1;
}

@end