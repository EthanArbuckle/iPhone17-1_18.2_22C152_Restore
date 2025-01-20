@interface HFSelectedRoomItemProvider
- (HFRoomBuilderItem)roomBuilderItem;
- (HFSelectedRoomItemProvider)init;
- (HFSelectedRoomItemProvider)initWithHome:(id)a3 serviceLikeBuilder:(id)a4;
- (HFServiceLikeBuilder)serviceLikeBuilder;
- (HMHome)home;
- (id)copyWithZone:(_NSZone *)a3;
- (id)filter;
- (id)invalidationReasons;
- (id)items;
- (id)reloadItems;
- (void)setFilter:(id)a3;
- (void)setRoomBuilderItem:(id)a3;
- (void)setServiceLikeBuilder:(id)a3;
@end

@implementation HFSelectedRoomItemProvider

- (HFSelectedRoomItemProvider)initWithHome:(id)a3 serviceLikeBuilder:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HFSelectedRoomItemProvider;
  v9 = [(HFItemProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a3);
    objc_storeStrong((id *)&v10->_serviceLikeBuilder, a4);
  }

  return v10;
}

- (HFSelectedRoomItemProvider)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithHome_serviceLikeBuilder_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFSelectedRoomItemProvider.m", 35, @"%s is unavailable; use %@ instead",
    "-[HFSelectedRoomItemProvider init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(HFSelectedRoomItemProvider *)self home];
  v6 = [(HFSelectedRoomItemProvider *)self serviceLikeBuilder];
  id v7 = (void *)[v4 initWithHome:v5 serviceLikeBuilder:v6];

  return v7;
}

- (id)reloadItems
{
  v3 = [(HFSelectedRoomItemProvider *)self roomBuilderItem];
  id v4 = [v3 roomBuilder];
  v5 = [(HFSelectedRoomItemProvider *)self serviceLikeBuilder];
  v6 = [v5 room];

  id v7 = [(HFSelectedRoomItemProvider *)self filter];

  if (v7)
  {
    id v8 = [(HFSelectedRoomItemProvider *)self filter];
    if (((unsigned int (**)(void, void *))v8)[2](v8, v6)) {
      v9 = v6;
    }
    else {
      v9 = 0;
    }
    id v10 = v9;

    v6 = v10;
  }
  if (v4 == v6) {
    int v11 = [v4 isEqual:v4] ^ 1;
  }
  else {
    int v11 = 1;
  }
  objc_super v12 = [MEMORY[0x263EFF9C0] set];
  v13 = [MEMORY[0x263EFF9C0] set];
  v14 = [MEMORY[0x263EFF9C0] set];
  if (v3) {
    int v15 = v11;
  }
  else {
    int v15 = 1;
  }
  if (v6 && v15)
  {
    v16 = [[HFRoomBuilderItem alloc] initWithRoomBuilder:v6];
    [v12 addObject:v16];
    [(HFSelectedRoomItemProvider *)self setRoomBuilderItem:v16];
  }
  if (v3 && ((v11 ^ 1) & 1) == 0) {
    [v14 addObject:v3];
  }
  if ((v15 & 1) == 0) {
    [v13 addObject:v3];
  }
  v17 = [[HFItemProviderReloadResults alloc] initWithAddedItems:v12 removedItems:v14 existingItems:v13];
  v18 = [MEMORY[0x263F58190] futureWithResult:v17];

  return v18;
}

- (id)items
{
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = [(HFSelectedRoomItemProvider *)self roomBuilderItem];
  id v4 = objc_msgSend(v2, "na_setWithSafeObject:", v3);

  return v4;
}

- (id)invalidationReasons
{
  v5.receiver = self;
  v5.super_class = (Class)HFSelectedRoomItemProvider;
  v2 = [(HFItemProvider *)&v5 invalidationReasons];
  v3 = [v2 setByAddingObject:@"room"];

  return v3;
}

- (id)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
}

- (HMHome)home
{
  return self->_home;
}

- (HFServiceLikeBuilder)serviceLikeBuilder
{
  return self->_serviceLikeBuilder;
}

- (void)setServiceLikeBuilder:(id)a3
{
}

- (HFRoomBuilderItem)roomBuilderItem
{
  return self->_roomBuilderItem;
}

- (void)setRoomBuilderItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roomBuilderItem, 0);
  objc_storeStrong((id *)&self->_serviceLikeBuilder, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong(&self->_filter, 0);
}

@end