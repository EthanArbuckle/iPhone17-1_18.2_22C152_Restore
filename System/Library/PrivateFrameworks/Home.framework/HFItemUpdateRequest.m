@interface HFItemUpdateRequest
+ (id)requestToReloadItemProviders:(id)a3 senderSelector:(SEL)a4;
+ (id)requestToUpdateItems:(id)a3 senderSelector:(SEL)a4;
- (HFItemUpdateRequest)init;
- (HFItemUpdateRequest)initWithItemProviders:(id)a3 items:(id)a4 senderSelector:(SEL)a5;
- (NSSet)itemsProvidersToReload;
- (NSSet)itemsToUpdate;
- (SEL)senderSelector;
@end

@implementation HFItemUpdateRequest

- (SEL)senderSelector
{
  return self->_senderSelector;
}

- (NSSet)itemsToUpdate
{
  return self->_itemsToUpdate;
}

- (NSSet)itemsProvidersToReload
{
  return self->_itemsProvidersToReload;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsProvidersToReload, 0);
  objc_storeStrong((id *)&self->_itemsToUpdate, 0);
}

+ (id)requestToReloadItemProviders:(id)a3 senderSelector:(SEL)a4
{
  id v6 = a3;
  id v7 = objc_alloc((Class)a1);
  v8 = [MEMORY[0x263EFFA08] set];
  v9 = (void *)[v7 initWithItemProviders:v6 items:v8 senderSelector:a4];

  return v9;
}

- (HFItemUpdateRequest)initWithItemProviders:(id)a3 items:(id)a4 senderSelector:(SEL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HFItemUpdateRequest;
  v11 = [(HFItemUpdateRequest *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_itemsProvidersToReload, a3);
    objc_storeStrong((id *)&v12->_itemsToUpdate, a4);
    v12->_senderSelector = a5;
  }

  return v12;
}

+ (id)requestToUpdateItems:(id)a3 senderSelector:(SEL)a4
{
  id v6 = a3;
  id v7 = objc_alloc((Class)a1);
  v8 = [MEMORY[0x263EFFA08] set];
  id v9 = (void *)[v7 initWithItemProviders:v8 items:v6 senderSelector:a4];

  return v9;
}

- (HFItemUpdateRequest)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithItemProviders_items_senderSelector_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFItemUpdating.m", 35, @"%s is unavailable; use %@ instead",
    "-[HFItemUpdateRequest init]",
    v5);

  return 0;
}

@end