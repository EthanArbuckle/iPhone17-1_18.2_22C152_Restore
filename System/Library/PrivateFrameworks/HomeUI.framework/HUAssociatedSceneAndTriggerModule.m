@interface HUAssociatedSceneAndTriggerModule
- (HFItem)scenesItem;
- (HFItem)triggersItem;
- (HFServiceLikeItem)serviceLikeItem;
- (HFStaticItemProvider)staticItemProvider;
- (HMHome)home;
- (HUAssociatedSceneAndTriggerModule)initWithItemUpdater:(id)a3;
- (HUAssociatedSceneAndTriggerModule)initWithItemUpdater:(id)a3 home:(id)a4 serviceLikeItem:(id)a5 context:(unint64_t)a6;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (id)itemProviders;
- (unint64_t)context;
@end

@implementation HUAssociatedSceneAndTriggerModule

- (HUAssociatedSceneAndTriggerModule)initWithItemUpdater:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithItemUpdater_home_serviceLikeItem_context_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUAssociatedSceneAndTriggerModule.m", 28, @"%s is unavailable; use %@ instead",
    "-[HUAssociatedSceneAndTriggerModule initWithItemUpdater:]",
    v6);

  return 0;
}

- (HUAssociatedSceneAndTriggerModule)initWithItemUpdater:(id)a3 home:(id)a4 serviceLikeItem:(id)a5 context:(unint64_t)a6
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  v30.receiver = self;
  v30.super_class = (Class)HUAssociatedSceneAndTriggerModule;
  v13 = [(HFItemModule *)&v30 initWithItemUpdater:a3];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_home, a4);
    objc_storeStrong((id *)&v14->_serviceLikeItem, a5);
    v14->_context = a6;
    v15 = [[HUAssociatedSceneListItem alloc] initWithHome:v11 serviceLikeItem:v12 context:a6];
    scenesItem = v14->_scenesItem;
    v14->_scenesItem = &v15->super;

    id v17 = objc_alloc(MEMORY[0x1E4F695C0]);
    uint64_t v32 = *MEMORY[0x1E4F68B10];
    v33[0] = MEMORY[0x1E4F1CC38];
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];
    uint64_t v19 = [v17 initWithResults:v18];
    triggersItem = v14->_triggersItem;
    v14->_triggersItem = (HFItem *)v19;

    id v21 = objc_alloc(MEMORY[0x1E4F695C8]);
    v22 = (void *)MEMORY[0x1E4F1CAD0];
    v23 = [(HUAssociatedSceneAndTriggerModule *)v14 scenesItem];
    v31[0] = v23;
    v24 = [(HUAssociatedSceneAndTriggerModule *)v14 triggersItem];
    v31[1] = v24;
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
    v26 = [v22 setWithArray:v25];
    uint64_t v27 = [v21 initWithItems:v26];
    staticItemProvider = v14->_staticItemProvider;
    v14->_staticItemProvider = (HFStaticItemProvider *)v27;
  }
  return v14;
}

- (id)itemProviders
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = [(HUAssociatedSceneAndTriggerModule *)self staticItemProvider];
  v4 = [v2 setWithObject:v3];

  return v4;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  v4 = (objc_class *)MEMORY[0x1E4F692E8];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithIdentifier:@"ScenesAndTriggers"];
  v7 = [(HUAssociatedSceneAndTriggerModule *)self scenesItem];
  v15[0] = v7;
  v8 = [(HUAssociatedSceneAndTriggerModule *)self triggersItem];
  v15[1] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  [v6 setItems:v9];

  v10 = (void *)MEMORY[0x1E4F69220];
  v14 = v6;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
  id v12 = [v10 filterSections:v11 toDisplayedItems:v5];

  return v12;
}

- (HMHome)home
{
  return self->_home;
}

- (HFServiceLikeItem)serviceLikeItem
{
  return self->_serviceLikeItem;
}

- (unint64_t)context
{
  return self->_context;
}

- (HFItem)scenesItem
{
  return self->_scenesItem;
}

- (HFItem)triggersItem
{
  return self->_triggersItem;
}

- (HFStaticItemProvider)staticItemProvider
{
  return self->_staticItemProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staticItemProvider, 0);
  objc_storeStrong((id *)&self->_triggersItem, 0);
  objc_storeStrong((id *)&self->_scenesItem, 0);
  objc_storeStrong((id *)&self->_serviceLikeItem, 0);

  objc_storeStrong((id *)&self->_home, 0);
}

@end