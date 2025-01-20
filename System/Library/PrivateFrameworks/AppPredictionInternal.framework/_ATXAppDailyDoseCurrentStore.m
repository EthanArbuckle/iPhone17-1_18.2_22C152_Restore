@interface _ATXAppDailyDoseCurrentStore
- (BOOL)isExpiredAt:(id)a3;
- (BOOL)isExpiredNow;
- (_ATXAppDailyDoseCurrentStore)initWithPath:(id)a3;
- (double)currentDoseFor:(id)a3;
- (id)_getCacheFromFile;
- (void)_openFd;
- (void)_overwrite;
- (void)_readCacheAndExpiration;
- (void)closePermanently;
- (void)dealloc;
- (void)increaseDoseFor:(id)a3 by:(double)a4;
- (void)resetWithDurationMap:(id)a3 on:(id)a4;
@end

@implementation _ATXAppDailyDoseCurrentStore

- (_ATXAppDailyDoseCurrentStore)initWithPath:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_ATXAppDailyDoseCurrentStore;
  v6 = [(_ATXAppDailyDoseCurrentStore *)&v14 init];
  if (v6)
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    id v8 = objc_claimAutoreleasedReturnValue();
    v9 = (const char *)[v8 UTF8String];
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create(v9, v10);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v11;

    objc_storeStrong((id *)&v6->_path, a3);
    [(_ATXAppDailyDoseCurrentStore *)v6 _openFd];
  }

  return v6;
}

- (void)_openFd
{
}

- (void)dealloc
{
  [(_ATXAppDailyDoseCurrentStore *)self closePermanently];
  v3.receiver = self;
  v3.super_class = (Class)_ATXAppDailyDoseCurrentStore;
  [(_ATXAppDailyDoseCurrentStore *)&v3 dealloc];
}

- (void)closePermanently
{
  p_fd = &self->_fd;
  unsigned int v3 = atomic_load((unsigned int *)&self->_fd);
  int v4 = v3;
  atomic_compare_exchange_strong(p_fd, (unsigned int *)&v4, 0xFFFFFFFF);
  if (v4 == v3 && (v4 & 0x80000000) == 0) {
    close(v4);
  }
}

