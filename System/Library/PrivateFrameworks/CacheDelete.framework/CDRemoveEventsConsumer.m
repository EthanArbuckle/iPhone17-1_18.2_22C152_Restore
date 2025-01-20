@interface CDRemoveEventsConsumer
- (BOOL)historyDone;
- (CDRemoveEventsConsumer)initWithConsumer:(id)a3 identifier:(id)a4;
- (NSString)identifier;
- (NSString)volume;
- (OS_dispatch_queue)consumer_q;
- (OS_dispatch_semaphore)sem;
- (__FSEventStream)stream;
- (fsid)fsid;
- (id)consumer;
- (unint64_t)since;
- (void)callback:(id)a3;
- (void)consumeStream:(__FSEventStream *)a3 forVolume:(id)a4;
- (void)dealloc;
- (void)setConsumer:(id)a3;
- (void)setConsumer_q:(id)a3;
- (void)setFsid:(fsid)a3;
- (void)setHistoryDone:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setSem:(id)a3;
- (void)setSince:(unint64_t)a3;
- (void)setStream:(__FSEventStream *)a3;
- (void)setVolume:(id)a3;
@end

@implementation CDRemoveEventsConsumer

- (void)dealloc
{
  if ([(CDRemoveEventsConsumer *)self stream])
  {
    FSEventStreamInvalidate([(CDRemoveEventsConsumer *)self stream]);
    FSEventStreamRelease([(CDRemoveEventsConsumer *)self stream]);
  }
  v3.receiver = self;
  v3.super_class = (Class)CDRemoveEventsConsumer;
  [(CDRemoveEventsConsumer *)&v3 dealloc];
}

- (void)consumeStream:(__FSEventStream *)a3 forVolume:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = mach_absolute_time();
  if (a3)
  {
    bzero(&v25, 0x878uLL);
    id v8 = v6;
    if (statfs((const char *)[v8 UTF8String], &v25))
    {
      v9 = CDGetLogHandle((uint64_t)"client");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v17 = __error();
        v18 = strerror(*v17);
        int v21 = 138543618;
        id v22 = v8;
        __int16 v23 = 2080;
        v24 = v18;
        _os_log_error_impl(&dword_1A63D1000, v9, OS_LOG_TYPE_ERROR, "statfs failed for \"%{public}@\" : %s", (uint8_t *)&v21, 0x16u);
      }

      goto LABEL_22;
    }
    if ([(CDRemoveEventsConsumer *)self stream])
    {
      v11 = CDGetLogHandle((uint64_t)"client");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v21) = 0;
        _os_log_error_impl(&dword_1A63D1000, v11, OS_LOG_TYPE_ERROR, "consumer is being reused, replacing FSEventStream", (uint8_t *)&v21, 2u);
      }

      v12 = [(CDRemoveEventsConsumer *)self stream];
      [(CDRemoveEventsConsumer *)self setStream:0];
      FSEventStreamInvalidate(v12);
      FSEventStreamRelease(v12);
    }
    [(CDRemoveEventsConsumer *)self setFsid:*(void *)&v25.f_fsid];
    [(CDRemoveEventsConsumer *)self setStream:a3];
    [(CDRemoveEventsConsumer *)self setVolume:v8];
    if (FSEventStreamStart([(CDRemoveEventsConsumer *)self stream]))
    {
      v13 = [(CDRemoveEventsConsumer *)self sem];
      dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);

      v14 = CDGetLogHandle((uint64_t)"client");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21) = 0;
        _os_log_impl(&dword_1A63D1000, v14, OS_LOG_TYPE_DEFAULT, "FSStream completed.", (uint8_t *)&v21, 2u);
      }
    }
    else
    {
      v14 = CDGetLogHandle((uint64_t)"client");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v19 = __error();
        v20 = strerror(*v19);
        int v21 = 138412546;
        id v22 = v8;
        __int16 v23 = 2080;
        v24 = v20;
        _os_log_error_impl(&dword_1A63D1000, v14, OS_LOG_TYPE_ERROR, "CacheDeleteEnumerateRemovedFiles: Unable to start FSEventStream on volume \"%@\" : %s", (uint8_t *)&v21, 0x16u);
      }
    }
  }
  else
  {
    v10 = CDGetLogHandle((uint64_t)"client");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v25.f_bsize) = 0;
      _os_log_error_impl(&dword_1A63D1000, v10, OS_LOG_TYPE_ERROR, "No stream parameter", (uint8_t *)&v25, 2u);
    }
  }
  v15 = CDGetLogHandle((uint64_t)"client");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = mach_absolute_time();
    v25.f_bsize = 134217984;
    *(double *)&v25.f_iosize = *(double *)&gTimebaseConversion * ((double)v16 - (double)v7) / 1000000000.0;
    _os_log_impl(&dword_1A63D1000, v15, OS_LOG_TYPE_DEFAULT, "consumeStream Time taken: %f", (uint8_t *)&v25, 0xCu);
  }

LABEL_22:
}

- (__FSEventStream)stream
{
  return self->_stream;
}

- (void)setVolume:(id)a3
{
}

- (void)setStream:(__FSEventStream *)a3
{
  self->_stream = a3;
}

- (void)setFsid:(fsid)a3
{
  fsid src = a3;
  objc_copyStruct(&self->_fsid, &src, 8, 1, 0);
}

- (OS_dispatch_semaphore)sem
{
  return self->_sem;
}

