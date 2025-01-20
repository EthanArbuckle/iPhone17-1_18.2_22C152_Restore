@interface OBTintInheritingImageViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
@end

@implementation OBTintInheritingImageViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"OBTintInheritingImageView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  v2 = [(OBTintInheritingImageViewAccessibility *)self isAccessibilityUserDefinedElement];
  v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

@end