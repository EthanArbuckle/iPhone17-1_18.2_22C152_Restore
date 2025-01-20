@interface IDSServerBagCacheLoader
- (BOOL)loadedNotification;
- (BOOL)postingNotification;
- (CUTDeferredTaskQueue)handleExternalLoadTaskQueue;
- (IDSServerBagCacheLoader)initWithConfig:(id)a3 queue:(id)a4;
- (IDSServerBagConfig)config;
- (OS_dispatch_queue)queue;
- (id)cacheDidReloadBlock;
- (id)clearOverrideValues;
- (id)loadFromCacheWithError:(id *)a3;
- (id)loadOverrideValuesIfPresent;
- (id)writeOverrideValues:(id)a3;
- (id)writeRawContents:(id)a3;
- (void)dealloc;
- (void)setCacheDidReloadBlock:(id)a3;
- (void)setConfig:(id)a3;
- (void)setHandleExternalLoadTaskQueue:(id)a3;
- (void)setLoadedNotification:(BOOL)a3;
- (void)setPostingNotification:(BOOL)a3;
- (void)setQueue:(id)a3;
@end

@implementation IDSServerBagCacheLoader

- (void)setCacheDidReloadBlock:(id)a3
{
}

- (IDSServerBagCacheLoader)initWithConfig:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    v18.receiver = self;
    v18.super_class = (Class)IDSServerBagCacheLoader;
    v9 = [(IDSServerBagCacheLoader *)&v18 init];
    v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_config, a3);
      objc_storeStrong((id *)&v10->_queue, a4);
      v10->_loadedNotification = 0;
      id v11 = objc_alloc(MEMORY[0x1E4F59DF8]);
      uint64_t v14 = objc_msgSend_initWithCapacity_queue_block_(v11, v12, 1, v13, v8, &unk_1EEFCD5D8);
      handleExternalLoadTaskQueue = v10->_handleExternalLoadTaskQueue;
      v10->_handleExternalLoadTaskQueue = (CUTDeferredTaskQueue *)v14;
    }
    self = v10;
    v16 = self;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)loadOverrideValuesIfPresent
{
  v5 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6C360], a2, v2, v3);
  int isInternalInstall = objc_msgSend_isInternalInstall(v5, v6, v7, v8);

  if (isInternalInstall)
  {
    double v13 = objc_msgSend_config(self, v10, v11, v12);
    objc_msgSend_defaultsDomain(v13, v14, v15, v16);
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

    objc_super v18 = (void *)CFPreferencesCopyValue(@"OverrideValues", v17, (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_5;
    }
  }
  objc_super v18 = 0;
LABEL_5:
  return v18;
}

- (id)loadFromCacheWithError:(id *)a3
{
  v6 = objc_msgSend_config(self, a2, (uint64_t)a3, v3);
  objc_msgSend_defaultsDomain(v6, v7, v8, v9);
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  CFStringRef v11 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
  CFStringRef v12 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
  CFPreferencesSynchronize(v10, (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  if (!self->_loadedNotification)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_19DA9FEFC, @"__k_IDSServerBagFinishedLoadingDistributedNotification", 0, CFNotificationSuspensionBehaviorCoalesce);
    self->_loadedNotification = 1;
  }
  uint64_t v14 = (void *)CFPreferencesCopyValue(@"CachedBag", v10, v11, v12);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = v14;
    double v16 = (void *)CFPreferencesCopyValue(@"CacheTime", v10, v11, v12);
    v17 = (void *)CFPreferencesCopyValue(@"Date", v10, v11, v12);
    objc_super v18 = (void *)CFPreferencesCopyValue(@"CachedSignature", v10, v11, v12);
    v21 = (void *)CFPreferencesCopyValue(@"CacheCertificate", v10, v11, v12);
    if (v17)
    {
      v23 = (void *)MEMORY[0x1E4F1C9C8];
      objc_msgSend_doubleValue(v17, v19, v20, v22);
      v27 = objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(v23, v24, v25, v26);
    }
    else
    {
      v27 = 0;
    }
    v29 = [IDSServerBagRawContents alloc];
    objc_msgSend_doubleValue(v16, v30, v31, v32);
    Date_timeToLive_serverSignature_serverCerts_signedBag = objc_msgSend_initWithLoadDate_timeToLive_serverSignature_serverCerts_signedBag_(v29, v33, (uint64_t)v27, v34, v18, v21, v15);
  }
  else if (a3)
  {
    IDSServerBagContentErrorWithUnderlyingError(300, 0);
    Date_timeToLive_serverSignature_serverCerts_signedBag = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    Date_timeToLive_serverSignature_serverCerts_signedBag = 0;
  }

  return Date_timeToLive_serverSignature_serverCerts_signedBag;
}

- (IDSServerBagConfig)config
{
  return self->_config;
}

- (id)writeRawContents:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_config(self, v5, v6, v7);
  CFStringRef v12 = objc_msgSend_defaultsDomain(v8, v9, v10, v11);

  double v16 = objc_msgSend_queue(self, v13, v14, v15);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_19DA9FFEC;
  block[3] = &unk_1E59744E0;
  v21 = self;
  double v22 = v12;
  id v20 = v4;
  id v17 = v4;
  dispatch_async(v16, block);

  return 0;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"__k_IDSServerBagFinishedLoadingDistributedNotification", 0);
  v4.receiver = self;
  v4.super_class = (Class)IDSServerBagCacheLoader;
  [(IDSServerBagCacheLoader *)&v4 dealloc];
}

- (id)writeOverrideValues:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_config(self, v5, v6, v7);
  objc_msgSend_defaultsDomain(v8, v9, v10, v11);
  CFStringRef v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

  double v16 = objc_msgSend_copy(v4, v13, v14, v15);
  id v17 = v16;
  CFStringRef v18 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
  CFStringRef v19 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
  CFPreferencesSetValue(@"OverrideValues", v17, v12, (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);

  CFPreferencesSynchronize(v12, v18, v19);
  v23 = objc_msgSend_queue(self, v20, v21, v22);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_19DAA0470;
  block[3] = &unk_1E5973BA8;
  void block[4] = self;
  dispatch_async(v23, block);

  return 0;
}

- (id)clearOverrideValues
{
  v5 = objc_msgSend_config(self, a2, v2, v3);
  objc_msgSend_defaultsDomain(v5, v6, v7, v8);
  double v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  CFStringRef v10 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
  CFStringRef v11 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
  CFPreferencesSetValue(@"OverrideValues", 0, v9, (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  CFPreferencesSynchronize(v9, v10, v11);
  double v15 = objc_msgSend_queue(self, v12, v13, v14);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_19DAA0574;
  block[3] = &unk_1E5973BA8;
  void block[4] = self;
  dispatch_async(v15, block);

  return 0;
}

- (id)cacheDidReloadBlock
{
  return self->_cacheDidReloadBlock;
}

- (void)setConfig:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (BOOL)postingNotification
{
  return self->_postingNotification;
}

- (void)setPostingNotification:(BOOL)a3
{
  self->_postingNotification = a3;
}

- (CUTDeferredTaskQueue)handleExternalLoadTaskQueue
{
  return self->_handleExternalLoadTaskQueue;
}

- (void)setHandleExternalLoadTaskQueue:(id)a3
{
}

- (BOOL)loadedNotification
{
  return self->_loadedNotification;
}

- (void)setLoadedNotification:(BOOL)a3
{
  self->_loadedNotification = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handleExternalLoadTaskQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong(&self->_cacheDidReloadBlock, 0);
}

@end