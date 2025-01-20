@interface OSLogPersistence
- (BOOL)allowSensitive;
- (BOOL)streamChunks:(id)a3 andEntries:(id)a4 flags:(unsigned int)a5;
- (BOOL)verbose;
- (NSCompoundPredicate)predicate;
- (NSDate)endDate;
- (NSDate)sparseDataStart;
- (NSDate)startDate;
- (NSDictionary)statistics;
- (NSString)currentFile;
- (NSURL)logArchive;
- (NSURL)logFile;
- (OSLogPersistence)init;
- (OSLogPersistenceDelegate)delegate;
- (_os_timesync_db_s)timesync;
- (int64_t)archiveState;
- (int64_t)archiveVersion;
- (unint64_t)batchSize;
- (unint64_t)decodeFailures;
- (unint64_t)logMessageCount;
- (unint64_t)messagesFiltered;
- (unint64_t)options;
- (void)_openFiles;
- (void)_openLocalPersistenceDir;
- (void)_openPath:(id)a3;
- (void)dealloc;
- (void)enumerateFromLastBootWithBlock:(id)a3;
- (void)enumerateFromStartDate:(id)a3 toEndDate:(id)a4 withBlock:(id)a5;
- (void)fetchFromStartDate:(id)a3 toEndDate:(id)a4;
- (void)setBatchSize:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setLogArchive:(id)a3;
- (void)setLogFile:(id)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setPredicate:(id)a3;
- (void)setVerbose:(BOOL)a3;
@end

@implementation OSLogPersistence

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_sparseDataStart, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_currentFile, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_logArchive, 0);
  objc_storeStrong((id *)&self->_logFile, 0);
  objc_storeStrong((id *)&self->_index, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_oslcr, 0);
}

- (void)setVerbose:(BOOL)a3
{
  self->_verbose = a3;
}

- (BOOL)verbose
{
  return self->_verbose;
}

- (unint64_t)logMessageCount
{
  return self->_logMessageCount;
}

- (unint64_t)messagesFiltered
{
  return self->_messagesFiltered;
}

