@interface CNGameCenterAddFriendAction
+ (id)os_log;
- (CNGameCenterAddFriendAction)initWithContact:(id)a3;
- (CNSchedulerProvider)schedulerProvider;
- (id)actionTitleForContact:(id)a3;
- (id)addFriendsMenuProvider;
- (id)contactPerHandleForContact:(id)a3;
- (id)title;
- (void)addContactAsFriend:(id)a3;
- (void)addContactToFriendSuggestionsDenylistWithProxy:(id)a3 completion:(id)a4;
- (void)createInviteFriendViewControllerForContact:(id)a3 completionHandler:(id)a4;
- (void)fetchContactAssociationIDWithProxy:(id)a3 completion:(id)a4;
- (void)inviteViaMessages:(id)a3;
- (void)performActionWithSender:(id)a3;
- (void)sendInvitationViaPushToContactAssociationID:(id)a3 withProxy:(id)a4 completion:(id)a5;
- (void)supportsFriendingViaPushWithProxy:(id)a3 completion:(id)a4;
@end

@implementation CNGameCenterAddFriendAction

- (void).cxx_destruct
{
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (id)addFriendsMenuProvider
{
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__CNGameCenterAddFriendAction_addFriendsMenuProvider__block_invoke;
  v4[3] = &unk_1E5499BA0;
  objc_copyWeak(&v5, &location);
  v2 = _Block_copy(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

  return v2;
}

id __53__CNGameCenterAddFriendAction_addFriendsMenuProvider__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  id v18 = (id)MEMORY[0x1E4F1CBF0];
  v8 = [WeakRetained contact];
  v9 = [WeakRetained contactPerHandleForContact:v8];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53__CNGameCenterAddFriendAction_addFriendsMenuProvider__block_invoke_30;
  v12[3] = &unk_1E5496848;
  v12[4] = WeakRetained;
  v12[5] = &v13;
  objc_msgSend(v9, "_cn_each:", v12);

  v10 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1ED8AC728 children:v14[5]];
  _Block_object_dispose(&v13, 8);

  return v10;
}

void __53__CNGameCenterAddFriendAction_addFriendsMenuProvider__block_invoke_30(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) actionTitleForContact:v3];
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A2A0] + 16))())
  {
    id v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v6 = (void *)MEMORY[0x1E4FB13F0];
    v7 = [MEMORY[0x1E4FB1818] systemImageNamed:@"message"];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __53__CNGameCenterAddFriendAction_addFriendsMenuProvider__block_invoke_2;
    uint64_t v15 = &unk_1E549BFC8;
    uint64_t v16 = *(void *)(a1 + 32);
    id v17 = v3;
    v8 = [v6 actionWithTitle:v4 image:v7 identifier:0 handler:&v12];
    uint64_t v9 = objc_msgSend(v5, "arrayByAddingObject:", v8, v12, v13, v14, v15, v16);
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
}

uint64_t __53__CNGameCenterAddFriendAction_addFriendsMenuProvider__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) addContactAsFriend:*(void *)(a1 + 40)];
}

- (id)actionTitleForContact:(id)a3
{
  id v3 = a3;
  v4 = [v3 phoneNumbers];
  id v5 = [v4 firstObject];
  id v6 = [v5 value];
  v7 = [v6 stringValue];

  if ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))())
  {
    v8 = [v3 emailAddresses];
    uint64_t v9 = [v8 firstObject];
    id v10 = [v9 value];
  }
  else
  {
    id v10 = v7;
  }

  return v10;
}

- (id)contactPerHandleForContact:(id)a3
{
  id v3 = a3;
  v4 = [v3 phoneNumbers];
  id v5 = objc_msgSend(v4, "_cn_map:", &__block_literal_global_26);

  id v6 = [v3 emailAddresses];

  v7 = objc_msgSend(v6, "_cn_map:", &__block_literal_global_29);

  v8 = [v5 arrayByAddingObjectsFromArray:v7];

  return v8;
}

id __58__CNGameCenterAddFriendAction_contactPerHandleForContact___block_invoke_2(uint64_t a1, void *a2)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = (objc_class *)MEMORY[0x1E4F1BA40];
  id v3 = a2;
  id v4 = objc_alloc_init(v2);
  v7[0] = v3;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];

  [v4 setEmailAddresses:v5];

  return v4;
}

