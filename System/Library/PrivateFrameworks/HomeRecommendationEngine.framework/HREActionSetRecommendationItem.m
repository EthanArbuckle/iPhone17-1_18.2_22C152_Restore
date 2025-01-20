@interface HREActionSetRecommendationItem
- (HFServiceLikeItem)serviceLikeItem;
- (HREActionSetRecommendation)recommendation;
- (HREActionSetRecommendationItem)init;
- (HREActionSetRecommendationItem)initWithRecommendationItem:(id)a3;
- (HRERecommendationItem)recommendationItem;
- (id)_subclass_updateWithOptions:(id)a3;
- (void)setServiceLikeItem:(id)a3;
@end

@implementation HREActionSetRecommendationItem

- (HREActionSetRecommendationItem)initWithRecommendationItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HREActionSetRecommendationItem;
  v6 = [(HREActionSetRecommendationItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_recommendationItem, a3);
  }

  return v7;
}

- (HREActionSetRecommendationItem)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  id v5 = NSStringFromSelector(sel_initWithRecommendationItem_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HREActionSetRecommendationItem.m", 25, @"%s is unavailable; use %@ instead",
    "-[HREActionSetRecommendationItem init]",
    v5);

  return 0;
}

- (HREActionSetRecommendation)recommendation
{
  objc_opt_class();
  v3 = [(HREActionSetRecommendationItem *)self recommendationItem];
  v4 = [v3 recommendation];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  return (HREActionSetRecommendation *)v6;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = [(HREActionSetRecommendationItem *)self recommendationItem];
  id v6 = [v5 updateWithOptions:v4];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __62__HREActionSetRecommendationItem__subclass_updateWithOptions___block_invoke;
  v10[3] = &unk_264CF3C28;
  v10[4] = self;
  id v11 = v4;
  id v7 = v4;
  v8 = [v6 flatMap:v10];

  return v8;
}

id __62__HREActionSetRecommendationItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)[a2 mutableCopy];
  id v4 = [*(id *)(a1 + 32) recommendation];
  id v5 = [v4 selectedActionSetBuilder];
  [v3 setObject:v5 forKeyedSubscript:*MEMORY[0x263F479F8]];

  id v6 = NSNumber;
  id v7 = [*(id *)(a1 + 32) recommendation];
  v8 = objc_msgSend(v6, "numberWithInt:", objc_msgSend(v7, "containsMeaningfulChanges") ^ 1);
  [v3 setObject:v8 forKeyedSubscript:*MEMORY[0x263F47A40]];

  objc_super v9 = [*(id *)(a1 + 32) serviceLikeItem];

  if (v9)
  {
    id v10 = objc_alloc(MEMORY[0x263F47AE0]);
    id v11 = [*(id *)(a1 + 32) recommendation];
    v12 = [v11 selectedActionSetBuilder];
    v13 = (void *)[v10 initWithActionSetBuilder:v12];

    v14 = [*(id *)(a1 + 32) serviceLikeItem];
    v15 = (void *)[v14 copyWithValueSource:v13];

    id v16 = objc_alloc(MEMORY[0x263F47C18]);
    v17 = [*(id *)(a1 + 32) recommendation];
    v18 = [v17 home];
    v19 = (void *)[v16 initWithHome:v18 containingItem:v15];

    v20 = (void *)MEMORY[0x263EFFA08];
    v21 = [*(id *)(a1 + 32) recommendation];
    v22 = [v21 selectedActionSetBuilder];
    v23 = [v22 actions];
    v24 = [v20 setWithArray:v23];
    [v19 setActionBuilders:v24];

    v25 = [v19 updateWithOptions:*(void *)(a1 + 40)];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __62__HREActionSetRecommendationItem__subclass_updateWithOptions___block_invoke_2;
    v28[3] = &unk_264CF3C00;
    id v29 = v3;
    v26 = [v25 flatMap:v28];
  }
  else
  {
    v26 = [MEMORY[0x263F58190] futureWithResult:v3];
  }

  return v26;
}

uint64_t __62__HREActionSetRecommendationItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *MEMORY[0x263F47A10];
  id v4 = [a2 objectForKeyedSubscript:*MEMORY[0x263F47A10]];
  [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:v3];

  id v5 = (void *)MEMORY[0x263F58190];
  uint64_t v6 = *(void *)(a1 + 32);

  return [v5 futureWithResult:v6];
}

- (HRERecommendationItem)recommendationItem
{
  return self->_recommendationItem;
}

- (HFServiceLikeItem)serviceLikeItem
{
  return self->_serviceLikeItem;
}

- (void)setServiceLikeItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceLikeItem, 0);

  objc_storeStrong((id *)&self->_recommendationItem, 0);
}

@end