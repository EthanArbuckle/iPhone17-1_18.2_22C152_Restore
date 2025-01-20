@interface CNLimitedAccessContactPickerViewController
+ (id)log;
- (BOOL)isSettingsEditingSelection;
- (CAShapeLayer)footerViewBorder;
- (CNContactPickerDelegate)contactPickerDelegate;
- (CNContactPickerViewController)contactPickerViewController;
- (CNLimitedAccessContactPickerDelegate)delegate;
- (NSArray)footerConstraints;
- (NSArray)onboardingConstraints;
- (NSSet)selectedIdentifiersInActivePicker;
- (NSSet)selectedIdentifiersOnLoad;
- (NSString)appBundleId;
- (NSString)appName;
- (NSString)initalSearchText;
- (UIButton)deltaUndoButton;
- (UIButton)deselectAllButton;
- (UIButton)onboardingContinueButton;
- (UIButton)onboardingLaterButton;
- (UIButton)onboardingShowSelectedButton;
- (UIButton)showSelectedButton;
- (UILabel)deltaAddedAndRemovedLabel;
- (UILabel)deltaEditedLabel;
- (UILabel)deltaSelectionCountLabel;
- (UILabel)selectContactsLabel;
- (UIView)footerView;
- (UIView)headerView;
- (id)footerBorderColor;
- (id)initDeltaPickerForAppName:(id)a3 bundleId:(id)a4;
- (id)initForAppName:(id)a3 bundleId:(id)a4;
- (id)initForAppName:(id)a3 bundleId:(id)a4 pickerType:(int)a5 selectedContacts:(id)a6 searchText:(id)a7 caption:(unint64_t)a8;
- (id)initForOnboarding:(id)a3 bundleId:(id)a4 selectedContacts:(id)a5;
- (id)initForOnboarding:(id)a3 selectedContacts:(id)a4;
- (id)initForShowSelected:(id)a3;
- (id)initPickerWithContactsAvailableToAddForAppName:(id)a3 bundleId:(id)a4 searchText:(id)a5 caption:(unint64_t)a6;
- (id)initSettingsPickerForAppName:(id)a3 bundleId:(id)a4;
- (int)pickerType;
- (unint64_t)caption;
- (void)callDelegateWithSelectedContactList:(id)a3;
- (void)contactListViewController:(id)a3 didUpdateLimitedAccessSelection:(id)a4;
- (void)contactListViewControllerShouldEditLimitedAccessSelection:(id)a3;
- (void)contactPicker:(id)a3 didSelectContact:(id)a4;
- (void)contactPicker:(id)a3 didSelectContacts:(id)a4;
- (void)contactPickerDidCancel:(id)a3;
- (void)contactPickerDidGoBack:(id)a3;
- (void)createContactsAvailableToSelectPickerView;
- (void)createDeltaEditSelectedPickerView;
- (void)createDeltaFooterView;
- (void)createGenericFooterView;
- (void)createGenericPickerViewWithMultiSelectSupport:(BOOL)a3;
- (void)createManageOOPFooterView;
- (void)createOOPEditSelectedPickerView;
- (void)createOnboardingFooterView;
- (void)createOnboardingHeaderView;
- (void)createOnboardingPickerView;
- (void)createSettingsShowSelectedPickerView;
- (void)createShowSelectedFooterView;
- (void)createShowSelectedPickerView;
- (void)doLimitedWithNoContacts;
- (void)handleContinueTapped;
- (void)handleDeselectAllTapped;
- (void)handleLaterTapped;
- (void)handleShowSelectedTapped;
- (void)handleUndoTapped;
- (void)registerForTraitChanges;
- (void)saveSelectionToLimitedAccessContacts:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFooterConstraints:(id)a3;
- (void)setIsSettingsEditingSelection:(BOOL)a3;
- (void)setOnboardingConstraints:(id)a3;
- (void)setSelectedIdentifiersInActivePicker:(id)a3;
- (void)setupDeltaFooterConstraints;
- (void)setupManagedOOPFooterConstraints;
- (void)setupOnboardingFooterConstraints;
- (void)setupShowSelectedFooterConstraints;
- (void)updateColors;
- (void)updateFooterShowSelectedButton:(unint64_t)a3;
- (void)updateListViewWithSelectedContacts:(id)a3;
- (void)updateOnboardingUIForSelectionCount:(unint64_t)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation CNLimitedAccessContactPickerViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerConstraints, 0);
  objc_storeStrong((id *)&self->_deselectAllButton, 0);
  objc_storeStrong((id *)&self->_showSelectedButton, 0);
  objc_storeStrong((id *)&self->_deltaUndoButton, 0);
  objc_storeStrong((id *)&self->_selectContactsLabel, 0);
  objc_storeStrong((id *)&self->_deltaAddedAndRemovedLabel, 0);
  objc_storeStrong((id *)&self->_deltaEditedLabel, 0);
  objc_storeStrong((id *)&self->_deltaSelectionCountLabel, 0);
  objc_storeStrong((id *)&self->_onboardingConstraints, 0);
  objc_storeStrong((id *)&self->_onboardingLaterButton, 0);
  objc_storeStrong((id *)&self->_onboardingContinueButton, 0);
  objc_storeStrong((id *)&self->_onboardingShowSelectedButton, 0);
  objc_storeStrong((id *)&self->_footerViewBorder, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_contactPickerViewController, 0);
  objc_storeStrong((id *)&self->_contactPickerDelegate, 0);
  objc_storeStrong((id *)&self->_initalSearchText, 0);
  objc_storeStrong((id *)&self->_selectedIdentifiersInActivePicker, 0);
  objc_storeStrong((id *)&self->_selectedIdentifiersOnLoad, 0);
  objc_storeStrong((id *)&self->_appBundleId, 0);
  objc_storeStrong((id *)&self->_appName, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setFooterConstraints:(id)a3
{
}

- (NSArray)footerConstraints
{
  return self->_footerConstraints;
}

- (UIButton)deselectAllButton
{
  return self->_deselectAllButton;
}

- (UIButton)showSelectedButton
{
  return self->_showSelectedButton;
}

- (UIButton)deltaUndoButton
{
  return self->_deltaUndoButton;
}

- (UILabel)selectContactsLabel
{
  return self->_selectContactsLabel;
}

- (UILabel)deltaAddedAndRemovedLabel
{
  return self->_deltaAddedAndRemovedLabel;
}

- (UILabel)deltaEditedLabel
{
  return self->_deltaEditedLabel;
}

- (UILabel)deltaSelectionCountLabel
{
  return self->_deltaSelectionCountLabel;
}

- (void)setOnboardingConstraints:(id)a3
{
}

- (NSArray)onboardingConstraints
{
  return self->_onboardingConstraints;
}

- (UIButton)onboardingLaterButton
{
  return self->_onboardingLaterButton;
}

- (UIButton)onboardingContinueButton
{
  return self->_onboardingContinueButton;
}

- (UIButton)onboardingShowSelectedButton
{
  return self->_onboardingShowSelectedButton;
}

- (int)pickerType
{
  return self->_pickerType;
}

- (CAShapeLayer)footerViewBorder
{
  return self->_footerViewBorder;
}

- (UIView)footerView
{
  return self->_footerView;
}

- (UIView)headerView
{
  return self->_headerView;
}

- (CNContactPickerViewController)contactPickerViewController
{
  return self->_contactPickerViewController;
}

- (CNContactPickerDelegate)contactPickerDelegate
{
  return self->_contactPickerDelegate;
}

- (unint64_t)caption
{
  return self->_caption;
}

- (NSString)initalSearchText
{
  return self->_initalSearchText;
}

- (void)setIsSettingsEditingSelection:(BOOL)a3
{
  self->_isSettingsEditingSelection = a3;
}

- (BOOL)isSettingsEditingSelection
{
  return self->_isSettingsEditingSelection;
}

- (void)setSelectedIdentifiersInActivePicker:(id)a3
{
}

- (NSSet)selectedIdentifiersInActivePicker
{
  return self->_selectedIdentifiersInActivePicker;
}

- (NSSet)selectedIdentifiersOnLoad
{
  return self->_selectedIdentifiersOnLoad;
}

- (NSString)appBundleId
{
  return self->_appBundleId;
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setDelegate:(id)a3
{
}

- (CNLimitedAccessContactPickerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNLimitedAccessContactPickerDelegate *)WeakRetained;
}

- (void)contactListViewControllerShouldEditLimitedAccessSelection:(id)a3
{
  [(CNLimitedAccessContactPickerViewController *)self setIsSettingsEditingSelection:1];
  id v4 = [[CNLimitedAccessContactPickerViewController alloc] initDeltaPickerForAppName:self->_appName bundleId:self->_appBundleId];
  [v4 setDelegate:self];
  [(CNLimitedAccessContactPickerViewController *)self presentViewController:v4 animated:1 completion:0];
}

- (void)contactListViewController:(id)a3 didUpdateLimitedAccessSelection:(id)a4
{
  id v26 = a4;
  objc_storeStrong((id *)&self->_selectedIdentifiersInActivePicker, a4);
  unint64_t v6 = [v26 count];
  switch(self->_pickerType)
  {
    case 1:
      [(CNLimitedAccessContactPickerViewController *)self updateOnboardingUIForSelectionCount:v6];
      break;
    case 2:
      NSUInteger v14 = [(NSSet *)self->_selectedIdentifiersOnLoad count];
      deselectAllButton = self->_deselectAllButton;
      v16 = CNContactsUIBundle();
      v17 = v16;
      if (v6 >= v14) {
        v18 = @"LIMITED_CONTACTS_DESELECT_ALL";
      }
      else {
        v18 = @"LIMITED_CONTACTS_SELECT_ALL";
      }
      v25 = [v16 localizedStringForKey:v18 value:&stru_1ED8AC728 table:@"Localized"];
      [(UIButton *)deselectAllButton setTitle:v25 forState:0];

      break;
    case 3:
      [(CNLimitedAccessContactPickerViewController *)self updateFooterShowSelectedButton:v6];
      break;
    case 4:
      v7 = [MEMORY[0x1E4F1CA80] setWithSet:v26];
      [v7 minusSet:self->_selectedIdentifiersOnLoad];
      uint64_t v8 = [v7 count];
      v9 = [MEMORY[0x1E4F1CA80] setWithSet:self->_selectedIdentifiersOnLoad];
      [v9 minusSet:v26];
      uint64_t v10 = [v9 count];
      BOOL v11 = (v8 | v10) == 0;
      if (v8 | v10)
      {
        uint64_t v19 = v10;
        v20 = NSString;
        v21 = CNContactsUIBundle();
        v22 = [v21 localizedStringForKey:@"LIMITED_CONTACTS_DELTA_CHANGES" value:&stru_1ED8AC728 table:@"Localized"];
        v23 = objc_msgSend(v20, "localizedStringWithFormat:", v22, v8, v19);
        p_deltaAddedAndRemovedLabel = (id *)&self->_deltaAddedAndRemovedLabel;
        [(UILabel *)self->_deltaAddedAndRemovedLabel setText:v23];

        [(UILabel *)self->_deltaSelectionCountLabel setHidden:1];
        [(UILabel *)self->_deltaEditedLabel setHidden:0];
        v13 = &OBJC_IVAR___CNLimitedAccessContactPickerViewController__deltaUndoButton;
      }
      else
      {
        [(UILabel *)self->_deltaEditedLabel setHidden:1];
        [(UILabel *)self->_deltaAddedAndRemovedLabel setHidden:1];
        p_deltaAddedAndRemovedLabel = (id *)&self->_deltaUndoButton;
        v13 = &OBJC_IVAR___CNLimitedAccessContactPickerViewController__deltaSelectionCountLabel;
      }
      [*p_deltaAddedAndRemovedLabel setHidden:v11];
      [*(id *)((char *)&self->super.super.super.isa + *v13) setHidden:0];
      v24 = [(CNLimitedAccessContactPickerViewController *)self view];
      [v24 setNeedsLayout];

      break;
    default:
      break;
  }
}

- (void)contactPickerDidGoBack:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = [(CNLimitedAccessContactPickerViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    unint64_t v6 = [(NSSet *)self->_selectedIdentifiersInActivePicker allObjects];
    v7 = [(CNLimitedAccessContactPickerViewController *)self appBundleId];
    uint64_t v8 = +[CNLimitedAccessPickerSupport contactsFromIdentifiers:v6 withBundleId:v7];

    v9 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v11 = 134217984;
      uint64_t v12 = [v8 count];
      _os_log_impl(&dword_18B625000, v9, OS_LOG_TYPE_INFO, "Telling delegate limited access went back with %lu selections", (uint8_t *)&v11, 0xCu);
    }

    uint64_t v10 = [(CNLimitedAccessContactPickerViewController *)self delegate];
    [v10 contactPicker:self didGoBackWithSelectedContacts:v8];
  }
}

