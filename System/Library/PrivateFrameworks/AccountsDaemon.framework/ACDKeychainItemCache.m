@interface ACDKeychainItemCache
- (NSMutableDictionary)nonSyncableItems;
- (NSMutableDictionary)syncableItems;
@end

@implementation ACDKeychainItemCache

- (NSMutableDictionary)nonSyncableItems
{
  nonSyncableItems = self->_nonSyncableItems;
  if (!nonSyncableItems)
  {
    v4 = [MEMORY[0x263EFF9A0] dictionary];
    v5 = self->_nonSyncableItems;
    self->_nonSyncableItems = v4;

    nonSyncableItems = self->_nonSyncableItems;
  }

  return nonSyncableItems;
}

- (NSMutableDictionary)syncableItems
{
  syncableItems = self->_syncableItems;
  if (!syncableItems)
  {
    v4 = [MEMORY[0x263EFF9A0] dictionary];
    v5 = self->_syncableItems;
    self->_syncableItems = v4;

    syncableItems = self->_syncableItems;
  }

  return syncableItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncableItems, 0);

  objc_storeStrong((id *)&self->_nonSyncableItems, 0);
}

@end