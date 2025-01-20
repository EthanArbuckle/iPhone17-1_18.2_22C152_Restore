@interface _UIShareInvitationAddParticipantController
+ (id)_subtitleTextForRecord:(id)a3 font:(id)a4 boldFond:(id)a5;
+ (id)_titleTextForRecord:(id)a3 font:(id)a4 boldFond:(id)a5;
+ (id)contactForMailAddress:(id)a3;
+ (id)contactForMailAddressOrPhoneNumber:(id)a3;
+ (id)contactForPhoneNumber:(id)a3;
+ (id)contactStore;
+ (void)_applyBoldFont:(id)a3 toPartialMatches:(id)a4 inAttributedString:(id)a5;
- (CKShare)share;
- (CNComposeRecipientTextView)addressView;
- (CNMonogrammer)monogrammer;
- (NSArray)currentParticipants;
- (NSArray)searchResults;
- (NSLayoutConstraint)addressHeightConstraint;
- (UILabel)infoLabel;
- (UITableView)searchResultTable;
- (UITableViewController)searchResultTableViewController;
- (_UIContactSearchArrayController)searchController;
- (_UIShareInvitationAddParticipantController)initWithCurrentAddresses:(id)a3;
- (id)cancelButton;
- (id)completion;
- (id)composeRecipientView:(id)a3 composeRecipientForAddress:(id)a4;
- (id)finishAndReturnParticipants;
- (id)sendButton;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_updateSendButton;
- (void)arrayController:(id)a3 modelChanged:(id)a4 differences:(id)a5;
- (void)cancelAction:(id)a3;
- (void)composeHeaderView:(id)a3 didChangeSize:(CGSize)a4;
- (void)composeRecipientView:(id)a3 didAddRecipient:(id)a4;
- (void)composeRecipientView:(id)a3 didFinishEnteringAddress:(id)a4;
- (void)composeRecipientView:(id)a3 didRemoveRecipient:(id)a4;
- (void)composeRecipientView:(id)a3 textDidChange:(id)a4;
- (void)composeRecipientViewRequestAddRecipient:(id)a3;
- (void)contactPicker:(id)a3 didSelectContact:(id)a4;
- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4;
- (void)contactPickerDidCancel:(id)a3;
- (void)continueAction:(id)a3;
- (void)dealloc;
- (void)setAddressHeightConstraint:(id)a3;
- (void)setAddressView:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setCurrentParticipants:(id)a3;
- (void)setInfoLabel:(id)a3;
- (void)setMonogrammer:(id)a3;
- (void)setSearchController:(id)a3;
- (void)setSearchResultTable:(id)a3;
- (void)setSearchResultTableViewController:(id)a3;
- (void)setSearchResults:(id)a3;
- (void)setShare:(id)a3;
- (void)startSearchingText:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateOtherRecipients;
- (void)updateSearchResults:(id)a3 changes:(id)a4;
- (void)viewDidLayoutSubviews;
@end

@implementation _UIShareInvitationAddParticipantController