- (void)contactPickerDidCancel:(id)a3
{
  if (self->_contactPickerViewController == a3)
  {
    id v4 = [(CNLimitedAccessContactPickerViewController *)self delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      unint64_t v6 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v8 = 0;
        _os_log_impl(&dword_18B625000, v6, OS_LOG_TYPE_INFO, "Telling delegate limited picker cancelled", v8, 2u);
      }

      v7 = [(CNLimitedAccessContactPickerViewController *)self delegate];
      [v7 contactPickerDidCancel:self];
    }
  }
}

- (void)contactPicker:(id)a3 didSelectContacts:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = v6;
  if (v6)
  {
    switch(self->_pickerType)
    {
      case 1:
        -[CNLimitedAccessContactPickerViewController updateOnboardingUIForSelectionCount:](self, "updateOnboardingUIForSelectionCount:", [v6 count]);
        goto LABEL_4;
      case 3:
        [(CNLimitedAccessContactPickerViewController *)self saveSelectionToLimitedAccessContacts:v6];
        [(CNLimitedAccessContactPickerViewController *)self updateListViewWithSelectedContacts:v7];
        -[CNLimitedAccessContactPickerViewController updateFooterShowSelectedButton:](self, "updateFooterShowSelectedButton:", [v7 count]);
        break;
      case 4:
        [(CNLimitedAccessContactPickerViewController *)self saveSelectionToLimitedAccessContacts:v6];
        break;
      case 5:
LABEL_4:
        [(CNLimitedAccessContactPickerViewController *)self updateListViewWithSelectedContacts:v7];
        break;
      default:
        break;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [(CNLimitedAccessContactPickerViewController *)self callDelegateWithSelectedContactList:v7];
    }
  }
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v15[0] = v7;
      uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
      +[CNLimitedAccessPickerSupport addContactsToLimitedAccess:v8 forBundleID:self->_appBundleId];

      v9 = [(CNLimitedAccessContactPickerViewController *)self delegate];
      LOBYTE(v8) = objc_opt_respondsToSelector();

      if (v8)
      {
        uint64_t v10 = [(id)objc_opt_class() log];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          int v11 = [v7 identifier];
          int v13 = 138543362;
          NSUInteger v14 = v11;
          _os_log_impl(&dword_18B625000, v10, OS_LOG_TYPE_INFO, "Telling delegate limited access that %{public}@ has been selected", (uint8_t *)&v13, 0xCu);
        }
        uint64_t v12 = [(CNLimitedAccessContactPickerViewController *)self delegate];
        [v12 contactPicker:self didSelectContact:v7];
      }
    }
  }
}

- (void)callDelegateWithSelectedContactList:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(CNLimitedAccessContactPickerViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v9 = 134217984;
      uint64_t v10 = [v4 count];
      _os_log_impl(&dword_18B625000, v7, OS_LOG_TYPE_INFO, "Telling delegate limited access has %lu contacts", (uint8_t *)&v9, 0xCu);
    }

    uint64_t v8 = [(CNLimitedAccessContactPickerViewController *)self delegate];
    [v8 contactPicker:self didSelectContacts:v4];
  }
}

- (void)saveSelectionToLimitedAccessContacts:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 134217984;
    uint64_t v7 = [v4 count];
    _os_log_impl(&dword_18B625000, v5, OS_LOG_TYPE_INFO, "Saving limited access selection for %lu contacts", (uint8_t *)&v6, 0xCu);
  }

  +[CNLimitedAccessPickerSupport removeAllLimitedAccessIdentifiersForBundleID:self->_appBundleId];
  +[CNLimitedAccessPickerSupport addContactsToLimitedAccess:v4 forBundleID:self->_appBundleId];
}

- (void)updateFooterShowSelectedButton:(unint64_t)a3
{
  if (a3)
  {
    [(UILabel *)self->_selectContactsLabel setHidden:1];
    p_showSelectedButton = (void **)&self->_showSelectedButton;
    showSelectedButton = self->_showSelectedButton;
    uint64_t v7 = NSString;
    uint64_t v8 = CNContactsUIBundle();
    int v9 = [v8 localizedStringForKey:@"LIMITED_CONTACTS_SHOW_SELECTED" value:&stru_1ED8AC728 table:@"Localized"];
    uint64_t v10 = objc_msgSend(v7, "localizedStringWithFormat:", v9, a3);
    [(UIButton *)showSelectedButton setTitle:v10 forState:0];
  }
  else
  {
    [(UIButton *)self->_showSelectedButton setHidden:1];
    p_showSelectedButton = (void **)&self->_selectContactsLabel;
  }
  uint64_t v11 = *p_showSelectedButton;

  [v11 setHidden:0];
}

- (void)updateListViewWithSelectedContacts:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v11 = 134217984;
    uint64_t v12 = [v4 count];
    _os_log_impl(&dword_18B625000, v5, OS_LOG_TYPE_INFO, "Reloading limited access summary for %lu contacts", (uint8_t *)&v11, 0xCu);
  }

  int v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_msgSend(v4, "_cn_map:", *MEMORY[0x1E4F1AFA0]);
  uint64_t v8 = [v6 setWithArray:v7];
  selectedIdentifiersInActivePicker = self->_selectedIdentifiersInActivePicker;
  self->_selectedIdentifiersInActivePicker = v8;

  uint64_t v10 = [(CNContactPickerViewController *)self->_contactPickerViewController navigationController];
  [v10 didResetLimitedAccessSelectionTo:self->_selectedIdentifiersInActivePicker];
}

