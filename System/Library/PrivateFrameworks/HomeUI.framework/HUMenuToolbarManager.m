@interface HUMenuToolbarManager
+ (BOOL)isValidMenuSelector:(SEL)a3;
- (BOOL)_shouldEnableIdentifier:(id)a3;
- (HMHome)home;
- (HMRoom)room;
- (HOAppNavigator)appNavigator;
- (HUMenuToolbarManager)initWithAppNavigator:(id)a3;
- (UIMenuBuilder)menuBuilder;
- (id)_buildActionForIdentifier:(id)a3;
- (id)_buildHomeMenu;
- (id)_buildKeyCommandForIdentifier:(id)a3;
- (id)_buildMenuForIdentifier:(id)a3;
- (id)_editMenuIdentifiers;
- (id)_fileMenuIdentifiers;
- (id)_helpMenuIdentifiers;
- (id)_subViewMenuIdentifiers;
- (id)_viewMenuIdentifiers;
- (void)_automationMenuSelected;
- (void)_discoverMenuSelected;
- (void)_editHomeMenuSelected;
- (void)_editRoomMenuSelected;
- (void)_homeMenuSelected;
- (void)buildMenu;
- (void)home:(id)a3 didAddAccessory:(id)a4;
- (void)home:(id)a3 didAddRoom:(id)a4;
- (void)home:(id)a3 didRemoveAccessory:(id)a4;
- (void)home:(id)a3 didRemoveRoom:(id)a4;
- (void)home:(id)a3 didSelectRoom:(id)a4;
- (void)homeKitDispatcher:(id)a3 manager:(id)a4 didChangeHome:(id)a5;
- (void)homeManager:(id)a3 didAddHome:(id)a4;
- (void)homeManager:(id)a3 didRemoveHome:(id)a4;
- (void)refreshEditMenu;
- (void)refreshFileMenu;
- (void)refreshHelpMenu;
- (void)refreshViewMenu;
- (void)refreshViewMenuChildren;
- (void)setAppNavigator:(id)a3;
- (void)setHome:(id)a3;
- (void)setMenuBuilder:(id)a3;
- (void)setRoom:(id)a3;
@end

@implementation HUMenuToolbarManager

- (HUMenuToolbarManager)initWithAppNavigator:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HUMenuToolbarManager;
  v5 = [(HUMenuToolbarManager *)&v12 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_appNavigator, v4);
    v7 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    v8 = [v7 home];
    [(HUMenuToolbarManager *)v6 setHome:v8];

    v9 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    [v9 addHomeObserver:v6];

    v10 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    [v10 addHomeManagerObserver:v6];
  }
  return v6;
}

- (void)setHome:(id)a3
{
  id v7 = a3;
  if ((-[HMHome isEqual:](self->_home, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_home, a3);
    objc_msgSend(v7, "hf_selectedRoom");
    v5 = (HMRoom *)objc_claimAutoreleasedReturnValue();
    room = self->_room;
    self->_room = v5;

    [(HUMenuToolbarManager *)self buildMenu];
  }
}

- (void)setRoom:(id)a3
{
  id v5 = a3;
  if ((-[HMRoom isEqual:](self->_room, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_room, a3);
    [(HUMenuToolbarManager *)self refreshViewMenuChildren];
  }
}

- (void)setMenuBuilder:(id)a3
{
  objc_storeStrong((id *)&self->_menuBuilder, a3);

  [(HUMenuToolbarManager *)self buildMenu];
}

- (void)buildMenu
{
  v3 = [(HUMenuToolbarManager *)self menuBuilder];

  if (v3)
  {
    [(HUMenuToolbarManager *)self refreshFileMenu];
    [(HUMenuToolbarManager *)self refreshEditMenu];
    [(HUMenuToolbarManager *)self refreshViewMenuChildren];
    [(HUMenuToolbarManager *)self refreshViewMenu];
    [(HUMenuToolbarManager *)self refreshHelpMenu];
  }
}

- (void)refreshHelpMenu
{
  v3 = [(HUMenuToolbarManager *)self menuBuilder];
  id v4 = [v3 menuForIdentifier:@"HUMenuToolbarIdentifierHelp"];

  if (!v4)
  {
    id v5 = [(HUMenuToolbarManager *)self _helpMenuIdentifiers];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __39__HUMenuToolbarManager_refreshHelpMenu__block_invoke;
    v9[3] = &unk_1E63886E8;
    v9[4] = self;
    v6 = objc_msgSend(v5, "na_map:", v9);

    id v7 = [MEMORY[0x1E4F42B80] menuWithTitle:&stru_1F18F92B8 image:0 identifier:@"HUMenuToolbarIdentifierHelp" options:1 children:v6];
    v8 = [(HUMenuToolbarManager *)self menuBuilder];
    [v8 insertChildMenu:v7 atEndOfMenuForIdentifier:*MEMORY[0x1E4F43BC0]];
  }
}

uint64_t __39__HUMenuToolbarManager_refreshHelpMenu__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _buildActionForIdentifier:a2];
}

