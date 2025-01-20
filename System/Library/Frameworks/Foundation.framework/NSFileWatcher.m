@interface NSFileWatcher
- (NSFileWatcher)initWithQueue:(id)a3 auditToken:(id *)a4;
- (void)_coalesceSubitemObservations;
- (void)dealloc;
- (void)handleFSEventPath:(id)a3 flags:(unsigned int)a4 id:(unint64_t)a5;
- (void)setLastObservedEventID:(unint64_t)a3;
- (void)setObserver:(id)a3;
- (void)setURL:(id)a3;
- (void)settle;
- (void)start;
- (void)stop;
- (void)unsettle;
- (void)watchItem;
@end

@implementation NSFileWatcher

- (void)watchItem
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  v3 = _NSFCFSEventsLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    url = self->_url;
    LODWORD(buf) = 138477827;
    *(void *)((char *)&buf + 4) = url;
    _os_log_debug_impl(&dword_181795000, v3, OS_LOG_TYPE_DEBUG, "Starting to watch %{private}@", (uint8_t *)&buf, 0xCu);
  }

  self->_fileReferenceURL = 0;
  self->_formerPath = 0;
  if (self->_eventStream)
  {
    off_1EB1EDE98();
    off_1EB1EDEA0(self->_eventStream);
    off_1EB1EDE90(self->_eventStream);
    self->_eventStream = 0;
  }
  eventSource = self->_eventSource;
  if (eventSource)
  {
    dispatch_source_cancel(eventSource);
    dispatch_release((dispatch_object_t)self->_eventSource);
    self->_eventSource = 0;
  }
  if ([(NSURL *)self->_url isFileURL])
  {
    id v5 = [(NSURL *)self->_url path];
    if (v5)
    {
      uint64_t v26 = 0;
      v27 = &v26;
      uint64_t v28 = 0x2020000000;
      char v29 = 0;
      uint64_t v22 = 0;
      v23 = &v22;
      uint64_t v24 = 0x2020000000;
      char v25 = 0;
      uint64_t v18 = 0;
      v19 = &v18;
      uint64_t v20 = 0x2020000000;
      char v21 = 0;
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v39 = 0x3052000000;
      v40 = __Block_byref_object_copy__31;
      v41 = __Block_byref_object_dispose__31;
      uint64_t v42 = 0;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __26__NSFileWatcher_watchItem__block_invoke;
      v17[3] = &unk_1E51FE458;
      v17[4] = self;
      v17[5] = &buf;
      v17[6] = &v26;
      v17[7] = &v22;
      v17[8] = &v18;
      uint64_t v6 = [v17 copy];
      *(void *)(*((void *)&buf + 1) + 40) = v6;
      self->_eventSource = (OS_dispatch_source *)(*(uint64_t (**)(uint64_t, id, void))(v6 + 16))(v6, v5, 0);

      if (*((unsigned char *)v23 + 24))
      {
        v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v5, 0);
        *(void *)&long long v34 = 0;
        *((void *)&v34 + 1) = self;
        uint64_t v35 = MEMORY[0x1E4F1C280];
        uint64_t v36 = MEMORY[0x1E4F1C278];
        uint64_t v37 = MEMORY[0x1E4F1C220];
        self->_eventStream = (__FSEventStream *)off_1EB1EDEA8(0, eventStreamCallback, &v34, v7, self->_lastObservedEventID, 19, 0.0);

        if (self->_eventStream)
        {
          v8 = _NSFCFSEventsLog();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          {
            unint64_t lastObservedEventID = self->_lastObservedEventID;
            *(_DWORD *)v30 = 138478083;
            id v31 = v5;
            __int16 v32 = 2048;
            unint64_t v33 = lastObservedEventID;
            _os_log_debug_impl(&dword_181795000, v8, OS_LOG_TYPE_DEBUG, "#fsevents Starting stream for %{private}@ with event ID %llx", v30, 0x16u);
          }
          off_1EB1EDEB0(self->_eventStream, self->_queue);
          if (off_1EB1EDEB8(self->_eventStream))
          {
            self->_eventsAreAboutDirectory = *((unsigned char *)v27 + 24);
            goto LABEL_20;
          }
          off_1EB1EDE90(self->_eventStream);
          self->_eventStream = 0;
          v11 = _NSFCFSEventsLog();
          if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
            goto LABEL_20;
          }
          *(_DWORD *)v30 = 138477827;
          id v31 = v5;
          v12 = "#fsevents FSEventStreamStart() returned NO. Path: %{private}@";
        }
        else
        {
          v11 = _NSFCFSEventsLog();
          if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
            goto LABEL_20;
          }
          *(_DWORD *)v30 = 138477827;
          id v31 = v5;
          v12 = "#fsevents FSEventStreamCreate() returned NULL. Path: %{private}@";
        }
        _os_log_error_impl(&dword_181795000, v11, OS_LOG_TYPE_ERROR, v12, v30, 0xCu);
      }
