@interface _MBLCullOldMessagesJob
- (NSMutableArray)messages;
- (id)initForMBLMailbox:(id)a3;
- (void)run;
- (void)setMessages:(id)a3;
@end

@implementation _MBLCullOldMessagesJob

- (void)setMessages:(id)a3
{
  v4 = (NSMutableArray *)a3;
  if (self->_messages != v4)
  {
    v7 = v4;
    v5 = (NSMutableArray *)[(NSMutableArray *)v4 mutableCopy];
    messages = self->_messages;
    self->_messages = v5;

    v4 = v7;
  }
}

- (NSMutableArray)messages
{
  return self->_messages;
}

- (void)run
{
  v2 = +[NSMutableArray array];
  __int16 context = 256;
  v3 = (CFComparisonResult (__cdecl *)(const void *, const void *, void *))MFComparatorFunctionForSortOrder();
  messages = self->_messages;
  v23.length = (CFIndex)[(NSMutableArray *)messages count];
  v23.location = 0;
  CFArraySortValues((CFMutableArrayRef)messages, v23, v3, &context);
  v5 = +[NSCountedSet set];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v6 = self->_messages;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v18;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v11 = [v10 mailbox];
        v12 = v11;
        if (v11)
        {
          id v13 = v11;
        }
        else
        {
          id v13 = +[NSNull null];
        }
        v14 = v13;

        [v5 addObject:v14];
        if ((unint64_t)[v5 countForObject:v14] >= 0xC9) {
          [v2 addObject:v10];
        }
      }
      id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v7);
  }

  id WeakRetained = objc_loadWeakRetained(&self->_messageBodyLoader);
  [WeakRetained _removeNewMessages:v2];
}

- (id)initForMBLMailbox:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_MBLCullOldMessagesJob;
  v5 = [(_MBLCullOldMessagesJob *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak(&v5->_messageBodyLoader, v4);
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messages, 0);

  objc_destroyWeak(&self->_messageBodyLoader);
}

@end