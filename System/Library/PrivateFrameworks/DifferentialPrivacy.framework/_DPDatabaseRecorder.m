@interface _DPDatabaseRecorder
- (BOOL)isMetadataValid:(id)a3;
- (NSSet)blacklistSet;
- (_DPDatabaseRecorder)init;
- (_DPDatabaseRecorder)initWithKey:(id)a3 storage:(id)a4;
- (_DPDatabaseRecorder)initWithKey:(id)a3 storage:(id)a4 systemBlacklistPath:(id)a5 runtimeBlacklistPath:(id)a6;
- (_DPStorage)db;
- (id)description;
- (unint64_t)puzzlePieceCount;
- (void)directUploadRecords:(id)a3 forKey:(id)a4;
- (void)donateRandomizationEventToBitacoraForKey:(id)a3 succeeded:(BOOL)a4 errorCode:(int)a5 count:(int)a6;
- (void)recordBitValues:(id)a3;
- (void)recordBitValues:(id)a3 metadata:(id)a4;
- (void)recordBitVectors:(id)a3;
- (void)recordBitVectors:(id)a3 metadata:(id)a4;
- (void)recordFloatVectors:(id)a3;
- (void)recordFloatVectors:(id)a3 metadata:(id)a4;
- (void)recordNumbers:(id)a3;
- (void)recordNumbers:(id)a3 metadata:(id)a4;
- (void)recordNumbersVectors:(id)a3;
- (void)recordNumbersVectors:(id)a3 metadata:(id)a4;
- (void)recordStrings:(id)a3;
- (void)recordStrings:(id)a3 metadata:(id)a4;
- (void)recordWords:(id)a3;
@end

@implementation _DPDatabaseRecorder

- (_DPDatabaseRecorder)init
{
  return 0;
}

- (_DPDatabaseRecorder)initWithKey:(id)a3 storage:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[_DPStrings systemBlacklistDirectoryPath];
  v9 = +[_DPStrings runtimeBlacklistDirectoryPath];
  v10 = [(_DPDatabaseRecorder *)self initWithKey:v7 storage:v6 systemBlacklistPath:v8 runtimeBlacklistPath:v9];

  return v10;
}

- (_DPDatabaseRecorder)initWithKey:(id)a3 storage:(id)a4 systemBlacklistPath:(id)a5 runtimeBlacklistPath:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v28.receiver = self;
  v28.super_class = (Class)_DPDatabaseRecorder;
  v14 = [(_DPDataRecorder *)&v28 initWithKey:v10];
  v15 = v14;
  if (!v14)
  {
LABEL_8:
    v26 = v15;
    goto LABEL_9;
  }
  p_db = &v14->_db;
  objc_storeStrong((id *)&v14->_db, a4);
  if (*p_db)
  {
    v17 = +[_DPBlacklist blacklistForKey:v10 systemBlacklistDirectory:v12 runtimeBlacklistDirectory:v13];
    uint64_t v18 = [v17 blacklist];
    blacklistSet = v15->_blacklistSet;
    v15->_blacklistSet = (NSSet *)v18;

    v20 = (void *)MEMORY[0x1E019F810]();
    v21 = +[_DPKeyNames keyPropertiesForKey:v10];
    v22 = [v21 parameterDictionary];
    v23 = [v22 objectForKeyedSubscript:@"puzzleCount"];
    v24 = v23;
    if (v23) {
      uint64_t v25 = [v23 unsignedIntegerValue];
    }
    else {
      uint64_t v25 = 256;
    }
    v15->_puzzlePieceCount = v25;

    goto LABEL_8;
  }
  v26 = 0;
LABEL_9:

  return v26;
}

- (void)recordNumbers:(id)a3
{
}

- (void)recordNumbers:(id)a3 metadata:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = (void *)MEMORY[0x1E019F810]();
  v34.receiver = self;
  v34.super_class = (Class)_DPDatabaseRecorder;
  id v10 = [(_DPDataRecorder *)&v34 randomizer];
  id v11 = [v10 randomizer];

  if (v11)
  {
    v27 = v9;
    v33.receiver = self;
    v33.super_class = (Class)_DPDatabaseRecorder;
    id v12 = [(_DPDataRecorder *)&v33 keyName];
    id v13 = +[_DPSubmissionRateLimiter sharedInstance];
    uint64_t v14 = objc_msgSend(v13, "debit:forKey:", objc_msgSend(v7, "count"), v12);
    v15 = [(_DPDataRecorder *)self keyName];
    -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:count:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:count:", v15, 0, 202, [v7 count] - v14);

    if (!v14)
    {
      uint64_t v18 = +[_DPLog framework];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        -[_DPDatabaseRecorder recordNumbers:metadata:]();
      }
      v16 = v7;
      goto LABEL_25;
    }
    v16 = objc_msgSend(v7, "subarrayWithRange:", 0, v14);

    if (v8)
    {
      if ([(_DPDatabaseRecorder *)self isMetadataValid:v8])
      {
        if (objc_opt_respondsToSelector())
        {
          aSelector = a2;
          uint64_t v17 = [v11 randomizeNumbers:v16 metadata:v8 forKey:v12];
          goto LABEL_13;
        }
        v24 = +[_DPLog framework];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          -[_DPDatabaseRecorder recordNumbers:metadata:](a2);
        }
      }
      else
      {
        v24 = +[_DPLog framework];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          -[_DPDatabaseRecorder recordNumbers:metadata:].cold.4();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector())
      {
        aSelector = a2;
        uint64_t v17 = [v11 randomizeNumbers:v16 forKey:v12];
LABEL_13:
        uint64_t v18 = v17;
        v19 = [(_DPDataRecorder *)self keyName];
        -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:count:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:count:", v19, 0, 208, [v16 count] - -[NSObject count](v18, "count"));

        v20 = [(_DPDataRecorder *)self keyName];
        [(_DPDatabaseRecorder *)self donateRandomizationEventToBitacoraForKey:v20 succeeded:1 errorCode:200 count:[v18 count]];

        if ([(_DPDataRecorder *)self directUpload])
        {
          v21 = +[_DPLog framework];
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            v22 = NSStringFromSelector(aSelector);
            uint64_t v23 = [v18 count];
            *(_DWORD *)buf = 138412546;
            v36 = v22;
            __int16 v37 = 2048;
            uint64_t v38 = v23;
            _os_log_impl(&dword_1DC55E000, v21, OS_LOG_TYPE_INFO, "%@: performing direct upload, count: %ld", buf, 0x16u);
          }
          [(_DPDatabaseRecorder *)self directUploadRecords:v18 forKey:v12];
        }
        else
        {
          db = self->_db;
          v28[0] = MEMORY[0x1E4F143A8];
          v28[1] = 3221225472;
          v28[2] = __46___DPDatabaseRecorder_recordNumbers_metadata___block_invoke;
          v28[3] = &unk_1E6C444F8;
          v31 = aSelector;
          id v29 = v13;
          id v30 = v12;
          uint64_t v32 = v14;
          [(_DPStorage *)db saveRecords:v18 withCompletion:v28];
        }
        goto LABEL_25;
      }
      v24 = +[_DPLog framework];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[_DPDatabaseRecorder recordNumbers:metadata:](a2);
      }
    }

    uint64_t v18 = [(_DPDataRecorder *)self keyName];
    -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:count:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:count:", v18, 0, 203, [v16 count]);