LABEL_20:
      if (*((unsigned char *)v19 + 24))
      {
        v14 = _NSFCFSEventsLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          LODWORD(v34) = 138477827;
          *(void *)((char *)&v34 + 4) = v5;
          _os_log_error_impl(&dword_181795000, v14, OS_LOG_TYPE_ERROR, "Using fileReferenceURL for  FSEventStreamCreate() returned NULL. Path: %{private}@", (uint8_t *)&v34, 0xCu);
        }
        CFURLClearResourcePropertyCache((CFURLRef)self->_url);
        v15 = (NSURL *)[[(NSURL *)self->_url fileReferenceURL] copy];
        self->_fileReferenceURL = v15;
        self->_formerPath = (NSString *)objc_msgSend(-[NSURL path](v15, "path"), "copy");
      }
      _Block_object_dispose(&buf, 8);
      _Block_object_dispose(&v18, 8);
      _Block_object_dispose(&v22, 8);
      _Block_object_dispose(&v26, 8);
      return;
    }
    v9 = _NSFCFSEventsLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = self->_url;
      LODWORD(buf) = 138477827;
      *(void *)((char *)&buf + 4) = v10;
      _os_log_error_impl(&dword_181795000, v9, OS_LOG_TYPE_ERROR, "No file watcher could be started. URL: %{private}@", (uint8_t *)&buf, 0xCu);
    }
  }
}

uint64_t __26__NSFileWatcher_watchItem__block_invoke_79(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = result;
  return result;
}

uint64_t __26__NSFileWatcher_watchItem__block_invoke_2(uint64_t a1, void *a2)
{
  if (objc_msgSend((id)objc_msgSend(a2, "stringByDeletingLastPathComponent"), "isEqualToString:", @"/")) {
    return 0;
  }
  id v5 = (void *)[a2 lastPathComponent];
  if (*(void *)(a1 + 32)) {
    objc_msgSend(v5, "stringByAppendingPathComponent:");
  }
  uint64_t v6 = *(uint64_t (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) + 16);

  return v6();
}

uint64_t __26__NSFileWatcher_watchItem__block_invoke(void *a1, void *a2, uint64_t a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  uint64_t v26 = __26__NSFileWatcher_watchItem__block_invoke_2;
  v27 = &unk_1E51FE3B8;
  uint64_t v6 = a1[5];
  uint64_t v28 = a3;
  uint64_t v29 = v6;
  v7 = +[_NSFileWatcherFileHandleInfo openFileWithPath:a2];
  if (!v7) {
    return v26((uint64_t)v25, a2);
  }
  v8 = v7;
  int v9 = v7[2];
  if (a3)
  {
    uintptr_t v10 = 32;
    goto LABEL_4;
  }
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [v7 isDirectory];
  uint64_t v15 = a1[4];
  long long v16 = *(_OWORD *)(v15 + 32);
  *(_OWORD *)&buf.f_bsize = *(_OWORD *)(v15 + 16);
  *(_OWORD *)&buf.f_bfree = v16;
  if (([v8 verifyAccessByAuditToken:&buf] & 1) == 0)
  {
    uint64_t v18 = _NSFCFSEventsLog();
    char v17 = 0;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      buf.f_bsize = 138477827;
      *(void *)&buf.f_iosize = a2;
      _os_log_impl(&dword_181795000, v18, OS_LOG_TYPE_DEFAULT, "Refused to register file watcher for file at path %{private}@ on behalf of an NSFilePresenter because the requesting process does not have access to it", (uint8_t *)&buf, 0xCu);
      char v17 = 0;
    }
LABEL_12:
    v19 = _NSFCFSEventsLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf.f_bsize) = 0;
      _os_log_error_impl(&dword_181795000, v19, OS_LOG_TYPE_ERROR, "NSFileCoordinator: dispatch_source_create() returned NULL, which is a surprise.", (uint8_t *)&buf, 2u);
    }
    [v8 close];
    if ((v17 & 1) == 0) {
      return 0;
    }
    return v26((uint64_t)v25, a2);
  }
  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
    uintptr_t v10 = 41;
    goto LABEL_4;
  }
  memset(&buf, 0, 512);
  if (!fstatfs(v9, &buf) && (buf.f_flags & 0x1000) == 0)
  {
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
    *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = 1;
    [v8 close];
    return v26((uint64_t)v25, a2);
  }
  uintptr_t v10 = 111;
