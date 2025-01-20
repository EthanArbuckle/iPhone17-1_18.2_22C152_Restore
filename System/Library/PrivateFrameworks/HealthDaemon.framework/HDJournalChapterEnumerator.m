@interface HDJournalChapterEnumerator
+ (id)_journalChaptersForURL:(int)a3 sorted:(void *)a4 error:;
+ (id)_lightweightDirectoryEnumeratorForURL:(uint64_t)a1;
+ (id)journalChaptersForURL:(id)a3 error:(id *)a4;
+ (id)nextJournalChapterNameForURL:(id)a3;
+ (int64_t)journalChapterCountForURL:(id)a3;
- (BOOL)hasJournalChapters;
- (BOOL)hasMoreJournalChapters;
- (BOOL)loadSortedJournalChaptersWithError:(id *)a3;
- (HDJournalChapterEnumerator)init;
- (HDJournalChapterEnumerator)initWithPath:(id)a3;
- (HDJournalChapterEnumerator)initWithURL:(id)a3;
- (HDJournalChapterEnumeratorTestsDelegate)unitTestDelegate;
- (id)_openJournalChapters:(id)a3 error:(id *)a4;
- (id)nextOpenJournalChapterError:(id *)a3;
- (int64_t)maxAllowedOpenJournalChapterCount;
- (unint64_t)_totalOpenJournalChapterCount;
- (unint64_t)currentJournalChapterIndex;
- (unint64_t)totalJournalChapterCount;
- (void)closeJournalChapters;
- (void)dealloc;
- (void)setMaxAllowedOpenJournalChapterCount:(int64_t)a3;
- (void)setUnitTestDelegate:(id)a3;
@end

@implementation HDJournalChapterEnumerator

- (HDJournalChapterEnumerator)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDJournalChapterEnumerator)initWithURL:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDJournalChapterEnumerator;
  v5 = [(HDJournalChapterEnumerator *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    URL = v5->_URL;
    v5->_URL = (NSURL *)v6;

    v5->_currentIndex = 0;
  }

  return v5;
}

- (HDJournalChapterEnumerator)initWithPath:(id)a3
{
  id v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:a3];
  v5 = [(HDJournalChapterEnumerator *)self initWithURL:v4];

  return v5;
}

- (void)dealloc
{
  [(HDJournalChapterEnumerator *)self closeJournalChapters];
  v3.receiver = self;
  v3.super_class = (Class)HDJournalChapterEnumerator;
  [(HDJournalChapterEnumerator *)&v3 dealloc];
}

- (BOOL)hasJournalChapters
{
  if (self->_hasLoadedPersistedJournalNames) {
    return self->_totalJournalChapterCount > 0;
  }
  objc_super v3 = +[HDJournalChapterEnumerator _lightweightDirectoryEnumeratorForURL:]((uint64_t)HDJournalChapterEnumerator, self->_URL);
  id v4 = [v3 nextObject];
  BOOL v2 = v4 != 0;

  return v2;
}

+ (id)_lightweightDirectoryEnumeratorForURL:(uint64_t)a1
{
  id v2 = a2;
  self;
  objc_super v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v4 = [v3 enumeratorAtURL:v2 includingPropertiesForKeys:MEMORY[0x1E4F1CBF0] options:21 errorHandler:&__block_literal_global_99];

  return v4;
}

- (void)closeJournalChapters
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  objc_super v3 = *MEMORY[0x1E4F29F18];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v17 = self;
    _os_log_debug_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_DEBUG, "%@ closing all open journal chapters", buf, 0xCu);
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = self->_openJournalChapters;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v8++), "close", (void)v11);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  openJournalChapters = self->_openJournalChapters;
  self->_openJournalChapters = 0;

  remainingJournalChapters = self->_remainingJournalChapters;
  self->_remainingJournalChapters = 0;

  self->_hasLoadedPersistedJournalNames = 0;
  self->_totalJournalChapterCount = 0;
}

