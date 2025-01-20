@interface PGProgressIndicatorAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (id)accessibilityLabel;
@end

@implementation PGProgressIndicatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PGProgressIndicator";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PGProgressIndicator", @"progress", "d", 0);
  [v3 validateClass:@"PGProgressIndicator" hasInstanceVariable:@"_elapsedTrack" withType:"PGVibrantFillView"];
  [v3 validateClass:@"PGMaterialView"];
  [v3 validateClass:@"PGProgressIndicator" hasInstanceVariable:@"_completeTrack" withType:"PGVibrantFillView"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  [(PGProgressIndicatorAccessibility *)self safeCGFloatForKey:@"progress"];
  v2 = accessibilityLocalizedString(@"pip.playback.progress");
  id v3 = NSString;
  v4 = AXFormatFloatWithPercentage();
  v5 = objc_msgSend(v3, "stringWithFormat:", v2, v4);

  return v5;
}

- (CGRect)accessibilityFrame
{
  id v3 = [(PGProgressIndicatorAccessibility *)self safeUIViewForKey:@"_elapsedTrack"];
  [v3 safeCGRectForKey:@"bounds"];
  unint64_t v5 = v4;
  unint64_t v7 = v6;
  unint64_t v9 = v8;
  unint64_t v11 = v10;

  v12.n128_u64[0] = v5;
  v13.n128_u64[0] = v7;
  v14.n128_u64[0] = v9;
  v15.n128_u64[0] = v11;

  MEMORY[0x270F80998](self, v12, v13, v14, v15);
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

@end