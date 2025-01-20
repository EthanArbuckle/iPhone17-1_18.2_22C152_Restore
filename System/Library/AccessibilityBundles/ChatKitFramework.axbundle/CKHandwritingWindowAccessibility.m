@interface CKHandwritingWindowAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
@end

@implementation CKHandwritingWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKHandwritingWindow";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

@end