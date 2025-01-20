@interface EKCalendarShareesEditItem
- (BOOL)configureWithCalendar:(id)a3;
- (BOOL)saveStateToCalendar:(id)a3;
- (BOOL)shouldSuggestFamilySharees;
- (EKSharee)meSharee;
- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4;
- (id)_colorForShareeStatus:(unint64_t)a3;
- (id)_filteredSharees:(id)a3 byRemovingDuplicatesFoundIn:(id)a4;
- (id)_iconForSharee:(id)a3;
- (id)_shareeCellForName:(id)a3 detailText:(id)a4 icon:(id)a5 iconColor:(id)a6;
- (id)_stringForShareeAccessLevel:(unint64_t)a3;
- (id)addPersonCell;
- (id)cellForSubitemAtIndex:(unint64_t)a3;
- (id)eventStoreForShareePickerViewController:(id)a3;
- (id)headerTitle;
- (id)orderedSharees;
- (unint64_t)numberOfSubitems;
- (void)_dismissShareePicker;
- (void)_popBackToCalendarEditorChangesMade:(BOOL)a3 changesSaved:(BOOL)a4;
- (void)addSharee:(id)a3;
- (void)calendarEditor:(id)a3 didSelectSubitem:(unint64_t)a4;
- (void)reloadData;
- (void)removeSharee:(id)a3;
- (void)reset;
- (void)setCalendar:(id)a3 store:(id)a4;
- (void)setMeSharee:(id)a3;
- (void)setShouldSuggestFamilySharees:(BOOL)a3;
- (void)shareePickerViewController:(id)a3 didCompleteWithAction:(int)a4;
- (void)shareeViewController:(id)a3 didCompleteWithAction:(int)a4;
- (void)shareeViewControllerDidChangeAccessLevel:(id)a3;
@end

@implementation EKCalendarShareesEditItem

- (id)orderedSharees
{
  return self->_orderedSharees;
}

- (void)setCalendar:(id)a3 store:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)EKCalendarShareesEditItem;
  [(EKCalendarEditItem *)&v5 setCalendar:a3 store:a4];
  [(EKCalendarShareesEditItem *)self reloadData];
}

- (void)reloadData
{
  v3 = (void *)MEMORY[0x1E4F1CA48];
  id v7 = [(EKCalendar *)self->super._calendar sharees];
  v4 = [v7 allObjects];
  objc_super v5 = [v3 arrayWithArray:v4];
  orderedSharees = self->_orderedSharees;
  self->_orderedSharees = v5;
}

- (void)reset
{
  v3 = (NSMutableArray *)objc_opt_new();
  orderedSharees = self->_orderedSharees;
  self->_orderedSharees = v3;
}

- (void)addSharee:(id)a3
{
  orderedSharees = self->_orderedSharees;
  id v5 = a3;
  [(NSMutableArray *)orderedSharees addObject:v5];
  [(EKCalendar *)self->super._calendar addSharee:v5];
}

- (void)removeSharee:(id)a3
{
  orderedSharees = self->_orderedSharees;
  id v5 = a3;
  [(NSMutableArray *)orderedSharees removeObject:v5];
  [(EKCalendar *)self->super._calendar removeSharee:v5];
}

- (id)_iconForSharee:(id)a3
{
  id v3 = a3;
  if ([v3 isNew]) {
    goto LABEL_6;
  }
  uint64_t v4 = [v3 shareeStatus];
  if (v4 == 1)
  {
    id v5 = @"checkmark.circle.fill";
    goto LABEL_9;
  }
  if (v4 == 5)
  {
    id v5 = @"questionmark.circle.fill";
    goto LABEL_9;
  }
  if (v4 != 2)
  {
LABEL_6:
    v6 = 0;
    goto LABEL_10;
  }
  id v5 = @"xmark.circle.fill";
LABEL_9:
  v6 = [MEMORY[0x1E4FB1818] systemImageNamed:v5];
LABEL_10:

  return v6;
}

- (id)_colorForShareeStatus:(unint64_t)a3
{
  switch(a3)
  {
    case 5uLL:
      id v3 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      break;
    case 2uLL:
      id v3 = [MEMORY[0x1E4FB1618] systemRedColor];
      break;
    case 1uLL:
      id v3 = [MEMORY[0x1E4FB1618] systemGreenColor];
      break;
    default:
      id v3 = 0;
      break;
  }

  return v3;
}

