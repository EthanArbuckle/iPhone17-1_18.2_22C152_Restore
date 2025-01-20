@interface HUQuickControlGridItemPredicate
- (id)matchingControlItemsForControlItems:(id)a3;
- (unint64_t)maximumNumberOfMatches;
@end

@implementation HUQuickControlGridItemPredicate

- (id)matchingControlItemsForControlItems:(id)a3
{
  id v3 = a3;
  int v4 = objc_msgSend(v3, "na_any:", &__block_literal_global_1);
  if ((unint64_t)[v3 count] > 1
    || v4 && [MEMORY[0x1E4F69758] isAMac])
  {
    id v5 = v3;
  }
  else
  {
    id v5 = (id)objc_opt_new();
  }
  v6 = v5;

  return v6;
}

uint64_t __71__HUQuickControlGridItemPredicate_matchingControlItemsForControlItems___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (unint64_t)maximumNumberOfMatches
{
  return 1;
}

@end