@interface _CNFavoritesLogger
- (OS_os_log)log;
- (OS_os_log)summaryLog;
- (_CNFavoritesLogger)init;
- (void)_simulateCrashReportWithMessage:(id)a3;
- (void)failedToConvertFavoritesToPropertyList:(id)a3;
- (void)failedToReadFavoritesFromPath:(id)a3 error:(id)a4 simulateCrashReport:(BOOL)a5;
- (void)failedToReadRemoteFavorites:(id)a3;
- (void)failedToVerifyFavorites:(id)a3 withPropertyListFavorites:(id)a4 error:(id)a5;
- (void)failedToVerifyWrittenFavoritesExistsAtPath:(id)a3;
- (void)failedToWriteFavoritesToPath:(id)a3 error:(id)a4 simulateCrashReport:(BOOL)a5;
- (void)failedToWriteRemoteFavorites:(id)a3;
- (void)finishedReadingFavoritesFromPath:(id)a3 entriesCount:(unint64_t)a4;
- (void)finishedReadingRemoteFavorites;
- (void)finishedWritingFavoritesToPath:(id)a3 entriesCount:(unint64_t)a4;
- (void)finishedWritingRemoteFavorites;
- (void)readingFavorites:(id)a3;
- (void)rematchingFavorites:(id)a3;
- (void)reportFavoritesAccessedBeforeFirstUnlock;
- (void)writingFavorites:(id)a3;
@end

@implementation _CNFavoritesLogger

- (void)readingFavorites:(id)a3
{
  id v3 = a3;
  os_activity_t v4 = _os_activity_create(&dword_1909E3000, "ReadingFavorites", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __39___CNFavoritesLogger_readingFavorites___block_invoke;
  aBlock[3] = &unk_1E56B4530;
  os_activity_t v13 = v4;
  v5 = v4;
  v6 = _Block_copy(aBlock);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39___CNFavoritesLogger_readingFavorites___block_invoke_2;
  block[3] = &unk_1E56B4828;
  id v10 = v3;
  id v11 = v6;
  id v7 = v6;
  id v8 = v3;
  os_activity_apply(v5, block);
}

- (void)failedToReadFavoritesFromPath:(id)a3 error:(id)a4 simulateCrashReport:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (v5)
  {
    id v10 = [NSString stringWithFormat:@"Error reading favorites file. Add a favorite as workaround. Please open a radar to PEP Contacts (New Bugs).\n\n%@", v9];
    [(_CNFavoritesLogger *)self _simulateCrashReportWithMessage:v10];
  }
  else
  {
    id v11 = [(_CNFavoritesLogger *)self log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[_CNFavoritesLogger failedToReadFavoritesFromPath:error:simulateCrashReport:]();
    }
  }
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)failedToReadFavoritesFromPath:error:simulateCrashReport:.cold.1()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_3_0(&dword_1909E3000, v0, v1, "Failed to read favorites file %{public}@, error: %@");
}

- (_CNFavoritesLogger)init
{
  v7.receiver = self;
  v7.super_class = (Class)_CNFavoritesLogger;
  v2 = [(_CNFavoritesLogger *)&v7 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.contacts", "Favorites");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    BOOL v5 = v2;
  }

  return v2;
}

- (void)writingFavorites:(id)a3
{
  id v3 = a3;
  os_activity_t v4 = _os_activity_create(&dword_1909E3000, "WritingFavorites", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __39___CNFavoritesLogger_writingFavorites___block_invoke;
  aBlock[3] = &unk_1E56B4530;
  os_activity_t v13 = v4;
  BOOL v5 = v4;
  v6 = _Block_copy(aBlock);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39___CNFavoritesLogger_writingFavorites___block_invoke_2;
  block[3] = &unk_1E56B4828;
  id v10 = v3;
  id v11 = v6;
  id v7 = v6;
  id v8 = v3;
  os_activity_apply(v5, block);
}

- (void)rematchingFavorites:(id)a3
{
  id v3 = a3;
  os_activity_t v4 = _os_activity_create(&dword_1909E3000, "rematchingFavorites", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __42___CNFavoritesLogger_rematchingFavorites___block_invoke;
  aBlock[3] = &unk_1E56B4530;
  os_activity_t v13 = v4;
  BOOL v5 = v4;
  v6 = _Block_copy(aBlock);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42___CNFavoritesLogger_rematchingFavorites___block_invoke_2;
  block[3] = &unk_1E56B4828;
  id v10 = v3;
  id v11 = v6;
  id v7 = v6;
  id v8 = v3;
  os_activity_apply(v5, block);
}

- (void)finishedReadingRemoteFavorites
{
  v2 = [(_CNFavoritesLogger *)self log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_1909E3000, v2, OS_LOG_TYPE_DEFAULT, "Read favorites with contactsd", v3, 2u);
  }
}

- (void)finishedReadingFavoritesFromPath:(id)a3 entriesCount:(unint64_t)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(_CNFavoritesLogger *)self log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543618;
    id v9 = v6;
    __int16 v10 = 2048;
    unint64_t v11 = a4;
    _os_log_impl(&dword_1909E3000, v7, OS_LOG_TYPE_DEFAULT, "Read favorites file %{public}@, count = %ld", (uint8_t *)&v8, 0x16u);
  }
}

