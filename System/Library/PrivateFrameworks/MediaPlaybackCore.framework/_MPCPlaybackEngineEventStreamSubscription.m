@interface _MPCPlaybackEngineEventStreamSubscription
- (MPCPlaybackEngineEventConsumer)consumer;
- (MPCPlaybackEngineEventStream)eventStream;
- (NSMutableDictionary)eventHandlers;
- (NSMutableDictionary)mutatingEventHandlers;
- (NSString)debugDescription;
- (NSString)streamID;
- (_MPCPlaybackEngineEventStreamSubscription)initWithConsumer:(id)a3 eventStream:(id)a4;
- (unint64_t)lastEventSuccessTimestamp;
- (unint64_t)maximumEventDeliveryTimestamp;
- (void)_onQueue_flush;
- (void)cancelSubscription;
- (void)flushEventsWithCompletion:(id)a3;
- (void)setLastEventSuccessTimestamp:(unint64_t)a3;
- (void)setMaximumEventDeliveryTimestamp:(unint64_t)a3;
- (void)subscribeToEventType:(id)a3 handler:(id)a4;
- (void)subscribeToEventType:(id)a3 options:(unint64_t)a4 handler:(id)a5;
@end

@implementation _MPCPlaybackEngineEventStreamSubscription

- (void)subscribeToEventType:(id)a3 options:(unint64_t)a4 handler:(id)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id aBlock = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_consumer);
  id v10 = objc_loadWeakRetained((id *)&self->_eventStream);
  v11 = [(id)objc_opt_class() identifier];
  v12 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEventStream");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v13 = [v10 engineID];
    *(_DWORD *)buf = 138544386;
    v27 = v13;
    __int16 v28 = 2114;
    v29 = v11;
    __int16 v30 = 2048;
    id v31 = WeakRetained;
    __int16 v32 = 2114;
    id v33 = v8;
    __int16 v34 = 2048;
    unint64_t v35 = a4;
    _os_log_impl(&dword_21BB87000, v12, OS_LOG_TYPE_DEBUG, "[EVS:%{public}@:%{public}@:%p] subscribeToEventType:%{public}@ options:%llu | adding handlers", buf, 0x34u);
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  p_mutatingEventHandlers = &self->_mutatingEventHandlers;
  v16 = [(NSMutableDictionary *)self->_mutatingEventHandlers objectForKeyedSubscript:v8];

  if (v16)
  {
    v22 = [MEMORY[0x263F08690] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"MPCPlaybackEngineEventStream.m", 859, @"Consumer %@ already has a mutating subscription to %@", v11, v8 object file lineNumber description];
  }
  p_eventHandlers = &self->_eventHandlers;
  v18 = [(NSMutableDictionary *)self->_eventHandlers objectForKeyedSubscript:v8];

  if (v18)
  {
    v23 = [MEMORY[0x263F08690] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"MPCPlaybackEngineEventStream.m", 860, @"Consumer %@ already has a subscription to %@", v11, v8 object file lineNumber description];
  }
  __int16 v19 = ~(_WORD)a4;
  v20 = _Block_copy(aBlock);
  if ((v19 & 0x101) != 0) {
    v21 = (id *)p_eventHandlers;
  }
  else {
    v21 = (id *)p_mutatingEventHandlers;
  }
  [*v21 setObject:v20 forKeyedSubscript:v8];

  os_unfair_lock_unlock(p_lock);
}

- (void)subscribeToEventType:(id)a3 handler:(id)a4
{
}

- (NSString)streamID
{
  return self->_streamID;
}

