@interface _HDOntologyShardDownloadTask
- (BOOL)_handleResponse:(id)a3 task:(id)a4;
- (NSError)error;
- (_HDOntologyShardDownloadTask)init;
- (id)initForEntry:(id)a3 downloader:(id)a4 session:(id)a5 group:(id)a6;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)resume;
- (void)setError:(id)a3;
@end

@implementation _HDOntologyShardDownloadTask

- (_HDOntologyShardDownloadTask)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (id)initForEntry:(id)a3 downloader:(id)a4 session:(id)a5 group:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)_HDOntologyShardDownloadTask;
  v15 = [(_HDOntologyShardDownloadTask *)&v19 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_entry, a3);
    objc_storeStrong((id *)&v16->_downloader, a4);
    objc_storeStrong((id *)&v16->_session, a5);
    objc_storeStrong((id *)&v16->_group, a6);
    error = v16->_error;
    v16->_error = 0;
  }
  return v16;
}

- (void)resume
{
  v3 = (void *)MEMORY[0x1E4F18DA8];
  uint64_t v4 = [(HKOntologyShardRegistryEntry *)self->_entry availableURL];
  id v6 = [v3 requestWithURL:v4];

  v5 = [(NSURLSession *)self->_session downloadTaskWithRequest:v6];
  [v5 setDelegate:self];
  dispatch_group_enter((dispatch_group_t)self->_group);
  [v5 resume];
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = a4;
  v9 = [v8 response];
  BOOL v10 = [(_HDOntologyShardDownloadTask *)self _handleResponse:v9 task:v8];

  if (v10)
  {
    id v11 = [(HDOntologyShardDownloader *)self->_downloader updateCoordinator];
    id v12 = [v11 shardRegistry];

    entry = self->_entry;
    id v28 = 0;
    char v14 = [v12 stageShardFileWithLocalURL:v7 entry:entry error:&v28];
    v15 = (NSError *)v28;
    if (v14)
    {
      v16 = (void *)[(HKOntologyShardRegistryEntry *)self->_entry copyWithAvailableState:2];
      downloader = self->_downloader;
      v29 = v16;
      v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
      id v27 = 0;
      char v19 = -[HDOntologyShardDownloader _persistStagedEntries:error:]((uint64_t)downloader, v18, (uint64_t)&v27);
      v20 = (NSError *)v27;

      if ((v19 & 1) == 0)
      {
        _HKInitializeLogging();
        v21 = HKLogHealthOntology();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          v31 = self;
          __int16 v32 = 2114;
          v33 = (HKOntologyShardRegistryEntry *)v16;
          __int16 v34 = 2114;
          v35 = v20;
          _os_log_error_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_ERROR, "%{public}@: Failed to insert updated entry %{public}@: %{public}@", buf, 0x20u);
        }

        v22 = (NSError *)[(NSError *)v20 copy];
        error = self->_error;
        self->_error = v22;
      }
    }
    else
    {
      _HKInitializeLogging();
      v24 = HKLogHealthOntology();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v26 = self->_entry;
        *(_DWORD *)buf = 138543874;
        v31 = self;
        __int16 v32 = 2114;
        v33 = v26;
        __int16 v34 = 2114;
        v35 = v15;
        _os_log_error_impl(&dword_1BCB7D000, v24, OS_LOG_TYPE_ERROR, "%{public}@: Failed to stage shard file for entry %{public}@: %{public}@", buf, 0x20u);
      }

      v25 = (NSError *)[(NSError *)v15 copy];
      v20 = self->_error;
      self->_error = v25;
    }
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  if (v8)
  {
    _HKInitializeLogging();
    v9 = HKLogHealthOntology();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138543618;
      char v14 = self;
      __int16 v15 = 2114;
      id v16 = v8;
      _os_log_error_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch shard file with error: %{public}@", (uint8_t *)&v13, 0x16u);
    }

    BOOL v10 = (NSError *)[v8 copy];
    error = self->_error;
    self->_error = v10;
  }
  else
  {
    id v12 = [v7 response];
    [(_HDOntologyShardDownloadTask *)self _handleResponse:v12 task:v7];
  }
  dispatch_group_leave((dispatch_group_t)self->_group);
}

- (BOOL)_handleResponse:(id)a3 task:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 statusCode];
  unint64_t v9 = v8 - 200;
  if ((unint64_t)(v8 - 200) >= 0x64)
  {
    uint64_t v10 = v8;
    _HKInitializeLogging();
    id v11 = HKLogHealthOntology();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = [MEMORY[0x1E4F18D40] localizedStringForStatusCode:v10];
      int v18 = 138543874;
      char v19 = self;
      __int16 v20 = 2048;
      uint64_t v21 = v10;
      __int16 v22 = 2114;
      v23 = v17;
      _os_log_error_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch shard file with status code %ld, %{public}@", (uint8_t *)&v18, 0x20u);
    }
    id v12 = (void *)MEMORY[0x1E4F28C58];
    int v13 = [v7 currentRequest];
    objc_msgSend(v12, "hk_HTTPErrorRepresentingResponse:request:", v6, v13);
    char v14 = (NSError *)objc_claimAutoreleasedReturnValue();
    error = self->_error;
    self->_error = v14;
  }
  return v9 < 0x64;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_downloader, 0);

  objc_storeStrong((id *)&self->_entry, 0);
}

@end