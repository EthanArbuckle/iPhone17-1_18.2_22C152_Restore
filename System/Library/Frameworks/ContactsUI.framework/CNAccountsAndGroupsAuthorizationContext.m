@interface CNAccountsAndGroupsAuthorizationContext
- (CNAccountsAndGroupsCell)cell;
- (CNAccountsAndGroupsItem)item;
- (CNContainerPickerItem)containerItem;
- (NSArray)contactsToAddToDropDestination;
- (id)actionCompletionHandler;
- (int64_t)type;
- (void)setActionCompletionHandler:(id)a3;
- (void)setCell:(id)a3;
- (void)setContactsToAddToDropDestination:(id)a3;
- (void)setContainerItem:(id)a3;
- (void)setItem:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation CNAccountsAndGroupsAuthorizationContext

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionCompletionHandler, 0);
  objc_storeStrong((id *)&self->_contactsToAddToDropDestination, 0);
  objc_storeStrong((id *)&self->_cell, 0);
  objc_storeStrong((id *)&self->_containerItem, 0);

  objc_storeStrong((id *)&self->_item, 0);
}

- (void)setActionCompletionHandler:(id)a3
{
}

- (id)actionCompletionHandler
{
  return self->_actionCompletionHandler;
}

- (void)setContactsToAddToDropDestination:(id)a3
{
}

- (NSArray)contactsToAddToDropDestination
{
  return self->_contactsToAddToDropDestination;
}

- (void)setCell:(id)a3
{
}

- (CNAccountsAndGroupsCell)cell
{
  return self->_cell;
}

- (void)setContainerItem:(id)a3
{
}

- (CNContainerPickerItem)containerItem
{
  return self->_containerItem;
}

- (void)setItem:(id)a3
{
}

- (CNAccountsAndGroupsItem)item
{
  return self->_item;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)type
{
  return self->_type;
}

@end