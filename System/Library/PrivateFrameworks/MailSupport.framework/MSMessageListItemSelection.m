@interface MSMessageListItemSelection
- (BOOL)isActingOnSender;
- (BOOL)isSelectAll;
- (MSMessageListItemSelection)initWithMailboxes:(id)a3 excludedMessageListItems:(id)a4;
- (MSMessageListItemSelection)initWithMessageListItems:(id)a3;
- (NSArray)mailboxes;
- (NSArray)messageListItems;
@end

@implementation MSMessageListItemSelection

- (MSMessageListItemSelection)initWithMessageListItems:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MSMessageListItemSelection;
  v6 = [(MSMessageListItemSelection *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_messageListItems, a3);
    v7->_isSelectAll = 0;
    v7->_actingOnSender = objc_msgSend(v5, "ef_any:", &__block_literal_global_6);
  }

  return v7;
}

uint64_t __55__MSMessageListItemSelection_initWithMessageListItems___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (MSMessageListItemSelection)initWithMailboxes:(id)a3 excludedMessageListItems:(id)a4
{
  id v7 = a3;
  v8 = [(MSMessageListItemSelection *)self initWithMessageListItems:a4];
  objc_super v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_mailboxes, a3);
    v9->_isSelectAll = 1;
  }

  return v9;
}

- (NSArray)messageListItems
{
  return self->_messageListItems;
}

- (NSArray)mailboxes
{
  return self->_mailboxes;
}

- (BOOL)isSelectAll
{
  return self->_isSelectAll;
}

- (BOOL)isActingOnSender
{
  return self->_actingOnSender;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailboxes, 0);
  objc_storeStrong((id *)&self->_messageListItems, 0);
}

@end