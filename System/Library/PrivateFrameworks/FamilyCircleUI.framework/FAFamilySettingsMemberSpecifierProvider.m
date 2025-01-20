@interface FAFamilySettingsMemberSpecifierProvider
- (BOOL)_launchWithResourceDictionary:(id)a3;
- (BOOL)handleURL:(id)a3;
- (FAFamilyMemberCardTapHandler)memberCardTapHandler;
- (FAFamilySettingsMemberSpecifierProvider)initWithAppleAccount:(id)a3 familyCircle:(id)a4 familyPictureStore:(id)a5;
- (FAFamilySettingsMemberSpecifierProviderDelegeate)delegate;
- (NSArray)specifiers;
- (id)_createSpecifierForFamilyMemberCell:(id)a3;
- (id)_createSpecifierForPendingMember:(id)a3;
- (id)_specifierWithID:(id)a3;
- (void)_addFamilyMemberButtonWasTapped:(id)a3;
- (void)_delayedLoadIfNeeded;
- (void)_familyMemberCellWasTapped:(id)a3;
- (void)_pendingFamilyMemberCellWasTapped:(id)a3;
- (void)reloadSpecifiers;
- (void)setDelegate:(id)a3;
- (void)setFamilyCircle:(id)a3;
- (void)setMemberCardTapHandler:(id)a3;
- (void)setSpecifiers:(id)a3;
@end

@implementation FAFamilySettingsMemberSpecifierProvider

- (FAFamilySettingsMemberSpecifierProvider)initWithAppleAccount:(id)a3 familyCircle:(id)a4 familyPictureStore:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)FAFamilySettingsMemberSpecifierProvider;
  v10 = [(FAFamilySettingsMemberSpecifierProvider *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_familyCircle, a4);
    objc_storeStrong((id *)&v11->_familyPictureStore, a5);
  }

  return v11;
}

- (void)setFamilyCircle:(id)a3
{
  objc_storeStrong((id *)&self->_familyCircle, a3);
  id v6 = a3;
  specifiers = self->_specifiers;
  self->_specifiers = 0;
}

- (BOOL)handleURL:(id)a3
{
  id v5 = a3;
  BOOL v6 = [(FAFamilySettingsMemberSpecifierProvider *)self _launchWithResourceDictionary:v5];
  if (!v6)
  {
    v7 = _FALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_2189F0000, v7, OS_LOG_TYPE_DEFAULT, "FAFamilySettingsMemberSpecifierProvider doesn't have the specifier, will try again upon response.", v9, 2u);
    }

    objc_storeStrong((id *)&self->_cachedResourceDictionary, a3);
  }

  return v6;
}

- (BOOL)_launchWithResourceDictionary:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v4 = [a3 objectForKeyedSubscript:*MEMORY[0x263F3BE30]];
  if (!v4)
  {
LABEL_8:
    BOOL v9 = 0;
    goto LABEL_9;
  }
  id v5 = [(FAFamilySettingsMemberSpecifierProvider *)self _specifierWithID:v4];
  BOOL v6 = v5;
  if (!v5
    || ([v5 identifier],
        v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 isEqualToString:@"AddMember"],
        v7,
        !v8))
  {
    v10 = _FALogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      specifiers = self->_specifiers;
      int v13 = 138412546;
      v14 = v4;
      __int16 v15 = 2112;
      v16 = specifiers;
      _os_log_impl(&dword_2189F0000, v10, OS_LOG_TYPE_DEFAULT, "A specifier for \"%@\" was not found in: %@", (uint8_t *)&v13, 0x16u);
    }

    goto LABEL_8;
  }
  [(FAFamilySettingsMemberSpecifierProvider *)self _addFamilyMemberButtonWasTapped:v6];

  BOOL v9 = 1;
LABEL_9:

  return v9;
}

- (void)_delayedLoadIfNeeded
{
  if (self->_cachedResourceDictionary)
  {
    v3 = _FALogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_2189F0000, v3, OS_LOG_TYPE_DEFAULT, "We have a cached resource dictionary, let's try launching.", v5, 2u);
    }

    [(FAFamilySettingsMemberSpecifierProvider *)self _launchWithResourceDictionary:self->_cachedResourceDictionary];
    cachedResourceDictionary = self->_cachedResourceDictionary;
    self->_cachedResourceDictionary = 0;
  }
}

