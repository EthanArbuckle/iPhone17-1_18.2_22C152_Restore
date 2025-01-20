@interface _MPCPlaybackEngineEventStreamCursor
- (MPCPlaybackEngineEvent)endEvent;
- (MPCPlaybackEngineEvent)startEvent;
- (MPCPlaybackEngineEventStream)eventStream;
- (NSString)description;
- (_MPCPlaybackEngineEventStreamCursor)initWithEventStream:(id)a3 fromNanoSeconds:(unint64_t)a4 endEvent:(id)a5;
- (_MPCPlaybackEngineEventStreamCursor)initWithEventStream:(id)a3 startEvent:(id)a4 endEvent:(id)a5;
- (id)_statementForColumnsExpression:(void *)a3 eventTypes:(void *)a4 payload:(uint64_t)a5 limit:;
- (id)_statementForEventTypes:(void *)a3 payload:(uint64_t)a4 limit:;
- (id)cursorFromEvent:(id)a3 untilEvent:(id)a4;
- (id)cursorUntilEvent:(id)a3;
- (id)findPreviousEventWithType:(id)a3 matchingPayload:(id)a4;
- (id)findPreviousEventWithTypes:(id)a3 matchingPayload:(id)a4;
- (int64_t)countOfPreviousEventsWithType:(id)a3 matchingPayload:(id)a4;
- (int64_t)countOfPreviousEventsWithTypes:(id)a3 matchingPayload:(id)a4;
- (void)enumeratePreviousEventsWithType:(id)a3 matchingPayload:(id)a4 usingBlock:(id)a5;
- (void)enumeratePreviousEventsWithType:(id)a3 usingBlock:(id)a4;
- (void)enumeratePreviousEventsWithTypes:(id)a3 matchingPayload:(id)a4 usingBlock:(id)a5;
- (void)enumeratePreviousEventsWithTypes:(id)a3 usingBlock:(id)a4;
@end

@implementation _MPCPlaybackEngineEventStreamCursor