- (void)finishedWritingRemoteFavorites
{
  v2 = [(_CNFavoritesLogger *)self log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_1909E3000, v2, OS_LOG_TYPE_DEFAULT, "Saved favorites with contactsd", v3, 2u);
  }
}

- (void)finishedWritingFavoritesToPath:(id)a3 entriesCount:(unint64_t)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(_CNFavoritesLogger *)self log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543618;
    id v9 = v6;
    __int16 v10 = 2048;
    unint64_t v11 = a4;
    _os_log_impl(&dword_1909E3000, v7, OS_LOG_TYPE_DEFAULT, "Saved favorites to file %{public}@, count = %ld", (uint8_t *)&v8, 0x16u);
  }
}

- (void)failedToReadRemoteFavorites:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_CNFavoritesLogger *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[_CNFavoritesLogger failedToReadRemoteFavorites:]();
  }
}

- (void)failedToConvertFavoritesToPropertyList:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_CNFavoritesLogger *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[_CNFavoritesLogger failedToConvertFavoritesToPropertyList:]();
  }
}

- (void)failedToVerifyFavorites:(id)a3 withPropertyListFavorites:(id)a4 error:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = [(_CNFavoritesLogger *)self log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    id v14 = v8;
    __int16 v15 = 2112;
    id v16 = v9;
    __int16 v17 = 2112;
    id v18 = v10;
    _os_log_error_impl(&dword_1909E3000, v11, OS_LOG_TYPE_ERROR, "Error converting favorites entries:\n%@\nconvertedEntries:\n%@,\n%@", buf, 0x20u);
  }

  uint64_t v12 = [NSString stringWithFormat:@"Error converting favorites entries to property list, not converted correctly. Please open a radar to PEP Contacts (New Bugs).\n\n%@", v10];
  [(_CNFavoritesLogger *)self _simulateCrashReportWithMessage:v12];
}

- (void)failedToWriteRemoteFavorites:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_CNFavoritesLogger *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[_CNFavoritesLogger failedToWriteRemoteFavorites:]();
  }
}

- (void)failedToVerifyWrittenFavoritesExistsAtPath:(id)a3
{
  id v4 = [NSString stringWithFormat:@"Error saving favorites file\x10. File does not exist after saving. Please open a radar to PEP Contacts (New Bugs).\n\nexpected file: %@", a3];
  [(_CNFavoritesLogger *)self _simulateCrashReportWithMessage:v4];
}

- (void)failedToWriteFavoritesToPath:(id)a3 error:(id)a4 simulateCrashReport:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (v5)
  {
    id v10 = [NSString stringWithFormat:@"Error saving favorites file. Please open a radar to PEP Contacts (New Bugs).\n\n%@", v9];
    [(_CNFavoritesLogger *)self _simulateCrashReportWithMessage:v10];
  }
  else
  {
    unint64_t v11 = [(_CNFavoritesLogger *)self log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[_CNFavoritesLogger failedToWriteFavoritesToPath:error:simulateCrashReport:]();
    }
  }
}

- (void)_simulateCrashReportWithMessage:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_CNFavoritesLogger *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[_CNFavoritesLogger _simulateCrashReportWithMessage:]();
  }

  ABLogSimulateCrashReport();
  ABLogDisplayInternalAlert();
}

- (void)reportFavoritesAccessedBeforeFirstUnlock
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_1909E3000, v0, OS_LOG_TYPE_FAULT, "%@ (or something it links) is using contacts favorites before device first unlock.", v1, 0xCu);
}

- (OS_os_log)summaryLog
{
  return self->_summaryLog;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summaryLog, 0);

  objc_storeStrong((id *)&self->_log, 0);
}

- (void)failedToReadRemoteFavorites:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1909E3000, v0, v1, "Failed to read favorites with contactsd, error: %@", v2, v3, v4, v5, v6);
}

- (void)failedToConvertFavoritesToPropertyList:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1909E3000, v0, v1, "Failed to convert favorites entries to property list, cannot save favorites, error: %@", v2, v3, v4, v5, v6);
}

- (void)failedToWriteRemoteFavorites:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1909E3000, v0, v1, "Failed to save favorites with contactsd, error: %@", v2, v3, v4, v5, v6);
}

- (void)failedToWriteFavoritesToPath:error:simulateCrashReport:.cold.1()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_3_0(&dword_1909E3000, v0, v1, "Failed to save favorites file %{public}@, error: %@");
}

- (void)_simulateCrashReportWithMessage:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1909E3000, v0, v1, "%{public}@", v2, v3, v4, v5, v6);
}

@end