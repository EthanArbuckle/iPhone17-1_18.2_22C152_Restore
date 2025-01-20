@interface OSLogDeserializedEventStream
- (BOOL)hasActivated;
- (NSArray)curEventArray;
- (NSDate)firstDate;
- (NSDate)lastDate;
- (NSEnumerator)eventDictionaryEnumerator;
- (OSLogDeserializedEventStream)initWithDataSourceDelegate:(id)a3;
- (OSLogEventDeserializerDataSourceDelegate)dataSourceDelegate;
- (_OSLogEventSerializationMetadata)metadata;
- (id)_eventArrayFromData:(id)a3;
- (id)_nextEventDictionary;
- (void)_iterateThroughEventsWithProxy:(id)a3 filter:(id)a4 startingDate:(id)a5;
- (void)_runInvalidationHandler:(unint64_t)a3;
- (void)_updateEventArray;
- (void)activate;
- (void)activateStreamFromDate:(id)a3;
- (void)setHasActivated:(BOOL)a3;
@end

@implementation OSLogDeserializedEventStream

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventDictionaryEnumerator, 0);
  objc_storeStrong((id *)&self->_curEventArray, 0);
  objc_storeStrong((id *)&self->_dataSourceDelegate, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

- (NSEnumerator)eventDictionaryEnumerator
{
  return self->_eventDictionaryEnumerator;
}

- (NSArray)curEventArray
{
  return self->_curEventArray;
}

- (OSLogEventDeserializerDataSourceDelegate)dataSourceDelegate
{
  return self->_dataSourceDelegate;
}

- (_OSLogEventSerializationMetadata)metadata
{
  return self->_metadata;
}

- (void)setHasActivated:(BOOL)a3
{
  self->_hasActivated = a3;
}

- (BOOL)hasActivated
{
  return self->_hasActivated;
}

- (void)activate
{
}

- (void)activateStreamFromDate:(id)a3
{
  id v5 = a3;
  v6 = [(OSLogEventStreamBase *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__OSLogDeserializedEventStream_activateStreamFromDate___block_invoke;
  block[3] = &unk_1E5A43268;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __55__OSLogDeserializedEventStream_activateStreamFromDate___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) streamHandler];

  if (!v2)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 32), @"EventSerializer.m", 799, @"Cannot activate %@ without streamHandler block", objc_opt_class() object file lineNumber description];
  }
  if ([*(id *)(a1 + 32) hasActivated])
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 32), @"EventSerializer.m", 800, @"Cannot activate the same %@ instance twice", objc_opt_class() object file lineNumber description];
  }
  [*(id *)(a1 + 32) setHasActivated:1];
  [*(id *)(a1 + 32) _updateEventArray];
  id v6 = [*(id *)(a1 + 32) filterPredicate];
  id v3 = +[OSLogEventProxy _make];
  [*(id *)(a1 + 32) _iterateThroughEventsWithProxy:v3 filter:v6 startingDate:*(void *)(a1 + 40)];
  [v3 _unmake];
}

- (void)_updateEventArray
{
  id v3 = [(OSLogDeserializedEventStream *)self dataSourceDelegate];
  v4 = [v3 nextEventDataChunk];
  id v5 = [(OSLogDeserializedEventStream *)self _eventArrayFromData:v4];
  curEventArray = self->_curEventArray;
  self->_curEventArray = v5;

  id v9 = [(OSLogDeserializedEventStream *)self curEventArray];
  id v7 = [v9 objectEnumerator];
  eventDictionaryEnumerator = self->_eventDictionaryEnumerator;
  self->_eventDictionaryEnumerator = v7;
}

