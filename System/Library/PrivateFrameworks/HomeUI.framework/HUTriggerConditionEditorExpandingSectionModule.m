@interface HUTriggerConditionEditorExpandingSectionModule
+ (id)sectionModuleForConditionType:(unint64_t)a3 itemUpdater:(id)a4 home:(id)a5;
- (BOOL)conditionIsDisabled;
- (BOOL)doesOptionItemRequireInitialUserConfiguration:(id)a3;
- (BOOL)showOptions;
- (HFCondition)condition;
- (HFItem)selectedOptionItem;
- (HFItem)showOptionsItem;
- (HFStaticItemProvider)itemProvider;
- (HMHome)home;
- (HUTriggerConditionEditorExpandingSectionModule)initWithItemUpdater:(id)a3 conditionType:(unint64_t)a4 home:(id)a5;
- (NSArray)optionItems;
- (id)buildConditionOptionItems;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (id)conditionForOptionItem:(id)a3;
- (id)conditionTitle;
- (id)createNoConditionOptionItemWithTitle:(id)a3;
- (id)itemProviders;
- (id)preferredConditionFromConditions:(id)a3;
- (id)sectionID;
- (id)selectOptionItem:(id)a3;
- (id)selectOptionItemForCondition:(id)a3;
- (id)updateSelectionWithCondition:(id)a3;
- (unint64_t)conditionType;
- (void)_buildItemProvider;
- (void)setCondition:(id)a3;
- (void)setItemProvider:(id)a3;
- (void)setOptionItems:(id)a3;
- (void)setSelectedOptionItem:(id)a3;
- (void)setShowOptions:(BOOL)a3;
- (void)setShowOptionsItem:(id)a3;
@end

@implementation HUTriggerConditionEditorExpandingSectionModule

+ (id)sectionModuleForConditionType:(unint64_t)a3 itemUpdater:(id)a4 home:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (!a3)
  {
    v9 = off_1E6382B38;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    v9 = off_1E6382AF8;
LABEL_5:
    v10 = (void *)[objc_alloc(*v9) initWithItemUpdater:v7 conditionType:a3 home:v8];
    goto LABEL_7;
  }
  v10 = 0;
LABEL_7:

  return v10;
}

- (HUTriggerConditionEditorExpandingSectionModule)initWithItemUpdater:(id)a3 conditionType:(unint64_t)a4 home:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HUTriggerConditionEditorExpandingSectionModule;
  v10 = [(HFItemModule *)&v13 initWithItemUpdater:a3];
  v11 = v10;
  if (v10)
  {
    v10->_conditionType = a4;
    objc_storeStrong((id *)&v10->_home, a5);
    [(HUTriggerConditionEditorExpandingSectionModule *)v11 _buildItemProvider];
  }

  return v11;
}

- (id)itemProviders
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = [(HUTriggerConditionEditorExpandingSectionModule *)self itemProvider];
  v4 = [v2 setWithObject:v3];

  return v4;
}

- (id)sectionID
{
  unint64_t v2 = [(HUTriggerConditionEditorExpandingSectionModule *)self conditionType];
  v3 = @"location";
  if (v2 != 1) {
    v3 = 0;
  }
  if (v2) {
    return v3;
  }
  else {
    return @"time";
  }
}

- (void)_buildItemProvider
{
  v3 = [(HUTriggerConditionEditorExpandingSectionModule *)self home];
  char v4 = [v3 areBulletinNotificationsSupported];

  objc_initWeak(&location, self);
  id v5 = objc_alloc(MEMORY[0x1E4F695C0]);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __68__HUTriggerConditionEditorExpandingSectionModule__buildItemProvider__block_invoke;
  v14[3] = &unk_1E63869A0;
  objc_copyWeak(&v15, &location);
  char v16 = v4;
  v6 = (void *)[v5 initWithResultsBlock:v14];
  [(HUTriggerConditionEditorExpandingSectionModule *)self setShowOptionsItem:v6];

  id v7 = [(HUTriggerConditionEditorExpandingSectionModule *)self buildConditionOptionItems];
  [(HUTriggerConditionEditorExpandingSectionModule *)self setOptionItems:v7];

  id v8 = (void *)MEMORY[0x1E4F1CAD0];
  id v9 = [(HUTriggerConditionEditorExpandingSectionModule *)self optionItems];
  v10 = [v8 setWithArray:v9];
  v11 = [(HUTriggerConditionEditorExpandingSectionModule *)self showOptionsItem];
  v12 = [v10 setByAddingObject:v11];

  objc_super v13 = (void *)[objc_alloc(MEMORY[0x1E4F695C8]) initWithItems:v12];
  [(HUTriggerConditionEditorExpandingSectionModule *)self setItemProvider:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

id __68__HUTriggerConditionEditorExpandingSectionModule__buildItemProvider__block_invoke(uint64_t a1)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __68__HUTriggerConditionEditorExpandingSectionModule__buildItemProvider__block_invoke_2;
    v11[3] = &unk_1E6385000;
    v11[4] = WeakRetained;
    char v4 = __68__HUTriggerConditionEditorExpandingSectionModule__buildItemProvider__block_invoke_2((uint64_t)v11);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __68__HUTriggerConditionEditorExpandingSectionModule__buildItemProvider__block_invoke_14;
    v9[3] = &unk_1E6388E20;
    v9[4] = v3;
    char v10 = *(unsigned char *)(a1 + 40);
    uint64_t v5 = [v4 flatMap:v9];
  }
  else
  {
    v6 = (void *)MEMORY[0x1E4F7A0D8];
    uint64_t v12 = *MEMORY[0x1E4F68B10];
    v13[0] = MEMORY[0x1E4F1CC38];
    char v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    uint64_t v5 = [v6 futureWithResult:v4];
  }
  id v7 = (void *)v5;

  return v7;
}

