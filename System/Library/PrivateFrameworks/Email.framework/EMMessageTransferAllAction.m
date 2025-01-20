@interface EMMessageTransferAllAction
+ (BOOL)supportsSecureCoding;
- (EMMessageTransferAllAction)initWithCoder:(id)a3;
- (EMMessageTransferAllAction)initWithMailboxes:(id)a3 messageListItemsToExclude:(id)a4 destinationMailbox:(id)a5 copyMessages:(BOOL)a6 origin:(int64_t)a7 actor:(int64_t)a8;
- (EMMessageTransferAllAction)initWithMailboxes:(id)a3 messageListItemsToExclude:(id)a4 specialDestinationMailboxType:(int64_t)a5 flagChange:(id)a6 copyMessages:(BOOL)a7 origin:(int64_t)a8 actor:(int64_t)a9;
- (NSArray)mailboxObjectIDs;
- (int64_t)signpostType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation EMMessageTransferAllAction

- (EMMessageTransferAllAction)initWithMailboxes:(id)a3 messageListItemsToExclude:(id)a4 destinationMailbox:(id)a5 copyMessages:(BOOL)a6 origin:(int64_t)a7 actor:(int64_t)a8
{
  BOOL v10 = a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  v21.receiver = self;
  v21.super_class = (Class)EMMessageTransferAllAction;
  v17 = [(EMMessageTransferAction *)&v21 initWithMessageListItems:v15 origin:a7 actor:a8 destinationMailbox:v16 copyMessages:v10];
  if (v17)
  {
    uint64_t v18 = objc_msgSend(v14, "ef_mapSelector:", sel_objectID);
    mailboxObjectIDs = v17->_mailboxObjectIDs;
    v17->_mailboxObjectIDs = (NSArray *)v18;
  }
  return v17;
}

- (EMMessageTransferAllAction)initWithMailboxes:(id)a3 messageListItemsToExclude:(id)a4 specialDestinationMailboxType:(int64_t)a5 flagChange:(id)a6 copyMessages:(BOOL)a7 origin:(int64_t)a8 actor:(int64_t)a9
{
  BOOL v10 = a7;
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  v22.receiver = self;
  v22.super_class = (Class)EMMessageTransferAllAction;
  uint64_t v18 = [(EMMessageTransferAction *)&v22 initWithMessageListItems:v16 origin:a8 actor:a9 specialDestinationMailboxType:a5 flagChange:v17 copyMessages:v10];
  if (v18)
  {
    uint64_t v19 = objc_msgSend(v15, "ef_map:", &__block_literal_global_37);
    mailboxObjectIDs = v18->_mailboxObjectIDs;
    v18->_mailboxObjectIDs = (NSArray *)v19;
  }
  return v18;
}

id __141__EMMessageTransferAllAction_initWithMailboxes_messageListItemsToExclude_specialDestinationMailboxType_flagChange_copyMessages_origin_actor___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 objectID];
  return v2;
}

- (int64_t)signpostType
{
  return 9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMMessageTransferAllAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)EMMessageTransferAllAction;
  v5 = [(EMMessageTransferAction *)&v12 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"EFPropertyKey_mailboxObjectIDs"];
    mailboxObjectIDs = v5->_mailboxObjectIDs;
    v5->_mailboxObjectIDs = (NSArray *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)EMMessageTransferAllAction;
  [(EMMessageTransferAction *)&v6 encodeWithCoder:v4];
  v5 = [(EMMessageTransferAllAction *)self mailboxObjectIDs];
  [v4 encodeObject:v5 forKey:@"EFPropertyKey_mailboxObjectIDs"];
}

- (NSArray)mailboxObjectIDs
{
  return self->_mailboxObjectIDs;
}

- (void).cxx_destruct
{
}

@end