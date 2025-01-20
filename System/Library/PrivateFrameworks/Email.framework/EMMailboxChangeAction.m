@interface EMMailboxChangeAction
+ (BOOL)supportsSecureCoding;
- (EMMailboxChangeAction)initWithCoder:(id)a3;
- (EMMailboxChangeAction)initWithMailbox:(id)a3;
- (EMMailboxChangeAction)initWithMailboxObjectID:(id)a3;
- (EMMailboxObjectID)mailboxObjectID;
- (void)encodeWithCoder:(id)a3;
@end

@implementation EMMailboxChangeAction

- (EMMailboxChangeAction)initWithMailbox:(id)a3
{
  v4 = [a3 objectID];
  v5 = [(EMMailboxChangeAction *)self initWithMailboxObjectID:v4];

  return v5;
}

- (EMMailboxChangeAction)initWithMailboxObjectID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EMMailboxChangeAction;
  v6 = [(EMMailboxChangeAction *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_mailboxObjectID, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMMailboxChangeAction)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_mailboxObjectID"];
  v6 = [(EMMailboxChangeAction *)self initWithMailboxObjectID:v5];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(EMMailboxChangeAction *)self mailboxObjectID];
  [v5 encodeObject:v4 forKey:@"EFPropertyKey_mailboxObjectID"];
}

- (EMMailboxObjectID)mailboxObjectID
{
  return self->_mailboxObjectID;
}

- (void).cxx_destruct
{
}

@end