LABEL_25:
    v9 = v27;

    id v7 = v16;
    goto LABEL_26;
  }
  id v12 = [(_DPDataRecorder *)self keyName];
  -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:count:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:count:", v12, 0, 201, [v7 count]);
LABEL_26:
}

- (void)recordNumbersVectors:(id)a3
{
}

- (void)recordNumbersVectors:(id)a3 metadata:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = (void *)MEMORY[0x1E019F810]();
  v34.receiver = self;
  v34.super_class = (Class)_DPDatabaseRecorder;
  id v10 = [(_DPDataRecorder *)&v34 randomizer];
  id v11 = [v10 randomizer];

  if (v11)
  {
    v27 = v9;
    v33.receiver = self;
    v33.super_class = (Class)_DPDatabaseRecorder;
    id v12 = [(_DPDataRecorder *)&v33 keyName];
    id v13 = +[_DPSubmissionRateLimiter sharedInstance];
    uint64_t v14 = objc_msgSend(v13, "debit:forKey:", objc_msgSend(v7, "count"), v12);
    v15 = [(_DPDataRecorder *)self keyName];
    -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:count:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:count:", v15, 0, 202, [v7 count] - v14);

    if (!v14)
    {
      uint64_t v18 = +[_DPLog framework];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        -[_DPDatabaseRecorder recordNumbers:metadata:]();
      }
      v16 = v7;
      goto LABEL_25;
    }
    v16 = objc_msgSend(v7, "subarrayWithRange:", 0, v14);

    if (v8)
    {
      if ([(_DPDatabaseRecorder *)self isMetadataValid:v8])
      {
        if (objc_opt_respondsToSelector())
        {
          aSelector = a2;
          uint64_t v17 = [v11 randomizeNumbersVectors:v16 metadata:v8 forKey:v12];
          goto LABEL_13;
        }
        v24 = +[_DPLog framework];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          -[_DPDatabaseRecorder recordNumbers:metadata:](a2);
        }
      }
      else
      {
        v24 = +[_DPLog framework];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          -[_DPDatabaseRecorder recordNumbersVectors:metadata:].cold.4();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector())
      {
        aSelector = a2;
        uint64_t v17 = [v11 randomizeNumbersVectors:v16 forKey:v12];
LABEL_13:
        uint64_t v18 = v17;
        v19 = [(_DPDataRecorder *)self keyName];
        -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:count:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:count:", v19, 0, 208, [v16 count] - -[NSObject count](v18, "count"));

        v20 = [(_DPDataRecorder *)self keyName];
        [(_DPDatabaseRecorder *)self donateRandomizationEventToBitacoraForKey:v20 succeeded:1 errorCode:200 count:[v18 count]];

        if ([(_DPDataRecorder *)self directUpload])
        {
          v21 = +[_DPLog framework];
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            v22 = NSStringFromSelector(aSelector);
            uint64_t v23 = [v18 count];
            *(_DWORD *)buf = 138412546;
            v36 = v22;
            __int16 v37 = 2048;
            uint64_t v38 = v23;
            _os_log_impl(&dword_1DC55E000, v21, OS_LOG_TYPE_INFO, "%@: performing direct upload, count: %ld", buf, 0x16u);
          }
          [(_DPDatabaseRecorder *)self directUploadRecords:v18 forKey:v12];
        }
        else
        {
          db = self->_db;
          v28[0] = MEMORY[0x1E4F143A8];
          v28[1] = 3221225472;
          v28[2] = __53___DPDatabaseRecorder_recordNumbersVectors_metadata___block_invoke;
          v28[3] = &unk_1E6C444F8;
          v31 = aSelector;
          id v29 = v13;
          id v30 = v12;
          uint64_t v32 = v14;
          [(_DPStorage *)db saveRecords:v18 withCompletion:v28];
        }
        goto LABEL_25;
      }
      v24 = +[_DPLog framework];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[_DPDatabaseRecorder recordNumbers:metadata:](a2);
      }
    }

    uint64_t v18 = [(_DPDataRecorder *)self keyName];
    -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:count:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:count:", v18, 0, 203, [v16 count]);
LABEL_25:
    v9 = v27;

    id v7 = v16;
    goto LABEL_26;
  }
  id v12 = [(_DPDataRecorder *)self keyName];
  -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:count:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:count:", v12, 0, 201, [v7 count]);
LABEL_26:
}

- (void)recordBitValues:(id)a3
{
}

