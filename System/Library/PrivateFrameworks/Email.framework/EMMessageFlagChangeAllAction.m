@interface EMMessageFlagChangeAllAction
+ (BOOL)supportsSecureCoding;
- (EMMessageFlagChangeAllAction)initWithCoder:(id)a3;
- (EMMessageFlagChangeAllAction)initWithMailboxes:(id)a3 messageListItemsToExclude:(id)a4 flagChange:(id)a5 origin:(int64_t)a6 actor:(int64_t)a7;
- (NSArray)mailboxObjectIDs;
- (int64_t)signpostType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation EMMessageFlagChangeAllAction

- (EMMessageFlagChangeAllAction)initWithMailboxes:(id)a3 messageListItemsToExclude:(id)a4 flagChange:(id)a5 origin:(int64_t)a6 actor:(int64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v19.receiver = self;
  v19.super_class = (Class)EMMessageFlagChangeAllAction;
  v15 = [(EMMessageFlagChangeAction *)&v19 initWithMessageListItems:v13 origin:a6 actor:a7 flagChange:v14];
  if (v15)
  {
    uint64_t v16 = objc_msgSend(v12, "ef_mapSelector:", sel_objectID);
    mailboxObjectIDs = v15->_mailboxObjectIDs;
    v15->_mailboxObjectIDs = (NSArray *)v16;
  }
  return v15;
}

- (int64_t)signpostType
{
  return 7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMMessageFlagChangeAllAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)EMMessageFlagChangeAllAction;
  v5 = [(EMMessageFlagChangeAction *)&v12 initWithCoder:v4];
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
  v6.super_class = (Class)EMMessageFlagChangeAllAction;
  [(EMMessageFlagChangeAction *)&v6 encodeWithCoder:v4];
  v5 = [(EMMessageFlagChangeAllAction *)self mailboxObjectIDs];
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