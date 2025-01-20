@interface FEFocusMap
@end

@implementation FEFocusMap

void __54___FEFocusMap__inferredDefaultFocusItemInEnvironment___block_invoke(void *a1, void *a2, unsigned char *a3)
{
  v5 = (void *)a1[4];
  id v6 = a2;
  [v5 addObject:v6];
  id v7 = (id)a1[5];

  if (v7 == v6)
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    *a3 = 1;
  }
}

uint64_t __103___FEFocusMap__nextFocusedItemForLinearFocusMovementRequest_startingFromRegion_inRegions_withSnapshot___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  id v4 = a2;
  v5 = [v3 searchInfo];
  uint64_t IsFocusableInFocusSystemWithSearchInfo = _FEFocusItemIsFocusableInFocusSystemWithSearchInfo(v4, v2, v5);

  return IsFocusableInFocusSystemWithSearchInfo;
}

uint64_t __76___FEFocusMap__linearlySortedFocusItemsForItems_groupFilter_itemStandInMap___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = [*(id *)(*(void *)(a1 + 32) + 48) focusGroupForItem:a2];
  uint64_t v4 = [v3 isEqualToFocusGroup:*(void *)(a1 + 40)];

  return v4;
}

uint64_t __76___FEFocusMap__linearlySortedFocusItemsForItems_groupFilter_itemStandInMap___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  return _FEFocusItemCompare(a2, a3);
}

@end