- (_UIShareInvitationAddParticipantController)initWithCurrentAddresses:(id)a3
{
  id v4 = a3;
  v97.receiver = self;
  v97.super_class = (Class)_UIShareInvitationAddParticipantController;
  v5 = [(_UIShareInvitationAddParticipantController *)&v97 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5)
  {
    v7 = [(_UIShareInvitationAddParticipantController *)v5 view];
    id v96 = v4;
    if (v4) {
      v8 = v4;
    }
    else {
      v8 = &__NSArray0__struct;
    }
    [(_UIShareInvitationAddParticipantController *)v6 setCurrentParticipants:v8];
    id v9 = objc_alloc((Class)CNComposeRecipientTextView);
    v10 = [(_UIShareInvitationAddParticipantController *)v6 view];
    [v10 bounds];
    id v11 = objc_msgSend(v9, "initWithFrame:");

    [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
    v12 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    v13 = [v12 localizedStringForKey:@"GIVE_ACCESS_TO_LABEL" value:@"To:" table:@"Localizable"];
    [v11 setLabel:v13];

    [v11 setDelegate:v6];
    [v11 setSeparatorHidden:0];
    v14 = +[UIColor labelColor];
    [v11 setTypingTextColor:v14];

    [v7 addSubview:v11];
    [(_UIShareInvitationAddParticipantController *)v6 setAddressView:v11];
    id v15 = objc_alloc_init((Class)UILabel);
    [(_UIShareInvitationAddParticipantController *)v6 setInfoLabel:v15];

    v16 = [(_UIShareInvitationAddParticipantController *)v6 infoLabel];
    [v16 setTranslatesAutoresizingMaskIntoConstraints:0];

    v17 = +[UIFont systemFontOfSize:17.0 weight:UIFontWeightRegular];
    v18 = [(_UIShareInvitationAddParticipantController *)v6 infoLabel];
    [v18 setFont:v17];

    v19 = +[UIColor secondaryLabelColor];
    v20 = [(_UIShareInvitationAddParticipantController *)v6 infoLabel];
    [v20 setTextColor:v19];

    v21 = [(_UIShareInvitationAddParticipantController *)v6 infoLabel];
    [v21 setTextAlignment:1];

    v22 = [(_UIShareInvitationAddParticipantController *)v6 infoLabel];
    [v22 setText:@"Only people you add will have access."];

    v23 = [(_UIShareInvitationAddParticipantController *)v6 infoLabel];
    [v23 setNumberOfLines:0];

    v24 = [(_UIShareInvitationAddParticipantController *)v6 infoLabel];
    [v7 addSubview:v24];

    id v25 = [objc_alloc((Class)UITableViewController) initWithStyle:0];
    [(_UIShareInvitationAddParticipantController *)v6 setSearchResultTableViewController:v25];

    v26 = [(_UIShareInvitationAddParticipantController *)v6 searchResultTableViewController];
    [(_UIShareInvitationAddParticipantController *)v6 addChildViewController:v26];

    v27 = [(_UIShareInvitationAddParticipantController *)v6 searchResultTableViewController];
    v28 = [v27 tableView];

    [(_UIShareInvitationAddParticipantController *)v6 setSearchResultTable:v28];
    v29 = [(_UIShareInvitationAddParticipantController *)v6 searchResultTableViewController];
    [v29 didMoveToParentViewController:v6];

    [v28 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v28 setAlpha:0.0];
    [v28 setDelegate:v6];
    [v28 setDataSource:v6];
    [v28 registerClass:objc_opt_class() forCellReuseIdentifier:@"_UIShareInvitationParticipantTableViewCellIdentifier"];
    [v7 addSubview:v28];
    v30 = [v11 heightAnchor];
    v31 = [v30 constraintEqualToConstant:49.5];
    [(_UIShareInvitationAddParticipantController *)v6 setAddressHeightConstraint:v31];

    v32 = objc_opt_new();
    v33 = [(_UIShareInvitationAddParticipantController *)v6 view];
    [v33 addLayoutGuide:v32];

    v95 = v7;
    v34 = [v7 safeAreaLayoutGuide];
    v90 = [v11 topAnchor];
    v89 = [v34 topAnchor];
    v88 = [v90 constraintEqualToAnchor:v89];
    v100[0] = v88;
    v87 = [v11 bottomAnchor];
    v86 = [v28 topAnchor];
    v85 = [v87 constraintEqualToAnchor:v86];
    v100[1] = v85;
    v84 = [v11 leadingAnchor];
    v83 = [v34 leadingAnchor];
    v82 = [v84 constraintEqualToAnchor:v83];
    v100[2] = v82;
    v81 = [v11 trailingAnchor];
    v80 = [v34 trailingAnchor];
    v79 = [v81 constraintEqualToAnchor:v80];
    v100[3] = v79;
    v78 = [v28 bottomAnchor];
    v77 = [v34 bottomAnchor];
    v76 = [v78 constraintEqualToAnchor:v77];
    v100[4] = v76;
    v75 = [(_UIShareInvitationAddParticipantController *)v6 addressHeightConstraint];
    v100[5] = v75;
    v74 = [v28 leadingAnchor];
    v73 = [v34 leadingAnchor];
    v72 = [v74 constraintEqualToAnchor:v73];
    v100[6] = v72;
    v93 = v28;
    v71 = [v28 trailingAnchor];
    v70 = [v34 trailingAnchor];
    v69 = [v71 constraintEqualToAnchor:v70];
    v100[7] = v69;
    v68 = [(UILabel *)v6->_infoLabel widthAnchor];
    v67 = [v34 widthAnchor];
    v66 = [v68 constraintEqualToAnchor:v67 multiplier:1.0 constant:-64.0];
    v100[8] = v66;
    v65 = [(UILabel *)v6->_infoLabel centerXAnchor];
    v64 = [v34 centerXAnchor];
    v63 = [v65 constraintEqualToAnchor:v64];
    v100[9] = v63;
    v62 = [v32 topAnchor];
    v94 = v11;
    v61 = [v11 bottomAnchor];
    v60 = [v62 constraintEqualToAnchor:v61];
    v100[10] = v60;
    v59 = [v32 heightAnchor];
    v91 = v34;
    v35 = [v34 heightAnchor];
    v36 = [v59 constraintEqualToAnchor:v35 multiplier:0.340000004];
    v100[11] = v36;
    v37 = [(UILabel *)v6->_infoLabel topAnchor];
    v38 = [v32 bottomAnchor];
    v39 = [v37 constraintEqualToAnchor:v38];
    v100[12] = v39;
    v40 = [(UILabel *)v6->_infoLabel topAnchor];
    v92 = v32;
    v41 = [v32 centerYAnchor];
    v42 = [v40 constraintEqualToAnchor:v41];
    v100[13] = v42;
    v43 = +[NSArray arrayWithObjects:v100 count:14];
    +[NSLayoutConstraint activateConstraints:v43];

    if ((_UIBarsApplyChromelessEverywhere() & 1) == 0) {
      [(_UIShareInvitationAddParticipantController *)v6 setEdgesForExtendedLayout:0];
    }
    v44 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    v45 = [v44 localizedStringForKey:@"GIVE_ACCESS_TITLE" value:@"Add People" table:@"Localizable"];
    [(_UIShareInvitationAddParticipantController *)v6 setTitle:v45];

    id v46 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:v6 action:"cancelAction:"];
    id v47 = objc_alloc((Class)UIBarButtonItem);
    v48 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    v49 = [v48 localizedStringForKey:@"Continue" value:@"Continue" table:@"Localizable"];
    id v50 = [v47 initWithTitle:v49 style:2 target:v6 action:"continueAction:"];

    id v99 = v46;
    v51 = +[NSArray arrayWithObjects:&v99 count:1];
    v52 = [(_UIShareInvitationAddParticipantController *)v6 navigationItem];
    [v52 setLeftBarButtonItems:v51];

    id v98 = v50;
    v53 = +[NSArray arrayWithObjects:&v98 count:1];
    v54 = [(_UIShareInvitationAddParticipantController *)v6 navigationItem];
    [v54 setRightBarButtonItems:v53];

    [(_UIShareInvitationAddParticipantController *)v6 _updateSendButton];
    [(_UIShareInvitationAddParticipantController *)v6 updateOtherRecipients];
    v55 = +[UIColor systemBackgroundColor];
    v56 = [(_UIShareInvitationAddParticipantController *)v6 view];
    [v56 setBackgroundColor:v55];

    id v57 = [objc_alloc((Class)CNMonogrammer) initWithStyle:0 diameter:40.0];
    [(_UIShareInvitationAddParticipantController *)v6 setMonogrammer:v57];

    [v94 becomeFirstResponder];
    id v4 = v96;
  }

  return v6;
}

