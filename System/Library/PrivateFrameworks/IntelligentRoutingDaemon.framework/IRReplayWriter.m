@interface IRReplayWriter
- (IRReplayWriter)initWithServiceStore:(id)a3;
- (IRServiceStore)store;
- (void)dealloc;
- (void)deallocSync;
- (void)writeReplayEventWithReason:(id)a3 SystemState:(id)a4 miloLslPrediction:(id)a5 candidatesContainerDO:(id)a6 nearbyDeviceContainerDO:(id)a7 date:(id)a8;
@end

@implementation IRReplayWriter

- (void)writeReplayEventWithReason:(id)a3 SystemState:(id)a4 miloLslPrediction:(id)a5 candidatesContainerDO:(id)a6 nearbyDeviceContainerDO:(id)a7 date:(id)a8
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (+[IRPlatformInfo isInternalInstall])
  {
    id v37 = v14;
    v36 = [[IRReplayEventDO alloc] initWithDate:v19 contextChangeReason:v14 candidatesContainer:v17 miloLslPrediction:v16 systemState:v15 nearbyDeviceContainerDO:v18];
    -[NSMutableSet addObject:](self->_bufferedReplayEvents, "addObject:");
    unint64_t v20 = [(NSMutableSet *)self->_bufferedReplayEvents count];
    v21 = +[IRPreferences shared];
    v22 = [v21 replayWriterEventsSizeToBuffer];
    unsigned int v23 = [v22 unsignedIntValue];

    if (v20 >= v23)
    {
      v24 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
      v25 = (void *)*MEMORY[0x263F50090];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEBUG))
      {
        v26 = NSNumber;
        bufferedReplayEvents = self->_bufferedReplayEvents;
        v28 = v25;
        v29 = objc_msgSend(v26, "numberWithUnsignedInteger:", -[NSMutableSet count](bufferedReplayEvents, "count"));
        *(_DWORD *)buf = 136315650;
        v39 = "#replay-writer, ";
        __int16 v40 = 2112;
        v41 = v24;
        __int16 v42 = 2112;
        v43 = v29;
        _os_log_impl(&dword_25418E000, v28, OS_LOG_TYPE_DEBUG, "%s[%@], Writing %@ replay events to DB", buf, 0x20u);
      }
      v31 = self->_bufferedReplayEvents;
      store = self->_store;
      v32 = +[IRPreferences shared];
      v33 = [v32 numberOfEventsToSaveInDisk];
      LOBYTE(store) = -[IRServiceStore addReplayEvents:withLimit:](store, "addReplayEvents:withLimit:", v31, [v33 unsignedIntValue]);

      if ((store & 1) == 0)
      {
        v34 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
        v35 = *MEMORY[0x263F50090];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v39 = "#replay-writer, ";
          __int16 v40 = 2112;
          v41 = v34;
          _os_log_impl(&dword_25418E000, v35, OS_LOG_TYPE_ERROR, "%s[%@], [ErrorId - Replay save error] Could not save replay events", buf, 0x16u);
        }
      }
      [(NSMutableSet *)self->_bufferedReplayEvents removeAllObjects];
    }

    id v14 = v37;
  }
}

- (IRReplayWriter)initWithServiceStore:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IRReplayWriter;
  v6 = [(IRReplayWriter *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_store, a3);
    uint64_t v8 = objc_opt_new();
    bufferedReplayEvents = v7->_bufferedReplayEvents;
    v7->_bufferedReplayEvents = (NSMutableSet *)v8;
  }
  return v7;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)IRReplayWriter;
  [(IRReplayWriter *)&v2 dealloc];
}

- (void)deallocSync
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if ([(NSMutableSet *)self->_bufferedReplayEvents count])
  {
    v3 = (const void **)MEMORY[0x263F50120];
    v4 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
    id v5 = (os_log_t *)MEMORY[0x263F50090];
    v6 = (void *)*MEMORY[0x263F50090];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEBUG))
    {
      v7 = NSNumber;
      bufferedReplayEvents = self->_bufferedReplayEvents;
      v9 = v6;
      v10 = objc_msgSend(v7, "numberWithUnsignedInteger:", -[NSMutableSet count](bufferedReplayEvents, "count"));
      int v18 = 136315650;
      id v19 = "#replay-writer, ";
      __int16 v20 = 2112;
      v21 = v4;
      __int16 v22 = 2112;
      unsigned int v23 = v10;
      _os_log_impl(&dword_25418E000, v9, OS_LOG_TYPE_DEBUG, "%s[%@], Writing %@ replay events to DB on dealloc", (uint8_t *)&v18, 0x20u);
    }
    p_bufferedReplayEvents = &self->_bufferedReplayEvents;
    objc_super v11 = self->_bufferedReplayEvents;
    v12 = p_bufferedReplayEvents[1];
    id v14 = +[IRPreferences shared];
    id v15 = [v14 numberOfEventsToSaveInDisk];
    LOBYTE(v11) = -[NSMutableSet addReplayEvents:withLimit:](v12, "addReplayEvents:withLimit:", v11, [v15 unsignedIntValue]);

    if ((v11 & 1) == 0)
    {
      id v16 = dispatch_get_specific(*v3);
      id v17 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
      {
        int v18 = 136315394;
        id v19 = "#replay-writer, ";
        __int16 v20 = 2112;
        v21 = v16;
        _os_log_impl(&dword_25418E000, v17, OS_LOG_TYPE_ERROR, "%s[%@], [ErrorId - Replay dealloc error] Could not save replay events", (uint8_t *)&v18, 0x16u);
      }
    }
  }
}

- (IRServiceStore)store
{
  return self->_store;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);

  objc_storeStrong((id *)&self->_bufferedReplayEvents, 0);
}

@end