- (void)_onQueue_flush
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_consumer);
  if (WeakRetained)
  {
    v42 = [(id)objc_opt_class() identifier];
    isa = objc_loadWeakRetained((id *)&self->_eventStream);
    v5 = isa;
    if (isa) {
      isa = isa[10].isa;
    }
    dispatch_assert_queue_V2(isa);
    unint64_t maximumEventDeliveryTimestamp = self->_maximumEventDeliveryTimestamp;
    if (maximumEventDeliveryTimestamp) {
      v7 = @"SELECT identifier, type, monoAbsolute, monoContinuous, monoTimebaseNS, userNS, threadPriority, payload, _ns FROM events WHERE _ns > @lastNS && _ns < @maximumNS ORDER BY _ns";
    }
    else {
      v7 = @"SELECT identifier, type, monoAbsolute, monoContinuous, monoTimebaseNS, userNS, threadPriority, payload, _ns FROM events WHERE _ns > @lastNS ORDER BY _ns";
    }
    -[MPCPlaybackEngineEventStream sql](v5);
    v9 = id v8 = self;
    id v51 = 0;
    id v10 = [v9 statementWithString:v7 error:&v51];
    id v37 = v51;

    v45 = v8;
    [v10 bindUInt64Value:v8->_lastEventSuccessTimestamp toParameterNamed:@"@lastNS"];
    if (maximumEventDeliveryTimestamp) {
      objc_msgSend(v10, "bindUInt64Value:toParameterNamed:", maximumEventDeliveryTimestamp, @"@maximumNS", v37);
    }
    v11 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEventStream");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = [v5 engineID];
      unint64_t lastEventSuccessTimestamp = v8->_lastEventSuccessTimestamp;
      *(_DWORD *)buf = 138544130;
      v54 = v12;
      __int16 v55 = 2114;
      v56 = v42;
      __int16 v57 = 2048;
      id v58 = WeakRetained;
      __int16 v59 = 2048;
      unint64_t v60 = lastEventSuccessTimestamp;
      _os_log_impl(&dword_21BB87000, v11, OS_LOG_TYPE_DEBUG, "[EVS:%{public}@:%{public}@:%p] _onQueue_flush | running query [] lastEventSuccessTimestamp=%llu", buf, 0x2Au);
    }
    id v41 = WeakRetained;
    if (v5) {
      Class v14 = v5[8].isa;
    }
    else {
      Class v14 = 0;
    }
    v39 = v10;
    -[objc_class resultsForStatement:](v14, "resultsForStatement:", v10, v37);
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = [obj countByEnumeratingWithState:&v47 objects:v52 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v48;
      p_lock = &v45->_lock;
      v40 = v5;
      while (2)
      {
        uint64_t v19 = 0;
        v20 = v45;
        uint64_t v43 = v16;
        do
        {
          if (*(void *)v48 != v17) {
            objc_enumerationMutation(obj);
          }
          v21 = *(void **)(*((void *)&v47 + 1) + 8 * v19);
          v22 = (void *)MEMORY[0x21D49E0F0]();
          v23 = [v21 stringValueAtColumnIndex:1];
          os_unfair_lock_lock(p_lock);
          v24 = [(NSMutableDictionary *)v20->_eventHandlers objectForKeyedSubscript:v23];
          os_unfair_lock_unlock(p_lock);
          if (v24)
          {
            context = v22;
            v25 = +[MPCPlaybackEngineEvent eventFromRowResult:]((uint64_t)MPCPlaybackEngineEvent, v21);
            if (v25)
            {
              v26 = p_lock;
              v27 = [[_MPCPlaybackEngineEventStreamCursor alloc] initWithEventStream:v5 startEvent:v25 endEvent:0];
              if (!((unsigned int (**)(void, void *, _MPCPlaybackEngineEventStreamCursor *))v24)[2](v24, v25, v27))
              {

                goto LABEL_36;
              }
              unint64_t v28 = [v21 uint64ValueAtColumnIndex:8];
              v29 = [v5 testingDelegate];

              if (!v29) {
                _MPCPlaybackEngineEventStreamValidateSystemTime(v23, v28);
              }
              __int16 v30 = v45;
              unint64_t v31 = v45->_lastEventSuccessTimestamp;
              if (v31 && v28 - v31 >= 0x34630B8A001)
              {
                __int16 v32 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEventStream");
                if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
                {
                  id v33 = [v5 engineID];
                  unint64_t v34 = v28 - v45->_lastEventSuccessTimestamp;
                  *(_DWORD *)buf = 138544130;
                  v54 = v33;
                  __int16 v55 = 2114;
                  v56 = v42;
                  __int16 v57 = 2048;
                  id v58 = v41;
                  __int16 v59 = 2048;
                  unint64_t v60 = v34;
                  _os_log_impl(&dword_21BB87000, v32, OS_LOG_TYPE_INFO, "[EVS:%{public}@:%{public}@:%p] _onQueue_flush | unusual delay between events [more than 5m between events] delta=%lluns", buf, 0x2Au);

                  v5 = v40;
                }

                __int16 v30 = v45;
              }
              v30->_unint64_t lastEventSuccessTimestamp = v28;
              unint64_t v35 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEventStream");
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v36 = [v5 engineID];
                *(_DWORD *)buf = 138544130;
                v54 = v36;
                __int16 v55 = 2114;
                v56 = v42;
                __int16 v57 = 2048;
                id v58 = v41;
                __int16 v59 = 2048;
                unint64_t v60 = v28;
                _os_log_impl(&dword_21BB87000, v35, OS_LOG_TYPE_DEBUG, "[EVS:%{public}@:%{public}@:%p] _onQueue_flush | updating bookmark [successful delivery] lastEventSuccessTimestamp=%llu", buf, 0x2Au);

                v5 = v40;
              }

              v20 = v45;
              p_lock = v26;
              uint64_t v16 = v43;
            }

            v22 = context;
          }

          ++v19;
        }
        while (v16 != v19);
        uint64_t v16 = [obj countByEnumeratingWithState:&v47 objects:v52 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }
LABEL_36:

    [v39 invalidate];
    id WeakRetained = v41;
  }
}

- (NSMutableDictionary)mutatingEventHandlers
{
  return self->_mutatingEventHandlers;
}

- (unint64_t)lastEventSuccessTimestamp
{
  return self->_lastEventSuccessTimestamp;
}