- (id)_stringForShareeAccessLevel:(unint64_t)a3
{
  if (a3 == 2)
  {
    id v3 = EventKitUIBundle();
    uint64_t v4 = v3;
    id v5 = @"View & Edit";
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    id v3 = EventKitUIBundle();
    uint64_t v4 = v3;
    id v5 = @"View Only";
LABEL_5:
    v6 = [v3 localizedStringForKey:v5 value:&stru_1F0CC2140 table:0];

    goto LABEL_7;
  }
  v6 = 0;
LABEL_7:

  return v6;
}

- (id)addPersonCell
{
  v2 = [[EKUITableViewCell alloc] initWithStyle:0 reuseIdentifier:@"addPerson"];
  id v3 = [(EKUITableViewCell *)v2 defaultContentConfiguration];
  uint64_t v4 = EventKitUIBundle();
  id v5 = [v4 localizedStringForKey:@"Add Person cell text" value:@"Add Person" table:0];
  [v3 setText:v5];

  v6 = EKUIMainWindowForMultiwindowError();
  id v7 = objc_msgSend(v6, "ekui_tintColor");
  v8 = [v3 textProperties];
  [v8 setColor:v7];

  v9 = [v3 textProperties];
  v10 = [v9 color];
  v11 = [v3 imageProperties];
  [v11 setTintColor:v10];

  v12 = [MEMORY[0x1E4FB1818] systemImageNamed:@"person"];
  [v3 setImage:v12];

  [v3 setImageToTextPadding:12.0];
  [(EKUITableViewCell *)v2 setContentConfiguration:v3];

  return v2;
}

- (id)_shareeCellForName:(id)a3 detailText:(id)a4 icon:(id)a5 iconColor:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  v13 = [(EKUITableViewCell *)[SubtitleCellWithAdditionalIcon alloc] initWithStyle:3 reuseIdentifier:@"shareeCell"];
  [(SubtitleCellWithAdditionalIcon *)v13 setAccessoryType:1];
  v14 = [(SubtitleCellWithAdditionalIcon *)v13 textLabel];
  [v14 setText:v12];

  v15 = [(SubtitleCellWithAdditionalIcon *)v13 detailTextLabel];
  [v15 setText:v11];

  v16 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28D8]];
  v17 = [(SubtitleCellWithAdditionalIcon *)v13 detailTextLabel];
  [v17 setFont:v16];

  if (v9)
  {
    v18 = [(SubtitleCellWithAdditionalIcon *)v13 icon];
    [v18 setImage:v9];

    v19 = [(SubtitleCellWithAdditionalIcon *)v13 icon];
    [v19 setTintColor:v10];
  }
  [(SubtitleCellWithAdditionalIcon *)v13 setSelectionStyle:3];

  return v13;
}

- (BOOL)configureWithCalendar:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)EKCalendarShareesEditItem;
  [(EKCalendarEditItem *)&v10 configureWithCalendar:v4];
  id v5 = [v4 source];
  v6 = [v5 constraints];
  if (![v6 supportsSharedCalendars]) {
    goto LABEL_6;
  }
  if (([v4 canBeShared] & 1) == 0)
  {
    if ([v4 sharingStatus])
    {
      v8 = [v4 sharees];
      BOOL v7 = [v8 count] != 0;

      goto LABEL_7;
    }
LABEL_6:
    BOOL v7 = 0;
    goto LABEL_7;
  }
  BOOL v7 = 1;
LABEL_7:

  return v7;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  if ([(EKCalendar *)self->super._calendar sharingStatus] == 2)
  {
    id v5 = [(EKCalendar *)self->super._calendar sharedOwnerName];
    v6 = EventKitUIBundle();
    BOOL v7 = [v6 localizedStringForKey:@"Owner" value:&stru_1F0CC2140 table:0];
    v8 = [(EKCalendarShareesEditItem *)self _shareeCellForName:v5 detailText:v7 icon:0 iconColor:0];

LABEL_5:
    goto LABEL_7;
  }
  id v9 = [(EKCalendarShareesEditItem *)self orderedSharees];
  unint64_t v10 = [v9 count];

  if (v10 > a3)
  {
    id v11 = [(EKCalendarShareesEditItem *)self orderedSharees];
    id v5 = [v11 objectAtIndexedSubscript:a3];

    v6 = DisplayStringForIdentity((uint64_t)v5, 1, 0);
    id v12 = -[EKCalendarShareesEditItem _stringForShareeAccessLevel:](self, "_stringForShareeAccessLevel:", [v5 shareeAccessLevel]);
    v13 = [(EKCalendarShareesEditItem *)self _iconForSharee:v5];
    v14 = -[EKCalendarShareesEditItem _colorForShareeStatus:](self, "_colorForShareeStatus:", [v5 shareeStatus]);
    v8 = [(EKCalendarShareesEditItem *)self _shareeCellForName:v6 detailText:v12 icon:v13 iconColor:v14];

    [v8 setSource:v5];
    goto LABEL_5;
  }
  v8 = [(EKCalendarShareesEditItem *)self addPersonCell];
