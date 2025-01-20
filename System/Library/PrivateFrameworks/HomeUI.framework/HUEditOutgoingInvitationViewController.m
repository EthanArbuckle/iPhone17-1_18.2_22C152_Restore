@interface HUEditOutgoingInvitationViewController
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HUEditOutgoingInvitationItemManager)editOutgoingInvitationItemManager;
- (HUEditOutgoingInvitationViewController)initWithItem:(id)a3 home:(id)a4;
- (id)_messageForInvitationState:(int64_t)a3;
- (id)user;
- (void)_cancelOutgoingInvitation:(BOOL)a3;
- (void)itemManager:(id)a3 didUpdateResultsForSourceItem:(id)a4;
- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation HUEditOutgoingInvitationViewController

- (HUEditOutgoingInvitationViewController)initWithItem:(id)a3 home:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [HUEditOutgoingInvitationItemManager alloc];
  v9 = (void *)[v7 copy];

  v10 = [(HUEditOutgoingInvitationItemManager *)v8 initWithDelegate:self sourceItem:v9 home:v6];
  v13.receiver = self;
  v13.super_class = (Class)HUEditOutgoingInvitationViewController;
  v11 = [(HUUserTableViewController *)&v13 initWithUserItemManager:v10 home:v6];

  if (v11) {
    objc_storeStrong((id *)&v11->_editOutgoingInvitationItemManager, v10);
  }

  return v11;
}

- (id)user
{
  v2 = [(HUEditOutgoingInvitationViewController *)self editOutgoingInvitationItemManager];
  v3 = [v2 outgoingInvitation];
  v4 = [v3 invitee];

  return v4;
}

- (void)itemManager:(id)a3 didUpdateResultsForSourceItem:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)HUEditOutgoingInvitationViewController;
  [(HUItemTableViewController *)&v8 itemManager:a3 didUpdateResultsForSourceItem:a4];
  v5 = [(HUEditOutgoingInvitationViewController *)self editOutgoingInvitationItemManager];
  id v6 = [v5 outgoingInvitation];
  id v7 = -[HUEditOutgoingInvitationViewController _messageForInvitationState:](self, "_messageForInvitationState:", [v6 invitationState]);
  [(HUUserTableViewController *)self setHeaderMessage:v7];
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(HUEditOutgoingInvitationViewController *)self editOutgoingInvitationItemManager];
  v9 = [v8 inviteAgainItem];
  int v10 = [v6 isEqual:v9];

  if (v10)
  {
    uint64_t v11 = objc_opt_class();
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)HUEditOutgoingInvitationViewController;
    uint64_t v11 = [(HUUserTableViewController *)&v14 cellClassForItem:v6 indexPath:v7];
  }
  v12 = (void *)v11;

  return (Class)v12;
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HUEditOutgoingInvitationViewController;
  id v9 = a4;
  [(HUUserTableViewController *)&v14 setupCell:v8 forItem:v9 indexPath:a5];
  int v10 = [(HUEditOutgoingInvitationViewController *)self editOutgoingInvitationItemManager];
  uint64_t v11 = [v10 inviteAgainItem];
  int v12 = [v9 isEqual:v11];

  if (v12)
  {
    id v13 = v8;
    [v13 setDestructive:0];
    [v13 setUseFullWidthSeparator:1];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)HUEditOutgoingInvitationViewController;
  id v6 = a4;
  id v7 = a3;
  [(HUItemTableViewController *)&v14 tableView:v7 didSelectRowAtIndexPath:v6];
  id v8 = [(HUItemTableViewController *)self itemManager];
  id v9 = [v8 displayedItemAtIndexPath:v6];

  int v10 = [(HUEditOutgoingInvitationViewController *)self editOutgoingInvitationItemManager];
  uint64_t v11 = [v10 inviteAgainItem];
  uint64_t v12 = [v9 isEqual:v11];

  [v7 deselectRowAtIndexPath:v6 animated:1];
  [(HUEditOutgoingInvitationViewController *)self _cancelOutgoingInvitation:v12];
  id v13 = HFLogForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v16 = "-[HUEditOutgoingInvitationViewController tableView:didSelectRowAtIndexPath:]";
    __int16 v17 = 2112;
    v18 = v9;
    __int16 v19 = 1024;
    int v20 = v12;
    _os_log_impl(&dword_1BE345000, v13, OS_LOG_TYPE_DEFAULT, "(%s) User tapped %@. resendInvitation = %{BOOL}d", buf, 0x1Cu);
  }
}

