@interface SUCellConfigurationAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
@end

@implementation SUCellConfigurationAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUCellConfiguration";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

@end