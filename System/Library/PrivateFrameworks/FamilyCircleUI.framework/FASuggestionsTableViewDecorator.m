@interface FASuggestionsTableViewDecorator
+ (BOOL)shouldShowSuggestionsInPage:(id)a3;
- (FASuggestionsTableViewDecorator)initWithTableView:(id)a3 ruiTableView:(id)a4 pictureStore:(id)a5 recommendations:(id)a6 proactiveModelUsed:(int64_t)a7 emergencyContacts:(id)a8 context:(id)a9 viewController:(id)a10 suggester:(id)a11 objectModel:(id)a12;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)accessoryViewFor:(id)a3;
- (id)indexFor:(id)a3;
- (id)indexForSuggestionsSection;
- (id)inviteButtonForSuggestion;
- (id)inviteSentImageForSuggestion;
- (id)relationForContact:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)didTapInviteButtonInCell:(id)a3;
- (void)inviteController:(id)a3 didFinishWithStatus:(unint64_t)a4 recipients:(id)a5 userInfo:(id)a6 error:(id)a7;
- (void)sendSuggestionFeedbackFor:(id)a3;
- (void)setupInviteConfiguratioControllerFor:(int64_t)a3 contactHandle:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)updateSuggestionCellFor:(id)a3;
@end

@implementation FASuggestionsTableViewDecorator

- (FASuggestionsTableViewDecorator)initWithTableView:(id)a3 ruiTableView:(id)a4 pictureStore:(id)a5 recommendations:(id)a6 proactiveModelUsed:(int64_t)a7 emergencyContacts:(id)a8 context:(id)a9 viewController:(id)a10 suggester:(id)a11 objectModel:(id)a12
{
  id v33 = a4;
  id v32 = a5;
  id v31 = a6;
  id v30 = a8;
  id v29 = a9;
  id v28 = a10;
  id v27 = a11;
  id v26 = a12;
  v34.receiver = self;
  v34.super_class = (Class)FASuggestionsTableViewDecorator;
  v18 = [(FATableViewDecorator *)&v34 initWithTableView:a3];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_familySuggestionsPictureStore, a5);
    objc_storeStrong((id *)&v19->_remoteTableViewController, a4);
    objc_storeStrong((id *)&v19->_recommendedFamilyMembers, a6);
    v19->_proactiveModelUsedToDeriveRecommendations = a7;
    objc_storeStrong((id *)&v19->_emergencyContacts, a8);
    objc_storeStrong((id *)&v19->_context, a9);
    objc_storeStrong((id *)&v19->_viewController, a10);
    objc_storeStrong((id *)&v19->_suggester, a11);
    v20 = (NSSet *)objc_alloc_init(MEMORY[0x263EFFA08]);
    invitedHandles = v19->_invitedHandles;
    v19->_invitedHandles = v20;

    v22 = (CNContactStore *)objc_alloc_init(MEMORY[0x263EFEA58]);
    contactStore = v19->_contactStore;
    v19->_contactStore = v22;

    objc_storeStrong((id *)&v19->_objectModel, a12);
  }

  return v19;
}