- (void)recordBitValues:(id)a3 metadata:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = (void *)MEMORY[0x1E019F810]();
  v36.receiver = self;
  v36.super_class = (Class)_DPDatabaseRecorder;
  id v10 = [(_DPDataRecorder *)&v36 randomizer];
  id v11 = [v10 randomizer];

  if (v11)
  {
    id v29 = v9;
    v35.receiver = self;
    v35.super_class = (Class)_DPDatabaseRecorder;
    id v12 = [(_DPDataRecorder *)&v35 keyName];
    id v13 = +[_DPSubmissionRateLimiter sharedInstance];
    uint64_t v14 = objc_msgSend(v13, "debit:forKey:", objc_msgSend(v7, "count"), v12);
    v15 = [(_DPDataRecorder *)self keyName];
    -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:count:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:count:", v15, 0, 202, [v7 count] - v14);

    if (!v14)
    {
      v19 = +[_DPLog framework];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        -[_DPDatabaseRecorder recordNumbers:metadata:]();
      }
      v16 = v7;
      goto LABEL_26;
    }
    v16 = objc_msgSend(v7, "subarrayWithRange:", 0, v14);

    if (v8)
    {
      if (![(_DPDatabaseRecorder *)self isMetadataValid:v8])
      {
        uint64_t v25 = [(_DPDataRecorder *)self keyName];
        -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:count:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:count:", v25, 0, 203, [v16 count]);

        v19 = +[_DPLog framework];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          -[_DPDatabaseRecorder recordBitValues:metadata:].cold.5();
        }
        goto LABEL_26;
      }
      if (objc_opt_respondsToSelector())
      {
        aSelector = a2;
        uint64_t v17 = [v11 randomizeBitValues:v16 metadata:v8 forKey:v12];
        goto LABEL_14;
      }
      v26 = +[_DPLog framework];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[_DPDatabaseRecorder recordNumbers:metadata:](a2);
      }
    }
    else
    {
      if (objc_opt_respondsToSelector())
      {
        aSelector = a2;
        uint64_t v17 = [v11 randomizeBitValues:v16 forKey:v12];
LABEL_14:
        v19 = v17;
        v20 = [(_DPDataRecorder *)self keyName];
        -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:count:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:count:", v20, 0, 208, [v16 count] - -[NSObject count](v19, "count"));

        v21 = [(_DPDataRecorder *)self keyName];
        [(_DPDatabaseRecorder *)self donateRandomizationEventToBitacoraForKey:v21 succeeded:1 errorCode:200 count:[v19 count]];

        if ([(_DPDataRecorder *)self directUpload])
        {
          v22 = +[_DPLog framework];
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            uint64_t v23 = NSStringFromSelector(aSelector);
            uint64_t v24 = [v19 count];
            *(_DWORD *)buf = 138412546;
            uint64_t v38 = v23;
            __int16 v39 = 2048;
            uint64_t v40 = v24;
            _os_log_impl(&dword_1DC55E000, v22, OS_LOG_TYPE_INFO, "%@: performing direct upload, count: %ld", buf, 0x16u);
          }
          [(_DPDatabaseRecorder *)self directUploadRecords:v19 forKey:v12];
        }
        else
        {
          db = self->_db;
          v30[0] = MEMORY[0x1E4F143A8];
          v30[1] = 3221225472;
          v30[2] = __48___DPDatabaseRecorder_recordBitValues_metadata___block_invoke;
          v30[3] = &unk_1E6C444F8;
          objc_super v33 = aSelector;
          id v31 = v13;
          uint64_t v32 = v12;
          uint64_t v34 = v14;
          [(_DPStorage *)db saveRecords:v19 withCompletion:v30];
        }
        goto LABEL_26;
      }
      v26 = +[_DPLog framework];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[_DPDatabaseRecorder recordBitValues:metadata:](a2);
      }
    }

    v19 = [(_DPDataRecorder *)self keyName];
    -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:count:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:count:", v19, 0, 207, [v16 count]);
LABEL_26:
    v9 = v29;

    id v7 = v16;
    goto LABEL_27;
  }
  uint64_t v18 = [(_DPDataRecorder *)self keyName];
  -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:count:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:count:", v18, 0, 201, [v7 count]);

  id v12 = +[_DPLog daemon];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    -[_DPDatabaseRecorder recordBitValues:metadata:](v12);
  }
LABEL_27:
}

- (void)recordBitVectors:(id)a3
{
}

