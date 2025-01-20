@interface HUSideBarSelectionManager
+ (id)sharedManager;
- (HFHomeKitObject)dashboarHomeKitObject;
- (HFItem)currentSelectedItem;
- (HUDashboardContext)currentContext;
- (HUSideBarItemManager)sideBarItemManager;
- (HUSideBarSelectionManager)initWithSideBarViewController:(id)a3 sideBarItemManager:(id)a4 delegate:(id)a5;
- (HUSideBarSelectionManagerDelegate)delegate;
- (HUSideBarViewController)sideBarViewController;
- (NSString)currentTabIdentifier;
- (id)initForTest;
- (void)_didUpdateToAutomationTab;
- (void)_didUpdateToDiscoverTab;
- (void)_didUpdateToHomeTab;
- (void)_didUpdateToTabForCategory:(id)a3;
- (void)_didUpdateToTabForRoom:(id)a3;
- (void)_updateAppearanceForSidebar;
- (void)_updateSidebarSelection;
- (void)setCurrentContext:(id)a3;
- (void)setCurrentTabIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSideBarItemManager:(id)a3;
- (void)setSideBarViewController:(id)a3;
- (void)updateWithSideBarViewController:(id)a3 sideBarItemManager:(id)a4;
@end

@implementation HUSideBarSelectionManager

+ (id)sharedManager
{
  return (id)sharedManager;
}

- (HUSideBarSelectionManager)initWithSideBarViewController:(id)a3 sideBarItemManager:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HUSideBarSelectionManager;
  v12 = [(HUSideBarSelectionManager *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_sideBarViewController, a3);
    objc_storeStrong((id *)&v13->_sideBarItemManager, a4);
    objc_storeStrong((id *)&v13->_delegate, a5);
    v14 = [MEMORY[0x1E4F695B8] sharedInstance];
    uint64_t v15 = [v14 selectedHomeAppTabIdentifier];
    v16 = (void *)v15;
    if (v15) {
      v17 = (void *)v15;
    }
    else {
      v17 = (void *)*MEMORY[0x1E4F684F8];
    }
    objc_storeStrong((id *)&v13->_currentTabIdentifier, v17);

    objc_storeStrong((id *)&sharedManager, v13);
  }

  return v13;
}

- (void)updateWithSideBarViewController:(id)a3 sideBarItemManager:(id)a4
{
  v6 = (HUSideBarViewController *)a3;
  v7 = (HUSideBarItemManager *)a4;
  sideBarViewController = self->_sideBarViewController;
  self->_sideBarViewController = v6;
  id v9 = v6;

  sideBarItemManager = self->_sideBarItemManager;
  self->_sideBarItemManager = v7;

  [(HUSideBarSelectionManager *)self _updateAppearanceForSidebar];
}

- (id)initForTest
{
  v4.receiver = self;
  v4.super_class = (Class)HUSideBarSelectionManager;
  v2 = [(HUSideBarSelectionManager *)&v4 init];
  if (v2) {
    objc_storeStrong((id *)&sharedManager, v2);
  }
  return v2;
}

- (HFHomeKitObject)dashboarHomeKitObject
{
  v3 = [(HUSideBarSelectionManager *)self currentContext];
  objc_super v4 = [v3 room];

  v5 = [(HUSideBarSelectionManager *)self currentContext];
  v6 = v5;
  if (v4) {
    [v5 room];
  }
  else {
  v7 = [v5 home];
  }

  return (HFHomeKitObject *)v7;
}

- (void)setCurrentTabIdentifier:(id)a3
{
  id v5 = a3;
  if (!-[NSString isEqualToString:](self->_currentTabIdentifier, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_currentTabIdentifier, a3);
    [(HUSideBarSelectionManager *)self _updateSidebarSelection];
  }
}

- (void)setCurrentContext:(id)a3
{
  id v5 = a3;
  if (!-[HUDashboardContext isEqual:](self->_currentContext, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_currentContext, a3);
    [(HUSideBarSelectionManager *)self _updateSidebarSelection];
  }
}

- (HFItem)currentSelectedItem
{
  v3 = [(HUSideBarSelectionManager *)self currentTabIdentifier];
  int v4 = [v3 isEqualToString:*MEMORY[0x1E4F68500]];

  if (v4)
  {
    id v5 = [(HUSideBarSelectionManager *)self sideBarItemManager];
    uint64_t v6 = [v5 automationItem];
LABEL_5:
    id v9 = (void *)v6;
    goto LABEL_11;
  }
  v7 = [(HUSideBarSelectionManager *)self currentTabIdentifier];
  int v8 = [v7 isEqualToString:*MEMORY[0x1E4F684F0]];

  if (v8)
  {
    id v5 = [(HUSideBarSelectionManager *)self sideBarItemManager];
    uint64_t v6 = [v5 discoverItem];
    goto LABEL_5;
  }
  id v10 = [(HUSideBarSelectionManager *)self currentContext];
  id v11 = [v10 room];

  if (v11)
  {
    id v5 = [(HUSideBarSelectionManager *)self sideBarItemManager];
    v12 = [(HUSideBarSelectionManager *)self currentContext];
    v13 = [v12 room];
    uint64_t v14 = [v5 roomItemForRoom:v13];
  }
  else
  {
    uint64_t v15 = [(HUSideBarSelectionManager *)self currentContext];
    v16 = [v15 accessoryTypeGroup];

    v17 = [(HUSideBarSelectionManager *)self sideBarItemManager];
    id v5 = v17;
    if (!v16)
    {
      uint64_t v6 = [v17 homeItem];
      goto LABEL_5;
    }
    v12 = [(HUSideBarSelectionManager *)self currentContext];
    v13 = [v12 accessoryTypeGroup];
    uint64_t v14 = [v5 categoryItemForCategory:v13];
  }
  id v9 = (void *)v14;

LABEL_11:

  return (HFItem *)v9;
}