- (unint64_t)decodeFailures
{
  return self->_decodeFailures;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSDate)sparseDataStart
{
  return self->_sparseDataStart;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSString)currentFile
{
  return self->_currentFile;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_batchSize = a3;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (NSCompoundPredicate)predicate
{
  return self->_predicate;
}

- (void)setDelegate:(id)a3
{
}

- (OSLogPersistenceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (OSLogPersistenceDelegate *)WeakRetained;
}

- (NSURL)logArchive
{
  return self->_logArchive;
}

- (NSURL)logFile
{
  return self->_logFile;
}

- (NSDictionary)statistics
{
  v42[8] = *MEMORY[0x1E4F143B8];
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  v36[3] = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  char v35 = 0;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x6010000000;
  v32 = &unk_1A1194946;
  memset(&v33, 0, sizeof(v33));
  rb_tree_init(&v33, (const rb_tree_ops_t *)&statistics_ops);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __30__OSLogPersistence_statistics__block_invoke;
  v28[3] = &unk_1E5A426E0;
  v28[4] = v36;
  v28[5] = v34;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __30__OSLogPersistence_statistics__block_invoke_2;
  v27[3] = &unk_1E5A42708;
  v27[4] = &v29;
  v27[5] = v34;
  v27[6] = v36;
  [(OSLogPersistence *)self streamChunks:v28 andEntries:v27 flags:0];
  if (rb_tree_count((rb_tree_t *)(v30 + 4)))
  {
    v24 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:rb_tree_count((rb_tree_t *)(v30 + 4))];
    v25 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:rb_tree_count((rb_tree_t *)(v30 + 4))];
    for (i = (char *)rb_tree_iterate((rb_tree_t *)(v30 + 4), 0, 1u);
          i;
          i = (char *)rb_tree_iterate((rb_tree_t *)(v30 + 4), i, 1u))
    {
      if (*((void *)i + 133))
      {
        v41[0] = @"uuid";
        v4 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:i + 24];
        v42[0] = v4;
        v41[1] = @"path";
        v5 = [NSString stringWithUTF8String:i + 40];
        v42[1] = v5;
        v41[2] = @"activityCreationCount";
        v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:**((void **)i + 133)];
        v42[2] = v6;
        v41[3] = @"userActionCount";
        v7 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:*(void *)(*((void *)i + 133) + 24)];
        v42[3] = v7;
        v41[4] = @"logMessageCount";
        v8 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:*(void *)(*((void *)i + 133) + 16)];
        v42[4] = v8;
        v41[5] = @"traceMessageCount";
        v9 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:*(void *)(*((void *)i + 133) + 8)];
        v42[5] = v9;
        v41[6] = @"totalProcessPublicSize";
        v10 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:*(void *)(*((void *)i + 133) + 56)];
        v42[6] = v10;
        v41[7] = @"totalProcessPrivateSize";
        v11 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:*(void *)(*((void *)i + 133) + 64)];
        v42[7] = v11;
        v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:8];
        [v24 addObject:v12];
      }
      v39[0] = @"uuid";
      v26 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:i + 24];
      v40[0] = v26;
      v39[1] = @"path";
      v13 = [NSString stringWithUTF8String:i + 40];
      v40[1] = v13;
      v39[2] = @"activityCreationCount";
      v14 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:*((void *)i + 134)];
      v40[2] = v14;
      v39[3] = @"userActionCount";
      v15 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:*((void *)i + 137)];
      v40[3] = v15;
      v39[4] = @"logMessageCount";
      v16 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:*((void *)i + 136)];
      v40[4] = v16;
      v39[5] = @"traceMessageCount";
      v17 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:*((void *)i + 135)];
      v40[5] = v17;
      v39[6] = @"tracePublicSize";
      v18 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:*((void *)i + 138)];
      v40[6] = v18;
      v39[7] = @"logPublicSize";
      v19 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:*((void *)i + 139)];
      v40[7] = v19;
      v39[8] = @"logPrivateSize";
      v20 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:*((void *)i + 140)];
      v40[8] = v20;
      v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:9];
      [v25 addObject:v21];
    }
    v37[0] = @"perProcessStatistics";
    v37[1] = @"perSenderStatistics";
    v38[0] = v24;
    v38[1] = v25;
    v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:2];
  }
  else
  {
    v22 = 0;
  }
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(v34, 8);
  _Block_object_dispose(v36, 8);
  return (NSDictionary *)v22;
}

uint64_t __30__OSLogPersistence_statistics__block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + 64))
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  return 1;
}