- (void)dealloc
{
  [(CNComposeRecipientTextView *)self->_addressView setDelegate:0];
  [(_UIContactSearchArrayController *)self->_searchController invalidate];
  v3.receiver = self;
  v3.super_class = (Class)_UIShareInvitationAddParticipantController;
  [(_UIShareInvitationAddParticipantController *)&v3 dealloc];
}

- (id)sendButton
{
  v2 = [(_UIShareInvitationAddParticipantController *)self navigationItem];
  objc_super v3 = [v2 rightBarButtonItem];

  return v3;
}

- (id)cancelButton
{
  v2 = [(_UIShareInvitationAddParticipantController *)self navigationItem];
  objc_super v3 = [v2 leftBarButtonItem];

  return v3;
}

- (void)_updateSendButton
{
  id v12 = [(_UIShareInvitationAddParticipantController *)self addressView];
  v7 = [v12 recipients];
  id v8 = [v7 count];
  if (v8)
  {
    int v9 = 0;
    uint64_t IsPhoneNumber = 1;
  }
  else
  {
    v2 = [(_UIShareInvitationAddParticipantController *)self addressView];
    objc_super v3 = [v2 text];
    if (IMStringIsEmail())
    {
      int v9 = 0;
      uint64_t IsPhoneNumber = 1;
    }
    else
    {
      id v4 = [(_UIShareInvitationAddParticipantController *)self addressView];
      v5 = [v4 text];
      uint64_t IsPhoneNumber = IMStringIsPhoneNumber();
      int v9 = 1;
    }
  }
  id v11 = [(_UIShareInvitationAddParticipantController *)self sendButton];
  [v11 setEnabled:IsPhoneNumber];

  if (v9)
  {
  }
  if (!v8)
  {
  }
}

