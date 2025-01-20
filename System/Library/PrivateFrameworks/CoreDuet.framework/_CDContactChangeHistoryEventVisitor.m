@interface _CDContactChangeHistoryEventVisitor
- (NSArray)deletedContactIdentifiers;
- (_CDContactChangeHistoryEventVisitor)initWithChangeEnumerator:(id)a3;
- (void)reset;
- (void)visitDeleteContactEvent:(id)a3;
- (void)visitEventsWithBatchSize:(unint64_t)a3 batchCallback:(id)a4;
@end

@implementation _CDContactChangeHistoryEventVisitor

- (_CDContactChangeHistoryEventVisitor)initWithChangeEnumerator:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_CDContactChangeHistoryEventVisitor;
  v6 = [(_CDContactChangeHistoryEventVisitor *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_changeEnumerator, a3);
    [(_CDContactChangeHistoryEventVisitor *)v7 reset];
  }

  return v7;
}

- (void)visitEventsWithBatchSize:(unint64_t)a3 batchCallback:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v6 = (void (**)(id, _CDContactChangeHistoryEventVisitor *, unsigned char *))a4;
  char v18 = 0;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v7 = self->_changeEnumerator;
  uint64_t v8 = [(NSEnumerator *)v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v14 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x192FB2F20](v8);
        objc_msgSend(v12, "acceptEventVisitor:", self, (void)v14);
        if (self->_count >= a3)
        {
          v6[2](v6, self, &v18);
          [(_CDContactChangeHistoryEventVisitor *)self reset];
          if (v18)
          {

            goto LABEL_13;
          }
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v8 = [(NSEnumerator *)v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
      uint64_t v9 = v8;
      if (v8) {
        continue;
      }
      break;
    }
  }

  if (self->_count)
  {
    v6[2](v6, self, &v18);
    [(_CDContactChangeHistoryEventVisitor *)self reset];
  }
LABEL_13:
}

- (NSArray)deletedContactIdentifiers
{
  v2 = (void *)[(NSMutableArray *)self->_deletedContactIdentifiers copy];
  return (NSArray *)v2;
}

- (void)reset
{
  v3 = (NSMutableArray *)objc_opt_new();
  deletedContactIdentifiers = self->_deletedContactIdentifiers;
  self->_deletedContactIdentifiers = v3;

  self->_count = 0;
}

- (void)visitDeleteContactEvent:(id)a3
{
  deletedContactIdentifiers = self->_deletedContactIdentifiers;
  id v5 = [a3 contactIdentifier];
  [(NSMutableArray *)deletedContactIdentifiers addObject:v5];

  ++self->_count;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedContactIdentifiers, 0);
  objc_storeStrong((id *)&self->_changeEnumerator, 0);
}

@end