- (BOOL)loadSortedJournalChaptersWithError:(id *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = +[HDJournalChapterEnumerator _journalChaptersForURL:sorted:error:]((uint64_t)HDJournalChapterEnumerator, self->_URL, 1, a3);
  if (v4)
  {
    objc_storeStrong((id *)&self->_remainingJournalChapters, v4);
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    uint64_t v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    openJournalChapters = self->_openJournalChapters;
    self->_openJournalChapters = v5;

    self->_hasLoadedPersistedJournalNames = 1;
    self->_totalJournalChapterCount = [v4 count];
    self->_currentIndex = 0;
  }
  _HKInitializeLogging();
  uint64_t v7 = (void *)*MEMORY[0x1E4F29F18];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEBUG))
  {
    URL = self->_URL;
    v10 = v7;
    long long v11 = [(NSURL *)URL path];
    int v12 = 138413058;
    long long v13 = self;
    __int16 v14 = 2112;
    v15 = v11;
    __int16 v16 = 2048;
    uint64_t v17 = [v4 count];
    __int16 v18 = 1024;
    BOOL v19 = v4 != 0;
    _os_log_debug_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_DEBUG, "%@ for path:%@ loaded (%lu) journal chapter names with success:%{BOOL}d", (uint8_t *)&v12, 0x26u);
  }
  return v4 != 0;
}

+ (id)_journalChaptersForURL:(int)a3 sorted:(void *)a4 error:
{
  v40[3] = *MEMORY[0x1E4F143B8];
  id v25 = a2;
  self;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v6 = *MEMORY[0x1E4F1C628];
  uint64_t v7 = *MEMORY[0x1E4F1C5F8];
  v40[0] = *MEMORY[0x1E4F1C628];
  v40[1] = v7;
  v40[2] = *MEMORY[0x1E4F1C530];
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:3];
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__93;
  v37 = __Block_byref_object_dispose__93;
  id v38 = 0;
  uint64_t v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __66__HDJournalChapterEnumerator__journalChaptersForURL_sorted_error___block_invoke;
  v32[3] = &unk_1E6300288;
  v32[4] = &v33;
  objc_super v9 = [v8 enumeratorAtURL:v25 includingPropertiesForKeys:v26 options:5 errorHandler:v32];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v39 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(v10);
        }
        __int16 v14 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v27 = 0;
        char v15 = [v14 getResourceValue:&v27 forKey:v6 error:a4];
        id v16 = v27;
        uint64_t v17 = v16;
        if ((v15 & 1) == 0)
        {

          id v21 = 0;
          goto LABEL_23;
        }
        if ([v16 BOOLValue]) {
          __int16 v18 = [[HDDatabaseJournalDatabase alloc] initWithURL:v14];
        }
        else {
          __int16 v18 = [[HDDatabaseLegacyJournalFile alloc] initWithURL:v14];
        }
        [v5 addObject:v18];
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v39 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  if (a3) {
    [v5 sortUsingComparator:&__block_literal_global_309_0];
  }
  id v19 = (id)v34[5];
  uint64_t v20 = v19;
  if (v19)
  {
    if (a4) {
      *a4 = v19;
    }
    else {
      _HKLogDroppedError();
    }
  }

  if (v34[5]) {
    v22 = 0;
  }
  else {
    v22 = v5;
  }
  id v21 = v22;
LABEL_23:

  _Block_object_dispose(&v33, 8);

  return v21;
}

- (id)nextOpenJournalChapterError:(id *)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (!self->_hasLoadedPersistedJournalNames)
  {
    id v5 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_FAULT, "_hasLoadedPersistedJournalNames", buf, 2u);
    }
    goto LABEL_7;
  }
  if (self->_currentIndex == self->_totalJournalChapterCount
    || ![(NSMutableArray *)self->_remainingJournalChapters count]
    && ![(NSMutableArray *)self->_openJournalChapters count])
  {
    _HKInitializeLogging();
    id v4 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEFAULT, "Finished processing journal chapters", buf, 2u);
    }
