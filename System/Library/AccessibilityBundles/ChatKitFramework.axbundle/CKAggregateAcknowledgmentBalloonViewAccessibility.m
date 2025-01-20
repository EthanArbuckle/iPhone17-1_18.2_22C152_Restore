@interface CKAggregateAcknowledgmentBalloonViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
@end

@implementation CKAggregateAcknowledgmentBalloonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKAggregateAcknowledgmentBalloonView";
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