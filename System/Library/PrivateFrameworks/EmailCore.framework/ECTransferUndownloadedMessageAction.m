@interface ECTransferUndownloadedMessageAction
- (ECTransferUndownloadedMessageAction)initWithBuilder:(id)a3;
- (NSArray)itemsToDelete;
- (NSString)description;
- (NSString)oldestPersistedRemoteID;
- (NSURL)destinationMailboxURL;
- (NSURL)sourceMailboxURL;
- (int64_t)transferType;
- (void)setDestinationMailboxURL:(id)a3;
- (void)setItemsToDelete:(id)a3;
- (void)setOldestPersistedRemoteID:(id)a3;
- (void)setSourceMailboxURL:(id)a3;
- (void)setTransferType:(int64_t)a3;
- (void)updateWithCompletedCopyItems:(id)a3;
@end

@implementation ECTransferUndownloadedMessageAction

- (ECTransferUndownloadedMessageAction)initWithBuilder:(id)a3
{
  v4 = (void (**)(id, ECTransferUndownloadedMessageAction *))a3;
  v7.receiver = self;
  v7.super_class = (Class)ECTransferUndownloadedMessageAction;
  v5 = [(ECTransferUndownloadedMessageAction *)&v7 init];
  if (v5) {
    v4[2](v4, v5);
  }

  return v5;
}

- (NSString)description
{
  v10.receiver = self;
  v10.super_class = (Class)ECTransferUndownloadedMessageAction;
  v3 = [(ECLocalMessageAction *)&v10 description];
  v4 = NSString;
  int64_t v5 = [(ECTransferUndownloadedMessageAction *)self transferType];
  v6 = [(ECTransferUndownloadedMessageAction *)self oldestPersistedRemoteID];
  objc_super v7 = [v4 stringWithFormat:@", transfer type = %ld, persistent ID limit %@", v5, v6];
  v8 = [v3 stringByAppendingString:v7];

  return (NSString *)v8;
}

- (void)updateWithCompletedCopyItems:(id)a3
{
  self->_transferType = 3;
  objc_storeStrong((id *)&self->_itemsToDelete, a3);
}

- (int64_t)transferType
{
  return self->_transferType;
}

- (void)setTransferType:(int64_t)a3
{
  self->_transferType = a3;
}

- (NSURL)sourceMailboxURL
{
  return self->_sourceMailboxURL;
}

- (void)setSourceMailboxURL:(id)a3
{
}

- (NSURL)destinationMailboxURL
{
  return self->_destinationMailboxURL;
}

- (void)setDestinationMailboxURL:(id)a3
{
}

- (NSString)oldestPersistedRemoteID
{
  return self->_oldestPersistedRemoteID;
}

- (void)setOldestPersistedRemoteID:(id)a3
{
}

- (NSArray)itemsToDelete
{
  return self->_itemsToDelete;
}

- (void)setItemsToDelete:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsToDelete, 0);
  objc_storeStrong((id *)&self->_oldestPersistedRemoteID, 0);
  objc_storeStrong((id *)&self->_destinationMailboxURL, 0);
  objc_storeStrong((id *)&self->_sourceMailboxURL, 0);
}

@end