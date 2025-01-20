@interface _EMInMemoryThreadCollectionOldestThreadsState
- (NSMutableDictionary)oldestThreadsByMailboxObjectIDs;
- (void)setOldestThreadsByMailboxObjectIDs:(id)a3;
@end

@implementation _EMInMemoryThreadCollectionOldestThreadsState

- (NSMutableDictionary)oldestThreadsByMailboxObjectIDs
{
  return self->_oldestThreadsByMailboxObjectIDs;
}

- (void)setOldestThreadsByMailboxObjectIDs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end