- (void)refreshViewMenuChildren
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v3 = [(HUMenuToolbarManager *)self _subViewMenuIdentifiers];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__HUMenuToolbarManager_refreshViewMenuChildren__block_invoke;
  v6[3] = &unk_1E6388710;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "na_each:", v6);

  if (*((unsigned char *)v8 + 24))
  {
    id v4 = [(HUMenuToolbarManager *)self menuBuilder];
    id v5 = [v4 system];
    [v5 setNeedsRebuild];
  }
  _Block_object_dispose(&v7, 8);
}

void __47__HUMenuToolbarManager_refreshViewMenuChildren__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "_buildMenuForIdentifier:");
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) menuBuilder];
    id v5 = [v4 menuForIdentifier:v7];

    if (v5)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      v6 = [*(id *)(a1 + 32) menuBuilder];
      [v6 replaceMenuForIdentifier:v7 withMenu:v3];
    }
    else
    {
      v6 = [*(id *)(a1 + 32) menuBuilder];
      [v6 insertChildMenu:v3 atStartOfMenuForIdentifier:*MEMORY[0x1E4F43BE8]];
    }
  }
}

- (void)refreshViewMenu
{
  v3 = [(HUMenuToolbarManager *)self _viewMenuIdentifiers];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __39__HUMenuToolbarManager_refreshViewMenu__block_invoke;
  v11[3] = &unk_1E63886E8;
  v11[4] = self;
  id v4 = objc_msgSend(v3, "na_map:", v11);

  id v5 = [MEMORY[0x1E4F42B80] menuWithTitle:&stru_1F18F92B8 image:0 identifier:@"HUMenuToolbarIdentifierView" options:1 children:v4];
  v6 = [(HUMenuToolbarManager *)self menuBuilder];
  id v7 = [v6 menuForIdentifier:@"HUMenuToolbarIdentifierView"];

  v8 = [(HUMenuToolbarManager *)self menuBuilder];
  uint64_t v9 = v8;
  if (v7)
  {
    [v8 replaceMenuForIdentifier:@"HUMenuToolbarIdentifierView" withMenu:v5];

    uint64_t v9 = [(HUMenuToolbarManager *)self menuBuilder];
    char v10 = [v9 system];
    [v10 setNeedsRebuild];
  }
  else
  {
    [v8 insertChildMenu:v5 atStartOfMenuForIdentifier:*MEMORY[0x1E4F43BE8]];
  }
}

uint64_t __39__HUMenuToolbarManager_refreshViewMenu__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _buildKeyCommandForIdentifier:a2];
}