+ (BOOL)shouldShowSuggestionsInPage:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 hasTableView])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v4 = objc_msgSend(v3, "tableViewOM", 0);
    v5 = [v4 sections];

    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [*(id *)(*((void *)&v15 + 1) + 8 * i) attributes];
          v11 = [v10 objectForKeyedSubscript:@"familyAction"];
          char v12 = [v11 isEqual:@"InjectFamilySuggestionsView"];

          if (v12)
          {
            BOOL v13 = 1;
            goto LABEL_13;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    BOOL v13 = 0;
LABEL_13:
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (id)accessoryViewFor:(id)a3
{
  id v4 = a3;
  v5 = (void *)_IDSCopyIDForEmailAddress();
  uint64_t v6 = [v5 stringByReplacingOccurrencesOfString:@"mailto:" withString:&stru_26CA2C800];

  uint64_t v7 = (void *)_IDSCopyIDForPhoneNumberWithOptions();
  uint64_t v8 = [v7 stringByReplacingOccurrencesOfString:@"tel:" withString:&stru_26CA2C800];

  if ([(NSSet *)self->_invitedHandles containsObject:v6]
    || [(NSSet *)self->_invitedHandles containsObject:v8])
  {
    uint64_t v9 = [(FASuggestionsTableViewDecorator *)self inviteSentImageForSuggestion];
  }
  else
  {
    uint64_t v9 = [(FASuggestionsTableViewDecorator *)self inviteButtonForSuggestion];
  }
  v10 = (void *)v9;

  return v10;
}

- (id)indexForSuggestionsSection
{
  id v3 = [(RUITableView *)self->_remoteTableViewController sections];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    uint64_t v5 = 0;
    while (1)
    {
      uint64_t v6 = [(RUITableView *)self->_remoteTableViewController sections];
      uint64_t v7 = [v6 objectAtIndex:v5];

      uint64_t v8 = [v7 attributes];
      uint64_t v9 = [v8 objectForKeyedSubscript:@"familyAction"];
      int v10 = [v9 isEqual:@"InjectFamilySuggestionsView"];

      if (v10) {
        break;
      }

      if (v4 == ++v5) {
        goto LABEL_5;
      }
    }
    v11 = [NSNumber numberWithInteger:v5];
  }
  else
  {
LABEL_5:
    v11 = 0;
  }
  return v11;
}

- (id)indexFor:(id)a3
{
  id v21 = a3;
  NSUInteger v19 = [(NSArray *)self->_recommendedFamilyMembers count];
  if (v19)
  {
    uint64_t v3 = 0;
    while (1)
    {
      uint64_t v4 = [(NSArray *)self->_recommendedFamilyMembers objectAtIndex:v3];
      uint64_t v5 = (void *)_IDSCopyIDForEmailAddress();
      uint64_t v6 = [v5 stringByReplacingOccurrencesOfString:@"mailto:" withString:&stru_26CA2C800];

      uint64_t v7 = (void *)_IDSCopyIDForPhoneNumberWithOptions();
      uint64_t v8 = [v7 stringByReplacingOccurrencesOfString:@"tel:" withString:&stru_26CA2C800];

      uint64_t v9 = [v4 iMessageHandle];
      int v10 = (void *)_IDSCopyIDForEmailAddress();
      v11 = [v10 stringByReplacingOccurrencesOfString:@"mailto:" withString:&stru_26CA2C800];

      char v12 = [v4 iMessageHandle];
      BOOL v13 = (void *)_IDSCopyIDForPhoneNumberWithOptions();
      v14 = [v13 stringByReplacingOccurrencesOfString:@"tel:" withString:&stru_26CA2C800];

      if (([v11 isEqual:v6] & 1) != 0 || objc_msgSend(v14, "isEqual:", v8))
      {
        uint64_t v18 = [NSNumber numberWithInteger:v3];
        char v15 = 0;
      }
      else
      {
        char v15 = 1;
      }

      if ((v15 & 1) == 0) {
        break;
      }
      if (v19 == ++v3) {
        goto LABEL_9;
      }
    }
    long long v16 = (void *)v18;
  }
  else
  {
LABEL_9:
    long long v16 = 0;
  }

  return v16;
}

- (id)inviteButtonForSuggestion
{
  uint64_t v3 = [MEMORY[0x263F824F0] filledButtonConfiguration];
  uint64_t v4 = [MEMORY[0x263F825C8] systemBlueColor];
  [v3 setBaseBackgroundColor:v4];

  uint64_t v5 = [MEMORY[0x263F825C8] whiteColor];
  [v3 setBaseForegroundColor:v5];

  [v3 setButtonSize:0];
  [v3 setCornerStyle:4];
  objc_initWeak(&location, self);
  uint64_t v6 = (void *)MEMORY[0x263F823D0];
  uint64_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v8 = [v7 localizedStringForKey:@"INVITE_BUTTON_TITLE" value:&stru_26CA2C800 table:@"Localizable"];
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  v14 = __60__FASuggestionsTableViewDecorator_inviteButtonForSuggestion__block_invoke;
  char v15 = &unk_264348A70;
  objc_copyWeak(&v16, &location);
  uint64_t v9 = [v6 actionWithTitle:v8 image:0 identifier:0 handler:&v12];

  int v10 = objc_msgSend(MEMORY[0x263F824E8], "buttonWithConfiguration:primaryAction:", v3, v9, v12, v13, v14, v15);
  [v10 sizeToFit];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v10;
}

