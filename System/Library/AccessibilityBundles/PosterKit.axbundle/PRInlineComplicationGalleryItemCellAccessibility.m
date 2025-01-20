@interface PRInlineComplicationGalleryItemCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityCustomContent;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation PRInlineComplicationGalleryItemCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PRInlineComplicationGalleryItemCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PRInlineComplicationGalleryItemCell", @"title", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PRInlineComplicationGalleryItemCell", @"contentViewController", "@", 0);
  [v3 validateClass:@"CHUISWidgetHostViewController" hasInstanceVariable:@"_descriptor" withType:"CHSWidgetDescriptor"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PRInlineComplicationGalleryItemCell", @"showsCheckmark", "B", 0);
}

- (id)accessibilityLabel
{
  id v3 = [(PRInlineComplicationGalleryItemCellAccessibility *)self safeValueForKey:@"contentViewController"];
  NSClassFromString(&cfstr_Chuiswidgethos.isa);
  if (objc_opt_isKindOfClass())
  {
    v4 = [(PRInlineComplicationGalleryItemCellAccessibility *)self safeValueForKeyPath:@"contentViewController._descriptor"];
    v5 = AXWidgetAndAppName(v4, 1);
  }
  else
  {
    v5 = [(PRInlineComplicationGalleryItemCellAccessibility *)self safeStringForKey:@"title"];
  }

  return v5;
}

- (id)accessibilityCustomContent
{
  id v3 = [(PRInlineComplicationGalleryItemCellAccessibility *)self safeValueForKey:@"contentViewController"];
  NSClassFromString(&cfstr_Chuiswidgethos.isa);
  if (objc_opt_isKindOfClass())
  {
    v4 = [(PRInlineComplicationGalleryItemCellAccessibility *)self safeValueForKeyPath:@"contentViewController._descriptor"];
  }
  else
  {
    v4 = 0;
  }
  v5 = AXWidgetDescription(v4);
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)PRInlineComplicationGalleryItemCellAccessibility;
    id v7 = [(PRInlineComplicationGalleryItemCellAccessibility *)&v10 accessibilityCustomContent];
  }
  v8 = v7;

  return v8;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)PRInlineComplicationGalleryItemCellAccessibility;
  unint64_t v3 = *MEMORY[0x263F1CEE8] | [(PRInlineComplicationGalleryItemCellAccessibility *)&v7 accessibilityTraits];
  int v4 = [(PRInlineComplicationGalleryItemCellAccessibility *)self safeBoolForKey:@"showsCheckmark"];
  uint64_t v5 = *MEMORY[0x263F1CF38];
  if (!v4) {
    uint64_t v5 = 0;
  }
  return v3 | v5;
}

@end