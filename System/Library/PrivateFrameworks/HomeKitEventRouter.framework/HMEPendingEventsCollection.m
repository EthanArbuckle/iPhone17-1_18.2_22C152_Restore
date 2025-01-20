@interface HMEPendingEventsCollection
- (BOOL)hasEventItem;
- (HMEPendingEventsCollection)init;
- (HMEPendingEventsCollection)initWithEvents:(id)a3;
- (NSArray)eventItems;
- (NSMutableArray)mutableEventItems;
- (id)popEventItemsUpWithFragments:(BOOL)a3 toSizeInBytes:(unint64_t)a4 usedBytes:(unint64_t *)a5;
- (unint64_t)eventInfoMaxSizeInBytes:(id)a3;
- (void)_addEventInfo:(id)a3;
- (void)addEventInfoItems:(id)a3;
- (void)combinePreviousEvents:(id)a3;
- (void)resetItems;
- (void)setMutableEventItems:(id)a3;
@end

@implementation HMEPendingEventsCollection

- (void).cxx_destruct
{
}

- (void)setMutableEventItems:(id)a3
{
}

- (NSMutableArray)mutableEventItems
{
  return self->_mutableEventItems;
}

- (unint64_t)eventInfoMaxSizeInBytes:(id)a3
{
  if (!a3) {
    return 0;
  }
  v3 = [a3 event];
  v4 = [v3 encodedData];
  uint64_t v5 = [v4 length];
  unint64_t v6 = +[HMEEventInfo topicAndMetadataMaxSizeInBytes] + v5;

  return v6;
}

- (id)popEventItemsUpWithFragments:(BOOL)a3 toSizeInBytes:(unint64_t)a4 usedBytes:(unint64_t *)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v23 = [MEMORY[0x1E4F1CA48] array];
    v7 = [MEMORY[0x1E4F1CA48] array];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v8 = [(HMEPendingEventsCollection *)self mutableEventItems];
    v9 = (void *)[v8 copy];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      unint64_t v12 = 0;
      BOOL v13 = 0;
      uint64_t v14 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v9);
          }
          uint64_t v16 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          if (v13)
          {
            BOOL v13 = 1;
            v17 = v7;
          }
          else
          {
            unint64_t v18 = [(HMEPendingEventsCollection *)self eventInfoMaxSizeInBytes:*(void *)(*((void *)&v24 + 1) + 8 * i)]+ v12;
            BOOL v13 = v18 > a4;
            if (v18 <= a4) {
              v17 = v23;
            }
            else {
              v17 = v7;
            }
            if (v18 <= a4) {
              unint64_t v12 = v18;
            }
          }
          [v17 addObject:v16];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v11);
    }
    else
    {
      unint64_t v12 = 0;
    }

    [(HMEPendingEventsCollection *)self setMutableEventItems:v7];
    if (a5) {
      *a5 = v12;
    }
  }
  else
  {
    v19 = [(HMEPendingEventsCollection *)self mutableEventItems];
    id v23 = (id)[v19 copy];

    v20 = [MEMORY[0x1E4F1CA48] array];
    [(HMEPendingEventsCollection *)self setMutableEventItems:v20];
  }
  return v23;
}

- (BOOL)hasEventItem
{
  v2 = [(HMEPendingEventsCollection *)self mutableEventItems];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (void)resetItems
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  [(HMEPendingEventsCollection *)self setMutableEventItems:v3];
}

- (void)combinePreviousEvents:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMEPendingEventsCollection *)self mutableEventItems];
  unint64_t v6 = (void *)[v5 copy];

  v7 = (void *)[v4 mutableCopy];
  [(HMEPendingEventsCollection *)self setMutableEventItems:v7];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        -[HMEPendingEventsCollection _addEventInfo:](self, "_addEventInfo:", *(void *)(*((void *)&v13 + 1) + 8 * v12++), (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)addEventInfoItems:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(HMEPendingEventsCollection *)self _addEventInfo:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_addEventInfo:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 event];
  uint64_t v6 = [v5 eventMetadata];
  unint64_t v7 = [v6 combineType];

  if (v7 < 2)
  {
LABEL_13:
    v19 = [(HMEPendingEventsCollection *)self mutableEventItems];
    [v19 addObject:v4];

    goto LABEL_14;
  }
  if (v7 == 2)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v8 = [(HMEPendingEventsCollection *)self mutableEventItems];
    long long v9 = (void *)[v8 copy];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          long long v15 = [v14 topic];
          long long v16 = [v4 topic];
          int v17 = [v15 isEqualToString:v16];

          if (v17)
          {
            uint64_t v18 = [(HMEPendingEventsCollection *)self mutableEventItems];
            [v18 removeObject:v14];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v11);
    }

    goto LABEL_13;
  }
LABEL_14:
}

- (NSArray)eventItems
{
  v2 = [(HMEPendingEventsCollection *)self mutableEventItems];
  id v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (HMEPendingEventsCollection)init
{
  return [(HMEPendingEventsCollection *)self initWithEvents:MEMORY[0x1E4F1CBF0]];
}

- (HMEPendingEventsCollection)initWithEvents:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMEPendingEventsCollection;
  uint64_t v5 = [(HMEPendingEventsCollection *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 mutableCopy];
    mutableEventItems = v5->_mutableEventItems;
    v5->_mutableEventItems = (NSMutableArray *)v6;
  }
  return v5;
}

@end