- (void)updateOnboardingUIForSelectionCount:(unint64_t)a3
{
  onboardingContinueButton = self->_onboardingContinueButton;
  if (a3)
  {
    [(UIButton *)onboardingContinueButton setEnabled:1];
    onboardingShowSelectedButton = self->_onboardingShowSelectedButton;
    [MEMORY[0x1E4FB1618] tintColor];
  }
  else
  {
    -[UIButton setEnabled:](onboardingContinueButton, "setEnabled:");
    onboardingShowSelectedButton = self->_onboardingShowSelectedButton;
    [MEMORY[0x1E4FB1618] labelColor];
  uint64_t v7 = };
  [(UIButton *)onboardingShowSelectedButton setTitleColor:v7 forState:0];

  uint64_t v8 = self->_onboardingShowSelectedButton;
  int v9 = NSString;
  CNContactsUIBundle();
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v12 localizedStringForKey:@"LIMITED_CONTACTS_ONBOARDING_SELECTED" value:&stru_1ED8AC728 table:@"Localized"];
  int v11 = objc_msgSend(v9, "localizedStringWithFormat:", v10, a3);
  [(UIButton *)v8 setTitle:v11 forState:0];
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CNLimitedAccessContactPickerViewController;
  [(CNLimitedAccessContactPickerViewController *)&v3 viewWillLayoutSubviews];
  if (self->_footerView)
  {
    switch(self->_pickerType)
    {
      case 1:
        [(CNLimitedAccessContactPickerViewController *)self setupOnboardingFooterConstraints];
        break;
      case 2:
        [(CNLimitedAccessContactPickerViewController *)self setupShowSelectedFooterConstraints];
        break;
      case 3:
        [(CNLimitedAccessContactPickerViewController *)self setupManagedOOPFooterConstraints];
        break;
      case 4:
        [(CNLimitedAccessContactPickerViewController *)self setupDeltaFooterConstraints];
        break;
      default:
        return;
    }
  }
}

- (void)createGenericFooterView
{
  v26[4] = *MEMORY[0x1E4F143B8];
  objc_super v3 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  footerView = self->_footerView;
  self->_footerView = v3;

  char v5 = +[CNUIColorRepository contactPickerBackgroundColor];
  [(UIView *)self->_footerView setBackgroundColor:v5];

  [(UIView *)self->_footerView setClipsToBounds:1];
  [(UIView *)self->_footerView setTranslatesAutoresizingMaskIntoConstraints:0];
  id v6 = objc_alloc(MEMORY[0x1E4FB1F00]);
  uint64_t v7 = [MEMORY[0x1E4FB14C8] effectWithStyle:1100];
  uint64_t v8 = (void *)[v6 initWithEffect:v7];

  [v8 setClipsToBounds:1];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v8 setAlpha:1.0];
  [(UIView *)self->_footerView addSubview:v8];
  v25 = [v8 topAnchor];
  v24 = [(UIView *)self->_footerView topAnchor];
  v23 = [v25 constraintEqualToAnchor:v24];
  v26[0] = v23;
  v22 = [v8 bottomAnchor];
  v21 = [(UIView *)self->_footerView bottomAnchor];
  int v9 = [v22 constraintEqualToAnchor:v21];
  v26[1] = v9;
  uint64_t v10 = [v8 leadingAnchor];
  int v11 = [(UIView *)self->_footerView leadingAnchor];
  id v12 = [v10 constraintEqualToAnchor:v11];
  v26[2] = v12;
  uint64_t v13 = [v8 trailingAnchor];
  NSUInteger v14 = [(UIView *)self->_footerView trailingAnchor];
  v15 = [v13 constraintEqualToAnchor:v14];
  v26[3] = v15;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:4];

  [MEMORY[0x1E4F28DC8] activateConstraints:v20];
  v16 = [MEMORY[0x1E4F39C88] layer];
  footerViewBorder = self->_footerViewBorder;
  self->_footerViewBorder = v16;

  id v18 = [(CNLimitedAccessContactPickerViewController *)self footerBorderColor];
  -[CAShapeLayer setStrokeColor:](self->_footerViewBorder, "setStrokeColor:", [v18 CGColor]);

  [(CAShapeLayer *)self->_footerViewBorder setFillColor:0];
  uint64_t v19 = [(UIView *)self->_footerView layer];
  [v19 addSublayer:self->_footerViewBorder];
}

- (void)createGenericPickerViewWithMultiSelectSupport:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = objc_alloc_init(CNContactPickerViewController);
  contactPickerViewController = self->_contactPickerViewController;
  self->_contactPickerViewController = v5;

  if (v3) {
    uint64_t v7 = self;
  }
  else {
    uint64_t v7 = [[CNContactPickerSingleContactDelegate alloc] initWithTargetViewController:self];
  }
  contactPickerDelegate = self->_contactPickerDelegate;
  self->_contactPickerDelegate = (CNContactPickerDelegate *)v7;

  [(CNContactPickerViewController *)self->_contactPickerViewController setDelegate:self->_contactPickerDelegate];
  [(CNContactPickerViewController *)self->_contactPickerViewController setMode:2];
  [(CNContactPickerViewController *)self->_contactPickerViewController setShouldAllowSearchForMultiSelect:1];
  [(CNContactPickerViewController *)self->_contactPickerViewController setOnlyRealContacts:1];
  [(CNContactPickerViewController *)self->_contactPickerViewController setLimitedAccessPickerType:self->_pickerType];
  [(CNContactPickerViewController *)self->_contactPickerViewController setLimitedAccessContactSelection:self->_selectedIdentifiersOnLoad];
  [(CNContactPickerViewController *)self->_contactPickerViewController setLimitedAccessAppName:self->_appName];
  appBundleId = self->_appBundleId;
  uint64_t v10 = self->_contactPickerViewController;

  [(CNContactPickerViewController *)v10 setLimitedAccessAppBundleId:appBundleId];
}

- (id)footerBorderColor
{
  v2 = [(CNLimitedAccessContactPickerViewController *)self traitCollection];
  if ([v2 userInterfaceStyle] == 2) {
    [MEMORY[0x1E4FB1618] systemDarkGrayColor];
  }
  else {
  BOOL v3 = [MEMORY[0x1E4FB1618] systemLightGrayColor];
  }

  return v3;
}

- (void)updateColors
{
  id v3 = [(CNLimitedAccessContactPickerViewController *)self footerBorderColor];
  -[CAShapeLayer setStrokeColor:](self->_footerViewBorder, "setStrokeColor:", [v3 CGColor]);
}

- (void)registerForTraitChanges
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = objc_opt_class();
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  id v4 = (id)[(CNLimitedAccessContactPickerViewController *)self registerForTraitChanges:v3 withAction:sel_updateColors];
}

- (void)handleDeselectAllTapped
{
  unint64_t v3 = [(NSSet *)self->_selectedIdentifiersInActivePicker count];
  if (v3 >= [(NSSet *)self->_selectedIdentifiersOnLoad count])
  {
    id v4 = [MEMORY[0x1E4F1CAD0] set];
  }
  else
  {
    id v4 = self->_selectedIdentifiersOnLoad;
  }
  id v6 = v4;
  char v5 = [(CNContactPickerViewController *)self->_contactPickerViewController navigationController];
  [v5 didResetLimitedAccessSelectionTo:v6];
}

- (void)handleUndoTapped
{
  id v3 = [(CNContactPickerViewController *)self->_contactPickerViewController navigationController];
  [v3 didResetLimitedAccessSelectionTo:self->_selectedIdentifiersOnLoad];
}

- (void)handleShowSelectedTapped
{
  if ([(NSSet *)self->_selectedIdentifiersInActivePicker count])
  {
    id v3 = [CNLimitedAccessContactPickerViewController alloc];
    id v4 = [(NSSet *)self->_selectedIdentifiersInActivePicker allObjects];
    id v5 = [(CNLimitedAccessContactPickerViewController *)v3 initForShowSelected:v4];

    [v5 setDelegate:self];
    [(CNLimitedAccessContactPickerViewController *)self presentViewController:v5 animated:1 completion:0];
  }
}

