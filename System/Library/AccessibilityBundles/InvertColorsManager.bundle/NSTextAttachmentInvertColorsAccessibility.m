@interface NSTextAttachmentInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)setImage:(id)a3;
@end

@implementation NSTextAttachmentInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NSTextAttachment";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)setImage:(id)a3
{
  id v4 = a3;
  if (([(NSTextAttachmentInvertColorsAccessibility *)self _accessibilityBoolValueForKey:@"IsInvertingImage"] & 1) == 0)
  {
    uint64_t v5 = +[AXInvertColorsAppHelper invertImage:v4];

    if (v5)
    {
      [(NSTextAttachmentInvertColorsAccessibility *)self _accessibilitySetBoolValue:UIAccessibilityIsInvertColorsEnabled() forKey:@"InvertState"];
      id v4 = (id)v5;
    }
    else
    {
      id v4 = 0;
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)NSTextAttachmentInvertColorsAccessibility;
  [(NSTextAttachmentInvertColorsAccessibility *)&v6 setImage:v4];
}

@end