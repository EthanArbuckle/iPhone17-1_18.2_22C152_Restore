@interface EKICSPreviewModel
- (BOOL)shouldAllowDeleteEvent:(id)a3;
- (BOOL)shouldAllowUpdateEvent:(id)a3;
- (EKEventStore)eventStore;
- (EKICSPreviewModel)initWithICSData:(id)a3 eventStore:(id)a4 options:(unint64_t)a5;
- (NSArray)allEvents;
- (NSArray)importedEvents;
- (NSArray)unimportedEvents;
- (id)importEvent:(id)a3 intoCalendar:(id)a4;
- (unint64_t)actionsState;
- (unint64_t)importedEventCount;
- (unint64_t)totalEventCount;
- (unint64_t)unimportedEventCount;
- (void)importAllIntoCalendar:(id)a3;
@end

@implementation EKICSPreviewModel

- (EKICSPreviewModel)initWithICSData:(id)a3 eventStore:(id)a4 options:(unint64_t)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v47.receiver = self;
  v47.super_class = (Class)EKICSPreviewModel;
  v10 = [(EKICSPreviewModel *)&v47 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_destStore, a4);
    id v41 = v8;
    uint64_t v12 = [v8 copy];
    data = v11->_data;
    v11->_data = (NSData *)v12;

    v11->_options = a5;
    uint64_t v14 = [objc_alloc(MEMORY[0x1E4F25550]) initWithEKOptions:48];
    tempStore = v11->_tempStore;
    v11->_tempStore = (EKEventStore *)v14;

    v17 = v11->_data;
    v16 = v11->_tempStore;
    v18 = [(EKEventStore *)v16 defaultCalendarForNewEvents];
    v19 = [(EKEventStore *)v16 importICSData:v17 intoCalendar:v18 options:*MEMORY[0x1E4F574E0] | *MEMORY[0x1E4F574D0] | v11->_options];

    uint64_t v20 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
    importedEvents = v11->_importedEvents;
    v11->_importedEvents = (NSMutableArray *)v20;

    uint64_t v22 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
    unimportedEvents = v11->_unimportedEvents;
    v11->_unimportedEvents = (NSMutableArray *)v22;

    uint64_t v24 = [MEMORY[0x1E4F1CA80] set];
    eventsAllowingUpdate = v11->_eventsAllowingUpdate;
    v11->_eventsAllowingUpdate = (NSMutableSet *)v24;

    uint64_t v26 = [MEMORY[0x1E4F1CA80] set];
    eventsAllowingDelete = v11->_eventsAllowingDelete;
    v11->_eventsAllowingDelete = (NSMutableSet *)v26;

    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id obj = v19;
    uint64_t v28 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
    if (!v28) {
      goto LABEL_16;
    }
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v44;
    while (1)
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v44 != v30) {
          objc_enumerationMutation(obj);
        }
        v32 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        if (a5)
        {
          v33 = [*(id *)(*((void *)&v43 + 1) + 8 * i) notes];
          v34 = [v33 stringByReplacingOccurrencesOfString:@"=0D=0A" withString:&stru_1F0CC2140];
          [v32 setNotes:v34];
        }
        v35 = [v32 uniqueID];
        v36 = [(EKEventStore *)v11->_destStore eventWithUniqueId:v35];
        if (!v36) {
          goto LABEL_12;
        }
        [(NSMutableSet *)v11->_eventsAllowingDelete addObject:v35];
        int v37 = [v36 sequenceNumber];
        if (v37 < (int)[v32 sequenceNumber])
        {
          [(NSMutableSet *)v11->_eventsAllowingUpdate addObject:v35];
LABEL_12:
          v38 = v11->_unimportedEvents;
          v39 = v32;
          goto LABEL_14;
        }
        v38 = v11->_importedEvents;
        v39 = v36;
LABEL_14:
        [(NSMutableArray *)v38 addObject:v39];
        v11->_actionsState = [v32 actionsState];
      }
      uint64_t v29 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
      if (!v29)
      {
LABEL_16:

        id v8 = v41;
        break;
      }
    }
  }

  return v11;
}

- (EKEventStore)eventStore
{
  return self->_destStore;
}

- (unint64_t)totalEventCount
{
  uint64_t v3 = [(NSMutableArray *)self->_importedEvents count];
  return [(NSMutableArray *)self->_unimportedEvents count] + v3;
}

- (unint64_t)importedEventCount
{
  return [(NSMutableArray *)self->_importedEvents count];
}

- (unint64_t)unimportedEventCount
{
  return [(NSMutableArray *)self->_unimportedEvents count];
}

- (unint64_t)actionsState
{
  return self->_actionsState;
}

- (NSArray)importedEvents
{
  v2 = (void *)[(NSMutableArray *)self->_importedEvents copy];

  return (NSArray *)v2;
}

- (NSArray)unimportedEvents
{
  v2 = (void *)[(NSMutableArray *)self->_unimportedEvents copy];

  return (NSArray *)v2;
}

- (NSArray)allEvents
{
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[EKICSPreviewModel totalEventCount](self, "totalEventCount"));
  if ([(NSMutableArray *)self->_importedEvents count]) {
    [v3 addObjectsFromArray:self->_importedEvents];
  }
  if ([(NSMutableArray *)self->_unimportedEvents count]) {
    [v3 addObjectsFromArray:self->_unimportedEvents];
  }

  return (NSArray *)v3;
}