LABEL_7:
    uint64_t v6 = 0;
    goto LABEL_36;
  }
  uint64_t v8 = [(NSMutableArray *)self->_openJournalChapters count];
  objc_super v9 = (os_log_t *)MEMORY[0x1E4F29F18];
  if (v8)
  {
    id v10 = [(NSMutableArray *)self->_openJournalChapters firstObject];
    [(NSMutableArray *)self->_openJournalChapters removeObjectAtIndex:0];
    [v10 close];
    _HKInitializeLogging();
    os_log_t v11 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEBUG))
    {
      openJournalChapters = self->_openJournalChapters;
      long long v30 = v11;
      *(_DWORD *)buf = 138412546;
      uint64_t v33 = self;
      __int16 v34 = 2048;
      uint64_t v35 = [(NSMutableArray *)openJournalChapters count];
      _os_log_debug_impl(&dword_1BCB7D000, v30, OS_LOG_TYPE_DEBUG, "%@ Closing journal chapter at index 0. Current open count is %ld", buf, 0x16u);
    }
  }
  if (!self->_cachedError)
  {
    id v31 = 0;
    if ([(NSMutableArray *)self->_remainingJournalChapters count]
      && (int64_t v12 = [(HDJournalChapterEnumerator *)self maxAllowedOpenJournalChapterCount], v13 = v12 - [(NSMutableArray *)self->_openJournalChapters count], v13 >= 1))
    {
      __int16 v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v13];
      uint64_t v15 = v13 + 1;
      do
      {
        if (![(NSMutableArray *)self->_remainingJournalChapters count]) {
          break;
        }
        id v16 = [(NSMutableArray *)self->_remainingJournalChapters firstObject];
        [v14 addObject:v16];

        [(NSMutableArray *)self->_remainingJournalChapters removeObjectAtIndex:0];
        --v15;
      }
      while (v15 > 1);
      uint64_t v17 = [(HDJournalChapterEnumerator *)self unitTestDelegate];

      if (v17)
      {
        __int16 v18 = [(HDJournalChapterEnumerator *)self unitTestDelegate];
        id v19 = objc_msgSend(v18, "_unitTest_openJournalChapters:error:", v14, &v31);
      }
      else
      {
        id v19 = [(HDJournalChapterEnumerator *)self _openJournalChapters:v14 error:&v31];
      }
      uint64_t v21 = [v19 count];
      uint64_t v22 = [v14 count];
      [(NSMutableArray *)self->_openJournalChapters addObjectsFromArray:v19];

      id v23 = v31;
      uint64_t v20 = v23;
      if (v21 != v22)
      {
        v24 = (NSError *)[v23 copy];
        cachedError = self->_cachedError;
        self->_cachedError = v24;
      }
    }
    else
    {
      uint64_t v20 = 0;
    }
  }
  uint64_t v6 = [(NSMutableArray *)self->_openJournalChapters firstObject];
  if (v6)
  {
    ++self->_currentIndex;
  }
  else
  {
    v26 = self->_cachedError;
    if (v26)
    {
      if (a3) {
        *a3 = v26;
      }
      else {
        _HKLogDroppedError();
      }
    }

    [(HDJournalChapterEnumerator *)self closeJournalChapters];
  }
  _HKInitializeLogging();
  id v27 = *v9;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v33 = self;
    __int16 v34 = 2112;
    uint64_t v35 = (uint64_t)v6;
    _os_log_debug_impl(&dword_1BCB7D000, v27, OS_LOG_TYPE_DEBUG, "%@ next journal chapter is %@", buf, 0x16u);
  }
LABEL_36:

  return v6;
}

- (BOOL)hasMoreJournalChapters
{
  if (self->_hasLoadedPersistedJournalNames)
  {
    LOBYTE(self) = self->_currentIndex < self->_totalJournalChapterCount;
  }
  else
  {
    id v2 = *MEMORY[0x1E4F29F18];
    LODWORD(self) = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_FAULT);
    if (self)
    {
      *(_WORD *)id v4 = 0;
      _os_log_fault_impl(&dword_1BCB7D000, v2, OS_LOG_TYPE_FAULT, "_hasLoadedPersistedJournalNames", v4, 2u);
      LOBYTE(self) = 0;
    }
  }
  return (char)self;
}

- (unint64_t)totalJournalChapterCount
{
  return self->_totalJournalChapterCount;
}

- (unint64_t)currentJournalChapterIndex
{
  return self->_currentIndex;
}

- (id)_openJournalChapters:(id)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  _HKInitializeLogging();
  uint64_t v7 = (os_log_t *)MEMORY[0x1E4F29F18];
  uint64_t v8 = (void *)*MEMORY[0x1E4F29F18];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEBUG))
  {
    id v19 = v8;
    *(_DWORD *)buf = 138412546;
    long long v28 = self;
    __int16 v29 = 2048;
    uint64_t v30 = [v6 count];
    _os_log_debug_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_DEBUG, "%@: Will open %ld journal chapters", buf, 0x16u);
  }
  if ([v6 count])
  {
    objc_super v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v23;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if (!objc_msgSend(v15, "openForReadingWithError:", a4, (void)v22))
          {

            id v17 = 0;
            goto LABEL_16;
          }
          [v9 addObject:v15];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    _HKInitializeLogging();
    os_log_t v16 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v20 = v16;
      uint64_t v21 = [v9 count];
      *(_DWORD *)buf = 138412546;
      long long v28 = self;
      __int16 v29 = 2048;
      uint64_t v30 = v21;
      _os_log_debug_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_DEBUG, "%@: Did open %ld journal chapters", buf, 0x16u);
    }
    id v17 = v9;
