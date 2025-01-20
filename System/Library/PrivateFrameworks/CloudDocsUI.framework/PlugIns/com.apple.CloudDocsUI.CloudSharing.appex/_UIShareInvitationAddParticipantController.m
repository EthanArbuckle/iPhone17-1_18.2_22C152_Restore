@interface _UIShareInvitationAddParticipantController
+ (id)_subtitleTextForRecord:(id)a3 font:(id)a4 boldFond:(id)a5;
+ (id)_titleTextForRecord:(id)a3 font:(id)a4 boldFond:(id)a5;
+ (id)contactForMailAddress:(id)a3;
+ (id)contactForMailAddressOrPhoneNumber:(id)a3;
+ (id)contactForPhoneNumber:(id)a3;
+ (id)contactStore;
+ (void)_applyBoldFont:(id)a3 toPartialMatches:(id)a4 inAttributedString:(id)a5;
- (CKShare)share;
- (CNMonogrammer)monogrammer;
- (MFComposeRecipientTextView)addressView;
- (NSArray)currentParticipants;
- (NSArray)searchResults;
- (NSLayoutConstraint)addressHeightConstraint;
- (UILabel)infoLabel;
- (UITableView)searchResultTable;
- (UITableViewController)searchResultTableViewController;
- (_UIContactSearchArrayController)searchController;
- (_UIShareInvitationAddParticipantController)initWithCoder:(id)a3;
- (_UIShareInvitationAddParticipantController)initWithNibName:(id)a3 bundle:(id)a4;
- (_UIShareInvitationAddParticipantController)initWithShare:(id)a3 uti:(id)a4;
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
- (void)composeRecipientView:(id)a3 didAddRecipient:(id)a4;
- (void)composeRecipientView:(id)a3 didChangeSize:(CGSize)a4;
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