- (void)refreshFileMenu
{
  v3 = [(HUMenuToolbarManager *)self _fileMenuIdentifiers];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __39__HUMenuToolbarManager_refreshFileMenu__block_invoke;
  v11[3] = &unk_1E63886E8;
  v11[4] = self;
  id v4 = objc_msgSend(v3, "na_map:", v11);

  id v5 = [MEMORY[0x1E4F42B80] menuWithTitle:&stru_1F18F92B8 image:0 identifier:@"HUMenuToolbarIdentifierFile" options:1 children:v4];
  v6 = [(HUMenuToolbarManager *)self menuBuilder];
  id v7 = [v6 menuForIdentifier:@"HUMenuToolbarIdentifierFile"];

  v8 = [(HUMenuToolbarManager *)self menuBuilder];
  uint64_t v9 = v8;
  if (v7)
  {
    [v8 replaceMenuForIdentifier:@"HUMenuToolbarIdentifierFile" withMenu:v5];

    uint64_t v9 = [(HUMenuToolbarManager *)self menuBuilder];
    char v10 = [v9 system];
    [v10 setNeedsRebuild];
  }
  else
  {
    [v8 insertChildMenu:v5 atStartOfMenuForIdentifier:*MEMORY[0x1E4F43BB0]];
  }
}

uint64_t __39__HUMenuToolbarManager_refreshFileMenu__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _buildActionForIdentifier:a2];
}

- (void)refreshEditMenu
{
  v3 = [(HUMenuToolbarManager *)self _editMenuIdentifiers];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __39__HUMenuToolbarManager_refreshEditMenu__block_invoke;
  v11[3] = &unk_1E63886E8;
  v11[4] = self;
  id v4 = objc_msgSend(v3, "na_map:", v11);

  id v5 = [MEMORY[0x1E4F42B80] menuWithTitle:&stru_1F18F92B8 image:0 identifier:@"HUMenuToolbarIdentifierEdit" options:1 children:v4];
  v6 = [(HUMenuToolbarManager *)self menuBuilder];
  id v7 = [v6 menuForIdentifier:@"HUMenuToolbarIdentifierEdit"];

  v8 = [(HUMenuToolbarManager *)self menuBuilder];
  uint64_t v9 = v8;
  if (v7)
  {
    [v8 replaceMenuForIdentifier:@"HUMenuToolbarIdentifierEdit" withMenu:v5];

    uint64_t v9 = [(HUMenuToolbarManager *)self menuBuilder];
    char v10 = [v9 system];
    [v10 setNeedsRebuild];
  }
  else
  {
    [v8 insertSiblingMenu:v5 afterMenuForIdentifier:*MEMORY[0x1E4F43BE0]];
  }
}

uint64_t __39__HUMenuToolbarManager_refreshEditMenu__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _buildKeyCommandForIdentifier:a2];
}

- (id)_fileMenuIdentifiers
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"HUMenuToolbarIdentifierAddAutomation";
  v4[1] = @"HUMenuToolbarIdentifierAddScene";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];

  return v2;
}

- (id)_editMenuIdentifiers
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"HUMenuToolbarIdentifierEditHome";
  v4[1] = @"HUMenuToolbarIdentifierEditRoom";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];

  return v2;
}

- (id)_helpMenuIdentifiers
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"HUMenuToolbarIdentifierAboutHomeKit";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (id)_viewMenuIdentifiers
{
  void v4[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"HUMenuToolbarIdentifierHome";
  v4[1] = @"HUMenuToolbarIdentifierAutomation";
  void v4[2] = @"HUMenuToolbarIdentifierDiscover";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:3];

  return v2;
}

- (id)_subViewMenuIdentifiers
{
  void v4[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"HUMenuToolbarIdentifierInvitation";
  v4[1] = @"HUMenuToolbarIdentifierRoomList";
  void v4[2] = @"HUMenuToolbarIdentifierHomeList";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:3];

  return v2;
}

