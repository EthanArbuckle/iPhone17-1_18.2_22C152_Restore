@interface _TVProductTemplateControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)_atvaccessibilitySemanticContextViewIdentifier;
@end

@implementation _TVProductTemplateControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_TVProductTemplateController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_atvaccessibilitySemanticContextViewIdentifier
{
  return @"productPage";
}

@end