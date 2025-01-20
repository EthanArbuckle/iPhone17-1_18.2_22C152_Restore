@interface MPMusicPlayerControllerMutableQueue
- (MPMusicPlayerControllerApplicationQueueModifications)modifications;
- (MPMusicPlayerControllerMutableQueue)initWithController:(id)a3;
- (NSMutableArray)removedItems;
- (NSMutableDictionary)insertedDescriptors;
- (void)_insertQueueDescriptor:(id)a3 afterItemWithIdentifier:(id)a4;
- (void)_removeItemWithIdentifier:(id)a3;
- (void)insertQueueDescriptor:(MPMusicPlayerQueueDescriptor *)queueDescriptor afterItem:(MPMediaItem *)afterItem;
- (void)removeItem:(MPMediaItem *)item;
- (void)setInsertedDescriptors:(id)a3;
- (void)setRemovedItems:(id)a3;
@end

@implementation MPMusicPlayerControllerMutableQueue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedItems, 0);

  objc_storeStrong((id *)&self->_insertedDescriptors, 0);
}

- (void)setRemovedItems:(id)a3
{
}

- (NSMutableArray)removedItems
{
  return self->_removedItems;
}

- (void)setInsertedDescriptors:(id)a3
{
}

- (NSMutableDictionary)insertedDescriptors
{
  return self->_insertedDescriptors;
}

- (MPMusicPlayerControllerApplicationQueueModifications)modifications
{
  v3 = [MPMusicPlayerControllerApplicationQueueModifications alloc];
  v4 = (void *)[(NSMutableDictionary *)self->_insertedDescriptors copy];
  v5 = (void *)[(NSMutableArray *)self->_removedItems copy];
  v6 = [(MPMusicPlayerControllerApplicationQueueModifications *)v3 initWithInsertedDescriptors:v4 removedItemIdentifiers:v5];

  return v6;
}

- (void)_removeItemWithIdentifier:(id)a3
{
  if (a3) {
    -[NSMutableArray addObject:](self->_removedItems, "addObject:");
  }
}

- (void)removeItem:(MPMediaItem *)item
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v5 = item;
  uint64_t v6 = objc_opt_class();
  if (v6 == objc_opt_class())
  {
    v7 = [(MPMediaItem *)v5 itemIdentifier];
    if (v7) {
      goto LABEL_32;
    }
    goto LABEL_33;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = [(MPMusicPlayerControllerQueue *)self items];
  v7 = (void *)[obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (!v7) {
    goto LABEL_31;
  }
  v22 = self;
  uint64_t v24 = *(void *)v26;
  while (2)
  {
    for (i = 0; i != v7; i = (char *)i + 1)
    {
      if (*(void *)v26 != v24) {
        objc_enumerationMutation(obj);
      }
      v9 = *(void **)(*((void *)&v25 + 1) + 8 * i);
      v10 = [v9 item];
      if ([v10 persistentID]) {
        BOOL v11 = [(MPMediaEntity *)v5 persistentID] != 0;
      }
      else {
        BOOL v11 = 0;
      }

      v12 = [v9 item];
      uint64_t v13 = [v12 playbackStoreID];
      if (v13)
      {
        v14 = (void *)v13;
        v15 = [(MPMediaItem *)v5 playbackStoreID];
        BOOL v16 = v15 != 0;

        if (!v11)
        {
          if (!v15) {
            continue;
          }
          goto LABEL_18;
        }
      }
      else
      {

        if (!v11) {
          continue;
        }
        BOOL v16 = 0;
      }
      v3 = [v9 item];
      uint64_t v17 = [v3 persistentID];
      if (v17 == [(MPMediaEntity *)v5 persistentID])
      {

LABEL_29:
        v7 = [v9 itemIdentifier];
        goto LABEL_30;
      }
      if (!v16)
      {

        continue;
      }
LABEL_18:
      v18 = [v9 item];
      v19 = [v18 playbackStoreID];
      v20 = [(MPMediaItem *)v5 playbackStoreID];
      int v21 = [v19 isEqualToString:v20];

      if (v11)
      {

        if (v21) {
          goto LABEL_29;
        }
      }
      else if (v21)
      {
        goto LABEL_29;
      }
    }
    v7 = (void *)[obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v7) {
      continue;
    }
    break;
  }
LABEL_30:
  self = v22;
LABEL_31:

  if (v7) {
LABEL_32:
  }
    [(MPMusicPlayerControllerMutableQueue *)self _removeItemWithIdentifier:v7];
LABEL_33:
}

- (void)_insertQueueDescriptor:(id)a3 afterItemWithIdentifier:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v9 = v8;
  [(NSMutableDictionary *)self->_insertedDescriptors setObject:v10 forKeyedSubscript:v8];
}

