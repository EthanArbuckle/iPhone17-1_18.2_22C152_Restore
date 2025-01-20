@interface _HKZipArchiveEntry
+ (BOOL)_assignReadError:(id *)a3 archive:(archive *)a4;
- (BOOL)_enumerateLinesInCurrentEntryWithError:(id *)a3 block:(id)a4;
- (BOOL)_isExtractorStateValidWithError:(id *)a3;
- (BOOL)didReadEntryData;
- (BOOL)enumerateLinesWithError:(id *)a3 block:(id)a4;
- (NSString)pathname;
- (_HKZipArchiveEntry)initWithExtractor:(id)a3 currentEntry:(archive_entry *)a4 pathname:(id)a5;
- (id)_getDataWithBufferingWithMaxSizeBytes:(unint64_t)a3 error:(id *)a4;
- (id)_getDataWithSize:(unint64_t)a3 error:(id *)a4;
- (id)dataWithError:(id *)a3;
- (id)dataWithMaxSizeBytes:(unint64_t)a3 error:(id *)a4;
@end

@implementation _HKZipArchiveEntry

- (_HKZipArchiveEntry)initWithExtractor:(id)a3 currentEntry:(archive_entry *)a4 pathname:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)_HKZipArchiveEntry;
  v10 = [(_HKZipArchiveEntry *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_extractor, v8);
    v11->_entry = a4;
    objc_storeStrong((id *)&v11->_pathname, a5);
    v11->_enumerationCount = [v8 enumerationCount];
  }

  return v11;
}

- (id)dataWithError:(id *)a3
{
  return [(_HKZipArchiveEntry *)self dataWithMaxSizeBytes:0 error:a3];
}

- (id)dataWithMaxSizeBytes:(unint64_t)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (![(_HKZipArchiveEntry *)self _isExtractorStateValidWithError:a4])
  {
    v10 = 0;
    goto LABEL_17;
  }
  if (!self->_didReadEntryData)
  {
    data = self->_data;
    self->_data = 0;

    if (archive_entry_size_is_set())
    {
      unint64_t v8 = archive_entry_size();
      if (v8)
      {
        if (a3 && v8 > a3)
        {
          objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 11, @"Entry size %ld is larger than specified max size %ld", v8, a3);
          id v9 = self->_data;
          self->_data = 0;
        }
        else
        {
          v14 = [(_HKZipArchiveEntry *)self _getDataWithSize:v8 error:a4];
          id v9 = self->_data;
          self->_data = v14;
        }

        goto LABEL_15;
      }
      _HKInitializeLogging();
      v11 = HKLogInfrastructure();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446210;
        uint64_t v17 = archive_entry_pathname();
        _os_log_impl(&dword_19C023000, v11, OS_LOG_TYPE_DEFAULT, "archive entry data zero bytes: %{public}s", buf, 0xCu);
      }
    }
    v12 = [(_HKZipArchiveEntry *)self _getDataWithBufferingWithMaxSizeBytes:a3 error:a4];
    objc_super v13 = self->_data;
    self->_data = v12;

LABEL_15:
    self->_didReadEntryData = 1;
  }
  v10 = self->_data;
LABEL_17:

  return v10;
}

- (BOOL)enumerateLinesWithError:(id *)a3 block:(id)a4
{
  id v7 = a4;
  if (![(_HKZipArchiveEntry *)self _isExtractorStateValidWithError:a3]) {
    goto LABEL_16;
  }
  if (self->_didReadEntryData)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"self", objc_opt_class(), a2, @"Data has already been read for this entry");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    id v9 = v8;
    if (v8)
    {
      if (a3)
      {
        id v10 = v8;
LABEL_14:
        *a3 = v10;
        goto LABEL_15;
      }
      _HKLogDroppedError(v8);
    }
LABEL_15:

