@interface DynamicTypeTextViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
@end

@implementation DynamicTypeTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AppInstallExtension.DynamicTypeTextView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

@end