@interface PersonHeightViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)toggleViewVisibilityWithIsVisible:(BOOL)a3;
@end

@implementation PersonHeightViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Measure.PersonHeightView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Measure.PersonHeightView", @"toggleViewVisibilityWithIsVisible:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Measure.PersonHeightView", @"_accessibilitySpeakableHeight", "@", 0);
}

- (void)toggleViewVisibilityWithIsVisible:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PersonHeightViewAccessibility;
  -[PersonHeightViewAccessibility toggleViewVisibilityWithIsVisible:](&v9, sel_toggleViewVisibilityWithIsVisible_);
  if (v3)
  {
    v5 = [(PersonHeightViewAccessibility *)self safeStringForKey:@"_accessibilitySpeakableHeight"];
    v6 = NSString;
    v7 = accessibilityLocalizedString(@"HEIGHT_ANNOUNCEMENT");
    v8 = objc_msgSend(v6, "localizedStringWithFormat:", v7, v5);

    AXMeasureSpeakMeasurementAnnouncement(v8);
  }
}

@end