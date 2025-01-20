@interface SGSuggestionsWorkGroupManagerGuardedData
- (BOOL)isProcessedUniqueId:(id)a3;
- (SGSuggestionsWorkGroupManagerGuardedData)init;
- (id)createGroupForUniqueId:(id)a3;
- (id)groupForUniqueId:(id)a3;
- (void)addToProcessedIds:(id)a3;
- (void)enterGroupForUniqueId:(id)a3;
- (void)leaveGroupForUniqueId:(id)a3;
- (void)removeGroupFromProcessedIds:(id)a3;
@end

@implementation SGSuggestionsWorkGroupManagerGuardedData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIds, 0);

  objc_storeStrong((id *)&self->_groupLookup, 0);
}

- (void)removeGroupFromProcessedIds:(id)a3
{
}

- (void)addToProcessedIds:(id)a3
{
  id v4 = a3;
  if ((unint64_t)[(NSMutableArray *)self->_uniqueIds count] >= 0x40
    && ([(NSMutableArray *)self->_uniqueIds containsObject:v4] & 1) == 0)
  {
    [(NSMutableArray *)self->_uniqueIds removeObjectAtIndex:0];
  }
  [(NSMutableArray *)self->_uniqueIds addObject:v4];
}

- (BOOL)isProcessedUniqueId:(id)a3
{
  return [(NSMutableArray *)self->_uniqueIds containsObject:a3];
}

- (void)leaveGroupForUniqueId:(id)a3
{
  v3 = [(NSMapTable *)self->_groupLookup objectForKey:a3];
  if (v3)
  {
    id v4 = v3;
    dispatch_group_leave(v3);
    v3 = v4;
  }
}

- (void)enterGroupForUniqueId:(id)a3
{
  v3 = [(NSMapTable *)self->_groupLookup objectForKey:a3];
  if (v3)
  {
    id v4 = v3;
    dispatch_group_enter(v3);
    v3 = v4;
  }
}

- (id)createGroupForUniqueId:(id)a3
{
  id v4 = a3;
  dispatch_group_t v5 = dispatch_group_create();
  [(NSMapTable *)self->_groupLookup setObject:v5 forKey:v4];

  return v5;
}

- (id)groupForUniqueId:(id)a3
{
  return [(NSMapTable *)self->_groupLookup objectForKey:a3];
}

- (SGSuggestionsWorkGroupManagerGuardedData)init
{
  v8.receiver = self;
  v8.super_class = (Class)SGSuggestionsWorkGroupManagerGuardedData;
  v2 = [(SGSuggestionsWorkGroupManagerGuardedData *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    groupLookup = v2->_groupLookup;
    v2->_groupLookup = (NSMapTable *)v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:64];
    uniqueIds = v2->_uniqueIds;
    v2->_uniqueIds = (NSMutableArray *)v5;
  }
  return v2;
}

@end