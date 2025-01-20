@interface EMMessageDeleteAllAction
+ (BOOL)supportsSecureCoding;
- (EMMessageDeleteAllAction)initWithCoder:(id)a3;
- (EMMessageDeleteAllAction)initWithMailboxes:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 messageListItemsToExclude:(id)a6;
- (NSArray)mailboxObjectIDs;
- (int64_t)signpostType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation EMMessageDeleteAllAction

- (EMMessageDeleteAllAction)initWithMailboxes:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 messageListItemsToExclude:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v16.receiver = self;
  v16.super_class = (Class)EMMessageDeleteAllAction;
  v12 = [(EMMessageChangeAction *)&v16 initWithMessageListItems:v11 origin:a4 actor:a5];
  if (v12)
  {
    uint64_t v13 = objc_msgSend(v10, "ef_mapSelector:", sel_objectID);
    mailboxObjectIDs = v12->_mailboxObjectIDs;
    v12->_mailboxObjectIDs = (NSArray *)v13;
  }
  return v12;
}

- (int64_t)signpostType
{
  return 5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMMessageDeleteAllAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)EMMessageDeleteAllAction;
  v5 = [(EMMessageChangeAction *)&v12 initWithCoder:v4];
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
  v6.super_class = (Class)EMMessageDeleteAllAction;
  [(EMMessageChangeAction *)&v6 encodeWithCoder:v4];
  v5 = [(EMMessageDeleteAllAction *)self mailboxObjectIDs];
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