@interface NSObject
- (id)_accessibilityRingsDescription;
- (id)_fitnessUIAccessibilityDescriptionForPercentages:(double)a3 exercisingPercentage:(double)a4 standingPercentage:(double)a5 arePercentagesCapped:(BOOL)a6;
- (void)_accessibilitySetRingsDescription:(id)a3;
@end

@implementation NSObject

- (id)_accessibilityRingsDescription
{
  return (id)___UIAccessibilityGetAssociatedObject(self, &__NSObject___accessibilityRingsDescription);
}

- (void)_accessibilitySetRingsDescription:(id)a3
{
}

- (id)_fitnessUIAccessibilityDescriptionForPercentages:(double)a3 exercisingPercentage:(double)a4 standingPercentage:(double)a5 arePercentagesCapped:(BOOL)a6
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__2;
  v12 = __Block_byref_object_dispose__2;
  id v13 = 0;
  AXPerformSafeBlock();
  id v6 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v6;
}

uint64_t __137__NSObject_AXFitnessPriv___fitnessUIAccessibilityDescriptionForPercentages_exercisingPercentage_standingPercentage_arePercentagesCapped___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) accessibilityDescriptionForPercentages:*(unsigned __int8 *)(a1 + 72) exercisingPercentage:*(double *)(a1 + 48) standingPercentage:*(double *)(a1 + 56) arePercentagesCapped:*(double *)(a1 + 64)];

  return _objc_release_x1();
}

@end