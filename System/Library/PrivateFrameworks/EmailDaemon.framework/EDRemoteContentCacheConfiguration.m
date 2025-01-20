@interface EDRemoteContentCacheConfiguration
- (EDRemoteContentCacheConfiguration)initWithBaseURL:(id)a3 diskCapacity:(unint64_t)a4;
- (NSURL)cacheURL;
- (id)_cacheURLWithBaseURL:(id)a3;
- (unint64_t)diskCapacity;
@end

@implementation EDRemoteContentCacheConfiguration

- (unint64_t)diskCapacity
{
  return self->_diskCapacity;
}

- (NSURL)cacheURL
{
  return self->_cacheURL;
}

void ___ef_log_EDRemoteContentCacheConfiguration_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.email", "EDRemoteContentCacheConfiguration");
  v1 = (void *)_ef_log_EDRemoteContentCacheConfiguration_log;
  _ef_log_EDRemoteContentCacheConfiguration_log = (uint64_t)v0;
}

- (EDRemoteContentCacheConfiguration)initWithBaseURL:(id)a3 diskCapacity:(unint64_t)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)EDRemoteContentCacheConfiguration;
  v7 = [(EDRemoteContentCacheConfiguration *)&v12 init];
  v8 = v7;
  if (v7)
  {
    uint64_t v9 = [(EDRemoteContentCacheConfiguration *)v7 _cacheURLWithBaseURL:v6];
    cacheURL = v8->_cacheURL;
    v8->_cacheURL = (NSURL *)v9;

    v8->_diskCapacity = a4;
  }

  return v8;
}

- (id)_cacheURLWithBaseURL:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  v3 = [a3 URLByAppendingPathComponent:@"RemoteContentURLCache" isDirectory:1];
  v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v17 = *MEMORY[0x1E4F28370];
  v18[0] = *MEMORY[0x1E4F28358];
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
  id v15 = 0;
  char v6 = [v4 createDirectoryAtURL:v3 withIntermediateDirectories:1 attributes:v5 error:&v15];
  id v7 = v15;
  v8 = v7;
  if ((v6 & 1) == 0)
  {
    uint64_t v9 = [v7 domain];
    v10 = v9;
    if (v9 == (void *)*MEMORY[0x1E4F281F8])
    {
      BOOL v11 = [v8 code] == 516;

      if (v11) {
        goto LABEL_8;
      }
    }
    else
    {
    }
    _ef_log_EDRemoteContentCacheConfiguration();
    objc_super v12 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = objc_msgSend(v8, "ef_publicDescription");
      [(EDRemoteContentCacheConfiguration *)v13 _cacheURLWithBaseURL:v12];
    }
  }
LABEL_8:

  return v3;
}

- (void).cxx_destruct
{
}

- (void)_cacheURLWithBaseURL:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Failed to create URL Cache directory:\n%{public}@", buf, 0xCu);
}

@end