- (void)recordBitVectors:(id)a3 metadata:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = (void *)MEMORY[0x1E019F810]();
  v41.receiver = self;
  v41.super_class = (Class)_DPDatabaseRecorder;
  id v10 = [(_DPDataRecorder *)&v41 randomizer];
  id v11 = [v10 randomizer];

  if (v11)
  {
    uint64_t v34 = v9;
    v40.receiver = self;
    v40.super_class = (Class)_DPDatabaseRecorder;
    id v12 = [(_DPDataRecorder *)&v40 keyName];
    id v13 = +[_DPSubmissionRateLimiter sharedInstance];
    uint64_t v14 = objc_msgSend(v13, "debit:forKey:", objc_msgSend(v7, "count"), v12);
    v15 = [(_DPDataRecorder *)self keyName];
    -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:count:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:count:", v15, 0, 202, [v7 count] - v14);

    if (!v14)
    {
      uint64_t v18 = +[_DPLog framework];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        -[_DPDatabaseRecorder recordNumbers:metadata:]();
      }
      v16 = v7;
      goto LABEL_29;
    }
    v16 = objc_msgSend(v7, "subarrayWithRange:", 0, v14);

    if (v8)
    {
      if (![(_DPDatabaseRecorder *)self isMetadataValid:v8])
      {
        uint64_t v24 = +[_DPLog framework];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          -[_DPDatabaseRecorder recordBitValues:metadata:].cold.5();
        }

        uint64_t v18 = [(_DPDataRecorder *)self keyName];
        uint64_t v25 = [v16 count];
        v26 = self;
        v27 = v18;
        uint64_t v28 = 203;
        goto LABEL_28;
      }
      if (objc_opt_respondsToSelector())
      {
        SEL aSelector = a2;
        uint64_t v17 = [v11 randomizeBitVectors:v16 metadata:v8 forKey:v12];
        goto LABEL_13;
      }
      id v31 = +[_DPLog framework];
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        -[_DPDatabaseRecorder recordNumbers:metadata:](a2);
      }
    }
    else
    {
      SEL aSelector = a2;
      if (objc_opt_respondsToSelector())
      {
        uint64_t v17 = [v11 randomizeBitVectors:v16 forKey:v12];
LABEL_13:
        uint64_t v18 = v17;
        v19 = [(_DPDataRecorder *)self keyName];
        -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:count:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:count:", v19, 0, 208, [v16 count] - -[NSObject count](v18, "count"));

        v20 = [(_DPDataRecorder *)self keyName];
        [(_DPDatabaseRecorder *)self donateRandomizationEventToBitacoraForKey:v20 succeeded:1 errorCode:200 count:[v18 count]];

        if ([(_DPDataRecorder *)self directUpload])
        {
          v21 = +[_DPLog framework];
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            v22 = NSStringFromSelector(aSelectora);
            uint64_t v23 = [v18 count];
            *(_DWORD *)buf = 138412546;
            v43 = v22;
            __int16 v44 = 2048;
            uint64_t v45 = v23;
            _os_log_impl(&dword_1DC55E000, v21, OS_LOG_TYPE_INFO, "%@: performing direct upload, count: %ld", buf, 0x16u);
          }
          [(_DPDatabaseRecorder *)self directUploadRecords:v18 forKey:v12];
        }
        else
        {
          db = self->_db;
          v35[0] = MEMORY[0x1E4F143A8];
          v35[1] = 3221225472;
          v35[2] = __49___DPDatabaseRecorder_recordBitVectors_metadata___block_invoke;
          v35[3] = &unk_1E6C444F8;
          uint64_t v38 = aSelectora;
          id v36 = v13;
          id v37 = v12;
          uint64_t v39 = v14;
          [(_DPStorage *)db saveRecords:v18 withCompletion:v35];
        }
        goto LABEL_29;
      }
      id v29 = +[_DPLog framework];
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        -[_DPDatabaseRecorder recordBitVectors:metadata:]();
      }
    }
    uint64_t v18 = [(_DPDataRecorder *)self keyName];
    uint64_t v25 = [v16 count];
    v26 = self;
    v27 = v18;
    uint64_t v28 = 207;
LABEL_28:
    [(_DPDatabaseRecorder *)v26 donateRandomizationEventToBitacoraForKey:v27 succeeded:0 errorCode:v28 count:v25];
LABEL_29:
    v9 = v34;

    id v7 = v16;
    goto LABEL_30;
  }
  id v12 = [(_DPDataRecorder *)self keyName];
  -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:count:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:count:", v12, 0, 201, [v7 count]);
LABEL_30:
}

- (void)recordFloatVectors:(id)a3
{
}

- (void)recordFloatVectors:(id)a3 metadata:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = (void *)MEMORY[0x1E019F810]();
  v40.receiver = self;
  v40.super_class = (Class)_DPDatabaseRecorder;
  id v10 = [(_DPDataRecorder *)&v40 randomizer];
  id v11 = [v10 randomizer];

  if (v11)
  {
    objc_super v33 = v9;
    v39.receiver = self;
    v39.super_class = (Class)_DPDatabaseRecorder;
    id v12 = [(_DPDataRecorder *)&v39 keyName];
    id v13 = +[_DPSubmissionRateLimiter sharedInstance];
    uint64_t v14 = objc_msgSend(v13, "debit:forKey:", objc_msgSend(v7, "count"), v12);
    v15 = [(_DPDataRecorder *)self keyName];
    -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:count:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:count:", v15, 0, 202, [v7 count] - v14);

    if (!v14)
    {
      uint64_t v18 = +[_DPLog framework];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        -[_DPDatabaseRecorder recordNumbers:metadata:]();
      }
      v16 = v7;
      goto LABEL_27;
    }
    v16 = objc_msgSend(v7, "subarrayWithRange:", 0, v14);

    if (v8)
    {
      if (![(_DPDatabaseRecorder *)self isMetadataValid:v8])
      {
        uint64_t v24 = +[_DPLog framework];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          -[_DPDatabaseRecorder recordFloatVectors:metadata:].cold.4();
        }

        uint64_t v18 = [(_DPDataRecorder *)self keyName];
        uint64_t v25 = [v16 count];
        v26 = self;
        v27 = v18;
        uint64_t v28 = 203;
        goto LABEL_26;
      }
      SEL aSelector = a2;
      if (objc_opt_respondsToSelector())
      {
        uint64_t v17 = [v11 randomizeFloatVectors:v16 metadata:v8 forKey:v12];
        goto LABEL_13;
      }
      id v29 = +[_DPLog framework];
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        -[_DPDatabaseRecorder recordFloatVectors:metadata:]();
      }
    }
    else
    {
      SEL aSelector = a2;
      if (objc_opt_respondsToSelector())
      {
        uint64_t v17 = [v11 randomizeFloatVectors:v16 forKey:v12];
LABEL_13:
        uint64_t v18 = v17;
        v19 = [(_DPDataRecorder *)self keyName];
        -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:count:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:count:", v19, 0, 208, [v16 count] - -[NSObject count](v18, "count"));

        v20 = [(_DPDataRecorder *)self keyName];
        [(_DPDatabaseRecorder *)self donateRandomizationEventToBitacoraForKey:v20 succeeded:1 errorCode:200 count:[v18 count]];

        if ([(_DPDataRecorder *)self directUpload])
        {
          v21 = +[_DPLog framework];
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            v22 = NSStringFromSelector(aSelectora);
            uint64_t v23 = [v18 count];
            *(_DWORD *)buf = 138412546;
            v42 = v22;
            __int16 v43 = 2048;
            uint64_t v44 = v23;
            _os_log_impl(&dword_1DC55E000, v21, OS_LOG_TYPE_INFO, "%@: performing direct upload, count: %ld", buf, 0x16u);
          }
          [(_DPDatabaseRecorder *)self directUploadRecords:v18 forKey:v12];
        }
        else
        {
          db = self->_db;
          v34[0] = MEMORY[0x1E4F143A8];
          v34[1] = 3221225472;
          v34[2] = __51___DPDatabaseRecorder_recordFloatVectors_metadata___block_invoke;
          v34[3] = &unk_1E6C444F8;
          id v37 = aSelectora;
          id v35 = v13;
          id v36 = v12;
          uint64_t v38 = v14;
          [(_DPStorage *)db saveRecords:v18 withCompletion:v34];
        }
        goto LABEL_27;
      }
      id v29 = +[_DPLog framework];
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        -[_DPDatabaseRecorder recordFloatVectors:metadata:]();
      }
    }

    uint64_t v18 = [(_DPDataRecorder *)self keyName];
    uint64_t v25 = [v16 count];
    v26 = self;
    v27 = v18;
    uint64_t v28 = 207;
