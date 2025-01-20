@interface HSPCSuggestedAutomationsItemManager
- (HSPCSuggestedAutomationsItemManager)initWithDelegate:(id)a3 serviceLikeItems:(id)a4;
- (HUAvailableRelatedTriggerItemModule)recommendationModule;
- (HUAvailableRelatedTriggerItemModuleContext)context;
- (NSArray)serviceLikeItems;
- (id)_buildItemModulesForHome:(id)a3;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (id)_itemsToHideInSet:(id)a3;
- (void)setContext:(id)a3;
- (void)setRecommendationModule:(id)a3;
- (void)setServiceLikeItems:(id)a3;
@end

@implementation HSPCSuggestedAutomationsItemManager

- (HSPCSuggestedAutomationsItemManager)initWithDelegate:(id)a3 serviceLikeItems:(id)a4
{
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HSPCSuggestedAutomationsItemManager;
  v8 = [(HSPCSuggestedAutomationsItemManager *)&v14 initWithDelegate:a3];
  if (v8)
  {
    v9 = HFLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Using following service items:", v13, 2u);
    }

    [v7 na_each:&stru_1000A97C8];
    objc_storeStrong((id *)&v8->_serviceLikeItems, a4);
    v10 = (HUAvailableRelatedTriggerItemModuleContext *)objc_alloc_init((Class)HUAvailableRelatedTriggerItemModuleContext);
    context = v8->_context;
    v8->_context = v10;

    [(HUAvailableRelatedTriggerItemModuleContext *)v8->_context setEngineOptions:(unint64_t)[(HUAvailableRelatedTriggerItemModuleContext *)v8->_context engineOptions] & 0xFFFFFFFFFFFFFFEFLL];
    [(HUAvailableRelatedTriggerItemModuleContext *)v8->_context setShowsIcons:1];
    [(HUAvailableRelatedTriggerItemModuleContext *)v8->_context setHidesAddAutomationItem:1];
    [(HUAvailableRelatedTriggerItemModuleContext *)v8->_context setCommitsAutomatically:0];
    [(HUAvailableRelatedTriggerItemModuleContext *)v8->_context setItemsAreEditable:0];
    [(HUAvailableRelatedTriggerItemModuleContext *)v8->_context setHidesCustomTriggers:1];
    [(HUAvailableRelatedTriggerItemModuleContext *)v8->_context setErrorHandlingStrategy:0];
    [(HUAvailableRelatedTriggerItemModuleContext *)v8->_context setAnalyticsPresentationContext:@"setup"];
    [(HUAvailableRelatedTriggerItemModuleContext *)v8->_context setShowNaturalLightingItem:1];
  }

  return v8;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  v3 = [(HSPCSuggestedAutomationsItemManager *)self serviceLikeItems];
  v4 = +[NSSet setWithArray:v3];

  id v5 = [objc_alloc((Class)HFStaticItemProvider) initWithItems:v4];
  id v8 = v5;
  v6 = +[NSArray arrayWithObjects:&v8 count:1];

  return v6;
}

- (id)_itemsToHideInSet:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HSPCSuggestedAutomationsItemManager;
  id v5 = [(HSPCSuggestedAutomationsItemManager *)&v16 _itemsToHideInSet:v4];
  id v6 = [v5 mutableCopy];

  id v7 = [(HSPCSuggestedAutomationsItemManager *)self serviceLikeItems];
  [v6 addObjectsFromArray:v7];

  id v8 = [(HSPCSuggestedAutomationsItemManager *)self recommendationModule];

  if (v8)
  {
    v9 = [(HSPCSuggestedAutomationsItemManager *)self recommendationModule];
    v10 = [v9 itemsToHideInSet:v4];
    [v6 unionSet:v10];
  }
  v11 = HFLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10001AE0C;
    v15[3] = &unk_1000A97F0;
    v15[4] = self;
    v12 = [v6 na_map:v15];
    *(_DWORD *)buf = 138412290;
    v18 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Hiding items: %@", buf, 0xCu);
  }
  id v13 = [v6 copy];

  return v13;
}

- (id)_buildItemModulesForHome:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)HUAvailableRelatedTriggerItemModule);
  id v6 = [(HSPCSuggestedAutomationsItemManager *)self serviceLikeItems];
  id v7 = [(HSPCSuggestedAutomationsItemManager *)self context];
  id v8 = (HUAvailableRelatedTriggerItemModule *)[v5 initWithItems:v6 itemUpdater:self home:v4 context:v7];

  recommendationModule = self->_recommendationModule;
  self->_recommendationModule = v8;

  v10 = [(HSPCSuggestedAutomationsItemManager *)self recommendationModule];
  id v13 = v10;
  v11 = +[NSArray arrayWithObjects:&v13 count:1];

  return v11;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  id v4 = a3;
  id v5 = [(HSPCSuggestedAutomationsItemManager *)self recommendationModule];
  id v6 = [v5 buildSectionsWithDisplayedItems:v4];
  id v7 = [v6 firstObject];
  id v8 = [v7 mutableCopy];

  [v8 setFooterTitle:0];
  [v8 setHeaderTitle:0];
  [v8 setAttributedFooterTitle:0];
  v9 = +[NSArray na_arrayWithSafeObject:v8];
  v10 = +[HFItemSection filterSections:v9 toDisplayedItems:v4];

  return v10;
}

- (NSArray)serviceLikeItems
{
  return self->_serviceLikeItems;
}

- (void)setServiceLikeItems:(id)a3
{
}

- (HUAvailableRelatedTriggerItemModule)recommendationModule
{
  return self->_recommendationModule;
}

- (void)setRecommendationModule:(id)a3
{
}

- (HUAvailableRelatedTriggerItemModuleContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_recommendationModule, 0);

  objc_storeStrong((id *)&self->_serviceLikeItems, 0);
}

@end