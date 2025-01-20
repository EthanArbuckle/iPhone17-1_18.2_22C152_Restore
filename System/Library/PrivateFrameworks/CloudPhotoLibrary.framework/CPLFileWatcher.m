@interface CPLFileWatcher
- (CPLFileWatcher)initWithFileURL:(id)a3 delegate:(id)a4 queue:(id)a5;
- (CPLFileWatcher)initWithFileURL:(id)a3 name:(id)a4 ownerIdentifier:(id)a5 delegate:(id)a6 queue:(id)a7;
- (CPLFileWatcherDelegate)delegate;
- (NSString)name;
- (NSString)ownerIdentifier;
- (NSURL)fileURL;
- (id)_redactedPath;
- (id)description;
- (id)redactedDescription;
- (void)_forceRefreshWatchingNode;
- (void)_startWatchingNode;
- (void)_startWatchingParent;
- (void)_stopWatchingNode;
- (void)_stopWatchingParent;
- (void)_updateWatchingNode;
- (void)setDelegate:(id)a3;
- (void)startWatching;
- (void)stopWatching;
@end

@implementation CPLFileWatcher

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_ownerIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_parentSource, 0);
  objc_storeStrong((id *)&self->_nodeSource, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setDelegate:(id)a3
{
}

- (CPLFileWatcherDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CPLFileWatcherDelegate *)WeakRetained;
}

- (NSString)ownerIdentifier
{
  return self->_ownerIdentifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (id)redactedDescription
{
  id v3 = [NSString alloc];
  v4 = [(CPLFileWatcher *)self _redactedPath];
  v5 = (void *)[v3 initWithFormat:@"<%@ '%@' for %@>", v4, self->_name, self->_ownerIdentifier];

  return v5;
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = [(NSURL *)self->_fileURL path];
  v5 = [v4 stringByAbbreviatingWithTildeInPath];
  v6 = (void *)[v3 initWithFormat:@"<%@ '%@' for %@>", v5, self->_name, self->_ownerIdentifier];

  return v6;
}

- (void)stopWatching
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    id v3 = __CPLFileWatcherOSLogDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      ownerIdentifier = self->_ownerIdentifier;
      v5 = [(CPLFileWatcher *)self _redactedPath];
      name = self->_name;
      *(_DWORD *)buf = 138412802;
      v10 = ownerIdentifier;
      __int16 v11 = 2112;
      v12 = v5;
      __int16 v13 = 2112;
      v14 = name;
      _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_DEFAULT, "%@: Stopping watching %@ (%@)", buf, 0x20u);
    }
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__CPLFileWatcher_stopWatching__block_invoke;
  block[3] = &unk_1E60A5DD8;
  block[4] = self;
  dispatch_async(queue, block);
}

void *__30__CPLFileWatcher_stopWatching__block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (result[2])
  {
    [result _stopWatchingNode];
    result = *(void **)(a1 + 32);
  }
  if (result[3])
  {
    return (void *)[result _stopWatchingParent];
  }
  return result;
}

- (void)startWatching
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    id v3 = __CPLFileWatcherOSLogDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      ownerIdentifier = self->_ownerIdentifier;
      v5 = [(CPLFileWatcher *)self _redactedPath];
      name = self->_name;
      *(_DWORD *)buf = 138412802;
      v10 = ownerIdentifier;
      __int16 v11 = 2112;
      v12 = v5;
      __int16 v13 = 2112;
      v14 = name;
      _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_DEFAULT, "%@: Starting watching %@ (%@)", buf, 0x20u);
    }
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__CPLFileWatcher_startWatching__block_invoke;
  block[3] = &unk_1E60A5DD8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __31__CPLFileWatcher_startWatching__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  if (!v2[3] && !v2[2])
  {
    [v2 _startWatchingParent];
    [*(id *)(a1 + 32) _startWatchingNode];
    uint64_t v3 = *(void *)(a1 + 32);
    if (*(void *)(v3 + 16))
    {
      if (!_CPLSilentLogging)
      {
        v4 = __CPLFileWatcherOSLogDomain();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          v5 = [*(id *)(*(void *)(a1 + 32) + 40) path];
          id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
          *(_DWORD *)buf = 138412546;
          v10 = v5;
          __int16 v11 = 2112;
          id v12 = WeakRetained;
          _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEFAULT, "%@ exists at launch time - informing %@", buf, 0x16u);
        }
        uint64_t v3 = *(void *)(a1 + 32);
      }
      id v7 = objc_loadWeakRetained((id *)(v3 + 64));
      [v7 fileWatcherFileDidAppear:*(void *)(a1 + 32)];
    }
    else
    {
      id v8 = objc_loadWeakRetained((id *)(v3 + 64));
      [v8 fileWatcherFileDidDisappear:*(void *)(a1 + 32)];
    }
  }
}

- (void)_stopWatchingParent
{
  parentSource = self->_parentSource;
  if (parentSource)
  {
    dispatch_source_cancel(parentSource);
    v4 = self->_parentSource;
    self->_parentSource = 0;
  }
}

