@interface HUQuickControlSingleItemPredicate
+ (id)predicateWithControlItemClass:(Class)a3;
- (BOOL)matchesControlItem:(id)a3;
- (HUQuickControlSingleItemPredicate)initWithBlock:(id)a3;
- (id)block;
- (id)matchingControlItemsForControlItems:(id)a3;
- (unint64_t)maximumNumberOfMatches;
- (void)setBlock:(id)a3;
@end

@implementation HUQuickControlSingleItemPredicate

+ (id)predicateWithControlItemClass:(Class)a3
{
  v4 = [HUQuickControlSingleItemPredicate alloc];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__HUQuickControlSingleItemPredicate_predicateWithControlItemClass___block_invoke;
  v7[3] = &__block_descriptor_40_e23_B16__0__HFControlItem_8lu32l8;
  v7[4] = a3;
  v5 = [(HUQuickControlSingleItemPredicate *)v4 initWithBlock:v7];

  return v5;
}

uint64_t __67__HUQuickControlSingleItemPredicate_predicateWithControlItemClass___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

- (HUQuickControlSingleItemPredicate)initWithBlock:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HUQuickControlSingleItemPredicate;
  v5 = [(HUQuickControlSingleItemPredicate *)&v8 init];
  v6 = v5;
  if (v5) {
    [(HUQuickControlSingleItemPredicate *)v5 setBlock:v4];
  }

  return v6;
}

- (BOOL)matchesControlItem:(id)a3
{
  id v4 = a3;
  v5 = [(HUQuickControlSingleItemPredicate *)self block];
  if (v5)
  {
    v6 = [(HUQuickControlSingleItemPredicate *)self block];
    char v7 = ((uint64_t (**)(void, id))v6)[2](v6, v4);
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)matchingControlItemsForControlItems:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1C978];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__HUQuickControlSingleItemPredicate_matchingControlItemsForControlItems___block_invoke;
  v7[3] = &unk_1E6384EB8;
  v7[4] = self;
  id v4 = objc_msgSend(a3, "na_firstObjectPassingTest:", v7);
  v5 = objc_msgSend(v3, "na_arrayWithSafeObject:", v4);

  return v5;
}

uint64_t __73__HUQuickControlSingleItemPredicate_matchingControlItemsForControlItems___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) matchesControlItem:a2];
}

- (unint64_t)maximumNumberOfMatches
{
  return 1;
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end