@interface OSLogEventStream
- (OSLogEventSource)source;
- (OSLogEventStream)initWithSource:(id)a3;
- (OSLogEventStream)initWithSource:(id)a3 skipNonSignpostFiles:(BOOL)a4;
- (_OSLogCatalogFilter)catalogFilter;
- (_OSLogIndex)index;
- (_os_timesync_db_s)tsdb;
- (id)_initWithSource:(id)a3 flags:(unint64_t)a4;
- (void)_activateStreamFromDate:(id)a3 toDate:(id)a4;
- (void)_activateStreamFromTimeIntervalSinceLastBoot:(double)a3;
- (void)_activateStreamInRange:(os_timesync_range_s *)a3;
- (void)_foreachIndexFile:(id)a3;
- (void)activateStreamFromDate:(id)a3;
- (void)activateStreamFromLastBoot;
- (void)activateStreamFromPosition:(id)a3;
- (void)dealloc;
- (void)setCatalogFilter:(id)a3;
- (void)setFilterPredicate:(id)a3;
- (void)setIndex:(id)a3;
- (void)setTsdb:(_os_timesync_db_s *)a3;
@end

@implementation OSLogEventStream

uint64_t __42__OSLogEventStream__initWithSource_flags___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = v3;
  if (!*(unsigned char *)(a1 + 40)
    || (v4 = (char *)[v3 path]) == 0
    || (v5 = v4, (v6 = strchr(v4, 47)) == 0)
    || !strncmp(v5, "Signpost/", v6 - v5))
  {
    [*(id *)(*(void *)(a1 + 32) + 72) insertIndexFile:v8];
  }
  return MEMORY[0x1F41817F8]();
}

BOOL __43__OSLogEventStream__activateStreamInRange___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (!v4 || [v4 evaluateWithObject:v3])
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v3 _timesyncRangeUUIDIndex];
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v3 machContinuousTimestamp];
    v5 = [*(id *)(a1 + 40) streamHandler];
    ((void (**)(void, id))v5)[2](v5, v3);
  }
  BOOL v6 = [*(id *)(a1 + 40) invalidated] == 0;

  return v6;
}

- (void)dealloc
{
  tsdb = (int *)self->_tsdb;
  if (tsdb) {
    _timesync_db_close(tsdb);
  }
  v4.receiver = self;
  v4.super_class = (Class)OSLogEventStream;
  [(OSLogEventStream *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_index, 0);
  objc_storeStrong((id *)&self->_catalogFilter, 0);
}

- (OSLogEventStream)initWithSource:(id)a3 skipNonSignpostFiles:(BOOL)a4
{
  return (OSLogEventStream *)[(OSLogEventStream *)self _initWithSource:a3 flags:a4];
}

- (id)_initWithSource:(id)a3 flags:(unint64_t)a4
{
  char v4 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = [(OSLogEventStreamBase *)self init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_source, a3);
    uint64_t v10 = _timesync_db_openat(*(_DWORD *)[v7 tsdb], ".");
    v9->_tsdb = (_os_timesync_db_s *)v10;
    if (v10)
    {
      v11 = [v7 lcr];
      v12 = [v7 lesm];
      v13 = [[_OSLogIndex alloc] initWithCollection:v11 timesync:v9->_tsdb metadata:v12];
      index = v9->_index;
      v9->_index = v13;

      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __42__OSLogEventStream__initWithSource_flags___block_invoke;
      v16[3] = &unk_1E5A429C8;
      char v18 = v4 & 1;
      v17 = v9;
      [v7 _enumerateIndexFiles:v16];
    }
  }

  return v9;
}

void __51__OSLogEventStream__activateStreamFromDate_toDate___block_invoke(id *a1)
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v1 = a1[4];
  if (v1[11] && v1[9])
  {
    [a1[5] timeIntervalSince1970];
    if (v3 > 0.0) {
      [a1[5] timeIntervalSince1970];
    }
    if (([a1[4] flags] & 8) == 0)
    {
      [a1[6] timeIntervalSince1970];
      if (v7 > 0.0) {
        objc_msgSend(a1[6], "timeIntervalSince1970", 0.0);
      }
    }
    _timesync_range_create_impl();
  }
  v9[0] = 0;
  v9[1] = 0;
  memset(uu, 0, sizeof(uu));
  char v4 = v1;
  uuid_clear(uu);
  v5 = [v4[10] uniqueIdentifier];
  [v5 getUUIDBytes:v9];

  BOOL v6 = [[OSLogEventStreamPosition alloc] initWithSource:v9 bootUUID:uu time:0];
  _invalidate(v4, 9, v6);
}

