@interface FPDDomainIndexerState
- (BOOL)droppedIndex;
- (BOOL)needsAuth;
- (BOOL)needsIndexing;
- (FPDDomainIndexerState)initWithSupportURL:(id)a3;
- (NSDate)lastDropDate;
- (unint64_t)lastDropReason;
- (unint64_t)timesIndexWasDropSinceLastStart;
- (void)dumpStateTo:(id)a3;
- (void)loadPersistedState;
- (void)recordIndexDropReason:(unint64_t)a3;
- (void)setBoolValue:(BOOL)a3 atURL:(id)a4;
- (void)setDroppedIndex:(BOOL)a3;
- (void)setLastDropDate:(id)a3;
- (void)setLastDropReason:(unint64_t)a3;
- (void)setNeedsAuth:(BOOL)a3;
- (void)setNeedsIndexing:(BOOL)a3;
- (void)setTimesIndexWasDropSinceLastStart:(unint64_t)a3;
- (void)unarchiveLastDropData:(id)a3;
@end

@implementation FPDDomainIndexerState

- (BOOL)droppedIndex
{
  return self->_droppedIndex;
}

- (BOOL)needsAuth
{
  return self->_needsAuth;
}

- (BOOL)needsIndexing
{
  return self->_needsIndexing;
}

- (void)setNeedsIndexing:(BOOL)a3
{
  if (self->_needsIndexing != a3)
  {
    -[FPDDomainIndexerState setBoolValue:atURL:](self, "setBoolValue:atURL:");
    self->_needsIndexing = a3;
  }
}

- (void)setBoolValue:(BOOL)a3 atURL:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  v7 = v6;
  if (v4)
  {
    v8 = [v5 URLByDeletingLastPathComponent];
    id v15 = 0;
    [v7 createDirectoryAtURL:v8 withIntermediateDirectories:1 attributes:0 error:&v15];
    id v9 = v15;

    v10 = [MEMORY[0x1E4F1C9B8] data];
    id v14 = v9;
    char v11 = [v10 writeToURL:v5 options:0 error:&v14];
    id v12 = v14;

    if ((v11 & 1) == 0)
    {
      v13 = fp_current_or_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[FPDDomainIndexerState setBoolValue:atURL:](v12);
      }
    }
  }
  else
  {
    [v6 removeItemAtURL:v5 error:0];
    id v12 = 0;
  }
}

- (FPDDomainIndexerState)initWithSupportURL:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"FPDDomainIndexerState.m" lineNumber:36 description:@"Tried to initialize FPDDomainIndexerState with nil supportURL"];
  }
  if (([v5 isFileURL] & 1) == 0)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"FPDDomainIndexerState.m", 37, @"Tried to initialize FPDDomainIndexerState with a non file URL, which is not supported" object file lineNumber description];
  }
  v18.receiver = self;
  v18.super_class = (Class)FPDDomainIndexerState;
  v6 = [(FPDDomainIndexerState *)&v18 init];
  if (v6)
  {
    uint64_t v7 = [v5 URLByAppendingPathComponent:@"needs-index" isDirectory:0];
    needsIndexingURL = v6->_needsIndexingURL;
    v6->_needsIndexingURL = (NSURL *)v7;

    uint64_t v9 = [v5 URLByAppendingPathComponent:@"dropped-index" isDirectory:0];
    droppedIndexURL = v6->_droppedIndexURL;
    v6->_droppedIndexURL = (NSURL *)v9;

    uint64_t v11 = [v5 URLByAppendingPathComponent:@"needs-auth" isDirectory:0];
    needsAuthURL = v6->_needsAuthURL;
    v6->_needsAuthURL = (NSURL *)v11;

    v6->_timesIndexWasDropSinceLastStart = 0;
    uint64_t v13 = [v5 URLByAppendingPathComponent:@"last-drop-data" isDirectory:0];
    lastDropDataURL = v6->_lastDropDataURL;
    v6->_lastDropDataURL = (NSURL *)v13;
  }
  return v6;
}

- (void)dumpStateTo:(id)a3
{
  id v13 = a3;
  if ([(FPDDomainIndexerState *)self needsAuth]) {
    BOOL v4 = @"yes";
  }
  else {
    BOOL v4 = @"no";
  }
  [v13 write:@"      needs-auth:     %@\n", v4];
  if ([(FPDDomainIndexerState *)self needsIndexing]) {
    id v5 = @"yes";
  }
  else {
    id v5 = @"no";
  }
  [v13 write:@"      needs-indexing: %@\n", v5];
  if ([(FPDDomainIndexerState *)self droppedIndex]
    || ([(FPDDomainIndexerState *)self lastDropDate],
        v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    [v13 write:@"      + drop info:\n"];
    objc_msgSend(v13, "write:", @"         drops-since-start: %lu\n", -[FPDDomainIndexerState timesIndexWasDropSinceLastStart](self, "timesIndexWasDropSinceLastStart"));
    if ([(FPDDomainIndexerState *)self droppedIndex]) {
      uint64_t v7 = @"yes";
    }
    else {
      uint64_t v7 = @"no";
    }
    [v13 write:@"         index-is-dropped:  %@\n", v7];
    v8 = [(FPDDomainIndexerState *)self lastDropDate];
    uint64_t v9 = [v8 description];
    v10 = (void *)v9;
    uint64_t v11 = @"na";
    if (v9) {
      uint64_t v11 = (__CFString *)v9;
    }
    [v13 write:@"         last-drop-date:    %@\n", v11];

    [(FPDDomainIndexerState *)self lastDropReason];
    id v12 = FPHumanReadableDropReason();
    [v13 write:@"         last-drop-reason:  %@\n", v12];
  }
}

- (void)unarchiveLastDropData:(id)a3
{
  if (a3)
  {
    BOOL v4 = (void *)MEMORY[0x1E4F1CAD0];
    id v5 = a3;
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_msgSend(v4, "setWithObjects:", v6, v7, v8, objc_opt_class(), 0);
    id v16 = 0;
    v10 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v9 fromData:v5 error:&v16];

    id v11 = v16;
    if (v10)
    {
      id v12 = NSStringFromSelector(sel_lastDropDate);
      id v13 = [v10 objectForKeyedSubscript:v12];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_storeStrong((id *)&self->_lastDropDate, v13);
      }
      id v14 = NSStringFromSelector(sel_lastDropReason);
      id v15 = [v10 objectForKeyedSubscript:v14];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        self->_lastDropReason = [v15 unsignedIntegerValue];
      }
    }
    else
    {
      id v13 = fp_current_or_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[FPDDomainIndexerState unarchiveLastDropData:](v11);
      }
    }
  }
}