id __58__CNGameCenterAddFriendAction_contactPerHandleForContact___block_invoke(uint64_t a1, void *a2)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = (objc_class *)MEMORY[0x1E4F1BA40];
  id v3 = a2;
  id v4 = objc_alloc_init(v2);
  v7[0] = v3;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];

  [v4 setPhoneNumbers:v5];

  return v4;
}

- (void)createInviteFriendViewControllerForContact:(id)a3 completionHandler:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = (Class (__cdecl *)())getGKFriendRequestFacilitatorClass[0];
  id v7 = a3;
  Class v8 = v6();
  v13[0] = v7;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __92__CNGameCenterAddFriendAction_createInviteFriendViewControllerForContact_completionHandler___block_invoke;
  v11[3] = &unk_1E5496820;
  id v12 = v5;
  id v10 = v5;
  [(objc_class *)v8 makeViewControllerForInviteWithRecipients:v9 chatGUID:0 resultHandler:v11];
}

uint64_t __92__CNGameCenterAddFriendAction_createInviteFriendViewControllerForContact_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addContactToFriendSuggestionsDenylistWithProxy:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [a3 utilityServicePrivate];
  Class v8 = [(CNContactAction *)self contact];
  uint64_t v9 = [v8 identifier];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __89__CNGameCenterAddFriendAction_addContactToFriendSuggestionsDenylistWithProxy_completion___block_invoke;
  v11[3] = &unk_1E549B048;
  void v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [v7 denyContact:v9 handler:v11];
}

void __89__CNGameCenterAddFriendAction_addContactToFriendSuggestionsDenylistWithProxy_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) schedulerProvider];
  id v5 = [v4 mainThreadScheduler];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __89__CNGameCenterAddFriendAction_addContactToFriendSuggestionsDenylistWithProxy_completion___block_invoke_2;
  v8[3] = &unk_1E549B710;
  id v6 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  [v5 performBlock:v8];
}

uint64_t __89__CNGameCenterAddFriendAction_addContactToFriendSuggestionsDenylistWithProxy_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)sendInvitationViaPushToContactAssociationID:(id)a3 withProxy:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [a4 friendServicePrivate];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __96__CNGameCenterAddFriendAction_sendInvitationViaPushToContactAssociationID_withProxy_completion___block_invoke;
  v12[3] = &unk_1E549B048;
  v12[4] = self;
  id v13 = v8;
  id v11 = v8;
  [v10 sendFriendInvitationWithPlayerID:0 contactAssociationID:v9 completion:v12];
}

void __96__CNGameCenterAddFriendAction_sendInvitationViaPushToContactAssociationID_withProxy_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) schedulerProvider];
  id v5 = [v4 mainThreadScheduler];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __96__CNGameCenterAddFriendAction_sendInvitationViaPushToContactAssociationID_withProxy_completion___block_invoke_2;
  v8[3] = &unk_1E549B710;
  id v6 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  [v5 performBlock:v8];
}

uint64_t __96__CNGameCenterAddFriendAction_sendInvitationViaPushToContactAssociationID_withProxy_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)fetchContactAssociationIDWithProxy:(id)a3 completion:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [a3 profileServicePrivate];
  id v8 = [(CNContactAction *)self contact];
  v13[0] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __77__CNGameCenterAddFriendAction_fetchContactAssociationIDWithProxy_completion___block_invoke;
  v11[3] = &unk_1E54967F8;
  void v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [v7 getContactAssociationIDsForContacts:v9 shouldRefresh:1 completionHandler:v11];
}

void __77__CNGameCenterAddFriendAction_fetchContactAssociationIDWithProxy_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5 && [v5 count])
  {
    id v7 = [v5 allValues];
    id v8 = [v7 firstObject];
  }
  else
  {
    id v8 = 0;
  }
  id v9 = [*(id *)(a1 + 32) schedulerProvider];
  id v10 = [v9 mainThreadScheduler];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __77__CNGameCenterAddFriendAction_fetchContactAssociationIDWithProxy_completion___block_invoke_2;
  v13[3] = &unk_1E549B710;
  id v11 = *(id *)(a1 + 40);
  id v14 = v8;
  id v15 = v11;
  id v12 = v8;
  [v10 performBlock:v13];
}

