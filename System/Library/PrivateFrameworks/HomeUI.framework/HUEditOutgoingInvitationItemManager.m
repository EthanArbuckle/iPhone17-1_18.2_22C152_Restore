@interface HUEditOutgoingInvitationItemManager
- (HFStaticItem)inviteAgainItem;
- (HFStaticItem)removeItem;
- (HMHome)overrideHome;
- (HMOutgoingHomeInvitation)outgoingInvitation;
- (HUEditOutgoingInvitationItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4 home:(id)a5;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (id)_homeFuture;
- (id)_removeTitleForInvitationState:(int64_t)a3;
- (void)setInviteAgainItem:(id)a3;
- (void)setOverrideHome:(id)a3;
- (void)setRemoveItem:(id)a3;
@end

@implementation HUEditOutgoingInvitationItemManager

- (HUEditOutgoingInvitationItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4 home:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HUEditOutgoingInvitationItemManager;
  v10 = [(HFItemManager *)&v13 initWithDelegate:a3 sourceItem:a4];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_overrideHome, a5);
  }

  return v11;
}

- (HMOutgoingHomeInvitation)outgoingInvitation
{
  v2 = [(HFItemManager *)self sourceItem];
  v3 = [v2 outgoingInvitation];

  return (HMOutgoingHomeInvitation *)v3;
}

- (id)_homeFuture
{
  v2 = (void *)MEMORY[0x1E4F7A0D8];
  v3 = [(HUEditOutgoingInvitationItemManager *)self overrideHome];
  v4 = [v2 futureWithResult:v3];

  return v4;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(HUEditOutgoingInvitationItemManager *)self outgoingInvitation];
  if ([v5 invitationState] != 4)
  {
    v6 = [(HUEditOutgoingInvitationItemManager *)self outgoingInvitation];
    [v6 invitationState];
  }
  id v7 = objc_alloc(MEMORY[0x1E4F695C0]);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __66__HUEditOutgoingInvitationItemManager__buildItemProvidersForHome___block_invoke;
  v24[3] = &unk_1E63869A0;
  objc_copyWeak(&v25, &location);
  char v26 = 1;
  v8 = (void *)[v7 initWithResultsBlock:v24];
  [(HUEditOutgoingInvitationItemManager *)self setInviteAgainItem:v8];

  id v9 = objc_alloc(MEMORY[0x1E4F695C0]);
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  v21 = __66__HUEditOutgoingInvitationItemManager__buildItemProvidersForHome___block_invoke_2;
  v22 = &unk_1E6384FD0;
  objc_copyWeak(&v23, &location);
  v10 = (void *)[v9 initWithResultsBlock:&v19];
  -[HUEditOutgoingInvitationItemManager setRemoveItem:](self, "setRemoveItem:", v10, v19, v20, v21, v22);

  id v11 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v12 = [(HUEditOutgoingInvitationItemManager *)self inviteAgainItem];
  v29[0] = v12;
  objc_super v13 = [(HUEditOutgoingInvitationItemManager *)self removeItem];
  v29[1] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
  v15 = (void *)[v11 initWithArray:v14];

  v16 = (void *)[objc_alloc(MEMORY[0x1E4F695C8]) initWithItems:v15];
  v28 = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

  return v17;
}

id __66__HUEditOutgoingInvitationItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1)
{
  v15[3] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = (void *)MEMORY[0x1E4F7A0D8];
  v14[0] = *MEMORY[0x1E4F68AB8];
  id v4 = _HULocalizedStringWithDefaultValue(@"HUUsersCellInviteAgain", @"HUUsersCellInviteAgain", 1);
  v15[0] = v4;
  v14[1] = *MEMORY[0x1E4F68B10];
  v5 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  v15[1] = v5;
  v14[2] = *MEMORY[0x1E4F68908];
  id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  id v7 = [WeakRetained outgoingInvitation];
  objc_super v13 = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
  id v9 = (void *)[v6 initWithArray:v8];
  v15[2] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];
  id v11 = [v3 futureWithResult:v10];

  return v11;
}

id __66__HUEditOutgoingInvitationItemManager__buildItemProvidersForHome___block_invoke_2(uint64_t a1)
{
  v17[3] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)MEMORY[0x1E4F7A0D8];
  v16[0] = *MEMORY[0x1E4F68AB8];
  v3 = [WeakRetained outgoingInvitation];
  id v4 = objc_msgSend(WeakRetained, "_removeTitleForInvitationState:", objc_msgSend(v3, "invitationState"));
  v17[0] = v4;
  v16[1] = *MEMORY[0x1E4F68B10];
  v5 = NSNumber;
  id v6 = [WeakRetained outgoingInvitation];
  id v7 = objc_msgSend(v5, "numberWithInt:", objc_msgSend(v6, "invitationState") == 3);
  v17[1] = v7;
  v16[2] = *MEMORY[0x1E4F68908];
  id v8 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  id v9 = [WeakRetained outgoingInvitation];
  v15 = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
  id v11 = (void *)[v8 initWithArray:v10];
  v17[2] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];
  objc_super v13 = [v2 futureWithResult:v12];

  return v13;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = [(HUEditOutgoingInvitationItemManager *)self inviteAgainItem];
  int v7 = [v4 containsObject:v6];

  if (v7)
  {
    id v8 = [(HUEditOutgoingInvitationItemManager *)self inviteAgainItem];
    [v5 addObject:v8];
  }
  id v9 = [(HUEditOutgoingInvitationItemManager *)self removeItem];
  int v10 = [v4 containsObject:v9];

  if (v10)
  {
    id v11 = [(HUEditOutgoingInvitationItemManager *)self removeItem];
    [v5 addObject:v11];
  }
  v12 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUEditOutgoingInvitationItemManagerButtonSectionIdentifier"];
  [v12 setItems:v5];
  v15[0] = v12;
  objc_super v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];

  return v13;
}

- (id)_removeTitleForInvitationState:(int64_t)a3
{
  if (a3 == 2) {
    v3 = @"HUUsersCellCancelInvitation";
  }
  else {
    v3 = @"HUUsersCellRemovePerson";
  }
  id v4 = _HULocalizedStringWithDefaultValue(v3, v3, 1);

  return v4;
}

- (HFStaticItem)inviteAgainItem
{
  return self->_inviteAgainItem;
}

- (void)setInviteAgainItem:(id)a3
{
}

- (HMHome)overrideHome
{
  return self->_overrideHome;
}

- (void)setOverrideHome:(id)a3
{
}

- (HFStaticItem)removeItem
{
  return self->_removeItem;
}

- (void)setRemoveItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removeItem, 0);
  objc_storeStrong((id *)&self->_overrideHome, 0);

  objc_storeStrong((id *)&self->_inviteAgainItem, 0);
}

@end