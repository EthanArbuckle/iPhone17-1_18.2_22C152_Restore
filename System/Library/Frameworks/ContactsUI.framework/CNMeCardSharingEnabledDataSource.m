@interface CNMeCardSharingEnabledDataSource
- (BOOL)sharingEnabled;
- (BOOL)supportsSelection;
- (CNMeCardSharingEnabledDataSource)initWithSharingEnabled:(BOOL)a3;
- (CNMeCardSharingEnabledDelegate)delegate;
- (NSArray)items;
- (UISwitch)enabledSwitch;
- (id)itemForIndex:(unint64_t)a3;
- (id)sectionFooterLabel;
- (id)sectionHeaderLabel;
- (unint64_t)numberOfItems;
- (void)buildItems;
- (void)didToggleEnabledSwitch:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnabledSwitch:(id)a3;
- (void)setItems:(id)a3;
- (void)setSharingEnabled:(BOOL)a3;
@end

@implementation CNMeCardSharingEnabledDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_enabledSwitch, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setItems:(id)a3
{
}

- (NSArray)items
{
  return self->_items;
}

- (void)setEnabledSwitch:(id)a3
{
}

- (UISwitch)enabledSwitch
{
  return self->_enabledSwitch;
}

- (BOOL)sharingEnabled
{
  return self->_sharingEnabled;
}

- (void)setDelegate:(id)a3
{
}

- (CNMeCardSharingEnabledDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNMeCardSharingEnabledDelegate *)WeakRetained;
}

- (void)didToggleEnabledSwitch:(id)a3
{
  self->_sharingEnabled = [(UISwitch *)self->_enabledSwitch isOn];
  id v4 = [(CNMeCardSharingEnabledDataSource *)self delegate];
  [v4 sharingEnabledDataSource:self didChangeEnabledState:self->_sharingEnabled];
}

- (id)itemForIndex:(unint64_t)a3
{
  return [(NSArray *)self->_items objectAtIndexedSubscript:a3];
}

- (unint64_t)numberOfItems
{
  return [(NSArray *)self->_items count];
}

- (id)sectionFooterLabel
{
  return 0;
}

- (id)sectionHeaderLabel
{
  return 0;
}

- (void)buildItems
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v3 = [CNMeCardSharingRowItem alloc];
  id v4 = CNContactsUIBundle();
  v5 = [v4 localizedStringForKey:@"SHARING_ENABLED_LABEL" value:&stru_1ED8AC728 table:@"Localized"];
  v6 = [(CNMeCardSharingRowItem *)v3 initWithLabel:v5 accessoryView:self->_enabledSwitch];
  v9[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  items = self->_items;
  self->_items = v7;
}

- (BOOL)supportsSelection
{
  return 0;
}

- (void)setSharingEnabled:(BOOL)a3
{
  if (self->_sharingEnabled != a3)
  {
    self->_sharingEnabled = a3;
    -[UISwitch setOn:](self->_enabledSwitch, "setOn:");
  }
}

- (CNMeCardSharingEnabledDataSource)initWithSharingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNMeCardSharingEnabledDataSource;
  id v4 = [(CNMeCardSharingEnabledDataSource *)&v10 init];
  v5 = v4;
  if (v4)
  {
    v4->_sharingEnabled = v3;
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1CD0]), "initWithFrame:", 0.0, 0.0, 50.0, 50.0);
    enabledSwitch = v5->_enabledSwitch;
    v5->_enabledSwitch = (UISwitch *)v6;

    [(UISwitch *)v5->_enabledSwitch setOn:v3];
    [(UISwitch *)v5->_enabledSwitch addTarget:v5 action:sel_didToggleEnabledSwitch_ forControlEvents:4096];
    [(CNMeCardSharingEnabledDataSource *)v5 buildItems];
    v8 = v5;
  }

  return v5;
}

@end