- (_UIShareInvitationAddParticipantController)initWithShare:(id)a3 uti:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v117.receiver = self;
  v117.super_class = (Class)_UIShareInvitationAddParticipantController;
  v8 = [(_UIShareInvitationAddParticipantController *)&v117 initWithNibName:0 bundle:0];
  v9 = v8;
  if (v8)
  {
    v10 = [(_UIShareInvitationAddParticipantController *)v8 view];
    v112 = v6;
    [(_UIShareInvitationAddParticipantController *)v9 setShare:v6];
    id v11 = objc_alloc((Class)MFComposeRecipientTextView);
    v12 = [(_UIShareInvitationAddParticipantController *)v9 view];
    [v12 bounds];
    id v13 = objc_msgSend(v11, "initWithFrame:");

    [(_UIShareInvitationAddParticipantController *)v9 setAddressView:v13];
    [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
    v14 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    v15 = [v14 localizedStringForKey:@"GIVE_ACCESS_TO_LABEL" value:@"To:" table:@"Localizable"];
    [v13 setLabel:v15];

    [v13 setDelegate:v9];
    [v13 setSeparatorHidden:0];
    v16 = +[UIColor labelColor];
    [v13 setTypingTextColor:v16];

    [v10 addSubview:v13];
    id v17 = objc_alloc_init((Class)UILabel);
    [(_UIShareInvitationAddParticipantController *)v9 setInfoLabel:v17];

    v18 = [(_UIShareInvitationAddParticipantController *)v9 infoLabel];
    [v18 setTranslatesAutoresizingMaskIntoConstraints:0];

    v19 = +[UIFont systemFontOfSize:17.0 weight:UIFontWeightRegular];
    v20 = [(_UIShareInvitationAddParticipantController *)v9 infoLabel];
    [v20 setFont:v19];

    v21 = +[UIColor secondaryLabelColor];
    v22 = [(_UIShareInvitationAddParticipantController *)v9 infoLabel];
    [v22 setTextColor:v21];

    v23 = [(_UIShareInvitationAddParticipantController *)v9 infoLabel];
    [v23 setTextAlignment:1];

    v24 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    v25 = [v24 localizedStringForKey:@"GIVE_ACCESS_INFO_LABEL" value:@"Only people you add will have access." table:@"Localizable"];
    id v111 = v7;
    v26 = _CDAdaptLocalizedStringForItemType();
    v27 = [(_UIShareInvitationAddParticipantController *)v9 infoLabel];
    [v27 setText:v26];

    v28 = [(_UIShareInvitationAddParticipantController *)v9 infoLabel];
    [v28 setNumberOfLines:0];

    v29 = [(_UIShareInvitationAddParticipantController *)v9 infoLabel];
    [v10 addSubview:v29];

    id v30 = [objc_alloc((Class)UITableViewController) initWithStyle:0];
    [(_UIShareInvitationAddParticipantController *)v9 setSearchResultTableViewController:v30];

    v31 = [(_UIShareInvitationAddParticipantController *)v9 searchResultTableViewController];
    [(_UIShareInvitationAddParticipantController *)v9 addChildViewController:v31];

    v32 = [(_UIShareInvitationAddParticipantController *)v9 searchResultTableViewController];
    v33 = [v32 tableView];

    [(_UIShareInvitationAddParticipantController *)v9 setSearchResultTable:v33];
    v34 = [(_UIShareInvitationAddParticipantController *)v9 searchResultTableViewController];
    [v34 didMoveToParentViewController:v9];

    [v33 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v33 setAlpha:0.0];
    [v33 setDelegate:v9];
    [v33 setDataSource:v9];
    [v33 registerClass:objc_opt_class() forCellReuseIdentifier:@"_UIShareInvitationParticipantTableViewCellIdentifier"];
    [v10 addSubview:v33];
    v35 = [v13 heightAnchor];
    v36 = [v35 constraintEqualToConstant:49.5];
    [(_UIShareInvitationAddParticipantController *)v9 setAddressHeightConstraint:v36];

    v37 = objc_opt_new();
    v38 = [(_UIShareInvitationAddParticipantController *)v9 view];
    [v38 addLayoutGuide:v37];

    v110 = v10;
    v39 = [v10 safeAreaLayoutGuide];
    v104 = [v13 topAnchor];
    v103 = [v39 topAnchor];
    v102 = [v104 constraintEqualToAnchor:v103];
    v121[0] = v102;
    v101 = [v13 bottomAnchor];
    v100 = [v33 topAnchor];
    v99 = [v101 constraintEqualToAnchor:v100];
    v121[1] = v99;
    v98 = [v13 leadingAnchor];
    v97 = [v39 leadingAnchor];
    v96 = [v98 constraintEqualToAnchor:v97];
    v121[2] = v96;
    v95 = [v13 trailingAnchor];
    v94 = [v39 trailingAnchor];
    v93 = [v95 constraintEqualToAnchor:v94];
    v121[3] = v93;
    v92 = [v33 bottomAnchor];
    v91 = [v39 bottomAnchor];
    v90 = [v92 constraintEqualToAnchor:v91];
    v121[4] = v90;
    v89 = [(_UIShareInvitationAddParticipantController *)v9 addressHeightConstraint];
    v121[5] = v89;
    v88 = [v33 leadingAnchor];
    v87 = [v39 leadingAnchor];
    v86 = [v88 constraintEqualToAnchor:v87];
    v121[6] = v86;
    v108 = v33;
    v85 = [v33 trailingAnchor];
    v84 = [v39 trailingAnchor];
    v83 = [v85 constraintEqualToAnchor:v84];
    v121[7] = v83;
    v82 = [(UILabel *)v9->_infoLabel widthAnchor];
    v81 = [v39 widthAnchor];
    v80 = [v82 constraintEqualToAnchor:v81 multiplier:1.0 constant:-64.0];
    v121[8] = v80;
    v79 = [(UILabel *)v9->_infoLabel centerXAnchor];
    v78 = [v39 centerXAnchor];
    v77 = [v79 constraintEqualToAnchor:v78];
    v121[9] = v77;
    v76 = [v37 topAnchor];
    v109 = v13;
    v75 = [v13 bottomAnchor];
    v74 = [v76 constraintEqualToAnchor:v75];
    v121[10] = v74;
    v73 = [v37 heightAnchor];
    v106 = v39;
    v40 = [v39 heightAnchor];
    v41 = [v73 constraintEqualToAnchor:v40 multiplier:0.340000004];
    v121[11] = v41;
    v42 = [(UILabel *)v9->_infoLabel topAnchor];
    v43 = [v37 bottomAnchor];
    v44 = [v42 constraintEqualToAnchor:v43];
    v121[12] = v44;
    v45 = [(UILabel *)v9->_infoLabel topAnchor];
    v107 = v37;
    v46 = [v37 centerYAnchor];
    v47 = [v45 constraintEqualToAnchor:v46];
    v121[13] = v47;
    v48 = +[NSArray arrayWithObjects:v121 count:14];
    +[NSLayoutConstraint activateConstraints:v48];

    if ((_UIBarsApplyChromelessEverywhere() & 1) == 0) {
      [(_UIShareInvitationAddParticipantController *)v9 setEdgesForExtendedLayout:0];
    }
    v49 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    v50 = [v49 localizedStringForKey:@"GIVE_ACCESS_TITLE" value:@"Add People" table:@"Localizable"];
    [(_UIShareInvitationAddParticipantController *)v9 setTitle:v50];

    id v51 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:v9 action:"cancelAction:"];
    id v52 = objc_alloc((Class)UIBarButtonItem);
    v53 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    v54 = [v53 localizedStringForKey:@"Continue" value:@"Continue" table:@"Localizable"];
    id v55 = [v52 initWithTitle:v54 style:2 target:v9 action:"continueAction:"];

    v105 = v51;
    id v120 = v51;
    v56 = +[NSArray arrayWithObjects:&v120 count:1];
    v57 = [(_UIShareInvitationAddParticipantController *)v9 navigationItem];
    [v57 setLeftBarButtonItems:v56];

    id v119 = v55;
    v58 = +[NSArray arrayWithObjects:&v119 count:1];
    v59 = [(_UIShareInvitationAddParticipantController *)v9 navigationItem];
    [v59 setRightBarButtonItems:v58];

    [(_UIShareInvitationAddParticipantController *)v9 _updateSendButton];
    v60 = +[NSMutableArray array];
    long long v113 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    long long v116 = 0u;
    v61 = [v112 participants];
    id v62 = [v61 countByEnumeratingWithState:&v113 objects:v118 count:16];
    if (v62)
    {
      id v63 = v62;
      uint64_t v64 = *(void *)v114;
      do
      {
        v65 = 0;
        do
        {
          if (*(void *)v114 != v64) {
            objc_enumerationMutation(v61);
          }
          v66 = [*(id *)(*((void *)&v113 + 1) + 8 * (void)v65) userIdentity];
          v67 = [v66 lookupInfo];
          v68 = [v67 emailAddress];

          if (v68) {
            [v60 addObject:v68];
          }

          v65 = (char *)v65 + 1;
        }
        while (v63 != v65);
        id v63 = [v61 countByEnumeratingWithState:&v113 objects:v118 count:16];
      }
      while (v63);
    }

    [(_UIShareInvitationAddParticipantController *)v9 setCurrentParticipants:v60];
    [(_UIShareInvitationAddParticipantController *)v9 updateOtherRecipients];
    v69 = +[UIColor systemBackgroundColor];
    v70 = [(_UIShareInvitationAddParticipantController *)v9 view];
    [v70 setBackgroundColor:v69];

    id v71 = [objc_alloc((Class)CNMonogrammer) initWithStyle:0 diameter:40.0];
    [(_UIShareInvitationAddParticipantController *)v9 setMonogrammer:v71];

    [v109 becomeFirstResponder];
    id v7 = v111;
    id v6 = v112;
  }

  return v9;
}