uint64_t __77__CNGameCenterAddFriendAction_fetchContactAssociationIDWithProxy_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)supportsFriendingViaPushWithProxy:(id)a3 completion:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [a3 profileServicePrivate];
  id v8 = [(CNContactAction *)self contact];
  id v9 = [v8 identifier];
  v14[0] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__CNGameCenterAddFriendAction_supportsFriendingViaPushWithProxy_completion___block_invoke;
  v12[3] = &unk_1E54967D0;
  v12[4] = self;
  id v13 = v6;
  id v11 = v6;
  [v7 filterForContactIDsSupportingFriendingViaPushFromContactIDs:v10 withCompletion:v12];
}

void __76__CNGameCenterAddFriendAction_supportsFriendingViaPushWithProxy_completion___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = a2;
    id v5 = [v3 contact];
    id v6 = [v5 identifier];
    char v7 = [v4 containsObject:v6];
  }
  else
  {
    char v7 = 0;
  }
  id v8 = [*(id *)(a1 + 32) schedulerProvider];
  id v9 = [v8 mainThreadScheduler];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76__CNGameCenterAddFriendAction_supportsFriendingViaPushWithProxy_completion___block_invoke_2;
  v10[3] = &unk_1E54967A8;
  id v11 = *(id *)(a1 + 40);
  char v12 = v7;
  [v9 performBlock:v10];
}

uint64_t __76__CNGameCenterAddFriendAction_supportsFriendingViaPushWithProxy_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)inviteViaMessages:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__CNGameCenterAddFriendAction_inviteViaMessages___block_invoke;
  v5[3] = &unk_1E5496780;
  objc_copyWeak(&v6, &location);
  [(CNGameCenterAddFriendAction *)self createInviteFriendViewControllerForContact:v4 completionHandler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __49__CNGameCenterAddFriendAction_inviteViaMessages___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  if (v8)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v4 = [WeakRetained delegate];
    char v5 = objc_opt_respondsToSelector();

    id v6 = [WeakRetained delegate];
    char v7 = v6;
    if (v5) {
      objc_msgSend(v6, "action:presentViewController:modalPresentationStyle:sender:", WeakRetained, v8, objc_msgSend(v8, "modalPresentationStyle"), WeakRetained);
    }
    else {
      [v6 action:WeakRetained presentViewController:v8 sender:WeakRetained];
    }
  }
}

- (void)addContactAsFriend:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl())
  {
    Class GKDaemonProxyClass = getGKDaemonProxyClass();
    id v6 = [(Class)getGKLocalPlayerClass[0]() currentLocalPlayer];
    char v7 = [(objc_class *)GKDaemonProxyClass proxyForPlayer:v6];

    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __50__CNGameCenterAddFriendAction_addContactAsFriend___block_invoke;
    v9[3] = &unk_1E5496758;
    objc_copyWeak(&v13, &location);
    id v10 = v4;
    id v11 = self;
    id v8 = v7;
    id v12 = v8;
    [(CNGameCenterAddFriendAction *)self supportsFriendingViaPushWithProxy:v8 completion:v9];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else
  {
    [(CNGameCenterAddFriendAction *)self inviteViaMessages:v4];
  }
}

void __50__CNGameCenterAddFriendAction_addContactAsFriend___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    id v3 = *(void **)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __50__CNGameCenterAddFriendAction_addContactAsFriend___block_invoke_2;
    v9[3] = &unk_1E5496730;
    objc_copyWeak(&v13, (id *)(a1 + 56));
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    char v7 = *(void **)(a1 + 48);
    id v10 = v5;
    uint64_t v11 = v6;
    id v12 = v7;
    [v3 fetchContactAssociationIDWithProxy:v4 completion:v9];

    objc_destroyWeak(&v13);
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    [WeakRetained inviteViaMessages:*(void *)(a1 + 32)];
  }
}