void __60__FASuggestionsTableViewDecorator_inviteButtonForSuggestion__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v4 = [v3 sender];

  [WeakRetained didTapInviteButtonInCell:v4];
}

- (id)inviteSentImageForSuggestion
{
  v2 = [MEMORY[0x263F82818] configurationWithPointSize:22.0];
  id v3 = [MEMORY[0x263F827E8] systemImageNamed:@"checkmark.circle" withConfiguration:v2];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v3];
  uint64_t v5 = [MEMORY[0x263F825C8] systemGrayColor];
  [v4 setTintColor:v5];

  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(RUITableView *)self->_remoteTableViewController sections];
  uint64_t v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v7, "section"));

  int v10 = [v9 attributes];
  v11 = [v10 objectForKeyedSubscript:@"familyAction"];
  int v12 = [v11 isEqual:@"InjectFamilySuggestionsView"];

  if (v12)
  {
    uint64_t v13 = [v6 dequeueReusableCellWithIdentifier:@"suggestionCell"];
    if (!v13) {
      uint64_t v13 = (void *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:3 reuseIdentifier:@"suggestionCell"];
    }
    v14 = -[NSArray objectAtIndexedSubscript:](self->_recommendedFamilyMembers, "objectAtIndexedSubscript:", [v7 row]);
    char v15 = [v14 contact];

    id v16 = -[NSArray objectAtIndexedSubscript:](self->_recommendedFamilyMembers, "objectAtIndexedSubscript:", [v7 row]);
    long long v17 = [v16 iMessageHandle];

    uint64_t v18 = [(FASuggestionsTableViewDecorator *)self accessoryViewFor:v17];
    [v13 setAccessoryView:v18];

    uint64_t v19 = [v7 row];
    uint64_t v20 = [v13 accessoryView];
    [v20 setTag:v19];

    id v21 = [MEMORY[0x263EFEA20] stringFromContact:v15 style:0];
    v22 = [v13 textLabel];
    [v22 setText:v21];

    v23 = [(FASuggestionsTableViewDecorator *)self relationForContact:v15];
    v24 = [v13 detailTextLabel];
    [v24 setText:v23];

    v25 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835F0]];
    id v26 = [v13 detailTextLabel];
    [v26 setFont:v25];

    familySuggestionsPictureStore = self->_familySuggestionsPictureStore;
    id v28 = -[NSArray objectAtIndexedSubscript:](self->_recommendedFamilyMembers, "objectAtIndexedSubscript:", [v7 row]);
    id v29 = [(FAProfilePictureStore *)familySuggestionsPictureStore profilePictureForRecommendedFamilyMember:v28];

    if (v29)
    {
      id v30 = (void *)MEMORY[0x263F827E8];
      id v31 = [MEMORY[0x263F82B60] mainScreen];
      [v31 scale];
      id v32 = objc_msgSend(v30, "imageWithData:scale:", v29);
      id v33 = [v13 imageView];
      [v33 setImage:v32];

      objc_super v34 = [v13 imageView];
      [v34 setContentMode:4];
    }
  }
  else
  {
    char v15 = [(FATableViewDecorator *)self dataSource];
    uint64_t v13 = [v15 tableView:v6 cellForRowAtIndexPath:v7];
  }

  return v13;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(RUITableView *)self->_remoteTableViewController sections];
  uint64_t v8 = [v7 objectAtIndexedSubscript:a4];

  uint64_t v9 = [v8 attributes];
  int v10 = [v9 objectForKeyedSubscript:@"familyAction"];
  int v11 = [v10 isEqual:@"InjectFamilySuggestionsView"];

  if (v11)
  {
    int64_t v12 = [(NSArray *)self->_recommendedFamilyMembers count];
  }
  else
  {
    uint64_t v13 = [(FATableViewDecorator *)self dataSource];
    int64_t v12 = [v13 tableView:v6 numberOfRowsInSection:a4];
  }
  return v12;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(RUITableView *)self->_remoteTableViewController sections];
  uint64_t v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v7, "section"));

  int v10 = [v9 attributes];
  int v11 = [v10 objectForKeyedSubscript:@"familyAction"];
  int v12 = [v11 isEqual:@"InjectFamilySuggestionsView"];

  if (v12)
  {
    double v13 = *MEMORY[0x263F839B8];
  }
  else
  {
    v14 = [(FATableViewDecorator *)self delegate];
    [v14 tableView:v6 heightForRowAtIndexPath:v7];
    double v13 = v15;
  }
  return v13;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v18 = a4;
  remoteTableViewController = self->_remoteTableViewController;
  id v8 = a5;
  uint64_t v9 = [(RUITableView *)remoteTableViewController sections];
  uint64_t v10 = [v8 section];

  int v11 = [v9 objectAtIndexedSubscript:v10];

  int v12 = [v11 attributes];
  double v13 = [v12 objectForKeyedSubscript:@"familyAction"];
  int v14 = [v13 isEqual:@"InjectFamilySuggestionsView"];

  if (v14)
  {
    double v15 = [MEMORY[0x263F825C8] secondaryLabelColor];
    id v16 = [v18 detailTextLabel];
    [v16 setTextColor:v15];

    long long v17 = [MEMORY[0x263F825C8] secondarySystemBackgroundColor];
    [v18 setBackgroundColor:v17];
  }
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(RUITableView *)self->_remoteTableViewController sections];
  id v8 = [v7 objectAtIndex:a4];

  uint64_t v9 = [v8 attributes];
  uint64_t v10 = [v9 objectForKeyedSubscript:@"familyAction"];
  if ([v10 isEqual:@"InjectFamilySuggestionsView"])
  {
    NSUInteger v11 = [(NSArray *)self->_recommendedFamilyMembers count];

    if (!v11)
    {
      int v12 = 0;
      goto LABEL_14;
    }
  }
  else
  {
  }
  double v13 = [(FATableViewDecorator *)self dataSource];
  int v12 = [v13 tableView:v6 titleForHeaderInSection:a4];

  int v14 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.FamilyCircle"];
  if ([v14 BOOLForKey:@"DebugMegadome"] && objc_msgSend(v12, "length"))
  {
    int64_t proactiveModelUsedToDeriveRecommendations = self->_proactiveModelUsedToDeriveRecommendations;
    id v16 = @"Unknown";
    if (proactiveModelUsedToDeriveRecommendations == 3) {
      id v16 = @"Megadome";
    }
    if (proactiveModelUsedToDeriveRecommendations == 2) {
      long long v17 = @"PeopleSuggester";
    }
    else {
      long long v17 = v16;
    }
    uint64_t v18 = [NSString stringWithFormat:@"%@ (Model: %@)", v12, v17];

    int v12 = (void *)v18;
  }