- (NSArray)specifiers
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (([(FAFamilyCircle *)self->_familyCircle canAddMembers] & 1) == 0
    && [(FAFamilyCircle *)self->_familyCircle showAddMemberButton])
  {
    v4 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"FamilyMembers"];
    id v5 = [(FAFamilyCircle *)self->_familyCircle familyMembersFooterLabel];
    [v4 setProperty:v5 forKey:*MEMORY[0x263F600F8]];

    [v3 addObject:v4];
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  BOOL v6 = [(FAFamilyCircle *)self->_familyCircle members];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v38 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [(FAFamilySettingsMemberSpecifierProvider *)self _createSpecifierForFamilyMemberCell:*(void *)(*((void *)&v37 + 1) + 8 * i)];
        if (v11) {
          [v3 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v8);
  }

  v12 = [(FAFamilyCircle *)self->_familyCircle pendingMembers];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v34 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = [(FAFamilySettingsMemberSpecifierProvider *)self _createSpecifierForPendingMember:*(void *)(*((void *)&v33 + 1) + 8 * j)];
        if (v17) {
          [v3 addObject:v17];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v14);
  }
  if ([(FAFamilyCircle *)self->_familyCircle showAddMemberButton])
  {
    v18 = [(FAFamilyCircle *)self->_familyCircle addMemberButtonLabel];
    v19 = v18;
    if (v18)
    {
      id v20 = v18;
    }
    else
    {
      v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v20 = [v21 localizedStringForKey:@"ADD_FAMILY_MEMBER_BUTTON" value:&stru_26CA2C800 table:@"Localizable"];
    }
    v22 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v20 target:self set:0 get:0 detail:0 cell:13 edit:0];
    addFamilyMemberCell = self->_addFamilyMemberCell;
    self->_addFamilyMemberCell = v22;

    [(PSSpecifier *)self->_addFamilyMemberCell setIdentifier:@"AddMember"];
    [(PSSpecifier *)self->_addFamilyMemberCell setButtonAction:sel__addFamilyMemberButtonWasTapped_];
    v24 = self->_addFamilyMemberCell;
    v25 = objc_msgSend(NSNumber, "numberWithBool:", -[FAFamilyCircle canAddMembers](self->_familyCircle, "canAddMembers"));
    [(PSSpecifier *)v24 setProperty:v25 forKey:*MEMORY[0x263F600A8]];

    v26 = [MEMORY[0x263F827E8] systemImageNamed:@"plus"];
    if ([(FAFamilyCircle *)self->_familyCircle canAddMembers])
    {
      [(PSSpecifier *)self->_addFamilyMemberCell setProperty:v26 forKey:*MEMORY[0x263F60140]];
    }
    else
    {
      v27 = [MEMORY[0x263F825C8] systemDarkGrayColor];
      v28 = [v26 imageWithTintColor:v27 renderingMode:1];

      [(PSSpecifier *)self->_addFamilyMemberCell setProperty:v28 forKey:*MEMORY[0x263F60140]];
    }
    [v3 addObject:self->_addFamilyMemberCell];
  }
  v29 = (NSArray *)[v3 copy];
  specifiers = self->_specifiers;
  self->_specifiers = v29;

  [(FAFamilySettingsMemberSpecifierProvider *)self _delayedLoadIfNeeded];
  v31 = self->_specifiers;

  return v31;
}

- (id)_createSpecifierForFamilyMemberCell:(id)a3
{
  id v4 = a3;
  id v5 = [v4 fullName];
  if ([v4 isMe])
  {
    BOOL v6 = NSString;
    uint64_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v8 = [v7 localizedStringForKey:@"FAMILY_MEMBER_ME_MARKER_FORMAT" value:&stru_26CA2C800 table:@"Localizable"];
    uint64_t v9 = objc_msgSend(v6, "stringWithFormat:", v8, v5);

    id v5 = (void *)v9;
  }
  v10 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:0 cell:2 edit:0];
  v11 = [v4 appleID];
  [v10 setIdentifier:v11];

  if (([v4 hasLinkediTunesAccount] & 1) != 0 || !objc_msgSend(v4, "isMe"))
  {
    v18 = [v4 memberTypeDisplayString];

    if (!v18) {
      goto LABEL_11;
    }
    v12 = [v4 memberTypeDisplayString];
    uint64_t v15 = *MEMORY[0x263F602C8];
    uint64_t v17 = v10;
    v16 = v12;
  }
  else
  {
    v12 = [v4 iTunesNotLinkedMessage];
    if (![v12 length])
    {
      uint64_t v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v14 = [v13 localizedStringForKey:@"NOT_SHARING_PURCHASES" value:&stru_26CA2C800 table:@"Localizable"];

      v12 = (void *)v14;
    }
    [v10 setProperty:v12 forKey:*MEMORY[0x263F602C8]];
    uint64_t v15 = *MEMORY[0x263F25C38];
    v16 = (void *)MEMORY[0x263EFFA88];
    uint64_t v17 = v10;
  }
  [v17 setProperty:v16 forKey:v15];