- (void)_startWatchingParent
{
  if (self->_parentSource)
  {
    if (!_CPLSilentLogging)
    {
      v10 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_ERROR, "Parent source should be nil here", buf, 2u);
      }
    }
    __int16 v11 = [MEMORY[0x1E4F28B00] currentHandler];
    id v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLFileWatcher.m"];
    [v11 handleFailureInMethod:a2 object:self file:v12 lineNumber:122 description:@"Parent source should be nil here"];

    abort();
  }
  id v3 = [(NSURL *)self->_fileURL URLByDeletingLastPathComponent];
  unsigned int v4 = open((const char *)[v3 fileSystemRepresentation], 0x8000);

  if ((v4 & 0x80000000) == 0)
  {
    v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F144A8], v4, 2uLL, (dispatch_queue_t)self->_queue);
    parentSource = self->_parentSource;
    self->_parentSource = v5;

    id v7 = self->_parentSource;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __38__CPLFileWatcher__startWatchingParent__block_invoke;
    handler[3] = &unk_1E60A5DD8;
    handler[4] = self;
    dispatch_source_set_event_handler(v7, handler);
    id v8 = self->_parentSource;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __38__CPLFileWatcher__startWatchingParent__block_invoke_18;
    v13[3] = &__block_descriptor_36_e5_v8__0l;
    unsigned int v14 = v4;
    dispatch_source_set_cancel_handler(v8, v13);
    dispatch_resume((dispatch_object_t)self->_parentSource);
  }
}

void __38__CPLFileWatcher__startWatchingParent__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  if (v2[3])
  {
    if (v2[2])
    {
      [v2 _updateWatchingNode];
    }
    else
    {
      [v2 _startWatchingNode];
      uint64_t v3 = *(void *)(a1 + 32);
      if (*(void *)(v3 + 16))
      {
        if (!_CPLSilentLogging)
        {
          unsigned int v4 = __CPLFileWatcherOSLogDomain();
          if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
          {
            v5 = *(void **)(a1 + 32);
            uint64_t v6 = v5[7];
            id v7 = [v5 _redactedPath];
            id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
            int v10 = 138543874;
            uint64_t v11 = v6;
            __int16 v12 = 2114;
            uint64_t v13 = v7;
            __int16 v14 = 2112;
            id v15 = WeakRetained;
            _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ exists now - informing %@", (uint8_t *)&v10, 0x20u);
          }
          uint64_t v3 = *(void *)(a1 + 32);
        }
        id v9 = objc_loadWeakRetained((id *)(v3 + 64));
        [v9 fileWatcherFileDidAppear:*(void *)(a1 + 32)];
      }
    }
  }
}

uint64_t __38__CPLFileWatcher__startWatchingParent__block_invoke_18(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

- (void)_updateWatchingNode
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!self->_nodeSource)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v11 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v16.st_dev) = 0;
        _os_log_impl(&dword_1B4CAC000, v11, OS_LOG_TYPE_ERROR, "Node source should not be nil here", (uint8_t *)&v16, 2u);
      }
    }
    __int16 v12 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLFileWatcher.m"];
    [v12 handleFailureInMethod:a2 object:self file:v13 lineNumber:102 description:@"Node source should not be nil here"];

    abort();
  }
  int v3 = open([(NSURL *)self->_fileURL fileSystemRepresentation], 0x8000);
  if (v3 == -1)
  {
    [(CPLFileWatcher *)self _forceRefreshWatchingNode];
    if (self->_nodeSource && !_CPLSilentLogging)
    {
      id v7 = __CPLFileWatcherOSLogDomain();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        ownerIdentifier = self->_ownerIdentifier;
        id v9 = [(CPLFileWatcher *)self _redactedPath];
        v16.st_dev = 138543618;
        *(void *)&v16.st_mode = ownerIdentifier;
        WORD2(v16.st_ino) = 2114;
        *(__darwin_ino64_t *)((char *)&v16.st_ino + 6) = (__darwin_ino64_t)v9;
        _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ has been deleted but immediately recreated", (uint8_t *)&v16, 0x16u);
      }
    }
  }
  else
  {
    int v4 = v3;
    memset(&v16, 0, sizeof(v16));
    if (fstat(v3, &v16) == -1 || v16.st_ino != self->_nodeInode)
    {
      if (!_CPLSilentLogging)
      {
        v5 = __CPLFileWatcherOSLogDomain();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v6 = [(NSURL *)self->_fileURL path];
          int v14 = 138412290;
          id v15 = v6;
          _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEFAULT, "%@ has changed", (uint8_t *)&v14, 0xCu);
        }
      }
      [(CPLFileWatcher *)self _forceRefreshWatchingNode];
    }
    close(v4);
  }
}

- (void)_stopWatchingNode
{
  nodeSource = self->_nodeSource;
  if (nodeSource)
  {
    dispatch_source_cancel(nodeSource);
    int v4 = self->_nodeSource;
    self->_nodeSource = 0;
  }
}

