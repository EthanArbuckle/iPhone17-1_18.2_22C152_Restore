@interface HUQuickControlViewControllerCoordinator
- (BOOL)areControlsVisible;
- (BOOL)isReachable;
- (BOOL)shouldIncludeRoomNameInHeaderTitle;
- (BOOL)showIconOffState;
- (BOOL)valueSource:(id)a3 shouldOverrideValueForCharacteristic:(id)a4;
- (HFIconDescriptor)iconDescriptor;
- (HFItem)reachabilityItem;
- (HFOverrideCharacteristicValueSource)valueSource;
- (HFSimpleItemManager)itemManager;
- (HFSimpleItemManager)reachabilityItemManager;
- (HMHome)home;
- (HUQuickControlContentCharacteristicWritingUpdateAdapter)characteristicWritingAdapter;
- (HUQuickControlContentHosting)controlHost;
- (HUQuickControlViewController)activeController;
- (HUQuickControlViewControllerCoordinator)initWithItem:(id)a3 controlItems:(id)a4 home:(id)a5 delegate:(id)a6;
- (HUQuickControlViewControllerCoordinatorDelegate)delegate;
- (NSCopying)item;
- (NSSet)controlItems;
- (NSString)primaryStatusText;
- (NSString)secondaryStatusText;
- (id)_itemToUseForIconAndStatus;
- (id)_primaryStatusTextForLatestResults:(id)a3 showingSecondaryStatus:(BOOL)a4;
- (id)_secondaryStatusTextForLatestResults:(id)a3;
- (id)valueSource:(id)a3 overrideValueForCharacteristic:(id)a4;
- (void)_createControlViewControllersForControlItems:(id)a3;
- (void)_updateIconDescriptorNotifyingDelegate:(BOOL)a3;
- (void)_updateReachabilityStateNotifiyingDelegate:(BOOL)a3;
- (void)_updateStatusTextNotifyingDelegate:(BOOL)a3;
- (void)itemManager:(id)a3 didUpdateResultsForSourceItem:(id)a4;
- (void)quickControlViewControllerDidUpdateStatusOverrides:(id)a3;
- (void)setActiveController:(id)a3;
- (void)setControlHost:(id)a3;
- (void)setControlsVisible:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setPrimaryStatusText:(id)a3;
- (void)setSecondaryStatusText:(id)a3;
- (void)setShouldIncludeRoomNameInHeaderTitle:(BOOL)a3;
@end

@implementation HUQuickControlViewControllerCoordinator

- (HUQuickControlViewControllerCoordinator)initWithItem:(id)a3 controlItems:(id)a4 home:(id)a5 delegate:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v46.receiver = self;
  v46.super_class = (Class)HUQuickControlViewControllerCoordinator;
  v15 = [(HUQuickControlViewControllerCoordinator *)&v46 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_home, a5);
    objc_storeWeak((id *)&v16->_delegate, v14);
    objc_storeStrong((id *)&v16->_controlItems, a4);
    if ([v11 conformsToProtocol:&unk_1F1A3D558])
    {
      v17 = (objc_class *)MEMORY[0x1E4F69390];
      id v18 = v11;
      id v19 = [v17 alloc];
      v20 = [v18 valueSource];
      uint64_t v21 = [v19 initWithOriginalValueSource:v20 overrideValueProvider:v16];
      valueSource = v16->_valueSource;
      v16->_valueSource = (HFOverrideCharacteristicValueSource *)v21;

      uint64_t v23 = [v18 copyWithValueSource:v16->_valueSource];
      item = v16->_item;
      v16->_item = (NSCopying *)v23;
    }
    else
    {
      uint64_t v25 = [v11 copy];
      item = v16->_item;
      v16->_item = (NSCopying *)v25;
    }

    [(HUQuickControlViewControllerCoordinator *)v16 _createControlViewControllersForControlItems:v12];
    uint64_t v26 = [v11 copy];
    reachabilityItem = v16->_reachabilityItem;
    v16->_reachabilityItem = (HFItem *)v26;

    id v28 = objc_alloc(MEMORY[0x1E4F69590]);
    v29 = [(HUQuickControlViewControllerCoordinator *)v16 reachabilityItem];
    uint64_t v30 = [v28 initWithDelegate:v16 sourceItem:v29];
    reachabilityItemManager = v16->_reachabilityItemManager;
    v16->_reachabilityItemManager = (HFSimpleItemManager *)v30;

    id v32 = objc_alloc(MEMORY[0x1E4F69590]);
    v33 = [(HUQuickControlViewControllerCoordinator *)v16 item];
    uint64_t v34 = [v32 initWithDelegate:v16 sourceItem:v33];
    itemManager = v16->_itemManager;
    v16->_itemManager = (HFSimpleItemManager *)v34;

    v36 = [HUQuickControlContentCharacteristicWritingUpdateAdapter alloc];
    v37 = [(HUQuickControlViewControllerCoordinator *)v16 itemManager];
    uint64_t v38 = [(HUQuickControlContentCharacteristicWritingUpdateAdapter *)v36 initWithItemManager:v37];
    characteristicWritingAdapter = v16->_characteristicWritingAdapter;
    v16->_characteristicWritingAdapter = (HUQuickControlContentCharacteristicWritingUpdateAdapter *)v38;

    v40 = [(HUQuickControlViewControllerCoordinator *)v16 characteristicWritingAdapter];
    [(HUQuickControlViewController *)v16->_activeController setCharacteristicWritingDelegate:v40];

    [(HUQuickControlViewControllerCoordinator *)v16 _updateIconDescriptorNotifyingDelegate:0];
    [(HUQuickControlViewControllerCoordinator *)v16 _updateStatusTextNotifyingDelegate:0];
    [(HUQuickControlViewControllerCoordinator *)v16 _updateReachabilityStateNotifiyingDelegate:0];
    v41 = [(HUQuickControlViewControllerCoordinator *)v16 itemManager];
    id v42 = (id)[v41 reloadAndUpdateAllItemsFromSenderSelector:a2];

    v43 = [(HUQuickControlViewControllerCoordinator *)v16 reachabilityItemManager];
    id v44 = (id)[v43 reloadAndUpdateAllItemsFromSenderSelector:a2];
  }
  return v16;
}

