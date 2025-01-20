@interface QLItemAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)createPreviewContext;
@end

@implementation QLItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"QLItem";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"QLItem", @"previewItemURL", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"QLItem", @"createPreviewContext", "@", 0);
}

- (id)createPreviewContext
{
  v8.receiver = self;
  v8.super_class = (Class)QLItemAccessibility;
  id v3 = [(QLItemAccessibility *)&v8 createPreviewContext];
  v4 = [(QLItemAccessibility *)self safeValueForKey:@"previewItemURL"];
  v5 = __UIAccessibilitySafeClass();

  v6 = UIAccessibilityMetadataDescriptionForImage();
  [v3 setAccessibilityLabel:v6];

  return v3;
}

@end