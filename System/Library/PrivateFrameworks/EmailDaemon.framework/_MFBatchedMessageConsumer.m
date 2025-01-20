@interface _MFBatchedMessageConsumer
- (BOOL)shouldCancel;
- (MFLibraryStore)messageStore;
- (NSMutableArray)messagesAccumulator;
- (_MFBatchedMessageConsumer)initWithBatchSize:(unint64_t)a3 messageStore:(id)a4 filter:(id)a5;
- (id)filter;
- (unint64_t)batchSize;
- (void)newMessagesAvailable:(id)a3;
- (void)setBatchSize:(unint64_t)a3;
- (void)setFilter:(id)a3;
- (void)setMessageStore:(id)a3;
- (void)setMessagesAccumulator:(id)a3;
@end

@implementation _MFBatchedMessageConsumer

- (_MFBatchedMessageConsumer)initWithBatchSize:(unint64_t)a3 messageStore:(id)a4 filter:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_MFBatchedMessageConsumer;
  v11 = [(_MFBatchedMessageConsumer *)&v17 init];
  if (v11)
  {
    v12 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    messagesAccumulator = v11->_messagesAccumulator;
    v11->_messagesAccumulator = v12;

    v11->_batchSize = a3;
    id v14 = objc_retainBlock(v10);
    id filter = v11->_filter;
    v11->_id filter = v14;

    objc_storeStrong((id *)&v11->_messageStore, a4);
  }

  return v11;
}

- (void)newMessagesAvailable:(id)a3
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = a3;
  id v4 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v17;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v17 != v5) {
        objc_enumerationMutation(obj);
      }
      v7 = *(void **)(*((void *)&v16 + 1) + 8 * v6);
      unsigned __int8 v9 = [(_MFBatchedMessageConsumer *)self shouldCancel];
      if ((v9 & 1) == 0)
      {
        id v10 = [(_MFBatchedMessageConsumer *)self filter];
        if (!v10
          || ([(_MFBatchedMessageConsumer *)self filter],
              v11 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue(),
              int v12 = ((uint64_t (**)(void, void *))v11)[2](v11, v7),
              v11,
              v10,
              v12))
        {
          v13 = [(_MFBatchedMessageConsumer *)self messageStore];
          [v7 setMessageStore:v13];

          id v14 = [(_MFBatchedMessageConsumer *)self messagesAccumulator];
          [v14 addObject:v7];
        }
      }
      if (v9) {
        break;
      }
      if (v4 == (id)++v6)
      {
        id v4 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v4) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (BOOL)shouldCancel
{
  v2 = self;
  v3 = [(_MFBatchedMessageConsumer *)self messagesAccumulator];
  id v4 = [v3 count];
  LOBYTE(v2) = v4 >= (id)[(_MFBatchedMessageConsumer *)v2 batchSize];

  return (char)v2;
}

- (NSMutableArray)messagesAccumulator
{
  return self->_messagesAccumulator;
}

- (void)setMessagesAccumulator:(id)a3
{
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_batchSize = a3;
}

- (MFLibraryStore)messageStore
{
  return self->_messageStore;
}

- (void)setMessageStore:(id)a3
{
}

- (id)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_filter, 0);
  objc_storeStrong((id *)&self->_messageStore, 0);

  objc_storeStrong((id *)&self->_messagesAccumulator, 0);
}

@end