- (void)setupShowSelectedFooterConstraints
{
  v25[4] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  footerView = self->_footerView;
  if (v4 == 1)
  {
    uint64_t v6 = [(UIView *)footerView centerYAnchor];
  }
  else
  {
    uint64_t v7 = [(UIView *)footerView safeAreaLayoutGuide];
    uint64_t v6 = [v7 centerYAnchor];
  }
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A258] + 16))() & 1) == 0) {
    [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_footerConstraints];
  }
  v24 = [(UIButton *)self->_deselectAllButton centerYAnchor];
  v23 = [v24 constraintEqualToAnchor:v6];
  v25[0] = v23;
  v21 = [(UIButton *)self->_deselectAllButton centerXAnchor];
  v22 = [(UIView *)self->_footerView safeAreaLayoutGuide];
  v20 = [v22 centerXAnchor];
  id v18 = [v21 constraintEqualToAnchor:v20];
  v25[1] = v18;
  uint64_t v8 = [(UIView *)self->_footerView layoutMarginsGuide];
  int v9 = [v8 heightAnchor];
  uint64_t v10 = [(UIButton *)self->_showSelectedButton heightAnchor];
  [v9 constraintEqualToAnchor:v10 constant:40.0];
  int v11 = v19 = (void *)v6;
  v25[2] = v11;
  id v12 = [(UIView *)self->_footerView bottomAnchor];
  uint64_t v13 = [(CNLimitedAccessContactPickerViewController *)self view];
  NSUInteger v14 = [v13 bottomAnchor];
  v15 = [v12 constraintEqualToAnchor:v14];
  v25[3] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:4];
  footerConstraints = self->_footerConstraints;
  self->_footerConstraints = v16;

  [MEMORY[0x1E4F28DC8] activateConstraints:self->_footerConstraints];
}

- (void)setupDeltaFooterConstraints
{
  v53[12] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  footerView = self->_footerView;
  if (v4 == 1)
  {
    uint64_t v6 = [(UIView *)footerView centerYAnchor];
  }
  else
  {
    uint64_t v7 = [(UIView *)footerView safeAreaLayoutGuide];
    uint64_t v6 = [v7 centerYAnchor];
  }
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A258] + 16))() & 1) == 0) {
    [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_footerConstraints];
  }
  v51 = [(UILabel *)self->_deltaSelectionCountLabel centerYAnchor];
  v52 = [(UIView *)self->_footerView safeAreaLayoutGuide];
  v50 = [v52 centerYAnchor];
  v49 = [v51 constraintEqualToAnchor:v50];
  v53[0] = v49;
  v47 = [(UILabel *)self->_deltaSelectionCountLabel centerXAnchor];
  v48 = [(UIView *)self->_footerView safeAreaLayoutGuide];
  v46 = [v48 centerXAnchor];
  v45 = [v47 constraintEqualToAnchor:v46];
  v53[1] = v45;
  v44 = [(UILabel *)self->_deltaEditedLabel bottomAnchor];
  v43 = [v44 constraintEqualToAnchor:v6];
  v53[2] = v43;
  v41 = [(UILabel *)self->_deltaEditedLabel topAnchor];
  v42 = [(UIView *)self->_footerView safeAreaLayoutGuide];
  v40 = [v42 topAnchor];
  v39 = [v41 constraintGreaterThanOrEqualToAnchor:v40];
  v53[3] = v39;
  v37 = [(UILabel *)self->_deltaEditedLabel centerXAnchor];
  v38 = [(CNLimitedAccessContactPickerViewController *)self footerView];
  v36 = [v38 centerXAnchor];
  v35 = [v37 constraintEqualToAnchor:v36];
  v53[4] = v35;
  v34 = [(UILabel *)self->_deltaAddedAndRemovedLabel topAnchor];
  v33 = [v34 constraintEqualToAnchor:v6];
  v53[5] = v33;
  v30 = [(UILabel *)self->_deltaAddedAndRemovedLabel bottomAnchor];
  v31 = [(UIView *)self->_footerView safeAreaLayoutGuide];
  v29 = [v31 bottomAnchor];
  v28 = [v30 constraintLessThanOrEqualToAnchor:v29];
  v53[6] = v28;
  id v26 = [(UILabel *)self->_deltaAddedAndRemovedLabel centerXAnchor];
  v27 = [(CNLimitedAccessContactPickerViewController *)self footerView];
  v25 = [v27 centerXAnchor];
  v24 = [v26 constraintEqualToAnchor:v25];
  v53[7] = v24;
  v23 = [(UIButton *)self->_deltaUndoButton centerYAnchor];
  v22 = [v23 constraintEqualToAnchor:v6];
  v53[8] = v22;
  v20 = [(UIButton *)self->_deltaUndoButton trailingAnchor];
  v21 = [(UIView *)self->_footerView layoutMarginsGuide];
  uint64_t v19 = [v21 trailingAnchor];
  uint64_t v8 = [v20 constraintEqualToAnchor:v19 constant:-10.0];
  v53[9] = v8;
  int v9 = [(UIView *)self->_footerView layoutMarginsGuide];
  [v9 heightAnchor];
  uint64_t v10 = v32 = (void *)v6;
  int v11 = [(UILabel *)self->_deltaSelectionCountLabel heightAnchor];
  id v12 = [v10 constraintEqualToAnchor:v11 constant:24.0];
  v53[10] = v12;
  uint64_t v13 = [(UIView *)self->_footerView bottomAnchor];
  NSUInteger v14 = [(CNLimitedAccessContactPickerViewController *)self view];
  v15 = [v14 bottomAnchor];
  v16 = [v13 constraintEqualToAnchor:v15];
  v53[11] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:12];
  footerConstraints = self->_footerConstraints;
  self->_footerConstraints = v17;

  [MEMORY[0x1E4F28DC8] activateConstraints:self->_footerConstraints];
}

- (void)setupManagedOOPFooterConstraints
{
  v31[6] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  footerView = self->_footerView;
  if (v4 == 1)
  {
    uint64_t v6 = [(UIView *)footerView centerYAnchor];
  }
  else
  {
    uint64_t v7 = [(UIView *)footerView safeAreaLayoutGuide];
    uint64_t v6 = [v7 centerYAnchor];
  }
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A258] + 16))() & 1) == 0) {
    [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_footerConstraints];
  }
  v30 = [(UIButton *)self->_showSelectedButton centerYAnchor];
  v29 = [v30 constraintEqualToAnchor:v6];
  v31[0] = v29;
  id v26 = [(UIButton *)self->_showSelectedButton centerXAnchor];
  v27 = [(UIView *)self->_footerView safeAreaLayoutGuide];
  v25 = [v27 centerXAnchor];
  v24 = [v26 constraintEqualToAnchor:v25];
  v31[1] = v24;
  v28 = (void *)v6;
  v23 = [(UILabel *)self->_selectContactsLabel centerYAnchor];
  v22 = [v23 constraintEqualToAnchor:v6];
  v31[2] = v22;
  v20 = [(UILabel *)self->_selectContactsLabel centerXAnchor];
  v21 = [(UIView *)self->_footerView safeAreaLayoutGuide];
  uint64_t v19 = [v21 centerXAnchor];
  uint64_t v8 = [v20 constraintEqualToAnchor:v19];
  v31[3] = v8;
  int v9 = [(UIView *)self->_footerView layoutMarginsGuide];
  uint64_t v10 = [v9 heightAnchor];
  int v11 = [(UIButton *)self->_showSelectedButton heightAnchor];
  id v12 = [v10 constraintEqualToAnchor:v11 constant:10.0];
  v31[4] = v12;
  uint64_t v13 = [(UIView *)self->_footerView bottomAnchor];
  NSUInteger v14 = [(CNLimitedAccessContactPickerViewController *)self view];
  v15 = [v14 bottomAnchor];
  v16 = [v13 constraintEqualToAnchor:v15];
  v31[5] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:6];
  footerConstraints = self->_footerConstraints;
  self->_footerConstraints = v17;

  [MEMORY[0x1E4F28DC8] activateConstraints:self->_footerConstraints];
}

