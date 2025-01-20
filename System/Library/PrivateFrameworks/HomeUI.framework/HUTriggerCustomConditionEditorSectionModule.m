@interface HUTriggerCustomConditionEditorSectionModule
- (BOOL)isConditionEnabled:(id)a3;
- (HFConditionItemProvider)sourceConditionItemProvider;
- (HFTransformItemProvider)itemProvider;
- (HMHome)home;
- (HUTriggerCustomConditionEditorSectionModule)initWithItemUpdater:(id)a3;
- (HUTriggerCustomConditionEditorSectionModule)initWithItemUpdater:(id)a3 home:(id)a4;
- (NSMutableSet)mutableDisabledConditions;
- (NSMutableSet)mutableEnabledConditions;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (id)conditionForItem:(id)a3;
- (id)itemForCondition:(id)a3;
- (id)itemProviders;
- (unint64_t)conditionType;
- (void)_buildItemProviders;
- (void)setConditionEnabled:(BOOL)a3 forCondition:(id)a4;
- (void)setMutableDisabledConditions:(id)a3;
- (void)setMutableEnabledConditions:(id)a3;
- (void)updateEnabledConditions:(id)a3 disabledConditions:(id)a4;
@end

@implementation HUTriggerCustomConditionEditorSectionModule

- (HUTriggerCustomConditionEditorSectionModule)initWithItemUpdater:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithItemUpdater_home_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUTriggerCustomConditionEditorSectionModule.m", 27, @"%s is unavailable; use %@ instead",
    "-[HUTriggerCustomConditionEditorSectionModule initWithItemUpdater:]",
    v6);

  return 0;
}

- (HUTriggerCustomConditionEditorSectionModule)initWithItemUpdater:(id)a3 home:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HUTriggerCustomConditionEditorSectionModule;
  v8 = [(HFItemModule *)&v11 initWithItemUpdater:a3];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_home, a4);
    [(HUTriggerCustomConditionEditorSectionModule *)v9 _buildItemProviders];
  }

  return v9;
}

- (unint64_t)conditionType
{
  return 2;
}

- (id)itemProviders
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = [(HUTriggerCustomConditionEditorSectionModule *)self itemProvider];
  v4 = [v2 setWithObject:v3];

  return v4;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HUTriggerCustomConditionEditorSectionModule *)self itemProvider];
  v6 = [v5 items];

  id v7 = objc_msgSend(v6, "na_setByIntersectingWithSet:", v4);

  if ([v7 count])
  {
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"custom"];
    v9 = [v7 allObjects];
    v10 = [MEMORY[0x1E4F69220] defaultItemComparator];
    objc_super v11 = [v9 sortedArrayUsingComparator:v10];
    [v8 setItems:v11];

    v14[0] = v8;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  }
  else
  {
    v12 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v12;
}

- (void)updateEnabledConditions:(id)a3 disabledConditions:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[v7 mutableCopy];
  [(HUTriggerCustomConditionEditorSectionModule *)self setMutableEnabledConditions:v8];

  v9 = (void *)[v6 mutableCopy];
  [(HUTriggerCustomConditionEditorSectionModule *)self setMutableDisabledConditions:v9];

  id v11 = [v7 setByAddingObjectsFromSet:v6];

  v10 = [(HUTriggerCustomConditionEditorSectionModule *)self sourceConditionItemProvider];
  [v10 setConditions:v11];
}

- (id)conditionForItem:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (!v5) {
    goto LABEL_7;
  }
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v5;
  if (!v6)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    v9 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v8 handleFailureInFunction:v9, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v4, objc_opt_class() file lineNumber description];

LABEL_7:
    id v7 = 0;
  }

  v10 = [v7 sourceItem];
  id v11 = &unk_1F1AD94B0;
  if (v10)
  {
    if ([v10 conformsToProtocol:v11]) {
      v12 = v10;
    }
    else {
      v12 = 0;
    }
    v13 = v10;
    if (v12) {
      goto LABEL_15;
    }
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    v15 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertProtocolCast(Protocol * _Nonnull __strong, id  _Nonnull __strong)");
    v16 = NSStringFromProtocol((Protocol *)v11);
    [v14 handleFailureInFunction:v15, @"NSObject+NAAdditions.h", 71, @"Expected protocol %@", v16 file lineNumber description];
  }
  v13 = 0;
LABEL_15:

  v17 = [v13 condition];

  return v17;
}

- (id)itemForCondition:(id)a3
{
  id v4 = a3;
  id v5 = [(HUTriggerCustomConditionEditorSectionModule *)self itemProvider];
  id v6 = [v5 items];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__HUTriggerCustomConditionEditorSectionModule_itemForCondition___block_invoke;
  v10[3] = &unk_1E6386108;
  id v11 = v4;
  id v7 = v4;
  v8 = objc_msgSend(v6, "na_firstObjectPassingTest:", v10);

  return v8;
}

uint64_t __64__HUTriggerCustomConditionEditorSectionModule_itemForCondition___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (!v5) {
    goto LABEL_7;
  }
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v5;
  if (!v6)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    v9 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v8 handleFailureInFunction:v9, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v4, objc_opt_class() file lineNumber description];

