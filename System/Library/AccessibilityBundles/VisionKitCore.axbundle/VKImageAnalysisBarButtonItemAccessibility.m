@interface VKImageAnalysisBarButtonItemAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)imageForMode:(unint64_t)a3;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
@end

@implementation VKImageAnalysisBarButtonItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VKImageAnalysisBarButtonItem";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

+ (id)imageForMode:(unint64_t)a3
{
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___VKImageAnalysisBarButtonItemAccessibility;
  v4 = objc_msgSendSuper2(&v7, sel_imageForMode_);
  v5 = AXImageAnalysisLabel(a3);
  if (v5) {
    [v4 setAccessibilityLabel:v5];
  }

  return v4;
}

@end