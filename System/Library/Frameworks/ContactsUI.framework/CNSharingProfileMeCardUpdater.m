@interface CNSharingProfileMeCardUpdater
- (CNContact)imageContact;
- (CNContactStore)contactStore;
- (CNMutableContact)meContact;
- (CNSharingProfileLogger)logger;
- (CNSharingProfileMeCardUpdater)initWithMeContact:(id)a3 contactStore:(id)a4;
- (CNSharingProfileMeCardUpdaterDelegate)delegate;
- (id)alertControllerForMeCardUpdateWithImageContact:(id)a3;
- (void)performSave;
- (void)setContactStore:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setImageContact:(id)a3;
- (void)setLogger:(id)a3;
- (void)updateMeContactWithImageContact:(id)a3;
@end

@implementation CNSharingProfileMeCardUpdater

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_imageContact, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_meContact, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setLogger:(id)a3
{
}

- (CNSharingProfileLogger)logger
{
  return self->_logger;
}

- (void)setImageContact:(id)a3
{
}

- (CNContact)imageContact
{
  return self->_imageContact;
}

- (void)setContactStore:(id)a3
{
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (CNMutableContact)meContact
{
  return self->_meContact;
}

- (void)setDelegate:(id)a3
{
}

- (CNSharingProfileMeCardUpdaterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNSharingProfileMeCardUpdaterDelegate *)WeakRetained;
}

- (void)performSave
{
  id v3 = objc_alloc(MEMORY[0x1E4F1B938]);
  v4 = [(CNSharingProfileMeCardUpdater *)self meContact];
  v5 = [(CNSharingProfileMeCardUpdater *)self contactStore];
  id v7 = (id)[v3 initWithContact:v4 contactStore:v5];

  v6 = [(CNSharingProfileMeCardUpdater *)self imageContact];
  [v7 updateImageWithImageContact:v6 setAsMe:1];
}

- (void)updateMeContactWithImageContact:(id)a3
{
  objc_storeStrong((id *)&self->_imageContact, a3);
  [(CNSharingProfileMeCardUpdater *)self performSave];
  id v4 = [(CNSharingProfileMeCardUpdater *)self delegate];
  [v4 meCardUpdaterDidSetPhotoToMeCard:self];
}

- (id)alertControllerForMeCardUpdateWithImageContact:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_imageContact, a3);
  v6 = (void *)MEMORY[0x1E4FB1418];
  id v7 = CNContactsUIBundle();
  v8 = [v7 localizedStringForKey:@"SHARING_UPDATE_ME_CARD_PROMPT_TITLE" value:&stru_1ED8AC728 table:@"Localized"];
  v9 = CNContactsUIBundle();
  v10 = [v9 localizedStringForKey:@"SHARING_UPDATE_ME_CARD_PROMPT_MESSAGE" value:&stru_1ED8AC728 table:@"Localized"];
  v11 = [v6 alertControllerWithTitle:v8 message:v10 preferredStyle:1];

  v12 = (void *)MEMORY[0x1E4FB1410];
  v13 = CNContactsUIBundle();
  v14 = [v13 localizedStringForKey:@"SHARING_UPDATE_ME_CARD_PROMPT_CONFIRM" value:&stru_1ED8AC728 table:@"Localized"];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __80__CNSharingProfileMeCardUpdater_alertControllerForMeCardUpdateWithImageContact___block_invoke;
  v23[3] = &unk_1E549BC48;
  v23[4] = self;
  id v24 = v5;
  id v15 = v5;
  v16 = [v12 actionWithTitle:v14 style:0 handler:v23];
  [v11 addAction:v16];

  v17 = (void *)MEMORY[0x1E4FB1410];
  v18 = CNContactsUIBundle();
  v19 = [v18 localizedStringForKey:@"SHARING_UPDATE_ME_CARD_PROMPT_CANCEL" value:&stru_1ED8AC728 table:@"Localized"];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __80__CNSharingProfileMeCardUpdater_alertControllerForMeCardUpdateWithImageContact___block_invoke_2;
  v22[3] = &unk_1E549B590;
  v22[4] = self;
  v20 = [v17 actionWithTitle:v19 style:1 handler:v22];
  [v11 addAction:v20];

  return v11;
}

uint64_t __80__CNSharingProfileMeCardUpdater_alertControllerForMeCardUpdateWithImageContact___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateMeContactWithImageContact:*(void *)(a1 + 40)];
}

void __80__CNSharingProfileMeCardUpdater_alertControllerForMeCardUpdateWithImageContact___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 meCardUpdaterDidDeclineSetPhotoToMeCard:*(void *)(a1 + 32)];
}

- (CNSharingProfileMeCardUpdater)initWithMeContact:(id)a3 contactStore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNSharingProfileMeCardUpdater;
  v9 = [(CNSharingProfileMeCardUpdater *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contactStore, a4);
    objc_storeStrong((id *)&v10->_meContact, a3);
    v11 = v10;
  }

  return v10;
}

@end