- (BOOL)_shouldEnableIdentifier:(id)a3
{
  id v4 = a3;
  if (![v4 isEqualToString:@"HUMenuToolbarIdentifierAddAutomation"])
  {
    if ([v4 isEqualToString:@"HUMenuToolbarIdentifierAddScene"])
    {
      id v5 = [(HUMenuToolbarManager *)self home];
      if (objc_msgSend(v5, "hf_currentUserIsAdministrator"))
      {
        v6 = [(HUMenuToolbarManager *)self home];
        char v7 = objc_msgSend(v6, "hf_containsActionableAccessories");
        goto LABEL_7;
      }
LABEL_25:
      LOBYTE(self) = 0;
      goto LABEL_26;
    }
    if (([v4 isEqualToString:@"HUMenuToolbarIdentifierEditHome"] & 1) != 0
      || [v4 isEqualToString:@"HUMenuToolbarIdentifierHome"])
    {
      id v5 = [(HUMenuToolbarManager *)self home];
      LOBYTE(self) = v5 != 0;
      goto LABEL_26;
    }
    if (([v4 isEqualToString:@"HUMenuToolbarIdentifierEditRoom"] & 1) != 0
      || [v4 isEqualToString:@"HUMenuToolbarIdentifierRoomList"])
    {
      id v5 = [(HUMenuToolbarManager *)self home];
      if (!v5) {
        goto LABEL_25;
      }
      v6 = [(HUMenuToolbarManager *)self home];
      v8 = [v6 accessories];
      if ([v8 count])
      {
        LOBYTE(self) = 1;
      }
      else
      {
        uint64_t v9 = [(HUMenuToolbarManager *)self room];
        char v10 = [(HUMenuToolbarManager *)self home];
        v11 = [v10 roomForEntireHome];
        LODWORD(self) = [v9 isEqual:v11] ^ 1;
      }
    }
    else
    {
      if ([v4 isEqualToString:@"HUMenuToolbarIdentifierAutomation"])
      {
        id v5 = [(HUMenuToolbarManager *)self home];
        if (objc_msgSend(v5, "hf_hasAnyVisibleTriggers"))
        {
          LOBYTE(self) = 1;
          goto LABEL_26;
        }
        v6 = [(HUMenuToolbarManager *)self home];
        if (objc_msgSend(v6, "hf_userIsAllowedToCreateTrigger"))
        {
          LOBYTE(self) = 1;
          goto LABEL_8;
        }
        char v7 = HFForceAllowAutomationCreation();
        goto LABEL_7;
      }
      if ([v4 isEqualToString:@"HUMenuToolbarIdentifierDiscover"])
      {
        id v5 = [(HUMenuToolbarManager *)self home];
        if (v5)
        {
          objc_super v12 = [MEMORY[0x1E4F695F0] getAvailabilityDictionary];
          LOBYTE(self) = v12 != 0;

          goto LABEL_26;
        }
        goto LABEL_25;
      }
      if ([v4 isEqualToString:@"HUMenuToolbarIdentifierAboutHomeKit"])
      {
        LOBYTE(self) = 1;
        goto LABEL_27;
      }
      if ([v4 isEqualToString:@"HUMenuToolbarIdentifierInvitation"])
      {
        id v5 = [MEMORY[0x1E4F691A0] sharedDispatcher];
        v6 = [v5 homeManager];
        v14 = [v6 incomingHomeInvitations];
      }
      else
      {
        if (![v4 isEqualToString:@"HUMenuToolbarIdentifierHomeList"])
        {
          LOBYTE(self) = 0;
          goto LABEL_27;
        }
        id v5 = [MEMORY[0x1E4F691A0] sharedDispatcher];
        v6 = [v5 homeManager];
        v14 = [v6 homes];
      }
      v8 = v14;
      LOBYTE(self) = [v14 count] != 0;
    }

    goto LABEL_8;
  }
  id v5 = [(HUMenuToolbarManager *)self home];
  if (!objc_msgSend(v5, "hf_currentUserIsAdministrator")) {
    goto LABEL_25;
  }
  v6 = [(HUMenuToolbarManager *)self home];
  char v7 = objc_msgSend(v6, "hf_userCanCreateTrigger");
LABEL_7:
  LOBYTE(self) = v7;
LABEL_8:

LABEL_26:
LABEL_27:

  return (char)self;
}

