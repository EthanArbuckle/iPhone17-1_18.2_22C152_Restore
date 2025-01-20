@interface ECTransferMessageActionItem
- (ECMessage)destinationMessage;
- (ECMessage)sourceMessage;
- (ECTransferMessageActionItem)init;
- (ECTransferMessageActionItem)initWithBuilder:(id)a3;
- (NSString)sourceRemoteID;
- (void)setDestinationMessage:(id)a3;
- (void)setSourceMessage:(id)a3;
- (void)setSourceRemoteID:(id)a3;
@end

@implementation ECTransferMessageActionItem

- (ECTransferMessageActionItem)initWithBuilder:(id)a3
{
  v4 = (void (**)(id, ECTransferMessageActionItem *))a3;
  v7.receiver = self;
  v7.super_class = (Class)ECTransferMessageActionItem;
  v5 = [(ECTransferMessageActionItem *)&v7 init];
  if (v5) {
    v4[2](v4, v5);
  }

  return v5;
}

- (ECTransferMessageActionItem)init
{
}

- (NSString)sourceRemoteID
{
  return self->_sourceRemoteID;
}

- (void)setSourceRemoteID:(id)a3
{
}

- (ECMessage)sourceMessage
{
  return self->_sourceMessage;
}

- (void)setSourceMessage:(id)a3
{
}

- (ECMessage)destinationMessage
{
  return self->_destinationMessage;
}

- (void)setDestinationMessage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationMessage, 0);
  objc_storeStrong((id *)&self->_sourceMessage, 0);
  objc_storeStrong((id *)&self->_sourceRemoteID, 0);
}

@end