uint64_t __30__OSLogPersistence_statistics__block_invoke_2(void *a1, uint64_t a2)
{
  node = rb_tree_find_node((rb_tree_t *)(*(void *)(a1[4] + 8) + 32), *(const void **)(a2 + 24));
  if (node)
  {
    uint64_t v5 = (uint64_t)node;
    v6 = (void *)node[133];
  }
  else
  {
    uint64_t v5 = _os_trace_calloc();
    if (*(void *)(a2 + 32)) {
      __strlcpy_chk();
    }
    else {
      uuid_unparse_upper(*(const unsigned __int8 **)(a2 + 24), (char *)(v5 + 40));
    }
    uuid_copy((unsigned __int8 *)(v5 + 24), *(const unsigned __int8 **)(a2 + 24));
    rb_tree_insert_node((rb_tree_t *)(*(void *)(a1[4] + 8) + 32), (void *)v5);
    v6 = (void *)_os_trace_calloc();
    *(void *)(v5 + 1064) = v6;
  }
  if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    uint64_t v7 = v6[8];
    v6[7] += **(unsigned __int16 **)(*(void *)(*(void *)(a1[6] + 8) + 24) + 64);
    v6[8] = v7 + *(void *)(*(void *)(*(void *)(a1[6] + 8) + 24) + 80);
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 0;
  }
  v8 = *(const unsigned __int8 **)(a2 + 80);
  if (v8)
  {
    if (uuid_compare(v8, *(const unsigned __int8 **)(a2 + 24)))
    {
      uint64_t v5 = (uint64_t)rb_tree_find_node((rb_tree_t *)(*(void *)(a1[4] + 8) + 32), *(const void **)(a2 + 80));
      if (!v5)
      {
        uint64_t v5 = _os_trace_calloc();
        __strlcpy_chk();
        if (!*(unsigned char *)(v5 + 40)) {
          uuid_unparse_upper(*(const unsigned __int8 **)(a2 + 80), (char *)(v5 + 40));
        }
        uuid_copy((unsigned __int8 *)(v5 + 24), *(const unsigned __int8 **)(a2 + 80));
        rb_tree_insert_node((rb_tree_t *)(*(void *)(a1[4] + 8) + 32), (void *)v5);
      }
    }
  }
  int v9 = *(_DWORD *)a2;
  if (*(int *)a2 > 767)
  {
    if (v9 == 768)
    {
      ++*(void *)(v5 + 1080);
      *(void *)(v5 + 1104) += *(void *)(a2 + 160);
      ++v6[1];
      uint64_t v11 = *(void *)(a2 + 160);
      v6 += 4;
      goto LABEL_25;
    }
    if (v9 == 1024)
    {
      *(void *)(v5 + 1112) += *(void *)(a2 + 160);
      *(void *)(v5 + 1120) += *(void *)(a2 + 176);
      ++*(void *)(v5 + 1088);
      uint64_t v10 = v6[6];
      v6[5] += *(void *)(a2 + 160);
      v6[6] = v10 + *(void *)(a2 + 176);
      v6 += 2;
      goto LABEL_23;
    }
  }
  else
  {
    if (v9 == 513)
    {
      ++*(void *)(v5 + 1072);
      goto LABEL_23;
    }
    if (v9 == 515)
    {
      ++*(void *)(v5 + 1096);
      v6 += 3;
LABEL_23:
      uint64_t v11 = 1;
LABEL_25:
      *v6 += v11;
    }
  }
  return 1;
}

- (_os_timesync_db_s)timesync
{
  return [(_OSLogIndex *)self->_index timesync];
}

- (void)fetchFromStartDate:(id)a3 toEndDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__830;
    v17 = __Block_byref_object_dispose__831;
    id v18 = (id)objc_opt_new();
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __49__OSLogPersistence_fetchFromStartDate_toEndDate___block_invoke;
    v10[3] = &unk_1E5A42650;
    v12 = &v13;
    v10[4] = self;
    id v9 = WeakRetained;
    id v11 = v9;
    [(OSLogPersistence *)self enumerateFromStartDate:v6 toEndDate:v7 withBlock:v10];
    if ([(id)v14[5] count]) {
      [v9 persistence:self results:v14[5] error:0];
    }
    [v9 persistenceDidFinishReadingForStartDate:v6 endDate:v7];

    _Block_object_dispose(&v13, 8);
  }
}

uint64_t __49__OSLogPersistence_fetchFromStartDate_toEndDate___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:a2];
  if ((unint64_t)[*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count] >= *(void *)(*(void *)(a1 + 32) + 72))
  {
    uint64_t result = objc_msgSend(*(id *)(a1 + 40), "persistence:results:error:");
    if (!result) {
      return result;
    }
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) removeAllObjects];
  }
  return 1;
}

- (void)enumerateFromLastBootWithBlock:(id)a3
{
  id v4 = a3;
  if (!self->_index) {
    [(OSLogPersistence *)self _openFiles];
  }
  BOOL v5 = [(OSLogPersistence *)self allowSensitive];
  unint64_t options = self->_options;
  index = self->_index;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__OSLogPersistence_enumerateFromLastBootWithBlock___block_invoke;
  v11[3] = &unk_1E5A42628;
  if ((options & 3) != 0) {
    int v8 = !v5 & 0xFFFFFFFD | (2 * (options & 1)) | 4;
  }
  else {
    int v8 = !v5 & 0xFFFFFFFD | (2 * (options & 1));
  }
  uint64_t v9 = v8 & 0xFFFFFFBF | (((options >> 5) & 1) << 6);
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  [(_OSLogIndex *)index enumerateEntriesFromLastBootWithOptions:v9 usingBlock:v11];
}