LABEL_4:
  dispatch_source_t v11 = dispatch_source_create(MEMORY[0x1E4F144A8], v9, v10, *(dispatch_queue_t *)(a1[4] + 8));
  if (!v11)
  {
    char v17 = 1;
    goto LABEL_12;
  }
  v12 = v11;
  id v13 = *(id *)(*(void *)(a1[5] + 8) + 40);
  *(void *)&buf.f_bsize = 0;
  buf.f_blocks = (uint64_t)&buf;
  buf.f_bfree = 0x3052000000;
  buf.f_bavail = (uint64_t)__Block_byref_object_copy__77;
  buf.f_files = (uint64_t)__Block_byref_object_dispose__78;
  buf.f_ffree = 0;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __26__NSFileWatcher_watchItem__block_invoke_79;
  handler[3] = &unk_1E51FE3E0;
  handler[5] = v25;
  handler[6] = &buf;
  handler[4] = a2;
  dispatch_source_set_registration_handler(v12, handler);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __26__NSFileWatcher_watchItem__block_invoke_2_80;
  v22[3] = &unk_1E51FE408;
  v22[4] = v12;
  v22[5] = a2;
  uint64_t v14 = a1[4];
  int v23 = v9;
  v22[8] = v25;
  v22[9] = &buf;
  v22[6] = v14;
  v22[7] = a3;
  dispatch_source_set_event_handler(v12, v22);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __26__NSFileWatcher_watchItem__block_invoke_81;
  v21[3] = &unk_1E51FE430;
  v21[4] = v8;
  v21[5] = &buf;
  v21[6] = a1[5];
  dispatch_source_set_cancel_handler(v12, v21);
  dispatch_resume(v12);
  _Block_object_dispose(&buf, 8);
  return (uint64_t)v12;
}

void __26__NSFileWatcher_watchItem__block_invoke_2_80(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uintptr_t data = dispatch_source_get_data(*(dispatch_source_t *)(a1 + 32));
  v3 = _NSFCFSEventsLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = *(void *)(a1 + 40);
    *(_DWORD *)statfs buf = 138478083;
    uint64_t v16 = v10;
    __int16 v17 = 2048;
    uintptr_t v18 = data;
    _os_log_debug_impl(&dword_181795000, v3, OS_LOG_TYPE_DEBUG, "#vnode path: %{private}@, flags: %p", buf, 0x16u);
  }
  uint64_t v4 = *(void *)(a1 + 48);
  if (*(unsigned char *)(v4 + 64))
  {
    if (!*(unsigned char *)(v4 + 97))
    {
      id v5 = _NSFCFSEventsLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 48);
        *(_DWORD *)statfs buf = 138477827;
        uint64_t v16 = v11;
        _os_log_debug_impl(&dword_181795000, v5, OS_LOG_TYPE_DEBUG, "Unsettling watcher for %{private}@ in response to event", buf, 0xCu);
      }
      *(unsigned char *)(*(void *)(a1 + 48) + 97) = 1;
      uint64_t v4 = *(void *)(a1 + 48);
    }
    if (*(void *)(v4 + 104))
    {
      if ((data & 0x20) == 0) {
        goto LABEL_20;
      }
    }
    else
    {
      *(void *)(*(void *)(a1 + 48) + 104) = -[NSFileWatcherObservations initWithPath:]([NSFileWatcherObservations alloc], "initWithPath:", [*(id *)(*(void *)(a1 + 48) + 48) path]);
      (*(void (**)(void))(*(void *)(*(void *)(a1 + 48) + 56) + 16))();
      if ((data & 0x20) == 0) {
        goto LABEL_20;
      }
    }
    if (fcntl(*(_DWORD *)(a1 + 80), 50, buf) != -1)
    {
      uint64_t v6 = [[NSString alloc] initWithUTF8String:buf];
      v7 = *(NSObject **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      if (v7)
      {
        dispatch_source_cancel(v7);
        dispatch_release(*(dispatch_object_t *)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
      }
      *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
      uint64_t v8 = (uint64_t)v6;
      if (*(void *)(a1 + 56)) {
        uint64_t v8 = [(NSString *)v6 stringByAppendingPathComponent:*(void *)(a1 + 56)];
      }
      [*(id *)(*(void *)(a1 + 48) + 104) addDetectedMoveToPath:v8];

      if ((data & 8) == 0) {
        goto LABEL_22;
      }
      goto LABEL_21;
    }
    int v9 = _NSFCFSEventsLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v12 = *__error();
      *(_DWORD *)id v13 = 67109120;
      int v14 = v12;
      _os_log_error_impl(&dword_181795000, v9, OS_LOG_TYPE_ERROR, "A presented file was moved but its new name couldn't be gotten. Error: %i", v13, 8u);
      if ((data & 8) == 0) {
        goto LABEL_22;
      }
      goto LABEL_21;
    }
LABEL_20:
    if ((data & 8) == 0)
    {
LABEL_22:
      if ((data & 6) != 0) {
        [*(id *)(*(void *)(a1 + 48) + 104) addContentsChange];
      }
      if (data) {
        [*(id *)(*(void *)(a1 + 48) + 104) addDeletion];
      }
      return;
    }
LABEL_21:
    [*(id *)(*(void *)(a1 + 48) + 104) addAttributeChange];
    goto LABEL_22;
  }
}