- (void)_createControlViewControllersForControlItems:(id)a3
{
  id v42 = a3;
  v4 = [(HUQuickControlViewControllerCoordinator *)self delegate];
  int v5 = [v4 isConfiguredForNonHomeUser:self];

  if (!v5) {
    goto LABEL_3;
  }
  v6 = objc_msgSend(v42, "na_firstObjectPassingTest:", &__block_literal_global_234);
  v7 = [HUQuickControlViewControllerConfiguration alloc];
  v8 = [v6 mediaRoutingIdentifier];
  v9 = [(HUQuickControlViewControllerConfiguration *)v7 initWithMediaRoutingIdentifier:v8];

  if (!v9)
  {
LABEL_3:
    v10 = [HUQuickControlViewControllerConfiguration alloc];
    id v11 = [(HUQuickControlViewControllerCoordinator *)self home];
    v9 = [(HUQuickControlViewControllerConfiguration *)v10 initWithHome:v11];
  }
  id v12 = [(HUQuickControlViewControllerCoordinator *)self valueSource];
  [(HUQuickControlViewControllerConfiguration *)v9 setValueSource:v12];

  v41 = v9;
  id v13 = objc_msgSend(MEMORY[0x1E4F69098], "hu_preferredQuickControlGroupContextForControlItems:configuration:", v42, v9);
  id v14 = [v13 primaryQuickControlContext];
  if (objc_msgSend((id)objc_msgSend(v14, "quickControlClass"), "isEqual:", objc_opt_class())) {
    goto LABEL_9;
  }
  v15 = [v13 alternateQuickControlContexts];
  if (![v15 count])
  {

LABEL_9:
    goto LABEL_10;
  }
  v16 = [v13 primaryQuickControlContext];
  char v17 = objc_msgSend((id)objc_msgSend(v16, "quickControlClass"), "isEqual:", objc_opt_class());

  if ((v17 & 1) == 0)
  {
    id v18 = [HUQuickControlGridViewController alloc];
    id v19 = [v13 allControlItems];
    v20 = [(HUQuickControlViewControllerCoordinator *)self home];
    uint64_t v21 = [v13 primaryQuickControlContext];
    v22 = [v21 itemUpdater];
    uint64_t v23 = [v13 primaryQuickControlContext];
    uint64_t v24 = [v23 controlOrientation];
    uint64_t v25 = [v13 primaryQuickControlContext];
    uint64_t v26 = -[HUQuickControlGridViewController initWithControlItems:home:itemUpdater:controlOrientation:preferredControl:](v18, "initWithControlItems:home:itemUpdater:controlOrientation:preferredControl:", v19, v20, v22, v24, [v25 preferredControl]);
    goto LABEL_11;
  }
LABEL_10:
  v39 = [v13 primaryQuickControlContext];
  id v38 = objc_alloc((Class)[v39 quickControlClass]);
  v27 = [v13 primaryQuickControlContext];
  [v27 controlItems];
  uint64_t v28 = v40 = self;
  v22 = [v13 primaryQuickControlContext];
  uint64_t v23 = [v22 home];
  uint64_t v25 = [v13 primaryQuickControlContext];
  v29 = [v25 itemUpdater];
  uint64_t v30 = [v13 primaryQuickControlContext];
  uint64_t v31 = [v30 controlOrientation];
  id v32 = [v13 primaryQuickControlContext];
  uint64_t v26 = (HUQuickControlGridViewController *)objc_msgSend(v38, "initWithControlItems:home:itemUpdater:controlOrientation:preferredControl:", v28, v23, v29, v31, objc_msgSend(v32, "preferredControl"));

  uint64_t v21 = (void *)v28;
  self = v40;

  v20 = v27;
  id v19 = v39;
LABEL_11:

  [(HUQuickControlViewControllerCoordinator *)self setActiveController:v26];
  v33 = [(HUQuickControlViewControllerCoordinator *)self activeController];
  [v33 setDelegate:self];

  uint64_t v34 = [(HUQuickControlViewControllerCoordinator *)self characteristicWritingAdapter];
  v35 = [(HUQuickControlViewControllerCoordinator *)self activeController];
  [v35 setCharacteristicWritingDelegate:v34];

  v36 = [(HUQuickControlViewControllerCoordinator *)self controlHost];
  v37 = [(HUQuickControlViewControllerCoordinator *)self activeController];
  [v37 setQuickControlHost:v36];
}