- (void)createDeltaFooterView
{
  [(CNLimitedAccessContactPickerViewController *)self createGenericFooterView];
  id v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  deltaSelectionCountLabel = self->_deltaSelectionCountLabel;
  self->_deltaSelectionCountLabel = v3;

  id v5 = NSString;
  uint64_t v6 = CNContactsUIBundle();
  uint64_t v7 = [v6 localizedStringForKey:@"SELECTED_CONTACTS_COUNT" value:&stru_1ED8AC728 table:@"Localized"];
  uint64_t v8 = objc_msgSend(v5, "localizedStringWithFormat:", v7, -[NSSet count](self->_selectedIdentifiersOnLoad, "count"));
  [(UILabel *)self->_deltaSelectionCountLabel setText:v8];

  [(UILabel *)self->_deltaSelectionCountLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  int v9 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
  [(UILabel *)self->_deltaSelectionCountLabel setFont:v9];

  [(UILabel *)self->_deltaSelectionCountLabel setAdjustsFontForContentSizeCategory:0];
  [(UIView *)self->_footerView addSubview:self->_deltaSelectionCountLabel];
  id v21 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB28E0] maximumContentSizeCategory:*MEMORY[0x1E4FB27C0]];
  uint64_t v10 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  deltaEditedLabel = self->_deltaEditedLabel;
  self->_deltaEditedLabel = v10;

  id v12 = CNContactsUIBundle();
  uint64_t v13 = [v12 localizedStringForKey:@"LIMITED_PICKER_EDITED" value:&stru_1ED8AC728 table:@"Localized"];
  [(UILabel *)self->_deltaEditedLabel setText:v13];

  [(UILabel *)self->_deltaEditedLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_deltaEditedLabel setFont:v21];
  [(UILabel *)self->_deltaEditedLabel setAdjustsFontForContentSizeCategory:0];
  [(UILabel *)self->_deltaEditedLabel setHidden:1];
  [(UIView *)self->_footerView addSubview:self->_deltaEditedLabel];
  NSUInteger v14 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  deltaAddedAndRemovedLabel = self->_deltaAddedAndRemovedLabel;
  self->_deltaAddedAndRemovedLabel = v14;

  v16 = [MEMORY[0x1E4FB1618] systemGrayColor];
  [(UILabel *)self->_deltaAddedAndRemovedLabel setTextColor:v16];

  [(UILabel *)self->_deltaAddedAndRemovedLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_deltaAddedAndRemovedLabel setFont:v21];
  [(UILabel *)self->_deltaAddedAndRemovedLabel setAdjustsFontForContentSizeCategory:0];
  [(UILabel *)self->_deltaAddedAndRemovedLabel setHidden:1];
  [(UIView *)self->_footerView addSubview:self->_deltaAddedAndRemovedLabel];
  v17 = (UIButton *)objc_alloc_init(MEMORY[0x1E4FB14D0]);
  deltaUndoButton = self->_deltaUndoButton;
  self->_deltaUndoButton = v17;

  uint64_t v19 = self->_deltaUndoButton;
  v20 = objc_msgSend(MEMORY[0x1E4FB1818], "cnui_symbolImageNamed:scale:withColor:useFixedSize:", @"arrow.uturn.backward.circle", 3, 0, 0);
  [(UIButton *)v19 setImage:v20 forState:0];

  [(UIButton *)self->_deltaUndoButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIButton *)self->_deltaUndoButton setHidden:1];
  [(UIButton *)self->_deltaUndoButton addTarget:self action:sel_handleUndoTapped forControlEvents:64];
  [(UIView *)self->_footerView addSubview:self->_deltaUndoButton];
}

- (void)createManageOOPFooterView
{
  id v3 = [MEMORY[0x1E4FB08E0] systemFontOfSize:18.0 weight:*MEMORY[0x1E4FB09E0]];
  [(CNLimitedAccessContactPickerViewController *)self createGenericFooterView];
  uint64_t v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  selectContactsLabel = self->_selectContactsLabel;
  self->_selectContactsLabel = v4;

  uint64_t v6 = NSString;
  uint64_t v7 = CNContactsUIBundle();
  uint64_t v8 = [v7 localizedStringForKey:@"LIMITED_CONTACTS_SELECT_CONTACTS" value:&stru_1ED8AC728 table:@"Localized"];
  int v9 = objc_msgSend(v6, "localizedStringWithFormat:", v8, -[NSSet count](self->_selectedIdentifiersOnLoad, "count"));
  [(UILabel *)self->_selectContactsLabel setText:v9];

  [(UILabel *)self->_selectContactsLabel setFont:v3];
  [(UILabel *)self->_selectContactsLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_selectContactsLabel setAdjustsFontForContentSizeCategory:1];
  [(UIView *)self->_footerView addSubview:self->_selectContactsLabel];
  uint64_t v10 = (UIButton *)objc_alloc_init(MEMORY[0x1E4FB14D0]);
  showSelectedButton = self->_showSelectedButton;
  self->_showSelectedButton = v10;

  id v12 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
  uint64_t v13 = NSString;
  NSUInteger v14 = CNContactsUIBundle();
  v15 = [v14 localizedStringForKey:@"LIMITED_CONTACTS_SHOW_SELECTED" value:&stru_1ED8AC728 table:@"Localized"];
  v16 = objc_msgSend(v13, "localizedStringWithFormat:", v15, -[NSSet count](self->_selectedIdentifiersOnLoad, "count"));
  [v12 setTitle:v16];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __71__CNLimitedAccessContactPickerViewController_createManageOOPFooterView__block_invoke;
  v18[3] = &unk_1E549ACB0;
  id v19 = v3;
  id v17 = v3;
  [v12 setTitleTextAttributesTransformer:v18];
  [(UIButton *)self->_showSelectedButton setConfiguration:v12];
  [(UIButton *)self->_showSelectedButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIButton *)self->_showSelectedButton addTarget:self action:sel_handleShowSelectedTapped forControlEvents:64];
  [(UIView *)self->_footerView addSubview:self->_showSelectedButton];
}

id __71__CNLimitedAccessContactPickerViewController_createManageOOPFooterView__block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)[a2 mutableCopy];
  [v3 setObject:*(void *)(a1 + 32) forKeyedSubscript:*MEMORY[0x1E4FB06F8]];

  return v3;
}

- (void)createShowSelectedFooterView
{
  id v3 = [MEMORY[0x1E4FB08E0] systemFontOfSize:18.0 weight:*MEMORY[0x1E4FB09D8]];
  [(CNLimitedAccessContactPickerViewController *)self createGenericFooterView];
  uint64_t v4 = (UIButton *)objc_alloc_init(MEMORY[0x1E4FB14D0]);
  deselectAllButton = self->_deselectAllButton;
  self->_deselectAllButton = v4;

  uint64_t v6 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
  uint64_t v7 = CNContactsUIBundle();
  uint64_t v8 = [v7 localizedStringForKey:@"LIMITED_CONTACTS_DESELECT_ALL" value:&stru_1ED8AC728 table:@"Localized"];
  [v6 setTitle:v8];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__CNLimitedAccessContactPickerViewController_createShowSelectedFooterView__block_invoke;
  v10[3] = &unk_1E549ACB0;
  id v11 = v3;
  id v9 = v3;
  [v6 setTitleTextAttributesTransformer:v10];
  [(UIButton *)self->_deselectAllButton setConfiguration:v6];
  [(UIButton *)self->_deselectAllButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIButton *)self->_deselectAllButton addTarget:self action:sel_handleDeselectAllTapped forControlEvents:64];
  [(UIView *)self->_footerView addSubview:self->_deselectAllButton];
}

id __74__CNLimitedAccessContactPickerViewController_createShowSelectedFooterView__block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)[a2 mutableCopy];
  [v3 setObject:*(void *)(a1 + 32) forKeyedSubscript:*MEMORY[0x1E4FB06F8]];

  return v3;
}

- (void)createContactsAvailableToSelectPickerView
{
  [(CNLimitedAccessContactPickerViewController *)self createGenericPickerViewWithMultiSelectSupport:0];
  [(CNContactPickerViewController *)self->_contactPickerViewController setLimitedAccessContactSelection:self->_selectedIdentifiersOnLoad];
  [(CNContactPickerViewController *)self->_contactPickerViewController setHidesSearchableSources:1];
  [(CNContactPickerViewController *)self->_contactPickerViewController setLimitedAccessSearchQuery:self->_initalSearchText];
  [(CNContactPickerViewController *)self->_contactPickerViewController setLimitedAccessCaption:self->_caption];
  [(CNContactPickerViewController *)self->_contactPickerViewController setAllowsCancel:1];
  CNContactsUIBundle();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [v4 localizedStringForKey:@"LIMITED_CONTACTS_APPAFFORDANCE_PICKER_PROMPT" value:&stru_1ED8AC728 table:@"Localized"];
  [(CNContactPickerViewController *)self->_contactPickerViewController setPrompt:v3];
}

- (void)createShowSelectedPickerView
{
  [(CNLimitedAccessContactPickerViewController *)self createGenericPickerViewWithMultiSelectSupport:1];
  [(CNContactPickerViewController *)self->_contactPickerViewController setLimitedAccessContactSelection:self->_selectedIdentifiersOnLoad];
  contactPickerViewController = self->_contactPickerViewController;

  [(CNContactPickerViewController *)contactPickerViewController setHidesSearchableSources:1];
}

- (void)createSettingsShowSelectedPickerView
{
  [(CNContactPickerViewController *)self->_contactPickerViewController setLimitedAccessContactSelection:self->_selectedIdentifiersOnLoad];
  [(CNLimitedAccessContactPickerViewController *)self createGenericPickerViewWithMultiSelectSupport:1];
  [(CNContactPickerViewController *)self->_contactPickerViewController setLimitedAccessContactSelection:self->_selectedIdentifiersOnLoad];
  [(CNContactPickerViewController *)self->_contactPickerViewController setHidesSearchableSources:1];
  id v3 = NSString;
  CNContactsUIBundle();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [v6 localizedStringForKey:@"LIMITED_CONTACTS_SELECTED_PROMPT" value:&stru_1ED8AC728 table:@"Localized"];
  id v5 = objc_msgSend(v3, "localizedStringWithFormat:", v4, -[NSSet count](self->_selectedIdentifiersOnLoad, "count"));
  [(CNContactPickerViewController *)self->_contactPickerViewController setPrompt:v5];
}

