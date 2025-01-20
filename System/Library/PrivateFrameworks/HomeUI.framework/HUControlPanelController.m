@interface HUControlPanelController
- (BOOL)shouldDisplayItem:(id)a3;
- (BOOL)shouldShowSectionFooterForItem:(id)a3;
- (BOOL)shouldShowSectionTitleForItem:(id)a3;
- (Class)cellClassForItem:(id)a3;
- (HUControlPanelController)initWithDelegate:(id)a3;
- (HUControlPanelControllerDelegate)delegate;
- (NSMutableDictionary)interactionStateByControlID;
- (NSSet)allItems;
- (NSSet)configurations;
- (id)_configurationForItem:(id)a3;
- (id)_controlItemForControlView:(id)a3;
- (id)_controlPanelItemForControlView:(id)a3;
- (id)_createConfigurations;
- (id)_createWriteThrottleForControlItem:(id)a3 controlPanelItem:(id)a4;
- (id)_valueTransformerForControlItem:(id)a3 controlPanelItem:(id)a4;
- (id)sectionFooterForItem:(id)a3 forSourceItem:(id)a4;
- (id)sectionTitleForItem:(id)a3 forSourceItem:(id)a4;
- (void)_updateStateForControlView:(id)a3 controlPanelItem:(id)a4;
- (void)_updateWriteStateForControlItem:(id)a3 controlPanelItem:(id)a4;
- (void)_updateWriteStateForControlView:(id)a3;
- (void)addItem:(id)a3;
- (void)controlView:(id)a3 valueDidChange:(id)a4;
- (void)controlViewDidBeginUserInteraction:(id)a3;
- (void)controlViewDidEndUserInteraction:(id)a3;
- (void)removeItem:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4;
- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5;
@end

@implementation HUControlPanelController

- (HUControlPanelController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HUControlPanelController;
  v5 = [(HUControlPanelController *)&v14 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    uint64_t v7 = [(HUControlPanelController *)v6 _createConfigurations];
    configurations = v6->_configurations;
    v6->_configurations = (NSSet *)v7;

    uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
    interactionStateByControlID = v6->_interactionStateByControlID;
    v6->_interactionStateByControlID = (NSMutableDictionary *)v9;

    uint64_t v11 = [MEMORY[0x1E4F1CA80] set];
    allItems = v6->_allItems;
    v6->_allItems = (NSMutableSet *)v11;
  }
  return v6;
}

- (void)addItem:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HUControlPanelController *)self allItems];
  int v6 = [v5 containsObject:v4];

  if (v6) {
    NSLog(&cfstr_AlreadyAddedIt.isa, v4);
  }
  [(NSMutableSet *)self->_allItems addObject:v4];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = [v4 controlItems];
  uint64_t v7 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        v12 = [v4 identifierForControlItem:v11];
        v13 = [(HUControlPanelController *)self _createWriteThrottleForControlItem:v11 controlPanelItem:v4];
        objc_super v14 = objc_alloc_init(HUControlInteractionState);
        [(HUControlInteractionState *)v14 setWriteThrottler:v13];
        v15 = [(HUControlPanelController *)self interactionStateByControlID];
        [v15 setObject:v14 forKeyedSubscript:v12];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }
}