LABEL_11:
  v19 = [v4 dsid];

  if (v19) {
    [v10 setProperty:v4 forKey:@"FAFamilySettingsMemberSpecifierMemberKey"];
  }
  id v20 = [(FAProfilePictureStore *)self->_familyPictureStore profilePictureForFamilyMember:v4 pictureDiameter:40.0];
  if (v20)
  {
    v21 = (void *)MEMORY[0x263F827E8];
    v22 = [MEMORY[0x263F82B60] mainScreen];
    [v22 scale];
    v23 = objc_msgSend(v21, "imageWithData:scale:", v20);

    [v10 setProperty:v23 forKey:*MEMORY[0x263F60140]];
  }
  [v10 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v25 = [WeakRetained preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v25);
  v27 = NSNumber;
  if (IsAccessibilityCategory) {
    double v28 = *MEMORY[0x263F839B8];
  }
  else {
    PSRoundToPixel();
  }
  v29 = [v27 numberWithDouble:v28];
  [v10 setProperty:v29 forKey:*MEMORY[0x263F602A8]];

  [v10 setProperty:&unk_26CA52608 forKey:*MEMORY[0x263F25C30]];
  [v10 setControllerLoadAction:sel__familyMemberCellWasTapped_];

  return v10;
}

- (id)_createSpecifierForPendingMember:(id)a3
{
  id v4 = a3;
  id v5 = [v4 fullName];
  uint64_t v6 = [v4 inviteEmail];
  uint64_t v7 = (void *)v6;
  if (v5) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = (void *)v6;
  }
  id v9 = v8;
  v10 = [v4 invitationDate];

  if (v10)
  {
    v11 = objc_msgSend(MEMORY[0x263F08790], "fa_standardFormatter");
    [v11 setFormattingContext:5];
    v12 = [v4 invitationDate];
    uint64_t v13 = [v11 stringFromDate:v12];

    uint64_t v14 = [v4 invitationDate];
    int v15 = [v14 isDateRelative];

    v16 = NSString;
    uint64_t v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v18 = v17;
    if (v15) {
      v19 = @"INVITED_DATE_RELATIVE";
    }
    else {
      v19 = @"INVITED_DATE_ABSOLUTE";
    }
    id v20 = [v17 localizedStringForKey:v19 value:&stru_26CA2C800 table:@"Localizable"];
    v21 = objc_msgSend(v16, "stringWithFormat:", v20, v13);
  }
  else
  {
    v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v21 = [v11 localizedStringForKey:@"INVITED" value:&stru_26CA2C800 table:@"Localizable"];
  }

  v22 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v9 target:self set:0 get:0 detail:0 cell:2 edit:0];
  [v22 setIdentifier:v7];

  [v22 setProperty:v21 forKey:*MEMORY[0x263F602C8]];
  [v22 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v24 = [WeakRetained preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v24);
  v26 = NSNumber;
  if (IsAccessibilityCategory) {
    double v27 = *MEMORY[0x263F839B8];
  }
  else {
    PSRoundToPixel();
  }
  double v28 = [v26 numberWithDouble:v27];
  [v22 setProperty:v28 forKey:*MEMORY[0x263F602A8]];

  v29 = [MEMORY[0x263F825C8] secondaryLabelColor];
  [v22 setProperty:v29 forKey:*MEMORY[0x263F25C40]];

  [v22 setProperty:&unk_26CA52608 forKey:*MEMORY[0x263F25C30]];
  [v22 setControllerLoadAction:sel__pendingFamilyMemberCellWasTapped_];
  v30 = [(FAProfilePictureStore *)self->_familyPictureStore profilePictureForFamilyMember:v4 pictureDiameter:40.0];
  if (v30)
  {
    v31 = (void *)MEMORY[0x263F827E8];
    v32 = [MEMORY[0x263F82B60] mainScreen];
    [v32 scale];
    long long v33 = objc_msgSend(v31, "imageWithData:scale:", v30);

    [v22 setProperty:v33 forKey:*MEMORY[0x263F60140]];
  }
  [v22 setProperty:v4 forKey:@"FAFamilySettingsMemberSpecifierMemberKey"];

  return v22;
}

- (void)_addFamilyMemberButtonWasTapped:(id)a3
{
  p_delegate = &self->_delegate;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained addFamilyMemberButtonWasTapped:v4];
}

- (void)_familyMemberCellWasTapped:(id)a3
{
  p_delegate = &self->_delegate;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained familyMemberCellWasTapped:v4];
}

- (void)_pendingFamilyMemberCellWasTapped:(id)a3
{
  p_delegate = &self->_delegate;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained pendingFamilyMemberCellWasTapped:v4];
}

- (id)_specifierWithID:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = self->_specifiers;
  id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "identifier", (void)v13);
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)reloadSpecifiers
{
  specifiers = self->_specifiers;
  self->_specifiers = 0;
}

- (FAFamilySettingsMemberSpecifierProviderDelegeate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (FAFamilySettingsMemberSpecifierProviderDelegeate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (FAFamilyMemberCardTapHandler)memberCardTapHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_memberCardTapHandler);
  return (FAFamilyMemberCardTapHandler *)WeakRetained;
}

- (void)setMemberCardTapHandler:(id)a3
{
}

- (void)setSpecifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_memberCardTapHandler);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cachedResourceDictionary, 0);
  objc_storeStrong((id *)&self->_addFamilyMemberCell, 0);
  objc_storeStrong((id *)&self->_familyPictureStore, 0);
  objc_storeStrong((id *)&self->_familyCircle, 0);
}

@end