- (_UIShareInvitationAddParticipantController)initWithNibName:(id)a3 bundle:(id)a4
{
  return [(_UIShareInvitationAddParticipantController *)self initWithShare:0 uti:0];
}

- (_UIShareInvitationAddParticipantController)initWithCoder:(id)a3
{
  return [(_UIShareInvitationAddParticipantController *)self initWithShare:0 uti:0];
}

- (void)dealloc
{
  [(MFComposeRecipientTextView *)self->_addressView setDelegate:0];
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
  id v7 = [v12 recipients];
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
      v4 = [(_UIShareInvitationAddParticipantController *)self addressView];
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

  v4 = [(_UIShareInvitationAddParticipantController *)self addressView];
  [v4 finishEnteringRecipient];

  v5 = [(_UIShareInvitationAddParticipantController *)self addressView];
  id v6 = [v5 uncommentedAddresses];

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
  v4 = [(_UIShareInvitationAddParticipantController *)self completion];
  ((void (**)(void, void, id))v4)[2](v4, 0, v5);
}

- (void)viewDidLayoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)_UIShareInvitationAddParticipantController;
  [(_UIShareInvitationAddParticipantController *)&v16 viewDidLayoutSubviews];
  v17[0] = NSForegroundColorAttributeName;
  objc_super v3 = +[UIColor secondaryLabelColor];
  v18[0] = v3;
  v17[1] = NSFontAttributeName;
  v4 = [(_UIShareInvitationAddParticipantController *)self addressView];
  id v5 = [v4 textView];
  id v6 = [v5 font];
  v18[1] = v6;
  id v7 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];

  id v8 = objc_alloc((Class)NSAttributedString);
  int v9 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  v10 = [v9 localizedStringForKey:@"GIVE_ACCESS_PLACEHOLDER" value:@"Email addresses or phone numbers" table:@"Localizable"];
  id v11 = [(_UIShareInvitationAddParticipantController *)self addressView];
  id v12 = _UIAdaptLocalizedStringForView();
  id v13 = [v8 initWithString:v12 attributes:v7];

  v14 = [(_UIShareInvitationAddParticipantController *)self addressView];
  v15 = [v14 textView];
  [v15 setAttributedPlaceholder:v13];
}

