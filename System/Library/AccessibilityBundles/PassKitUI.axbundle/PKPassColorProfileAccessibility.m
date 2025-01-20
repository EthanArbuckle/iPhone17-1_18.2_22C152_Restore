@interface PKPassColorProfileAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)_imageForGlyph:(id)a3 color:(id)a4;
@end

@implementation PKPassColorProfileAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKPassColorProfile";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_imageForGlyph:(id)a3 color:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)PKPassColorProfileAccessibility;
  id v5 = a3;
  v6 = [(PKPassColorProfileAccessibility *)&v9 _imageForGlyph:v5 color:a4];
  v7 = objc_msgSend(v5, "accessibilityIdentifier", v9.receiver, v9.super_class);

  [v6 setAccessibilityIdentifier:v7];

  return v6;
}

@end