- (id)_buildMenuForIdentifier:(id)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isEqualToString:@"HUMenuToolbarIdentifierHomeList"]
    && [(HUMenuToolbarManager *)self _shouldEnableIdentifier:v4])
  {
    id v5 = [(HUMenuToolbarManager *)self _buildHomeMenu];
  }
  else if ([v4 isEqualToString:@"HUMenuToolbarIdentifierInvitation"] {
         && [(HUMenuToolbarManager *)self _shouldEnableIdentifier:v4])
  }
  {
    v6 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    char v7 = [v6 homeManager];
    v8 = [v7 incomingHomeInvitations];
    uint64_t v9 = [v8 count];
    v16 = HULocalizedStringWithFormat(@"HULocationInvitationCount", @"%lu", v10, v11, v12, v13, v14, v15, v9);

    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __48__HUMenuToolbarManager__buildMenuForIdentifier___block_invoke;
    v21[3] = &unk_1E6386758;
    v21[4] = self;
    v17 = [MEMORY[0x1E4F426E8] actionWithTitle:v16 image:0 identifier:0 handler:v21];
    v18 = (void *)MEMORY[0x1E4F42B80];
    v22[0] = v17;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
    id v5 = [v18 menuWithTitle:v16 image:0 identifier:v4 options:1 children:v19];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

void __48__HUMenuToolbarManager__buildMenuForIdentifier___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) appNavigator];
  id v1 = (id)[v2 showHomeSettingsForHome:0];
}

- (id)_buildActionForIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"HUMenuToolbarIdentifierAddAutomation"])
  {
    id v5 = (void *)MEMORY[0x1E4F426E8];
    v6 = _HULocalizedStringWithDefaultValue(@"HUMenuToolbarManagerAddAutomation", @"HUMenuToolbarManagerAddAutomation", 1);
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __50__HUMenuToolbarManager__buildActionForIdentifier___block_invoke;
    v18 = &unk_1E6386758;
    v19 = self;
    char v7 = &v15;
LABEL_7:
    v8 = objc_msgSend(v5, "actionWithTitle:image:identifier:handler:", v6, 0, 0, v7, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19);

    goto LABEL_8;
  }
  if ([v4 isEqualToString:@"HUMenuToolbarIdentifierAddScene"])
  {
    id v5 = (void *)MEMORY[0x1E4F426E8];
    v6 = _HULocalizedStringWithDefaultValue(@"HUMenuToolbarManagerAddScene", @"HUMenuToolbarManagerAddScene", 1);
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    uint64_t v12 = __50__HUMenuToolbarManager__buildActionForIdentifier___block_invoke_2;
    uint64_t v13 = &unk_1E6386758;
    uint64_t v14 = self;
    char v7 = &v10;
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"HUMenuToolbarIdentifierAboutHomeKit"])
  {
    id v5 = (void *)MEMORY[0x1E4F426E8];
    v6 = _HULocalizedStringWithDefaultValue(@"HUMenuToolbarManagerAboutHomeKit", @"HUMenuToolbarManagerAboutHomeKit", 1);
    char v7 = (uint64_t *)&__block_literal_global_61;
    goto LABEL_7;
  }
  v8 = 0;
LABEL_8:
  if (![(HUMenuToolbarManager *)self _shouldEnableIdentifier:v4]) {
    [v8 setAttributes:1];
  }

  return v8;
}

void __50__HUMenuToolbarManager__buildActionForIdentifier___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) appNavigator];
  id v1 = (id)[v2 showAddAutomationFlow];
}

void __50__HUMenuToolbarManager__buildActionForIdentifier___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) appNavigator];
  id v1 = (id)[v2 showAddSceneFlowOnHomeTab];
}

void __50__HUMenuToolbarManager__buildActionForIdentifier___block_invoke_3()
{
  id v2 = [MEMORY[0x1E4F69378] sharedInstance];
  v0 = +[HUStoreUtilities accessoryStoreURL];
  id v1 = (id)[v2 openURL:v0];
}