- (_MPCPlaybackEngineEventStreamSubscription)initWithConsumer:(id)a3 eventStream:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)_MPCPlaybackEngineEventStreamSubscription;
  id v8 = [(_MPCPlaybackEngineEventStreamSubscription *)&v20 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_consumer, v6);
    objc_storeWeak((id *)&v9->_eventStream, v7);
    id v10 = NSString;
    self;
    if (processID_onceToken != -1) {
      dispatch_once(&processID_onceToken, &__block_literal_global_236);
    }
    id v11 = (id)processID_processID;
    v12 = [v7 engineID];
    uint64_t v13 = [v10 stringWithFormat:@"%@:%@", v11, v12];
    streamID = v9->_streamID;
    v9->_streamID = (NSString *)v13;

    uint64_t v15 = [MEMORY[0x263EFF9A0] dictionary];
    mutatingEventHandlers = v9->_mutatingEventHandlers;
    v9->_mutatingEventHandlers = (NSMutableDictionary *)v15;

    uint64_t v17 = [MEMORY[0x263EFF9A0] dictionary];
    eventHandlers = v9->_eventHandlers;
    v9->_eventHandlers = (NSMutableDictionary *)v17;
  }
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventHandlers, 0);
  objc_storeStrong((id *)&self->_mutatingEventHandlers, 0);
  objc_storeStrong((id *)&self->_streamID, 0);
  objc_destroyWeak((id *)&self->_eventStream);

  objc_destroyWeak((id *)&self->_consumer);
}

- (NSMutableDictionary)eventHandlers
{
  return self->_eventHandlers;
}

- (void)setMaximumEventDeliveryTimestamp:(unint64_t)a3
{
  self->_unint64_t maximumEventDeliveryTimestamp = a3;
}

- (unint64_t)maximumEventDeliveryTimestamp
{
  return self->_maximumEventDeliveryTimestamp;
}

- (void)setLastEventSuccessTimestamp:(unint64_t)a3
{
  self->_unint64_t lastEventSuccessTimestamp = a3;
}

- (MPCPlaybackEngineEventStream)eventStream
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_eventStream);

  return (MPCPlaybackEngineEventStream *)WeakRetained;
}

- (MPCPlaybackEngineEventConsumer)consumer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_consumer);

  return (MPCPlaybackEngineEventConsumer *)WeakRetained;
}

- (void)flushEventsWithCompletion:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_consumer);
  id v6 = objc_loadWeakRetained((id *)&self->_eventStream);
  id v7 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEventStream");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = [v6 engineID];
    v9 = [(id)objc_opt_class() identifier];
    *(_DWORD *)buf = 138543874;
    uint64_t v19 = v8;
    __int16 v20 = 2114;
    v21 = v9;
    __int16 v22 = 2048;
    id v23 = WeakRetained;
    _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_DEBUG, "[EVS:%{public}@:%{public}@:%p] flushEventsWithCompletion:… | flushing events async", buf, 0x20u);
  }
  if (v6) {
    id v10 = v6[10];
  }
  else {
    id v10 = 0;
  }
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __71___MPCPlaybackEngineEventStreamSubscription_flushEventsWithCompletion___block_invoke;
  v14[3] = &unk_2643C3D38;
  v14[4] = self;
  id v15 = v6;
  id v16 = WeakRetained;
  id v17 = v4;
  id v11 = v4;
  id v12 = WeakRetained;
  uint64_t v13 = v6;
  dispatch_async(v10, v14);
}

- (void)cancelSubscription
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_consumer);
  id v5 = objc_loadWeakRetained((id *)&self->_eventStream);
  id v6 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEventStream");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = [v5 engineID];
    id v8 = [(id)objc_opt_class() identifier];
    int v9 = 138543874;
    id v10 = v7;
    __int16 v11 = 2114;
    id v12 = v8;
    __int16 v13 = 2048;
    id v14 = WeakRetained;
    _os_log_impl(&dword_21BB87000, v6, OS_LOG_TYPE_DEBUG, "[EVS:%{public}@:%{public}@:%p] cancelSubscription | removing handlers", (uint8_t *)&v9, 0x20u);
  }
  [(NSMutableDictionary *)self->_mutatingEventHandlers removeAllObjects];
  [(NSMutableDictionary *)self->_eventHandlers removeAllObjects];
  os_unfair_lock_unlock(p_lock);
}

- (NSString)debugDescription
{
  v3 = [MEMORY[0x263EFF980] array];
  id v4 = [(NSMutableDictionary *)self->_mutatingEventHandlers allKeys];
  [v3 addObjectsFromArray:v4];

  id v5 = [(NSMutableDictionary *)self->_eventHandlers allKeys];
  [v3 addObjectsFromArray:v5];

  id v6 = NSString;
  uint64_t v7 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_consumer);
  int v9 = [(id)objc_opt_class() identifier];
  id v10 = [v6 stringWithFormat:@"<%@: %p consumer=%@ events=%@>", v7, self, v9, v3];

  return (NSString *)v10;
}

@end