uint64_t __88__HUQuickControlViewControllerCoordinator__createControlViewControllersForControlItems___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)setControlHost:(id)a3
{
  p_controlHost = &self->_controlHost;
  id v5 = a3;
  objc_storeWeak((id *)p_controlHost, v5);
  [(HUQuickControlViewController *)self->_activeController setQuickControlHost:v5];
}

- (void)setControlsVisible:(BOOL)a3
{
  if (self->_controlsVisible != a3)
  {
    self->_controlsVisible = a3;
    -[HUQuickControlViewController setControlsVisible:](self->_activeController, "setControlsVisible:");
  }
}

- (void)setShouldIncludeRoomNameInHeaderTitle:(BOOL)a3
{
  if (self->_shouldIncludeRoomNameInHeaderTitle != a3)
  {
    self->_shouldIncludeRoomNameInHeaderTitle = a3;
    [(HUQuickControlViewControllerCoordinator *)self _updateStatusTextNotifyingDelegate:1];
  }
}

- (id)_itemToUseForIconAndStatus
{
  if ([(HUQuickControlViewControllerCoordinator *)self isReachable]) {
    [(HUQuickControlViewControllerCoordinator *)self item];
  }
  else {
  v3 = [(HUQuickControlViewControllerCoordinator *)self reachabilityItem];
  }

  return v3;
}

- (void)_updateIconDescriptorNotifyingDelegate:(BOOL)a3
{
  BOOL v3 = a3;
  id v15 = [(HUQuickControlViewControllerCoordinator *)self _itemToUseForIconAndStatus];
  id v5 = [v15 latestResults];
  v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F689E8]];

  v7 = [(HUQuickControlViewControllerCoordinator *)self activeController];

  if (v7)
  {
    v8 = [v15 latestResults];
    uint64_t v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F68C20]];
    if (v9)
    {
      v10 = (void *)v9;

LABEL_5:
      LOBYTE(v7) = [v10 integerValue] != 2;

      goto LABEL_6;
    }
    id v11 = [v15 latestResults];
    v10 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F68BC0]];

    if (v10) {
      goto LABEL_5;
    }
    LOBYTE(v7) = 0;
  }
LABEL_6:
  iconDescriptor = self->_iconDescriptor;
  self->_iconDescriptor = v6;

  self->_showIconOffState = (char)v7;
  if (v3)
  {
    id v13 = [(HUQuickControlViewControllerCoordinator *)self delegate];
    id v14 = [(HUQuickControlViewControllerCoordinator *)self iconDescriptor];
    objc_msgSend(v13, "controllerCoordinator:didUpdateIconDescriptor:showOffState:", self, v14, -[HUQuickControlViewControllerCoordinator showIconOffState](self, "showIconOffState"));
  }
}