LABEL_14:
  return v12;
}

- (id)relationForContact:(id)a3
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  uint64_t v5 = self->_emergencyContacts;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v49 objects:v57 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v50;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v50 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        NSUInteger v11 = [v10 nameContactIdentifier];
        int v12 = [v4 identifier];
        int v13 = [v11 isEqual:v12];

        if (v13)
        {
          v35 = _FALogSystem();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            v36 = [v10 relationship];
            *(_DWORD *)buf = 138412290;
            v56 = v36;
            _os_log_impl(&dword_2189F0000, v35, OS_LOG_TYPE_DEFAULT, "contact relation from emergency contacts  %@", buf, 0xCu);
          }
          v37 = (void *)MEMORY[0x263EFEAD0];
          v38 = [v10 relationship];
          v39 = [v37 localizedStringForLabel:v38];

          if (v39)
          {
            objc_super v34 = [v39 localizedCapitalizedString];
          }
          else
          {
            v40 = [v10 relationship];
            objc_super v34 = [v40 localizedCapitalizedString];
          }
          goto LABEL_28;
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v49 objects:v57 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  contactStore = self->_contactStore;
  uint64_t v15 = *MEMORY[0x263EFDFC8];
  v54[0] = *MEMORY[0x263EFDFE0];
  v54[1] = v15;
  uint64_t v16 = *MEMORY[0x263EFDFB8];
  v54[2] = *MEMORY[0x263EFE038];
  v54[3] = v16;
  uint64_t v17 = *MEMORY[0x263EFE070];
  v54[4] = *MEMORY[0x263EFDF80];
  v54[5] = v17;
  v54[6] = *MEMORY[0x263EFE0F8];
  uint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v54 count:7];
  id v48 = 0;
  uint64_t v19 = [(CNContactStore *)contactStore _ios_meContactWithKeysToFetch:v18 error:&v48];
  v43 = (NSArray *)v48;

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  v42 = v19;
  uint64_t v20 = [v19 contactRelations];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v44 objects:v53 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v45;
    while (2)
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v45 != v23) {
          objc_enumerationMutation(v20);
        }
        v25 = *(void **)(*((void *)&v44 + 1) + 8 * j);
        id v26 = [v25 value];
        id v27 = [v26 name];
        id v28 = [MEMORY[0x263EFEA20] stringFromContact:v4 style:0];
        int v29 = [v27 isEqualToString:v28];

        if (v29)
        {
          id v30 = _FALogSystem();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v56 = v26;
            _os_log_impl(&dword_2189F0000, v30, OS_LOG_TYPE_DEFAULT, "contact relation from contacts %@", buf, 0xCu);
          }

          id v31 = (void *)MEMORY[0x263EFEAD0];
          id v32 = [v25 label];
          id v33 = [v31 localizedStringForLabel:v32];

          if (v33)
          {
            objc_super v34 = [v33 localizedCapitalizedString];

            goto LABEL_26;
          }
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v44 objects:v53 count:16];
      if (v22) {
        continue;
      }
      break;
    }
  }

  uint64_t v20 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  objc_super v34 = [v20 localizedStringForKey:@"FAMILY_SUGGESTION_DEFAULT_DETAIL_LABEL" value:&stru_26CA2C800 table:@"Localizable"];