- (void)start
{
  self->_isWatching = 1;
  [(NSFileWatcher *)self watchItem];
}

- (void)setURL:(id)a3
{
  uint64_t v4 = (NSURL *)[a3 filePathURL];
  url = self->_url;
  if (v4 != url)
  {
    uint64_t v6 = v4;
    if (self->_isUnsettled)
    {
      [(NSFileWatcherObservations *)self->_itemObservations addAnnouncedMoveToPath:[(NSURL *)v4 path]];
      url = self->_url;
      if (!self->_formerURL)
      {
        self->_formerURL = url;
        url = self->_url;
      }
    }

    self->_url = (NSURL *)[(NSURL *)v6 copy];
    if (!self->_isUnsettled && self->_isWatching)
    {
      [(NSFileWatcher *)self watchItem];
    }
  }
}

- (void)setObserver:(id)a3
{
  id observer = self->_observer;
  if (observer != a3)
  {

    self->_id observer = (id)[a3 copy];
  }
}

- (NSFileWatcher)initWithQueue:(id)a3 auditToken:(id *)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (initializeFSEvents_predicate != -1) {
    dispatch_once(&initializeFSEvents_predicate, &__block_literal_global_135);
  }
  v11.receiver = self;
  v11.super_class = (Class)NSFileWatcher;
  v7 = [(NSFileWatcher *)&v11 init];
  uint64_t v8 = v7;
  if (v7)
  {
    v7->_queue = (OS_dispatch_queue *)a3;
    dispatch_retain((dispatch_object_t)a3);
    long long v9 = *(_OWORD *)&a4->var0[4];
    *(_OWORD *)v8->_auditToken.val = *(_OWORD *)a4->var0;
    *(_OWORD *)&v8->_auditToken.val[4] = v9;
    v8->_unint64_t lastObservedEventID = -1;
  }
  return v8;
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (self->_isWatching)
  {
    v3 = _NSFCLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)statfs buf = 0;
      _os_log_impl(&dword_181795000, v3, OS_LOG_TYPE_DEFAULT, "A file watcher that has been started but not stopped is being deallocated", buf, 2u);
    }
  }

  eventStream = self->_eventStream;
  if (eventStream) {
    off_1EB1EDE90(eventStream);
  }
  eventSource = self->_eventSource;
  if (eventSource) {
    dispatch_release(eventSource);
  }

  queue = self->_queue;
  if (queue) {
    dispatch_release(queue);
  }
  v7.receiver = self;
  v7.super_class = (Class)NSFileWatcher;
  [(NSFileWatcher *)&v7 dealloc];
}