- (id)finishAndReturnParticipants
{
  objc_super v3 = [(_UIShareInvitationAddParticipantController *)self addressView];
  [v3 resignFirstResponder];

  id v4 = [(_UIShareInvitationAddParticipantController *)self addressView];
  [v4 finishEnteringRecipient];

  v5 = [(_UIShareInvitationAddParticipantController *)self addressView];
  v6 = [v5 uncommentedAddresses];

  return v6;
}

- (void)cancelAction:(id)a3
{
  objc_super v3 = [(_UIShareInvitationAddParticipantController *)self completion];
  v3[2](v3, 1, &__NSArray0__struct);
}

- (void)continueAction:(id)a3
{
  id v5 = [(_UIShareInvitationAddParticipantController *)self finishAndReturnParticipants];
  id v4 = [(_UIShareInvitationAddParticipantController *)self completion];
  ((void (**)(void, void, id))v4)[2](v4, 0, v5);
}

- (void)viewDidLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)_UIShareInvitationAddParticipantController;
  [(_UIShareInvitationAddParticipantController *)&v14 viewDidLayoutSubviews];
  v15[0] = NSForegroundColorAttributeName;
  objc_super v3 = +[UIColor secondaryLabelColor];
  v16[0] = v3;
  v15[1] = NSFontAttributeName;
  id v4 = [(_UIShareInvitationAddParticipantController *)self addressView];
  id v5 = [v4 textView];
  v6 = [v5 font];
  v16[1] = v6;
  v7 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];

  id v8 = objc_alloc((Class)NSAttributedString);
  int v9 = [(_UIShareInvitationAddParticipantController *)self addressView];
  v10 = _UIAdaptLocalizedStringForView();
  id v11 = [v8 initWithString:v10 attributes:v7];

  id v12 = [(_UIShareInvitationAddParticipantController *)self addressView];
  v13 = [v12 textView];
  [v13 setAttributedPlaceholder:v11];
}

- (void)composeHeaderView:(id)a3 didChangeSize:(CGSize)a4
{
  double height = a4.height;
  id v5 = [(_UIShareInvitationAddParticipantController *)self addressHeightConstraint];
  [v5 setConstant:height];
}

- (void)composeRecipientView:(id)a3 didAddRecipient:(id)a4
{
  id v5 = a3;
  [(_UIShareInvitationAddParticipantController *)self _updateSendButton];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v6 = objc_msgSend(v5, "textView", 0);
  v7 = [v6 textStorage];
  id v8 = objc_msgSend(v5, "atomViewsInRange:", 0, objc_msgSend(v7, "length"));

  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * (void)v12) setTintColor:0];
        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }

  [(_UIShareInvitationAddParticipantController *)self updateOtherRecipients];
}