- (void)createDeltaEditSelectedPickerView
{
  [(CNLimitedAccessContactPickerViewController *)self createGenericPickerViewWithMultiSelectSupport:1];
  id v3 = NSString;
  CNContactsUIBundle();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [v6 localizedStringForKey:@"LIMITED_PICKER_PRIVACY-%@" value:&stru_1ED8AC728 table:@"Localized"];
  id v5 = objc_msgSend(v3, "stringWithFormat:", v4, self->_appName);
  [(CNContactPickerViewController *)self->_contactPickerViewController setPrompt:v5];
}

- (void)createOOPEditSelectedPickerView
{
  [(CNLimitedAccessContactPickerViewController *)self createGenericPickerViewWithMultiSelectSupport:1];
  id v3 = NSString;
  id v4 = CNContactsUIBundle();
  id v5 = [v4 localizedStringForKey:@"LIMITED_PICKER_PRIVACY-%@" value:&stru_1ED8AC728 table:@"Localized"];
  id v6 = objc_msgSend(v3, "stringWithFormat:", v5, self->_appName);
  [(CNContactPickerViewController *)self->_contactPickerViewController setPrompt:v6];

  contactPickerViewController = self->_contactPickerViewController;

  [(CNContactPickerViewController *)contactPickerViewController setHasPickerPrivacyUI:1];
}

- (void)doLimitedWithNoContacts
{
  id v3 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_18B625000, v3, OS_LOG_TYPE_INFO, "Limited picker select contacts later", v4, 2u);
  }

  [(CNContactPickerViewController *)self->_contactPickerViewController pickerDidSelectContactsLater];
  [(CNLimitedAccessContactPickerViewController *)self callDelegateWithSelectedContactList:MEMORY[0x1E4F1CBF0]];
}

- (void)handleLaterTapped
{
  if ([(NSSet *)self->_selectedIdentifiersInActivePicker count])
  {
    id v3 = CNContactsUIBundle();
    id v4 = [v3 localizedStringForKey:@"LIMITED_PICKER_CANCEL_WARNING_TITLE" value:&stru_1ED8AC728 table:@"Localized"];

    id v5 = NSString;
    id v6 = CNContactsUIBundle();
    uint64_t v7 = [v6 localizedStringForKey:@"LIMITED_PICKER_CANCEL_WARNING_MESSAGE-%@" value:&stru_1ED8AC728 table:@"Localized"];
    uint64_t v8 = objc_msgSend(v5, "stringWithFormat:", v7, self->_appName);

    id v9 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v4 message:v8 preferredStyle:1];
    uint64_t v10 = (void *)MEMORY[0x1E4FB1410];
    id v11 = CNContactsUIBundle();
    id v12 = [v11 localizedStringForKey:@"CANCEL" value:&stru_1ED8AC728 table:@"Localized"];
    uint64_t v13 = [v10 actionWithTitle:v12 style:1 handler:&__block_literal_global_116_57289];
    [v9 addAction:v13];

    NSUInteger v14 = (void *)MEMORY[0x1E4FB1410];
    v15 = CNContactsUIBundle();
    v16 = [v15 localizedStringForKey:@"LIMITED_PICKER_CANCEL_SELECT_LATER" value:&stru_1ED8AC728 table:@"Localized"];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __63__CNLimitedAccessContactPickerViewController_handleLaterTapped__block_invoke_2;
    v18[3] = &unk_1E549B590;
    void v18[4] = self;
    id v17 = [v14 actionWithTitle:v16 style:0 handler:v18];
    [v9 addAction:v17];

    [(CNLimitedAccessContactPickerViewController *)self presentViewController:v9 animated:1 completion:0];
  }
  else
  {
    [(CNLimitedAccessContactPickerViewController *)self doLimitedWithNoContacts];
  }
}

uint64_t __63__CNLimitedAccessContactPickerViewController_handleLaterTapped__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) doLimitedWithNoContacts];
}

- (void)handleContinueTapped
{
  id v2 = [(CNContactPickerViewController *)self->_contactPickerViewController navigationController];
  [v2 didFinishLimitedAccessSelection];
}

- (void)setupOnboardingFooterConstraints
{
  v36[9] = *MEMORY[0x1E4F143B8];
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A258] + 16))() & 1) == 0) {
    [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_onboardingConstraints];
  }
  v34 = [(UIButton *)self->_onboardingContinueButton topAnchor];
  v35 = [(UIView *)self->_footerView layoutMarginsGuide];
  v33 = [v35 topAnchor];
  v32 = [v34 constraintEqualToAnchor:v33 constant:10.0];
  v36[0] = v32;
  v30 = [(UIButton *)self->_onboardingContinueButton leadingAnchor];
  v31 = [(UIView *)self->_footerView layoutMarginsGuide];
  v29 = [v31 leadingAnchor];
  v28 = [v30 constraintEqualToAnchor:v29 constant:20.0];
  v36[1] = v28;
  id v26 = [(UIButton *)self->_onboardingContinueButton trailingAnchor];
  v27 = [(UIView *)self->_footerView layoutMarginsGuide];
  v25 = [v27 trailingAnchor];
  v24 = [v26 constraintEqualToAnchor:v25 constant:-20.0];
  v36[2] = v24;
  v23 = [(UIButton *)self->_onboardingContinueButton heightAnchor];
  v22 = [v23 constraintEqualToConstant:50.0];
  v36[3] = v22;
  v20 = [(UIButton *)self->_onboardingLaterButton leadingAnchor];
  id v21 = [(UIView *)self->_footerView layoutMarginsGuide];
  id v19 = [v21 leadingAnchor];
  id v18 = [v20 constraintEqualToAnchor:v19 constant:20.0];
  v36[4] = v18;
  v16 = [(UIButton *)self->_onboardingLaterButton trailingAnchor];
  id v17 = [(UIView *)self->_footerView layoutMarginsGuide];
  v15 = [v17 trailingAnchor];
  NSUInteger v14 = [v16 constraintEqualToAnchor:v15 constant:-20.0];
  v36[5] = v14;
  id v3 = [(UIButton *)self->_onboardingLaterButton topAnchor];
  id v4 = [(UIButton *)self->_onboardingContinueButton bottomAnchor];
  id v5 = [v3 constraintEqualToAnchor:v4 constant:4.0];
  v36[6] = v5;
  id v6 = [(UIButton *)self->_onboardingLaterButton heightAnchor];
  uint64_t v7 = [v6 constraintEqualToConstant:50.0];
  v36[7] = v7;
  uint64_t v8 = [(UIView *)self->_footerView layoutMarginsGuide];
  id v9 = [v8 bottomAnchor];
  uint64_t v10 = [(UIButton *)self->_onboardingLaterButton bottomAnchor];
  id v11 = [v9 constraintEqualToAnchor:v10];
  v36[8] = v11;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:9];
  onboardingConstraints = self->_onboardingConstraints;
  self->_onboardingConstraints = v12;

  [MEMORY[0x1E4F28DC8] activateConstraints:self->_onboardingConstraints];
}

- (void)createOnboardingFooterView
{
  id v3 = [MEMORY[0x1E4FB08E0] systemFontOfSize:18.0 weight:*MEMORY[0x1E4FB09E0]];
  [(CNLimitedAccessContactPickerViewController *)self createGenericFooterView];
  id v4 = (UIButton *)objc_alloc_init(MEMORY[0x1E4FB14D0]);
  onboardingContinueButton = self->_onboardingContinueButton;
  self->_onboardingContinueButton = v4;

  id v6 = [MEMORY[0x1E4FB14D8] filledButtonConfiguration];
  uint64_t v7 = CNContactsUIBundle();
  uint64_t v8 = [v7 localizedStringForKey:@"LIMITED_PICKER_CONTINUE" value:&stru_1ED8AC728 table:@"Localized"];
  [v6 setTitle:v8];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __72__CNLimitedAccessContactPickerViewController_createOnboardingFooterView__block_invoke;
  v22[3] = &unk_1E549ACB0;
  id v9 = v3;
  id v23 = v9;
  [v6 setTitleTextAttributesTransformer:v22];
  uint64_t v10 = [v6 background];
  [v10 setCornerRadius:14.0];

  [v6 setCornerStyle:-1];
  [(UIButton *)self->_onboardingContinueButton setConfiguration:v6];
  [(UIButton *)self->_onboardingContinueButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIButton *)self->_onboardingContinueButton addTarget:self action:sel_handleContinueTapped forControlEvents:64];
  [(UIView *)self->_footerView addSubview:self->_onboardingContinueButton];
  id v11 = (UIButton *)objc_alloc_init(MEMORY[0x1E4FB14D0]);
  onboardingLaterButton = self->_onboardingLaterButton;
  self->_onboardingLaterButton = v11;

  uint64_t v13 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];

  NSUInteger v14 = CNContactsUIBundle();
  v15 = [v14 localizedStringForKey:@"LIMITED_PICKER_LATER" value:&stru_1ED8AC728 table:@"Localized"];
  [v13 setTitle:v15];

  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  id v19 = __72__CNLimitedAccessContactPickerViewController_createOnboardingFooterView__block_invoke_2;
  v20 = &unk_1E549ACB0;
  id v21 = v9;
  id v16 = v9;
  [v13 setTitleTextAttributesTransformer:&v17];
  -[UIButton setConfiguration:](self->_onboardingLaterButton, "setConfiguration:", v13, v17, v18, v19, v20);
  [(UIButton *)self->_onboardingLaterButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIButton *)self->_onboardingLaterButton addTarget:self action:sel_handleLaterTapped forControlEvents:64];
  [(UIView *)self->_footerView addSubview:self->_onboardingLaterButton];
}

