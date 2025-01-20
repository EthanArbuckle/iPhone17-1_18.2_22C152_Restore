@interface NTKAnalogFaceViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation NTKAnalogFaceViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTKAnalogFaceView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"NTKAnalogFaceView" isKindOfClass:@"NTKFaceView"];
  [v3 validateClass:@"NTKFaceView" hasInstanceVariable:@"_timeView" withType:"UIView<NTKTimeView>"];
  [v3 validateClass:@"NTKAnalogFaceView" hasInstanceVariable:@"_complicationDisplayWrappers" withType:"NSMutableDictionary"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKAnalogFaceView", @"_isComplicationSlotInsideDial:", "B", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)NTKAnalogFaceViewAccessibility;
  [(NTKAnalogFaceViewAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(NTKAnalogFaceViewAccessibility *)self safeValueForKey:@"_timeView"];
  [v3 _setAccessibilityServesAsFirstElement:1];
  [v3 _setAccessibilityLabelBlock:&__block_literal_global_2];
  [v3 _accessibilitySetOverridesInvisibility:1];
}

NSString *__cdecl __76__NTKAnalogFaceViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(id a1)
{
  return (NSString *)AXClockTimeVoiceOverSpokenStringForWatchFaces();
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v23 = a4;
  v24 = [(NTKAnalogFaceViewAccessibility *)self safeDictionaryForKey:@"_complicationDisplayWrappers"];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = [v24 allKeys];
  id v7 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v38;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v38 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v37 + 1) + 8 * i);
        uint64_t v33 = 0;
        v34 = &v33;
        uint64_t v35 = 0x2020000000;
        char v36 = 0;
        v26 = _NSConcreteStackBlock;
        uint64_t v27 = 3221225472;
        v28 = __66__NTKAnalogFaceViewAccessibility__accessibilityHitTest_withEvent___block_invoke;
        v29 = &unk_24660;
        uint64_t v31 = v10;
        v32 = &v33;
        v30 = self;
        AXPerformSafeBlock();
        int v11 = *((unsigned __int8 *)v34 + 24);
        _Block_object_dispose(&v33, 8);
        if (v11)
        {
          LOBYTE(v33) = 0;
          objc_opt_class();
          v12 = [v24 objectForKeyedSubscript:v10];
          v13 = __UIAccessibilityCastAsClass();

          if ((_BYTE)v33) {
            abort();
          }
          LOBYTE(v33) = 0;
          objc_opt_class();
          uint64_t v14 = __UIAccessibilityCastAsClass();
          if ((_BYTE)v33) {
            abort();
          }
          v15 = (void *)v14;
          objc_msgSend(v13, "convertPoint:fromView:", v14, x, y);
          double v17 = v16;
          double v19 = v18;

          if (objc_msgSend(v13, "pointInside:withEvent:", v23, v17, v19))
          {
            v20 = objc_msgSend(v13, "_accessibilityHitTest:withEvent:", v23, v17, v19);

            goto LABEL_15;
          }
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  v25.receiver = self;
  v25.super_class = (Class)NTKAnalogFaceViewAccessibility;
  v20 = -[NTKAnalogFaceViewAccessibility _accessibilityHitTest:withEvent:](&v25, "_accessibilityHitTest:withEvent:", v23, x, y);
LABEL_15:

  return v20;
}

id __66__NTKAnalogFaceViewAccessibility__accessibilityHitTest_withEvent___block_invoke(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) _isComplicationSlotInsideDial:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = (_BYTE)result;
  return result;
}

@end