- (void)updateOtherRecipients
{
  objc_super v3 = [(_UIShareInvitationAddParticipantController *)self currentParticipants];
  id v4 = +[NSMutableArray arrayWithArray:v3];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(_UIShareInvitationAddParticipantController *)self addressView];
  v6 = [v5 recipients];

  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v12 = [v11 address];

        if (v12)
        {
          long long v13 = [v11 address];
          [v4 addObject:v13];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  long long v14 = [(_UIShareInvitationAddParticipantController *)self searchController];
  [v14 setExistingRecipients:v4];
}

- (void)composeRecipientView:(id)a3 didRemoveRecipient:(id)a4
{
  [(_UIShareInvitationAddParticipantController *)self _updateSendButton];

  [(_UIShareInvitationAddParticipantController *)self updateOtherRecipients];
}

- (void)composeRecipientView:(id)a3 didFinishEnteringAddress:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_UIShareInvitationAddParticipantController *)self searchController];
  [v8 setSearchText:0];

  [v7 clearText];
  id v9 = [(_UIShareInvitationAddParticipantController *)self composeRecipientView:v7 composeRecipientForAddress:v6];

  [v7 addRecipient:v9];
}

- (id)composeRecipientView:(id)a3 composeRecipientForAddress:(id)a4
{
  id v4 = a4;
  id v5 = [(id)objc_opt_class() contactForMailAddressOrPhoneNumber:v4];
  if (v5)
  {
    if (IMStringIsPhoneNumber())
    {
      id v6 = objc_alloc((Class)CNComposeRecipient);
      id v7 = v5;
      id v8 = v4;
      uint64_t v9 = 1;
    }
    else
    {
      if ((IMStringIsEmail() & 1) == 0)
      {
        uint64_t v11 = cdui_default_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
          sub_1000C61E8();
        }
      }
      id v6 = objc_alloc((Class)CNComposeRecipient);
      id v7 = v5;
      id v8 = v4;
      uint64_t v9 = 0;
    }
    id v10 = [v6 initWithContact:v7 address:v8 kind:v9];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)composeRecipientViewRequestAddRecipient:(id)a3
{
  id v4 = objc_alloc_init((Class)CNContactPickerViewController);
  v8[0] = CNContactEmailAddressesKey;
  v8[1] = CNContactPhoneNumbersKey;
  id v5 = +[NSArray arrayWithObjects:v8 count:2];
  [v4 setDisplayedPropertyKeys:v5];

  [v4 setDelegate:self];
  id v6 = +[NSPredicate predicateWithFormat:@"(emailAddresses.@count == 1 AND phoneNumbers.@count == 0) OR (emailAddresses.@count == 0 AND phoneNumbers.@count == 1)"];
  [v4 setPredicateForSelectionOfContact:v6];

  id v7 = +[NSPredicate predicateWithFormat:@"emailAddresses.@count > 0 OR phoneNumbers.@count > 0"];
  [v4 setPredicateForEnablingContact:v7];

  [(_UIShareInvitationAddParticipantController *)self presentViewController:v4 animated:1 completion:0];
}

- (void)composeRecipientView:(id)a3 textDidChange:(id)a4
{
  [(_UIShareInvitationAddParticipantController *)self startSearchingText:a4];

  [(_UIShareInvitationAddParticipantController *)self _updateSendButton];
}

- (void)contactPickerDidCancel:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000064C0;
  v3[3] = &unk_1000FEF28;
  v3[4] = self;
  [(_UIShareInvitationAddParticipantController *)self dismissViewControllerAnimated:1 completion:v3];
}

- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4
{
  id v5 = a4;
  id v6 = [v5 value];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    id v8 = [(_UIShareInvitationAddParticipantController *)self addressView];
    id v9 = objc_alloc((Class)CNComposeRecipient);
    id v10 = [v5 contact];
    uint64_t v11 = [v7 stringValue];
    id v12 = [v9 initWithContact:v10 address:v11 kind:1];
    [v8 addRecipient:v12];

    long long v13 = cdui_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      long long v14 = [v7 stringValue];
      *(_DWORD *)buf = 138412290;
      id v22 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[INFO] Added phone participant %@ via contact sheet property", buf, 0xCu);
    }
