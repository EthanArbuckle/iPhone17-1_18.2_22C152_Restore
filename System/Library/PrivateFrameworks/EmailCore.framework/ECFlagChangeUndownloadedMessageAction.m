@interface ECFlagChangeUndownloadedMessageAction
- (ECFlagChangeUndownloadedMessageAction)initWithBuilder:(id)a3;
- (ECMessageFlagChange)flagChange;
- (NSString)oldestPersistedRemoteID;
- (void)setFlagChange:(id)a3;
- (void)setOldestPersistedRemoteID:(id)a3;
@end

@implementation ECFlagChangeUndownloadedMessageAction

- (ECFlagChangeUndownloadedMessageAction)initWithBuilder:(id)a3
{
  v4 = (void (**)(id, ECFlagChangeUndownloadedMessageAction *))a3;
  v7.receiver = self;
  v7.super_class = (Class)ECFlagChangeUndownloadedMessageAction;
  v5 = [(ECFlagChangeUndownloadedMessageAction *)&v7 init];
  if (v5) {
    v4[2](v4, v5);
  }

  return v5;
}

- (NSString)oldestPersistedRemoteID
{
  return self->_oldestPersistedRemoteID;
}

- (void)setOldestPersistedRemoteID:(id)a3
{
}

- (ECMessageFlagChange)flagChange
{
  return self->_flagChange;
}

- (void)setFlagChange:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flagChange, 0);
  objc_storeStrong((id *)&self->_oldestPersistedRemoteID, 0);
}

@end