- (void)loadPersistedState
{
  v3 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:self->_needsIndexingURL];
  self->_needsIndexing = v3 != 0;

  BOOL v4 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:self->_needsIndexingURL];
  self->_droppedIndex = v4 != 0;

  id v5 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:self->_needsAuthURL];
  self->_needsAuth = v5 != 0;

  id v6 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:self->_lastDropDataURL];
  [(FPDDomainIndexerState *)self unarchiveLastDropData:v6];
}

- (void)recordIndexDropReason:(unint64_t)a3
{
  v19[2] = *MEMORY[0x1E4F143B8];
  [(FPDDomainIndexerState *)self setTimesIndexWasDropSinceLastStart:[(FPDDomainIndexerState *)self timesIndexWasDropSinceLastStart] + 1];
  [(FPDDomainIndexerState *)self setLastDropReason:a3];
  id v5 = [MEMORY[0x1E4F1C9C8] now];
  [(FPDDomainIndexerState *)self setLastDropDate:v5];

  id v6 = NSStringFromSelector(sel_lastDropReason);
  v18[0] = v6;
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[FPDDomainIndexerState lastDropReason](self, "lastDropReason"));
  v19[0] = v7;
  uint64_t v8 = NSStringFromSelector(sel_lastDropDate);
  v18[1] = v8;
  uint64_t v9 = [(FPDDomainIndexerState *)self lastDropDate];
  v19[1] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];

  id v17 = 0;
  id v11 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v10 requiringSecureCoding:0 error:&v17];
  id v12 = v17;
  lastDropDataURL = self->_lastDropDataURL;
  id v16 = v12;
  LOBYTE(v8) = [v11 writeToURL:lastDropDataURL options:0 error:&v16];
  id v14 = v16;

  if ((v8 & 1) == 0)
  {
    id v15 = fp_current_or_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[FPDDomainIndexerState recordIndexDropReason:](v14);
    }
  }
}

- (void)setDroppedIndex:(BOOL)a3
{
  if (self->_droppedIndex != a3)
  {
    -[FPDDomainIndexerState setBoolValue:atURL:](self, "setBoolValue:atURL:");
    self->_droppedIndex = a3;
  }
}

- (void)setNeedsAuth:(BOOL)a3
{
  if (self->_needsAuth != a3)
  {
    -[FPDDomainIndexerState setBoolValue:atURL:](self, "setBoolValue:atURL:");
    self->_needsAuth = a3;
  }
}

- (unint64_t)timesIndexWasDropSinceLastStart
{
  return self->_timesIndexWasDropSinceLastStart;
}

- (void)setTimesIndexWasDropSinceLastStart:(unint64_t)a3
{
  self->_timesIndexWasDropSinceLastStart = a3;
}

- (unint64_t)lastDropReason
{
  return self->_lastDropReason;
}

- (void)setLastDropReason:(unint64_t)a3
{
  self->_lastDropReason = a3;
}

- (NSDate)lastDropDate
{
  return self->_lastDropDate;
}

- (void)setLastDropDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastDropDate, 0);
  objc_storeStrong((id *)&self->_lastDropDataURL, 0);
  objc_storeStrong((id *)&self->_droppedIndexURL, 0);
  objc_storeStrong((id *)&self->_needsAuthURL, 0);
  objc_storeStrong((id *)&self->_needsIndexingURL, 0);
}

- (void)unarchiveLastDropData:(void *)a1 .cold.1(void *a1)
{
  v1 = objc_msgSend(a1, "fp_prettyDescription");
  OUTLINED_FUNCTION_0_0(&dword_1D744C000, v2, v3, "[ERROR] [Indexer] Can't load index drop reason, error: %@", v4, v5, v6, v7, 2u);
}

- (void)recordIndexDropReason:(void *)a1 .cold.1(void *a1)
{
  v1 = objc_msgSend(a1, "fp_prettyDescription");
  OUTLINED_FUNCTION_0_0(&dword_1D744C000, v2, v3, "[ERROR] [Indexer] Can't persist index drop reason, error: %@", v4, v5, v6, v7, 2u);
}

- (void)setBoolValue:(void *)a1 atURL:.cold.1(void *a1)
{
  v1 = objc_msgSend(a1, "fp_prettyDescription");
  OUTLINED_FUNCTION_0_0(&dword_1D744C000, v2, v3, "[ERROR] [Indexer] Can't persist BOOL value, error: %@", v4, v5, v6, v7, 2u);
}

@end