- (void)handleFSEventPath:(id)a3 flags:(unsigned int)a4 id:(unint64_t)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  unsigned int v9 = a4 & 0xFF80FFFF;
  uint64_t v10 = _NSFCFSEventsLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v16 = 138478595;
    id v17 = a3;
    __int16 v18 = 1024;
    unsigned int v19 = v9;
    __int16 v20 = 1024;
    unsigned int v21 = a4 & 0x7F0000;
    __int16 v22 = 2048;
    unint64_t v23 = a5;
    _os_log_debug_impl(&dword_181795000, v10, OS_LOG_TYPE_DEBUG, "#fsevents path: %{private}@, flags: %x (ignored: %x), id: %llx", (uint8_t *)&v16, 0x22u);
  }
  if (self->_isWatching)
  {
    unint64_t lastObservedEventID = self->_lastObservedEventID;
    if (lastObservedEventID == -1)
    {
      if (!v9) {
        return;
      }
    }
    else if (!v9 || (a4 & 0x10) != 0 || lastObservedEventID >= a5)
    {
      return;
    }
    if (!self->_isUnsettled)
    {
      uint64_t v12 = _NSFCFSEventsLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        url = self->_url;
        int v16 = 138477827;
        id v17 = url;
        _os_log_debug_impl(&dword_181795000, v12, OS_LOG_TYPE_DEBUG, "Unsettling watcher for %{private}@ in response to event", (uint8_t *)&v16, 0xCu);
      }
      self->_isUnsettled = 1;
    }
    if (self->_eventsAreAboutDirectory)
    {
      id v13 = (NSFileWatcherObservations *)[(NSMutableDictionary *)self->_subitemObservationsByEventPath objectForKey:a3];
      if (!v13)
      {
        if (!self->_subitemObservationsByEventPath)
        {
          self->_subitemObservationsByEventPath = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
          (*((void (**)(void))self->_observer + 2))();
        }
        id v13 = [[NSFileWatcherObservations alloc] initWithPath:a3];
        [(NSMutableDictionary *)self->_subitemObservationsByEventPath setObject:v13 forKey:a3];
      }
      [(NSFileWatcherObservations *)v13 addContentsChange];
    }
    else
    {
      itemObservations = self->_itemObservations;
      if (!itemObservations)
      {
        self->_itemObservations = [[NSFileWatcherObservations alloc] initWithPath:[(NSURL *)self->_url path]];
        (*((void (**)(void))self->_observer + 2))();
        itemObservations = self->_itemObservations;
      }
      [(NSFileWatcherObservations *)itemObservations addAttributeChange];
    }
    self->_unint64_t lastObservedEventID = a5;
  }
}

void __26__NSFileWatcher_watchItem__block_invoke_81(uint64_t a1)
{
  [*(id *)(a1 + 32) close];
  v2 = *(NSObject **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v2)
  {
    dispatch_source_cancel(v2);
    dispatch_release(*(dispatch_object_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = 0;
  }
  v3 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
}

- (void)setLastObservedEventID:(unint64_t)a3
{
  self->_unint64_t lastObservedEventID = a3;
}

- (void)unsettle
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = _NSFCFSEventsLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    url = self->_url;
    int v5 = 138477827;
    uint64_t v6 = url;
    _os_log_debug_impl(&dword_181795000, v3, OS_LOG_TYPE_DEBUG, "Manually unsettling watcher for %{private}@", (uint8_t *)&v5, 0xCu);
  }
  self->_isUnsettled = 1;
  if (!self->_itemObservations)
  {
    self->_itemObservations = [[NSFileWatcherObservations alloc] initWithPath:[(NSURL *)self->_url path]];
    (*((void (**)(void))self->_observer + 2))();
  }
}

- (void)_coalesceSubitemObservations
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3052000000;
  uint64_t v8 = __Block_byref_object_copy__77;
  unsigned int v9 = __Block_byref_object_dispose__78;
  uint64_t v10 = 0;
  subitemObservationsByEventPath = self->_subitemObservationsByEventPath;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__NSFileWatcher__coalesceSubitemObservations__block_invoke;
  v4[3] = &unk_1E51FE480;
  v4[4] = self;
  v4[5] = &v5;
  [(NSMutableDictionary *)subitemObservationsByEventPath enumerateKeysAndObjectsUsingBlock:v4];
  if (v6[5])
  {
    -[NSMutableDictionary setDictionary:](self->_subitemObservationsByEventPath, "setDictionary:");
  }
  _Block_object_dispose(&v5, 8);
}

