@interface HUAccessorySceneListContentItem
- (HFServiceLikeItem)serviceLikeItem;
- (HMHome)home;
- (HUAccessorySceneListContentItem)initWithContentSource:(unint64_t)a3 serviceLikeItem:(id)a4 home:(id)a5;
- (id)_subclass_updateWithOptions:(id)a3;
- (unint64_t)contentSource;
@end

@implementation HUAccessorySceneListContentItem

- (HUAccessorySceneListContentItem)initWithContentSource:(unint64_t)a3 serviceLikeItem:(id)a4 home:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HUAccessorySceneListContentItem;
  v11 = [(HUAccessorySceneListContentItem *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_contentSource = a3;
    objc_storeStrong((id *)&v11->_serviceLikeItem, a4);
    objc_storeStrong((id *)&v12->_home, a5);
  }

  return v12;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  unint64_t v4 = [(HUAccessorySceneListContentItem *)self contentSource];
  v5 = [(HUAccessorySceneListContentItem *)self serviceLikeItem];
  v6 = [(HUAccessorySceneListContentItem *)self home];
  v7 = +[HUAccessorySceneListContentItemManager computeNumberOfItemsToDisplayForContentSource:v4 serviceLikeItem:v5 home:v6];

  v8 = [v7 flatMap:&__block_literal_global_212];

  return v8;
}

id __63__HUAccessorySceneListContentItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F692F0];
  id v3 = a2;
  id v4 = objc_alloc_init(v2);
  v5 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v4 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F68900]];

  v6 = NSNumber;
  uint64_t v7 = [v3 unsignedIntegerValue];

  v8 = [v6 numberWithInt:v7 == 0];
  [v4 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F68B10]];

  id v9 = [MEMORY[0x1E4F7A0D8] futureWithResult:v4];

  return v9;
}

- (unint64_t)contentSource
{
  return self->_contentSource;
}

- (HFServiceLikeItem)serviceLikeItem
{
  return self->_serviceLikeItem;
}

- (HMHome)home
{
  return self->_home;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);

  objc_storeStrong((id *)&self->_serviceLikeItem, 0);
}

@end