- (id)_statementForColumnsExpression:(void *)a3 eventTypes:(void *)a4 payload:(uint64_t)a5 limit:
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v32 = a2;
  id v9 = a3;
  id v10 = a4;
  uint64_t v36 = a1;
  v34 = v10;
  if (a1)
  {
    v33 = MPCPlaybackEngineEventPayloadJSONFromPayload(v10);
    v11 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v34, "count"));
    _MPCPlaybackEngineEventFlattenPayload(v33, v11, &unk_26CC19658);
    uint64_t v12 = [v9 count];
    if ((unint64_t)(v12 + 2 * [v11 count] + 3) >= 0x3E7)
    {
      v30 = [MEMORY[0x263F08690] currentHandler];
      [v30 handleFailureInMethod:sel__statementForColumnsExpression_eventTypes_payload_limit_ object:a1 file:@"MPCPlaybackEngineEventStream.m" lineNumber:1108 description:@"Query too large"];
    }
    v13 = [MEMORY[0x263F089D8] stringWithFormat:@"SELECT %@ FROM events", v32];
    v14 = [MEMORY[0x263EFF980] arrayWithCapacity:1];
    if ([v11 count] && objc_msgSend(v11, "count"))
    {
      unint64_t v15 = 0;
      do
      {
        [v13 appendFormat:@", json_tree(events.payload, @payload_key_%d) AS payload_%d", v15, v15];
        v16 = objc_msgSend(NSString, "stringWithFormat:", @"(payload_%d.value IS @payload_value_%d)", v15, v15);
        [v14 addObject:v16];

        ++v15;
      }
      while (v15 < [v11 count]);
    }
    if ([v9 count] == 1)
    {
      [v14 addObject:@"events.type = @type"];
    }
    else if ((unint64_t)[v9 count] >= 2)
    {
      v17 = objc_msgSend(@"events.type IN ("), "mutableCopy";
      if ([v9 count])
      {
        unint64_t v18 = 0;
        do
        {
          if (v18) {
            [v17 appendString:@", "];
          }
          objc_msgSend(v17, "appendFormat:", @"@type_%d", v18++);
        }
        while (v18 < [v9 count]);
      }
      [v17 appendString:@""]);
      [v14 addObject:v17];
    }
    [v14 addObject:@"_ns < @startNS"];
    if (*(void *)(a1 + 40)) {
      [v14 addObject:@"_ns > @endNS"];
    }
    [v13 appendString:@" WHERE "];
    v19 = [v14 componentsJoinedByString:@" AND "];
    [v13 appendString:v19];

    [v13 appendString:@" ORDER BY _ns DESC"];
    if (a5 >= 1) {
      objc_msgSend(v13, "appendFormat:", @" LIMIT %lld", 1);
    }
    v20 = -[MPCPlaybackEngineEventStream sql](*(void **)(a1 + 24));
    id v42 = 0;
    v31 = [v20 statementWithString:v13 error:&v42];
    id v35 = v42;

    if (v35)
    {
      v21 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEventStream");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        v22 = [*(id *)(a1 + 24) engineID];
        *(_DWORD *)buf = 138543874;
        *(void *)&buf[4] = v22;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v13;
        *(_WORD *)&buf[22] = 2114;
        id v44 = v35;
        _os_log_impl(&dword_21BB87000, v21, OS_LOG_TYPE_FAULT, "[EVS:%{public}@] _statementForColumnsExpression:… | failed to create statement [sql failure] sql=%{public}@ error=%{public}@", buf, 0x20u);
      }
      id v23 = 0;
    }
    else
    {
      [v31 bindUInt64Value:*(void *)(a1 + 8) toParameterNamed:@"@startNS"];
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      id v44 = 0;
      v37[0] = MEMORY[0x263EF8330];
      v37[1] = 3221225472;
      v37[2] = __95___MPCPlaybackEngineEventStreamCursor__statementForColumnsExpression_eventTypes_payload_limit___block_invoke;
      v37[3] = &unk_2643C3A50;
      v40 = buf;
      id v24 = v31;
      v41 = sel__statementForColumnsExpression_eventTypes_payload_limit_;
      id v38 = v24;
      uint64_t v39 = a1;
      [v11 enumerateKeysAndObjectsUsingBlock:v37];
      if ([v9 count] == 1)
      {
        v25 = [v9 firstObject];
        [v24 bindStringValue:v25 toParameterNamed:@"@type"];
      }
      else if ((unint64_t)[v9 count] >= 2)
      {
        for (unint64_t i = 0; i < [v9 count]; ++i)
        {
          v27 = [v9 objectAtIndexedSubscript:i];
          v28 = objc_msgSend(NSString, "stringWithFormat:", @"@type_%d", i);
          [v24 bindStringValue:v27 toParameterNamed:v28];
        }
      }
      if (*(void *)(v36 + 40)) {
        [v24 bindUInt64Value:*(void *)(v36 + 16) toParameterNamed:@"@endNS"];
      }
      id v23 = v24;

      _Block_object_dispose(buf, 8);
    }
  }
  else
  {
    id v23 = 0;
  }

  return v23;
}

- (id)findPreviousEventWithTypes:(id)a3 matchingPayload:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  eventStream = self->_eventStream;
  if (eventStream) {
    queue = eventStream->_queue;
  }
  else {
    queue = 0;
  }
  dispatch_assert_queue_V2(queue);
  id v10 = self->_eventStream;
  if (v10 && v10->_invalidated)
  {
    v11 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEventStream");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = [(MPCPlaybackEngineEventStream *)self->_eventStream engineID];
      *(_DWORD *)buf = 138543362;
      v26 = v12;
      _os_log_impl(&dword_21BB87000, v11, OS_LOG_TYPE_ERROR, "[EVS:%{public}@] findPreviousEventsWithTypes:… | return nil [invalidated]", buf, 0xCu);
    }
    v13 = 0;
  }
  else
  {
    v14 = -[MPCPlaybackEngineEventStream cachedEventWithTypes:matchingPayload:cursor:]((uint64_t)v10, v6, v7, self);
    if (v14)
    {
      v11 = v14;
      v13 = v11;
    }
    else
    {
      unint64_t v15 = -[_MPCPlaybackEngineEventStreamCursor _statementForEventTypes:payload:limit:](self, v6, v7, 1);
      v16 = -[MPCPlaybackEngineEventStream sql](&self->_eventStream->super.isa);
      v17 = [v16 resultsForStatement:v15];

      id v24 = 0;
      unint64_t v18 = [v17 nextObjectWithError:&v24];
      id v19 = v24;
      if (v19)
      {
        v20 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEventStream");
        if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
        {
          v21 = [(MPCPlaybackEngineEventStream *)self->_eventStream engineID];
          *(_DWORD *)buf = 134218498;
          v26 = v21;
          __int16 v27 = 2114;
          id v28 = v6;
          __int16 v29 = 2114;
          id v30 = v19;
          _os_log_impl(&dword_21BB87000, v20, OS_LOG_TYPE_FAULT, "[EVS:%public}@] findPreviousEventsWithTypes:%{public}@ … | failed to find events [sql failure] error=%{public}@", buf, 0x20u);
        }
        v13 = 0;
      }
      else
      {
        if (v18)
        {
          v13 = +[MPCPlaybackEngineEvent eventFromRowResult:]((uint64_t)MPCPlaybackEngineEvent, v18);
          if (v13)
          {
            v22 = self->_eventStream;
            if (v22) {
              dispatch_assert_queue_V2((dispatch_queue_t)v22->_queue);
            }
          }
        }
        else
        {
          v13 = 0;
        }
        [v15 invalidate];
      }

      v11 = 0;
    }
  }

  return v13;
}