uint64_t __51__OSLogPersistence_enumerateFromLastBootWithBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = +[OSActivityEvent activityEventFromStreamEntry:a2];
  id v4 = *(void **)(*(void *)(a1 + 32) + 64);
  if (v4 && ([v4 evaluateWithObject:v3] & 1) == 0)
  {
    ++*(void *)(*(void *)(a1 + 32) + 128);
    uint64_t v5 = 1;
  }
  else
  {
    uint64_t v5 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }

  return v5;
}

- (void)enumerateFromStartDate:(id)a3 toEndDate:(id)a4 withBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [v8 timeIntervalSince1970];
  if (v11 <= 0.0)
  {
    unint64_t v13 = 0;
  }
  else
  {
    [v8 timeIntervalSince1970];
    unint64_t v13 = (unint64_t)(v12 * 1000000000.0);
  }
  [v9 timeIntervalSince1970];
  if (v14 <= 0.0)
  {
    unint64_t v16 = 0;
  }
  else
  {
    [v9 timeIntervalSince1970];
    unint64_t v16 = (unint64_t)(v15 * 1000000000.0);
  }
  if (!self->_index) {
    [(OSLogPersistence *)self _openFiles];
  }
  if (v16 < v13 || v16 == 0) {
    unint64_t v16 = -1;
  }
  BOOL v18 = [(OSLogPersistence *)self allowSensitive];
  unint64_t options = self->_options;
  unsigned int v20 = !v18 & 0xFFFFFFFD | (2 * (options & 1));
  index = self->_index;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __63__OSLogPersistence_enumerateFromStartDate_toEndDate_withBlock___block_invoke;
  v24[3] = &unk_1E5A42628;
  if ((options & 3) != 0) {
    uint64_t v22 = v20 | 4;
  }
  else {
    uint64_t v22 = v20;
  }
  v24[4] = self;
  id v25 = v10;
  id v23 = v10;
  [(_OSLogIndex *)index enumerateEntriesFrom:v13 to:v16 options:v22 usingBlock:v24];
}

uint64_t __63__OSLogPersistence_enumerateFromStartDate_toEndDate_withBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = +[OSActivityEvent activityEventFromStreamEntry:a2];
  char v4 = v3 != 0;
  if (*(void *)(*(void *)(a1 + 32) + 64)) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5) {
    char v4 = [*(id *)(*(void *)(a1 + 32) + 64) evaluateWithObject:v3];
  }
  if (v4)
  {
    uint64_t v6 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    ++*(void *)(*(void *)(a1 + 32) + 128);
    uint64_t v6 = 1;
  }

  return v6;
}

- (BOOL)streamChunks:(id)a3 andEntries:(id)a4 flags:(unsigned int)a5
{
  id v8 = a3;
  id v9 = a4;
  long long v18 = 0u;
  memset(v17, 0, sizeof(v17));
  uint64_t v13 = 0;
  double v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  *__error() = 3;
  _chunk_support_context_init((uint64_t)v17);
  *(void *)&long long v18 = v9;
  *((void *)&v18 + 1) = v8;
  LODWORD(v17[0]) = a5;
  index = self->_index;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __50__OSLogPersistence_streamChunks_andEntries_flags___block_invoke;
  v12[3] = &unk_1E5A42600;
  v12[4] = &v13;
  v12[5] = v17;
  [(_OSLogIndex *)index enumerateFilesUsingBlock:v12];
  _chunk_support_context_clear((uint64_t)v17);
  LOBYTE(a5) = *((unsigned char *)v14 + 24);
  _Block_object_dispose(&v13, 8);

  return a5;
}