LABEL_26:

  v39 = v42;
  uint64_t v5 = v43;
LABEL_28:

  return v34;
}

- (void)didTapInviteButtonInCell:(id)a3
{
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = -[NSArray objectAtIndexedSubscript:](self->_recommendedFamilyMembers, "objectAtIndexedSubscript:", [v7 tag]);
    uint64_t v5 = [v4 iMessageHandle];

    uint64_t v6 = +[FamilyInviteAnalytics shared];
    [v6 sendTapInviteOnSuggestedContactEvent];

    [(FASuggestionsTableViewDecorator *)self setupInviteConfiguratioControllerFor:1 contactHandle:v5];
  }
}

- (void)setupInviteConfiguratioControllerFor:(int64_t)a3 contactHandle:(id)a4
{
  id v6 = a4;
  if (a3 == 2)
  {
    if (+[FAMailInviteConfigurationController isAvailable])
    {
      NSUInteger v11 = [FAMailInviteConfigurationController alloc];
      context = self->_context;
      uint64_t v9 = [(RemoteUIController *)self->_viewController hostViewController];
      uint64_t v10 = [(FAMailInviteConfigurationController *)v11 initWithInviteContext:context presentingController:v9 email:v6];
      goto LABEL_7;
    }
    int v14 = _FALogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      uint64_t v15 = "Device cannot send emails";
      uint64_t v16 = (uint8_t *)&v17;
      goto LABEL_12;
    }
LABEL_13:

    goto LABEL_14;
  }
  if (a3 == 1)
  {
    if (+[FAMessagesInviteConfigurationController isAvailable])
    {
      id v7 = [FAMessagesInviteConfigurationController alloc];
      uint64_t v8 = self->_context;
      uint64_t v9 = [(RemoteUIController *)self->_viewController hostViewController];
      uint64_t v10 = [(FAMessagesInviteConfigurationController *)v7 initWithInviteContext:v8 presentingController:v9 familySuggestionHandle:v6];
LABEL_7:
      inviteConfigurationController = self->_inviteConfigurationController;
      self->_inviteConfigurationController = v10;

      goto LABEL_14;
    }
    int v14 = _FALogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v18 = 0;
      uint64_t v15 = "Device cannot send messages";
      uint64_t v16 = (uint8_t *)&v18;
LABEL_12:
      _os_log_impl(&dword_2189F0000, v14, OS_LOG_TYPE_DEFAULT, v15, v16, 2u);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
LABEL_14:
  -[FAInviteConfigurationController setDelegate:](self->_inviteConfigurationController, "setDelegate:", self, v17);
  [(FAInviteConfigurationController *)self->_inviteConfigurationController presentWhenReadyWithCompletion:&__block_literal_global_1];
}

