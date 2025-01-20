@interface QLMediaUIScrollViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_axIsDragging;
- (BOOL)isDragging;
- (void)_axSetIsDragging:(BOOL)a3;
@end

@implementation QLMediaUIScrollViewAccessibility

- (BOOL)isDragging
{
  v3 = [(QLMediaUIScrollViewAccessibility *)self accessibilityIdentification];
  if (![v3 isEqualToString:@"MediaScrubber"])
  {

    goto LABEL_7;
  }
  BOOL v4 = [(QLMediaUIScrollViewAccessibility *)self _axIsDragging];

  if (!v4)
  {
LABEL_7:
    v6.receiver = self;
    v6.super_class = (Class)QLMediaUIScrollViewAccessibility;
    return [(QLMediaUIScrollViewAccessibility *)&v6 isDragging];
  }

  return [(QLMediaUIScrollViewAccessibility *)self _axIsDragging];
}

+ (id)safeCategoryTargetClassName
{
  return @"UIScrollView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_axIsDragging
{
  return MEMORY[0x270F09620](self, &__QLMediaUIScrollViewAccessibility___axIsDragging);
}

- (void)_axSetIsDragging:(BOOL)a3
{
}

@end