LABEL_7:

  return v8;
}

- (unint64_t)numberOfSubitems
{
  if ([(EKCalendar *)self->super._calendar sharingStatus] == 2) {
    return 1;
  }
  id v4 = [(EKCalendarShareesEditItem *)self orderedSharees];
  unint64_t v3 = [v4 count] + 1;

  return v3;
}

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4
{
  if ([(EKCalendar *)self->super._calendar sharingStatus] != 2)
  {
    BOOL v7 = [(EKCalendarShareesEditItem *)self orderedSharees];
    unint64_t v8 = [v7 count];

    if (v8 > a3) {
      return 55.0;
    }
    if (EKUIUnscaledCatalyst()) {
      goto LABEL_3;
    }
    return 45.0;
  }
  if (!EKUIUnscaledCatalyst()) {
    return 45.0;
  }
LABEL_3:

  return EKUIUnscaledCatalystTableRowHeightDefault();
}

- (id)headerTitle
{
  v2 = EventKitUIBundle();
  unint64_t v3 = [v2 localizedStringForKey:@"Shared With" value:&stru_1F0CC2140 table:0];

  return v3;
}

- (BOOL)saveStateToCalendar:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = [(EKCalendar *)self->super._calendar sharees];
  uint64_t v5 = [v4 count];

  if (v5) {
    [(EKCalendar *)self->super._calendar setSharingStatus:1];
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v6 = [(EKCalendar *)self->super._calendar sharees];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v11 isNew] & 1) != 0 || (objc_msgSend(v11, "hasChanges"))
        {
          BOOL v12 = 1;
          goto LABEL_15;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      BOOL v12 = 0;
      if (v8) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v12 = 0;
  }
LABEL_15:

  return v12;
}

- (void)calendarEditor:(id)a3 didSelectSubitem:(unint64_t)a4
{
  if ([(EKCalendar *)self->super._calendar sharingStatus] == 2)
  {
    v6 = (void *)MEMORY[0x1E4F25610];
    uint64_t v7 = [(EKCalendar *)self->super._calendar sharedOwnerName];
    uint64_t v8 = [(EKCalendar *)self->super._calendar sharedOwnerEmail];
    uint64_t v9 = [(EKCalendar *)self->super._calendar sharedOwnerPhoneNumber];
    id v28 = [v6 shareeWithName:v7 emailAddress:v8 phoneNumber:v9];

    unint64_t v10 = [[EKIdentityViewController alloc] initWithIdentity:v28];
LABEL_3:
    id v11 = [(EKCalendarEditItem *)self delegate];
    BOOL v12 = [v11 owningNavigationController];
    [v12 pushViewController:v10 animated:1];
    goto LABEL_12;
  }
  v13 = [(EKCalendarShareesEditItem *)self orderedSharees];
  unint64_t v14 = [v13 count];

  if (v14 > a4)
  {
    long long v15 = [(EKCalendarShareesEditItem *)self orderedSharees];
    id v28 = [v15 objectAtIndex:a4];

    unint64_t v10 = [[EKShareeViewController alloc] initWithSharee:v28];
    [(EKIdentityViewController *)v10 setDelegate:self];
    if ([v28 isNew])
    {
      [(EKIdentityViewController *)v10 setAllowStopSharing:0];
      [(EKIdentityViewController *)v10 setAllowResendInvitations:0];
      [(EKIdentityViewController *)v10 setAllowLocalDelete:1];
    }
    else
    {
      [(EKIdentityViewController *)v10 setAllowStopSharing:[(EKCalendar *)self->super._calendar isMarkedImmutableSharees] ^ 1];
      [(EKIdentityViewController *)v10 setAllowResendInvitations:1];
    }
    goto LABEL_3;
  }
  long long v16 = [(EKCalendarEditItem *)self delegate];
  long long v17 = [v16 owningNavigationController];
  id v28 = [v17 view];

  [v28 frame];
  unint64_t v10 = -[EKShareePickerViewController initWithFrame:calendar:]([EKShareePickerViewController alloc], "initWithFrame:calendar:", self->super._calendar, v18, v19, v20, v21);
  [(EKIdentityViewController *)v10 setDelegate:self];
  [(EKIdentityViewController *)v10 setShouldSuggestFamilySharees:[(EKCalendarShareesEditItem *)self shouldSuggestFamilySharees]];
  v22 = [(EKCalendarShareesEditItem *)self orderedSharees];
  [(EKIdentityViewController *)v10 setFilterOutFamilySharees:v22];

  if (EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v28) && EKUICurrentHeightSizeClassIsRegular(v28))
  {
    v23 = [(EKCalendarEditItem *)self delegate];
    v24 = [(EKUIManagedNavigationController *)v23 owningNavigationController];
    [v24 pushViewController:v10 animated:1];
  }
  else
  {
    v23 = [[EKUIManagedNavigationController alloc] initWithRootViewController:v10];
    v24 = [(EKCalendarEditItem *)self delegate];
    v25 = [v24 owningNavigationController];
    [v25 presentViewController:v23 animated:1 completion:0];
  }
  v26 = [(EKCalendarEditItem *)self delegate];
  [v26 calendarItemStartedEditing:self];

  id v11 = [(EKCalendarEditItem *)self calendar];
  BOOL v12 = [v11 source];
  v27 = [v12 externalID];
  [(EKIdentityViewController *)v10 setSearchAccountID:v27];

