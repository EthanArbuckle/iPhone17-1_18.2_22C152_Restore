@interface ECFlagChangeMessageAction
- (ECFlagChangeMessageAction)initWithBuilder:(id)a3;
- (ECMessageFlagChange)flagChange;
- (NSArray)messages;
- (NSSet)remoteIDs;
- (void)setFlagChange:(id)a3;
- (void)setMessages:(id)a3;
- (void)setRemoteIDs:(id)a3;
@end

@implementation ECFlagChangeMessageAction

- (ECFlagChangeMessageAction)initWithBuilder:(id)a3
{
  v4 = (void (**)(id, ECFlagChangeMessageAction *))a3;
  v7.receiver = self;
  v7.super_class = (Class)ECFlagChangeMessageAction;
  v5 = [(ECFlagChangeMessageAction *)&v7 init];
  if (v5) {
    v4[2](v4, v5);
  }

  return v5;
}

- (NSSet)remoteIDs
{
  return self->_remoteIDs;
}

- (void)setRemoteIDs:(id)a3
{
}

- (NSArray)messages
{
  return self->_messages;
}

- (void)setMessages:(id)a3
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
  objc_storeStrong((id *)&self->_messages, 0);
  objc_storeStrong((id *)&self->_remoteIDs, 0);
}

@end