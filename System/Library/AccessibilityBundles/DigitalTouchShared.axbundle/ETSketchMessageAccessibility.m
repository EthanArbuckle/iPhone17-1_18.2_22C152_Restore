@interface ETSketchMessageAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityColorOfStroke:(unint64_t)a3;
- (id)_accessibilityMessageTypeString;
- (id)_accessibilityStringForColorCounts:(id)a3;
- (id)_accessibilityStrokeDescription;
- (id)_accessibilityUIColorFromETColor:(id)a3;
- (id)accessibilityLabel;
- (void)_accessibilityIncrementNumberOfKey:(id)a3 inDictionary:(id)a4;
@end

@implementation ETSketchMessageAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ETSketchMessage";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"ETSketchMessage" isKindOfClass:@"ETMessage"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ETMessage", @"color", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ETSketchMessage", @"strokes", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ETSketchMessage", @"colorsInMessage", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ETSketchMessage", @"numberOfColors", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ETSketchMessage", @"hasMultipleColors", "B", 0);
}

- (id)accessibilityLabel
{
  id v3 = NSString;
  v4 = accessibilityLocalizedString(@"sketch.message");
  v5 = [(ETSketchMessageAccessibility *)self _accessibilityStrokeDescription];
  v6 = objc_msgSend(v3, "stringWithFormat:", v4, v5);

  return v6;
}

- (id)_accessibilityMessageTypeString
{
  return accessibilityLocalizedString(@"sketch");
}

- (id)_accessibilityStrokeDescription
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  char v11 = 0;
  objc_opt_class();
  v4 = [(ETSketchMessageAccessibility *)self safeValueForKey:@"strokes"];
  v5 = __UIAccessibilityCastAsClass();

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __63__ETSketchMessageAccessibility__accessibilityStrokeDescription__block_invoke;
  v9[3] = &unk_26511CD40;
  v9[4] = self;
  id v10 = v3;
  id v6 = v3;
  [v5 enumerateObjectsUsingBlock:v9];

  v7 = [(ETSketchMessageAccessibility *)self _accessibilityStringForColorCounts:v6];

  return v7;
}

void __63__ETSketchMessageAccessibility__accessibilityStrokeDescription__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_accessibilityColorOfStroke:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) _accessibilityIncrementNumberOfKey:v2 inDictionary:*(void *)(a1 + 40)];
}

- (id)_accessibilityStringForColorCounts:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy_;
  char v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __67__ETSketchMessageAccessibility__accessibilityStringForColorCounts___block_invoke;
  v6[3] = &unk_26511CD68;
  v6[4] = &v7;
  [v3 enumerateKeysAndObjectsUsingBlock:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __67__ETSketchMessageAccessibility__accessibilityStringForColorCounts___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v5 = NSString;
  id v6 = a3;
  id v7 = a2;
  v8 = accessibilityLocalizedString(@"stroke.color.description");
  uint64_t v9 = [v6 integerValue];

  objc_msgSend(v5, "localizedStringWithFormat:", v8, v9);
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  id v10 = [v7 axColorStringForSpeaking];

  uint64_t v11 = __AXStringForVariables();
  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;
}

- (void)_accessibilityIncrementNumberOfKey:(id)a3 inDictionary:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v5 objectForKey:v6];
  v8 = NSNumber;
  id v11 = v7;
  if (v7) {
    uint64_t v9 = [v7 integerValue] + 1;
  }
  else {
    uint64_t v9 = 1;
  }
  id v10 = [v8 numberWithInteger:v9];
  [v5 setObject:v10 forKey:v6];
}

- (id)_accessibilityColorOfStroke:(unint64_t)a3
{
  if ([(ETSketchMessageAccessibility *)self safeBoolForKey:@"hasMultipleColors"])
  {
    uint64_t v6 = 0;
    id v7 = &v6;
    uint64_t v8 = 0x3032000000;
    uint64_t v9 = __Block_byref_object_copy_;
    id v10 = __Block_byref_object_dispose_;
    id v11 = 0;
    AXPerformSafeBlock();
    id v4 = (id)v7[5];
    _Block_object_dispose(&v6, 8);
  }
  else
  {
    id v4 = [(ETSketchMessageAccessibility *)self safeValueForKey:@"color"];
  }

  return v4;
}

void __60__ETSketchMessageAccessibility__accessibilityColorOfStroke___block_invoke(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) safeValueForKey:@"numberOfColors"];
  unint64_t v4 = [v3 integerValue];

  if (v2 < v4)
  {
    id v8 = [*(id *)(a1 + 32) safeValueForKey:@"_colorsInMessage"];
    uint64_t v5 = [v8 objectAtIndex:*(void *)(a1 + 48)];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

- (id)_accessibilityUIColorFromETColor:(id)a3
{
  return (id)[MEMORY[0x263F1C550] colorWithRed:(double)a3.var0 / 255.0 green:(double)a3.var1 / 255.0 blue:(double)a3.var2 / 255.0 alpha:(double)a3.var3 / 255.0];
}

@end