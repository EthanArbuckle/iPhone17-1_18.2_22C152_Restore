@interface ECTransferMessageAction
- (ECTransferMessageAction)init;
- (ECTransferMessageAction)initWithBuilder:(id)a3;
- (NSArray)itemsToCopy;
- (NSArray)itemsToDelete;
- (NSArray)itemsToDownload;
- (NSString)description;
- (NSURL)destinationMailboxURL;
- (NSURL)sourceMailboxURL;
- (int64_t)transferType;
- (void)setDestinationMailboxURL:(id)a3;
- (void)setItemsToCopy:(id)a3;
- (void)setItemsToDelete:(id)a3;
- (void)setItemsToDownload:(id)a3;
- (void)setSourceMailboxURL:(id)a3;
- (void)setTransferType:(int64_t)a3;
- (void)updateWithCompletedItems:(id)a3 forPhase:(int64_t)a4;
- (void)updateWithFailedItems:(id)a3 forPhase:(int64_t)a4;
@end

@implementation ECTransferMessageAction

- (ECTransferMessageAction)initWithBuilder:(id)a3
{
  v4 = (void (**)(id, ECTransferMessageAction *))a3;
  v7.receiver = self;
  v7.super_class = (Class)ECTransferMessageAction;
  v5 = [(ECTransferMessageAction *)&v7 init];
  if (v5) {
    v4[2](v4, v5);
  }

  return v5;
}

- (ECTransferMessageAction)init
{
}

- (NSString)description
{
  v7.receiver = self;
  v7.super_class = (Class)ECTransferMessageAction;
  v3 = [(ECLocalMessageAction *)&v7 description];
  v4 = [NSString stringWithFormat:@", num items to download %lu, num items to copy %lu, num items to delete = %lu, transfer type = %ld", -[NSMutableOrderedSet count](self->_itemsToDownload, "count"), -[NSMutableOrderedSet count](self->_itemsToCopy, "count"), -[NSMutableOrderedSet count](self->_itemsToDelete, "count"), -[ECTransferMessageAction transferType](self, "transferType")];
  v5 = [v3 stringByAppendingString:v4];

  return (NSString *)v5;
}

- (NSArray)itemsToDownload
{
  v2 = [(NSMutableOrderedSet *)self->_itemsToDownload array];
  v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (void)setItemsToDownload:(id)a3
{
  id v6 = a3;
  v4 = (NSMutableOrderedSet *)[objc_alloc(MEMORY[0x1E4F1CA70]) initWithArray:v6];
  itemsToDownload = self->_itemsToDownload;
  self->_itemsToDownload = v4;
}

- (NSArray)itemsToCopy
{
  v2 = [(NSMutableOrderedSet *)self->_itemsToCopy array];
  v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (void)setItemsToCopy:(id)a3
{
  id v6 = a3;
  v4 = (NSMutableOrderedSet *)[objc_alloc(MEMORY[0x1E4F1CA70]) initWithArray:v6];
  itemsToCopy = self->_itemsToCopy;
  self->_itemsToCopy = v4;
}

- (NSArray)itemsToDelete
{
  v2 = [(NSMutableOrderedSet *)self->_itemsToDelete array];
  v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (void)setItemsToDelete:(id)a3
{
  id v6 = a3;
  v4 = (NSMutableOrderedSet *)[objc_alloc(MEMORY[0x1E4F1CA70]) initWithArray:v6];
  itemsToDelete = self->_itemsToDelete;
  self->_itemsToDelete = v4;
}

- (void)updateWithCompletedItems:(id)a3 forPhase:(int64_t)a4
{
  id v9 = a3;
  if (a4 == 4)
  {
    [(NSMutableOrderedSet *)self->_itemsToDelete removeObjectsInArray:v9];
    goto LABEL_17;
  }
  if (a4 != 3)
  {
    if (a4 != 1) {
      goto LABEL_17;
    }
    [(NSMutableOrderedSet *)self->_itemsToDownload removeObjectsInArray:v9];
    id v6 = [(ECTransferMessageAction *)self destinationMailboxURL];

    if (v6)
    {
      objc_super v7 = &OBJC_IVAR___ECTransferMessageAction__itemsToCopy;
    }
    else
    {
      if ([(ECTransferMessageAction *)self transferType] != 1)
      {
LABEL_13:
        if (![(NSMutableOrderedSet *)self->_itemsToDownload count]
          && [(NSMutableOrderedSet *)self->_itemsToCopy count])
        {
          v8 = [(ECTransferMessageAction *)self destinationMailboxURL];
          [(ECLocalMessageAction *)self setMailboxURL:v8];
          goto LABEL_16;
        }
        goto LABEL_17;
      }
      objc_super v7 = &OBJC_IVAR___ECTransferMessageAction__itemsToDelete;
    }
    [*(id *)((char *)&self->super.super.isa + *v7) addObjectsFromArray:v9];
    goto LABEL_13;
  }
  [(NSMutableOrderedSet *)self->_itemsToCopy removeObjectsInArray:v9];
  if ([(ECTransferMessageAction *)self transferType] == 1)
  {
    [(NSMutableOrderedSet *)self->_itemsToDelete addObjectsFromArray:v9];
    if (![(NSMutableOrderedSet *)self->_itemsToCopy count])
    {
      v8 = [(ECTransferMessageAction *)self sourceMailboxURL];
      [(ECLocalMessageAction *)self setMailboxURL:v8];
LABEL_16:
    }
  }
LABEL_17:
}

- (void)updateWithFailedItems:(id)a3 forPhase:(int64_t)a4
{
  id v6 = a3;
  id v8 = v6;
  switch(a4)
  {
    case 1:
      objc_super v7 = &OBJC_IVAR___ECTransferMessageAction__itemsToDownload;
      break;
    case 3:
      objc_super v7 = &OBJC_IVAR___ECTransferMessageAction__itemsToCopy;
      break;
    case 4:
      objc_super v7 = &OBJC_IVAR___ECTransferMessageAction__itemsToDelete;
      break;
    default:
      goto LABEL_8;
  }
  [*(id *)((char *)&self->super.super.isa + *v7) removeObjectsInArray:v6];
LABEL_8:
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationMailboxURL, 0);
  objc_storeStrong((id *)&self->_sourceMailboxURL, 0);
  objc_storeStrong((id *)&self->_itemsToDelete, 0);
  objc_storeStrong((id *)&self->_itemsToCopy, 0);
  objc_storeStrong((id *)&self->_itemsToDownload, 0);
}

@end