- (void)_overwrite
{
  v25[3] = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  unsigned int v3 = (void *)MEMORY[0x1D25F6CC0]();
  v25[0] = &unk_1F27F0CC0;
  v24[0] = @"version";
  v24[1] = @"expires";
  int v4 = NSNumber;
  [(NSDate *)self->_expires timeIntervalSinceReferenceDate];
  id v5 = objc_msgSend(v4, "numberWithDouble:");
  v24[2] = @"doses";
  cache = self->_cache;
  v25[1] = v5;
  v25[2] = cache;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:3];

  id v21 = 0;
  id v8 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v7 options:0 error:&v21];
  id v9 = v21;
  if (!v8)
  {
    objc_super v14 = __atxlog_handle_default();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23[0] = v9;
      v18 = "Could not serialize daily dose: %@";
      v19 = v14;
      uint32_t v20 = 12;
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_9;
  }
  p_fd = &self->_fd;
  int v11 = atomic_load((unsigned int *)p_fd);
  ftruncate(v11, 0);
  LODWORD(p_fd) = atomic_load((unsigned int *)p_fd);
  id v12 = v8;
  ssize_t v13 = pwrite((int)p_fd, (const void *)[v12 bytes], objc_msgSend(v12, "length"), 0);
  if (v13 != [v12 length])
  {
    objc_super v14 = __atxlog_handle_default();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = *__error();
      v16 = __error();
      v17 = strerror(*v16);
      *(_DWORD *)buf = 67109378;
      LODWORD(v23[0]) = v15;
      WORD2(v23[0]) = 2080;
      *(void *)((char *)v23 + 6) = v17;
      v18 = "Could not write daily dose (errno=%i): %s";
      v19 = v14;
      uint32_t v20 = 18;
LABEL_7:
      _os_log_impl(&dword_1D0FA3000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
LABEL_9:
}

- (void)_readCacheAndExpiration
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  unsigned int v3 = (void *)MEMORY[0x1D25F6CC0]();
  cache = self->_cache;
  self->_cache = 0;

  expires = self->_expires;
  self->_expires = 0;

  unsigned int v6 = atomic_load((unsigned int *)&self->_fd);
  if ((v6 & 0x80000000) != 0) {
    goto LABEL_10;
  }
  int v7 = atomic_load((unsigned int *)&self->_fd);
  id v8 = readWholeFile(v7, 0);
  if (!v8)
  {
    int v9 = atomic_load((unsigned int *)&self->_fd);
    close(v9);
    [(_ATXAppDailyDoseCurrentStore *)self _openFd];
    int v10 = atomic_load((unsigned int *)&self->_fd);
    id v8 = readWholeFile(v10, 1);
    if (!v8)
    {
LABEL_10:
      id v12 = __atxlog_handle_default();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = *__error();
        *(_DWORD *)buf = 67109120;
        LODWORD(v30) = v21;
        _os_log_impl(&dword_1D0FA3000, v12, OS_LOG_TYPE_DEFAULT, "Could not read daily dose (errno=%i)", buf, 8u);
      }
      id v8 = 0;
      goto LABEL_17;
    }
  }
  if ([v8 length])
  {
    id v28 = 0;
    int v11 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v8 options:1 error:&v28];
    id v12 = v28;
    if (v11)
    {
      ssize_t v13 = [v11 objectForKeyedSubscript:@"version"];
      uint64_t v14 = [v13 integerValue];

      if (v14 != 1)
      {
LABEL_16:

LABEL_17:
        goto LABEL_18;
      }
      int v15 = [v11 objectForKeyedSubscript:@"doses"];
      v16 = self->_cache;
      self->_cache = v15;

      v17 = [v11 objectForKeyedSubscript:@"expires"];
      p_super = &v17->super;
      if (v17)
      {
        v19 = (void *)MEMORY[0x1E4F1C9C8];
        [(NSDate *)v17 doubleValue];
        objc_msgSend(v19, "dateWithTimeIntervalSinceReferenceDate:");
        v17 = (NSDate *)objc_claimAutoreleasedReturnValue();
      }
      uint32_t v20 = self->_expires;
      self->_expires = v17;
    }
    else
    {
      p_super = __atxlog_handle_default();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v12;
        _os_log_impl(&dword_1D0FA3000, p_super, OS_LOG_TYPE_DEFAULT, "Could not parse daily dose: %@", buf, 0xCu);
      }
    }

    goto LABEL_16;
  }
LABEL_18:
  if (!self->_cache
    || (v22 = self->_expires) == 0
    || ([(NSDate *)v22 timeIntervalSinceNow], v23 < 0.0))
  {
    v24 = (NSMutableDictionary *)objc_opt_new();
    v25 = self->_cache;
    self->_cache = v24;

    v26 = [MEMORY[0x1E4F1C9C8] distantPast];
    v27 = self->_expires;
    self->_expires = v26;
  }
}

- (id)_getCacheFromFile
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  cache = self->_cache;
  if (!cache)
  {
    [(_ATXAppDailyDoseCurrentStore *)self _readCacheAndExpiration];
    cache = self->_cache;
  }
  return cache;
}

- (BOOL)isExpiredAt:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44___ATXAppDailyDoseCurrentStore_isExpiredAt___block_invoke;
  block[3] = &unk_1E68AFB40;
  id v9 = v4;
  int v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

- (BOOL)isExpiredNow
{
  unsigned int v3 = objc_opt_new();
  LOBYTE(self) = [(_ATXAppDailyDoseCurrentStore *)self isExpiredAt:v3];

  return (char)self;
}

- (void)resetWithDurationMap:(id)a3 on:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56___ATXAppDailyDoseCurrentStore_resetWithDurationMap_on___block_invoke;
  block[3] = &unk_1E68AC320;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

- (double)currentDoseFor:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = (double *)&v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47___ATXAppDailyDoseCurrentStore_currentDoseFor___block_invoke;
  block[3] = &unk_1E68AF258;
  id v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  double v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)increaseDoseFor:(id)a3 by:(double)a4
{
  id v7 = a3;
  sel_getName(a2);
  id v8 = (void *)os_transaction_create();
  queue = self->_queue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51___ATXAppDailyDoseCurrentStore_increaseDoseFor_by___block_invoke;
  v12[3] = &unk_1E68AE970;
  v12[4] = self;
  id v13 = v7;
  double v15 = a4;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_sync(queue, v12);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expires, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end