LABEL_26:
    -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:count:](v26, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:count:", v27, 0, v28, v25, aSelector);
LABEL_27:
    v9 = v33;

    id v7 = v16;
    goto LABEL_28;
  }
  id v12 = [(_DPDataRecorder *)self keyName];
  -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:count:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:count:", v12, 0, 201, [v7 count]);
LABEL_28:
}

- (void)recordStrings:(id)a3
{
}

- (void)recordStrings:(id)a3 metadata:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = (void *)MEMORY[0x1E019F810]();
  v47.receiver = self;
  v47.super_class = (Class)_DPDatabaseRecorder;
  id v10 = [(_DPDataRecorder *)&v47 randomizer];
  id v11 = [v10 randomizer];

  if (v11)
  {
    objc_super v39 = v9;
    id v12 = v7;
    id v13 = [(_DPDatabaseRecorder *)self blacklistSet];

    uint64_t v14 = v12;
    if (v13)
    {
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __46___DPDatabaseRecorder_recordStrings_metadata___block_invoke;
      v46[3] = &unk_1E6C44278;
      v46[4] = self;
      v15 = [v12 indexesOfObjectsPassingTest:v46];
      uint64_t v14 = (void *)[v12 mutableCopy];
      [v14 removeObjectsAtIndexes:v15];
    }
    v16 = [(_DPDataRecorder *)self keyName];
    -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:count:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:count:", v16, 0, 202, [v12 count] - objc_msgSend(v14, "count"));

    v45.receiver = self;
    v45.super_class = (Class)_DPDatabaseRecorder;
    uint64_t v17 = [(_DPDataRecorder *)&v45 keyName];
    uint64_t v18 = +[_DPSubmissionRateLimiter sharedInstance];
    uint64_t v19 = objc_msgSend(v18, "debit:forKey:", objc_msgSend(v14, "count"), v17);
    v20 = [(_DPDataRecorder *)self keyName];
    -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:count:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:count:", v20, 0, 202, [v14 count] - v19);

    if (!v19)
    {
      uint64_t v23 = +[_DPLog framework];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        -[_DPDatabaseRecorder recordNumbers:metadata:]();
      }
      v21 = v14;
      goto LABEL_30;
    }
    v21 = objc_msgSend(v14, "subarrayWithRange:", 0, v19);

    if (v8)
    {
      if ([(_DPDatabaseRecorder *)self isMetadataValid:v8])
      {
        if (objc_opt_respondsToSelector())
        {
          SEL aSelector = a2;
          uint64_t v38 = v18;
          uint64_t v22 = [v11 randomizeStrings:v21 metadata:v8 forKey:v17];
LABEL_15:
          uint64_t v23 = v22;
          uint64_t v24 = [(_DPDataRecorder *)self keyName];
          -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:count:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:count:", v24, 0, 208, [v21 count] - -[NSObject count](v23, "count"));

          uint64_t v25 = [(_DPDataRecorder *)self keyName];
          [(_DPDatabaseRecorder *)self donateRandomizationEventToBitacoraForKey:v25 succeeded:1 errorCode:200 count:[v23 count]];

          if ([(_DPDataRecorder *)self directUpload])
          {
            v26 = +[_DPLog framework];
            if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            {
              v27 = NSStringFromSelector(aSelector);
              uint64_t v28 = [v23 count];
              *(_DWORD *)buf = 138412546;
              v49 = v27;
              __int16 v50 = 2048;
              uint64_t v51 = v28;
              _os_log_impl(&dword_1DC55E000, v26, OS_LOG_TYPE_INFO, "%@: performing direct upload, count: %ld", buf, 0x16u);
            }
            [(_DPDatabaseRecorder *)self directUploadRecords:v23 forKey:v17];
            uint64_t v18 = v38;
            v9 = v39;
            goto LABEL_31;
          }
          db = self->_db;
          v40[0] = MEMORY[0x1E4F143A8];
          v40[1] = 3221225472;
          v40[2] = __46___DPDatabaseRecorder_recordStrings_metadata___block_invoke_34;
          v40[3] = &unk_1E6C444F8;
          uint64_t v18 = v38;
          __int16 v43 = aSelector;
          id v41 = v38;
          id v42 = v17;
          uint64_t v44 = v19;
          [(_DPStorage *)db saveRecords:v23 withCompletion:v40];

LABEL_30:
          v9 = v39;
LABEL_31:

          goto LABEL_32;
        }
        id v36 = +[_DPLog framework];
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
          -[_DPDatabaseRecorder recordFloatVectors:metadata:]();
        }

        uint64_t v23 = [(_DPDataRecorder *)self keyName];
        uint64_t v30 = [v21 count];
        id v31 = self;
        uint64_t v32 = v23;
        uint64_t v33 = 203;
      }
      else
      {
        id v29 = +[_DPLog framework];
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          -[_DPDatabaseRecorder recordStrings:metadata:].cold.4();
        }

        uint64_t v23 = [(_DPDataRecorder *)self keyName];
        uint64_t v30 = [v21 count];
        id v31 = self;
        uint64_t v32 = v23;
        uint64_t v33 = 201;
      }
    }
    else
    {
      if (objc_opt_respondsToSelector())
      {
        SEL aSelector = a2;
        uint64_t v38 = v18;
        uint64_t v22 = [v11 randomizeStrings:v21 forKey:v17];
        goto LABEL_15;
      }
      uint64_t v34 = +[_DPLog framework];
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        -[_DPDatabaseRecorder recordStrings:metadata:]();
      }

      uint64_t v23 = [(_DPDataRecorder *)self keyName];
      uint64_t v30 = [v21 count];
      id v31 = self;
      uint64_t v32 = v23;
      uint64_t v33 = 207;
    }
    [(_DPDatabaseRecorder *)v31 donateRandomizationEventToBitacoraForKey:v32 succeeded:0 errorCode:v33 count:v30];
    goto LABEL_30;
  }
  v21 = [(_DPDataRecorder *)self keyName];
  -[_DPDatabaseRecorder donateRandomizationEventToBitacoraForKey:succeeded:errorCode:count:](self, "donateRandomizationEventToBitacoraForKey:succeeded:errorCode:count:", v21, 0, 201, [v7 count]);
