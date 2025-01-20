@interface TrackedMessageListItems
- (BOOL)hasMessageListItemForItemID:(id)a3;
- (NSArray)itemIDs;
- (NSArray)messageListItems;
- (NSSet)itemIDsSet;
- (TrackedMessageListItems)init;
- (unint64_t)count;
- (void)trackMessageListItemWithItemID:(id)a3;
- (void)trackmessageListItem:(id)a3;
- (void)untrackAllMessageListItems;
- (void)untrackMessageListItemWithItemID:(id)a3;
- (void)untrackMessageListItemsWithItemIDs:(id)a3;
- (void)updateMessageListItem:(id)a3;
@end

@implementation TrackedMessageListItems

- (TrackedMessageListItems)init
{
  v6.receiver = self;
  v6.super_class = (Class)TrackedMessageListItems;
  v2 = [(TrackedMessageListItems *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    trackedItems = v2->_trackedItems;
    v2->_trackedItems = v3;
  }
  return v2;
}

- (unint64_t)count
{
  return [(NSMutableDictionary *)self->_trackedItems count];
}

- (NSArray)itemIDs
{
  return (NSArray *)[(NSMutableDictionary *)self->_trackedItems allKeys];
}

- (NSSet)itemIDsSet
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = [(NSMutableDictionary *)self->_trackedItems allKeys];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

- (NSArray)messageListItems
{
  v2 = [(NSMutableDictionary *)self->_trackedItems allValues];
  v3 = objc_msgSend(v2, "ef_filter:", *MEMORY[0x1E4F60CE8]);

  return (NSArray *)v3;
}

- (BOOL)hasMessageListItemForItemID:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_trackedItems objectForKeyedSubscript:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)trackmessageListItem:(id)a3
{
  trackedItems = self->_trackedItems;
  id v4 = a3;
  id v5 = [v4 itemID];
  [(NSMutableDictionary *)trackedItems setObject:v4 forKeyedSubscript:v5];
}

- (void)trackMessageListItemWithItemID:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CA98];
  id v5 = a3;
  id v6 = [v4 null];
  [(NSMutableDictionary *)self->_trackedItems setObject:v6 forKeyedSubscript:v5];
}

- (void)updateMessageListItem:(id)a3
{
  id v4 = a3;
  trackedItems = self->_trackedItems;
  id v10 = v4;
  id v6 = [v4 itemID];
  v7 = [(NSMutableDictionary *)trackedItems objectForKeyedSubscript:v6];

  if (v7)
  {
    v8 = self->_trackedItems;
    v9 = [v10 itemID];
    [(NSMutableDictionary *)v8 setObject:v10 forKeyedSubscript:v9];
  }
}

- (void)untrackMessageListItemWithItemID:(id)a3
{
}

- (void)untrackMessageListItemsWithItemIDs:(id)a3
{
}

- (void)untrackAllMessageListItems
{
}

- (void).cxx_destruct
{
}

@end