@interface OSLogEventSource
- (NSDate)newestDate;
- (NSDate)oldestDate;
- (NSMutableArray)_fileRefs;
- (NSUUID)uniqueIdentifier;
- (OSLogEventSource)initWithCollection:(id)a3 metadata:(id)a4 timesync:(_os_timesync_db_s *)a5;
- (_OSLogCollectionReference)lcr;
- (_OSLogEventStoreMetadata)lesm;
- (_OSLogEventStoreTimeRef)newestTimeRef;
- (_OSLogEventStoreTimeRef)oldestTimeRef;
- (_os_timesync_db_s)tsdb;
- (void)_enumerateIndexFiles:(id)a3;
- (void)_insertIndexFile:(id)a3;
- (void)dealloc;
- (void)set_fileRefs:(id)a3;
@end

@implementation OSLogEventSource

- (void)_enumerateIndexFiles:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void))a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_fileRefs;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)dealloc
{
  _timesync_db_close((int *)self->_tsdb);
  [(_OSLogCollectionReference *)self->_lcr close];
  v3.receiver = self;
  v3.super_class = (Class)OSLogEventSource;
  [(OSLogEventSource *)&v3 dealloc];
}

- (OSLogEventSource)initWithCollection:(id)a3 metadata:(id)a4 timesync:(_os_timesync_db_s *)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)OSLogEventSource;
  long long v11 = [(OSLogEventSource *)&v17 init];
  long long v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_lcr, a3);
    objc_storeStrong((id *)&v12->_lesm, a4);
    v12->_tsdb = a5;
    uint64_t v13 = [MEMORY[0x1E4F1CA48] array];
    fileRefs = v12->_fileRefs;
    v12->_fileRefs = (NSMutableArray *)v13;

    if (v10)
    {
      id v15 = v10;
      _timesync_range_create_impl();
    }
  }

  return v12;
}

- (NSDate)newestDate
{
  lesm = self->_lesm;
  if (lesm)
  {
    tsdb = self->_tsdb;
    v5 = [(_OSLogEventStoreMetadata *)lesm end];
    uint64_t v6 = (void *)[v5 UUID];
    uint64_t v7 = [(_OSLogEventStoreMetadata *)self->_lesm end];
    unint64_t v8 = _timesync_continuous_to_wall_time((uint64_t)tsdb, v6, [v7 continuousTime], 0);

    [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)v8 / 1000000000.0];
  }
  else
  {
    [MEMORY[0x1E4F1C9C8] date];
  id v9 = };
  return (NSDate *)v9;
}

- (void)_insertIndexFile:(id)a3
{
}

- (_os_timesync_db_s)tsdb
{
  return self->_tsdb;
}

- (_OSLogEventStoreMetadata)lesm
{
  return self->_lesm;
}

- (_OSLogCollectionReference)lcr
{
  return self->_lcr;
}

- (NSUUID)uniqueIdentifier
{
  return [(_OSLogEventStoreMetadata *)self->_lesm archiveUUID];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oldestTimeRef, 0);
  objc_storeStrong((id *)&self->_lesm, 0);
  objc_storeStrong((id *)&self->_lcr, 0);
  objc_storeStrong((id *)&self->_fileRefs, 0);
}

- (_OSLogEventStoreTimeRef)oldestTimeRef
{
  return self->_oldestTimeRef;
}

- (void)set_fileRefs:(id)a3
{
}

- (NSMutableArray)_fileRefs
{
  return self->_fileRefs;
}

- (NSDate)oldestDate
{
  oldestTimeRef = self->_oldestTimeRef;
  if (oldestTimeRef) {
    objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:", (double)_timesync_continuous_to_wall_time((uint64_t)self->_tsdb, (void *)-[_OSLogEventStoreTimeRef UUID](oldestTimeRef, "UUID"), -[_OSLogEventStoreTimeRef continuousTime](self->_oldestTimeRef, "continuousTime"), 0)/ 1000000000.0);
  }
  else {
  v4 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  return (NSDate *)v4;
}

- (_OSLogEventStoreTimeRef)newestTimeRef
{
  return [(_OSLogEventStoreMetadata *)self->_lesm end];
}

@end