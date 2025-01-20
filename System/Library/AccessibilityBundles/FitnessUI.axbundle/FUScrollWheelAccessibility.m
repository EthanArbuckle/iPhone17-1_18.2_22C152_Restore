@interface FUScrollWheelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)accessibilityDecrement;
- (void)accessibilityElementDidBecomeFocused;
- (void)accessibilityIncrement;
- (void)scrollViewDidEndDecelerating:(id)a3;
@end

@implementation FUScrollWheelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"FUScrollWheel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FUScrollWheel", @"delegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FUScrollWheel", @"currentIndex", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FUScrollWheel", @"setCurrentIndex:", "v", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FUScrollWheel", @"_alertDidChangeToCurrentIndex:", "v", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FUScrollWheel", @"_setActiveScrollwheelIfNotActive", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FUScrollWheel", @"scrollViewDidEndDecelerating:", "v", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)FUScrollWheelAccessibility;
  return UIAccessibilityTraitAdjustable | [(FUScrollWheelAccessibility *)&v3 accessibilityTraits] | UIAccessibilityTraitPickerElement;
}

- (id)accessibilityValue
{
  v2 = [(FUScrollWheelAccessibility *)self safeValueForKey:@"delegate"];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = 0;
    v7 = &v6;
    uint64_t v8 = 0x3032000000;
    v9 = __Block_byref_object_copy__2;
    v10 = __Block_byref_object_dispose__2;
    id v11 = 0;
    id v5 = v2;
    AXPerformSafeBlock();
    id v3 = (id)v7[5];

    _Block_object_dispose(&v6, 8);
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

uint64_t __48__FUScrollWheelAccessibility_accessibilityValue__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "scrollWheel:titleForItemAtIndex:", *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 40), "safeUnsignedIntegerForKey:", @"currentIndex"));

  return _objc_release_x1();
}

- (void)accessibilityIncrement
{
  id v3 = [(FUScrollWheelAccessibility *)self safeValueForKey:@"delegate"];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [(FUScrollWheelAccessibility *)self safeUnsignedIntegerForKey:@"currentIndex"];
    uint64_t v7 = 0;
    uint64_t v8 = &v7;
    uint64_t v9 = 0x2020000000;
    uint64_t v10 = 0;
    id v6 = v3;
    AXPerformSafeBlock();
    unint64_t v5 = v8[3];

    _Block_object_dispose(&v7, 8);
    if ((unint64_t)v4 + 1 < v5) {
      AXPerformSafeBlock();
    }
  }
}

id __52__FUScrollWheelAccessibility_accessibilityIncrement__block_invoke(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) numberOfRowsInScrollWheel:*(void *)(a1 + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

id __52__FUScrollWheelAccessibility_accessibilityIncrement__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setCurrentIndex:*(void *)(a1 + 40) + 1];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40) - 1;

  return [v2 _alertDidChangeToCurrentIndex:v3];
}

- (void)accessibilityDecrement
{
  if ([(FUScrollWheelAccessibility *)self safeUnsignedIntegerForKey:@"currentIndex"])
  {
    AXPerformSafeBlock();
  }
}

id __52__FUScrollWheelAccessibility_accessibilityDecrement__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setCurrentIndex:*(void *)(a1 + 40) - 1];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40) - 1;

  return [v2 _alertDidChangeToCurrentIndex:v3];
}

- (void)accessibilityElementDidBecomeFocused
{
}

id __66__FUScrollWheelAccessibility_accessibilityElementDidBecomeFocused__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setActiveScrollwheelIfNotActive];
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FUScrollWheelAccessibility;
  [(FUScrollWheelAccessibility *)&v6 scrollViewDidEndDecelerating:a3];
  if (UIAccessibilityIsVoiceOverRunning())
  {
    id v4 = [(FUScrollWheelAccessibility *)self accessibilityValue];
    if ([v4 length])
    {
      id v5 = [objc_alloc((Class)AXAttributedString) initWithString:v4];
      [v5 setAttribute:&__kCFBooleanTrue forKey:kAXPageScrollIsCrownScroll];
      [v5 setAttribute:&__kCFBooleanTrue forKey:kAXPageScrollShouldSpeakElement];
      UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, v5);
    }
  }
}

@end