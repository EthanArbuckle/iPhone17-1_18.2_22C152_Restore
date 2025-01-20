@interface CSLocaleObserver
- (CSLocaleObserver)init;
- (void)currentLocaleWithPreferredLanguagesBlock:(id)a3;
- (void)dealloc;
- (void)update;
@end

@implementation CSLocaleObserver

- (CSLocaleObserver)init
{
  v9.receiver = self;
  v9.super_class = (Class)CSLocaleObserver;
  v2 = [(CSLocaleObserver *)&v9 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.spotlight.CSLocaleObserver", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    currentLocale = v2->_currentLocale;
    v2->_currentLocale = 0;

    preferredLanguages = v2->_preferredLanguages;
    v2->_preferredLanguages = 0;

    v2->_isCJK = 0;
    [(CSLocaleObserver *)v2 update];
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(LocalCenter, v2, (CFNotificationCallback)localeChangeCallback, (CFStringRef)*MEMORY[0x1E4F1D200], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v2;
}

- (void)update
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__CSLocaleObserver_update__block_invoke;
  block[3] = &unk_1E5548F00;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __26__CSLocaleObserver_update__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA20] currentLocale];
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  uint64_t v5 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v5;

  v8 = [*(id *)(*(void *)(a1 + 32) + 16) firstObject];
  id v9 = [v8 lowercaseString];

  if (([v9 hasPrefix:@"ja"] & 1) != 0
    || ([v9 hasPrefix:@"zh"] & 1) != 0
    || ([v9 hasPrefix:@"yue"] & 1) != 0
    || [v9 hasPrefix:@"ko"])
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 24) = 1;
  }
}

- (void)currentLocaleWithPreferredLanguagesBlock:(id)a3
{
  v4 = (void (**)(id, uint64_t, uint64_t, void))a3;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__7;
  v21 = __Block_byref_object_dispose__7;
  id v22 = 0;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__7;
  v15 = __Block_byref_object_dispose__7;
  id v16 = 0;
  id v16 = (id)objc_opt_new();
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__CSLocaleObserver_currentLocaleWithPreferredLanguagesBlock___block_invoke;
  v6[3] = &unk_1E554A2D8;
  v6[4] = self;
  v6[5] = &v17;
  v6[6] = &v11;
  v6[7] = &v7;
  dispatch_sync(queue, v6);
  v4[2](v4, v18[5], v12[5], *((unsigned __int8 *)v8 + 24));
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
}

void __61__CSLocaleObserver_currentLocaleWithPreferredLanguagesBlock___block_invoke(void *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1[4] + 8) copy];
  uint64_t v3 = *(void *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *(id *)(a1[4] + 16);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*(void *)(a1[6] + 8) + 40), "addObject:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = *(unsigned char *)(a1[4] + 24);
}

- (void)dealloc
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__CSLocaleObserver_dealloc__block_invoke;
  block[3] = &unk_1E5548F00;
  block[4] = self;
  dispatch_sync(queue, block);
  v4.receiver = self;
  v4.super_class = (Class)CSLocaleObserver;
  [(CSLocaleObserver *)&v4 dealloc];
}

void __27__CSLocaleObserver_dealloc__block_invoke(uint64_t a1)
{
  LocalCenter = CFNotificationCenterGetLocalCenter();
  uint64_t v3 = *(const void **)(a1 + 32);
  CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F1D200];

  CFNotificationCenterRemoveObserver(LocalCenter, v3, v4, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_preferredLanguages, 0);

  objc_storeStrong((id *)&self->_currentLocale, 0);
}

@end