LABEL_7:

    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = v6;
    long long v16 = [(_UIShareInvitationAddParticipantController *)self addressView];
    id v17 = objc_alloc((Class)CNComposeRecipient);
    long long v18 = [v5 contact];
    id v19 = [v17 initWithContact:v18 address:v15 kind:0];
    [v16 addRecipient:v19];

    long long v13 = cdui_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[INFO] Added mail participant %@ via contact sheet property", buf, 0xCu);
    }
    goto LABEL_7;
  }
LABEL_8:
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000067B8;
  v20[3] = &unk_1000FEF28;
  v20[4] = self;
  [(_UIShareInvitationAddParticipantController *)self dismissViewControllerAnimated:1 completion:v20];
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  id v5 = a4;
  id v6 = [v5 emailAddresses];
  id v7 = [v6 firstObject];
  id v8 = [v7 value];

  if (!v8)
  {
    long long v14 = [v5 phoneNumbers];
    id v15 = [v14 firstObject];
    long long v13 = [v15 value];

    id v10 = [(id)objc_opt_class() contactForPhoneNumber:v13];
    if (v10)
    {
      long long v16 = [(_UIShareInvitationAddParticipantController *)self addressView];
      id v17 = objc_alloc((Class)CNComposeRecipient);
      long long v18 = [v13 stringValue];
      id v19 = [v17 initWithContact:v10 address:v18 kind:1];
      [v16 addRecipient:v19];

      v20 = cdui_default_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v21 = [v13 stringValue];
        *(_DWORD *)buf = 138412290;
        v24 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "[INFO] Added phone participant %@ via contact sheet", buf, 0xCu);
      }
    }
    else
    {
      v20 = cdui_default_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
        sub_1000C6250();
      }
    }

    goto LABEL_13;
  }
  uint64_t v9 = [(id)objc_opt_class() contactForMailAddress:v8];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = [(_UIShareInvitationAddParticipantController *)self addressView];
    id v12 = [objc_alloc((Class)CNComposeRecipient) initWithContact:v10 address:v8 kind:0];
    [v11 addRecipient:v12];

    long long v13 = cdui_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v8;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[INFO] Added mail participant %@ via contact sheet", buf, 0xCu);
    }
LABEL_13:

    goto LABEL_14;
  }
  id v10 = cdui_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
    sub_1000C6250();
  }
LABEL_14:

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100006B1C;
  v22[3] = &unk_1000FEF28;
  v22[4] = self;
  [(_UIShareInvitationAddParticipantController *)self dismissViewControllerAnimated:1 completion:v22];
}

+ (id)contactStore
{
  if (qword_10010F0D8 != -1) {
    dispatch_once(&qword_10010F0D8, &stru_1000FEF68);
  }
  v2 = (void *)qword_10010F0D0;

  return v2;
}

+ (id)contactForMailAddress:(id)a3
{
  id v4 = a3;
  id v5 = [a1 contactStore];
  id v6 = sub_100006CB8(v5, v4, 0, 1, 0);

  return v6;
}

+ (id)contactForPhoneNumber:(id)a3
{
  id v4 = a3;
  id v5 = [a1 contactStore];
  id v6 = sub_100006CB8(v5, 0, v4, 0, 1);

  return v6;
}

+ (id)contactForMailAddressOrPhoneNumber:(id)a3
{
  id v4 = a3;
  id v5 = [a1 contactStore];
  id v6 = sub_100006CB8(v5, v4, 0, 1, 1);

  return v6;
}

- (_UIContactSearchArrayController)searchController
{
  searchController = self->_searchController;
  if (!searchController)
  {
    id v4 = [_UIContactSearchArrayController alloc];
    id v5 = [(id)objc_opt_class() contactStore];
    id v6 = [(_UIContactSearchArrayController *)v4 initWithContactStore:v5 delegate:self];
    id v7 = self->_searchController;
    self->_searchController = v6;

    searchController = self->_searchController;
  }

  return searchController;
}