- (void)_startWatchingNode
{
  if (self->_nodeSource)
  {
    if (!_CPLSilentLogging)
    {
      int v10 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v16.st_dev) = 0;
        _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_ERROR, "Node source should be nil here", (uint8_t *)&v16, 2u);
      }
    }
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    __int16 v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLFileWatcher.m"];
    [v11 handleFailureInMethod:a2 object:self file:v12 lineNumber:64 description:@"Node source should be nil here"];

    abort();
  }
  int v3 = open([(NSURL *)self->_fileURL fileSystemRepresentation], 0x8000);
  if ((v3 & 0x80000000) == 0)
  {
    unsigned int v4 = v3;
    memset(&v16, 0, sizeof(v16));
    if (fstat(v3, &v16) == -1)
    {
      close(v4);
    }
    else
    {
      self->_nodeInode = v16.st_ino;
      v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F144A8], v4, 1uLL, (dispatch_queue_t)self->_queue);
      nodeSource = self->_nodeSource;
      self->_nodeSource = v5;

      id v7 = self->_nodeSource;
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __36__CPLFileWatcher__startWatchingNode__block_invoke;
      handler[3] = &unk_1E60A5DD8;
      handler[4] = self;
      dispatch_source_set_event_handler(v7, handler);
      id v8 = self->_nodeSource;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __36__CPLFileWatcher__startWatchingNode__block_invoke_14;
      v13[3] = &__block_descriptor_36_e5_v8__0l;
      unsigned int v14 = v4;
      dispatch_source_set_cancel_handler(v8, v13);
      dispatch_resume((dispatch_object_t)self->_nodeSource);
    }
  }
}

void __36__CPLFileWatcher__startWatchingNode__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  if (v2[2])
  {
    [v2 _forceRefreshWatchingNode];
    if (*(void *)(*(void *)(a1 + 32) + 16) && _CPLSilentLogging == 0)
    {
      unsigned int v4 = __CPLFileWatcherOSLogDomain();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(void **)(a1 + 32);
        uint64_t v6 = v5[7];
        id v7 = [v5 _redactedPath];
        int v8 = 138543618;
        uint64_t v9 = v6;
        __int16 v10 = 2114;
        uint64_t v11 = v7;
        _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ has been deleted but immediately recreated", (uint8_t *)&v8, 0x16u);
      }
    }
  }
}

uint64_t __36__CPLFileWatcher__startWatchingNode__block_invoke_14(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

- (void)_forceRefreshWatchingNode
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!self->_nodeSource)
  {
    if (!_CPLSilentLogging)
    {
      int v8 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_ERROR, "Node source should not be nil here", (uint8_t *)&v11, 2u);
      }
    }
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    __int16 v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLFileWatcher.m"];
    [v9 handleFailureInMethod:a2 object:self file:v10 lineNumber:52 description:@"Node source should not be nil here"];

    abort();
  }
  [(CPLFileWatcher *)self _stopWatchingNode];
  [(CPLFileWatcher *)self _startWatchingNode];
  if (!self->_nodeSource)
  {
    if (!_CPLSilentLogging)
    {
      int v3 = __CPLFileWatcherOSLogDomain();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v4 = [(NSURL *)self->_fileURL path];
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        int v11 = 138412546;
        uint64_t v12 = v4;
        __int16 v13 = 2112;
        id v14 = WeakRetained;
        _os_log_impl(&dword_1B4CAC000, v3, OS_LOG_TYPE_DEFAULT, "%@ has been deleted - informing %@", (uint8_t *)&v11, 0x16u);
      }
    }
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 fileWatcherFileDidDisappear:self];
  }
}

- (id)_redactedPath
{
  int has_internal_content = os_variant_has_internal_content();
  fileURL = self->_fileURL;
  if (has_internal_content)
  {
    v5 = [(NSURL *)fileURL path];
    id v6 = [v5 stringByAbbreviatingWithTildeInPath];
  }
  else
  {
    id v6 = [(NSURL *)fileURL lastPathComponent];
  }
  return v6;
}

- (CPLFileWatcher)initWithFileURL:(id)a3 delegate:(id)a4 queue:(id)a5
{
  return [(CPLFileWatcher *)self initWithFileURL:a3 name:@"unknown" ownerIdentifier:@"unknown owner" delegate:a4 queue:a5];
}

- (CPLFileWatcher)initWithFileURL:(id)a3 name:(id)a4 ownerIdentifier:(id)a5 delegate:(id)a6 queue:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v25.receiver = self;
  v25.super_class = (Class)CPLFileWatcher;
  uint64_t v17 = [(CPLFileWatcher *)&v25 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    fileURL = v17->_fileURL;
    v17->_fileURL = (NSURL *)v18;

    objc_storeWeak((id *)&v17->_delegate, v15);
    objc_storeStrong((id *)&v17->_queue, a7);
    uint64_t v20 = [v13 copy];
    name = v17->_name;
    v17->_name = (NSString *)v20;

    uint64_t v22 = [v14 copy];
    ownerIdentifier = v17->_ownerIdentifier;
    v17->_ownerIdentifier = (NSString *)v22;
  }
  return v17;
}

@end