- (void)insertQueueDescriptor:(MPMusicPlayerQueueDescriptor *)queueDescriptor afterItem:(MPMediaItem *)afterItem
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v7 = queueDescriptor;
  id v8 = afterItem;
  if (!v8)
  {
    uint64_t v25 = [MEMORY[0x1E4F1CA98] null];
    goto LABEL_29;
  }
  uint64_t v9 = objc_opt_class();
  if (v9 == objc_opt_class())
  {
    uint64_t v25 = [(MPMediaItem *)v8 itemIdentifier];
LABEL_29:
    id v10 = (void *)v25;
    if (!v25) {
      goto LABEL_31;
    }
LABEL_30:
    [(MPMusicPlayerControllerMutableQueue *)self _insertQueueDescriptor:v7 afterItemWithIdentifier:v10];
    goto LABEL_31;
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = [(MPMusicPlayerControllerQueue *)self items];
  id v10 = (void *)[obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (!v10) {
    goto LABEL_35;
  }
  long long v26 = self;
  long long v27 = v7;
  uint64_t v29 = *(void *)v31;
  while (2)
  {
    for (i = 0; i != v10; i = (char *)i + 1)
    {
      if (*(void *)v31 != v29) {
        objc_enumerationMutation(obj);
      }
      v12 = *(void **)(*((void *)&v30 + 1) + 8 * i);
      uint64_t v13 = objc_msgSend(v12, "item", v26, v27);
      if ([v13 persistentID]) {
        BOOL v14 = [(MPMediaEntity *)v8 persistentID] != 0;
      }
      else {
        BOOL v14 = 0;
      }

      v15 = [v12 item];
      uint64_t v16 = [v15 playbackStoreID];
      if (v16)
      {
        uint64_t v17 = (void *)v16;
        v18 = [(MPMediaItem *)v8 playbackStoreID];
        BOOL v19 = v18 != 0;

        if (!v14)
        {
          if (!v18) {
            continue;
          }
          goto LABEL_19;
        }
      }
      else
      {

        if (!v14) {
          continue;
        }
        BOOL v19 = 0;
      }
      v4 = [v12 item];
      uint64_t v20 = [v4 persistentID];
      if (v20 == [(MPMediaEntity *)v8 persistentID])
      {

LABEL_33:
        id v10 = [v12 itemIdentifier];
        goto LABEL_34;
      }
      if (!v19)
      {

        continue;
      }
LABEL_19:
      int v21 = [v12 item];
      v22 = [v21 playbackStoreID];
      v23 = [(MPMediaItem *)v8 playbackStoreID];
      int v24 = [v22 isEqualToString:v23];

      if (v14)
      {

        if (v24) {
          goto LABEL_33;
        }
      }
      else if (v24)
      {
        goto LABEL_33;
      }
    }
    id v10 = (void *)[obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v10) {
      continue;
    }
    break;
  }
LABEL_34:
  self = v26;
  v7 = v27;
LABEL_35:

  if (v10) {
    goto LABEL_30;
  }
LABEL_31:
}

- (MPMusicPlayerControllerMutableQueue)initWithController:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MPMusicPlayerControllerMutableQueue;
  v3 = [(MPMusicPlayerControllerQueue *)&v9 initWithController:a3];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    removedItems = v3->_removedItems;
    v3->_removedItems = (NSMutableArray *)v4;

    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    insertedDescriptors = v3->_insertedDescriptors;
    v3->_insertedDescriptors = (NSMutableDictionary *)v6;
  }
  return v3;
}

@end