LABEL_32:
}

- (void)recordWords:(id)a3
{
  v75[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void *)MEMORY[0x1E019F810]();
  v69.receiver = self;
  v69.super_class = (Class)_DPDatabaseRecorder;
  id v7 = [(_DPDataRecorder *)&v69 randomizer];
  id v8 = [v7 randomizer];

  if (v8)
  {
    v68.receiver = self;
    v68.super_class = (Class)_DPDatabaseRecorder;
    id v9 = [(_DPDataRecorder *)&v68 fragmentWidth];
    v67.receiver = self;
    v67.super_class = (Class)_DPDatabaseRecorder;
    if ([(_DPDataRecorder *)&v67 bitStringAlgorithm])
    {
      SEL aSelector = a2;
      id v53 = v9;
      id v10 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"wordPosition" ascending:1];
      v75[0] = v10;
      id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:1];
      id v12 = [v5 sortedArrayUsingDescriptors:v11];

      id v13 = [v12 valueForKeyPath:@"@unionOfObjects.word"];
      uint64_t v14 = [v13 componentsJoinedByString:@" "];

      v15 = +[_DPWordRecord word:v14 atPosition:&unk_1F37A0328];
      v16 = [v5 arrayByAddingObject:v15];

      if (!self->_blacklistSet) {
        goto LABEL_30;
      }
      uint64_t v51 = 72;
      v54 = v8;
      v55 = v6;
      id v56 = v5;
      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      uint64_t v17 = v16;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v63 objects:v74 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v64;
LABEL_6:
        uint64_t v21 = 0;
        while (1)
        {
          if (*(void *)v64 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void **)(*((void *)&v63 + 1) + 8 * v21);
          uint64_t v23 = objc_msgSend(v22, "wordPosition", v51);
          char v24 = [v23 isEqualToNumber:&unk_1F37A0328];

          if (v24) {
            break;
          }
          if (v19 == ++v21)
          {
            uint64_t v19 = [v17 countByEnumeratingWithState:&v63 objects:v74 count:16];
            if (v19) {
              goto LABEL_6;
            }
            goto LABEL_12;
          }
        }
        id v25 = v22;

        if (!v25) {
          goto LABEL_22;
        }
        v26 = [v25 sequenceWithoutPadding];
        id v5 = v56;
        if (!v26)
        {
          uint64_t v34 = +[_DPLog daemon];
          id v8 = v54;
          id v6 = v55;
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
            -[_DPDatabaseRecorder recordWords:].cold.4();
          }

          uint64_t v28 = [(_DPDataRecorder *)self keyName];
          id v29 = self;
          uint64_t v30 = v28;
          uint64_t v31 = 205;
          goto LABEL_28;
        }
        id v8 = v54;
        id v6 = v55;
        if ([*(id *)((char *)&self->super.super.isa + v51) containsObject:v26])
        {
          v27 = +[_DPLog daemon];
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
            __46___DPDatabaseRecorder_recordStrings_metadata___block_invoke_cold_1();
          }

          uint64_t v28 = [(_DPDataRecorder *)self keyName];
          id v29 = self;
          uint64_t v30 = v28;
          uint64_t v31 = 206;
LABEL_28:
          [(_DPDatabaseRecorder *)v29 donateRandomizationEventToBitacoraForKey:v30 succeeded:0 errorCode:v31 count:1];

          v16 = v17;
          goto LABEL_46;
        }