- (_MPCPlaybackEngineEventStreamCursor)initWithEventStream:(id)a3 startEvent:(id)a4 endEvent:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)_MPCPlaybackEngineEventStreamCursor;
  uint64_t v12 = [(_MPCPlaybackEngineEventStreamCursor *)&v21 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_eventStream, a3);
    objc_storeStrong((id *)&v13->_startEvent, a4);
    if (v10)
    {
      [v10 monotonicTime];
      [v10 monotonicTime];
      unint64_t v14 = v19 + v20;
    }
    else
    {
      unint64_t v14 = 0;
    }
    v13->_startNS = v14;
    objc_storeStrong((id *)&v13->_endEvent, a5);
    if (v11)
    {
      [v11 monotonicTime];
      [v11 monotonicTime];
      unint64_t v15 = v17 + v18;
    }
    else
    {
      unint64_t v15 = 0;
    }
    v13->_endNS = v15;
  }

  return v13;
}

- (MPCPlaybackEngineEvent)startEvent
{
  return self->_startEvent;
}

- (MPCPlaybackEngineEvent)endEvent
{
  return self->_endEvent;
}

- (id)_statementForEventTypes:(void *)a3 payload:(uint64_t)a4 limit:
{
  if (a1)
  {
    a1 = -[_MPCPlaybackEngineEventStreamCursor _statementForColumnsExpression:eventTypes:payload:limit:]((uint64_t)a1, @"DISTINCT events.identifier, events.type, events.monoAbsolute, events.monoContinuous, events.monoTimebaseNS, events.userNS, events.threadPriority, events.payload", a2, a3, a4);
    uint64_t v4 = vars8;
  }
  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endEvent, 0);
  objc_storeStrong((id *)&self->_startEvent, 0);

  objc_storeStrong((id *)&self->_eventStream, 0);
}

- (id)findPreviousEventWithType:(id)a3 matchingPayload:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    id v14 = v6;
    v8 = (void *)MEMORY[0x263EFF8C0];
    id v9 = a4;
    id v10 = [v8 arrayWithObjects:&v14 count:1];
    id v11 = -[_MPCPlaybackEngineEventStreamCursor findPreviousEventWithTypes:matchingPayload:](self, "findPreviousEventWithTypes:matchingPayload:", v10, v9, v14, v15);
  }
  else
  {
    id v12 = a4;
    id v11 = [(_MPCPlaybackEngineEventStreamCursor *)self findPreviousEventWithTypes:MEMORY[0x263EFFA68] matchingPayload:v12];
  }

  return v11;
}

- (_MPCPlaybackEngineEventStreamCursor)initWithEventStream:(id)a3 fromNanoSeconds:(unint64_t)a4 endEvent:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_MPCPlaybackEngineEventStreamCursor;
  id v11 = [(_MPCPlaybackEngineEventStreamCursor *)&v17 init];
  id v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_eventStream, a3);
    v12->_startNS = a4;
    objc_storeStrong((id *)&v12->_endEvent, a5);
    if (v10)
    {
      [v10 monotonicTime];
      [v10 monotonicTime];
      unint64_t v13 = v15 + v16;
    }
    else
    {
      unint64_t v13 = 0;
    }
    v12->_endNS = v13;
  }

  return v12;
}

