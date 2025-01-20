@interface CKMessagePartHighlightBalloonViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
@end

@implementation CKMessagePartHighlightBalloonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKMessagePartHighlightBalloonView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

@end