- (void)inviteController:(id)a3 didFinishWithStatus:(unint64_t)a4 recipients:(id)a5 userInfo:(id)a6 error:(id)a7
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v9 = a5;
  uint64_t v10 = _FALogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v28 = a4;
    _os_log_impl(&dword_2189F0000, v10, OS_LOG_TYPE_DEFAULT, "FASuggestions Controller did finish with status: %lu", buf, 0xCu);
  }

  NSUInteger v11 = +[FamilyInviteAnalytics shared];
  [v11 sendSuggestedContactInvitedEventWithInviteCompletionStatus:a4];

  if (a4 == 1)
  {
    id v12 = objc_alloc_init(MEMORY[0x263F3BF68]);
    [v12 setStatus:1];
    [v12 setTransportType:1];
    [v12 setRecipients:v9];
    int v13 = [v12 serverReadableDictionary];
    int v14 = (void *)[v13 mutableCopy];

    uint64_t v15 = [(FAInviteContext *)self->_context inviteURL];
    uint64_t v16 = [v15 absoluteString];
    [v14 setObject:v16 forKey:@"inviteUrl"];

    uint64_t v17 = [(RUIObjectModel *)self->_objectModel serverInfo];
    [v14 addEntriesFromDictionary:v17];

    id v26 = 0;
    __int16 v18 = [MEMORY[0x263F08AC0] dataWithPropertyList:v14 format:100 options:0 error:&v26];
    id v19 = v26;
    if (v18)
    {
      viewController = self->_viewController;
      uint64_t v21 = [(FAInviteContext *)self->_context reportInviteeDetailsUrl];
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __98__FASuggestionsTableViewDecorator_inviteController_didFinishWithStatus_recipients_userInfo_error___block_invoke;
      v23[3] = &unk_264348AB8;
      v24 = v9;
      v25 = self;
      [(RemoteUIController *)viewController loadURL:v21 postBody:v18 completion:v23];

      uint64_t v22 = v24;
    }
    else
    {
      uint64_t v22 = _FALogSystem();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        unint64_t v28 = (unint64_t)v19;
        _os_log_impl(&dword_2189F0000, v22, OS_LOG_TYPE_DEFAULT, "Couldn't serialize FAInviteCompletionInfo with error: %@", buf, 0xCu);
      }
    }
  }
}

void __98__FASuggestionsTableViewDecorator_inviteController_didFinishWithStatus_recipients_userInfo_error___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _FALogSystem();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      uint64_t v8 = *(void **)(a1 + 32);
      int v10 = 138412290;
      NSUInteger v11 = v8;
      _os_log_impl(&dword_2189F0000, v6, OS_LOG_TYPE_DEFAULT, "successfully sent pending invite info to server for  %@", (uint8_t *)&v10, 0xCu);
    }

    [*(id *)(a1 + 40) updateSuggestionCellFor:*(void *)(a1 + 32)];
    [*(id *)(a1 + 40) sendSuggestionFeedbackFor:*(void *)(a1 + 32)];
  }
  else
  {
    if (v7)
    {
      id v9 = [v5 localizedDescription];
      int v10 = 138412290;
      NSUInteger v11 = v9;
      _os_log_impl(&dword_2189F0000, v6, OS_LOG_TYPE_DEFAULT, "Error sending invite info to server %@", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)updateSuggestionCellFor:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __59__FASuggestionsTableViewDecorator_updateSuggestionCellFor___block_invoke;
  v6[3] = &unk_264348AE0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __59__FASuggestionsTableViewDecorator_updateSuggestionCellFor___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 104) setByAddingObjectsFromArray:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 104);
  *(void *)(v3 + 104) = v2;

  id v5 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) firstObject];
  id v12 = [v5 indexFor:v6];

  id v7 = [*(id *)(a1 + 32) indexForSuggestionsSection];
  if (v12) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    id v9 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForRow:inSection:", (int)objc_msgSend(v12, "intValue"), (int)objc_msgSend(v7, "intValue"));
    int v10 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", v9, 0);
    NSUInteger v11 = [*(id *)(a1 + 32) tableView];
    [v11 reloadRowsAtIndexPaths:v10 withRowAnimation:5];
  }
}