- (id)cursorUntilEvent:(id)a3
{
  startEvent = self->_startEvent;
  id v5 = a3;
  id v6 = [_MPCPlaybackEngineEventStreamCursor alloc];
  eventStream = self->_eventStream;
  if (startEvent) {
    uint64_t v8 = [(_MPCPlaybackEngineEventStreamCursor *)v6 initWithEventStream:eventStream startEvent:self->_startEvent endEvent:v5];
  }
  else {
    uint64_t v8 = [(_MPCPlaybackEngineEventStreamCursor *)v6 initWithEventStream:eventStream fromNanoSeconds:self->_startNS endEvent:v5];
  }
  id v9 = (void *)v8;

  return v9;
}

- (MPCPlaybackEngineEventStream)eventStream
{
  return self->_eventStream;
}

- (void)enumeratePreviousEventsWithTypes:(id)a3 matchingPayload:(id)a4 usingBlock:(id)a5
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, void *, unsigned char *))a5;
  eventStream = self->_eventStream;
  if (eventStream) {
    queue = eventStream->_queue;
  }
  else {
    queue = 0;
  }
  dispatch_assert_queue_V2(queue);
  if (![v9 count])
  {
    id v28 = [MEMORY[0x263F08690] currentHandler];
    [v28 handleFailureInMethod:a2 object:self file:@"MPCPlaybackEngineEventStream.m" lineNumber:1036 description:@"Must provide event types to enumerate."];

    if (v10) {
      goto LABEL_5;
    }
LABEL_23:
    __int16 v29 = [MEMORY[0x263F08690] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"MPCPlaybackEngineEventStream.m", 1037, @"Invalid parameter not satisfying: %@", @"payload" object file lineNumber description];

    goto LABEL_5;
  }
  if (!v10) {
    goto LABEL_23;
  }
LABEL_5:
  id v14 = self->_eventStream;
  if (v14 && v14->_invalidated)
  {
    uint64_t v15 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEventStream");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = [(MPCPlaybackEngineEventStream *)self->_eventStream engineID];
      *(_DWORD *)buf = 138543362;
      v33 = v16;
      _os_log_impl(&dword_21BB87000, v15, OS_LOG_TYPE_ERROR, "[EVS:%{public}@] enumeratePreviousEventsWithType:… | skipping enumeration [invalidated]", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v15 = -[_MPCPlaybackEngineEventStreamCursor _statementForEventTypes:payload:limit:](self, v9, v10, 0);
    objc_super v17 = -[MPCPlaybackEngineEventStream sql](&self->_eventStream->super.isa);
    uint64_t v18 = [v17 resultsForStatement:v15];

    char v31 = 0;
    id v30 = 0;
    uint64_t v19 = [v18 nextObjectWithError:&v30];
    id v20 = v30;
    objc_super v21 = v20;
    if (v19)
    {
      do
      {
        v22 = (void *)MEMORY[0x21D49E0F0]();
        id v23 = +[MPCPlaybackEngineEvent eventFromRowResult:]((uint64_t)MPCPlaybackEngineEvent, v19);
        if (v23) {
          v11[2](v11, v23, &v31);
        }

        id v30 = v21;
        id v24 = [v18 nextObjectWithError:&v30];
        id v25 = v30;

        if (!v24) {
          break;
        }
        objc_super v21 = v25;
        uint64_t v19 = v24;
      }
      while (!v31);
    }
    else
    {
      id v25 = v20;
    }
    [v15 invalidate];
    if (v25)
    {
      v26 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEventStream");
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      {
        __int16 v27 = [(MPCPlaybackEngineEventStream *)self->_eventStream engineID];
        *(_DWORD *)buf = 138543874;
        v33 = v27;
        __int16 v34 = 2114;
        id v35 = v9;
        __int16 v36 = 2114;
        id v37 = v25;
        _os_log_impl(&dword_21BB87000, v26, OS_LOG_TYPE_FAULT, "[EVS:%{public}@] enumeratePreviousEventsWithTypes:%{public}@ … | failed enumeration [sql failure] error=%{public}@", buf, 0x20u);
      }
    }
  }
}

- (void)enumeratePreviousEventsWithTypes:(id)a3 usingBlock:(id)a4
{
}

- (void)enumeratePreviousEventsWithType:(id)a3 matchingPayload:(id)a4 usingBlock:(id)a5
{
  v14[1] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v10)
  {
    unint64_t v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"MPCPlaybackEngineEventStream.m", 1026, @"Invalid parameter not satisfying: %@", @"payload" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    [(_MPCPlaybackEngineEventStreamCursor *)self enumeratePreviousEventsWithTypes:MEMORY[0x263EFFA68] matchingPayload:v10 usingBlock:v11];
    goto LABEL_6;
  }
  if (!v9) {
    goto LABEL_5;
  }