LABEL_16:
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", a4, 3, @"Trying to open journal chapters without providing any to open");
    id v17 = 0;
  }

  return v17;
}

+ (id)journalChaptersForURL:(id)a3 error:(id *)a4
{
  id v4 = +[HDJournalChapterEnumerator _journalChaptersForURL:sorted:error:]((uint64_t)a1, a3, 0, a4);
  id v5 = (void *)[v4 copy];

  return v5;
}

+ (id)nextJournalChapterNameForURL:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[HDJournalChapterEnumerator _lightweightDirectoryEnumeratorForURL:]((uint64_t)a1, v4);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v28 count:16];
  if (!v6)
  {
    uint64_t v17 = 0;
LABEL_24:
    os_log_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"%05ld.log", v17);
    goto LABEL_25;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v22;
  uint64_t v9 = 0xFFFFFFFF80000000;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v22 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v11 = [*(id *)(*((void *)&v21 + 1) + 8 * i) URLByDeletingPathExtension];
      uint64_t v12 = [v11 lastPathComponent];

      if ([v12 length])
      {
        uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F28FE8]) initWithString:v12];
        *(void *)buf = 0;
        if ([v13 scanInteger:buf])
        {
          if (*(uint64_t *)buf > v9 || v9 == 0xFFFFFFFF80000000) {
            uint64_t v9 = *(void *)buf;
          }
        }
      }
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v28 count:16];
  }
  while (v7);
  if (v9 < 99999)
  {
    if (v9 >= 0) {
      uint64_t v17 = v9 + 1;
    }
    else {
      uint64_t v17 = 0;
    }
    goto LABEL_24;
  }
  _HKInitializeLogging();
  uint64_t v15 = (void *)*MEMORY[0x1E4F29F18];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_FAULT))
  {
    id v19 = v15;
    uint64_t v20 = [v4 path];
    *(_DWORD *)buf = 134218242;
    *(void *)&uint8_t buf[4] = v9;
    __int16 v26 = 2114;
    id v27 = v20;
    _os_log_fault_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_FAULT, "Encountered journal index %ld in %{public}@; dropping changes",
      buf,
      0x16u);
  }
  os_log_t v16 = 0;
LABEL_25:

  return v16;
}

+ (int64_t)journalChapterCountForURL:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  objc_super v3 = +[HDJournalChapterEnumerator _lightweightDirectoryEnumeratorForURL:]((uint64_t)a1, a3);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int64_t v6 = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = v5;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        --v8;
      }
      while (v8);
      v6 += v5;
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

uint64_t __68__HDJournalChapterEnumerator__lightweightDirectoryEnumeratorForURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  _HKInitializeLogging();
  int64_t v6 = *MEMORY[0x1E4F29F18];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
  {
    int v8 = 138412546;
    id v9 = v4;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "Error enumerating journal chapter /'%@/': %@", (uint8_t *)&v8, 0x16u);
  }

  return 0;
}

uint64_t __66__HDJournalChapterEnumerator__journalChaptersForURL_sorted_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = NSString;
  id v6 = a3;
  uint64_t v7 = [v5 stringWithFormat:@"Error enumerating journal chapter /'%@/'", a2];
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:underlyingError:", 102, v7, v6);

  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  __int16 v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  return 0;
}

uint64_t __66__HDJournalChapterEnumerator__journalChaptersForURL_sorted_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 name];
  id v6 = [v4 name];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (unint64_t)_totalOpenJournalChapterCount
{
  return [(NSMutableArray *)self->_openJournalChapters count];
}

- (int64_t)maxAllowedOpenJournalChapterCount
{
  if (self->_maxAllowedOpenJournalChapterCount) {
    return self->_maxAllowedOpenJournalChapterCount;
  }
  else {
    return 50;
  }
}

- (void)setMaxAllowedOpenJournalChapterCount:(int64_t)a3
{
  self->_maxAllowedOpenJournalChapterCount = a3;
}

- (HDJournalChapterEnumeratorTestsDelegate)unitTestDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_unitTestDelegate);

  return (HDJournalChapterEnumeratorTestsDelegate *)WeakRetained;
}

- (void)setUnitTestDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_unitTestDelegate);
  objc_storeStrong((id *)&self->_openJournalChapters, 0);
  objc_storeStrong((id *)&self->_remainingJournalChapters, 0);
  objc_storeStrong((id *)&self->_cachedError, 0);

  objc_storeStrong((id *)&self->_URL, 0);
}

@end