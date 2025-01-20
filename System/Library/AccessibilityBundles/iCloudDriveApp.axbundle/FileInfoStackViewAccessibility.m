@interface FileInfoStackViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
@end

@implementation FileInfoStackViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"FileInfoStackView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

@end