void __50__CNGameCenterAddFriendAction_addContactAsFriend___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __50__CNGameCenterAddFriendAction_addContactAsFriend___block_invoke_13;
    v11[3] = &unk_1E5496708;
    objc_copyWeak(&v15, (id *)(a1 + 56));
    id v6 = *(id *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = *(void **)(a1 + 48);
    id v12 = v6;
    uint64_t v13 = v7;
    id v14 = v8;
    [v4 sendInvitationViaPushToContactAssociationID:v3 withProxy:v5 completion:v11];

    objc_destroyWeak(&v15);
  }
  else
  {
    id v9 = +[CNGameCenterAddFriendAction os_log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18B625000, v9, OS_LOG_TYPE_ERROR, "CNGameCenterAddFriendAction: Unable to fetch CAID for contact. Attempting to send via Messages.", buf, 2u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    [WeakRetained inviteViaMessages:*(void *)(a1 + 32)];
  }
}

void __50__CNGameCenterAddFriendAction_addContactAsFriend___block_invoke_13(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = +[CNGameCenterAddFriendAction os_log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v8 = [v3 localizedDescription];
      *(_DWORD *)buf = 138412290;
      id v12 = v8;
      _os_log_error_impl(&dword_18B625000, v4, OS_LOG_TYPE_ERROR, "CNGameCenterAddFriendAction: Unable to send friend invitation via push. Attempting to send via Messages. %@", buf, 0xCu);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    [WeakRetained inviteViaMessages:*(void *)(a1 + 32)];
  }
  else
  {
    id v6 = *(void **)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __50__CNGameCenterAddFriendAction_addContactAsFriend___block_invoke_14;
    v9[3] = &unk_1E54966E0;
    objc_copyWeak(&v10, (id *)(a1 + 56));
    [v6 addContactToFriendSuggestionsDenylistWithProxy:v7 completion:v9];
    objc_destroyWeak(&v10);
  }
}

void __50__CNGameCenterAddFriendAction_addContactAsFriend___block_invoke_14(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v6 = [WeakRetained delegate];
    [v6 actionDidFinish:WeakRetained];

    uint64_t v5 = +[CNGameCenterAddFriendAction os_log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_18B625000, v5, OS_LOG_TYPE_INFO, "CNGameCenterAddFriendAction: Sent via push.", (uint8_t *)&v7, 2u);
    }
    goto LABEL_6;
  }
  id WeakRetained = +[CNGameCenterAddFriendAction os_log];
  if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = [v3 localizedDescription];
    int v7 = 138412290;
    id v8 = v5;
    _os_log_error_impl(&dword_18B625000, WeakRetained, OS_LOG_TYPE_ERROR, "CNGameCenterAddFriendAction: Unable to add contact to friend suggestions denylist. %@", (uint8_t *)&v7, 0xCu);
LABEL_6:
  }
}

- (void)performActionWithSender:(id)a3
{
  id v4 = [(CNContactAction *)self contact];
  [(CNGameCenterAddFriendAction *)self addContactAsFriend:v4];
}

- (id)title
{
  v2 = CNContactsUIBundle();
  id v3 = [v2 localizedStringForKey:@"GAME_CENTER_ACTION_TITLE" value:&stru_1ED8AC728 table:@"Localized"];

  return v3;
}

- (CNGameCenterAddFriendAction)initWithContact:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CNGameCenterAddFriendAction;
  id v3 = [(CNContactAction *)&v9 initWithContact:a3];
  if (v3)
  {
    id v4 = +[CNUIContactsEnvironment currentEnvironment];
    uint64_t v5 = [v4 defaultSchedulerProvider];
    schedulerProvider = v3->_schedulerProvider;
    v3->_schedulerProvider = (CNSchedulerProvider *)v5;

    int v7 = v3;
  }

  return v3;
}

+ (id)os_log
{
  if (os_log_cn_once_token_4 != -1) {
    dispatch_once(&os_log_cn_once_token_4, &__block_literal_global_649);
  }
  v2 = (void *)os_log_cn_once_object_4;

  return v2;
}

void __37__CNGameCenterAddFriendAction_os_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contactsui", "CNGameCenterAddFriendAction");
  v1 = (void *)os_log_cn_once_object_4;
  os_log_cn_once_object_4 = (uint64_t)v0;
}

@end