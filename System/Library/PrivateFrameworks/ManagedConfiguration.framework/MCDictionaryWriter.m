@interface MCDictionaryWriter
- (BOOL)didWriteSucceed;
- (BOOL)repairAccessIfNecessaryWithError:(id *)a3;
- (BOOL)write;
- (BOOL)writeData:(id)a3 error:(id *)a4;
- (MCDictionaryWriter)initWithDictionary:(id)a3 path:(id)a4;
- (MCFileAccessRepairTool)repairTool;
- (NSDictionary)dictionary;
- (NSError)afterWriteRepairError;
- (NSError)beforeWriteRepairError;
- (NSError)serializeError;
- (NSError)writeError;
- (NSString)path;
- (id)createRepairTool;
- (id)serializedData;
- (void)logResultOfWrite;
- (void)logStartOfWrite;
- (void)reset;
- (void)serializeDataAndWriteToStorage;
- (void)setAfterWriteRepairError:(id)a3;
- (void)setBeforeWriteRepairError:(id)a3;
- (void)setRepairTool:(id)a3;
- (void)setSerializeError:(id)a3;
- (void)setWriteError:(id)a3;
@end

@implementation MCDictionaryWriter

- (void)logResultOfWrite
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = [(MCDictionaryWriter *)self serializeError];

  if (v3)
  {
    v4 = (void *)qword_1EB2223C0;
    if (!os_log_type_enabled((os_log_t)qword_1EB2223C0, OS_LOG_TYPE_ERROR)) {
      return;
    }
    v5 = v4;
    v6 = [(MCDictionaryWriter *)self path];
    v7 = [(MCDictionaryWriter *)self serializeError];
    int v19 = 138543618;
    v20 = v6;
    __int16 v21 = 2114;
    v22 = v7;
    v8 = "Dictionary could not be written to %{public}@, could not serialize data: %{public}@";
    goto LABEL_4;
  }
  v9 = [(MCDictionaryWriter *)self beforeWriteRepairError];

  v10 = [(MCDictionaryWriter *)self writeError];

  if (!v9)
  {
    if (v10)
    {
      v15 = (void *)qword_1EB2223C0;
      if (!os_log_type_enabled((os_log_t)qword_1EB2223C0, OS_LOG_TYPE_ERROR)) {
        return;
      }
      v5 = v15;
      v6 = [(MCDictionaryWriter *)self path];
      v7 = [(MCDictionaryWriter *)self writeError];
      int v19 = 138543618;
      v20 = v6;
      __int16 v21 = 2114;
      v22 = v7;
      v8 = "Dictionary could not be written to %{public}@, could not write data: %{public}@";
    }
    else
    {
      v16 = [(MCDictionaryWriter *)self afterWriteRepairError];

      v17 = (void *)qword_1EB2223C0;
      if (!v16)
      {
        if (os_log_type_enabled((os_log_t)qword_1EB2223C0, OS_LOG_TYPE_DEFAULT))
        {
          v5 = v17;
          v18 = [(MCDictionaryWriter *)self path];
          int v19 = 138543362;
          v20 = v18;
          _os_log_impl(&dword_1A13F0000, v5, OS_LOG_TYPE_DEFAULT, "Dictionary successfully written to %{public}@", (uint8_t *)&v19, 0xCu);

          goto LABEL_6;
        }
        return;
      }
      if (!os_log_type_enabled((os_log_t)qword_1EB2223C0, OS_LOG_TYPE_ERROR)) {
        return;
      }
      v5 = v17;
      v6 = [(MCDictionaryWriter *)self path];
      v7 = [(MCDictionaryWriter *)self afterWriteRepairError];
      int v19 = 138543618;
      v20 = v6;
      __int16 v21 = 2114;
      v22 = v7;
      v8 = "Dictionary successfully written to %{public}@, could not make file readable after write: %{public}@";
    }
LABEL_4:
    _os_log_impl(&dword_1A13F0000, v5, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v19, 0x16u);

LABEL_5:
LABEL_6:

    return;
  }
  v11 = (void *)qword_1EB2223C0;
  BOOL v12 = os_log_type_enabled((os_log_t)qword_1EB2223C0, OS_LOG_TYPE_ERROR);
  if (!v10)
  {
    if (!v12) {
      return;
    }
    v5 = v11;
    v6 = [(MCDictionaryWriter *)self path];
    v7 = [(MCDictionaryWriter *)self beforeWriteRepairError];
    int v19 = 138543618;
    v20 = v6;
    __int16 v21 = 2114;
    v22 = v7;
    v8 = "Dictionary successfully written to %{public}@, but there was a problem repairing the file before writing: %{public}@";
    goto LABEL_4;
  }
  if (v12)
  {
    v5 = v11;
    v6 = [(MCDictionaryWriter *)self path];
    v13 = [(MCDictionaryWriter *)self beforeWriteRepairError];
    v14 = [(MCDictionaryWriter *)self writeError];
    int v19 = 138543874;
    v20 = v6;
    __int16 v21 = 2114;
    v22 = v13;
    __int16 v23 = 2114;
    v24 = v14;
    _os_log_impl(&dword_1A13F0000, v5, OS_LOG_TYPE_ERROR, "Dictionary could not be written to %{public}@, file could not be repaired before writing: %{public}@ and could not write data: %{public}@", (uint8_t *)&v19, 0x20u);

    goto LABEL_5;
  }
}

- (MCDictionaryWriter)initWithDictionary:(id)a3 path:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MCDictionaryWriter;
  v9 = [(MCDictionaryWriter *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dictionary, a3);
    uint64_t v11 = [v8 copy];
    path = v10->_path;
    v10->_path = (NSString *)v11;

    repairTool = v10->_repairTool;
    v10->_repairTool = 0;

    [(MCDictionaryWriter *)v10 reset];
  }

  return v10;
}