- (void)sendSuggestionFeedbackFor:(id)a3
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v57 = objc_alloc_init(MEMORY[0x263F5D3A8]);
  v54 = v3;
  id v4 = [v3 firstObject];
  v56 = [(FASuggestionsTableViewDecorator *)self indexFor:v4];

  id v5 = -[NSArray objectAtIndexedSubscript:](self->_recommendedFamilyMembers, "objectAtIndexedSubscript:", (int)[v56 intValue]);
  id v6 = [MEMORY[0x263F3BF18] megadomeAdoption];
  if (![v6 isEnabled]) {
    goto LABEL_4;
  }
  id v7 = [MEMORY[0x263F3BFC0] megadomeKillSwitch];
  if ([v7 isEnabledWithForceRefresh:1])
  {

LABEL_4:
    goto LABEL_5;
  }
  v36 = [(FAInviteSuggestions *)self->_suggester feedbackContext];
  uint64_t v37 = [v36 megadomeFeedbackEventId];

  if (v37 != -1)
  {
    v38 = _FALogSystem();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2189F0000, v38, OS_LOG_TYPE_DEFAULT, "Submitting feedback to Megadome for suggestion tap", buf, 2u);
    }

    uint64_t v71 = 0;
    v72 = &v71;
    uint64_t v73 = 0x2050000000;
    v39 = (void *)getGDPersonEntityTagEventIDSetClass_softClass;
    uint64_t v74 = getGDPersonEntityTagEventIDSetClass_softClass;
    if (!getGDPersonEntityTagEventIDSetClass_softClass)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      uint64_t v67 = 3221225472;
      v68 = __getGDPersonEntityTagEventIDSetClass_block_invoke;
      v69 = &unk_264348998;
      v70 = &v71;
      __getGDPersonEntityTagEventIDSetClass_block_invoke((uint64_t)buf);
      v39 = (void *)v72[3];
    }
    v40 = v39;
    _Block_object_dispose(&v71, 8);
    id v41 = [v40 alloc];
    v42 = [(FAInviteSuggestions *)self->_suggester feedbackContext];
    v55 = objc_msgSend(v41, "initWithEventId:", objc_msgSend(v42, "megadomeFeedbackEventId"));

    uint64_t v71 = 0;
    v72 = &v71;
    uint64_t v73 = 0x2050000000;
    v43 = (void *)getGDPersonEntityTaggingStatefulFeedbackClass_softClass;
    uint64_t v74 = getGDPersonEntityTaggingStatefulFeedbackClass_softClass;
    if (!getGDPersonEntityTaggingStatefulFeedbackClass_softClass)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      uint64_t v67 = 3221225472;
      v68 = __getGDPersonEntityTaggingStatefulFeedbackClass_block_invoke;
      v69 = &unk_264348998;
      v70 = &v71;
      __getGDPersonEntityTaggingStatefulFeedbackClass_block_invoke((uint64_t)buf);
      v43 = (void *)v72[3];
    }
    long long v44 = v43;
    _Block_object_dispose(&v71, 8);
    v59 = (void *)[[v44 alloc] initWithStatefulFeedbackType:2 eventIds:v55];
    uint64_t v71 = 0;
    v72 = &v71;
    uint64_t v73 = 0x2050000000;
    long long v45 = (void *)getGDConfigurationClass_softClass;
    uint64_t v74 = getGDConfigurationClass_softClass;
    if (!getGDConfigurationClass_softClass)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      uint64_t v67 = 3221225472;
      v68 = __getGDConfigurationClass_block_invoke;
      v69 = &unk_264348998;
      v70 = &v71;
      __getGDConfigurationClass_block_invoke((uint64_t)buf);
      long long v45 = (void *)v72[3];
    }
    long long v46 = v45;
    _Block_object_dispose(&v71, 8);
    id v35 = objc_alloc_init(v46);
    uint64_t v71 = 0;
    v72 = &v71;
    uint64_t v73 = 0x2050000000;
    long long v47 = (void *)getGDEntityTaggingServiceClass_softClass;
    uint64_t v74 = getGDEntityTaggingServiceClass_softClass;
    if (!getGDEntityTaggingServiceClass_softClass)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      uint64_t v67 = 3221225472;
      v68 = __getGDEntityTaggingServiceClass_block_invoke;
      v69 = &unk_264348998;
      v70 = &v71;
      __getGDEntityTaggingServiceClass_block_invoke((uint64_t)buf);
      long long v47 = (void *)v72[3];
    }
    id v48 = v47;
    _Block_object_dispose(&v71, 8);
    id v65 = 0;
    long long v49 = (void *)[[v48 alloc] initWithConfig:v35 error:&v65];
    id v50 = v65;
    if (!v49)
    {
      long long v51 = _FALogSystem();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
        -[FASuggestionsTableViewDecorator sendSuggestionFeedbackFor:]((uint64_t)v50, v51);
      }
    }
    id v64 = 0;
    [v49 recordStatefulFeedback:v59 error:&v64];
    id v52 = v64;
    if (v52)
    {
      v53 = _FALogSystem();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
        -[FASuggestionsTableViewDecorator sendSuggestionFeedbackFor:]((uint64_t)v52, v53);
      }
    }
    goto LABEL_18;
  }