- (id)_buildKeyCommandForIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"HUMenuToolbarIdentifierEditHome"])
  {
    id v5 = (void *)MEMORY[0x1E4F42AF8];
    v6 = _HULocalizedStringWithDefaultValue(@"HUMenuToolbarManagerEditHome", @"HUMenuToolbarManagerEditHome", 1);
    char v7 = sel__editHomeMenuSelected;
    v8 = @"h";
LABEL_5:
    uint64_t v9 = v5;
    uint64_t v10 = v6;
    uint64_t v11 = 1179648;
LABEL_13:
    uint64_t v13 = [v9 commandWithTitle:v10 image:0 action:v7 input:v8 modifierFlags:v11 propertyList:0];

    goto LABEL_14;
  }
  if ([v4 isEqualToString:@"HUMenuToolbarIdentifierEditRoom"])
  {
    id v5 = (void *)MEMORY[0x1E4F42AF8];
    v6 = _HULocalizedStringWithDefaultValue(@"HUMenuToolbarManagerEditRoom", @"HUMenuToolbarManagerEditRoom", 1);
    char v7 = sel__editRoomMenuSelected;
    v8 = @"r";
    goto LABEL_5;
  }
  if ([v4 isEqualToString:@"HUMenuToolbarIdentifierHome"])
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F42AF8];
    v6 = _HULocalizedStringWithDefaultValue(@"HUMenuToolbarManagerHome", @"HUMenuToolbarManagerHome", 1);
    char v7 = sel__homeMenuSelected;
    v8 = @"1";
LABEL_12:
    uint64_t v9 = v12;
    uint64_t v10 = v6;
    uint64_t v11 = 0x100000;
    goto LABEL_13;
  }
  if ([v4 isEqualToString:@"HUMenuToolbarIdentifierAutomation"])
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F42AF8];
    v6 = _HULocalizedStringWithDefaultValue(@"HUMenuToolbarManagerAutomation", @"HUMenuToolbarManagerAutomation", 1);
    char v7 = sel__automationMenuSelected;
    v8 = @"2";
    goto LABEL_12;
  }
  if ([v4 isEqualToString:@"HUMenuToolbarIdentifierDiscover"])
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F42AF8];
    v6 = _HULocalizedStringWithDefaultValue(@"HUMenuToolbarManagerDiscover", @"HUMenuToolbarManagerDiscover", 1);
    char v7 = sel__discoverMenuSelected;
    v8 = @"3";
    goto LABEL_12;
  }
  uint64_t v13 = 0;
LABEL_14:
  if (![(HUMenuToolbarManager *)self _shouldEnableIdentifier:v4]) {
    [v13 setAttributes:1];
  }

  return v13;
}

- (id)_buildHomeMenu
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = (void *)MEMORY[0x1E4F426E8];
  id v5 = _HULocalizedStringWithDefaultValue(@"HUMenuToolbarManagerHomes", @"HUMenuToolbarManagerHomes", 1);
  v6 = [v4 actionWithTitle:v5 image:0 identifier:0 handler:&__block_literal_global_116];

  [v6 setAttributes:1];
  v26 = v3;
  v24 = v6;
  [v3 addObject:v6];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  char v7 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  v8 = [v7 homeManager];
  uint64_t v9 = [v8 homes];

  id obj = v9;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v15 = (void *)MEMORY[0x1E4F426E8];
        uint64_t v16 = [v14 name];
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __38__HUMenuToolbarManager__buildHomeMenu__block_invoke_2;
        v27[3] = &unk_1E6388758;
        v27[4] = self;
        v27[5] = v14;
        v17 = [v15 actionWithTitle:v16 image:0 identifier:0 handler:v27];

        v18 = [(HUMenuToolbarManager *)self home];
        v19 = [v18 uniqueIdentifier];
        v20 = [v14 uniqueIdentifier];
        unsigned int v21 = [v19 isEqual:v20];

        [v17 setState:v21];
        [v26 addObject:v17];
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v11);
  }

  v22 = [MEMORY[0x1E4F42B80] menuWithTitle:&stru_1F18F92B8 image:0 identifier:@"HUMenuToolbarIdentifierHomeList" options:1 children:v26];

  return v22;
}

