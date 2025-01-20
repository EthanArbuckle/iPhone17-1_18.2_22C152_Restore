@interface _EDGroupedSenderList
- (NSOrderedSet)orderedGroupedSenders;
- (_EDGroupedSenderList)initWithComparator:(id)a3 grouping:(int64_t)a4;
- (id)groupedSenderAtIndex:(unint64_t)a3;
- (id)groupedSenderForKey:(id)a3;
- (id)objectForKeyedSubscript:(id)a3;
- (id)orderedGroupedSendersWithLimit:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)unreadCount;
- (void)_checkConsistencyAndRebuildIfNecessary;
- (void)addGroupedSender:(id)a3;
- (void)removeGroupedSender:(id)a3;
- (void)updateGroupedSender:(id)a3;
@end

@implementation _EDGroupedSenderList

- (_EDGroupedSenderList)initWithComparator:(id)a3 grouping:(int64_t)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_EDGroupedSenderList;
  v7 = [(_EDGroupedSenderList *)&v15 init];
  if (v7)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    groupsBySender = v7->_groupsBySender;
    v7->_groupsBySender = v8;

    v10 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    orderedGroups = v7->_orderedGroups;
    v7->_orderedGroups = v10;

    v12 = _Block_copy(v6);
    id comparator = v7->_comparator;
    v7->_id comparator = v12;

    v7->_lock._os_unfair_lock_opaque = 0;
    v7->_grouping = a4;
  }

  return v7;
}

- (unint64_t)count
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t v4 = [(NSMutableDictionary *)self->_groupsBySender count];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (unint64_t)unreadCount
{
  v2 = [(_EDGroupedSenderList *)self orderedGroupedSenders];
  v3 = [v2 array];
  unint64_t v4 = objc_msgSend(v3, "ef_filter:", &__block_literal_global_405_0);
  unint64_t v5 = [v4 count];

  return v5;
}

- (id)groupedSenderAtIndex:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = [(NSMutableOrderedSet *)self->_orderedGroups objectAtIndex:a3];
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (id)objectForKeyedSubscript:(id)a3
{
  v3 = [(_EDGroupedSenderList *)self groupedSenderForKey:a3];

  return v3;
}

- (id)groupedSenderForKey:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = [(NSMutableDictionary *)self->_groupsBySender objectForKeyedSubscript:v4];
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (NSOrderedSet)orderedGroupedSenders
{
  return (NSOrderedSet *)[(_EDGroupedSenderList *)self orderedGroupedSendersWithLimit:0];
}

- (id)orderedGroupedSendersWithLimit:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  orderedGroups = self->_orderedGroups;
  if (a3)
  {
    uint64_t v7 = [(NSMutableOrderedSet *)orderedGroups ef_prefix:a3];
  }
  else
  {
    uint64_t v7 = [(NSMutableOrderedSet *)orderedGroups copy];
  }
  v8 = (void *)v7;
  os_unfair_lock_unlock(p_lock);

  return v8;
}

- (void)addGroupedSender:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSNumber;
  id v8 = v4;
  id v6 = [v4 objectID];
  uint64_t v7 = objc_msgSend(v5, "numberWithLongLong:", objc_msgSend(v6, "businessID"));

  os_unfair_lock_lock(&self->_lock);
  [(NSMutableDictionary *)self->_groupsBySender setObject:v8 forKeyedSubscript:v7];
  [(NSMutableOrderedSet *)self->_orderedGroups ef_insertObject:v8 usingComparator:self->_comparator];
  [(_EDGroupedSenderList *)self _checkConsistencyAndRebuildIfNecessary];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)removeGroupedSender:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSNumber;
  id v8 = v4;
  id v6 = [v4 objectID];
  uint64_t v7 = objc_msgSend(v5, "numberWithLongLong:", objc_msgSend(v6, "businessID"));

  os_unfair_lock_lock(&self->_lock);
  [(NSMutableDictionary *)self->_groupsBySender setObject:0 forKeyedSubscript:v7];
  [(NSMutableOrderedSet *)self->_orderedGroups removeObject:v8];
  [(_EDGroupedSenderList *)self _checkConsistencyAndRebuildIfNecessary];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)updateGroupedSender:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSNumber;
  id v9 = v4;
  id v6 = [v4 objectID];
  uint64_t v7 = objc_msgSend(v5, "numberWithLongLong:", objc_msgSend(v6, "businessID"));

  os_unfair_lock_lock(&self->_lock);
  id v8 = [(NSMutableDictionary *)self->_groupsBySender objectForKeyedSubscript:v7];

  if (v8)
  {
    [(NSMutableOrderedSet *)self->_orderedGroups removeObject:v9];
    [(NSMutableOrderedSet *)self->_orderedGroups ef_insertObject:v9 usingComparator:self->_comparator];
    [(_EDGroupedSenderList *)self _checkConsistencyAndRebuildIfNecessary];
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)_checkConsistencyAndRebuildIfNecessary
{
  uint64_t v3 = [(NSMutableDictionary *)self->_groupsBySender count];
  if (v3 != [(NSMutableOrderedSet *)self->_orderedGroups count])
  {
    id v4 = objc_alloc(MEMORY[0x1E4F1CA70]);
    unint64_t v5 = [(NSMutableDictionary *)self->_groupsBySender allValues];
    id v6 = (NSMutableOrderedSet *)[v4 initWithArray:v5];
    orderedGroups = self->_orderedGroups;
    self->_orderedGroups = v6;

    id v8 = self->_orderedGroups;
    id comparator = self->_comparator;
    [(NSMutableOrderedSet *)v8 sortUsingComparator:comparator];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_comparator, 0);
  objc_storeStrong((id *)&self->_orderedGroups, 0);

  objc_storeStrong((id *)&self->_groupsBySender, 0);
}

@end