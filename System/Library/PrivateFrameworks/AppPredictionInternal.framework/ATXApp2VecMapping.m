@interface ATXApp2VecMapping
- (ATXApp2VecMapping)initWithPath:(id)a3;
- (BOOL)getVectorForBundleId:(id)a3 into:(float *)a4;
- (BOOL)getVectorForBundleIdWithGenreBackup:(id)a3 into:(float *)a4;
- (unint64_t)appCount;
- (unint64_t)vectorLength;
- (void)dealloc;
@end

@implementation ATXApp2VecMapping

- (ATXApp2VecMapping)initWithPath:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"ATXApp2VecMapping.m", 54, @"Invalid parameter not satisfying: %@", @"path" object file lineNumber description];
  }
  v20.receiver = self;
  v20.super_class = (Class)ATXApp2VecMapping;
  v6 = [(ATXApp2VecMapping *)&v20 init];
  if (v6)
  {
    id v19 = 0;
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v5 options:1 error:&v19];
    id v8 = v19;
    data = v6->_data;
    v6->_data = (NSData *)v7;

    v10 = v6->_data;
    if (!v10)
    {
      v11 = __atxlog_handle_default();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[ATXApp2VecMapping initWithPath:]();
      }
      goto LABEL_18;
    }
    if ([(NSData *)v10 length] <= 0xF)
    {
      v11 = __atxlog_handle_default();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
LABEL_18:

        v16 = 0;
        goto LABEL_19;
      }
LABEL_7:
      -[ATXApp2VecMapping initWithPath:]();
      goto LABEL_18;
    }
    v6->_hdr = *(header_s *)[(NSData *)v6->_data bytes];
    uint64_t v12 = [(NSData *)v6->_data bytes];
    unint64_t v13 = v12 + 16 + 2 * v6->_hdr.length * v6->_hdr.nvectors;
    v6->_matrix = (const unsigned __int16 *)(v12 + 16);
    v6->_endOfMatrix = (const unsigned __int16 *)v13;
    uint64_t v14 = [(NSData *)v6->_data bytes];
    if (v13 >= v14 + [(NSData *)v6->_data length])
    {
      v11 = __atxlog_handle_default();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        goto LABEL_18;
      }
      goto LABEL_7;
    }
    uint64_t v15 = CFBurstTrieCreateFromMapBytes();
    v6->_idxForBundleId = (_CFBurstTrie *)v15;
    if (!v15)
    {
      v11 = __atxlog_handle_default();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[ATXApp2VecMapping initWithPath:]();
      }
      goto LABEL_18;
    }
  }
  v16 = v6;
LABEL_19:

  return v16;
}

- (void)dealloc
{
  if (self->_idxForBundleId)
  {
    CFBurstTrieRelease();
    self->_idxForBundleId = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)ATXApp2VecMapping;
  [(ATXApp2VecMapping *)&v3 dealloc];
}

- (unint64_t)vectorLength
{
  return self->_hdr.length;
}

- (unint64_t)appCount
{
  return self->_hdr.nvectors;
}

- (BOOL)getVectorForBundleId:(id)a3 into:(float *)a4
{
  id v7 = a3;
  id v8 = v7;
  if (a4)
  {
    if (v7) {
      goto LABEL_3;
    }
LABEL_12:
    v11 = __atxlog_handle_default();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[ATXApp2VecMapping getVectorForBundleId:into:](v11);
    }
    goto LABEL_14;
  }
  v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"ATXApp2VecMapping.m", 111, @"Invalid parameter not satisfying: %@", @"buffer" object file lineNumber description];

  if (!v8) {
    goto LABEL_12;
  }
LABEL_3:
  [v8 length];
  if (!CFBurstTrieContains())
  {
LABEL_15:
    BOOL v15 = 0;
    goto LABEL_16;
  }
  uint64_t length = self->_hdr.length;
  v10 = &self->_matrix[-(int)length];
  if (&v10[length] > self->_endOfMatrix)
  {
    v11 = __atxlog_handle_default();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ATXApp2VecMapping getVectorForBundleId:into:](v11);
    }
LABEL_14:

    goto LABEL_15;
  }
  if (length)
  {
    float base = self->_hdr.fixinfo.base;
    float incr = self->_hdr.fixinfo.incr;
    do
    {
      unsigned int v14 = *v10++;
      *a4++ = base + (float)((float)v14 * incr);
      --length;
    }
    while (length);
  }
  BOOL v15 = 1;
LABEL_16:

  return v15;
}

- (BOOL)getVectorForBundleIdWithGenreBackup:(id)a3 into:(float *)a4
{
  id v6 = a3;
  if ([(ATXApp2VecMapping *)self getVectorForBundleId:v6 into:a4])
  {
    BOOL v7 = 1;
  }
  else
  {
    id v8 = +[_ATXAppInfoManager sharedInstance];
    v9 = [v8 genreIdForBundleId:v6];
    v10 = v9;
    if (v9)
    {
      v11 = [v9 stringValue];
      BOOL v7 = [(ATXApp2VecMapping *)self getVectorForBundleId:v11 into:a4];
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  return v7;
}

- (void).cxx_destruct
{
}

- (void)initWithPath:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1D0FA3000, v1, OS_LOG_TYPE_ERROR, "Could not read app2vec mapping %@: %@", v2, 0x16u);
}

- (void)initWithPath:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Truncated app2vec mapping: %@", v2, v3, v4, v5, v6);
}

- (void)initWithPath:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Could not open app2vec trie: %@", v2, v3, v4, v5, v6);
}

- (void)getVectorForBundleId:(os_log_t)log into:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_DEBUG, "getVectorForBundleId: called with nil bundle identifier.", v1, 2u);
}

- (void)getVectorForBundleId:(os_log_t)log into:.cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "Invalid app2vec mapping", v1, 2u);
}

@end