LABEL_30:
        v62.receiver = self;
        v62.super_class = (Class)_DPDatabaseRecorder;
        id v35 = [(_DPDataRecorder *)&v62 keyName];
        id v36 = +[_DPSubmissionRateLimiter sharedInstance];
        uint64_t v37 = [v36 debit:1 forKey:v35];
        if (v37)
        {
          uint64_t v38 = v37;
          if (objc_opt_respondsToSelector())
          {
            objc_super v39 = v8;
            objc_super v40 = [v8 randomizeWords:v16 fragmentWidth:v53 forKey:v35];
            id v41 = [(_DPDataRecorder *)self keyName];
            [(_DPDatabaseRecorder *)self donateRandomizationEventToBitacoraForKey:v41 succeeded:1 errorCode:200 count:1];

            if ([(_DPDataRecorder *)self directUpload])
            {
              id v42 = +[_DPLog framework];
              if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
              {
                __int16 v43 = NSStringFromSelector(aSelector);
                uint64_t v44 = [v40 count];
                *(_DWORD *)buf = 138412546;
                v71 = v43;
                __int16 v72 = 2048;
                uint64_t v73 = v44;
                _os_log_impl(&dword_1DC55E000, v42, OS_LOG_TYPE_INFO, "%@: performing direct upload, count: %ld", buf, 0x16u);
              }
              [(_DPDatabaseRecorder *)self directUploadRecords:v40 forKey:v35];
            }
            else
            {
              db = self->_db;
              v57[0] = MEMORY[0x1E4F143A8];
              v57[1] = 3221225472;
              v57[2] = __35___DPDatabaseRecorder_recordWords___block_invoke;
              v57[3] = &unk_1E6C444F8;
              v60 = aSelector;
              id v58 = v36;
              id v59 = v35;
              uint64_t v61 = v38;
              [(_DPStorage *)db saveRecords:v40 withCompletion:v57];
            }
            id v8 = v39;
            goto LABEL_45;
          }
          v49 = +[_DPLog framework];
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
            -[_DPDatabaseRecorder recordStrings:metadata:]();
          }

          objc_super v40 = [(_DPDataRecorder *)self keyName];
          uint64_t v46 = self;
          objc_super v47 = v40;
          uint64_t v48 = 207;
        }
        else
        {
          objc_super v45 = +[_DPLog framework];
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG)) {
            -[_DPDatabaseRecorder recordNumbers:metadata:]();
          }

          objc_super v40 = [(_DPDataRecorder *)self keyName];
          uint64_t v46 = self;
          objc_super v47 = v40;
          uint64_t v48 = 202;
        }
        [(_DPDatabaseRecorder *)v46 donateRandomizationEventToBitacoraForKey:v47 succeeded:0 errorCode:v48 count:1];
LABEL_45:

        goto LABEL_46;
      }
LABEL_12:

LABEL_22:
      uint64_t v32 = +[_DPLog daemon];
      id v5 = v56;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        -[_DPDatabaseRecorder recordWords:]();
      }

      uint64_t v33 = [(_DPDataRecorder *)self keyName];
      [(_DPDatabaseRecorder *)self donateRandomizationEventToBitacoraForKey:v33 succeeded:0 errorCode:204 count:1];

      v16 = v17;
      id v8 = v54;
      id v6 = v55;
    }
    else
    {
      v16 = +[_DPLog daemon];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[_DPDatabaseRecorder recordWords:].cold.6(v16);
      }
    }
  }
  else
  {
    v16 = [(_DPDataRecorder *)self keyName];
    [(_DPDatabaseRecorder *)self donateRandomizationEventToBitacoraForKey:v16 succeeded:0 errorCode:201 count:1];
  }
LABEL_46:
}

- (void)directUploadRecords:(id)a3 forKey:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = +[_DPKeyNames keyPropertiesForKey:v8];
  if ([v9 transport] == 4)
  {
    id v10 = +[_DPDediscoReporter filterNonConformingDediscoRecordsFrom:v7];
    id v11 = objc_opt_new();
    id v12 = [(_DPDatabaseRecorder *)self db];
    id v13 = [v11 directlyUploadDediscoRecords:v10 forKey:v8 keyProperties:v9 storage:v12];

    uint64_t v14 = +[_DPLog framework];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = NSStringFromSelector(a2);
      int v16 = 138412802;
      uint64_t v17 = v15;
      __int16 v18 = 2048;
      uint64_t v19 = [v13 count];
      __int16 v20 = 2048;
      uint64_t v21 = [v10 count];
      _os_log_impl(&dword_1DC55E000, v14, OS_LOG_TYPE_DEFAULT, "%@: successfully submitted %ld of %ld records", (uint8_t *)&v16, 0x20u);
    }
  }
  else
  {
    id v10 = +[_DPLog framework];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[_DPDatabaseRecorder directUploadRecords:forKey:](a2);
    }
  }
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"%@: { database=%@ }", v5, self->_db];

  return v6;
}

- (BOOL)isMetadataValid:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (_DPMetadataIsV2(v3))
  {
    v4 = _DPMetadataV2RequiredKeys();
    _DPMetadataV2OptionalKeys();
  }
  else
  {
    v4 = _DPMetadataRequiredKeys();
    _DPMetadataOptionalKeys();
  id v5 = };
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v27;
    char v10 = 1;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v6);
        }
        if (v10)
        {
          uint64_t v12 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          id v13 = [v3 allKeys];
          char v10 = [v13 containsObject:v12];
        }
        else
        {
          char v10 = 0;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v8);
  }
  else
  {
    char v10 = 1;
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v14 = objc_msgSend(v3, "allKeys", 0);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v23;
    char v18 = 1;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v14);
        }
        if (v18)
        {
          uint64_t v20 = *(void *)(*((void *)&v22 + 1) + 8 * j);
          if ([v6 containsObject:v20]) {
            char v18 = 1;
          }
          else {
            char v18 = [v5 containsObject:v20];
          }
        }
        else
        {
          char v18 = 0;
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v16);
  }
  else
  {
    char v18 = 1;
  }

  return v10 & v18;
}

- (void)donateRandomizationEventToBitacoraForKey:(id)a3 succeeded:(BOOL)a4 errorCode:(int)a5 count:(int)a6
{
  uint64_t v7 = *(void *)&a5;
  BOOL v8 = a4;
  id v15 = a3;
  switch((int)v7)
  {
    case 201:
      uint64_t v9 = @"Failed to create randomizer";
      break;
    case 202:
      uint64_t v9 = @"Rate limited";
      break;
    case 203:
      uint64_t v9 = @"Malformed metadata provided";
      break;
    case 204:
      uint64_t v9 = @"recordWords, missing sequence";
      break;
    case 205:
      uint64_t v9 = @"recordWords, missing sequence without padding";
      break;
    case 206:
      uint64_t v9 = @"recordWords, missing sequence without padding blacklisted";
      break;
    case 207:
      goto LABEL_5;
    case 208:
      uint64_t v9 = @"Privatization Failed";
      break;
    default:
      if (v7) {
LABEL_5:
      }
        uint64_t v9 = &stru_1F3681BE0;
      else {
        uint64_t v9 = 0;
      }
      break;
  }
  char v10 = +[_DPKeyNames keyPropertiesForKey:v15];
  char v11 = [v10 telemetryAllowed];
  BOOL v12 = 1;
  if ((v11 & 1) == 0) {
    BOOL v12 = +[_DPDeviceInfo isInternalBuild];
  }
  LOBYTE(v14) = v12;
  LODWORD(v13) = 1;
  HIDWORD(v13) = a6;
  +[_DPLHBitacoraLogger donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:aggregateFunction:count:telemetryAllowed:](_DPLHBitacoraLogger, "donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:aggregateFunction:count:telemetryAllowed:", v15, 2, 0, v8, v7, v9, v13, v14);
}