- (void)removeItem:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HUControlPanelController *)self allItems];
  char v6 = [v5 containsObject:v4];

  if ((v6 & 1) == 0) {
    NSLog(&cfstr_ItemNotFound.isa, v4);
  }
  [(NSMutableSet *)self->_allItems removeObject:v4];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = [v4 controlItems];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = [v4 identifierForControlItem:*(void *)(*((void *)&v14 + 1) + 8 * v11)];
        v13 = [(HUControlPanelController *)self interactionStateByControlID];
        [v13 removeObjectForKey:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

- (Class)cellClassForItem:(id)a3
{
  v3 = [(HUControlPanelController *)self _configurationForItem:a3];
  id v4 = [v3 cellClass];

  return (Class)v4;
}

- (BOOL)shouldDisplayItem:(id)a3
{
  return [(HUControlPanelController *)self cellClassForItem:a3] != 0;
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HUControlPanelController *)self allItems];
  char v9 = [v8 containsObject:v7];

  if ((v9 & 1) == 0) {
    NSLog(&cfstr_AttemptingToSe.isa, v7);
  }
  uint64_t v10 = [(HUControlPanelController *)self _configurationForItem:v7];
  [v10 setupControlsForCell:v6 item:v7];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v11 = [v6 allControlViews];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        [v16 setDelegate:self];
        [(HUControlPanelController *)self _updateStateForControlView:v16 controlPanelItem:v7];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v13);
  }
}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  char v9 = [(HUControlPanelController *)self allItems];
  char v10 = [v9 containsObject:v8];

  if ((v10 & 1) == 0) {
    NSLog(&cfstr_AttemptingToUp.isa, v8);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v11 = [v7 allControlViews];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        [(HUControlPanelController *)self _updateStateForControlView:*(void *)(*((void *)&v16 + 1) + 8 * v15++) controlPanelItem:v8];
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }
}

- (BOOL)shouldShowSectionTitleForItem:(id)a3
{
  id v4 = a3;
  v5 = [(HUControlPanelController *)self _configurationForItem:v4];
  if (objc_opt_respondsToSelector()) {
    char v6 = [v5 shouldShowSectionTitleForItem:v4];
  }
  else {
    char v6 = 1;
  }

  return v6;
}

- (BOOL)shouldShowSectionFooterForItem:(id)a3
{
  id v4 = a3;
  v5 = [(HUControlPanelController *)self _configurationForItem:v4];
  if (objc_opt_respondsToSelector()) {
    char v6 = [v5 shouldShowSectionFooterForItem:v4];
  }
  else {
    char v6 = 1;
  }

  return v6;
}

- (id)sectionTitleForItem:(id)a3 forSourceItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(HUControlPanelController *)self shouldShowSectionTitleForItem:v6])
  {
    id v8 = [(HUControlPanelController *)self _configurationForItem:v6];
    if (objc_opt_respondsToSelector())
    {
      char v9 = [v8 sectionTitleForItem:v6 forSourceItem:v7];
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)sectionFooterForItem:(id)a3 forSourceItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(HUControlPanelController *)self shouldShowSectionFooterForItem:v6])
  {
    id v8 = [(HUControlPanelController *)self _configurationForItem:v6];
    if (objc_opt_respondsToSelector())
    {
      char v9 = [v8 sectionFooterForItem:v6 forSourceItem:v7];
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (void)_updateStateForControlView:(id)a3 controlPanelItem:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 identifier];
  id v13 = [v6 controlItemForIdentifier:v8];

  char v9 = [v13 latestResults];
  char v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F683E0]];

  uint64_t v11 = [(HUControlPanelController *)self _valueTransformerForControlItem:v13 controlPanelItem:v6];

  uint64_t v12 = [v11 transformedValueForValue:v10];
  [v7 setValue:v12];

  [v7 setDisabled:v10 == 0];
}

- (id)_controlPanelItemForControlView:(id)a3
{
  id v4 = a3;
  v5 = [(HUControlPanelController *)self allItems];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __60__HUControlPanelController__controlPanelItemForControlView___block_invoke;
  uint64_t v12 = &unk_1E63917A8;
  id v6 = v4;
  id v13 = v6;
  id v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", &v9);

  if (!v7) {
    NSLog(&cfstr_NoControlPanel.isa, v6, v9, v10, v11, v12);
  }

  return v7;
}

BOOL __60__HUControlPanelController__controlPanelItemForControlView___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 identifier];
  v5 = [v3 controlItemForIdentifier:v4];

  return v5 != 0;
}

- (id)_controlItemForControlView:(id)a3
{
  id v4 = a3;
  v5 = [(HUControlPanelController *)self _controlPanelItemForControlView:v4];
  id v6 = [v4 identifier];

  id v7 = [v5 controlItemForIdentifier:v6];

  return v7;
}

