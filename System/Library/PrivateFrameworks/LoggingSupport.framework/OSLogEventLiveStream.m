@interface OSLogEventLiveStream
- (OSLogEventLiveSource)source;
- (OSLogEventLiveStream)initWithLiveSource:(id)a3;
- (OS_xpc_object)diagdconn;
- (id)dropnoteHandler;
- (void)_activateLiveStream;
- (void)_handleStreamedObject:(id)a3 usingProxy:(id)a4;
- (void)activate;
- (void)invalidate;
- (void)setDiagdconn:(id)a3;
- (void)setDropnoteHandler:(id)a3;
- (void)setDroppedEventHandler:(id)a3;
- (void)setFilterPredicate:(id)a3;
@end

@implementation OSLogEventLiveStream

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dropnoteHandler, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_diagdconn, 0);
  objc_storeStrong((id *)&self->_streamFilter, 0);
}

- (void)setDropnoteHandler:(id)a3
{
}

- (id)dropnoteHandler
{
  return self->_dropnoteHandler;
}

- (OSLogEventLiveSource)source
{
  return self->_source;
}

- (void)setDiagdconn:(id)a3
{
}

- (OS_xpc_object)diagdconn
{
  return self->_diagdconn;
}

- (void)invalidate
{
  v5.receiver = self;
  v5.super_class = (Class)OSLogEventLiveStream;
  [(OSLogEventStreamBase *)&v5 invalidate];
  v3 = [(OSLogEventStreamBase *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__OSLogEventLiveStream_invalidate__block_invoke;
  block[3] = &unk_1E5A427F8;
  block[4] = self;
  dispatch_async(v3, block);
}

void __34__OSLogEventLiveStream_invalidate__block_invoke(uint64_t a1)
{
  v1 = *(_xpc_connection_s **)(*(void *)(a1 + 32) + 80);
  if (v1) {
    xpc_connection_cancel(v1);
  }
}

- (void)activate
{
  v3 = [(OSLogEventStreamBase *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__OSLogEventLiveStream_activate__block_invoke;
  block[3] = &unk_1E5A427F8;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __32__OSLogEventLiveStream_activate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateLiveStream];
}

- (void)_activateLiveStream
{
  v3 = [(OSLogEventStreamBase *)self queue];
  dispatch_assert_queue_V2(v3);

  v4 = [(OSLogEventStreamBase *)self streamHandler];

  if (!v4) {
    goto LABEL_28;
  }
  if (![(OSLogEventStreamBase *)self invalidated])
  {
    v9 = [(OSLogEventStreamBase *)self queue];
    mach_service = xpc_connection_create_mach_service("com.apple.diagnosticd", v9, 2uLL);
    diagdconn = self->_diagdconn;
    self->_diagdconn = mach_service;

    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x2050000000;
    id v31 = 0;
    id v31 = +[OSLogEventProxy _make];
    self->_unint64_t reason = 0;
    v12 = self->_diagdconn;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __43__OSLogEventLiveStream__activateLiveStream__block_invoke;
    handler[3] = &unk_1E5A427D0;
    handler[4] = self;
    handler[5] = &v28;
    xpc_connection_set_event_handler(v12, handler);
    xpc_connection_activate(self->_diagdconn);
    xpc_object_t v13 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v13, "action", 3uLL);
    [(id)v29[3] _setIncludeSensitive:1];
    xpc_dictionary_set_uint64(v13, "flags", (16 * [(OSLogEventStreamBase *)self flags]) & 0x20 | (([(OSLogEventStreamBase *)self flags] & 1) << 8));
    char v14 = [(OSLogEventStreamBase *)self flags];
    char v15 = [(OSLogEventStreamBase *)self flags];
    __int16 v16 = [(OSLogEventStreamBase *)self flags];
    __int16 v17 = [(OSLogEventStreamBase *)self flags];
    uint64_t v18 = 15;
    if ((v14 & 0x20) == 0) {
      uint64_t v18 = 7;
    }
    if (v15 < 0) {
      v18 &= 0xEu;
    }
    if ((v16 & 0x100) != 0) {
      v18 &= ~2uLL;
    }
    if ((v17 & 0x200) != 0) {
      uint64_t v19 = v18 & 0xFFFFFFFFFFFFFFFBLL;
    }
    else {
      uint64_t v19 = v18;
    }
    xpc_dictionary_set_uint64(v13, "types", v19);
    xpc_dictionary_set_BOOL(v13, "all_procs", 1);
    streamFilter = self->_streamFilter;
    if (streamFilter)
    {
      id v21 = [(_OSLogStreamFilter *)streamFilter data];
      v22 = (const void *)[v21 bytes];
      v23 = [(_OSLogStreamFilter *)self->_streamFilter data];
      xpc_dictionary_set_data(v13, "stream_filter", v22, [v23 length]);
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_1A112E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Sending stream request to diagnosticd", v26, 2u);
    }
    xpc_object_t v24 = xpc_connection_send_message_with_reply_sync(self->_diagdconn, v13);
    if (MEMORY[0x1A622E220]() == MEMORY[0x1E4F145A8])
    {
      xpc_connection_cancel(self->_diagdconn);
      goto LABEL_25;
    }
    uint64_t uint64 = xpc_dictionary_get_uint64(v24, "error");
    if (!uint64)
    {
LABEL_25:

      _Block_object_dispose(&v28, 8);
      return;
    }
    if (uint64 == 1)
    {
      [(OSLogEventLiveStream *)self invalidate];
      self->_unint64_t reason = 7;
      xpc_connection_cancel(self->_diagdconn);
      goto LABEL_25;
    }
    _os_assert_log();
    _os_crash();
    __break(1u);
LABEL_28:
    qword_1E953C2E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: OSLogEventLiveStream activated without stream handler";
    __break(1u);
    return;
  }
  self->_unint64_t reason = 4;
  objc_super v5 = [(OSLogEventStreamBase *)self invalidationHandler];

  if (v5)
  {
    v6 = [(OSLogEventStreamBase *)self invalidationHandler];
    unint64_t reason = self->_reason;
    v8 = [OSLogEventStreamPosition alloc];
    ((void (**)(void, unint64_t, OSLogEventStreamPosition *))v6)[2](v6, reason, v8);

    [(OSLogEventStreamBase *)self setInvalidationHandler:0];
  }
}

void __43__OSLogEventLiveStream__activateLiveStream__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (MEMORY[0x1A622E220]() == MEMORY[0x1E4F145A8])
  {
    objc_super v5 = *(void **)(a1 + 32);
    if (v3 != (id)MEMORY[0x1E4F14528])
    {
      v6 = (_xpc_connection_s *)v5[10];
LABEL_16:
      xpc_connection_cancel(v6);
      goto LABEL_17;
    }
    if (![v5 invalidated])
    {
      [*(id *)(a1 + 32) invalidate];
      *(void *)(*(void *)(a1 + 32) + 72) = 1;
    }
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) _unmake];
    v11 = [*(id *)(a1 + 32) invalidationHandler];

    if (v11)
    {
      v12 = [*(id *)(a1 + 32) invalidationHandler];
      uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 72);
      char v14 = [OSLogEventStreamPosition alloc];
      ((void (**)(void, uint64_t, OSLogEventStreamPosition *))v12)[2](v12, v13, v14);

      [*(id *)(a1 + 32) setInvalidationHandler:0];
    }
  }
  else
  {
    uint64_t v19 = 0;
    id v4 = v3;
    if (MEMORY[0x1A622E220]() != MEMORY[0x1E4F14590])
    {
      asprintf(&v19, "Not a dictionary\n");
      goto LABEL_9;
    }
    v7 = xpc_dictionary_get_value(v4, "action");
    if (MEMORY[0x1A622E220]() != MEMORY[0x1E4F145F8])
    {
      v8 = (char *)xpc_copy_short_description();
      asprintf(&v19, "Action is %s (not uint64, which was expected)\n", v8);
      free(v8);
LABEL_8:

LABEL_9:
      v9 = v19;
      BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
      if (v9)
      {
        if (v10)
        {
          *(_DWORD *)buf = 136446210;
          id v21 = v9;
          _os_log_error_impl(&dword_1A112E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error with received event: %{public}s", buf, 0xCu);
          v9 = v19;
        }
        free(v9);
      }
      else if (v10)
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1A112E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unspecified error with received event", buf, 2u);
      }
      goto LABEL_15;
    }
    uint64_t value = xpc_uint64_get_value(v7);
    uint64_t v16 = value;
    if (value != 6 && value != 12)
    {
      asprintf(&v19, "Action is %llu (not %llu or %llu, which was expected)\n", value, 6, 12);
      goto LABEL_8;
    }

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) _setThreadCrumb];
    __int16 v17 = *(void **)(a1 + 32);
    if (v16 == 6)
    {
      [v17 _handleStreamedObject:v4 usingProxy:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
    }
    else
    {
      uint64_t v18 = v17[12];
      if (v18) {
        (*(void (**)(uint64_t, void))(v18 + 16))(v18, 0);
      }
    }
    if ([*(id *)(a1 + 32) invalidated])
    {
      *(void *)(*(void *)(a1 + 32) + 72) = 4;
LABEL_15:
      v6 = *(_xpc_connection_s **)(*(void *)(a1 + 32) + 80);
      goto LABEL_16;
    }
  }
