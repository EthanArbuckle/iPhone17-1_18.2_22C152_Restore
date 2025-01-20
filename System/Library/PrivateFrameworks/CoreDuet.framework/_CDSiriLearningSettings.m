@interface _CDSiriLearningSettings
+ (id)sharedInstance;
+ (id)uncachedAllLearningDisabledBundleIDs;
- (BOOL)isLearningDisabledForBundleID:(id)a3;
- (NSArray)allLearningDisabledBundleIDs;
- (id)_unsafe_allLearningDisabledBundleIDs;
- (id)notificationQueue;
- (void)_startWithCallback:(int)a3 invokeCallbackNow:;
- (void)_unsafe_clearAllLearningDisabledBundleIDs;
- (void)setDelegates:(uint64_t)a1;
- (void)startSanitizingInteractionStore:(id)a3;
- (void)startSanitizingKnowledgeStore:(id)a3;
- (void)stopSanitizing;
@end

@implementation _CDSiriLearningSettings

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41___CDSiriLearningSettings_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_3 != -1) {
    dispatch_once(&sharedInstance_onceToken_3, block);
  }
  v2 = (void *)sharedInstance_manager;
  return v2;
}

- (NSArray)allLearningDisabledBundleIDs
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__11;
  v12 = __Block_byref_object_dispose__11;
  id v13 = 0;
  if (self && self->_hasPrefsAccess)
  {
    v3 = -[_CDSiriLearningSettings notificationQueue](self);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __55___CDSiriLearningSettings_allLearningDisabledBundleIDs__block_invoke;
    v7[3] = &unk_1E560D4D0;
    v7[4] = self;
    v7[5] = &v8;
    dispatch_sync(v3, v7);

    v4 = (void *)v9[5];
  }
  else
  {
    v4 = 0;
  }
  if (!v4) {
    v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v5 = v4;
  _Block_object_dispose(&v8, 8);

  return (NSArray *)v5;
}

- (void)_unsafe_clearAllLearningDisabledBundleIDs
{
  if (a1)
  {
    v2 = -[_CDSiriLearningSettings notificationQueue](a1);
    dispatch_assert_queue_V2(v2);

    v3 = (void *)a1[3];
    a1[3] = 0;
  }
}

- (id)_unsafe_allLearningDisabledBundleIDs
{
  if (a1)
  {
    v2 = -[_CDSiriLearningSettings notificationQueue]((id)a1);
    dispatch_assert_queue_V2(v2);

    v3 = (void *)[*(id *)(a1 + 24) copy];
    if (!v3)
    {
      v4 = +[_CDSiriLearningSettings uncachedAllLearningDisabledBundleIDs]();
      v3 = [v4 sortedArrayUsingComparator:&__block_literal_global_138];

      if (*(_DWORD *)(a1 + 12) != -1) {
        objc_storeStrong((id *)(a1 + 24), v3);
      }
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)notificationQueue
{
  if (a1)
  {
    if (notificationQueue_onceToken != -1) {
      dispatch_once(&notificationQueue_onceToken, &__block_literal_global_128);
    }
    a1 = (id)notificationQueue_queue;
    uint64_t v1 = vars8;
  }
  return a1;
}

+ (id)uncachedAllLearningDisabledBundleIDs
{
  self;
  v0 = (void *)CFPreferencesCopyAppValue(@"SiriCanLearnFromAppBlacklist", @"com.apple.suggestions");
  return v0;
}

- (void)setDelegates:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (BOOL)isLearningDisabledForBundleID:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  char v6 = 0;
  if (self && v4 && self->_hasPrefsAccess)
  {
    v7 = [(_CDSiriLearningSettings *)self allLearningDisabledBundleIDs];
    char v6 = objc_msgSend(v7, "_cd_containsSiriLearningBundleId:", v5);
  }
  return v6;
}

- (void)_startWithCallback:(int)a3 invokeCallbackNow:
{
  id v5 = a2;
  if (a1 && *(unsigned char *)(a1 + 8))
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    id v6 = *(id *)(a1 + 32);
    v7 = (void *)MEMORY[0x192FB31A0](v5);
    [v6 addObject:v7];

    if (*(_DWORD *)(a1 + 12) == -1)
    {
      uint64_t v8 = -[_CDSiriLearningSettings notificationQueue]((id)a1);
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __64___CDSiriLearningSettings__startWithCallback_invokeCallbackNow___block_invoke;
      handler[3] = &unk_1E560E910;
      handler[4] = a1;
      notify_register_dispatch("com.apple.suggestions.settingsChanged", (int *)(a1 + 12), v8, handler);
    }
    v9 = [(id)a1 allLearningDisabledBundleIDs];
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
    if (a3)
    {
      uint64_t v10 = -[_CDSiriLearningSettings notificationQueue]((id)a1);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __64___CDSiriLearningSettings__startWithCallback_invokeCallbackNow___block_invoke_143;
      block[3] = &unk_1E560D978;
      id v13 = v5;
      id v12 = v9;
      dispatch_sync(v10, block);
    }
  }
}

- (void)startSanitizingKnowledgeStore:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57___CDSiriLearningSettings_startSanitizingKnowledgeStore___block_invoke;
  v6[3] = &unk_1E560EDE0;
  id v7 = v4;
  id v5 = v4;
  -[_CDSiriLearningSettings _startWithCallback:invokeCallbackNow:]((uint64_t)self, v6, 0);
}

- (void)startSanitizingInteractionStore:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59___CDSiriLearningSettings_startSanitizingInteractionStore___block_invoke;
  v6[3] = &unk_1E560EDE0;
  id v7 = v4;
  id v5 = v4;
  -[_CDSiriLearningSettings _startWithCallback:invokeCallbackNow:]((uint64_t)self, v6, 1);
}

- (void)stopSanitizing
{
  if (self && self->_hasPrefsAccess)
  {
    os_unfair_lock_lock(&self->_lock);
    int notifyToken = self->_notifyToken;
    if (notifyToken != -1)
    {
      notify_cancel(notifyToken);
      self->_int notifyToken = -1;
      id v4 = -[_CDSiriLearningSettings notificationQueue](self);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __41___CDSiriLearningSettings_stopSanitizing__block_invoke;
      block[3] = &unk_1E560D578;
      void block[4] = self;
      dispatch_async(v4, block);
    }
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_allLearningDisabledBundleIDs, 0);
}

@end