void __45__NSFileWatcher__coalesceSubitemObservations__block_invoke(uint64_t a1, const __CFString *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  CFURLRef v3 = CFURLCreateWithFileSystemPath(0, a2, kCFURLPOSIXPathStyle, 0);
  if (v3)
  {
    CFURLRef v4 = v3;
    if (_CFURLIsItemPromiseAtURL())
    {
      uint64_t v5 = (void *)_CFURLCopyLogicalURLOfPromiseAtURL();
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = [v5 path];
        if ([*(id *)(*(void *)(a1 + 32) + 112) objectForKey:v7])
        {
          uint64_t v8 = _NSFCFSEventsLog();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          {
            int v10 = 138477827;
            uint64_t v11 = v7;
            _os_log_debug_impl(&dword_181795000, v8, OS_LOG_TYPE_DEBUG, "Coalescing observations for both the logical URL %{private}@ and its promise URL", (uint8_t *)&v10, 0xCu);
          }
          unsigned int v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
          if (!v9)
          {
            *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 112) mutableCopy];
            unsigned int v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
          }
          [v9 removeObjectForKey:v7];
        }
        CFRelease(v6);
      }
    }
    CFRelease(v4);
  }
}

- (void)settle
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (self->_isUnsettled)
  {
    CFURLRef v3 = _NSFCFSEventsLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      url = self->_url;
      *(_DWORD *)statfs buf = 138477827;
      __int16 v20 = url;
      _os_log_debug_impl(&dword_181795000, v3, OS_LOG_TYPE_DEBUG, "Settling watcher for %{private}@", buf, 0xCu);
    }
    fileReferenceURL = self->_fileReferenceURL;
    if (fileReferenceURL)
    {
      formerPath = self->_formerPath;
      if (!formerPath)
      {
LABEL_15:
        itemObservations = self->_itemObservations;
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __23__NSFileWatcher_settle__block_invoke;
        v17[3] = &unk_1E51FE4A8;
        char v18 = (char)formerPath;
        v17[4] = self;
        v17[5] = @"/private";
        [(NSFileWatcherObservations *)itemObservations notifyObserver:v17];

        self->_itemObservations = 0;
        [(NSFileWatcher *)self _coalesceSubitemObservations];
        id v10 = [(NSURL *)self->_url path];
        id v11 = [(NSURL *)self->_formerURL path];
        subitemObservationsByEventPath = self->_subitemObservationsByEventPath;
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __23__NSFileWatcher_settle__block_invoke_90;
        v16[3] = &unk_1E51FE4F8;
        v16[4] = v10;
        v16[5] = v11;
        v16[6] = @"/private";
        v16[7] = self;
        [(NSMutableDictionary *)subitemObservationsByEventPath enumerateKeysAndObjectsUsingBlock:v16];

        self->_subitemObservationsByEventPath = 0;
        (*((void (**)(void))self->_observer + 2))();

        self->_formerURL = 0;
        self->_isUnsettled = 0;
        return;
      }
      CFURLClearResourcePropertyCache((CFURLRef)fileReferenceURL);
      id v6 = [(NSURL *)self->_fileReferenceURL path];
      uint64_t v7 = _NSFCFSEventsLog();
      BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
      if (v6)
      {
        if (v8)
        {
          int v14 = self->_formerPath;
          *(_DWORD *)statfs buf = 138478083;
          __int16 v20 = v14;
          __int16 v21 = 2113;
          id v22 = v6;
          _os_log_debug_impl(&dword_181795000, v7, OS_LOG_TYPE_DEBUG, "#filereference Detected move from %{private}@ to %{private}@", buf, 0x16u);
        }
        if (([v6 isEqualToString:self->_formerPath] & 1) == 0)
        {
          [(NSFileWatcherObservations *)self->_itemObservations addDetectedMoveToPath:v6];
          LOBYTE(formerPath) = 1;
          goto LABEL_15;
        }
      }
      else
      {
        if (v8)
        {
          uint64_t v15 = self->_formerPath;
          *(_DWORD *)statfs buf = 138477827;
          __int16 v20 = v15;
          _os_log_debug_impl(&dword_181795000, v7, OS_LOG_TYPE_DEBUG, "#filereference Detected deletion of %{private}@", buf, 0xCu);
        }
        [(NSFileWatcherObservations *)self->_itemObservations addDeletion];
      }
    }
    LOBYTE(formerPath) = 0;
    goto LABEL_15;
  }
}