- (void)composeRecipientView:(id)a3 didChangeSize:(CGSize)a4
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
  id v6 = objc_msgSend(v5, "textView", 0);
  id v7 = [v6 textStorage];
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
  v4 = +[NSMutableArray arrayWithArray:v3];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(_UIShareInvitationAddParticipantController *)self addressView];
  id v6 = [v5 recipients];

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
      id v6 = objc_alloc((Class)MFComposeRecipient);
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
          sub_10002DD98();
        }
      }
      id v6 = objc_alloc((Class)MFComposeRecipient);
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
  v10[0] = CNContactEmailAddressesKey;
  v10[1] = CNContactPhoneNumbersKey;
  id v5 = +[NSArray arrayWithObjects:v10 count:2];
  [v4 setDisplayedPropertyKeys:v5];

  [v4 setDelegate:self];
  id v6 = [(_UIShareInvitationAddParticipantController *)self parentViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    [v4 setModalPresentationStyle:6];
  }
  id v8 = +[NSPredicate predicateWithFormat:@"(emailAddresses.@count == 1 AND phoneNumbers.@count == 0) OR (emailAddresses.@count == 0 AND phoneNumbers.@count == 1)"];
  [v4 setPredicateForSelectionOfContact:v8];

  uint64_t v9 = +[NSPredicate predicateWithFormat:@"emailAddresses.@count > 0 OR phoneNumbers.@count > 0"];
  [v4 setPredicateForEnablingContact:v9];

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
  v3[2] = sub_10000EE90;
  v3[3] = &unk_10004C918;
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
    id v9 = objc_alloc((Class)MFComposeRecipient);
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
    id v17 = objc_alloc((Class)MFComposeRecipient);
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
  v20[2] = sub_10000F188;
  v20[3] = &unk_10004C918;
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
      id v17 = objc_alloc((Class)MFComposeRecipient);
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
        sub_10002DE00();
      }
    }

    goto LABEL_13;
  }
  uint64_t v9 = [(id)objc_opt_class() contactForMailAddress:v8];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = [(_UIShareInvitationAddParticipantController *)self addressView];
    id v12 = [objc_alloc((Class)MFComposeRecipient) initWithContact:v10 address:v8 kind:0];
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
    sub_10002DE00();
  }
LABEL_14:

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10000F4EC;
  v22[3] = &unk_10004C918;
  v22[4] = self;
  [(_UIShareInvitationAddParticipantController *)self dismissViewControllerAnimated:1 completion:v22];
}

+ (id)contactStore
{
  if (qword_100061C88 != -1) {
    dispatch_once(&qword_100061C88, &stru_10004CC80);
  }
  v2 = (void *)qword_100061C80;

  return v2;
}

+ (id)contactForMailAddress:(id)a3
{
  id v4 = a3;
  id v5 = [a1 contactStore];
  id v6 = sub_10000F660(v5, v4, 0, 1, 0);

  return v6;
}

+ (id)contactForPhoneNumber:(id)a3
{
  id v4 = a3;
  id v5 = [a1 contactStore];
  id v6 = sub_10000F660(v5, 0, v4, 0, 1);

  return v6;
}

+ (id)contactForMailAddressOrPhoneNumber:(id)a3
{
  id v4 = a3;
  id v5 = [a1 contactStore];
  id v6 = sub_10000F660(v5, v4, 0, 1, 1);

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
  block[2] = sub_10000FB1C;
  block[3] = &unk_10004CCE8;
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
  v8[2] = sub_10000FBEC;
  v8[3] = &unk_10004C918;
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
    sub_10002DE68();
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
  id v30 = [v38 detailTextLabel];
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

- (MFComposeRecipientTextView)addressView
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