LABEL_5:
  BOOL v8 = _FALogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2189F0000, v8, OS_LOG_TYPE_DEFAULT, "Submitting feedback to PeopleSuggester for suggestion tap", buf, 2u);
  }

  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v9 = [(FAInviteSuggestions *)self->_suggester feedbackContext];
  int v10 = [v9 peopleSuggesterSuggestions];

  uint64_t v11 = [v10 countByEnumeratingWithState:&v60 objects:v75 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v61;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v61 != v12) {
          objc_enumerationMutation(v10);
        }
        int v14 = *(void **)(*((void *)&v60 + 1) + 8 * i);
        uint64_t v15 = [v14 recipients];
        uint64_t v16 = [v15 firstObject];

        uint64_t v17 = [v5 handle];
        __int16 v18 = [v16 handle];
        int v19 = [v17 isEqual:v18];

        if (v19)
        {
          id v20 = v14;

          id v57 = v20;
          goto LABEL_17;
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v60 objects:v75 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_17:

  id v21 = objc_alloc(MEMORY[0x263F5D380]);
  uint64_t v22 = [v57 bundleID];
  v55 = (void *)[v21 initWithType:0 suggestion:v57 transportBundleID:v22];

  uint64_t v23 = (void *)MEMORY[0x263F5D378];
  v24 = [MEMORY[0x263EFF910] date];
  v25 = [(FAInviteSuggestions *)self->_suggester feedbackContext];
  id v26 = [v25 peopleSuggesterPredictionContext];
  id v27 = [v26 suggestionDate];
  [v24 timeIntervalSinceDate:v27];
  double v29 = v28;
  id v30 = [(FAInviteSuggestions *)self->_suggester feedbackContext];
  id v31 = [v30 peopleSuggesterPredictionContext];
  id v32 = [(FAInviteSuggestions *)self->_suggester feedbackContext];
  id v33 = [v32 peopleSuggesterSuggestions];
  *(float *)&double v34 = (float)[(NSArray *)self->_recommendedFamilyMembers count];
  v59 = [v23 feedbackForAction:v55 delay:v31 context:v33 suggestions:0 numberOfVisibleSuggestions:v29 sessionIdentifier:v34];

  id v35 = [MEMORY[0x263F5D398] suggesterWithDaemon];
  [v35 provideFeedbackForSuggestions:v59];
LABEL_18:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectModel, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_invitedHandles, 0);
  objc_storeStrong((id *)&self->_suggester, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_inviteConfigurationController, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_emergencyContacts, 0);
  objc_storeStrong((id *)&self->_recommendedFamilyMembers, 0);
  objc_storeStrong((id *)&self->_familySuggestionsPictureStore, 0);
  objc_storeStrong((id *)&self->_remoteTableViewController, 0);
}

- (void)sendSuggestionFeedbackFor:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2189F0000, a2, OS_LOG_TYPE_ERROR, "Error providing feedback to megadome: %@", (uint8_t *)&v2, 0xCu);
}

- (void)sendSuggestionFeedbackFor:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2189F0000, a2, OS_LOG_TYPE_ERROR, "Error initializing megadome entity tagging service while providing feedback: %@", (uint8_t *)&v2, 0xCu);
}

@end