void __23__NSFileWatcher_settle__block_invoke(uint64_t a1, int a2, unsigned int a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 48)) {
    BOOL v7 = 0;
  }
  else {
    BOOL v7 = a2 == 0;
  }
  if (!v7)
  {
    BOOL v8 = _NSFCFSEventsLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v11) = 0;
      _os_log_debug_impl(&dword_181795000, v8, OS_LOG_TYPE_DEBUG, "Re-watching for new or moved file", (uint8_t *)&v11, 2u);
    }
    [*(id *)(a1 + 32) watchItem];
  }
  unsigned int v9 = _NSFCFSEventsLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 134218243;
    uint64_t v12 = a3;
    __int16 v13 = 2113;
    int v14 = a4;
    _os_log_debug_impl(&dword_181795000, v9, OS_LOG_TYPE_DEBUG, "Notifying the observer. Subitem path: <none>, event kind: %p, event path: %{private}@", (uint8_t *)&v11, 0x16u);
  }
  if ([a4 hasPrefix:*(void *)(a1 + 40)]) {
    a4 = objc_msgSend(a4, "substringFromIndex:", objc_msgSend(*(id *)(a1 + 40), "length"));
  }
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:a4];
  (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 56) + 16))();
}

uint64_t __23__NSFileWatcher_settle__block_invoke_90(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)a3[4];
  uint64_t result = [v5 caseInsensitiveCompare:*(void *)(a1 + 32)];
  if (result)
  {
    if (!*(void *)(a1 + 40) || (uint64_t result = objc_msgSend(v5, "caseInsensitiveCompare:")) != 0)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __23__NSFileWatcher_settle__block_invoke_2;
      v7[3] = &unk_1E51FE4D0;
      long long v8 = *(_OWORD *)(a1 + 48);
      return [a3 notifyObserver:v7];
    }
  }
  return result;
}

void __23__NSFileWatcher_settle__block_invoke_2(uint64_t a1, uint64_t a2, unsigned int a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v7 = _NSFCFSEventsLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138412802;
    id v10 = a4;
    __int16 v11 = 2048;
    uint64_t v12 = a3;
    __int16 v13 = 2112;
    int v14 = a4;
    _os_log_debug_impl(&dword_181795000, v7, OS_LOG_TYPE_DEBUG, "Notifying the observer. Subitem path: %@, event kind: %p, event path: %@", (uint8_t *)&v9, 0x20u);
  }
  if ([a4 hasPrefix:*(void *)(a1 + 32)]) {
    a4 = objc_msgSend(a4, "substringFromIndex:", objc_msgSend(*(id *)(a1 + 32), "length"));
  }
  long long v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:a4];
  (*(void (**)(void))(*(void *)(*(void *)(a1 + 40) + 56) + 16))();
}

- (void)stop
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  CFURLRef v3 = _NSFCFSEventsLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    url = self->_url;
    int v6 = 138477827;
    BOOL v7 = url;
    _os_log_debug_impl(&dword_181795000, v3, OS_LOG_TYPE_DEBUG, "Stopping watcher for %{private}@", (uint8_t *)&v6, 0xCu);
  }
  if (self->_isUnsettled)
  {

    self->_itemObservations = 0;
    self->_subitemObservationsByEventPath = 0;
    (*((void (**)(void))self->_observer + 2))();

    self->_formerURL = 0;
    self->_isUnsettled = 0;
  }

  self->_formerPath = 0;
  self->_fileReferenceURL = 0;
  if (self->_eventStream)
  {
    off_1EB1EDE98();
    off_1EB1EDEA0(self->_eventStream);
    off_1EB1EDE90(self->_eventStream);
    self->_eventStream = 0;
  }
  eventSource = self->_eventSource;
  if (eventSource)
  {
    dispatch_source_cancel(eventSource);
    dispatch_release((dispatch_object_t)self->_eventSource);
    self->_eventSource = 0;
  }
  self->_isWatching = 0;
}

@end