id __68__HUTriggerConditionEditorExpandingSectionModule__buildItemProvider__block_invoke_2(uint64_t a1)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  unint64_t v2 = [*(id *)(a1 + 32) condition];

  if (v2)
  {
    v3 = [HUTriggerConditionSummaryItem alloc];
    char v4 = [*(id *)(a1 + 32) condition];
    v18[0] = v4;
    uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    v6 = [*(id *)(a1 + 32) home];
    id v7 = [(HUTriggerConditionSummaryItem *)v3 initWithConditions:v5 home:v6];

    char v16 = @"triggerConditionSummaryStyle";
    v17 = &unk_1F19B3F38;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    uint64_t v9 = [(HUTriggerConditionSummaryItem *)v7 updateWithOptions:v8];
  }
  else
  {
    id v7 = [*(id *)(a1 + 32) noConditionSummaryTitle];
    char v10 = (void *)MEMORY[0x1E4F69228];
    uint64_t v14 = *MEMORY[0x1E4F68AB8];
    id v15 = v7;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    id v8 = [v10 outcomeWithResults:v11];

    uint64_t v9 = [MEMORY[0x1E4F7A0D8] futureWithResult:v8];
  }
  uint64_t v12 = (void *)v9;

  return v12;
}

id __68__HUTriggerConditionEditorExpandingSectionModule__buildItemProvider__block_invoke_14(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = objc_opt_new();
  uint64_t v5 = [*(id *)(a1 + 32) conditionTitle];
  uint64_t v6 = *MEMORY[0x1E4F68AB8];
  [v4 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  id v7 = [v3 objectForKeyedSubscript:v6];

  [v4 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F68980]];
  id v8 = NSNumber;
  BOOL v9 = ([*(id *)(a1 + 32) conditionIsDisabled] & 1) != 0 || *(unsigned char *)(a1 + 40) == 0;
  char v10 = [v8 numberWithInt:v9];
  [v4 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F68A08]];

  v11 = [MEMORY[0x1E4F7A0D8] futureWithResult:v4];

  return v11;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F692E8]);
  uint64_t v6 = [(HUTriggerConditionEditorExpandingSectionModule *)self sectionID];
  id v7 = (void *)[v5 initWithIdentifier:v6];

  id v8 = (void *)MEMORY[0x1E4F1CA48];
  BOOL v9 = [(HUTriggerConditionEditorExpandingSectionModule *)self showOptionsItem];
  char v10 = [v8 arrayWithObject:v9];

  if ([(HUTriggerConditionEditorExpandingSectionModule *)self showOptions])
  {
    v11 = [(HUTriggerConditionEditorExpandingSectionModule *)self optionItems];
    [v10 addObjectsFromArray:v11];
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __82__HUTriggerConditionEditorExpandingSectionModule_buildSectionsWithDisplayedItems___block_invoke;
  v16[3] = &unk_1E6386108;
  id v17 = v4;
  id v12 = v4;
  objc_super v13 = objc_msgSend(v10, "na_filter:", v16);
  [v7 setItems:v13];

  v18[0] = v7;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];

  return v14;
}

uint64_t __82__HUTriggerConditionEditorExpandingSectionModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

- (id)selectOptionItem:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(HUTriggerConditionEditorExpandingSectionModule *)self conditionForOptionItem:v4];
  }
  else
  {
    id v5 = 0;
  }
  [(HUTriggerConditionEditorExpandingSectionModule *)self setSelectedOptionItem:v4];
  [(HUTriggerConditionEditorExpandingSectionModule *)self setCondition:v5];

  return v5;
}

