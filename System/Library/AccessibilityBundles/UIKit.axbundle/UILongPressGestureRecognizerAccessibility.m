@interface UILongPressGestureRecognizerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsSupportedGestureRecognizer;
@end

@implementation UILongPressGestureRecognizerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UILongPressGestureRecognizer";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UICollectionViewCell", @"_gestureRecognizerShouldBegin:", "B", "@", 0);
  objc_storeStrong(v4, obj);
}

- (BOOL)_accessibilityIsSupportedGestureRecognizer
{
  v20 = self;
  v19[1] = (id)a2;
  v19[0] = self;
  id v3 = (id)[v19[0] delegate];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v14 = 0;
    v15 = &v14;
    int v16 = 0x20000000;
    int v17 = 32;
    char v18 = 0;
    uint64_t v8 = MEMORY[0x263EF8330];
    int v9 = -1073741824;
    int v10 = 0;
    v11 = __87__UILongPressGestureRecognizerAccessibility__accessibilityIsSupportedGestureRecognizer__block_invoke;
    v12 = &unk_2650AE390;
    v13[1] = &v14;
    v13[0] = v19[0];
    AXPerformSafeBlock();
    char v7 = v15[3] & 1;
    objc_storeStrong(v13, 0);
    _Block_object_dispose(&v14, 8);
    char v21 = v7 & 1;
  }
  else
  {
    v5.receiver = v20;
    v5.super_class = (Class)UILongPressGestureRecognizerAccessibility;
    char v21 = [(UILongPressGestureRecognizerAccessibility *)&v5 _accessibilityIsSupportedGestureRecognizer];
  }
  int v6 = 1;
  objc_storeStrong(v19, 0);
  return v21 & 1;
}

void __87__UILongPressGestureRecognizerAccessibility__accessibilityIsSupportedGestureRecognizer__block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) delegate];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 _gestureRecognizerShouldBegin:*(void *)(a1 + 32)] & 1;
}

@end