- (id)_primaryStatusTextForLatestResults:(id)a3 showingSecondaryStatus:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315650;
    id v12 = "-[HUQuickControlViewControllerCoordinator _primaryStatusTextForLatestResults:showingSecondaryStatus:]";
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 1024;
    BOOL v16 = v4;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_INFO, "%s %@ %d", (uint8_t *)&v11, 0x1Cu);
  }

  if (v4
    || ([v6 objectForKeyedSubscript:*MEMORY[0x1E4F689A0]],
        (uint64_t v9 = objc_claimAutoreleasedReturnValue()) == 0)
    && ([v6 objectForKeyedSubscript:*MEMORY[0x1E4F689C8]],
        (uint64_t v9 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v8 = [(HUQuickControlViewControllerCoordinator *)self activeController];
    uint64_t v9 = [v8 overrideStatusText];

    if (!v9)
    {
      uint64_t v9 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F68948]];
      if (!v9)
      {
        uint64_t v9 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F68980]];
      }
    }
  }

  return v9;
}

- (id)_secondaryStatusTextForLatestResults:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F689C8]];
  if (!v5)
  {
    id v6 = [(HUQuickControlViewControllerCoordinator *)self activeController];
    id v5 = [v6 overrideSecondaryStatusText];

    if (!v5)
    {
      id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F68998]];
    }
  }

  return v5;
}

- (void)_updateStatusTextNotifyingDelegate:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(HUQuickControlViewControllerCoordinator *)self _itemToUseForIconAndStatus];
  id v26 = [v5 latestResults];

  id v6 = [v26 objectForKeyedSubscript:*MEMORY[0x1E4F68970]];
  v7 = v6;
  if (!v6) {
    id v6 = &unk_1F19B4DC0;
  }
  uint64_t v8 = [v6 unsignedIntegerValue];

  if (v8 == 1)
  {
    int v11 = [(HUQuickControlViewControllerCoordinator *)self item];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v9 = [v26 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
      v10 = [v26 objectForKeyedSubscript:*MEMORY[0x1E4F68980]];
      if (![v10 length])
      {
        uint64_t v13 = [v26 objectForKeyedSubscript:*MEMORY[0x1E4F68948]];

        v10 = (void *)v13;
      }
    }
    else
    {
      id v14 = [v26 objectForKeyedSubscript:*MEMORY[0x1E4F68A60]];
      if ([(HUQuickControlViewControllerCoordinator *)self shouldIncludeRoomNameInHeaderTitle])
      {
        [v14 composedString];
      }
      else
      {
        [v14 serviceName];
      uint64_t v9 = };
      v10 = [(HUQuickControlViewControllerCoordinator *)self _primaryStatusTextForLatestResults:v26 showingSecondaryStatus:0];
    }
  }
  else if (v8)
  {
    v10 = 0;
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = [(HUQuickControlViewControllerCoordinator *)self _primaryStatusTextForLatestResults:v26 showingSecondaryStatus:1];
    v10 = [(HUQuickControlViewControllerCoordinator *)self _secondaryStatusTextForLatestResults:v26];
  }
  __int16 v15 = [(HUQuickControlViewControllerCoordinator *)self primaryStatusText];
  BOOL v16 = v15;
  if (!v15) {
    __int16 v15 = &stru_1F18F92B8;
  }
  int v17 = [(__CFString *)v15 isEqualToString:v9];

  id v18 = (void *)[v9 copy];
  [(HUQuickControlViewControllerCoordinator *)self setPrimaryStatusText:v18];

  id v19 = [(HUQuickControlViewControllerCoordinator *)self secondaryStatusText];
  v20 = v19;
  if (!v19) {
    id v19 = &stru_1F18F92B8;
  }
  int v21 = [(__CFString *)v19 isEqualToString:v10];

  v22 = (void *)[v10 copy];
  [(HUQuickControlViewControllerCoordinator *)self setSecondaryStatusText:v22];

  if ((v17 & v21 & 1) == 0 && v3)
  {
    uint64_t v23 = [(HUQuickControlViewControllerCoordinator *)self delegate];
    uint64_t v24 = [(HUQuickControlViewControllerCoordinator *)self primaryStatusText];
    uint64_t v25 = [(HUQuickControlViewControllerCoordinator *)self secondaryStatusText];
    [v23 controllerCoordinator:self didUpdateStatusWithPrimaryText:v24 secondaryText:v25];
  }
}

- (void)_updateReachabilityStateNotifiyingDelegate:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(HUQuickControlViewControllerCoordinator *)self reachabilityItem];
  id v6 = [v5 latestResults];
  v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F68BC0]];
  uint64_t v8 = [v7 integerValue];

  BOOL v9 = v8 != 0;
  if (self->_reachable != v9)
  {
    self->_reachable = v9;
    if (v3)
    {
      BOOL v10 = v8 != 0;
      int v11 = [(HUQuickControlViewControllerCoordinator *)self delegate];
      [v11 controllerCoordinator:self didUpdateReachability:v10];
    }
    [(HUQuickControlViewControllerCoordinator *)self _updateStatusTextNotifyingDelegate:1];
    [(HUQuickControlViewControllerCoordinator *)self _updateIconDescriptorNotifyingDelegate:1];
  }
}

