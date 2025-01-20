@interface NTKFaceAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityFaceEditOptionsDescription;
- (id)_accessibilityFaceStyleDescription;
@end

@implementation NTKFaceAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTKFace";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKFace", @"faceStyle", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKFace", @"faceDescription", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKFace", @"configuration", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKFace", @"_customEditModes", "@", 0);
  [v3 validateClass:@"NTKEditOption"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKEditOption", @"localizedName", "@", 0);
  [v3 validateClass:@"NTKFaceConfiguration"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKFaceConfiguration", @"optionForCustomEditMode: slot:", "@", "q", "@", 0);
}

- (id)_accessibilityFaceStyleDescription
{
  return [(NTKFaceAccessibility *)self safeStringForKey:@"faceDescription"];
}

- (id)_accessibilityFaceEditOptionsDescription
{
  v13 = +[NSMutableArray array];
  id v3 = [(NTKFaceAccessibility *)self safeValueForKey:@"configuration"];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  char v22 = 0;
  objc_opt_class();
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  id v21 = 0;
  AXPerformSafeBlock();
  id v4 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  __UIAccessibilityCastAsClass();
  id obj = (id)objc_claimAutoreleasedReturnValue();

  if (v22) {
    abort();
  }
  id v5 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v24;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(obj);
        }
        [*(id *)(*((void *)&v23 + 1) + 8 * i) integerValue];
        uint64_t v16 = 0;
        v17 = &v16;
        uint64_t v18 = 0x3032000000;
        v19 = __Block_byref_object_copy_;
        v20 = __Block_byref_object_dispose_;
        id v21 = 0;
        id v15 = v3;
        AXPerformSafeBlock();
        id v8 = (id)v17[5];

        _Block_object_dispose(&v16, 8);
        if (v8)
        {
          uint64_t v16 = 0;
          v17 = &v16;
          uint64_t v18 = 0x3032000000;
          v19 = __Block_byref_object_copy_;
          v20 = __Block_byref_object_dispose_;
          id v21 = 0;
          id v14 = v8;
          AXPerformSafeBlock();
          id v9 = (id)v17[5];

          _Block_object_dispose(&v16, 8);
          if (([v13 containsObject:v9] & 1) == 0) {
            [v13 axSafelyAddObject:v9];
          }
        }
      }
      id v5 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v5);
  }

  v10 = UIAXLabelForElements();

  return v10;
}

uint64_t __64__NTKFaceAccessibility__accessibilityFaceEditOptionsDescription__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _customEditModes];

  return _objc_release_x1();
}

uint64_t __64__NTKFaceAccessibility__accessibilityFaceEditOptionsDescription__block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) optionForCustomEditMode:*(void *)(a1 + 48) slot:0];

  return _objc_release_x1();
}

uint64_t __64__NTKFaceAccessibility__accessibilityFaceEditOptionsDescription__block_invoke_3(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) safeValueForKey:@"localizedName"];

  return _objc_release_x1();
}

@end