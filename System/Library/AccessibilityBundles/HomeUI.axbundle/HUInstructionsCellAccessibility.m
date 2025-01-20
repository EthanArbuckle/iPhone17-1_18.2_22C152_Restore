@interface HUInstructionsCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)canBecomeFocused;
@end

@implementation HUInstructionsCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUInstructionsCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)canBecomeFocused
{
  return 0;
}

@end