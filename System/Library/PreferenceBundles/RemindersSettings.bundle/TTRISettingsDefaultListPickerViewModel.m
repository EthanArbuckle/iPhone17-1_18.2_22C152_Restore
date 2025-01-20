@interface TTRISettingsDefaultListPickerViewModel
- (NSArray)accounts;
- (REMObjectID)selectedListID;
- (void)setAccounts:(id)a3;
- (void)setSelectedListID:(id)a3;
@end

@implementation TTRISettingsDefaultListPickerViewModel

- (NSArray)accounts
{
  return self->_accounts;
}

- (void)setAccounts:(id)a3
{
}

- (REMObjectID)selectedListID
{
  return self->_selectedListID;
}

- (void)setSelectedListID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedListID, 0);

  objc_storeStrong((id *)&self->_accounts, 0);
}

@end