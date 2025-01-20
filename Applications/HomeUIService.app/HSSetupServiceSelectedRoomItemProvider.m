@interface HSSetupServiceSelectedRoomItemProvider
- (HFRoomBuilderItem)roomBuilderItem;
- (HFServiceLikeBuilder)serviceLikeBuilder;
- (HSSetupServiceSelectedRoomItemProvider)init;
- (HSSetupServiceSelectedRoomItemProvider)initWithServiceLikeBuilder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)filter;
- (id)invalidationReasons;
- (id)items;
- (id)reloadItems;
- (void)setFilter:(id)a3;
- (void)setRoomBuilderItem:(id)a3;
- (void)setServiceLikeBuilder:(id)a3;
@end

@implementation HSSetupServiceSelectedRoomItemProvider

- (HSSetupServiceSelectedRoomItemProvider)init
{
  v4 = +[NSAssertionHandler currentHandler];
  v5 = NSStringFromSelector("initWithServiceLikeBuilder:");
  [v4 handleFailureInMethod:a2 object:self file:@"HSSetupServiceSelectedRoomItemProvider.m" lineNumber:23 description:@"%s is unavailable; use %@ instead"];
    "-[HSSetupServiceSelectedRoomItemProvider init]",
    v5);

  return 0;
}

- (HSSetupServiceSelectedRoomItemProvider)initWithServiceLikeBuilder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HSSetupServiceSelectedRoomItemProvider;
  v5 = [(HSSetupServiceSelectedRoomItemProvider *)&v8 init];
  v6 = v5;
  if (v5) {
    [(HSSetupServiceSelectedRoomItemProvider *)v5 setServiceLikeBuilder:v4];
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(HSSetupServiceSelectedRoomItemProvider *)self serviceLikeBuilder];
  id v6 = [v4 initWithServiceLikeBuilder:v5];

  return v6;
}

- (id)reloadItems
{
  v3 = [(HSSetupServiceSelectedRoomItemProvider *)self roomBuilderItem];
  id v4 = [v3 roomBuilder];
  v5 = [(HSSetupServiceSelectedRoomItemProvider *)self serviceLikeBuilder];
  id v6 = [v5 room];

  v7 = [(HSSetupServiceSelectedRoomItemProvider *)self filter];

  if (v7)
  {
    objc_super v8 = [(HSSetupServiceSelectedRoomItemProvider *)self filter];
    if (((unsigned int (**)(void, void *))v8)[2](v8, v6)) {
      v9 = v6;
    }
    else {
      v9 = 0;
    }
    id v10 = v9;

    id v6 = v10;
  }
  if (v4 == v6) {
    unsigned int v11 = [v4 isEqual:v4] ^ 1;
  }
  else {
    unsigned int v11 = 1;
  }
  v12 = +[NSMutableSet set];
  v13 = +[NSMutableSet set];
  v14 = +[NSMutableSet set];
  if (v3) {
    int v15 = v11;
  }
  else {
    int v15 = 1;
  }
  if (v6 && v15)
  {
    id v16 = [objc_alloc((Class)HFRoomBuilderItem) initWithRoomBuilder:v6];
    [v12 addObject:v16];
    [(HSSetupServiceSelectedRoomItemProvider *)self setRoomBuilderItem:v16];
  }
  if (v3 && ((v11 ^ 1) & 1) == 0) {
    [v14 addObject:v3];
  }
  if ((v15 & 1) == 0) {
    [v13 addObject:v3];
  }
  id v17 = [objc_alloc((Class)HFItemProviderReloadResults) initWithAddedItems:v12 removedItems:v14 existingItems:v13];
  v18 = +[NAFuture futureWithResult:v17];

  return v18;
}

- (id)items
{
  v2 = [(HSSetupServiceSelectedRoomItemProvider *)self roomBuilderItem];
  v3 = +[NSSet na_setWithSafeObject:v2];

  return v3;
}

- (id)invalidationReasons
{
  v5.receiver = self;
  v5.super_class = (Class)HSSetupServiceSelectedRoomItemProvider;
  v2 = [(HSSetupServiceSelectedRoomItemProvider *)&v5 invalidationReasons];
  v3 = [v2 setByAddingObject:HFItemProviderInvalidationReasonRoom];

  return v3;
}

- (id)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
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

  objc_storeStrong(&self->_filter, 0);
}

@end