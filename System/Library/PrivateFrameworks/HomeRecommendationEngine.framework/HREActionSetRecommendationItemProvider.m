@interface HREActionSetRecommendationItemProvider
- (HFTransformItemProvider)transformItemProvider;
- (HMHome)home;
- (HREActionSetRecommendationItemProvider)initWithHome:(id)a3 andServiceLikeItems:(id)a4;
- (HRERecommendationItemProvider)recommendationProvider;
- (NSArray)serviceLikeItems;
- (id)filter;
- (id)items;
- (id)reloadItems;
- (id)suggestionItemTransformingRecommendationItem:(id)a3;
- (unint64_t)engineOptions;
- (void)setEngineOptions:(unint64_t)a3;
- (void)setFilter:(id)a3;
- (void)setRecommendationProvider:(id)a3;
- (void)setTransformItemProvider:(id)a3;
@end

@implementation HREActionSetRecommendationItemProvider

- (HREActionSetRecommendationItemProvider)initWithHome:(id)a3 andServiceLikeItems:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)HREActionSetRecommendationItemProvider;
  v9 = [(HFItemProvider *)&v23 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a3);
    objc_storeStrong((id *)&v10->_serviceLikeItems, a4);
    v11 = [[HRERecommendationItemProvider alloc] initWithHome:v7 andServiceLikeItems:v8];
    recommendationProvider = v10->_recommendationProvider;
    v10->_recommendationProvider = v11;

    [(HRERecommendationItemProvider *)v10->_recommendationProvider setEngineOptions:1];
    objc_initWeak(&location, v10);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __75__HREActionSetRecommendationItemProvider_initWithHome_andServiceLikeItems___block_invoke;
    v20[3] = &unk_264CF46A8;
    objc_copyWeak(&v21, &location);
    [(HRERecommendationItemProvider *)v10->_recommendationProvider setFilter:v20];
    id v13 = objc_alloc(MEMORY[0x263F47C40]);
    v14 = [(HREActionSetRecommendationItemProvider *)v10 recommendationProvider];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __75__HREActionSetRecommendationItemProvider_initWithHome_andServiceLikeItems___block_invoke_2;
    v18[3] = &unk_264CF46D0;
    objc_copyWeak(&v19, &location);
    uint64_t v15 = [v13 initWithSourceProvider:v14 transformationBlock:v18];
    transformItemProvider = v10->_transformItemProvider;
    v10->_transformItemProvider = (HFTransformItemProvider *)v15;

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v10;
}

uint64_t __75__HREActionSetRecommendationItemProvider_initWithHome_andServiceLikeItems___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v5 = [WeakRetained filter];
    if (v5)
    {
      v6 = [WeakRetained filter];
      uint64_t v7 = ((uint64_t (**)(void, id))v6)[2](v6, v3);
    }
    else
    {
      uint64_t v7 = 1;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

id __75__HREActionSetRecommendationItemProvider_initWithHome_andServiceLikeItems___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v5 = [WeakRetained suggestionItemTransformingRecommendationItem:v3];

  return v5;
}

- (unint64_t)engineOptions
{
  v2 = [(HREActionSetRecommendationItemProvider *)self recommendationProvider];
  unint64_t v3 = [v2 engineOptions];

  return v3;
}

- (void)setEngineOptions:(unint64_t)a3
{
  id v4 = [(HREActionSetRecommendationItemProvider *)self recommendationProvider];
  [v4 setEngineOptions:a3];
}

- (id)items
{
  v2 = [(HREActionSetRecommendationItemProvider *)self transformItemProvider];
  unint64_t v3 = [v2 items];

  return v3;
}

- (id)reloadItems
{
  v2 = [(HREActionSetRecommendationItemProvider *)self transformItemProvider];
  unint64_t v3 = [v2 reloadItems];

  return v3;
}

- (id)suggestionItemTransformingRecommendationItem:(id)a3
{
  id v4 = a3;
  v5 = [[HREActionSetRecommendationItem alloc] initWithRecommendationItem:v4];

  v6 = [(HREActionSetRecommendationItemProvider *)self serviceLikeItems];
  uint64_t v7 = [v6 firstObject];
  [(HREActionSetRecommendationItem *)v5 setServiceLikeItem:v7];

  return v5;
}

- (HMHome)home
{
  return self->_home;
}

- (NSArray)serviceLikeItems
{
  return self->_serviceLikeItems;
}

- (id)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
}

- (HRERecommendationItemProvider)recommendationProvider
{
  return self->_recommendationProvider;
}

- (void)setRecommendationProvider:(id)a3
{
}

- (HFTransformItemProvider)transformItemProvider
{
  return self->_transformItemProvider;
}

- (void)setTransformItemProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transformItemProvider, 0);
  objc_storeStrong((id *)&self->_recommendationProvider, 0);
  objc_storeStrong(&self->_filter, 0);
  objc_storeStrong((id *)&self->_serviceLikeItems, 0);

  objc_storeStrong((id *)&self->_home, 0);
}

@end