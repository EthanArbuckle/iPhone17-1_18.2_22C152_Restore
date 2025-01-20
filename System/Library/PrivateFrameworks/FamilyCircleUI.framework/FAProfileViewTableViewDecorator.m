@interface FAProfileViewTableViewDecorator
+ (BOOL)_shouldShowInSection:(id)a3;
+ (BOOL)shouldShowInPage:(id)a3;
- (FAProfileViewTableViewDecorator)initWithTableView:(id)a3 ruiTableView:(id)a4 forPerson:(id)a5 pictureStore:(id)a6;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_getOrCreateProfileViewForCell:(id)a3;
- (id)_keyForCell:(id)a3;
- (id)_profileViewForCell:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (void)_addProfileViewToCell:(id)a3;
- (void)_removeProfileViewFromCell:(id)a3;
@end

@implementation FAProfileViewTableViewDecorator

- (FAProfileViewTableViewDecorator)initWithTableView:(id)a3 ruiTableView:(id)a4 forPerson:(id)a5 pictureStore:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)FAProfileViewTableViewDecorator;
  v14 = [(FATableViewDecorator *)&v19 initWithTableView:a3];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_pictureStore, a6);
    objc_storeStrong((id *)&v15->_familyMember, a5);
    objc_storeStrong((id *)&v15->_remoteTableViewController, a4);
    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    profileViewForCells = v15->_profileViewForCells;
    v15->_profileViewForCells = v16;
  }
  return v15;
}

+ (BOOL)shouldShowInPage:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 hasTableView])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v5 = objc_msgSend(v4, "tableViewOM", 0);
    v6 = [v5 sections];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          if ([a1 _shouldShowInSection:*(void *)(*((void *)&v13 + 1) + 8 * i)])
          {
            BOOL v11 = 1;
            goto LABEL_13;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    BOOL v11 = 0;
LABEL_13:
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

+ (BOOL)_shouldShowInSection:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v3 = objc_msgSend(a3, "rows", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [*(id *)(*((void *)&v13 + 1) + 8 * i) attributes];
        uint64_t v9 = [v8 objectForKeyedSubscript:@"familyAction"];
        char v10 = [v9 isEqual:@"InjectProfileView"];

        if (v10)
        {
          BOOL v11 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_11:

  return v11;
}

- (id)_keyForCell:(id)a3
{
  return (id)[NSNumber numberWithUnsignedLong:a3];
}

- (id)_profileViewForCell:(id)a3
{
  uint64_t v4 = [(FAProfileViewTableViewDecorator *)self _keyForCell:a3];
  uint64_t v5 = [(NSMutableDictionary *)self->_profileViewForCells objectForKeyedSubscript:v4];

  return v5;
}

- (id)_getOrCreateProfileViewForCell:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FAProfileViewTableViewDecorator *)self _profileViewForCell:v4];

  if (v5)
  {
    uint64_t v6 = [(FAProfileViewTableViewDecorator *)self _profileViewForCell:v4];
    goto LABEL_18;
  }
  uint64_t v7 = (void *)MEMORY[0x263F827E8];
  uint64_t v8 = [(FAProfilePictureStore *)self->_pictureStore profilePictureForFamilyMember:self->_familyMember pictureDiameter:60.0];
  uint64_t v9 = [MEMORY[0x263F82B60] mainScreen];
  [v9 scale];
  char v10 = objc_msgSend(v7, "imageWithData:scale:", v8);

  BOOL v11 = [(FAFamilyMember *)self->_familyMember fullName];
  id v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    long long v14 = [(FAFamilyMember *)self->_familyMember appleID];

    familyMember = self->_familyMember;
    if (v14) {
      [(FAFamilyMember *)familyMember appleID];
    }
    else {
    id v13 = [(FAFamilyMember *)familyMember inviteEmail];
    }
  }
  long long v16 = v13;
  v17 = objc_msgSend(MEMORY[0x263F08790], "fa_standardFormatter");
  [v17 setFormattingContext:5];
  uint64_t v18 = [(FAFamilyMember *)self->_familyMember joinedDate];

  objc_super v19 = self->_familyMember;
  if (v18)
  {
    v20 = [(FAFamilyMember *)v19 joinedDate];
    v21 = [v17 stringFromDate:v20];

    v22 = [(FAFamilyMember *)self->_familyMember joinedDate];
    int v23 = [v22 isDateRelative];

    v24 = NSString;
    v25 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v26 = v25;
    v27 = @"JOINED_DATE_ABSOLUTE";
    v28 = @"JOINED_DATE_RELATIVE";
LABEL_13:
    if (v23) {
      v32 = v28;
    }
    else {
      v32 = v27;
    }
    v33 = [v25 localizedStringForKey:v32 value:&stru_26CA2C800 table:@"Localizable"];
    v34 = objc_msgSend(v24, "stringWithFormat:", v33, v21);

    goto LABEL_17;
  }
  v29 = [(FAFamilyMember *)v19 invitationDate];

  if (v29)
  {
    v30 = [(FAFamilyMember *)self->_familyMember invitationDate];
    v21 = [v17 stringFromDate:v30];

    v31 = [(FAFamilyMember *)self->_familyMember invitationDate];
    int v23 = [v31 isDateRelative];

    v24 = NSString;
    v25 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v26 = v25;
    v27 = @"INVITED_DATE_ABSOLUTE";
    v28 = @"INVITED_DATE_RELATIVE";
    goto LABEL_13;
  }
  v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v34 = [v21 localizedStringForKey:@"INVITED" value:&stru_26CA2C800 table:@"Localizable"];
