@interface _UITextAttachmentDrawingViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
@end

@implementation _UITextAttachmentDrawingViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UITextAttachmentDrawingView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

@end