@interface MKMapAttributionAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (MKMapAttributionAccessibility)initWithStringAttributes:(id)a3 regionalAttributions:(id)a4 underlineText:(BOOL)a5 applyLinkAttribution:(BOOL)a6 scale:(double)a7;
@end

@implementation MKMapAttributionAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MKMapAttribution";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MKMapAttribution", @"initWithStringAttributes:regionalAttributions:underlineText:applyLinkAttribution:scale:", "@", "@", "@", "B", "B", "d", 0);
  [v3 validateClass:@"MKMapAttribution" hasInstanceVariable:@"_string" withType:"NSAttributedString"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GEOAttribution", @"name", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GEOAttribution", @"logo", "@", 0);
  [v3 validateClass:@"GEOResourceManifestManager"];
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"GEOResourceManifestManager", @"modernManager", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GEOResourceManifestManager", @"activeTileGroup", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GEOActiveTileGroup", @"attributions", "@", 0);
}

- (MKMapAttributionAccessibility)initWithStringAttributes:(id)a3 regionalAttributions:(id)a4 underlineText:(BOOL)a5 applyLinkAttribution:(BOOL)a6 scale:(double)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v12 = a4;
  v33.receiver = self;
  v33.super_class = (Class)MKMapAttributionAccessibility;
  v13 = [(MKMapAttributionAccessibility *)&v33 initWithStringAttributes:a3 regionalAttributions:v12 underlineText:v9 applyLinkAttribution:v8 scale:a7];
  if (![v12 count]
    || ([v12 objectAtIndex:0], (v14 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v15 = [NSClassFromString(&cfstr_Georesourceman.isa) safeValueForKey:@"modernManager"];
    v16 = [v15 safeValueForKey:@"activeTileGroup"];
    v17 = [v16 safeArrayForKey:@"attributions"];
    v14 = [v17 firstObject];
  }
  v18 = [(MKMapAttributionAccessibility *)v13 safeValueForKey:@"_string"];
  unint64_t v31 = 0;
  uint64_t v32 = 0;
  uint64_t v19 = [v18 length];
  if (v19)
  {
    unint64_t v20 = v19;
    unint64_t v21 = 0;
    uint64_t v22 = *MEMORY[0x263F1C208];
    while (1)
    {
      v23 = [v18 attributesAtIndex:v21 effectiveRange:&v31];
      v24 = v23;
      if (v31 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      v25 = [v23 objectForKey:v22];
      if (v25)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v26 = [v25 image];

          v27 = [v14 safeValueForKey:@"name"];
          if (!v27)
          {
            v28 = [v14 safeValueForKey:@"logo"];
            int v29 = [v28 hasPrefix:@"tomtom"];

            if (v29) {
              v27 = @"TomTom";
            }
            else {
              v27 = 0;
            }
          }
          [v26 setAccessibilityLabel:v27];

          break;
        }
      }
      v31 += v32;

      unint64_t v21 = v31;
      if (v31 == 0x7FFFFFFFFFFFFFFFLL || v31 >= v20) {
        goto LABEL_18;
      }
    }
  }
LABEL_18:

  return v13;
}

@end