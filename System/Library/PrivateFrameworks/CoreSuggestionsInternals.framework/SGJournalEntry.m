@interface SGJournalEntry
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToJournalEntry:(id)a3;
- (NSArray)eventBatch;
- (SGJournalEntry)initWithOperation:(unint64_t)a3;
- (SGJournalEntry)initWithOperation:(unint64_t)a3 contact:(id)a4;
- (SGJournalEntry)initWithOperation:(unint64_t)a3 event:(id)a4;
- (SGJournalEntry)initWithOperation:(unint64_t)a3 eventBatch:(id)a4;
- (SGJournalEntry)initWithOperation:(unint64_t)a3 reminder:(id)a4;
- (SGStorageContact)contact;
- (SGStorageEvent)event;
- (SGStorageReminder)reminder;
- (id)description;
- (unint64_t)operation;
@end

@implementation SGJournalEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reminder, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_eventBatch, 0);
  objc_storeStrong((id *)&self->_event, 0);
}

- (SGStorageReminder)reminder
{
  return self->_reminder;
}

- (SGStorageContact)contact
{
  return self->_contact;
}

- (NSArray)eventBatch
{
  return self->_eventBatch;
}

- (SGStorageEvent)event
{
  return self->_event;
}

- (unint64_t)operation
{
  return self->_operation;
}

- (id)description
{
  id v3 = [NSString alloc];
  event = self->_event;
  if (!event)
  {
    event = self->_contact;
    if (!event) {
      event = self->_reminder;
    }
  }
  v5 = (void *)[v3 initWithFormat:@"<SGJournalEntry op:%lu entity:%@", self->_operation, event];
  return v5;
}

- (BOOL)isEqualToJournalEntry:(id)a3
{
  v4 = (SGJournalEntry *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    event = self->_event;
    v7 = v4->_event;
    if (event == v7)
    {
    }
    else
    {
      v8 = v7;
      v9 = event;
      BOOL v10 = [(SGStorageEvent *)v9 isEqual:v8];

      if (!v10) {
        goto LABEL_10;
      }
    }
    unint64_t operation = self->_operation;
    if (operation != [(SGJournalEntry *)v5 operation])
    {
LABEL_10:
      char v11 = 0;
      goto LABEL_13;
    }
    v13 = self->_contact;
    v14 = v13;
    if (v13 == v5->_contact) {
      char v11 = 1;
    }
    else {
      char v11 = -[SGStorageContact isEqual:](v13, "isEqual:");
    }
  }
LABEL_13:

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SGJournalEntry *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGJournalEntry *)self isEqualToJournalEntry:v5];

  return v6;
}

- (SGJournalEntry)initWithOperation:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SGJournalEntry;
  result = [(SGJournalEntry *)&v5 init];
  if (result) {
    result->_unint64_t operation = a3;
  }
  return result;
}

- (SGJournalEntry)initWithOperation:(unint64_t)a3 reminder:(id)a4
{
  id v8 = a4;
  if (!v8)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SGJournalEntry.m", 52, @"Invalid parameter not satisfying: %@", @"reminder" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)SGJournalEntry;
  v9 = [(SGJournalEntry *)&v13 init];
  BOOL v10 = v9;
  if (v9)
  {
    v9->_unint64_t operation = a3;
    objc_storeStrong((id *)&v9->_reminder, a4);
  }

  return v10;
}

- (SGJournalEntry)initWithOperation:(unint64_t)a3 contact:(id)a4
{
  id v8 = a4;
  if (!v8)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SGJournalEntry.m", 42, @"Invalid parameter not satisfying: %@", @"contact" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)SGJournalEntry;
  v9 = [(SGJournalEntry *)&v13 init];
  BOOL v10 = v9;
  if (v9)
  {
    v9->_unint64_t operation = a3;
    objc_storeStrong((id *)&v9->_contact, a4);
  }

  return v10;
}

- (SGJournalEntry)initWithOperation:(unint64_t)a3 eventBatch:(id)a4
{
  id v8 = a4;
  if (!v8)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SGJournalEntry.m", 32, @"Invalid parameter not satisfying: %@", @"eventBatch" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)SGJournalEntry;
  v9 = [(SGJournalEntry *)&v13 init];
  BOOL v10 = v9;
  if (v9)
  {
    v9->_unint64_t operation = a3;
    objc_storeStrong((id *)&v9->_eventBatch, a4);
  }

  return v10;
}

- (SGJournalEntry)initWithOperation:(unint64_t)a3 event:(id)a4
{
  id v8 = a4;
  if (!v8)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SGJournalEntry.m", 22, @"Invalid parameter not satisfying: %@", @"event" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)SGJournalEntry;
  v9 = [(SGJournalEntry *)&v13 init];
  BOOL v10 = v9;
  if (v9)
  {
    v9->_unint64_t operation = a3;
    objc_storeStrong((id *)&v9->_event, a4);
  }

  return v10;
}

@end