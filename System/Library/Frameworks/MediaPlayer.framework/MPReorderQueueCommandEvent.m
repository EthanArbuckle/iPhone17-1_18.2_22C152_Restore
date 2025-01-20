@interface MPReorderQueueCommandEvent
- (MPReorderQueueCommandEvent)initWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5;
- (NSString)insertAfterContextItemID;
- (NSString)insertBeforeContextItemID;
- (int64_t)destinationOffset;
@end

@implementation MPReorderQueueCommandEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_insertAfterContextItemID, 0);

  objc_storeStrong((id *)&self->_insertBeforeContextItemID, 0);
}

- (int64_t)destinationOffset
{
  return self->_destinationOffset;
}

- (NSString)insertAfterContextItemID
{
  return self->_insertAfterContextItemID;
}

- (NSString)insertBeforeContextItemID
{
  return self->_insertBeforeContextItemID;
}

- (MPReorderQueueCommandEvent)initWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  v18.receiver = self;
  v18.super_class = (Class)MPReorderQueueCommandEvent;
  v9 = [(MPRemoteCommandEvent *)&v18 initWithCommand:a3 mediaRemoteType:v5 options:v8];
  if (v9)
  {
    uint64_t v10 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F776B0]];
    insertAfterContextItemID = v9->_insertAfterContextItemID;
    v9->_insertAfterContextItemID = (NSString *)v10;

    uint64_t v12 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F776B8]];
    insertBeforeContextItemID = v9->_insertBeforeContextItemID;
    v9->_insertBeforeContextItemID = (NSString *)v12;

    v14 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F776E0]];
    v15 = v14;
    if (v14) {
      uint64_t v16 = [v14 integerValue];
    }
    else {
      uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v9->_destinationOffset = v16;
  }
  return v9;
}

@end