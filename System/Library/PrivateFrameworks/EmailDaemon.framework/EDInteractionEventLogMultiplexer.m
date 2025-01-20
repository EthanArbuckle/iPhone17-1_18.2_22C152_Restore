@interface EDInteractionEventLogMultiplexer
- (EDInteractionEventLogMultiplexer)initWithLogs:(id)a3;
- (NSArray)logs;
- (id)description;
- (void)persistEvent:(id)a3 dataFromMessage:(id)a4;
- (void)persistEvent:(id)a3 dataFromMessage:(id)a4 account:(id)a5;
- (void)persistEvent:(id)a3 date:(id)a4 conversationID:(int64_t)a5 data:(id)a6;
- (void)persistEvent:(id)a3 date:(id)a4 message:(id)a5 data:(id)a6;
- (void)persistEvent:(id)a3 date:(id)a4 message:(id)a5 mailbox:(id)a6;
- (void)persistEvent:(id)a3 date:(id)a4 message:(id)a5 mailboxType:(int64_t)a6;
- (void)setLogs:(id)a3;
@end

@implementation EDInteractionEventLogMultiplexer

- (EDInteractionEventLogMultiplexer)initWithLogs:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EDInteractionEventLogMultiplexer;
  v6 = [(EDInteractionEventLogMultiplexer *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_logs, a3);
  }

  return v7;
}

- (void)persistEvent:(id)a3 date:(id)a4 message:(id)a5 data:(id)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v14 = [(EDInteractionEventLogMultiplexer *)self logs];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v19;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v14);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * v17++) persistEvent:v10 date:v11 message:v12 data:v13];
      }
      while (v15 != v17);
      uint64_t v15 = [v14 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v15);
  }
}

- (void)persistEvent:(id)a3 date:(id)a4 conversationID:(int64_t)a5 data:(id)a6
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v13 = [(EDInteractionEventLogMultiplexer *)self logs];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v13);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * v16++) persistEvent:v10 date:v11 conversationID:a5 data:v12];
      }
      while (v14 != v16);
      uint64_t v14 = [v13 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v14);
  }
}

- (void)persistEvent:(id)a3 dataFromMessage:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v8 = [(EDInteractionEventLogMultiplexer *)self logs];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v11++) persistEvent:v6 dataFromMessage:v7];
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)persistEvent:(id)a3 dataFromMessage:(id)a4 account:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v11 = [(EDInteractionEventLogMultiplexer *)self logs];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * v14++) persistEvent:v8 dataFromMessage:v9 account:v10];
      }
      while (v12 != v14);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

- (void)persistEvent:(id)a3 date:(id)a4 message:(id)a5 mailbox:(id)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v14 = [(EDInteractionEventLogMultiplexer *)self logs];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v19;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v14);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * v17++) persistEvent:v10 date:v11 message:v12 mailbox:v13];
      }
      while (v15 != v17);
      uint64_t v15 = [v14 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v15);
  }
}

- (void)persistEvent:(id)a3 date:(id)a4 message:(id)a5 mailboxType:(int64_t)a6
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v13 = [(EDInteractionEventLogMultiplexer *)self logs];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v13);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * v16++) persistEvent:v10 date:v11 message:v12 mailboxType:a6];
      }
      while (v14 != v16);
      uint64_t v14 = [v13 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v14);
  }
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  id v5 = [(EDInteractionEventLogMultiplexer *)self logs];
  id v6 = (void *)[v3 initWithFormat:@"<%@ %p: %@>", v4, self, v5];

  return v6;
}

- (NSArray)logs
{
  return self->_logs;
}

- (void)setLogs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end