uint64_t __50__OSLogPersistence_streamChunks_andEntries_flags___block_invoke(uint64_t a1, int a2, uint64_t a3, unint64_t a4)
{
  unint64_t v7 = 0;
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2000000000;
  char v21 = 1;
  *(_DWORD *)(v8 + 4) = a2;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 0x40000000;
  uint64_t v13 = (unsigned int (*)(void *))___os_activity_stream_mapped_file_block_invoke;
  double v14 = &unk_1E5A42F00;
  uint64_t v15 = &v18;
  uint64_t v16 = a3;
  uint64_t v17 = v8;
  do
  {
    if (a4 - v7 < 0x10) {
      break;
    }
    unint64_t v9 = *(void *)(a3 + v7 + 8);
    if (a4 - v7 - 16 < v9) {
      break;
    }
    if (!v13(v12)) {
      break;
    }
    unint64_t v7 = (v7 + v9 + 23) & 0xFFFFFFFFFFFFFFF8;
  }
  while (v7 - 1 < a4);
  *(_DWORD *)(v8 + 4) = -1;
  char v10 = *((unsigned char *)v19 + 24);
  _Block_object_dispose(&v18, 8);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v10;
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

- (int64_t)archiveState
{
  int64_t result = (int64_t)self->_version;
  if (result)
  {
    unint64_t v3 = [(id)result state];
    if (v3 > 3) {
      return 2;
    }
    else {
      return qword_1A118B008[v3];
    }
  }
  return result;
}

- (int64_t)archiveVersion
{
  version = self->_version;
  if (version) {
    return [(_OSLogVersioning *)version version];
  }
  else {
    return -1;
  }
}

- (BOOL)allowSensitive
{
  if ((self->_options & 0x40000000) != 0) {
    return 0;
  }
  if (geteuid() && !self->_logArchive) {
    return self->_logFile != 0;
  }
  return 1;
}

- (void)setPredicate:(id)a3
{
  id v15 = a3;
  if (v15)
  {
    char v4 = [[_OSLogPredicateMapper alloc] initWithPredicate:v15 andValidate:0];
    BOOL v5 = [_OSLogLegacyPredicateMapper alloc];
    uint64_t v6 = [(_OSLogPredicateMapper *)v4 mappedPredicate];
    unint64_t v7 = [(_OSLogPredicateMapper *)v5 initWithPredicate:v6];

    uint64_t v8 = [(_OSLogPredicateMapper *)v7 mappedPredicate];

    if (!v8)
    {
      double v11 = (void *)MEMORY[0x1E4F1CA00];
      double v12 = [(_OSLogPredicateMapper *)v7 validationErrors];
      uint64_t v13 = [v12 componentsJoinedByString:@"\n"];
      double v14 = [v11 exceptionWithName:@"OSLogInvalidPredicateException" reason:v13 userInfo:0];

      objc_exception_throw(v14);
    }
    unint64_t v9 = [(_OSLogPredicateMapper *)v7 mappedPredicate];
    predicate = self->_predicate;
    self->_predicate = v9;

    if (([(_OSLogPredicateMapper *)v4 flags] & 2) != 0) {
      self->_options |= 1uLL;
    }
    if ([(_OSLogPredicateMapper *)v4 flags]) {
      self->_options |= 3uLL;
    }
  }
  else
  {
    char v4 = (_OSLogPredicateMapper *)self->_predicate;
    self->_predicate = 0;
  }
}

- (void)setLogArchive:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v14 = 0;
  if ([v5 isFileURL])
  {
    unint64_t v7 = [v5 path];
    uint64_t v8 = [v7 pathExtension];
    char v9 = [v8 isEqualToString:@"logarchive"];

    if (v9)
    {
      if ([v6 fileExistsAtPath:v7 isDirectory:&v14])
      {
        if (v14)
        {
          objc_storeStrong((id *)&self->_logArchive, a3);
          [(OSLogPersistence *)self _openFiles];

          goto LABEL_6;
        }
        char v10 = (void *)MEMORY[0x1E4F1CA00];
        double v11 = [NSString stringWithFormat:@"Log archive named '%@' is not a package.", v7];
        double v12 = @"Log archive is not a package.";
      }
      else
      {
        char v10 = (void *)MEMORY[0x1E4F1CA00];
        double v11 = [NSString stringWithFormat:@"Log archive named '%@' not found.", v7];
        double v12 = @"File not Found";
      }
    }
    else
    {
      char v10 = (void *)MEMORY[0x1E4F1CA00];
      double v11 = [NSString stringWithFormat:@"File name does not end with .logarchive (%@)", v7];
      double v12 = @"Invalid archive provided";
    }
    id v13 = [v10 exceptionWithName:v12 reason:v11 userInfo:0];

    objc_exception_throw(v13);
  }
LABEL_6:
}