LABEL_7:
    id v7 = 0;
  }

  v10 = [v7 sourceItem];
  id v11 = &unk_1F1AD94B0;
  if (!v10)
  {
LABEL_14:
    v13 = 0;
    goto LABEL_15;
  }
  if ([v10 conformsToProtocol:v11]) {
    v12 = v10;
  }
  else {
    v12 = 0;
  }
  v13 = v10;
  if (!v12)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    v15 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertProtocolCast(Protocol * _Nonnull __strong, id  _Nonnull __strong)");
    v16 = NSStringFromProtocol((Protocol *)v11);
    [v14 handleFailureInFunction:v15, @"NSObject+NAAdditions.h", 71, @"Expected protocol %@", v16 file lineNumber description];

    goto LABEL_14;
  }
LABEL_15:

  v17 = *(void **)(a1 + 32);
  v18 = [v13 condition];
  uint64_t v19 = [v17 isEqual:v18];

  return v19;
}

- (BOOL)isConditionEnabled:(id)a3
{
  id v4 = a3;
  id v5 = [(HUTriggerCustomConditionEditorSectionModule *)self enabledConditions];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (void)setConditionEnabled:(BOOL)a3 forCondition:(id)a4
{
  BOOL v4 = a3;
  id v9 = a4;
  if (-[HUTriggerCustomConditionEditorSectionModule isConditionEnabled:](self, "isConditionEnabled:") != v4)
  {
    if (v4)
    {
      char v6 = [(HUTriggerCustomConditionEditorSectionModule *)self mutableDisabledConditions];
      [v6 removeObject:v9];

      [(HUTriggerCustomConditionEditorSectionModule *)self mutableEnabledConditions];
    }
    else
    {
      id v7 = [(HUTriggerCustomConditionEditorSectionModule *)self mutableEnabledConditions];
      [v7 removeObject:v9];

      [(HUTriggerCustomConditionEditorSectionModule *)self mutableDisabledConditions];
    v8 = };
    [v8 addObject:v9];
  }
}

- (void)_buildItemProviders
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc(MEMORY[0x1E4F69080]);
  BOOL v4 = [MEMORY[0x1E4F1CAD0] set];
  id v5 = [(HUTriggerCustomConditionEditorSectionModule *)self home];
  char v6 = (HFConditionItemProvider *)[v3 initWithConditions:v4 home:v5];
  sourceConditionItemProvider = self->_sourceConditionItemProvider;
  self->_sourceConditionItemProvider = v6;

  id v8 = objc_alloc(MEMORY[0x1E4F696B0]);
  id v9 = [(HUTriggerCustomConditionEditorSectionModule *)self sourceConditionItemProvider];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__HUTriggerCustomConditionEditorSectionModule__buildItemProviders__block_invoke;
  v12[3] = &unk_1E638D528;
  objc_copyWeak(&v13, &location);
  v10 = (HFTransformItemProvider *)[v8 initWithSourceProvider:v9 transformationBlock:v12];
  itemProvider = self->_itemProvider;
  self->_itemProvider = v10;

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

id __66__HUTriggerCustomConditionEditorSectionModule__buildItemProviders__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x1E4F696A8]);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__HUTriggerCustomConditionEditorSectionModule__buildItemProviders__block_invoke_2;
  v8[3] = &unk_1E6387EF8;
  objc_copyWeak(&v10, (id *)(a1 + 32));
  id v5 = v3;
  id v9 = v5;
  char v6 = (void *)[v4 initWithSourceItem:v5 transformationBlock:v8];

  objc_destroyWeak(&v10);

  return v6;
}

id __66__HUTriggerCustomConditionEditorSectionModule__buildItemProviders__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  char v6 = (void *)[v4 mutableCopy];

  id v7 = NSNumber;
  id v8 = [*(id *)(a1 + 32) condition];
  [WeakRetained isConditionEnabled:v8];
  id v9 = [v7 numberWithInteger:HFPrimaryStateFromBOOL()];
  [v6 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F68BC0]];

  return v6;
}

- (HMHome)home
{
  return self->_home;
}

- (HFConditionItemProvider)sourceConditionItemProvider
{
  return self->_sourceConditionItemProvider;
}

- (HFTransformItemProvider)itemProvider
{
  return self->_itemProvider;
}

- (NSMutableSet)mutableEnabledConditions
{
  return self->_mutableEnabledConditions;
}

- (void)setMutableEnabledConditions:(id)a3
{
}

- (NSMutableSet)mutableDisabledConditions
{
  return self->_mutableDisabledConditions;
}

- (void)setMutableDisabledConditions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableDisabledConditions, 0);
  objc_storeStrong((id *)&self->_mutableEnabledConditions, 0);
  objc_storeStrong((id *)&self->_itemProvider, 0);
  objc_storeStrong((id *)&self->_sourceConditionItemProvider, 0);

  objc_storeStrong((id *)&self->_home, 0);
}

@end