- (id)updateSelectionWithCondition:(id)a3
{
  id v4 = a3;
  id v5 = [(HUTriggerConditionEditorExpandingSectionModule *)self selectOptionItemForCondition:v4];
  [(HUTriggerConditionEditorExpandingSectionModule *)self setSelectedOptionItem:v5];

  [(HUTriggerConditionEditorExpandingSectionModule *)self setCondition:v4];

  return [(HUTriggerConditionEditorExpandingSectionModule *)self selectedOptionItem];
}

- (BOOL)doesOptionItemRequireInitialUserConfiguration:(id)a3
{
  return 0;
}

- (id)createNoConditionOptionItemWithTitle:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v15 = 0;
  char v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__9;
  v19 = __Block_byref_object_dispose__9;
  id v20 = 0;
  id v5 = objc_alloc(MEMORY[0x1E4F695C0]);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __87__HUTriggerConditionEditorExpandingSectionModule_createNoConditionOptionItemWithTitle___block_invoke;
  v11[3] = &unk_1E6388E48;
  objc_copyWeak(&v14, &location);
  objc_super v13 = &v15;
  id v6 = v4;
  id v12 = v6;
  uint64_t v7 = [v5 initWithResultsBlock:v11];
  id v8 = (void *)v16[5];
  v16[5] = v7;

  id v9 = (id)v16[5];
  objc_destroyWeak(&v14);
  _Block_object_dispose(&v15, 8);

  objc_destroyWeak(&location);

  return v9;
}

id __87__HUTriggerConditionEditorExpandingSectionModule_createNoConditionOptionItemWithTitle___block_invoke(uint64_t a1)
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained selectedOptionItem];

  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *MEMORY[0x1E4F68BC0];
  v9[0] = *MEMORY[0x1E4F68AB8];
  v9[1] = v4;
  v10[0] = v3;
  id v5 = [NSNumber numberWithInteger:HFPrimaryStateFromBOOL()];
  v10[1] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  uint64_t v7 = [MEMORY[0x1E4F7A0D8] futureWithResult:v6];

  return v7;
}

- (id)selectOptionItemForCondition:(id)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2, self, @"HUTriggerConditionEditorExpandingSectionModule.m", 165, @"%s is an abstract method that must be overriden by subclass %@", "-[HUTriggerConditionEditorExpandingSectionModule selectOptionItemForCondition:]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (id)conditionForOptionItem:(id)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2, self, @"HUTriggerConditionEditorExpandingSectionModule.m", 171, @"%s is an abstract method that must be overriden by subclass %@", "-[HUTriggerConditionEditorExpandingSectionModule conditionForOptionItem:]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (id)buildConditionOptionItems
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"HUTriggerConditionEditorExpandingSectionModule.m", 177, @"%s is an abstract method that must be overriden by subclass %@", "-[HUTriggerConditionEditorExpandingSectionModule buildConditionOptionItems]", objc_opt_class() object file lineNumber description];

  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)conditionTitle
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"HUTriggerConditionEditorExpandingSectionModule.m", 183, @"%s is an abstract method that must be overriden by subclass %@", "-[HUTriggerConditionEditorExpandingSectionModule conditionTitle]", objc_opt_class() object file lineNumber description];

  return &stru_1F18F92B8;
}

- (BOOL)conditionIsDisabled
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"HUTriggerConditionEditorExpandingSectionModule.m", 189, @"%s is an abstract method that must be overriden by subclass %@", "-[HUTriggerConditionEditorExpandingSectionModule conditionIsDisabled]", objc_opt_class() object file lineNumber description];

  return 1;
}

- (id)preferredConditionFromConditions:(id)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2, self, @"HUTriggerConditionEditorExpandingSectionModule.m", 195, @"%s is an abstract method that must be overriden by subclass %@", "-[HUTriggerConditionEditorExpandingSectionModule preferredConditionFromConditions:]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (unint64_t)conditionType
{
  return self->_conditionType;
}

- (HFItem)showOptionsItem
{
  return self->_showOptionsItem;
}

- (void)setShowOptionsItem:(id)a3
{
}

- (NSArray)optionItems
{
  return self->_optionItems;
}

- (void)setOptionItems:(id)a3
{
}

- (HFCondition)condition
{
  return self->_condition;
}

- (void)setCondition:(id)a3
{
}

- (HFItem)selectedOptionItem
{
  return self->_selectedOptionItem;
}

- (void)setSelectedOptionItem:(id)a3
{
}

- (BOOL)showOptions
{
  return self->_showOptions;
}

- (void)setShowOptions:(BOOL)a3
{
  self->_showOptions = a3;
}

- (HMHome)home
{
  return self->_home;
}

- (HFStaticItemProvider)itemProvider
{
  return self->_itemProvider;
}

- (void)setItemProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemProvider, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_selectedOptionItem, 0);
  objc_storeStrong((id *)&self->_condition, 0);
  objc_storeStrong((id *)&self->_optionItems, 0);

  objc_storeStrong((id *)&self->_showOptionsItem, 0);
}

@end