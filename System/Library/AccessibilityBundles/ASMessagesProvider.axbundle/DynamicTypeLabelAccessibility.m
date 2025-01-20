@interface DynamicTypeLabelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
@end

@implementation DynamicTypeLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ASMessagesProvider.DynamicTypeLabel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

@end