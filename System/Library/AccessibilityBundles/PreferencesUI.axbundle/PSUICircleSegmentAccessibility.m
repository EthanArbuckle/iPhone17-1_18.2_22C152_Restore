@interface PSUICircleSegmentAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (unint64_t)accessibilityTraits;
@end

@implementation PSUICircleSegmentAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PSUICircleSegment";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)MEMORY[0x270F9A6F8](MEMORY[0x263F8B098], a2);
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)PSUICircleSegmentAccessibility;
  [(PSUICircleSegmentAccessibility *)&v3 accessibilityTraits];
  return _AXTraitsRemoveTrait();
}

@end