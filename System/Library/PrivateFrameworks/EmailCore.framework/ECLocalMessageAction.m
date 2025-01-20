@interface ECLocalMessageAction
- (BOOL)userInitiated;
- (ECLocalMessageActionID)persistentID;
- (NSString)description;
- (NSURL)mailboxURL;
- (void)setMailboxURL:(id)a3;
- (void)setPersistentID:(id)a3;
- (void)setUserInitiated:(BOOL)a3;
@end

@implementation ECLocalMessageAction

- (NSString)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ECLocalMessageAction;
  v4 = [(ECLocalMessageAction *)&v8 description];
  v5 = [(ECLocalMessageAction *)self persistentID];
  v6 = [v3 stringWithFormat:@"%@ id = %@", v4, v5];

  return (NSString *)v6;
}

- (ECLocalMessageActionID)persistentID
{
  return self->_persistentID;
}

- (void)setPersistentID:(id)a3
{
}

- (NSURL)mailboxURL
{
  return self->_mailboxURL;
}

- (void)setMailboxURL:(id)a3
{
}

- (BOOL)userInitiated
{
  return self->_userInitiated;
}

- (void)setUserInitiated:(BOOL)a3
{
  self->_userInitiated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailboxURL, 0);
  objc_storeStrong((id *)&self->_persistentID, 0);
}

@end