LABEL_17:

  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263F25D10]) initWithName:v16 email:v34 image:v10];
  v35 = [(FAProfileViewTableViewDecorator *)self _keyForCell:v4];
  [(NSMutableDictionary *)self->_profileViewForCells setObject:v6 forKeyedSubscript:v35];

LABEL_18:
  return v6;
}

- (void)_addProfileViewToCell:(id)a3
{
  v27[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(FAProfileViewTableViewDecorator *)self _profileViewForCell:v4];
  uint64_t v6 = _FALogSystem();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v7) {
      -[FAProfileViewTableViewDecorator _addProfileViewToCell:](v6);
    }
  }
  else
  {
    if (v7) {
      -[FAProfileViewTableViewDecorator _addProfileViewToCell:](v6);
    }

    uint64_t v6 = [(FAProfileViewTableViewDecorator *)self _getOrCreateProfileViewForCell:v4];
    uint64_t v8 = [v4 contentView];
    [v8 addSubview:v6];

    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    objc_super v19 = (void *)MEMORY[0x263F08938];
    v26 = [v4 contentView];
    v25 = [v26 topAnchor];
    v24 = [v6 topAnchor];
    int v23 = [v25 constraintEqualToAnchor:v24];
    v27[0] = v23;
    v22 = [v4 contentView];
    v21 = [v22 leftAnchor];
    v20 = [v6 leftAnchor];
    uint64_t v18 = [v21 constraintEqualToAnchor:v20];
    v27[1] = v18;
    v17 = [v4 contentView];
    long long v16 = [v17 rightAnchor];
    uint64_t v9 = [v6 rightAnchor];
    char v10 = [v16 constraintEqualToAnchor:v9];
    v27[2] = v10;
    BOOL v11 = [v4 contentView];
    id v12 = [v11 bottomAnchor];
    id v13 = [v6 bottomAnchor];
    long long v14 = [v12 constraintEqualToAnchor:v13];
    v27[3] = v14;
    long long v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:4];
    [v19 activateConstraints:v15];
  }
}

- (void)_removeProfileViewFromCell:(id)a3
{
  id v4 = a3;
  id v6 = [(FAProfileViewTableViewDecorator *)self _profileViewForCell:v4];
  uint64_t v5 = [(FAProfileViewTableViewDecorator *)self _keyForCell:v4];

  [v6 removeFromSuperview];
  [(NSMutableDictionary *)self->_profileViewForCells setObject:0 forKeyedSubscript:v5];
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  BOOL v7 = [(FATableViewDecorator *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    uint64_t v9 = [(FATableViewDecorator *)self delegate];
    char v10 = [v9 tableView:v6 viewForHeaderInSection:a4];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  BOOL v7 = [(FATableViewDecorator *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    uint64_t v9 = [(FATableViewDecorator *)self delegate];
    [v9 tableView:v6 heightForHeaderInSection:a4];
    double v11 = v10;
  }
  else
  {
    [v6 rowHeight];
    double v11 = v12;
  }

  return v11;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  BOOL v7 = v6;
  if (a4 || [v6 numberOfRowsInSection:0])
  {
    char v8 = [(FATableViewDecorator *)self delegate];
    char v9 = objc_opt_respondsToSelector();

    double v10 = 0.0;
    if (v9)
    {
      double v11 = [(FATableViewDecorator *)self delegate];
      [v11 tableView:v7 heightForFooterInSection:a4];
      double v10 = v12;
    }
  }
  else
  {
    long long v14 = [(FAProfileViewTableViewDecorator *)self tableView:v7 titleForFooterInSection:0];

    if (v14)
    {
      double v10 = *MEMORY[0x263F839B8];
    }
    else
    {
      UIRoundToViewScale();
      double v10 = v15;
    }
  }

  return v10;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  char v8 = [(FATableViewDecorator *)self dataSource];
  char v9 = [v8 tableView:v7 cellForRowAtIndexPath:v6];

  double v10 = [(RUITableView *)self->_remoteTableViewController objectModelRowForIndexPath:v6];

  double v11 = [v10 attributes];
  double v12 = [v11 objectForKeyedSubscript:@"familyAction"];

  if ([v12 isEqualToString:@"InjectProfileView"]) {
    [(FAProfileViewTableViewDecorator *)self _addProfileViewToCell:v9];
  }
  else {
    [(FAProfileViewTableViewDecorator *)self _removeProfileViewFromCell:v9];
  }

  return v9;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [(RUITableView *)self->_remoteTableViewController objectModelRowForIndexPath:v7];
  char v9 = [v8 attributes];
  double v10 = [v9 objectForKeyedSubscript:@"familyAction"];

  if ([v10 isEqualToString:@"InjectProfileView"])
  {
    [MEMORY[0x263F25D10] desiredHeight];
LABEL_6:
    double v16 = v11;
    goto LABEL_7;
  }
  double v12 = [(FATableViewDecorator *)self delegate];
  char v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) == 0)
  {
    [v6 rowHeight];
    goto LABEL_6;
  }
  long long v14 = [(FATableViewDecorator *)self delegate];
  [v14 tableView:v6 heightForRowAtIndexPath:v7];
  double v16 = v15;

LABEL_7:
  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileViewForCells, 0);
  objc_storeStrong((id *)&self->_pictureStore, 0);
  objc_storeStrong((id *)&self->_familyMember, 0);
  objc_storeStrong((id *)&self->_remoteTableViewController, 0);
}

- (void)_addProfileViewToCell:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2189F0000, log, OS_LOG_TYPE_DEBUG, "Add new profile summary view.", v1, 2u);
}

- (void)_addProfileViewToCell:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2189F0000, log, OS_LOG_TYPE_DEBUG, "Profile summary view already exist in view hierarchy.", v1, 2u);
}

@end