void __38__HUMenuToolbarManager__buildHomeMenu__block_invoke_2(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) appNavigator];
  id v2 = (id)[v3 showHome:*(void *)(a1 + 40)];
}

- (void)_editHomeMenuSelected
{
  id v3 = [(HUMenuToolbarManager *)self appNavigator];
  id v2 = (id)[v3 showHomeEditor];
}

- (void)_editRoomMenuSelected
{
  id v3 = [(HUMenuToolbarManager *)self appNavigator];
  id v2 = (id)[v3 showRoomEditor];
}

- (void)_homeMenuSelected
{
  id v3 = [(HUMenuToolbarManager *)self appNavigator];
  id v2 = (id)[v3 showHomeTab];
}

- (void)_automationMenuSelected
{
  id v3 = [(HUMenuToolbarManager *)self appNavigator];
  id v2 = (id)[v3 showAutomationTab];
}

- (void)_discoverMenuSelected
{
  id v3 = [(HUMenuToolbarManager *)self appNavigator];
  id v2 = (id)[v3 showDiscoverTab];
}

+ (BOOL)isValidMenuSelector:(SEL)a3
{
  return sel__editHomeMenuSelected == a3
      || sel__editRoomMenuSelected == a3
      || sel__homeMenuSelected == a3
      || sel__automationMenuSelected == a3
      || sel__discoverMenuSelected == a3;
}

- (void)home:(id)a3 didAddAccessory:(id)a4
{
  [(HUMenuToolbarManager *)self refreshFileMenu];
  [(HUMenuToolbarManager *)self refreshEditMenu];

  [(HUMenuToolbarManager *)self refreshViewMenu];
}

- (void)home:(id)a3 didRemoveAccessory:(id)a4
{
  [(HUMenuToolbarManager *)self refreshFileMenu];
  [(HUMenuToolbarManager *)self refreshEditMenu];

  [(HUMenuToolbarManager *)self refreshViewMenu];
}

- (void)home:(id)a3 didAddRoom:(id)a4
{
  [(HUMenuToolbarManager *)self refreshEditMenu];
  [(HUMenuToolbarManager *)self refreshViewMenu];

  [(HUMenuToolbarManager *)self refreshViewMenuChildren];
}

- (void)home:(id)a3 didRemoveRoom:(id)a4
{
  [(HUMenuToolbarManager *)self refreshEditMenu];
  [(HUMenuToolbarManager *)self refreshViewMenu];

  [(HUMenuToolbarManager *)self refreshViewMenuChildren];
}

- (void)home:(id)a3 didSelectRoom:(id)a4
{
}

- (void)homeManager:(id)a3 didAddHome:(id)a4
{
  [(HUMenuToolbarManager *)self refreshEditMenu];
  [(HUMenuToolbarManager *)self refreshViewMenu];

  [(HUMenuToolbarManager *)self refreshViewMenuChildren];
}

- (void)homeManager:(id)a3 didRemoveHome:(id)a4
{
  [(HUMenuToolbarManager *)self refreshEditMenu];
  [(HUMenuToolbarManager *)self refreshViewMenu];

  [(HUMenuToolbarManager *)self refreshViewMenuChildren];
}

- (void)homeKitDispatcher:(id)a3 manager:(id)a4 didChangeHome:(id)a5
{
}

- (UIMenuBuilder)menuBuilder
{
  return self->_menuBuilder;
}

- (HOAppNavigator)appNavigator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appNavigator);

  return (HOAppNavigator *)WeakRetained;
}

- (void)setAppNavigator:(id)a3
{
}

- (HMHome)home
{
  return self->_home;
}

- (HMRoom)room
{
  return self->_room;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_room, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_destroyWeak((id *)&self->_appNavigator);

  objc_storeStrong((id *)&self->_menuBuilder, 0);
}

@end