LABEL_12:
}

- (void)_popBackToCalendarEditorChangesMade:(BOOL)a3 changesSaved:(BOOL)a4
{
  if (a3)
  {
    BOOL v5 = a4;
    v6 = [(EKCalendarEditItem *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      uint64_t v8 = [(EKCalendarEditItem *)self delegate];
      [v8 calendarItemStartedEditing:self];
    }
    uint64_t v9 = [(EKCalendarEditItem *)self delegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v11 = [(EKCalendarEditItem *)self delegate];
      BOOL v12 = [(EKCalendar *)self->super._calendar sharees];
      v13 = [v12 allObjects];
      [v11 calendarEditItem:self shareesChanged:v13 changesSaved:v5];
    }
  }

  [(EKCalendarShareesEditItem *)self _dismissShareePicker];
}

- (void)_dismissShareePicker
{
  v2 = [(EKCalendarEditItem *)self delegate];
  id v5 = [v2 owningNavigationController];

  unint64_t v3 = [v5 presentedViewController];

  if (v3) {
    [v5 dismissViewControllerAnimated:1 completion:0];
  }
  else {
    id v4 = (id)[v5 popViewControllerAnimated:1];
  }
}

- (void)shareeViewControllerDidChangeAccessLevel:(id)a3
{
  id v4 = [(EKCalendarEditItem *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v6 = [(EKCalendarEditItem *)self delegate];
    [v6 calendarItemStartedEditing:self];
  }
  char v7 = [(EKCalendarEditItem *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v10 = [(EKCalendarEditItem *)self delegate];
    uint64_t v9 = [v10 tableView];
    [v9 reloadData];
  }
}

- (void)shareeViewController:(id)a3 didCompleteWithAction:(int)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  char v7 = [(EKCalendarEditItem *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    uint64_t v9 = [(EKCalendarEditItem *)self delegate];
    [v9 calendarEditItemWillChangeSharees:self];
  }
  switch(a4)
  {
    case 2:
      id v10 = [v6 sharee];
      [(EKCalendarShareesEditItem *)self removeSharee:v10];
      [(EKCalendarShareesEditItem *)self _popBackToCalendarEditorChangesMade:1 changesSaved:0];
LABEL_21:

      break;
    case 1:
      id v10 = [v6 sharee];
      unint64_t v14 = [v10 duplicate];
      [(EKCalendarShareesEditItem *)self removeSharee:v10];
      store = self->super._store;
      calendar = self->super._calendar;
      id v30 = 0;
      BOOL v19 = [(EKEventStore *)store saveCalendar:calendar commit:1 error:&v30];
      id v20 = v30;
      if (!v19)
      {
        double v21 = kEKUILogHandle;
        if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
        {
          v22 = self->super._calendar;
          *(_DWORD *)buf = 138412802;
          v32 = v10;
          __int16 v33 = 2112;
          v34 = v22;
          __int16 v35 = 2112;
          id v36 = v20;
          _os_log_impl(&dword_1B3F4C000, v21, OS_LOG_TYPE_ERROR, "Calendar: Unable to resend sharee(%@) sharee invitation from calendar(%@): %@.", buf, 0x20u);
        }
      }
      [(EKCalendarShareesEditItem *)self addSharee:v14];
      v23 = self->super._store;
      v24 = self->super._calendar;
      id v29 = v20;
      BOOL v25 = [(EKEventStore *)v23 saveCalendar:v24 commit:1 error:&v29];
      id v26 = v29;

      if (!v25)
      {
        v27 = kEKUILogHandle;
        if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
        {
          id v28 = self->super._calendar;
          *(_DWORD *)buf = 138412802;
          v32 = v10;
          __int16 v33 = 2112;
          v34 = v28;
          __int16 v35 = 2112;
          id v36 = v26;
          _os_log_impl(&dword_1B3F4C000, v27, OS_LOG_TYPE_ERROR, "Calendar: Unable to resend sharee(%@) sharee invitation from calendar(%@): %@.", buf, 0x20u);
        }
      }
      [(EKCalendarShareesEditItem *)self _popBackToCalendarEditorChangesMade:1 changesSaved:1];

      goto LABEL_20;
    case 0:
      id v10 = [v6 sharee];
      [(EKCalendarShareesEditItem *)self removeSharee:v10];
      id v11 = [(EKCalendar *)self->super._calendar sharees];
      uint64_t v12 = [v11 count];

      if (!v12) {
        [(EKCalendar *)self->super._calendar setSharingStatus:0];
      }
      v13 = [(EKCalendarEditItem *)self delegate];
      unint64_t v14 = [v13 editorForCalendarEditItem:self];

      if (([v14 saveCalendar:self->super._calendar error:0] & 1) == 0)
      {
        long long v15 = kEKUILogHandle;
        if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
        {
          long long v16 = self->super._calendar;
          *(_DWORD *)buf = 138412546;
          v32 = v10;
          __int16 v33 = 2112;
          v34 = v16;
          _os_log_impl(&dword_1B3F4C000, v15, OS_LOG_TYPE_ERROR, "Calendar: unable to remove sharee(%@) from calendar(%@)", buf, 0x16u);
        }
      }
      [(EKCalendarShareesEditItem *)self _popBackToCalendarEditorChangesMade:1 changesSaved:1];
LABEL_20:

      goto LABEL_21;
  }
}

- (void)shareePickerViewController:(id)a3 didCompleteWithAction:(int)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (a4 == 1)
  {
    char v7 = [(EKCalendarShareesEditItem *)self orderedSharees];
    char v8 = [(EKCalendarShareesEditItem *)self meSharee];

    if (v8)
    {
      uint64_t v9 = [(EKCalendarShareesEditItem *)self meSharee];
      uint64_t v10 = [v7 arrayByAddingObject:v9];

      char v7 = (void *)v10;
    }
    id v11 = [v6 sharees];
    uint64_t v12 = [(EKCalendarShareesEditItem *)self _filteredSharees:v11 byRemovingDuplicatesFoundIn:v7];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v19;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v19 != v16) {
            objc_enumerationMutation(v13);
          }
          -[EKCalendarShareesEditItem addSharee:](self, "addSharee:", *(void *)(*((void *)&v18 + 1) + 8 * v17++), (void)v18);
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v15);
    }

    [(EKCalendarShareesEditItem *)self _popBackToCalendarEditorChangesMade:1 changesSaved:0];
  }
  else if (!a4)
  {
    [(EKCalendarShareesEditItem *)self _dismissShareePicker];
  }
}

