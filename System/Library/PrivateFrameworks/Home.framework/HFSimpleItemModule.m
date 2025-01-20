@interface HFSimpleItemModule
- (HFSimpleItemModule)initWithItemUpdater:(id)a3;
- (HFSimpleItemModule)initWithItemUpdater:(id)a3 itemProviders:(id)a4 sectionBuilder:(id)a5;
- (NSSet)itemProviders;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (id)sectionBuilder;
- (void)setItemProviders:(id)a3;
- (void)setSectionBuilder:(id)a3;
@end

@implementation HFSimpleItemModule

- (HFSimpleItemModule)initWithItemUpdater:(id)a3 itemProviders:(id)a4 sectionBuilder:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v19 = [MEMORY[0x263F08690] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"HFSimpleItemModule.m", 24, @"Invalid parameter not satisfying: %@", @"itemProviders" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  v20 = [MEMORY[0x263F08690] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"HFSimpleItemModule.m", 25, @"Invalid parameter not satisfying: %@", @"sectionBuilder" object file lineNumber description];

LABEL_3:
  v21.receiver = self;
  v21.super_class = (Class)HFSimpleItemModule;
  v13 = [(HFItemModule *)&v21 initWithItemUpdater:v9];
  if (v13)
  {
    uint64_t v14 = [v12 copy];
    id sectionBuilder = v13->_sectionBuilder;
    v13->_id sectionBuilder = (id)v14;

    uint64_t v16 = [v10 copy];
    itemProviders = v13->_itemProviders;
    v13->_itemProviders = (NSSet *)v16;
  }
  return v13;
}

- (HFSimpleItemModule)initWithItemUpdater:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithItemUpdater_itemProviders_sectionBuilder_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFSimpleItemModule.m", 37, @"%s is unavailable; use %@ instead",
    "-[HFSimpleItemModule initWithItemUpdater:]",
    v6);

  return 0;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  id v4 = a3;
  v5 = [(HFItemModule *)self allItems];
  v6 = objc_msgSend(v5, "na_setByIntersectingWithSet:", v4);

  v7 = [(HFSimpleItemModule *)self sectionBuilder];
  v8 = ((void (**)(void, void *))v7)[2](v7, v6);

  return v8;
}

- (NSSet)itemProviders
{
  return self->_itemProviders;
}

- (void)setItemProviders:(id)a3
{
}

- (id)sectionBuilder
{
  return self->_sectionBuilder;
}

- (void)setSectionBuilder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sectionBuilder, 0);
  objc_storeStrong((id *)&self->_itemProviders, 0);
}

@end