- (void)setLogFile:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v14 = 0;
  if (([v5 isFileURL] & 1) == 0)
  {
    [(OSLogPersistence *)self _openFiles];
    goto LABEL_7;
  }
  unint64_t v7 = [v5 path];
  uint64_t v8 = [v7 pathExtension];
  char v9 = [v8 isEqualToString:@"tracev3"];

  if ((v9 & 1) == 0)
  {
    char v10 = (void *)MEMORY[0x1E4F1CA00];
    double v11 = [NSString stringWithFormat:@"File name does not end with .tracev3 (%@)", v7];
    double v12 = @"Invalid file provided";
    goto LABEL_11;
  }
  if (([v6 fileExistsAtPath:v7 isDirectory:&v14] & 1) == 0)
  {
    char v10 = (void *)MEMORY[0x1E4F1CA00];
    double v11 = [NSString stringWithFormat:@"Log file named '%@' not found.", v7];
    double v12 = @"File not Found";
    goto LABEL_11;
  }
  if (v14)
  {
    char v10 = (void *)MEMORY[0x1E4F1CA00];
    double v11 = [NSString stringWithFormat:@"Log file named '%@' is not a regular file.", v7];
    double v12 = @"File is not a regular file.";
LABEL_11:
    id v13 = [v10 exceptionWithName:v12 reason:v11 userInfo:0];

    objc_exception_throw(v13);
  }
  objc_storeStrong((id *)&self->_logFile, a3);
  [(OSLogPersistence *)self _openFiles];

LABEL_7:
}

- (void)dealloc
{
  [(_OSLogCollectionReference *)self->_oslcr close];
  v3.receiver = self;
  v3.super_class = (Class)OSLogPersistence;
  [(OSLogPersistence *)&v3 dealloc];
}

- (OSLogPersistence)init
{
  v3.receiver = self;
  v3.super_class = (Class)OSLogPersistence;
  int64_t result = [(OSLogPersistence *)&v3 init];
  if (result)
  {
    result->_batchSize = 1000;
    result->_verbose = 0;
  }
  return result;
}

- (void)_openFiles
{
  objc_super v3 = NSString;
  if (_os_trace_shared_paths_init_once != -1) {
    dispatch_once(&_os_trace_shared_paths_init_once, &__block_literal_global_55);
  }
  id v12 = [v3 stringWithUTF8String:_os_trace_persist_path];
  logFile = self->_logFile;
  if (logFile || self->_logArchive)
  {
    id v5 = [(NSURL *)logFile path];
    if ([v5 isEqualToString:v12])
    {
    }
    else
    {
      uint64_t v6 = [(NSURL *)self->_logArchive path];
      int v7 = [v6 isEqualToString:v12];

      if (!v7)
      {
        uint64_t v8 = [(NSURL *)self->_logArchive path];
        char v9 = v8;
        if (v8)
        {
          id v10 = v8;
        }
        else
        {
          id v10 = [(NSURL *)self->_logFile path];
        }
        double v11 = v10;

        [(OSLogPersistence *)self _openPath:v11];
        goto LABEL_13;
      }
    }
  }
  [(OSLogPersistence *)self _openLocalPersistenceDir];
LABEL_13:
}