- (void)itemManager:(id)a3 didUpdateResultsForSourceItem:(id)a4
{
  id v9 = a4;
  id v6 = [(HUQuickControlViewControllerCoordinator *)self reachabilityItem];

  if (v6 == v9)
  {
    [(HUQuickControlViewControllerCoordinator *)self _updateReachabilityStateNotifiyingDelegate:1];
  }
  else
  {
    id v7 = [(HUQuickControlViewControllerCoordinator *)self item];

    if (v7 == v9)
    {
      [(HUQuickControlViewControllerCoordinator *)self _updateIconDescriptorNotifyingDelegate:1];
      [(HUQuickControlViewControllerCoordinator *)self _updateStatusTextNotifyingDelegate:1];
    }
    else
    {
      uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2, self, @"HUQuickControlViewControllerCoordinator.m", 291, @"Unknown source item %@", v9 object file lineNumber description];
    }
  }
}

- (BOOL)valueSource:(id)a3 shouldOverrideValueForCharacteristic:(id)a4
{
  id v5 = a4;
  id v6 = [(HUQuickControlViewControllerCoordinator *)self _controllerForControllableCharacteristic:v5];
  id v7 = [v6 overrideValueForCharacteristic:v5];

  return v7 != 0;
}

- (id)valueSource:(id)a3 overrideValueForCharacteristic:(id)a4
{
  id v5 = a4;
  id v6 = [(HUQuickControlViewControllerCoordinator *)self _controllerForControllableCharacteristic:v5];
  id v7 = [v6 overrideValueForCharacteristic:v5];

  return v7;
}

- (void)quickControlViewControllerDidUpdateStatusOverrides:(id)a3
{
}

- (HMHome)home
{
  return self->_home;
}

- (NSCopying)item
{
  return self->_item;
}

- (HUQuickControlViewControllerCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUQuickControlViewControllerCoordinatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HUQuickControlContentHosting)controlHost
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controlHost);

  return (HUQuickControlContentHosting *)WeakRetained;
}

- (HUQuickControlViewController)activeController
{
  return self->_activeController;
}

- (void)setActiveController:(id)a3
{
}

- (BOOL)areControlsVisible
{
  return self->_controlsVisible;
}

- (BOOL)shouldIncludeRoomNameInHeaderTitle
{
  return self->_shouldIncludeRoomNameInHeaderTitle;
}

- (HFIconDescriptor)iconDescriptor
{
  return self->_iconDescriptor;
}

- (BOOL)showIconOffState
{
  return self->_showIconOffState;
}

- (NSString)primaryStatusText
{
  return self->_primaryStatusText;
}

- (void)setPrimaryStatusText:(id)a3
{
}

- (NSString)secondaryStatusText
{
  return self->_secondaryStatusText;
}

- (void)setSecondaryStatusText:(id)a3
{
}

- (BOOL)isReachable
{
  return self->_reachable;
}

- (HFOverrideCharacteristicValueSource)valueSource
{
  return self->_valueSource;
}

- (HFSimpleItemManager)itemManager
{
  return self->_itemManager;
}

- (NSSet)controlItems
{
  return self->_controlItems;
}

- (HFItem)reachabilityItem
{
  return self->_reachabilityItem;
}

- (HFSimpleItemManager)reachabilityItemManager
{
  return self->_reachabilityItemManager;
}

- (HUQuickControlContentCharacteristicWritingUpdateAdapter)characteristicWritingAdapter
{
  return self->_characteristicWritingAdapter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characteristicWritingAdapter, 0);
  objc_storeStrong((id *)&self->_reachabilityItemManager, 0);
  objc_storeStrong((id *)&self->_reachabilityItem, 0);
  objc_storeStrong((id *)&self->_controlItems, 0);
  objc_storeStrong((id *)&self->_itemManager, 0);
  objc_storeStrong((id *)&self->_valueSource, 0);
  objc_storeStrong((id *)&self->_secondaryStatusText, 0);
  objc_storeStrong((id *)&self->_primaryStatusText, 0);
  objc_storeStrong((id *)&self->_iconDescriptor, 0);
  objc_storeStrong((id *)&self->_activeController, 0);
  objc_destroyWeak((id *)&self->_controlHost);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_item, 0);

  objc_storeStrong((id *)&self->_home, 0);
}

@end