- (id)_eventArrayFromData:(id)a3
{
  if (a3)
  {
    id v9 = 0;
    id v3 = [MEMORY[0x1E4F28F98] propertyListWithData:a3 options:0 format:0 error:&v9];
    id v4 = v9;
    if (v3)
    {
      objc_opt_class();
      id v5 = 0;
      if ((objc_opt_isKindOfClass() & 1) != 0 && !v4)
      {
        id v6 = [v3 objectForKeyedSubscript:@"Version"];
        if (v6
          && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          && ![v6 unsignedIntValue])
        {
          v8 = [v3 objectForKeyedSubscript:@"Events"];
          if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
            id v5 = v8;
          }
          else {
            id v5 = 0;
          }
        }
        else
        {
          id v5 = 0;
        }
      }
    }
    else
    {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (void)_iterateThroughEventsWithProxy:(id)a3 filter:(id)a4 startingDate:(id)a5
{
  id v18 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(OSLogDeserializedEventStream *)self _nextEventDictionary];
  if (v10)
  {
    v11 = (void *)v10;
    LOBYTE(v12) = 0;
    while (1)
    {
      [v18 setCurEventDictionary:v11];
      v13 = [(OSLogDeserializedEventStream *)self metadata];
      [v18 setMetadata:v13];

      int v14 = 1;
      if (v9 && !v12)
      {
        v15 = [v18 date];
        BOOL v12 = [v15 compare:v9] != -1;

        int v14 = v12;
      }
      if (v8 && v14) {
        int v14 = [v8 evaluateWithObject:v18];
      }
      if (v14)
      {
        v16 = [(OSLogEventStreamBase *)self streamHandler];
        ((void (**)(void, id))v16)[2](v16, v18);

        if ([(OSLogEventStreamBase *)self invalidated]) {
          break;
        }
      }
      uint64_t v17 = [(OSLogDeserializedEventStream *)self _nextEventDictionary];

      v11 = (void *)v17;
      if (!v17) {
        goto LABEL_12;
      }
    }
    [(OSLogDeserializedEventStream *)self _runInvalidationHandler:4];
  }
  else
  {
LABEL_12:
    if (![(OSLogEventStreamBase *)self invalidated])
    {
      [(OSLogEventStreamBase *)self invalidate];
      [(OSLogDeserializedEventStream *)self _runInvalidationHandler:5];
    }
  }
}

- (void)_runInvalidationHandler:(unint64_t)a3
{
  id v5 = [(OSLogEventStreamBase *)self invalidationHandler];

  if (v5)
  {
    id v7 = [(OSLogEventStreamBase *)self invalidationHandler];
    id v6 = [OSLogEventStreamPosition alloc];
    v7[2](v7, a3, v6);
  }
}

- (id)_nextEventDictionary
{
  id v3 = [(OSLogDeserializedEventStream *)self eventDictionaryEnumerator];
  id v4 = [v3 nextObject];

  if (!v4)
  {
    [(OSLogDeserializedEventStream *)self _updateEventArray];
    id v5 = [(OSLogDeserializedEventStream *)self eventDictionaryEnumerator];
    id v4 = [v5 nextObject];
  }
  return v4;
}

- (OSLogDeserializedEventStream)initWithDataSourceDelegate:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)OSLogDeserializedEventStream;
  id v6 = [(OSLogEventStreamBase *)&v14 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataSourceDelegate, a3);
    id v8 = [(OSLogDeserializedEventStream *)v7 dataSourceDelegate];
    id v9 = [v8 metadataChunk];

    uint64_t v10 = [[_OSLogEventSerializationMetadata alloc] initWithDataRepresentation:v9];
    if (!v10)
    {

      BOOL v12 = 0;
      goto LABEL_6;
    }
    metadata = v7->_metadata;
    v7->_metadata = v10;
  }
  BOOL v12 = v7;
LABEL_6:

  return v12;
}

- (NSDate)lastDate
{
  v2 = [(OSLogDeserializedEventStream *)self metadata];
  id v3 = [v2 lastDate];

  return (NSDate *)v3;
}

- (NSDate)firstDate
{
  v2 = [(OSLogDeserializedEventStream *)self metadata];
  id v3 = [v2 firstDate];

  return (NSDate *)v3;
}

@end