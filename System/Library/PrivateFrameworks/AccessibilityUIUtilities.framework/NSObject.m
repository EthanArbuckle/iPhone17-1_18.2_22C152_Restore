@interface NSObject
@end

@implementation NSObject

uint64_t __90__NSObject_NSObjectAccessibilityUI___accessibilityUIFindAnyAXDescendant_byAddingElements___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (a3)
  {
    if (result) {
      *a3 = 1;
    }
  }
  return result;
}

void __75__NSObject_NSObjectAccessibilityUI___accessibilityUIFindSubviewDescendant___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v6 = objc_msgSend(v5, "subviews", 0);
    v7 = [v6 reverseObjectEnumerator];
    v8 = [v7 allObjects];

    uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          [v4 addObject:*(void *)(*((void *)&v13 + 1) + 8 * v12++)];
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }
  }
}

uint64_t __53__NSObject_QSSupport__accessibilityQuickSpeakContent__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  [*(id *)(a1 + 32) appendString:a2];
  uint64_t result = [*(id *)(a1 + 40) count];
  if (result - 1 != a3)
  {
    v6 = *(void **)(a1 + 32);
    return [v6 appendString:@", "];
  }
  return result;
}

BOOL __58__NSObject_QSSupport__accessibilitySentenceRectsForRange___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 end];
  unint64_t v6 = [v2 comparePosition:v4 toPosition:v5];

  return v6 > 1;
}

BOOL __65__NSObject_AXATV_Extras___atvaccessibilityGeometricNearestHeader__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 accessibilityTraits];
  return (*MEMORY[0x1E4FB2550] & v2) != 0;
}

@end