- (void)_openPath:(id)a3
{
  id v27 = a3;
  char v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v27];
  uint64_t v5 = [v27 hasSuffix:@".logarchive"];
  [(_OSLogCollectionReference *)self->_oslcr close];
  uint64_t v6 = +[_OSLogCollectionReference referenceWithURL:v4 error:0];
  oslcr = self->_oslcr;
  self->_oslcr = v6;

  uint64_t v8 = [[_OSLogVersioning alloc] initWithCollection:self->_oslcr error:0];
  version = self->_version;
  self->_version = v8;

  if ([(_OSLogVersioning *)self->_version state] == 3) {
    [(_OSLogVersioning *)self->_version performDestructiveUpdates:0];
  }
  if ([(_OSLogVersioning *)self->_version state] == 1)
  {
    id v10 = [(_OSLogCollectionReference *)self->_oslcr timesyncReference];

    if (!v10)
    {
      [(_OSLogCollectionReference *)self->_oslcr close];
      double v11 = +[_OSLogCollectionReference referenceWithURL:v4 error:0];
      id v12 = self->_oslcr;
      self->_oslcr = v11;
    }
    id v13 = [[_OSLogIndex alloc] initWithCollection:self->_oslcr buildLocalIndex:v5];
    index = self->_index;
    self->_index = v13;

    if ((v5 & 1) == 0)
    {
      uint64_t v15 = open((const char *)[v27 fileSystemRepresentation], 0);
      uint64_t v16 = [[_OSLogChunkFile alloc] initWithFileDescriptor:v15 error:0];
      if (v16) {
        [(_OSLogIndex *)self->_index insertChunkStore:v16];
      }
      if (close(v15) == -1)
      {
        int v25 = *__error();
        uint64_t v26 = *__error();
        if (v25 == 9)
        {
          qword_1E953C2E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
          qword_1E953C318 = v26;
          __break(1u);
          return;
        }
        _os_assumes_log();
      }
    }
    unint64_t v17 = [(_OSLogIndex *)self->_index persistStartWalltime];
    unint64_t v18 = [(_OSLogIndex *)self->_index specialStartWalltime];
    if (v17 >= v18) {
      unint64_t v19 = v18;
    }
    else {
      unint64_t v19 = v17;
    }
    uint64_t v20 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)(v19 / 0x3B9ACA00)];
    startDate = self->_startDate;
    self->_startDate = v20;

    objc_storeStrong((id *)&self->_sparseDataStart, self->_startDate);
    unint64_t v22 = [(_OSLogIndex *)self->_index endWalltime];
    id v23 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)(v22 / 0x3B9ACA00)];
    endDate = self->_endDate;
    self->_endDate = v23;
  }
}

- (void)_openLocalPersistenceDir
{
  unint64_t options = self->_options;
  if ((~LODWORD(self->_options) & 0xCLL) != 0)
  {
    char v4 = +[_OSLogCollectionReference localDBRefWithError:0];
    oslcr = self->_oslcr;
    self->_oslcr = v4;

    uint64_t v6 = [[_OSLogVersioning alloc] initWithCollection:self->_oslcr error:0];
    version = self->_version;
    self->_version = v6;

    uint64_t v8 = tmpfile();
    if (v8)
    {
      char v9 = v8;
      uint64_t v10 = 2;
      if ((options & 8) == 0) {
        uint64_t v10 = 3;
      }
      if ((options & 4) != 0) {
        uint64_t v11 = 1;
      }
      else {
        uint64_t v11 = v10;
      }
      int v12 = fileno(v8);
      char v21 = 0;
      if (OSLogCaptureInflightBuffersToFile(v12, v11, 0))
      {
        off_t v13 = lseek(v12, 0, 2);
        char v14 = mmap(0, v13, 1, 2, v12, 0);
        if (v14 == (void *)-1) {
          char v21 = 0;
        }
        else {
          char v21 = [[_OSLogChunkMemory alloc] initWithBytes:v14 size:v13 deallocator:&__block_literal_global_872];
        }
      }
      fclose(v9);
      uint64_t v15 = [[_OSLogIndex alloc] initWithCollection:self->_oslcr buildLocalIndex:(options & 4) == 0];
      index = self->_index;
      self->_index = v15;

      if (v21) {
        [(_OSLogIndex *)self->_index insertChunkStore:v21];
      }
      unint64_t v17 = [MEMORY[0x1E4F1C9C8] distantPast];
      startDate = self->_startDate;
      self->_startDate = v17;

      objc_storeStrong((id *)&self->_sparseDataStart, self->_startDate);
      unint64_t v19 = [MEMORY[0x1E4F1C9C8] date];
      endDate = self->_endDate;
      self->_endDate = v19;
    }
  }
}

uint64_t __44__OSLogPersistence__openLocalPersistenceDir__block_invoke(int a1, void *a2, size_t a3)
{
  return munmap(a2, a3);
}

@end