- (BOOL)write
{
  [(MCDictionaryWriter *)self reset];
  [(MCDictionaryWriter *)self logStartOfWrite];
  [(MCDictionaryWriter *)self serializeDataAndWriteToStorage];
  [(MCDictionaryWriter *)self logResultOfWrite];
  return [(MCDictionaryWriter *)self didWriteSucceed];
}

- (void)reset
{
  serializeError = self->_serializeError;
  self->_serializeError = 0;

  writeError = self->_writeError;
  self->_writeError = 0;

  beforeWriteRepairError = self->_beforeWriteRepairError;
  self->_beforeWriteRepairError = 0;

  afterWriteRepairError = self->_afterWriteRepairError;
  self->_afterWriteRepairError = 0;
}

- (void)logStartOfWrite
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = (void *)qword_1EB2223C0;
  if (os_log_type_enabled((os_log_t)qword_1EB2223C0, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    v5 = [(MCDictionaryWriter *)self dictionary];
    uint64_t v6 = [v5 count];
    id v7 = [(MCDictionaryWriter *)self path];
    int v8 = 134218242;
    uint64_t v9 = v6;
    __int16 v10 = 2114;
    uint64_t v11 = v7;
    _os_log_impl(&dword_1A13F0000, v4, OS_LOG_TYPE_DEFAULT, "Attempting to write dictionary with %lu entries to path %{public}@...", (uint8_t *)&v8, 0x16u);
  }
}

- (id)serializedData
{
  v3 = (void *)MEMORY[0x1E4F28F98];
  v4 = [(MCDictionaryWriter *)self dictionary];
  id v8 = 0;
  v5 = [v3 dataWithPropertyList:v4 format:200 options:0 error:&v8];
  id v6 = v8;

  if (!v5) {
    [(MCDictionaryWriter *)self setSerializeError:v6];
  }

  return v5;
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (void)serializeDataAndWriteToStorage
{
  v3 = [(MCDictionaryWriter *)self serializedData];
  if (v3)
  {
    id v12 = 0;
    BOOL v4 = [(MCDictionaryWriter *)self repairAccessIfNecessaryWithError:&v12];
    id v5 = v12;
    if (!v4) {
      [(MCDictionaryWriter *)self setBeforeWriteRepairError:v5];
    }
    id v11 = 0;
    BOOL v6 = [(MCDictionaryWriter *)self writeData:v3 error:&v11];
    id v7 = v11;
    if (v6)
    {
      id v10 = 0;
      BOOL v8 = [(MCDictionaryWriter *)self repairAccessIfNecessaryWithError:&v10];
      id v9 = v10;
      if (!v8) {
        [(MCDictionaryWriter *)self setAfterWriteRepairError:v9];
      }
    }
    else
    {
      [(MCDictionaryWriter *)self setWriteError:v7];
    }
  }
}

- (BOOL)repairAccessIfNecessaryWithError:(id *)a3
{
  id v5 = [(MCDictionaryWriter *)self repairTool];
  BOOL v6 = [(MCDictionaryWriter *)self path];
  int v7 = [v5 fileNeedsRepairAtPath:v6];

  if (!v7) {
    return 1;
  }
  BOOL v8 = [(MCDictionaryWriter *)self repairTool];
  id v9 = [(MCDictionaryWriter *)self path];
  id v13 = 0;
  char v10 = [v8 repairFileAtPath:v9 error:&v13];
  id v11 = v13;

  if (a3 && (v10 & 1) == 0) {
    *a3 = v11;
  }

  return v10;
}

- (NSString)path
{
  return self->_path;
}

- (MCFileAccessRepairTool)repairTool
{
  repairTool = self->_repairTool;
  if (!repairTool)
  {
    BOOL v4 = [(MCDictionaryWriter *)self createRepairTool];
    id v5 = self->_repairTool;
    self->_repairTool = v4;

    repairTool = self->_repairTool;
  }
  return repairTool;
}

- (BOOL)writeData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int v7 = [(MCDictionaryWriter *)self path];
  id v11 = 0;
  char v8 = [v6 writeToFile:v7 options:1 error:&v11];

  id v9 = v11;
  if (a4 && (v8 & 1) == 0) {
    *a4 = v9;
  }

  return v8;
}

- (id)createRepairTool
{
  v2 = objc_opt_new();
  return v2;
}

- (BOOL)didWriteSucceed
{
  v3 = [(MCDictionaryWriter *)self serializeError];
  if (v3)
  {
    BOOL v4 = 0;
  }
  else
  {
    id v5 = [(MCDictionaryWriter *)self writeError];
    if (v5)
    {
      BOOL v4 = 0;
    }
    else
    {
      id v6 = [(MCDictionaryWriter *)self afterWriteRepairError];
      BOOL v4 = v6 == 0;
    }
  }

  return v4;
}

- (NSError)writeError
{
  return self->_writeError;
}

- (NSError)serializeError
{
  return self->_serializeError;
}

- (NSError)afterWriteRepairError
{
  return self->_afterWriteRepairError;
}

- (NSError)beforeWriteRepairError
{
  return self->_beforeWriteRepairError;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_afterWriteRepairError, 0);
  objc_storeStrong((id *)&self->_beforeWriteRepairError, 0);
  objc_storeStrong((id *)&self->_writeError, 0);
  objc_storeStrong((id *)&self->_serializeError, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong((id *)&self->_repairTool, 0);
}

- (void)setRepairTool:(id)a3
{
}

- (void)setSerializeError:(id)a3
{
}

- (void)setWriteError:(id)a3
{
}

- (void)setBeforeWriteRepairError:(id)a3
{
}

- (void)setAfterWriteRepairError:(id)a3
{
}

@end