- (void)_updateSidebarSelection
{
  [(HUSideBarSelectionManager *)self _updateAppearanceForSidebar];
  v3 = [(HUSideBarSelectionManager *)self delegate];
  [v3 contextDidUpdate];

  int v4 = [(HUSideBarSelectionManager *)self currentTabIdentifier];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4F68500]];

  if (v5)
  {
    [(HUSideBarSelectionManager *)self _didUpdateToAutomationTab];
    return;
  }
  uint64_t v6 = [(HUSideBarSelectionManager *)self currentTabIdentifier];
  int v7 = [v6 isEqualToString:*MEMORY[0x1E4F684F0]];

  if (v7)
  {
    [(HUSideBarSelectionManager *)self _didUpdateToDiscoverTab];
    return;
  }
  int v8 = [(HUSideBarSelectionManager *)self currentContext];
  id v9 = [v8 accessoryTypeGroup];

  id v10 = [(HUSideBarSelectionManager *)self currentContext];
  id v13 = v10;
  if (v9)
  {
    id v11 = [v10 accessoryTypeGroup];
    [(HUSideBarSelectionManager *)self _didUpdateToTabForCategory:v11];
LABEL_13:

    return;
  }
  v12 = [v10 room];

  if (v12)
  {
    id v13 = [(HUSideBarSelectionManager *)self currentContext];
    id v11 = [v13 room];
    [(HUSideBarSelectionManager *)self _didUpdateToTabForRoom:v11];
    goto LABEL_13;
  }

  [(HUSideBarSelectionManager *)self _didUpdateToHomeTab];
}

- (void)_didUpdateToHomeTab
{
  v3 = [(HUSideBarSelectionManager *)self sideBarItemManager];
  id v5 = [v3 homeItem];

  int v4 = [(HUSideBarSelectionManager *)self sideBarViewController];
  [v4 updateSelectionToItem:v5];
}

- (void)_didUpdateToTabForCategory:(id)a3
{
  id v4 = a3;
  id v5 = [(HUSideBarSelectionManager *)self sideBarItemManager];
  id v7 = [v5 categoryItemForCategory:v4];

  uint64_t v6 = [(HUSideBarSelectionManager *)self sideBarViewController];
  [v6 updateSelectionToItem:v7];
}

- (void)_didUpdateToTabForRoom:(id)a3
{
  id v4 = a3;
  id v5 = [(HUSideBarSelectionManager *)self sideBarItemManager];
  id v7 = [v5 roomItemForRoom:v4];

  uint64_t v6 = [(HUSideBarSelectionManager *)self sideBarViewController];
  [v6 updateSelectionToItem:v7];
}

- (void)_didUpdateToDiscoverTab
{
  v3 = [(HUSideBarSelectionManager *)self sideBarItemManager];
  id v5 = [v3 discoverItem];

  id v4 = [(HUSideBarSelectionManager *)self sideBarViewController];
  [v4 updateSelectionToItem:v5];
}

- (void)_didUpdateToAutomationTab
{
  v3 = [(HUSideBarSelectionManager *)self sideBarItemManager];
  id v5 = [v3 automationItem];

  id v4 = [(HUSideBarSelectionManager *)self sideBarViewController];
  [v4 updateSelectionToItem:v5];
}

- (void)_updateAppearanceForSidebar
{
  id v5 = [(HUSideBarSelectionManager *)self currentTabIdentifier];
  uint64_t v3 = [v5 isEqualToString:*MEMORY[0x1E4F684F8]];
  id v4 = [(HUSideBarSelectionManager *)self sideBarViewController];
  [v4 setShouldUseDashboardEffects:v3];
}

- (NSString)currentTabIdentifier
{
  return self->_currentTabIdentifier;
}

- (HUDashboardContext)currentContext
{
  return self->_currentContext;
}

- (HUSideBarViewController)sideBarViewController
{
  return self->_sideBarViewController;
}

- (void)setSideBarViewController:(id)a3
{
}

- (HUSideBarItemManager)sideBarItemManager
{
  return self->_sideBarItemManager;
}

- (void)setSideBarItemManager:(id)a3
{
}

- (HUSideBarSelectionManagerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_sideBarItemManager, 0);
  objc_storeStrong((id *)&self->_sideBarViewController, 0);
  objc_storeStrong((id *)&self->_currentContext, 0);

  objc_storeStrong((id *)&self->_currentTabIdentifier, 0);
}

@end