- (id)importEvent:(id)a3 intoCalendar:(id)a4
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = self->_data;
  if (v8)
  {
    id v9 = [v6 uniqueID];
    uint64_t v28 = v9;
    v10 = [MEMORY[0x1E4F1CA98] null];
    v29[0] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];

    destStore = self->_destStore;
    uint64_t v24 = (void *)v11;
    uint64_t v27 = v11;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
    uint64_t v26 = v8;
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
    id v25 = v7;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
    v16 = [(EKEventStore *)destStore importEventsWithExternalIDs:v13 fromICSData:v14 intoCalendars:v15 options:*MEMORY[0x1E4F574E8] | *MEMORY[0x1E4F574D0] | self->_options | 0x100000 batchSize:0];
    v17 = [v16 firstObject];
    v18 = [v17 firstObject];

    if (v18)
    {
      [(EKICSPreviewModel *)self willChangeValueForKey:@"unimportedEvents"];
      [(EKICSPreviewModel *)self willChangeValueForKey:@"importedEvents"];
      [(NSMutableArray *)self->_unimportedEvents removeObject:v6];
      [(NSMutableArray *)self->_importedEvents addObject:v18];
      [(EKICSPreviewModel *)self didChangeValueForKey:@"unimportedEvents"];
      [(EKICSPreviewModel *)self didChangeValueForKey:@"importedEvents"];
      eventsAllowingUpdate = self->_eventsAllowingUpdate;
      uint64_t v20 = [v18 uniqueID];
      [(NSMutableSet *)eventsAllowingUpdate removeObject:v20];

      eventsAllowingDelete = self->_eventsAllowingDelete;
      uint64_t v22 = [v18 uniqueID];
      [(NSMutableSet *)eventsAllowingDelete addObject:v22];
    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void)importAllIntoCalendar:(id)a3
{
  uint64_t v3 = self;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v4 = [(EKEventStore *)self->_destStore importICSData:v3->_data intoCalendar:a3 options:*MEMORY[0x1E4F574E8] | *MEMORY[0x1E4F574D0] | v3->_options | 0x8100000];
  if ([v4 count])
  {
    [(EKICSPreviewModel *)v3 willChangeValueForKey:@"unimportedEvents"];
    [(EKICSPreviewModel *)v3 willChangeValueForKey:@"importedEvents"];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v20 = v4;
    id obj = v4;
    uint64_t v23 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v23)
    {
      uint64_t v22 = *(void *)v30;
      uint64_t v24 = v3;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v30 != v22) {
            objc_enumerationMutation(obj);
          }
          id v6 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          long long v25 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          id v7 = v3->_unimportedEvents;
          uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v25 objects:v33 count:16];
          if (v8)
          {
            uint64_t v9 = v8;
            uint64_t v10 = *(void *)v26;
            while (2)
            {
              for (uint64_t j = 0; j != v9; ++j)
              {
                if (*(void *)v26 != v10) {
                  objc_enumerationMutation(v7);
                }
                uint64_t v12 = *(void **)(*((void *)&v25 + 1) + 8 * j);
                v13 = [v12 uniqueID];
                uint64_t v14 = [v6 uniqueID];
                int v15 = [v13 isEqualToString:v14];

                if (v15)
                {
                  uint64_t v3 = v24;
                  [(NSMutableArray *)v24->_unimportedEvents removeObject:v12];
                  [(NSMutableArray *)v24->_importedEvents addObject:v6];
                  goto LABEL_17;
                }
              }
              uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v25 objects:v33 count:16];
              uint64_t v3 = v24;
              if (v9) {
                continue;
              }
              break;
            }
          }
LABEL_17:

          eventsAllowingUpdate = v3->_eventsAllowingUpdate;
          v17 = [v6 uniqueID];
          [(NSMutableSet *)eventsAllowingUpdate removeObject:v17];

          eventsAllowingDelete = v3->_eventsAllowingDelete;
          v19 = [v6 uniqueID];
          [(NSMutableSet *)eventsAllowingDelete addObject:v19];
        }
        uint64_t v23 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v23);
    }

    [(EKICSPreviewModel *)v3 didChangeValueForKey:@"unimportedEvents"];
    [(EKICSPreviewModel *)v3 didChangeValueForKey:@"importedEvents"];
    v4 = v20;
  }
}

- (BOOL)shouldAllowDeleteEvent:(id)a3
{
  eventsAllowingDelete = self->_eventsAllowingDelete;
  v4 = [a3 uniqueID];
  LOBYTE(eventsAllowingDelete) = [(NSMutableSet *)eventsAllowingDelete containsObject:v4];

  return (char)eventsAllowingDelete;
}

- (BOOL)shouldAllowUpdateEvent:(id)a3
{
  eventsAllowingUpdate = self->_eventsAllowingUpdate;
  v4 = [a3 uniqueID];
  LOBYTE(eventsAllowingUpdate) = [(NSMutableSet *)eventsAllowingUpdate containsObject:v4];

  return (char)eventsAllowingUpdate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventsAllowingDelete, 0);
  objc_storeStrong((id *)&self->_eventsAllowingUpdate, 0);
  objc_storeStrong((id *)&self->_unimportedEvents, 0);
  objc_storeStrong((id *)&self->_importedEvents, 0);
  objc_storeStrong((id *)&self->_destStore, 0);
  objc_storeStrong((id *)&self->_tempStore, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

@end