- (id)_filteredSharees:(id)a3 byRemovingDuplicatesFoundIn:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  char v7 = [MEMORY[0x1E4F1CA80] set];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v14 = [v13 emailAddress];

        if (v14)
        {
          uint64_t v15 = [v13 emailAddress];
          [v7 addObject:v15];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v10);
  }

  uint64_t v16 = [MEMORY[0x1E4F1CA48] array];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v17 = v5;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = *(void **)(*((void *)&v26 + 1) + 8 * j);
        uint64_t v23 = objc_msgSend(v22, "emailAddress", (void)v26);
        char v24 = [v7 containsObject:v23];

        if ((v24 & 1) == 0) {
          [v16 addObject:v22];
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v19);
  }

  return v16;
}

- (id)eventStoreForShareePickerViewController:(id)a3
{
  return self->super._store;
}

- (EKSharee)meSharee
{
  return self->_meSharee;
}

- (void)setMeSharee:(id)a3
{
}

- (BOOL)shouldSuggestFamilySharees
{
  return self->_shouldSuggestFamilySharees;
}

- (void)setShouldSuggestFamilySharees:(BOOL)a3
{
  self->_shouldSuggestFamilySharees = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meSharee, 0);
  objc_storeStrong((id *)&self->_orderedSharees, 0);
  objc_storeStrong((id *)&self->_addPersonCell, 0);

  objc_storeStrong((id *)&self->_descriptionLabel, 0);
}

@end