- (void)arrayController:(id)a3 modelChanged:(id)a4 differences:(id)a5
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007174;
  block[3] = &unk_1000FEFD0;
  block[4] = self;
  id v9 = a4;
  id v10 = a5;
  id v6 = v10;
  id v7 = v9;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)updateSearchResults:(id)a3 changes:(id)a4
{
  id v5 = [a3 array];
  searchResults = self->_searchResults;
  self->_searchResults = v5;

  id v7 = [(_UIShareInvitationAddParticipantController *)self searchResultTable];
  [v7 reloadData];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  void v8[2] = sub_100007244;
  v8[3] = &unk_1000FEF28;
  v8[4] = self;
  +[UIView animateWithDuration:v8 animations:0.2];
}

- (void)startSearchingText:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIShareInvitationAddParticipantController *)self searchController];
  [v5 setSearchText:v4];
}

+ (void)_applyBoldFont:(id)a3 toPartialMatches:(id)a4 inAttributedString:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v21 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v21)
  {
    uint64_t v20 = *(void *)v23;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v23 != v20) {
          objc_enumerationMutation(v8);
        }
        uint64_t v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v12 = [v9 string];
        long long v13 = [v11 string];
        for (id j = [v12 rangeOfString:v13];
              ;
              id j = objc_msgSend(v12, "rangeOfString:options:range:", v13, 0, v18, v19))
        {
          unint64_t v16 = (unint64_t)j;
          uint64_t v17 = v15;

          if (v16 == 0x7FFFFFFFFFFFFFFFLL) {
            break;
          }
          objc_msgSend(v9, "addAttribute:value:range:", NSFontAttributeName, v7, v16, v17);
          long long v18 = (char *)(v16 + 1);
          id v19 = (char *)[v9 length] + ~v16;
          id v12 = [v9 string];
          long long v13 = [v11 string];
        }
      }
      id v21 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v21);
  }
}

+ (id)_titleTextForRecord:(id)a3 font:(id)a4 boldFond:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init((Class)NSMutableAttributedString);
  id v12 = [v8 displayString];

  if (v12)
  {
    id v13 = objc_alloc((Class)NSMutableAttributedString);
    long long v14 = [v8 displayString];
    NSAttributedStringKey v26 = NSFontAttributeName;
    id v27 = v9;
    uint64_t v15 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    id v16 = [v13 initWithString:v14 attributes:v15];

    uint64_t v17 = [v8 completelyMatchedAttributedStrings];
    [a1 _applyBoldFont:v10 toPartialMatches:v17 inAttributedString:v16];
    id v11 = v16;
LABEL_7:

    goto LABEL_8;
  }
  long long v18 = cdui_default_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
    sub_1000C62B8();
  }

  id v19 = [v8 address];

  if (v19)
  {
    id v20 = objc_alloc((Class)NSMutableAttributedString);
    uint64_t v17 = [v8 address];
    NSAttributedStringKey v24 = NSFontAttributeName;
    id v25 = v9;
    id v21 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    id v22 = [v20 initWithString:v17 attributes:v21];

    id v11 = v22;
    goto LABEL_7;
  }
LABEL_8:

  return v11;
}

