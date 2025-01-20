@interface _CDDataCollection
- (BOOL)submitDataForCollection;
- (OS_xpc_object)activity;
- (_CDDataCollection)initWithStorage:(id)a3 activity:(id)a4;
- (_CDDataCollection)initWithStorage:(id)a3 activity:(id)a4 sessionPath:(id)a5 dataDirectory:(id)a6 collectionDate:(id)a7 samplingRate:(double)a8 daysPerBatch:(unint64_t)a9 eventStreams:(id)a10 maxBatches:(unint64_t)a11;
- (_DKKnowledgeQuerying)storage;
- (id)dataPath;
- (id)submissionBlock;
- (id)truncatedFileHandle;
- (void)_execute;
- (void)cleanup;
- (void)execute;
- (void)setSession:(uint64_t)a1;
- (void)setSubmissionBlock:(id)a3;
- (void)submitDataForCollection;
@end

@implementation _CDDataCollection

- (_CDDataCollection)initWithStorage:(id)a3 activity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[_CDPaths defaultSessionPathForDataCollection];
  v9 = +[_CDPaths defaultDirectoryPathForDataCollection];
  v10 = [MEMORY[0x1E4F1C9C8] date];
  double v11 = 1.0;
  if (!CRIsAppleInternal())
  {
    v12 = OSAGetDATaskingValue();
    if (v12)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v12 doubleValue];
        double v11 = v13;
      }
      else
      {
        double v11 = 0.0001;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v12 doubleValue];
        double v11 = v14;
      }
    }
    else
    {
      double v11 = 0.0001;
    }
  }
  v15 = +[_CDLogging dataCollectionChannel];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[_CDDataCollection initWithStorage:activity:]();
  }

  v16 = OSAGetDATaskingValue();
  if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    uint64_t v17 = [v16 unsignedIntegerValue];
  }
  else {
    uint64_t v17 = 7;
  }
  v18 = OSAGetDATaskingValue();
  if (v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    uint64_t v19 = [v18 unsignedIntegerValue];
  }
  else {
    uint64_t v19 = 1000;
  }
  v20 = [(_CDDataCollection *)self initWithStorage:v6 activity:v7 sessionPath:v8 dataDirectory:v9 collectionDate:v10 samplingRate:v17 daysPerBatch:v11 eventStreams:0 maxBatches:v19];

  return v20;
}

- (_CDDataCollection)initWithStorage:(id)a3 activity:(id)a4 sessionPath:(id)a5 dataDirectory:(id)a6 collectionDate:(id)a7 samplingRate:(double)a8 daysPerBatch:(unint64_t)a9 eventStreams:(id)a10 maxBatches:(unint64_t)a11
{
  id v42 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  id v23 = a10;
  v44.receiver = self;
  v44.super_class = (Class)_CDDataCollection;
  v24 = [(_CDDataCollection *)&v44 init];
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_storage, a3);
    objc_storeStrong((id *)&v25->_activity, a4);
    uint64_t v26 = objc_msgSend(v20, "copy", v42);
    sessionPath = v25->_sessionPath;
    v25->_sessionPath = (NSString *)v26;

    uint64_t v28 = [v21 copy];
    dataDirectory = v25->_dataDirectory;
    v25->_dataDirectory = (NSString *)v28;

    uint64_t v30 = [v22 copy];
    collectionDate = v25->_collectionDate;
    v25->_collectionDate = (NSDate *)v30;

    v25->_samplingRate = a8;
    v25->_daysPerBatch = a9;
    v25->_maxBatches = a11;
    v32 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v25->_sessionPath options:0 error:0];
    if (v32)
    {
      id v43 = 0;
      v33 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v32 error:&v43];
      id v34 = v43;
      if (v34)
      {
        v35 = +[_CDLogging dataCollectionChannel];
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
          -[_CDDataCollection initWithStorage:activity:sessionPath:dataDirectory:collectionDate:samplingRate:daysPerBatch:eventStreams:maxBatches:]();
        }
      }
    }
    else
    {
      v33 = 0;
    }
    session = v25->_session;
    v25->_session = v33;
    v37 = v33;

    *(_WORD *)&v25->_selectedForDataCollection = 256;
    id submissionBlock = v25->_submissionBlock;
    v25->_id submissionBlock = &__block_literal_global_81;

    v39 = (_CDEventStreamsRegister *)-[_CDEventStreamsRegister initWithEventStreams:]([_CDEventStreamsRegister alloc], v23);
    eventStreamsRegister = v25->_eventStreamsRegister;
    v25->_eventStreamsRegister = v39;
  }
  return v25;
}

- (void)execute
{
  -[_CDDataCollection _execute]((uint64_t)self);
  -[_CDDataCollection cleanup]((uint64_t)self);
}

- (void)_execute
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_18ECEB000, v0, v1, "Selected for data collection", v2, v3, v4, v5, v6);
}

- (void)cleanup
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, v0, v1, "Error remove previous session file: %@", v2, v3, v4, v5, v6);
}

- (void)setSession:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 64), a2);
  }
}