id __72__CNLimitedAccessContactPickerViewController_createOnboardingFooterView__block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)[a2 mutableCopy];
  [v3 setObject:*(void *)(a1 + 32) forKeyedSubscript:*MEMORY[0x1E4FB06F8]];

  return v3;
}

id __72__CNLimitedAccessContactPickerViewController_createOnboardingFooterView__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (void *)[a2 mutableCopy];
  [v3 setObject:*(void *)(a1 + 32) forKeyedSubscript:*MEMORY[0x1E4FB06F8]];

  return v3;
}

- (void)createOnboardingHeaderView
{
  v26[4] = *MEMORY[0x1E4F143B8];
  id v3 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  headerView = self->_headerView;
  self->_headerView = v3;

  [(UIView *)self->_headerView setClipsToBounds:1];
  [(UIView *)self->_headerView setTranslatesAutoresizingMaskIntoConstraints:0];
  id v5 = (UIButton *)objc_alloc_init(MEMORY[0x1E4FB14D0]);
  onboardingShowSelectedButton = self->_onboardingShowSelectedButton;
  self->_onboardingShowSelectedButton = v5;

  v25 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
  uint64_t v7 = NSString;
  uint64_t v8 = CNContactsUIBundle();
  id v9 = [v8 localizedStringForKey:@"LIMITED_CONTACTS_ONBOARDING_SELECTED" value:&stru_1ED8AC728 table:@"Localized"];
  uint64_t v10 = objc_msgSend(v7, "localizedStringWithFormat:", v9, 0);
  [v25 setTitle:v10];

  id v11 = [MEMORY[0x1E4FB1618] labelColor];
  [v25 setBaseForegroundColor:v11];

  [v25 setTitleTextAttributesTransformer:&__block_literal_global_89_57307];
  [(UIButton *)self->_onboardingShowSelectedButton setConfiguration:v25];
  [(UIButton *)self->_onboardingShowSelectedButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIButton *)self->_onboardingShowSelectedButton addTarget:self action:sel_handleShowSelectedTapped forControlEvents:64];
  [(UIView *)self->_headerView addSubview:self->_onboardingShowSelectedButton];
  v24 = [(UIButton *)self->_onboardingShowSelectedButton topAnchor];
  id v23 = [(UIView *)self->_headerView topAnchor];
  v22 = [v24 constraintEqualToAnchor:v23 constant:3.0];
  v26[0] = v22;
  id v21 = [(UIButton *)self->_onboardingShowSelectedButton leadingAnchor];
  id v12 = [(UIView *)self->_headerView leadingAnchor];
  uint64_t v13 = [v21 constraintEqualToAnchor:v12 constant:20.0];
  v26[1] = v13;
  NSUInteger v14 = [(UIButton *)self->_onboardingShowSelectedButton trailingAnchor];
  v15 = [(UIView *)self->_headerView trailingAnchor];
  id v16 = [v14 constraintEqualToAnchor:v15 constant:-20.0];
  v26[2] = v16;
  uint64_t v17 = [(UIButton *)self->_onboardingShowSelectedButton heightAnchor];
  uint64_t v18 = [(UIView *)self->_headerView heightAnchor];
  id v19 = [v17 constraintEqualToAnchor:v18];
  v26[3] = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:4];

  [MEMORY[0x1E4F28DC8] activateConstraints:v20];
}

id __72__CNLimitedAccessContactPickerViewController_createOnboardingHeaderView__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)[a2 mutableCopy];
  id v3 = [MEMORY[0x1E4FB08E0] systemFontOfSize:13.0 weight:*MEMORY[0x1E4FB09D8]];
  [v2 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4FB06F8]];

  return v2;
}

- (void)createOnboardingPickerView
{
  [(CNLimitedAccessContactPickerViewController *)self createGenericPickerViewWithMultiSelectSupport:1];
  contactPickerViewController = self->_contactPickerViewController;

  [(CNContactPickerViewController *)contactPickerViewController setPrompt:&stru_1ED8AC728];
}