- (void)setSince:(unint64_t)a3
{
  self->_since = a3;
}

- (CDRemoveEventsConsumer)initWithConsumer:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CDRemoveEventsConsumer;
  id v8 = [(CDRemoveEventsConsumer *)&v18 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identifier, a4);
    uint64_t v10 = MEMORY[0x1AD0BA360](v6);
    id consumer = v9->_consumer;
    v9->_id consumer = (id)v10;

    dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
    sem = v9->_sem;
    v9->_sem = (OS_dispatch_semaphore *)v12;

    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.CDRemoveEventsConsumer", v14);
    consumer_q = v9->_consumer_q;
    v9->_consumer_q = (OS_dispatch_queue *)v15;
  }
  return v9;
}

void __35__CDRemoveEventsConsumer_callback___block_invoke(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  v2 = CDGetLogHandle((uint64_t)"client");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A63D1000, v2, OS_LOG_TYPE_DEFAULT, "CDConsumer, calling client callback with:", buf, 2u);
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v37;
    *(void *)&long long v5 = 138412290;
    long long v30 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v37 != v7) {
          objc_enumerationMutation(v3);
        }
        v9 = objc_msgSend(*(id *)(*((void *)&v36 + 1) + 8 * i), "allValues", v30);
        uint64_t v10 = [v9 componentsJoinedByString:@" "];

        v11 = CDGetLogHandle((uint64_t)"client");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v30;
          v41 = v10;
          _os_log_impl(&dword_1A63D1000, v11, OS_LOG_TYPE_DEFAULT, "CDConsumer callback file removed: %@", buf, 0xCu);
        }
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v36 objects:v45 count:16];
    }
    while (v6);
  }

  dispatch_semaphore_t v12 = [*(id *)(a1 + 40) consumer];
  v12[2](v12, *(void *)(a1 + 32));

  v13 = CDGetLogHandle((uint64_t)"client");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A63D1000, v13, OS_LOG_TYPE_DEFAULT, "CDConsumer client callback complete", buf, 2u);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v14 = *(id *)(a1 + 32);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v32 objects:v44 count:16];
  if (!v15) {
    goto LABEL_31;
  }
  uint64_t v17 = v15;
  char v18 = 0;
  uint64_t v19 = *(void *)v33;
  *(void *)&long long v16 = 138412546;
  long long v31 = v16;
  do
  {
    for (uint64_t j = 0; j != v17; ++j)
    {
      if (*(void *)v33 != v19) {
        objc_enumerationMutation(v14);
      }
      int v21 = *(void **)(*((void *)&v32 + 1) + 8 * j);
      id v22 = objc_msgSend(v21, "objectForKeyedSubscript:", @"historyDone", v31, (void)v32);
      __int16 v23 = evaluateNumberProperty(v22);

      if (v23)
      {
        if ([v23 unsignedLongLongValue])
        {
          v24 = v23;
        }
        else
        {
          v24 = [NSNumber numberWithUnsignedLongLong:FSEventsGetCurrentEventId()];

          statfs v25 = CDGetLogHandle((uint64_t)"client");
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v31;
            v41 = v24;
            __int16 v42 = 2112;
            v43 = v21;
            _os_log_error_impl(&dword_1A63D1000, v25, OS_LOG_TYPE_ERROR, "Got a zero historyDone event, using FSEventsGetCurrentEventId: %@, event: %@", buf, 0x16u);
          }
        }
        uint64_t v26 = [*(id *)(a1 + 40) identifier];
        v27 = [*(id *)(a1 + 40) volume];
        char v18 = 1;
        setPurgeMarker(v26, v27, 1, [v24 unsignedLongLongValue]);
      }
      else
      {
        v24 = 0;
      }
      v28 = [v21 objectForKeyedSubscript:@"rescan"];
      v29 = evaluateNumberProperty(v28);

      v18 |= v29 != 0;
    }
    uint64_t v17 = [v14 countByEnumeratingWithState:&v32 objects:v44 count:16];
  }
  while (v17);

  if (v18)
  {
    v14 = [*(id *)(a1 + 40) sem];
    dispatch_semaphore_signal(v14);
LABEL_31:
  }
}

- (NSString)volume
{
  return self->_volume;
}

- (void)setHistoryDone:(BOOL)a3
{
  self->_historyDone = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)historyDone
{
  return self->_historyDone;
}

- (OS_dispatch_queue)consumer_q
{
  return self->_consumer_q;
}

- (id)consumer
{
  return self->_consumer;
}

- (void)callback:(id)a3
{
  id v4 = a3;
  if ([(CDRemoveEventsConsumer *)self historyDone]) {
    FSEventStreamStop([(CDRemoveEventsConsumer *)self stream]);
  }
  long long v5 = [(CDRemoveEventsConsumer *)self consumer_q];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__CDRemoveEventsConsumer_callback___block_invoke;
  v7[3] = &unk_1E5C518D8;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volume, 0);
  objc_storeStrong((id *)&self->_consumer_q, 0);
  objc_storeStrong((id *)&self->_sem, 0);
  objc_storeStrong(&self->_consumer, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setIdentifier:(id)a3
{
}

- (void)setConsumer:(id)a3
{
}

- (void)setSem:(id)a3
{
}

- (void)setConsumer_q:(id)a3
{
}

- (fsid)fsid
{
  objc_copyStruct(&dest, &self->_fsid, 8, 1, 0);
  return dest;
}

- (unint64_t)since
{
  return self->_since;
}

@end