LABEL_3:
  v14[0] = v9;
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  [(_MPCPlaybackEngineEventStreamCursor *)self enumeratePreviousEventsWithTypes:v12 matchingPayload:v10 usingBlock:v11];

LABEL_6:
}

- (void)enumeratePreviousEventsWithType:(id)a3 usingBlock:(id)a4
{
  v11[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"MPCPlaybackEngineEventStream.m", 1021, @"Invalid parameter not satisfying: %@", @"eventType" object file lineNumber description];
  }
  v11[0] = v7;
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  [(_MPCPlaybackEngineEventStreamCursor *)self enumeratePreviousEventsWithTypes:v9 matchingPayload:MEMORY[0x263EFFA78] usingBlock:v8];
}

- (int64_t)countOfPreviousEventsWithTypes:(id)a3 matchingPayload:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  eventStream = self->_eventStream;
  if (eventStream && eventStream->_invalidated)
  {
    id v9 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEventStream");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = [(MPCPlaybackEngineEventStream *)self->_eventStream engineID];
      int v17 = 138543362;
      uint64_t v18 = v10;
      _os_log_impl(&dword_21BB87000, v9, OS_LOG_TYPE_ERROR, "[EVS:%{public}@] countOfPreviousEventsWithTypes:… | returning 0 [invalidated]", (uint8_t *)&v17, 0xCu);
    }
    int64_t v11 = 0;
  }
  else
  {
    id v12 = -[_MPCPlaybackEngineEventStreamCursor _statementForColumnsExpression:eventTypes:payload:limit:]((uint64_t)self, @"COUNT(DISTINCT events.identifier)", v6, v7, 0);
    unint64_t v13 = -[MPCPlaybackEngineEventStream sql](&self->_eventStream->super.isa);
    id v14 = [v13 resultsForStatement:v12];

    uint64_t v15 = [v14 nextObject];
    int64_t v11 = (int)[v15 int64ValueAtColumnIndex:0];
    [v12 invalidate];
  }
  return v11;
}

- (int64_t)countOfPreviousEventsWithType:(id)a3 matchingPayload:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    id v13 = v6;
    id v8 = (void *)MEMORY[0x263EFF8C0];
    id v9 = a4;
    id v10 = [v8 arrayWithObjects:&v13 count:1];
    int64_t v11 = -[_MPCPlaybackEngineEventStreamCursor countOfPreviousEventsWithTypes:matchingPayload:](self, "countOfPreviousEventsWithTypes:matchingPayload:", v10, v9, v13, v14);
  }
  else
  {
    id v10 = a4;
    int64_t v11 = [(_MPCPlaybackEngineEventStreamCursor *)self countOfPreviousEventsWithTypes:MEMORY[0x263EFFA68] matchingPayload:v10];
  }

  return v11;
}

- (id)cursorFromEvent:(id)a3 untilEvent:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (!v8) {
      goto LABEL_5;
    }
  }
  else
  {
    uint64_t v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"MPCPlaybackEngineEventStream.m", 996, @"Invalid parameter not satisfying: %@", @"startEvent" object file lineNumber description];

    if (!v9) {
      goto LABEL_5;
    }
  }
  id v10 = [v7 earlierEvent:v9];

  if (v10 != v9)
  {
    int64_t v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"MPCPlaybackEngineEventStream.m" lineNumber:997 description:@"Start event must be chronologically AFTER the limiting event."];
  }
LABEL_5:
  id v12 = [[_MPCPlaybackEngineEventStreamCursor alloc] initWithEventStream:self->_eventStream startEvent:v7 endEvent:v9];

  return v12;
}

- (NSString)description
{
  startEvent = self->_startEvent;
  uint64_t v4 = NSString;
  uint64_t v5 = objc_opt_class();
  if (startEvent)
  {
    endEvent = self->_endEvent;
    if (!endEvent) {
      endEvent = (MPCPlaybackEngineEvent *)@"…";
    }
    [v4 stringWithFormat:@"<%@: %p %@ -> %@>", v5, self, self->_startEvent, endEvent];
  }
  else
  {
    id v7 = self->_endEvent;
    if (!v7) {
      id v7 = (MPCPlaybackEngineEvent *)@"…";
    }
    [v4 stringWithFormat:@"<%@: %p %lld -> %@", v5, self, self->_startNS, v7];
  id v8 = };

  return (NSString *)v8;
}

@end