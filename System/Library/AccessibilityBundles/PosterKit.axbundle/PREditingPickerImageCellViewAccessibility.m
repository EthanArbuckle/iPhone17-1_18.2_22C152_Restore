@interface PREditingPickerImageCellViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axLabelForSymbolName:(id)a3;
- (id)accessibilityLabel;
@end

@implementation PREditingPickerImageCellViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PREditingPickerImageCellView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PREditingPickerImageCellView", @"contentImageView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIImageView", @"image", "@", 0);
  [v3 validateClass:@"UIImage" hasInstanceVariable:@"_imageAsset" withType:"UIImageAsset"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIImageAsset", @"assetName", "@", 0);
}

- (id)accessibilityLabel
{
  id v3 = [(PREditingPickerImageCellViewAccessibility *)self safeValueForKey:@"contentImageView"];
  v11.receiver = self;
  v11.super_class = (Class)PREditingPickerImageCellViewAccessibility;
  v4 = [(PREditingPickerImageCellViewAccessibility *)&v11 accessibilityLabel];
  if ([v4 length]) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v3 == 0;
  }
  if (!v5)
  {
    v6 = [v3 safeValueForKey:@"image"];
    v7 = [v6 safeValueForKey:@"_imageAsset"];
    v8 = [v7 safeStringForKey:@"assetName"];

    uint64_t v9 = [(PREditingPickerImageCellViewAccessibility *)self _axLabelForSymbolName:v8];

    v4 = (void *)v9;
  }

  return v4;
}

- (id)_axLabelForSymbolName:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"banner.horizontal.filled.top.iphone"]) {
    goto LABEL_2;
  }
  if ([v3 isEqualToString:@"banner.vertical.filled.topright.iphone"]
    || [v3 isEqualToString:@"textbox.vertical.filled.topright.iphone"]
    || [v3 isEqualToString:@"textbox.vertical.filled.topright.ipad"]
    || [v3 isEqualToString:@"textbox.vertical.filled.topright.ipad.landscape"])
  {
    v4 = @"title.layout.vertical";
    goto LABEL_8;
  }
  if ([v3 isEqualToString:@"textbox.horizontal.filled.top.iphone"]
    || [v3 isEqualToString:@"textbox.horizontal.filled.top.ipad"]
    || [v3 isEqualToString:@"textbox.horizontal.filled.top.ipad.landscape"])
  {
LABEL_2:
    v4 = @"title.layout.horizontal";
LABEL_8:
    uint64_t v5 = accessibilityLocalizedString(v4);
    goto LABEL_9;
  }
  uint64_t v5 = accessibilityUIKitSymbolNamesLocalizedString();
LABEL_9:
  v6 = (void *)v5;

  return v6;
}

@end