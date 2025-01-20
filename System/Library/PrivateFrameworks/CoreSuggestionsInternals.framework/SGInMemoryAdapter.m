@interface SGInMemoryAdapter
- (NSArray)contacts;
- (NSArray)events;
- (NSArray)reminders;
- (SGInMemoryAdapter)init;
- (void)addContact:(id)a3;
- (void)addEvent:(id)a3;
- (void)addEvents:(id)a3;
- (void)addReminder:(id)a3;
- (void)calendarDeleted;
- (void)cancelEvent:(id)a3;
- (void)cancelEvents:(id)a3;
- (void)confirmOrRejectContact:(id)a3;
- (void)rejectReminderFromThisDevice:(id)a3;
- (void)removeAllStoredPseudoContacts;
@end

@implementation SGInMemoryAdapter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reminders, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_storeStrong((id *)&self->_events, 0);
}

- (NSArray)reminders
{
  return &self->_reminders->super;
}

- (void)rejectReminderFromThisDevice:(id)a3
{
  id v4 = a3;
  reminders = self->_reminders;
  v6 = (void *)MEMORY[0x1E4F28F60];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__SGInMemoryAdapter_rejectReminderFromThisDevice___block_invoke;
  v9[3] = &unk_1E65B6A18;
  id v10 = v4;
  id v7 = v4;
  v8 = [v6 predicateWithBlock:v9];
  [(NSMutableArray *)reminders filterUsingPredicate:v8];
}

uint64_t __50__SGInMemoryAdapter_rejectReminderFromThisDevice___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 duplicateKey];
  id v4 = [v3 serialize];

  if (v4)
  {
    v5 = [*(id *)(a1 + 32) duplicateKey];
    v6 = [v5 serialize];
    uint64_t v7 = [v6 isEqualToString:v4] ^ 1;
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)addReminder:(id)a3
{
}

- (void)removeAllStoredPseudoContacts
{
}

- (void)calendarDeleted
{
}

- (NSArray)contacts
{
  v3 = (void *)MEMORY[0x1CB79B230](self, a2);
  id v4 = [(NSMutableDictionary *)self->_contacts allValues];
  return (NSArray *)v4;
}

- (NSArray)events
{
  return (NSArray *)[(NSMutableArray *)self->_events _pas_mappedArrayWithTransform:&__block_literal_global_6764];
}

uint64_t __27__SGInMemoryAdapter_events__block_invoke(uint64_t a1, void *a2)
{
  return [a2 second];
}

- (void)confirmOrRejectContact:(id)a3
{
  contacts = self->_contacts;
  objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(a3, "masterEntityId"));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(NSMutableDictionary *)contacts removeObjectForKey:v4];
}

- (void)cancelEvents:(id)a3
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
        [(SGInMemoryAdapter *)self cancelEvent:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)cancelEvent:(id)a3
{
  id v4 = [a3 duplicateKey];
  uint64_t v5 = [v4 entityKey];
  uint64_t v6 = [v5 serialize];

  events = self->_events;
  uint64_t v8 = (void *)MEMORY[0x1E4F28F60];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __33__SGInMemoryAdapter_cancelEvent___block_invoke;
  v11[3] = &unk_1E65B69D0;
  id v12 = v6;
  id v9 = v6;
  long long v10 = [v8 predicateWithBlock:v11];
  [(NSMutableArray *)events filterUsingPredicate:v10];
}

uint64_t __33__SGInMemoryAdapter_cancelEvent___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 first];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)] ^ 1;

  return v4;
}

- (void)addContact:(id)a3
{
  contacts = self->_contacts;
  uint64_t v4 = NSNumber;
  id v5 = a3;
  objc_msgSend(v4, "numberWithLongLong:", objc_msgSend(v5, "masterEntityId"));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(NSMutableDictionary *)contacts setObject:v5 forKeyedSubscript:v6];
}

- (void)addEvents:(id)a3
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
        [(SGInMemoryAdapter *)self addEvent:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)addEvent:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 duplicateKey];
  uint64_t v6 = [v5 entityKey];
  uint64_t v7 = [v6 serialize];

  uint64_t v8 = objc_opt_new();
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v9 = self->_events;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (!v10)
  {

    [(NSMutableArray *)self->_events removeObjectsInArray:v8];
LABEL_15:
    events = self->_events;
    v24 = (void *)MEMORY[0x1E4F93BB8];
    v25 = [v4 duplicateKey];
    v26 = [v25 entityKey];
    v27 = [v26 serialize];
    v28 = [v24 tupleWithFirst:v27 second:v4];
    [(NSMutableArray *)events addObject:v28];

    goto LABEL_16;
  }
  uint64_t v11 = v10;
  v29 = self;
  v30 = v8;
  uint64_t v12 = *(void *)v32;
  char v13 = 1;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v32 != v12) {
        objc_enumerationMutation(v9);
      }
      v15 = *(void **)(*((void *)&v31 + 1) + 8 * i);
      v16 = objc_msgSend(v15, "first", v29);
      int v17 = [v16 isEqualToString:v7];

      if (v17)
      {
        [v4 creationTimestamp];
        double v19 = v18;
        v20 = [v15 second];
        [v20 creationTimestamp];
        double v22 = v21;

        if (v19 <= v22) {
          char v13 = 0;
        }
        else {
          [v30 addObject:v15];
        }
      }
    }
    uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v31 objects:v35 count:16];
  }
  while (v11);

  self = v29;
  uint64_t v8 = v30;
  [(NSMutableArray *)v29->_events removeObjectsInArray:v30];
  if (v13) {
    goto LABEL_15;
  }
LABEL_16:
}

- (SGInMemoryAdapter)init
{
  v10.receiver = self;
  v10.super_class = (Class)SGInMemoryAdapter;
  v2 = [(SGInMemoryAdapter *)&v10 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    events = v2->_events;
    v2->_events = (NSMutableArray *)v3;

    uint64_t v5 = objc_opt_new();
    contacts = v2->_contacts;
    v2->_contacts = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_opt_new();
    reminders = v2->_reminders;
    v2->_reminders = (NSMutableArray *)v7;
  }
  return v2;
}

@end