LABEL_17:
}

- (void)_handleStreamedObject:(id)a3 usingProxy:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  [v6 _fillFromXPCEventObject:v11];
  v7 = [(OSLogEventStreamBase *)self filterPredicate];

  if (!v7
    || ([(OSLogEventStreamBase *)self filterPredicate],
        v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v8 evaluateWithObject:v6],
        v8,
        (v9 & 1) != 0))
  {
    BOOL v10 = [(OSLogEventStreamBase *)self streamHandler];
    ((void (**)(void, id))v10)[2](v10, v6);
  }
}

- (void)setFilterPredicate:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)OSLogEventLiveStream;
  [(OSLogEventStreamBase *)&v8 setFilterPredicate:a3];
  id v4 = [_OSLogStreamFilter alloc];
  objc_super v5 = [(OSLogEventStreamBase *)self filterPredicate];
  id v6 = [(_OSLogStreamFilter *)v4 initWithPredicate:v5];
  streamFilter = self->_streamFilter;
  self->_streamFilter = v6;
}

- (void)setDroppedEventHandler:(id)a3
{
  id v4 = _Block_copy(a3);
  id dropnoteHandler = self->_dropnoteHandler;
  self->_id dropnoteHandler = v4;
  MEMORY[0x1F41817F8](v4, dropnoteHandler);
}

- (OSLogEventLiveStream)initWithLiveSource:(id)a3
{
  id v5 = a3;
  id v6 = [(OSLogEventStreamBase *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_source, a3);
  }

  return v7;
}

@end