- (id)_createConfigurations
{
  v14[8] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  id v3 = objc_alloc_init(HUSimpleSliderControlPanelConfiguration);
  v14[0] = v3;
  id v4 = objc_alloc_init(HUIncrementalStateSliderControlPanelConfiguration);
  v14[1] = v4;
  v5 = objc_alloc_init(HUSwitchControlPanelConfiguration);
  v14[2] = v5;
  id v6 = objc_alloc_init(HUMultiStateControlPanelConfiguration);
  v14[3] = v6;
  id v7 = objc_alloc_init(HUTemperatureControlPanelConfiguration);
  v14[4] = v7;
  id v8 = objc_alloc_init(HUWheelControlPanelConfiguration);
  v14[5] = v8;
  uint64_t v9 = objc_alloc_init(HUDurationWheelControlPanelConfiguration);
  v14[6] = v9;
  uint64_t v10 = objc_alloc_init(HUTemperatureUnitControlPanelConfiguration);
  v14[7] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:8];
  uint64_t v12 = [v2 setWithArray:v11];

  return v12;
}

- (id)_configurationForItem:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = [(HUControlPanelController *)self configurations];
  uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v27;
    do
    {
      uint64_t v9 = 0;
      uint64_t v24 = v6;
      do
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v26 + 1) + 8 * v9);
        uint64_t v11 = [v10 rule];
        int v12 = [v11 ruleMatchesItem:v4];

        if (v12)
        {
          if (v7)
          {
            uint64_t v13 = v8;
            id v14 = v4;
            uint64_t v15 = NSNumber;
            long long v16 = [v7 rule];
            [v16 priority];
            long long v17 = objc_msgSend(v15, "numberWithDouble:");
            long long v18 = NSNumber;
            long long v19 = [v10 rule];
            [v19 priority];
            long long v20 = objc_msgSend(v18, "numberWithDouble:");
            uint64_t v21 = [v17 compare:v20];

            if (v21)
            {
              if (v21 == -1)
              {
                id v22 = v10;

                id v7 = v22;
              }
              id v4 = v14;
            }
            else
            {
              id v4 = v14;
              NSLog(&cfstr_FoundTwoConfig.isa, v14, v7, v10);
            }
            uint64_t v8 = v13;
            uint64_t v6 = v24;
          }
          else
          {
            id v7 = v10;
          }
        }
        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v6);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_valueTransformerForControlItem:(id)a3 controlPanelItem:(id)a4
{
  id v6 = a3;
  id v7 = [(HUControlPanelController *)self _configurationForItem:a4];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([v7 valueTransformerForControlItem:v6],
        (uint64_t v8 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v8 = [MEMORY[0x1E4F69760] identityTransformer];
  }

  return v8;
}

- (id)_createWriteThrottleForControlItem:(id)a3 controlPanelItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 identifierForControlItem:v6];
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F7A0F8]) initWithThrottleInterval:0.25];
  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __80__HUControlPanelController__createWriteThrottleForControlItem_controlPanelItem___block_invoke;
  v15[3] = &unk_1E63917F8;
  objc_copyWeak(&v19, &location);
  id v10 = v8;
  id v16 = v10;
  id v11 = v6;
  id v17 = v11;
  id v12 = v7;
  id v18 = v12;
  id v13 = (id)[v9 observeValueChangesWithBlock:v15];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return v9;
}

void __80__HUControlPanelController__createWriteThrottleForControlItem_controlPanelItem___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v5 = [WeakRetained interactionStateByControlID];
  id v6 = [v5 objectForKeyedSubscript:*(void *)(a1 + 32)];

  objc_msgSend(v6, "setInFlightWriteCount:", objc_msgSend(v6, "inFlightWriteCount") + 1);
  [WeakRetained _updateWriteStateForControlItem:*(void *)(a1 + 40) controlPanelItem:*(void *)(a1 + 48)];
  id v7 = [WeakRetained _valueTransformerForControlItem:*(void *)(a1 + 40) controlPanelItem:*(void *)(a1 + 48)];
  uint64_t v8 = [v7 valueForTransformedValue:v3];
  uint64_t v9 = [*(id *)(a1 + 40) writeValue:v8];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __80__HUControlPanelController__createWriteThrottleForControlItem_controlPanelItem___block_invoke_2;
  v12[3] = &unk_1E63917D0;
  objc_copyWeak(&v16, (id *)(a1 + 56));
  id v10 = v6;
  id v13 = v10;
  id v14 = *(id *)(a1 + 40);
  id v15 = *(id *)(a1 + 48);
  id v11 = (id)[v9 addCompletionBlock:v12];

  objc_destroyWeak(&v16);
}