- (void)_activateStreamInRange:(os_timesync_range_s *)a3
{
  v44[2] = *MEMORY[0x1E4F143B8];
  char v4 = [(OSLogEventStreamBase *)self streamHandler];

  if (!v4)
  {
    qword_1E953C2E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: OSLogEventStream activated without stream handler";
    __break(1u);
  }
  char v24 = [(OSLogEventStreamBase *)self flags];
  char v23 = [(OSLogEventStreamBase *)self flags];
  char v22 = [(OSLogEventStreamBase *)self flags];
  char v5 = [(OSLogEventStreamBase *)self flags];
  char v21 = [(OSLogEventStreamBase *)self flags];
  char v6 = [(OSLogEventStreamBase *)self flags];
  char v7 = [(OSLogEventStreamBase *)self flags];
  char v8 = [(OSLogEventStreamBase *)self flags];
  __int16 v9 = [(OSLogEventStreamBase *)self flags];
  __int16 v10 = [(OSLogEventStreamBase *)self flags];
  v11 = [(OSLogEventStreamBase *)self filterPredicate];
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x2020000000;
  uint64_t v43 = 0;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2020000000;
  uint64_t v39 = 0;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  uint64_t v35 = 0;
  index = self->_index;
  v13 = [(OSLogEventStream *)self catalogFilter];
  uint64_t v14 = v23 & 0x40 | v24 & 0x20 | (4 * (v22 & 1)) | v5 & 2 | ((v21 & 4) == 0) | v6 & 8 | v7 & 0x10 | v8 & 0x80 | v9 & 0x100 | v10 & 0x200u;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __43__OSLogEventStream__activateStreamInRange___block_invoke;
  v26[3] = &unk_1E5A429F0;
  id v15 = v11;
  id v27 = v15;
  v28 = self;
  v29 = &v32;
  v30 = &v40;
  v31 = &v36;
  [(_OSLogIndex *)index enumerateEntriesInRange:a3 options:v14 usingCatalogFilter:v13 usingBlock:v26];

  v44[0] = 0;
  v44[1] = 0;
  uint64_t v16 = v41[3];
  v17 = [(OSLogEventSource *)self->_source uniqueIdentifier];
  [v17 getUUIDBytes:v44];

  char v18 = [OSLogEventStreamPosition alloc];
  uint64_t v19 = [(OSLogEventStreamPosition *)v18 initWithSource:v44 bootUUID:a3->var3[v16] time:v37[3]];
  uint64_t v20 = v33[3];
  if (!v20)
  {
    if ([(OSLogEventStreamBase *)self invalidated]) {
      uint64_t v20 = 4;
    }
    else {
      uint64_t v20 = 5;
    }
    v33[3] = v20;
  }
  _invalidate(self, v20, v19);

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);
}

- (void)setFilterPredicate:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)OSLogEventStream;
  [(OSLogEventStreamBase *)&v9 setFilterPredicate:a3];
  char v4 = [_OSLogCatalogFilter alloc];
  char v5 = [(OSLogEventStreamBase *)self filterPredicate];
  char v6 = [(OSLogEventSource *)self->_source lcr];
  char v7 = [(_OSLogCatalogFilter *)v4 initWithPredicate:v5 collection:v6];
  catalogFilter = self->_catalogFilter;
  self->_catalogFilter = v7;
}

- (_OSLogCatalogFilter)catalogFilter
{
  return self->_catalogFilter;
}

- (void)activateStreamFromDate:(id)a3
{
  source = self->_source;
  id v5 = a3;
  id v6 = [(OSLogEventSource *)source newestDate];
  [(OSLogEventStream *)self _activateStreamFromDate:v5 toDate:v6];
}

- (void)_activateStreamFromDate:(id)a3 toDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [(OSLogEventStreamBase *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__OSLogEventStream__activateStreamFromDate_toDate___block_invoke;
  block[3] = &unk_1E5A42A18;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)setTsdb:(_os_timesync_db_s *)a3
{
  self->_tsdb = a3;
}

- (_os_timesync_db_s)tsdb
{
  return self->_tsdb;
}

- (OSLogEventSource)source
{
  return self->_source;
}

- (void)setIndex:(id)a3
{
}

- (_OSLogIndex)index
{
  return self->_index;
}

- (void)setCatalogFilter:(id)a3
{
}

- (void)activateStreamFromPosition:(id)a3
{
  id v4 = a3;
  id v5 = [(OSLogEventStreamBase *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__OSLogEventStream_activateStreamFromPosition___block_invoke;
  v7[3] = &unk_1E5A42A68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __47__OSLogEventStream_activateStreamFromPosition___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 88) && *(void *)(v1 + 72))
  {
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    double v3 = [*(id *)(v1 + 80) uniqueIdentifier];
    [v3 getUUIDBytes:&v9];

    id v4 = (void *)[*(id *)(a1 + 40) sourceUUID];
    if (v9 == *v4 && v10 == v4[1]) {
      _timesync_range_create_impl();
    }
    _invalidate(*(void **)(a1 + 32), 3, *(void **)(a1 + 40));
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    memset(uu, 0, sizeof(uu));
    id v5 = (id *)(id)v1;
    uuid_clear(uu);
    id v6 = [v5[10] uniqueIdentifier];
    [v6 getUUIDBytes:&v9];

    id v7 = [[OSLogEventStreamPosition alloc] initWithSource:&v9 bootUUID:uu time:0];
    _invalidate(v5, 9, v7);
  }
}

- (void)activateStreamFromLastBoot
{
}

- (void)_activateStreamFromTimeIntervalSinceLastBoot:(double)a3
{
  id v5 = [(OSLogEventStreamBase *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__OSLogEventStream__activateStreamFromTimeIntervalSinceLastBoot___block_invoke;
  v6[3] = &unk_1E5A42A40;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  dispatch_async(v5, v6);
}

void __65__OSLogEventStream__activateStreamFromTimeIntervalSinceLastBoot___block_invoke(uint64_t a1)
{
  v6[2] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1[11] && v1[9]) {
    _timesync_range_create_since_last_boot();
  }
  v6[0] = 0;
  v6[1] = 0;
  memset(uu, 0, sizeof(uu));
  v2 = v1;
  uuid_clear(uu);
  double v3 = [v2[10] uniqueIdentifier];
  [v3 getUUIDBytes:v6];

  id v4 = [[OSLogEventStreamPosition alloc] initWithSource:v6 bootUUID:uu time:0];
  _invalidate(v2, 9, v4);
}

- (void)_foreachIndexFile:(id)a3
{
}

- (OSLogEventStream)initWithSource:(id)a3
{
  return (OSLogEventStream *)[(OSLogEventStream *)self _initWithSource:a3 flags:0];
}

@end