- (id)truncatedFileHandle
{
  if (a1)
  {
    uint64_t v1 = -[_CDDataCollection dataPath](a1);
    uint64_t v2 = [v1 stringByDeletingLastPathComponent];
    uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v10 = 0;
    [v3 createDirectoryAtPath:v2 withIntermediateDirectories:1 attributes:0 error:&v10];
    id v4 = v10;

    if (v4)
    {
      uint64_t v5 = +[_CDLogging dataCollectionChannel];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[_CDCloudFamilyDataCollectionTask truncatedFileHandle]();
      }

      uint8_t v6 = 0;
    }
    else
    {
      id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
      v8 = [MEMORY[0x1E4F1C9B8] data];
      [v7 createFileAtPath:v1 contents:v8 attributes:0];

      uint8_t v6 = [MEMORY[0x1E4F28CB0] fileHandleForWritingAtPath:v1];
    }
  }
  else
  {
    uint8_t v6 = 0;
  }
  return v6;
}

- (BOOL)submitDataForCollection
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v2 = +[_CDLogging dataCollectionChannel];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    -[_CDDataCollection submitDataForCollection]();
  }

  uint64_t v3 = -[_CDDataCollection dataPath](a1);
  id v4 = [v3 stringByAppendingPathExtension:@"tar.gz"];
  id v5 = v3;
  uint8_t v6 = (const char *)[v5 fileSystemRepresentation];
  id v7 = [v5 lastPathComponent];
  [v7 fileSystemRepresentation];

  id v8 = v4;
  [v8 fileSystemRepresentation];
  archive_write_new();
  if (!archive_write_add_filter_gzip()
    && !archive_write_set_format_pax_restricted()
    && !archive_write_open_filename())
  {
    memset(&v20, 0, sizeof(v20));
    stat(v6, &v20);
    archive_entry_new();
    archive_entry_set_size();
    archive_entry_set_filetype();
    archive_entry_set_perm();
    archive_entry_set_pathname();
    if (!archive_write_header())
    {
      int v14 = open(v6, 0);
      while (read(v14, v21, 0x2000uLL))
        archive_write_data();
      close(v14);
      archive_entry_free();
      archive_write_close();
      archive_write_free();
      id v19 = 0;
      v15 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v8 options:8 error:&v19];
      id v16 = v19;
      BOOL v12 = v16 == 0;
      if (v16)
      {
        uint64_t v17 = +[_CDLogging dataCollectionChannel];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          -[_CDCloudFamilyDataCollectionTask submitDataForCollection]();
        }
      }
      else
      {
        uint64_t v17 = [v8 lastPathComponent];
        v18 = [a1 submissionBlock];
        ((void (**)(void, NSObject *, void *))v18)[2](v18, v17, v15);
      }
      goto LABEL_12;
    }
    archive_entry_free();
  }
  uint64_t v9 = archive_errno();
  uint64_t v10 = archive_error_string();
  double v11 = +[_CDLogging dataCollectionChannel];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    [(_CDCloudFamilyDataCollectionTask *)v9 submitDataForCollection];
  }

  archive_write_close();
  archive_write_free();
  BOOL v12 = 0;
LABEL_12:

  return v12;
}

- (id)dataPath
{
  uint64_t v1 = a1;
  if (a1)
  {
    if (a1[8])
    {
      uint64_t v2 = a1[8];
      if (v2) {
        uint64_t v3 = (void *)v2[1];
      }
      else {
        uint64_t v3 = 0;
      }
      id v4 = NSNumber;
      id v5 = a1[8];
      if (v5) {
        uint64_t v6 = v5[5];
      }
      else {
        uint64_t v6 = 0;
      }
      id v7 = v5;
      id v8 = v3;
      uint64_t v9 = v2;
      uint64_t v10 = [v4 numberWithUnsignedInteger:v6];
      double v11 = [v8 stringByAppendingFormat:@".%@.json", v10];

      uint64_t v1 = [v1[5] stringByAppendingPathComponent:v11];
    }
    else
    {
      uint64_t v1 = 0;
    }
  }
  return v1;
}

- (OS_xpc_object)activity
{
  return self->_activity;
}

- (_DKKnowledgeQuerying)storage
{
  return self->_storage;
}

- (id)submissionBlock
{
  return self->_submissionBlock;
}

- (void)setSubmissionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventStreamsRegister, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_collectionDate, 0);
  objc_storeStrong((id *)&self->_sessionPath, 0);
  objc_storeStrong((id *)&self->_dataDirectory, 0);
  objc_storeStrong(&self->_submissionBlock, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_activity, 0);
}

- (void)initWithStorage:activity:.cold.1()
{
  v0 = objc_msgSend(NSNumber, "numberWithDouble:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18ECEB000, v1, v2, "Sampling Rate: %@", v3, v4, v5, v6, v7);
}

- (void)initWithStorage:activity:sessionPath:dataDirectory:collectionDate:samplingRate:daysPerBatch:eventStreams:maxBatches:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, v0, v1, "Error unarchiving data collection session: %@", v2, v3, v4, v5, v6);
}

- (void)submitDataForCollection
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_18ECEB000, v0, v1, "Compressing data collection json file", v2, v3, v4, v5, v6);
}

@end