void __80__HUControlPanelController__createWriteThrottleForControlItem_controlPanelItem___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "setInFlightWriteCount:", objc_msgSend(*(id *)(a1 + 32), "inFlightWriteCount") - 1);
  [*(id *)(a1 + 32) inFlightWriteCount];
  [WeakRetained _updateWriteStateForControlItem:*(void *)(a1 + 40) controlPanelItem:*(void *)(a1 + 48)];
}

- (void)_updateWriteStateForControlView:(id)a3
{
  id v4 = a3;
  id v7 = [(HUControlPanelController *)self _controlPanelItemForControlView:v4];
  uint64_t v5 = [v4 identifier];

  id v6 = [v7 controlItemForIdentifier:v5];

  [(HUControlPanelController *)self _updateWriteStateForControlItem:v6 controlPanelItem:v7];
}

- (void)_updateWriteStateForControlItem:(id)a3 controlPanelItem:(id)a4
{
  id v16 = a3;
  id v6 = objc_msgSend(a4, "identifierForControlItem:");
  id v7 = [(HUControlPanelController *)self interactionStateByControlID];
  uint64_t v8 = [v7 objectForKeyedSubscript:v6];

  int v9 = [v8 areWritesInProgressOrPossible];
  BOOL v10 = ([v8 isUserInteractionActive] & 1) != 0 || objc_msgSend(v8, "inFlightWriteCount") != 0;
  [v8 setWritesInProgressOrPossible:v10];
  if (v9 != [v8 areWritesInProgressOrPossible])
  {
    int v11 = [v8 areWritesInProgressOrPossible];
    id v12 = [(HUControlPanelController *)self delegate];
    if (v11)
    {
      char v13 = objc_opt_respondsToSelector();

      if ((v13 & 1) == 0) {
        goto LABEL_11;
      }
      id v14 = [(HUControlPanelController *)self delegate];
      [v14 controlPanelController:self willBeginPossibleWritesForControlItem:v16];
    }
    else
    {
      int v15 = objc_opt_respondsToSelector();

      if ((v15 & 1) == 0) {
        goto LABEL_11;
      }
      id v14 = [(HUControlPanelController *)self delegate];
      [v14 controlPanelController:self didEndPossibleWritesForControlItem:v16];
    }
  }
LABEL_11:
}

- (void)controlViewDidBeginUserInteraction:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HUControlPanelController *)self interactionStateByControlID];
  id v6 = [v4 identifier];
  id v7 = [v5 objectForKeyedSubscript:v6];

  [v7 setUserInteractionActive:1];
  [(HUControlPanelController *)self _updateWriteStateForControlView:v4];
}

- (void)controlViewDidEndUserInteraction:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HUControlPanelController *)self interactionStateByControlID];
  id v6 = [v4 identifier];
  id v8 = [v5 objectForKeyedSubscript:v6];

  [v8 setUserInteractionActive:0];
  id v7 = [v8 writeThrottler];
  [v7 flushValueChanges];

  [(HUControlPanelController *)self _updateWriteStateForControlView:v4];
}

- (void)controlView:(id)a3 valueDidChange:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HUControlPanelController *)self interactionStateByControlID];
  int v9 = [v7 identifier];

  id v11 = [v8 objectForKeyedSubscript:v9];

  BOOL v10 = [v11 writeThrottler];
  [v10 setValue:v6 notifyObservers:1];
}

- (HUControlPanelControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUControlPanelControllerDelegate *)WeakRetained;
}

- (NSSet)allItems
{
  return &self->_allItems->super;
}

- (NSSet)configurations
{
  return self->_configurations;
}

- (NSMutableDictionary)interactionStateByControlID
{
  return self->_interactionStateByControlID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionStateByControlID, 0);
  objc_storeStrong((id *)&self->_configurations, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_allItems, 0);
}

@end