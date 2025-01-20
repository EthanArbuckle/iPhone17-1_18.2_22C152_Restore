@interface HighlightTextViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityCanDrag;
@end

@implementation HighlightTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SequoiaTranslator.HighlightTextView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityCanDrag
{
  return 0;
}

@end