- (id)initForAppName:(id)a3 bundleId:(id)a4 pickerType:(int)a5 selectedContacts:(id)a6 searchText:(id)a7 caption:(unint64_t)a8
{
  v126[3] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  v121.receiver = self;
  v121.super_class = (Class)CNLimitedAccessContactPickerViewController;
  uint64_t v18 = [(CNLimitedAccessContactPickerViewController *)&v121 initWithNibName:0 bundle:0];
  if (v18)
  {
    id v117 = v16;
    char v19 = (*(uint64_t (**)(void))(*MEMORY[0x1E4F5A2A0] + 16))();
    id v119 = v14;
    if ((v19 & 1) == 0)
    {
      id v14 = +[CNLimitedAccessPickerSupport appNameForBundleId:v15];
    }
    objc_storeStrong((id *)&v18->_appName, v14);
    if ((v19 & 1) == 0) {

    }
    objc_storeStrong((id *)&v18->_appBundleId, a4);
    objc_storeStrong((id *)&v18->_selectedIdentifiersOnLoad, a6);
    v18->_pickerType = a5;
    objc_storeStrong((id *)&v18->_initalSearchText, a7);
    v18->_caption = a8;
    switch(a5)
    {
      case 0:
        [(CNLimitedAccessContactPickerViewController *)v18 createGenericPickerViewWithMultiSelectSupport:1];
        break;
      case 1:
        [(CNLimitedAccessContactPickerViewController *)v18 createOnboardingPickerView];
        [(CNLimitedAccessContactPickerViewController *)v18 createOnboardingHeaderView];
        [(CNLimitedAccessContactPickerViewController *)v18 createOnboardingFooterView];
        break;
      case 2:
        [(CNLimitedAccessContactPickerViewController *)v18 createShowSelectedPickerView];
        [(CNLimitedAccessContactPickerViewController *)v18 createShowSelectedFooterView];
        break;
      case 3:
        [(CNLimitedAccessContactPickerViewController *)v18 createOOPEditSelectedPickerView];
        [(CNLimitedAccessContactPickerViewController *)v18 createManageOOPFooterView];
        break;
      case 4:
        [(CNLimitedAccessContactPickerViewController *)v18 createDeltaEditSelectedPickerView];
        [(CNLimitedAccessContactPickerViewController *)v18 createDeltaFooterView];
        break;
      case 5:
        [(CNLimitedAccessContactPickerViewController *)v18 createSettingsShowSelectedPickerView];
        break;
      case 6:
        [(CNLimitedAccessContactPickerViewController *)v18 createContactsAvailableToSelectPickerView];
        break;
      default:
        break;
    }
    id v116 = v17;
    id v118 = v15;
    v20 = [(CNContactPickerViewController *)v18->_contactPickerViewController view];
    [v20 setTranslatesAutoresizingMaskIntoConstraints:0];

    [(CNLimitedAccessContactPickerViewController *)v18 addChildViewController:v18->_contactPickerViewController];
    id v21 = [(CNLimitedAccessContactPickerViewController *)v18 view];
    v22 = [(CNContactPickerViewController *)v18->_contactPickerViewController view];
    [v21 addSubview:v22];

    if (a5 != 4) {
      [(CNContactPickerViewController *)v18->_contactPickerViewController didMoveToParentViewController:v18];
    }
    v95 = (void *)MEMORY[0x1E4F28DC8];
    v113 = [(CNContactPickerViewController *)v18->_contactPickerViewController view];
    v107 = [v113 widthAnchor];
    v110 = [(CNLimitedAccessContactPickerViewController *)v18 view];
    v104 = [v110 widthAnchor];
    v101 = [v107 constraintEqualToAnchor:v104];
    v126[0] = v101;
    v98 = [(CNContactPickerViewController *)v18->_contactPickerViewController view];
    v92 = [v98 leadingAnchor];
    id v23 = [(CNLimitedAccessContactPickerViewController *)v18 view];
    v24 = [v23 leadingAnchor];
    v25 = [v92 constraintEqualToAnchor:v24];
    v126[1] = v25;
    id v26 = [(CNContactPickerViewController *)v18->_contactPickerViewController view];
    v27 = [v26 trailingAnchor];
    v28 = [(CNLimitedAccessContactPickerViewController *)v18 view];
    v29 = [v28 trailingAnchor];
    v30 = [v27 constraintEqualToAnchor:v29];
    v126[2] = v30;
    v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v126 count:3];
    [v95 activateConstraints:v31];

    if (v18->_headerView)
    {
      v32 = [(CNLimitedAccessContactPickerViewController *)v18 view];
      [v32 addSubview:v18->_headerView];

      v102 = (void *)MEMORY[0x1E4F28DC8];
      v96 = [(UIView *)v18->_headerView widthAnchor];
      v114 = [(CNLimitedAccessContactPickerViewController *)v18 view];
      uint64_t v108 = [v114 widthAnchor];
      uint64_t v99 = [v96 constraintEqualToAnchor:v108];
      v125[0] = v99;
      v86 = [(UIView *)v18->_headerView leadingAnchor];
      v82 = [(CNLimitedAccessContactPickerViewController *)v18 view];
      v111 = [v82 leadingAnchor];
      v105 = [v86 constraintEqualToAnchor:v111];
      v125[1] = v105;
      v90 = [(UIView *)v18->_headerView trailingAnchor];
      v93 = [(CNLimitedAccessContactPickerViewController *)v18 view];
      v88 = [v93 trailingAnchor];
      v84 = [v90 constraintEqualToAnchor:v88];
      v125[2] = v84;
      v80 = [(UIView *)v18->_headerView topAnchor];
      v33 = [(CNLimitedAccessContactPickerViewController *)v18 view];
      v34 = [v33 topAnchor];
      v35 = [v80 constraintEqualToAnchor:v34];
      v125[3] = v35;
      v36 = [(CNContactPickerViewController *)v18->_contactPickerViewController view];
      v37 = [v36 topAnchor];
      v38 = [(CNLimitedAccessContactPickerViewController *)v18 view];
      v39 = [v38 topAnchor];
      v40 = [v37 constraintEqualToAnchor:v39];
      v125[4] = v40;
      v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v125 count:5];
      [v102 activateConstraints:v41];

      v42 = v82;
      v43 = v96;

      v44 = v86;
      v45 = (void *)v99;

      v46 = v114;
      v47 = (void *)v108;
    }
    else
    {
      v48 = (void *)MEMORY[0x1E4F28DC8];
      v43 = [(CNContactPickerViewController *)v18->_contactPickerViewController view];
      v46 = [v43 topAnchor];
      v47 = [(CNLimitedAccessContactPickerViewController *)v18 view];
      v45 = [v47 topAnchor];
      v44 = [v46 constraintEqualToAnchor:v45];
      v124 = v44;
      v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v124 count:1];
      [v48 activateConstraints:v42];
    }

    if (v18->_footerView)
    {
      v49 = [(CNLimitedAccessContactPickerViewController *)v18 view];
      [v49 addSubview:v18->_footerView];

      v94 = (void *)MEMORY[0x1E4F28DC8];
      v97 = [(UIView *)v18->_footerView widthAnchor];
      v91 = [(CNLimitedAccessContactPickerViewController *)v18 view];
      uint64_t v85 = [v91 widthAnchor];
      v115 = [v97 constraintEqualToAnchor:v85];
      v123[0] = v115;
      v50 = [(UIView *)v18->_footerView leadingAnchor];
      v83 = [(CNLimitedAccessContactPickerViewController *)v18 view];
      v109 = [v83 leadingAnchor];
      v112 = v50;
      v106 = [v50 constraintEqualToAnchor:v109];
      v123[1] = v106;
      v100 = [(UIView *)v18->_footerView trailingAnchor];
      v103 = [(CNLimitedAccessContactPickerViewController *)v18 view];
      v89 = [v103 trailingAnchor];
      v87 = [v100 constraintEqualToAnchor:v89];
      v123[2] = v87;
      v81 = [(UIView *)v18->_footerView topAnchor];
      v120 = [(CNContactPickerViewController *)v18->_contactPickerViewController view];
      v79 = [v120 bottomAnchor];
      v78 = [v81 constraintEqualToAnchor:v79];
      v123[3] = v78;
      v76 = [(UIView *)v18->_footerView bottomAnchor];
      v77 = [(CNLimitedAccessContactPickerViewController *)v18 view];
      v75 = [v77 bottomAnchor];
      v51 = [v76 constraintEqualToAnchor:v75];
      v123[4] = v51;
      v52 = [(UIView *)v18->_footerView layoutMarginsGuide];
      v53 = [v52 bottomAnchor];
      v54 = [(CNLimitedAccessContactPickerViewController *)v18 view];
      v55 = [v54 layoutMarginsGuide];
      v56 = [v55 bottomAnchor];
      v57 = [v53 constraintEqualToAnchor:v56];
      v123[5] = v57;
      v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:v123 count:6];
      [v94 activateConstraints:v58];

      v59 = (void *)v85;
      v60 = v91;

      v61 = v83;
      v62 = v97;
    }
    else
    {
      v63 = (void *)MEMORY[0x1E4F28DC8];
      v62 = [(CNContactPickerViewController *)v18->_contactPickerViewController view];
      v60 = [v62 bottomAnchor];
      v59 = [(CNLimitedAccessContactPickerViewController *)v18 view];
      v115 = [v59 bottomAnchor];
      v112 = objc_msgSend(v60, "constraintEqualToAnchor:");
      v122 = v112;
      uint64_t v64 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v122 count:1];
      v65 = v63;
      v61 = (void *)v64;
      [v65 activateConstraints:v64];
    }
    id v15 = v118;
    id v14 = v119;
    id v17 = v116;
    id v16 = v117;

    if (v18->_footerViewBorder)
    {
      [(UIView *)v18->_footerView bounds];
      double v67 = v66;
      double v69 = v68;
      double v71 = v70;
      -[CAShapeLayer setFrame:](v18->_footerViewBorder, "setFrame:");
      objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRect:", v67, v69, v71, 0.0);
      id v72 = objc_claimAutoreleasedReturnValue();
      -[CAShapeLayer setPath:](v18->_footerViewBorder, "setPath:", [v72 CGPath]);
    }
    [(CNLimitedAccessContactPickerViewController *)v18 registerForTraitChanges];
    v73 = v18;
  }

  return v18;
}

- (id)initPickerWithContactsAvailableToAddForAppName:(id)a3 bundleId:(id)a4 searchText:(id)a5 caption:(unint64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = +[CNLimitedAccessPickerSupport allowedIdentifiersForBundleID:v11];
  id v14 = [(CNLimitedAccessContactPickerViewController *)self initForAppName:v12 bundleId:v11 pickerType:6 selectedContacts:v13 searchText:v10 caption:a6];

  return v14;
}

- (id)initSettingsPickerForAppName:(id)a3 bundleId:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = +[CNLimitedAccessPickerSupport allowedIdentifiersForBundleID:v6];
  id v9 = [(CNLimitedAccessContactPickerViewController *)self initForAppName:v7 bundleId:v6 pickerType:5 selectedContacts:v8 searchText:0 caption:0];

  return v9;
}

- (id)initDeltaPickerForAppName:(id)a3 bundleId:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = +[CNLimitedAccessPickerSupport allowedIdentifiersForBundleID:v6];
  id v9 = [(CNLimitedAccessContactPickerViewController *)self initForAppName:v7 bundleId:v6 pickerType:4 selectedContacts:v8 searchText:0 caption:0];

  return v9;
}

- (id)initForAppName:(id)a3 bundleId:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = +[CNLimitedAccessPickerSupport allowedIdentifiersForBundleID:v6];
  id v9 = [(CNLimitedAccessContactPickerViewController *)self initForAppName:v7 bundleId:v6 pickerType:3 selectedContacts:v8 searchText:0 caption:0];

  return v9;
}

- (id)initForShowSelected:(id)a3
{
  id v4 = [MEMORY[0x1E4F1CAD0] setWithArray:a3];
  id v5 = [(CNLimitedAccessContactPickerViewController *)self initForAppName:&stru_1ED8AC728 bundleId:&stru_1ED8AC728 pickerType:2 selectedContacts:v4 searchText:0 caption:0];

  return v5;
}

- (id)initForOnboarding:(id)a3 bundleId:(id)a4 selectedContacts:(id)a5
{
  uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
  id v9 = a4;
  id v10 = a3;
  id v11 = [v8 setWithArray:a5];
  id v12 = [(CNLimitedAccessContactPickerViewController *)self initForAppName:v10 bundleId:v9 pickerType:1 selectedContacts:v11 searchText:0 caption:0];

  return v12;
}

- (id)initForOnboarding:(id)a3 selectedContacts:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  id v7 = a3;
  uint64_t v8 = [v6 setWithArray:a4];
  id v9 = [(CNLimitedAccessContactPickerViewController *)self initForAppName:v7 bundleId:&stru_1ED8AC728 pickerType:1 selectedContacts:v8 searchText:0 caption:0];

  return v9;
}

+ (id)log
{
  if (log_cn_once_token_1_57315 != -1) {
    dispatch_once(&log_cn_once_token_1_57315, &__block_literal_global_57316);
  }
  id v2 = (void *)log_cn_once_object_1_57317;

  return v2;
}

void __49__CNLimitedAccessContactPickerViewController_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contacts.ui", "CNLimitedAccessContactPickerViewController");
  v1 = (void *)log_cn_once_object_1_57317;
  log_cn_once_object_1_57317 = (uint64_t)v0;
}

@end