LABEL_16:
    BOOL v14 = 0;
    goto LABEL_17;
  }
  data = self->_data;
  self->_data = 0;

  self->_didReadEntryData = 1;
  id v16 = 0;
  BOOL v12 = [(_HKZipArchiveEntry *)self _enumerateLinesInCurrentEntryWithError:&v16 block:v7];
  id v13 = v16;
  if (!v12)
  {
    if (v13)
    {
      id v9 = v13;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 122, @"Archive entry line enumeration failed without setting an error");
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      if (!v9) {
        goto LABEL_15;
      }
    }
    if (!a3)
    {
      _HKLogDroppedError(v9);
      goto LABEL_15;
    }
    id v10 = v9;
    id v9 = v10;
    goto LABEL_14;
  }

  BOOL v14 = 1;
LABEL_17:

  return v14;
}

- (BOOL)_isExtractorStateValidWithError:(id *)a3
{
  p_extractor = &self->_extractor;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_extractor);
  if ([WeakRetained archive])
  {
    id v7 = objc_loadWeakRetained((id *)p_extractor);
    uint64_t v8 = [v7 enumerationCount];
    int64_t enumerationCount = self->_enumerationCount;

    if (v8 == enumerationCount) {
      return 1;
    }
  }
  else
  {
  }
  v11 = (void *)MEMORY[0x1E4F28C58];
  BOOL v12 = NSStringFromSelector(sel_enumerateEntriesWithError_block_);
  objc_msgSend(v11, "hk_assignError:code:format:", a3, 119, @"%@ is invalid outside of '%@' block", self, v12);

  return 0;
}

- (id)_getDataWithSize:(unint64_t)a3 error:(id *)a4
{
  id v7 = malloc_type_malloc(a3, 0xA5B5F056uLL);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_extractor);
  uint64_t v9 = [WeakRetained archive];

  if (archive_read_data() < 0)
  {
    [(id)objc_opt_class() _assignReadError:a4 archive:v9];
    free(v7);
    id v10 = 0;
  }
  else
  {
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v7 length:a3 freeWhenDone:1];
  }

  return v10;
}

- (id)_getDataWithBufferingWithMaxSizeBytes:(unint64_t)a3 error:(id *)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_extractor);
  uint64_t v7 = [WeakRetained archive];

  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  uint64_t data = archive_read_data();
  if (data < 1)
  {
LABEL_6:
    if (data < 0)
    {
      [(id)objc_opt_class() _assignReadError:a4 archive:v7];
      v11 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    unint64_t v10 = 0;
    while (1)
    {
      v10 += data;
      if (a3)
      {
        if (v10 > a3) {
          break;
        }
      }
      objc_msgSend(v8, "appendBytes:length:", v13);
      uint64_t data = archive_read_data();
      if (data <= 0) {
        goto LABEL_6;
      }
    }

    id v8 = 0;
  }
  id v8 = v8;
  v11 = v8;
LABEL_10:

  return v11;
}

- (BOOL)_enumerateLinesInCurrentEntryWithError:(id *)a3 block:(id)a4
{
  p_extractor = &self->_extractor;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_extractor);
  uint64_t v9 = [WeakRetained archive];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67___HKZipArchiveEntry__enumerateLinesInCurrentEntryWithError_block___block_invoke;
  v11[3] = &unk_1E58BF1F0;
  v11[4] = self;
  v11[5] = v9;
  LOBYTE(a3) = +[HKLineEnumerator enumerateUTF8LinesWithError:a3 dataProvider:v11 lineHandler:v7];

  return (char)a3;
}

+ (BOOL)_assignReadError:(id *)a3 archive:(archive *)a4
{
  return 1;
}

- (NSString)pathname
{
  return self->_pathname;
}

- (BOOL)didReadEntryData
{
  return self->_didReadEntryData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathname, 0);
  objc_storeStrong((id *)&self->_data, 0);

  objc_destroyWeak((id *)&self->_extractor);
}

- (void)dataWithMaxSizeBytes:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19C023000, a2, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v2, 0xCu);
}

@end