- (_DPStorage)db
{
  return self->_db;
}

- (NSSet)blacklistSet
{
  return self->_blacklistSet;
}

- (unint64_t)puzzlePieceCount
{
  return self->_puzzlePieceCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blacklistSet, 0);
  objc_storeStrong((id *)&self->_db, 0);
}

- (void)recordNumbers:metadata:.cold.1()
{
  OUTLINED_FUNCTION_3_1();
  v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3(&dword_1DC55E000, v2, v3, "%@: Not recording : rate limiting %@", v4, v5, v6, v7, v8);
}

- (void)recordNumbers:(const char *)a1 metadata:.cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1DC55E000, v2, v3, "%@: metadata is not provided, but method that should accepts values without metadata is not supported", v4, v5, v6, v7, v8);
}

- (void)recordNumbers:(const char *)a1 metadata:.cold.3(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1DC55E000, v2, v3, "%@: metadata is provided, but method that should accepts it is not supported", v4, v5, v6, v7, v8);
}

- (void)recordNumbers:metadata:.cold.4()
{
  OUTLINED_FUNCTION_3_1();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_7() allKeys];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_1DC55E000, v3, v4, "%@: failed to save numbers records with invalid metadata (keys: %@)", v5, v6, v7, v8, v9);
}

- (void)recordNumbersVectors:metadata:.cold.4()
{
  OUTLINED_FUNCTION_3_1();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_7() allKeys];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_1DC55E000, v3, v4, "%@: failed to save number vectors records with invalid metadata (keys: %@)", v5, v6, v7, v8, v9);
}

- (void)recordBitValues:(os_log_t)log metadata:.cold.1(os_log_t log)
{
  *(_WORD *)SEL v1 = 0;
  _os_log_error_impl(&dword_1DC55E000, log, OS_LOG_TYPE_ERROR, "Fail to create randomizer", v1, 2u);
}

- (void)recordBitValues:(const char *)a1 metadata:.cold.3(const char *a1)
{
  SEL v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1DC55E000, v2, v3, "%@: method not supported", v4, v5, v6, v7, v8);
}

- (void)recordBitValues:metadata:.cold.5()
{
  OUTLINED_FUNCTION_3_1();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_7() allKeys];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_1DC55E000, v3, v4, "%@: failed to save bitvalue records with invalid metadata (keys: %@)", v5, v6, v7, v8, v9);
}

- (void)recordBitVectors:metadata:.cold.2()
{
  OUTLINED_FUNCTION_3_1();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (const char *)OUTLINED_FUNCTION_7();
  uint64_t v3 = NSStringFromSelector(v2);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_1DC55E000, v4, v5, "%@: method=%@ not supported", v6, v7, v8, v9, v10);
}

- (void)recordFloatVectors:metadata:.cold.2()
{
  OUTLINED_FUNCTION_3_1();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (const char *)OUTLINED_FUNCTION_7();
  uint64_t v3 = NSStringFromSelector(v2);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_1DC55E000, v4, v5, "%@: metadata is not provided, but method=(%@) not supported", v6, v7, v8, v9, v10);
}

- (void)recordFloatVectors:metadata:.cold.3()
{
  OUTLINED_FUNCTION_3_1();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (const char *)OUTLINED_FUNCTION_7();
  uint64_t v3 = NSStringFromSelector(v2);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_1DC55E000, v4, v5, "%@: metadata is provided, but method=(%@) not supported", v6, v7, v8, v9, v10);
}

- (void)recordFloatVectors:metadata:.cold.4()
{
  OUTLINED_FUNCTION_3_1();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_7() allKeys];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_1DC55E000, v3, v4, "%@: failed to save floatvector records with invalid metadata (keys: %@)", v5, v6, v7, v8, v9);
}

- (void)recordStrings:metadata:.cold.2()
{
  OUTLINED_FUNCTION_3_1();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (const char *)OUTLINED_FUNCTION_7();
  uint64_t v3 = NSStringFromSelector(v2);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_1DC55E000, v4, v5, "%@: method=(%@) not supported", v6, v7, v8, v9, v10);
}

- (void)recordStrings:metadata:.cold.4()
{
  OUTLINED_FUNCTION_3_1();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_7() allKeys];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_1DC55E000, v3, v4, "%@: failed to save string records with invalid metadata (keys: %@)", v5, v6, v7, v8, v9);
}

- (void)recordWords:.cold.3()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1DC55E000, v0, OS_LOG_TYPE_ERROR, "Missing sequence in %@ - not recording in DB", v1, 0xCu);
}

- (void)recordWords:.cold.4()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1DC55E000, v0, OS_LOG_TYPE_ERROR, "Missing sequenceWithoutPadding in %@ - not recording in DB", v1, 0xCu);
}

- (void)recordWords:(os_log_t)log .cold.6(os_log_t log)
{
  *(_WORD *)SEL v1 = 0;
  _os_log_error_impl(&dword_1DC55E000, log, OS_LOG_TYPE_ERROR, "recordWords with fragment width and count is no longer supported.", v1, 2u);
}

- (void)directUploadRecords:(const char *)a1 forKey:.cold.1(const char *a1)
{
  SEL v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1DC55E000, v2, v3, "%@: unrecognized transport for direct upload, cannot proceed", v4, v5, v6, v7, v8);
}

@end