- (void)_cancelOutgoingInvitation:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(HUEditOutgoingInvitationViewController *)self editOutgoingInvitationItemManager];
  id v6 = [v5 outgoingInvitation];

  id v7 = [(HUItemTableViewController *)self itemManager];
  id v8 = [v7 home];

  id v9 = [(HUEditOutgoingInvitationViewController *)self user];
  int v10 = [v9 userID];

  uint64_t v11 = (void *)MEMORY[0x1E4F7A0D8];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __68__HUEditOutgoingInvitationViewController__cancelOutgoingInvitation___block_invoke;
  v24[3] = &unk_1E6385090;
  id v12 = v6;
  id v25 = v12;
  id v13 = [v11 futureWithErrorOnlyHandlerAdapterBlock:v24];
  if (v3)
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __68__HUEditOutgoingInvitationViewController__cancelOutgoingInvitation___block_invoke_2;
    v21[3] = &unk_1E638BAD0;
    id v22 = v10;
    id v23 = v8;
    uint64_t v14 = [v13 flatMap:v21];

    id v13 = (void *)v14;
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __68__HUEditOutgoingInvitationViewController__cancelOutgoingInvitation___block_invoke_4;
  v18[3] = &unk_1E63852A8;
  id v19 = v8;
  id v20 = v12;
  id v15 = v12;
  id v16 = v8;
  id v17 = (id)[v13 addCompletionBlock:v18];
  [(HUUserTableViewController *)self performRemovalAction:v13];
}

uint64_t __68__HUEditOutgoingInvitationViewController__cancelOutgoingInvitation___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) cancelInviteWithCompletionHandler:a2];
}

id __68__HUEditOutgoingInvitationViewController__cancelOutgoingInvitation___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F7A0D8];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__HUEditOutgoingInvitationViewController__cancelOutgoingInvitation___block_invoke_3;
  v5[3] = &unk_1E638AC18;
  id v6 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  BOOL v3 = [v2 futureWithCompletionHandlerAdapterBlock:v5];

  return v3;
}

void __68__HUEditOutgoingInvitationViewController__cancelOutgoingInvitation___block_invoke_3(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = (objc_class *)MEMORY[0x1E4F2EBB8];
  id v4 = a2;
  v5 = (void *)[[v3 alloc] initWithUser:*(void *)(a1 + 32) administrator:0 remoteAccess:1];
  id v6 = *(void **)(a1 + 40);
  v8[0] = v5;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  [v6 inviteUsersWithInviteInformation:v7 completionHandler:v4];
}

void __68__HUEditOutgoingInvitationViewController__cancelOutgoingInvitation___block_invoke_4(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __68__HUEditOutgoingInvitationViewController__cancelOutgoingInvitation___block_invoke_5;
  v3[3] = &unk_1E6387408;
  id v4 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [v2 dispatchHomeObserverMessage:v3 sender:0];
}

void __68__HUEditOutgoingInvitationViewController__cancelOutgoingInvitation___block_invoke_5(uint64_t a1, void *a2)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = *(void *)(a1 + 32);
    v6[0] = *(void *)(a1 + 40);
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
    [v3 home:v4 didUpdateStateForOutgoingInvitations:v5];
  }
}

- (id)_messageForInvitationState:(int64_t)a3
{
  id v5 = [(HUEditOutgoingInvitationViewController *)self user];
  id v6 = [v5 userID];

  switch(a3)
  {
    case 1:
    case 6:
      HULocalizedStringWithFormat(@"HUUserOutgoingInvitationFailedMessage", @"%@", v7, v8, v9, v10, v11, v12, (uint64_t)v6);
      goto LABEL_7;
    case 2:
    case 7:
      HULocalizedStringWithFormat(@"HUUserOutgoingInvitationPendingMessage", @"%@", v7, v8, v9, v10, v11, v12, (uint64_t)v6);
      goto LABEL_7;
    case 3:
    case 5:
      id v13 = [(HUItemTableViewController *)self itemManager];
      uint64_t v14 = [v13 home];
      v26 = [v14 name];
      uint64_t v21 = HULocalizedStringWithFormat(@"HUUserOutgoingInvitationAcceptedMessage", @"%@%@", v15, v16, v17, v18, v19, v20, (uint64_t)v6);

      break;
    case 4:
      HULocalizedStringWithFormat(@"HUUserOutgoingInvitationDeclinedMessage", @"%@", v7, v8, v9, v10, v11, v12, (uint64_t)v6);
      uint64_t v21 = LABEL_7:;
      break;
    default:
      uint64_t v21 = 0;
      break;
  }
  id v22 = objc_alloc(MEMORY[0x1E4F28B18]);
  id v23 = HUPriorityMessageDefaultAttributedStringAttributes();
  v24 = (void *)[v22 initWithString:v21 attributes:v23];

  return v24;
}

- (HUEditOutgoingInvitationItemManager)editOutgoingInvitationItemManager
{
  return self->_editOutgoingInvitationItemManager;
}

- (void).cxx_destruct
{
}

@end