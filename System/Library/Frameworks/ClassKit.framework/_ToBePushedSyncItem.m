@interface _ToBePushedSyncItem
- (PDCLSSyncableItem)syncableItem;
- (PDPendingCLSSyncItem)syncItem;
- (void)setSyncItem:(id)a3;
- (void)setSyncableItem:(id)a3;
@end

@implementation _ToBePushedSyncItem

- (PDPendingCLSSyncItem)syncItem
{
  return self->_syncItem;
}

- (void)setSyncItem:(id)a3
{
}

- (PDCLSSyncableItem)syncableItem
{
  return self->_syncableItem;
}

- (void)setSyncableItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncableItem, 0);

  objc_storeStrong((id *)&self->_syncItem, 0);
}

@end