@interface ECLabelChangeMessageAction
- (ECLabelChangeMessageAction)initWithBuilder:(id)a3;
- (NSArray)messages;
- (NSSet)labelsToAdd;
- (NSSet)labelsToRemove;
- (NSSet)remoteIDs;
- (void)setLabelsToAdd:(id)a3;
- (void)setLabelsToRemove:(id)a3;
- (void)setMessages:(id)a3;
- (void)setRemoteIDs:(id)a3;
@end

@implementation ECLabelChangeMessageAction

- (ECLabelChangeMessageAction)initWithBuilder:(id)a3
{
  v4 = (void (**)(id, ECLabelChangeMessageAction *))a3;
  v7.receiver = self;
  v7.super_class = (Class)ECLabelChangeMessageAction;
  v5 = [(ECLabelChangeMessageAction *)&v7 init];
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

- (NSSet)labelsToAdd
{
  return self->_labelsToAdd;
}

- (void)setLabelsToAdd:(id)a3
{
}

- (NSSet)labelsToRemove
{
  return self->_labelsToRemove;
}

- (void)setLabelsToRemove:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelsToRemove, 0);
  objc_storeStrong((id *)&self->_labelsToAdd, 0);
  objc_storeStrong((id *)&self->_messages, 0);
  objc_storeStrong((id *)&self->_remoteIDs, 0);
}

@end