+ (id)_subtitleTextForRecord:(id)a3 font:(id)a4 boldFond:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc((Class)NSMutableAttributedString);
  id v12 = [v10 address];
  NSAttributedStringKey v17 = NSFontAttributeName;
  id v18 = v9;
  id v13 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];

  id v14 = [v11 initWithString:v12 attributes:v13];
  uint64_t v15 = [v10 completelyMatchedAttributedStrings];

  [a1 _applyBoldFont:v8 toPartialMatches:v15 inAttributedString:v14];

  return v14;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(_UIShareInvitationAddParticipantController *)self searchResults];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v38 = [a3 dequeueReusableCellWithIdentifier:@"_UIShareInvitationParticipantTableViewCellIdentifier" forIndexPath:v6];
  id v7 = [(_UIShareInvitationAddParticipantController *)self searchResults];
  id v8 = [v6 row];

  id v9 = [v7 objectAtIndex:v8];

  id v10 = [v9 composeRecipient];
  id v11 = [v10 contact];
  id v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v14 = objc_opt_class();
    uint64_t v15 = [v9 composeRecipient];
    id v16 = [v15 address];
    id v13 = [v14 contactForMailAddress:v16];
  }
  NSAttributedStringKey v17 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCaption1];
  id v18 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleCaption1 addingSymbolicTraits:2 options:1];
  id v19 = +[UIFont fontWithDescriptor:v18 size:0.0];

  id v20 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCaption2];
  id v21 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleCaption2 addingSymbolicTraits:2 options:1];
  id v22 = +[UIFont fontWithDescriptor:v21 size:0.0];

  long long v23 = objc_opt_class();
  NSAttributedStringKey v24 = [v9 composeRecipient];
  id v25 = [v23 _titleTextForRecord:v24 font:v17 boldFond:v19];
  NSAttributedStringKey v26 = [v38 textLabel];
  [v26 setAttributedText:v25];

  id v27 = objc_opt_class();
  v28 = [v9 composeRecipient];
  v29 = [v27 _subtitleTextForRecord:v28 font:v20 boldFond:v22];
  v30 = [v38 detailTextLabel];
  [v30 setAttributedText:v29];

  if (v13)
  {
    v31 = +[CNMonogrammer descriptorForRequiredKeysIncludingImage:0];
    v39 = v31;
    v32 = +[NSArray arrayWithObjects:&v39 count:1];
    unsigned int v33 = [v13 areKeysAvailable:v32];

    if (v33)
    {
      v34 = [(_UIShareInvitationAddParticipantController *)self monogrammer];
      v35 = [v34 monogramForContact:v13];
      v36 = [v38 imageView];
      [v36 setImage:v35];
    }
  }

  return v38;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(_UIShareInvitationAddParticipantController *)self searchResults];
  id v7 = [v5 row];

  id v8 = [v6 objectAtIndex:v7];

  id v9 = [(_UIShareInvitationAddParticipantController *)self addressView];
  id v10 = [v8 composeRecipient];
  [v9 addRecipient:v10];

  id v11 = cdui_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = [v8 composeRecipient];
    id v13 = [v12 address];
    int v16 = 138412290;
    NSAttributedStringKey v17 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[INFO] Added recipient %@ via type-ahead search", (uint8_t *)&v16, 0xCu);
  }
  id v14 = [(_UIShareInvitationAddParticipantController *)self addressView];
  [v14 clearText];

  uint64_t v15 = [(_UIShareInvitationAddParticipantController *)self searchController];
  [v15 setSearchText:0];
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (CKShare)share
{
  return self->_share;
}

- (void)setShare:(id)a3
{
}

- (CNComposeRecipientTextView)addressView
{
  return self->_addressView;
}

- (void)setAddressView:(id)a3
{
}

- (NSLayoutConstraint)addressHeightConstraint
{
  return self->_addressHeightConstraint;
}

- (void)setAddressHeightConstraint:(id)a3
{
}

- (UILabel)infoLabel
{
  return self->_infoLabel;
}

- (void)setInfoLabel:(id)a3
{
}

- (void)setSearchController:(id)a3
{
}

- (UITableViewController)searchResultTableViewController
{
  return self->_searchResultTableViewController;
}

- (void)setSearchResultTableViewController:(id)a3
{
}

- (UITableView)searchResultTable
{
  return self->_searchResultTable;
}

- (void)setSearchResultTable:(id)a3
{
}

- (NSArray)searchResults
{
  return self->_searchResults;
}

- (void)setSearchResults:(id)a3
{
}

- (NSArray)currentParticipants
{
  return self->_currentParticipants;
}

- (void)setCurrentParticipants:(id)a3
{
}

- (CNMonogrammer)monogrammer
{
  return self->_monogrammer;
}

- (void)setMonogrammer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monogrammer, 0);
  objc_storeStrong((id *)&self->_currentParticipants, 0);
  objc_storeStrong((id *)&self->_searchResults, 0);
  objc_storeStrong((id *)&self->_searchResultTable, 0);
  objc_storeStrong((id *)&self->_searchResultTableViewController, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_infoLabel, 0);
  objc_storeStrong((id *)&self->_addressHeightConstraint, 0);
  objc_storeStrong((id *)&self->_addressView, 0);
  objc_storeStrong((id *)&self->_share, 0);

  objc_storeStrong(&self->_completion, 0);
}

@end