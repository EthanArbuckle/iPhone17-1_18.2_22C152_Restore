@interface HFCameraPlaybackEngineEventCache
+ (BOOL)isValidEvent:(id)a3;
- (BOOL)isFirstEventOfTheDay:(id)a3;
- (HFCameraPlaybackEngineEventCache)init;
- (HMCameraClip)clipWithLongestDuration;
- (NSArray)clips;
- (NSArray)events;
- (NSArray)rawEvents;
- (NSDictionary)rawEventsByUniqueIdentifier;
- (NSMapTable)firstOfTheDayClips;
- (NSMapTable)firstOfTheDayEvents;
- (OS_dispatch_queue)workQueue;
- (id)_events;
- (id)daysWithClips;
- (id)firstOfTheDayClipForDate:(id)a3;
- (void)_generateViewModelWithUpdatedIdentifiers:(id)a3 replacedIdentifiers:(id)a4 completion:(id)a5;
- (void)_removeEventUUIDs:(id)a3 completion:(id)a4;
- (void)_setupDebugHandler;
- (void)_updateWithEvents:(id)a3 completion:(id)a4;
- (void)_validateAndInsertRawEvents:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)removeEventUUIDs:(id)a3 completion:(id)a4;
- (void)setClipWithLongestDuration:(id)a3;
- (void)setClips:(id)a3;
- (void)setEvents:(id)a3;
- (void)setFirstOfTheDayClips:(id)a3;
- (void)setFirstOfTheDayEvents:(id)a3;
- (void)setRawEvents:(id)a3;
- (void)setRawEventsByUniqueIdentifier:(id)a3;
- (void)updateWithEvents:(id)a3 completion:(id)a4;
@end

@implementation HFCameraPlaybackEngineEventCache

- (HFCameraPlaybackEngineEventCache)init
{
  v17.receiver = self;
  v17.super_class = (Class)HFCameraPlaybackEngineEventCache;
  v2 = [(HFCameraPlaybackEngineEventCache *)&v17 init];
  v3 = v2;
  if (v2)
  {
    rawEvents = v2->_rawEvents;
    v5 = (NSArray *)MEMORY[0x263EFFA68];
    v2->_rawEvents = (NSArray *)MEMORY[0x263EFFA68];

    rawEventsByUniqueIdentifier = v3->_rawEventsByUniqueIdentifier;
    v3->_rawEventsByUniqueIdentifier = (NSDictionary *)MEMORY[0x263EFFA78];

    events = v3->_events;
    v3->_events = v5;

    clips = v3->_clips;
    v3->_clips = v5;

    uint64_t v9 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
    firstOfTheDayClips = v3->_firstOfTheDayClips;
    v3->_firstOfTheDayClips = (NSMapTable *)v9;

    uint64_t v11 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
    firstOfTheDayEvents = v3->_firstOfTheDayEvents;
    v3->_firstOfTheDayEvents = (NSMapTable *)v11;

    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.HFCameraPlaybackEngineEventCache.workQueue", v13);
    workQueue = v3->_workQueue;
    v3->_workQueue = (OS_dispatch_queue *)v14;

    [(HFCameraPlaybackEngineEventCache *)v3 _setupDebugHandler];
  }
  return v3;
}

- (void)setRawEvents:(id)a3
{
  v4 = (NSArray *)a3;
  os_unfair_lock_lock_with_options();
  rawEvents = self->_rawEvents;
  self->_rawEvents = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)rawEvents
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_rawEvents;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setRawEventsByUniqueIdentifier:(id)a3
{
  v4 = (NSDictionary *)a3;
  os_unfair_lock_lock_with_options();
  rawEventsByUniqueIdentifier = self->_rawEventsByUniqueIdentifier;
  self->_rawEventsByUniqueIdentifier = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSDictionary)rawEventsByUniqueIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_rawEventsByUniqueIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setEvents:(id)a3
{
  v4 = (NSArray *)a3;
  os_unfair_lock_lock_with_options();
  events = self->_events;
  self->_events = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)events
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_events;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)_events
{
  if (!+[HFUtilities isInternalTest])
  {
    v3 = [(HFCameraPlaybackEngineEventCache *)self workQueue];
    dispatch_assert_queue_V2(v3);
  }
  events = self->_events;
  return events;
}

- (void)setClips:(id)a3
{
  v4 = (NSArray *)a3;
  os_unfair_lock_lock_with_options();
  clips = self->_clips;
  self->_clips = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)clips
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_clips;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setClipWithLongestDuration:(id)a3
{
  v4 = (HMCameraClip *)a3;
  os_unfair_lock_lock_with_options();
  clipWithLongestDuration = self->_clipWithLongestDuration;
  self->_clipWithLongestDuration = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMCameraClip)clipWithLongestDuration
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_clipWithLongestDuration;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setFirstOfTheDayEvents:(id)a3
{
  v4 = (NSMapTable *)a3;
  os_unfair_lock_lock_with_options();
  firstOfTheDayEvents = self->_firstOfTheDayEvents;
  self->_firstOfTheDayEvents = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSMapTable)firstOfTheDayEvents
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_firstOfTheDayEvents;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setFirstOfTheDayClips:(id)a3
{
  v4 = (NSMapTable *)a3;
  os_unfair_lock_lock_with_options();
  firstOfTheDayClips = self->_firstOfTheDayClips;
  self->_firstOfTheDayClips = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSMapTable)firstOfTheDayClips
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_firstOfTheDayClips;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)isFirstEventOfTheDay:(id)a3
{
  id v4 = a3;
  v5 = [(HFCameraPlaybackEngineEventCache *)self firstOfTheDayEvents];
  v6 = [v4 dateOfOccurrence];
  v7 = objc_msgSend(v6, "hf_startOfDay");
  v8 = [v5 objectForKey:v7];

  uint64_t v9 = [v8 uniqueIdentifier];
  v10 = [v4 uniqueIdentifier];

  LOBYTE(v4) = [v9 isEqual:v10];
  return (char)v4;
}

- (id)firstOfTheDayClipForDate:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HFCameraPlaybackEngineEventCache *)self firstOfTheDayClips];
  v6 = objc_msgSend(v4, "hf_startOfDay");
  v7 = [v5 objectForKey:v6];

  if (v7)
  {
    v8 = HFLogForCategory(0x17uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = objc_msgSend(v7, "hf_prettyDescription");
      int v11 = 138412546;
      id v12 = v4;
      __int16 v13 = 2112;
      dispatch_queue_t v14 = v9;
      _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "Found first of the day clip for date: %@; clip: %@",
        (uint8_t *)&v11,
        0x16u);
    }
  }

  return v7;
}

- (id)daysWithClips
{
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = [(HFCameraPlaybackEngineEventCache *)self firstOfTheDayClips];
  id v4 = [v3 keyEnumerator];
  v5 = [v4 allObjects];
  v6 = [v2 setWithArray:v5];

  return v6;
}

- (void)updateWithEvents:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(HFCameraPlaybackEngineEventCache *)self workQueue];
  dispatch_assert_queue_not_V2(v8);

  if (+[HFUtilities isInternalTest])
  {
    [(HFCameraPlaybackEngineEventCache *)self _updateWithEvents:v6 completion:v7];
  }
  else
  {
    objc_initWeak(&location, self);
    uint64_t v9 = [(HFCameraPlaybackEngineEventCache *)self workQueue];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __64__HFCameraPlaybackEngineEventCache_updateWithEvents_completion___block_invoke;
    v10[3] = &unk_26408CA30;
    objc_copyWeak(&v13, &location);
    id v11 = v6;
    id v12 = v7;
    dispatch_async(v9, v10);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __64__HFCameraPlaybackEngineEventCache_updateWithEvents_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _updateWithEvents:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)_updateWithEvents:(id)a3 completion:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  if (!+[HFUtilities isInternalTest])
  {
    v8 = [(HFCameraPlaybackEngineEventCache *)self workQueue];
    dispatch_assert_queue_V2(v8);
  }
  uint64_t v9 = HFLogForCategory(0x17uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    dispatch_queue_t v14 = "-[HFCameraPlaybackEngineEventCache _updateWithEvents:completion:]";
    _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __65__HFCameraPlaybackEngineEventCache__updateWithEvents_completion___block_invoke;
  v11[3] = &unk_26408CA58;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [(HFCameraPlaybackEngineEventCache *)self _validateAndInsertRawEvents:v7 completion:v11];
}

uint64_t __65__HFCameraPlaybackEngineEventCache__updateWithEvents_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _generateViewModelWithUpdatedIdentifiers:a2 replacedIdentifiers:a3 completion:*(void *)(a1 + 40)];
}

- (void)removeEventUUIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(HFCameraPlaybackEngineEventCache *)self workQueue];
  dispatch_assert_queue_not_V2(v8);

  if (+[HFUtilities isInternalTest])
  {
    [(HFCameraPlaybackEngineEventCache *)self _removeEventUUIDs:v6 completion:v7];
  }
  else
  {
    objc_initWeak(&location, self);
    uint64_t v9 = [(HFCameraPlaybackEngineEventCache *)self workQueue];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __64__HFCameraPlaybackEngineEventCache_removeEventUUIDs_completion___block_invoke;
    v10[3] = &unk_26408CA30;
    objc_copyWeak(&v13, &location);
    id v11 = v6;
    id v12 = v7;
    dispatch_async(v9, v10);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __64__HFCameraPlaybackEngineEventCache_removeEventUUIDs_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _removeEventUUIDs:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)_removeEventUUIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!+[HFUtilities isInternalTest])
  {
    v8 = [(HFCameraPlaybackEngineEventCache *)self workQueue];
    dispatch_assert_queue_V2(v8);
  }
  uint64_t v9 = [(HFCameraPlaybackEngineEventCache *)self rawEvents];
  id v10 = (void *)[v9 mutableCopy];

  id v11 = [(HFCameraPlaybackEngineEventCache *)self rawEventsByUniqueIdentifier];
  id v12 = (void *)[v11 mutableCopy];

  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = __Block_byref_object_copy_;
  v41 = __Block_byref_object_dispose_;
  id v42 = [(HFCameraPlaybackEngineEventCache *)self clipWithLongestDuration];
  id v13 = [MEMORY[0x263EFF9C0] set];
  dispatch_queue_t v14 = [MEMORY[0x263EFF9C0] set];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __65__HFCameraPlaybackEngineEventCache__removeEventUUIDs_completion___block_invoke;
  v31[3] = &unk_26408CA80;
  id v15 = v12;
  id v32 = v15;
  v36 = &v37;
  id v16 = v13;
  id v33 = v16;
  id v17 = v14;
  id v34 = v17;
  id v18 = v10;
  id v35 = v18;
  objc_msgSend(v6, "na_each:", v31);
  if (!v38[5])
  {
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __65__HFCameraPlaybackEngineEventCache__removeEventUUIDs_completion___block_invoke_2;
    v30[3] = &unk_26408CAA8;
    v30[4] = &v37;
    objc_msgSend(v18, "na_each:", v30);
    [(HFCameraPlaybackEngineEventCache *)self setClipWithLongestDuration:v38[5]];
  }
  if ([v17 count])
  {
    v19 = [(HFCameraPlaybackEngineEventCache *)self events];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __65__HFCameraPlaybackEngineEventCache__removeEventUUIDs_completion___block_invoke_3;
    v27[3] = &unk_26408CAD0;
    id v28 = v17;
    id v29 = v16;
    objc_msgSend(v19, "na_each:", v27);
  }
  [(HFCameraPlaybackEngineEventCache *)self setRawEvents:v18];
  [(HFCameraPlaybackEngineEventCache *)self setRawEventsByUniqueIdentifier:v15];
  v20 = [MEMORY[0x263EFFA08] set];
  v21 = [MEMORY[0x263EFFA08] set];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __65__HFCameraPlaybackEngineEventCache__removeEventUUIDs_completion___block_invoke_4;
  v24[3] = &unk_26408CAF8;
  id v22 = v7;
  id v26 = v22;
  id v23 = v16;
  id v25 = v23;
  [(HFCameraPlaybackEngineEventCache *)self _generateViewModelWithUpdatedIdentifiers:v20 replacedIdentifiers:v21 completion:v24];

  _Block_object_dispose(&v37, 8);
}

void __65__HFCameraPlaybackEngineEventCache__removeEventUUIDs_completion___block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  id v4 = v3;
  if (v3)
  {
    if ([v3 containerType] == 1)
    {
      [v4 duration];
      double v6 = v5;
      [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) duration];
      if (vabdd_f64(v6, v7) < 2.22044605e-16)
      {
        uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
        uint64_t v9 = *(void **)(v8 + 40);
        *(void *)(v8 + 40) = 0;
      }
      id v10 = *(void **)(a1 + 40);
    }
    else
    {
      id v10 = *(void **)(a1 + 48);
    }
    id v11 = [v4 uniqueIdentifier];
    [v10 addObject:v11];

    [*(id *)(a1 + 56) removeObject:v4];
    [*(id *)(a1 + 32) setObject:0 forKeyedSubscript:v12];
  }
}

void __65__HFCameraPlaybackEngineEventCache__removeEventUUIDs_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v15 = a2;
  if ([v15 containerType] != 1) {
    goto LABEL_15;
  }
  uint64_t v3 = objc_opt_class();
  id v4 = v15;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      double v5 = v4;
    }
    else {
      double v5 = 0;
    }
    double v6 = v4;
    if (v5) {
      goto LABEL_9;
    }
    double v7 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v8 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v7 handleFailureInFunction:v8, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v3, objc_opt_class() file lineNumber description];
  }
  double v6 = 0;
LABEL_9:

  [v6 duration];
  double v10 = v9;
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) duration];
  BOOL v12 = v10 <= v11;
  double v13 = vabdd_f64(v10, v11);
  if (!v12 && v13 >= 2.22044605e-16) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v6);
  }

LABEL_15:
}

void __65__HFCameraPlaybackEngineEventCache__removeEventUUIDs_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v13 = a2;
  if ([v13 containerType] != 2) {
    goto LABEL_12;
  }
  uint64_t v3 = objc_opt_class();
  id v4 = v13;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      double v5 = v4;
    }
    else {
      double v5 = 0;
    }
    double v6 = v4;
    if (v5) {
      goto LABEL_9;
    }
    double v7 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v8 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v7 handleFailureInFunction:v8, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v3, objc_opt_class() file lineNumber description];
  }
  double v6 = 0;
LABEL_9:

  double v9 = [v6 eventUniqueIdentifiers];
  int v10 = [v9 intersectsSet:*(void *)(a1 + 32)];

  if (v10)
  {
    double v11 = *(void **)(a1 + 40);
    BOOL v12 = [v6 uniqueIdentifier];
    [v11 addObject:v12];
  }
LABEL_12:
}

uint64_t __65__HFCameraPlaybackEngineEventCache__removeEventUUIDs_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)_validateAndInsertRawEvents:(id)a3 completion:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  double v7 = (void (**)(id, id, id))a4;
  if (!+[HFUtilities isInternalTest])
  {
    uint64_t v8 = [(HFCameraPlaybackEngineEventCache *)self workQueue];
    dispatch_assert_queue_V2(v8);
  }
  double v9 = HFLogForCategory(0x17uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[HFCameraPlaybackEngineEventCache _validateAndInsertRawEvents:completion:]";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = [v6 count];
    _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "%s, with (%lu) events", buf, 0x16u);
  }

  int v10 = [(HFCameraPlaybackEngineEventCache *)self rawEventsByUniqueIdentifier];
  double v11 = (void *)[v10 mutableCopy];

  BOOL v12 = [(HFCameraPlaybackEngineEventCache *)self rawEvents];
  id v13 = (void *)[v12 mutableCopy];

  dispatch_queue_t v14 = [MEMORY[0x263EFF9C0] set];
  id v15 = [MEMORY[0x263EFF9C0] set];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v31 = __Block_byref_object_copy_;
  id v32 = __Block_byref_object_dispose_;
  id v33 = [(HFCameraPlaybackEngineEventCache *)self clipWithLongestDuration];
  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 3221225472;
  id v22 = __75__HFCameraPlaybackEngineEventCache__validateAndInsertRawEvents_completion___block_invoke;
  id v23 = &unk_26408CB48;
  v24 = self;
  id v29 = buf;
  id v16 = v11;
  id v25 = v16;
  id v17 = v13;
  id v26 = v17;
  id v18 = v15;
  id v27 = v18;
  id v19 = v14;
  id v28 = v19;
  objc_msgSend(v6, "na_each:", &v20);
  -[HFCameraPlaybackEngineEventCache setRawEvents:](self, "setRawEvents:", v17, v20, v21, v22, v23, v24);
  [(HFCameraPlaybackEngineEventCache *)self setRawEventsByUniqueIdentifier:v16];
  [(HFCameraPlaybackEngineEventCache *)self setClipWithLongestDuration:*(void *)(*(void *)&buf[8] + 40)];
  if (v7) {
    v7[2](v7, v19, v18);
  }

  _Block_object_dispose(buf, 8);
}

void __75__HFCameraPlaybackEngineEventCache__validateAndInsertRawEvents_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([(id)objc_opt_class() isValidEvent:v3])
  {
    if ([v3 containerType] != 1) {
      goto LABEL_16;
    }
    uint64_t v4 = objc_opt_class();
    id v5 = v3;
    if (v5)
    {
      if (objc_opt_isKindOfClass()) {
        id v6 = v5;
      }
      else {
        id v6 = 0;
      }
      double v7 = v5;
      if (v6) {
        goto LABEL_10;
      }
      uint64_t v8 = [MEMORY[0x263F08690] currentHandler];
      double v9 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      [v8 handleFailureInFunction:v9, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v4, objc_opt_class() file lineNumber description];
    }
    double v7 = 0;
LABEL_10:

    objc_msgSend(v7, "hf_sortSignificantEvents");
    [v7 duration];
    double v11 = v10;
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) duration];
    BOOL v13 = v11 <= v12;
    double v14 = vabdd_f64(v11, v12);
    if (!v13 && v14 >= 2.22044605e-16) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), v7);
    }

LABEL_16:
    id v16 = *(void **)(a1 + 40);
    id v17 = [v3 uniqueIdentifier];
    id v18 = [v16 objectForKeyedSubscript:v17];

    if (v18)
    {
      id v19 = [v3 dateOfOccurrence];
      uint64_t v20 = [v18 dateOfOccurrence];
      int v21 = [v19 isEqualToDate:v20];

      id v22 = *(void **)(a1 + 48);
      if (!v21)
      {
        v50[0] = MEMORY[0x263EF8330];
        v50[1] = 3221225472;
        v50[2] = __75__HFCameraPlaybackEngineEventCache__validateAndInsertRawEvents_completion___block_invoke_11;
        v50[3] = &unk_26408CB20;
        id v32 = v3;
        id v51 = v32;
        uint64_t v33 = [v22 indexOfObjectPassingTest:v50];
        if (v33 == 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v34 = HFLogForCategory(0x17uLL);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v53 = v32;
            _os_log_error_impl(&dword_20B986000, v34, OS_LOG_TYPE_ERROR, "Could not locate existing event using indexOfObjectPassingTest: %@", buf, 0xCu);
          }
        }
        else
        {
          [*(id *)(a1 + 48) removeObjectAtIndex:v33];
          id v42 = *(void **)(a1 + 40);
          uint64_t v34 = [v32 uniqueIdentifier];
          [v42 setObject:0 forKeyedSubscript:v34];
        }

        v43 = *(void **)(a1 + 48);
        v44 = +[HFCameraUtilities cameraRecordingEventDateOfOccurenceComparator];
        uint64_t v45 = objc_msgSend(v43, "hf_insertObject:intoSortedArrayWithOptions:comparator:", v32, 1024, v44);

        if (v45 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v46 = HFLogForCategory(0x17uLL);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v53 = v32;
            _os_log_error_impl(&dword_20B986000, v46, OS_LOG_TYPE_ERROR, "Invalid insertion index after removing existing event: %@", buf, 0xCu);
          }
        }
        else
        {
          v47 = *(void **)(a1 + 40);
          v48 = [v32 uniqueIdentifier];
          [v47 setObject:v32 forKeyedSubscript:v48];

          v49 = *(void **)(a1 + 56);
          v46 = [v32 uniqueIdentifier];
          [v49 addObject:v46];
        }

        goto LABEL_42;
      }
      uint64_t v23 = [*(id *)(a1 + 48) count];
      v24 = +[HFCameraUtilities cameraRecordingEventDateOfOccurenceComparator];
      uint64_t v25 = objc_msgSend(v22, "indexOfObject:inSortedRange:options:usingComparator:", v18, 0, v23, 256, v24);

      id v26 = HFLogForCategory(0x17uLL);
      id v27 = v26;
      if (v25 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v53 = v3;
          _os_log_error_impl(&dword_20B986000, v27, OS_LOG_TYPE_ERROR, "Could not locate existing event using indexOfObject: %@", buf, 0xCu);
        }
      }
      else
      {
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          v36 = objc_msgSend(v18, "hf_prettyDescription");
          uint64_t v37 = objc_msgSend(v3, "hf_prettyDescription");
          *(_DWORD *)buf = 138412546;
          id v53 = v36;
          __int16 v54 = 2112;
          v55 = v37;
          _os_log_impl(&dword_20B986000, v27, OS_LOG_TYPE_DEFAULT, "Updating event: old: %@; new: %@", buf, 0x16u);
        }
        [*(id *)(a1 + 48) replaceObjectAtIndex:v25 withObject:v3];
        v38 = *(void **)(a1 + 40);
        uint64_t v39 = [v3 uniqueIdentifier];
        [v38 setObject:v3 forKeyedSubscript:v39];

        uint64_t v40 = [v18 containerType];
        if (v40 == [v3 containerType]) {
          v41 = *(void **)(a1 + 64);
        }
        else {
          v41 = *(void **)(a1 + 56);
        }
        id v27 = [v3 uniqueIdentifier];
        [v41 addObject:v27];
      }
    }
    else
    {
      id v28 = *(void **)(a1 + 48);
      id v29 = +[HFCameraUtilities cameraRecordingEventDateOfOccurenceComparator];
      uint64_t v30 = objc_msgSend(v28, "hf_insertObject:intoSortedArrayWithOptions:comparator:", v3, 1024, v29);

      if (v30 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v31 = HFLogForCategory(0x17uLL);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v53 = v3;
          _os_log_error_impl(&dword_20B986000, v31, OS_LOG_TYPE_ERROR, "Invalid insertion index: %@", buf, 0xCu);
        }

        goto LABEL_42;
      }
      id v35 = *(void **)(a1 + 40);
      id v27 = [v3 uniqueIdentifier];
      [v35 setObject:v3 forKeyedSubscript:v27];
    }

LABEL_42:
  }
}

uint64_t __75__HFCameraPlaybackEngineEventCache__validateAndInsertRawEvents_completion___block_invoke_11(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueIdentifier];
  uint64_t v4 = [*(id *)(a1 + 32) uniqueIdentifier];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

- (void)_generateViewModelWithUpdatedIdentifiers:(id)a3 replacedIdentifiers:(id)a4 completion:(id)a5
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v40 = (void (**)(id, id, id))a5;
  if (!+[HFUtilities isInternalTest])
  {
    double v10 = [(HFCameraPlaybackEngineEventCache *)self workQueue];
    dispatch_assert_queue_V2(v10);
  }
  double v11 = [(HFCameraPlaybackEngineEventCache *)self rawEvents];
  double v12 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
  BOOL v13 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
  double v14 = [MEMORY[0x263EFF9C0] set];
  id v15 = [MEMORY[0x263EFF9C0] set];
  id v16 = [MEMORY[0x263EFF980] array];
  id v17 = [MEMORY[0x263EFF980] array];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __108__HFCameraPlaybackEngineEventCache__generateViewModelWithUpdatedIdentifiers_replacedIdentifiers_completion___block_invoke;
  aBlock[3] = &unk_26408CB70;
  id v18 = v16;
  id v57 = v18;
  id v35 = v8;
  id v58 = v35;
  id v36 = v9;
  id v59 = v36;
  id v37 = v14;
  id v60 = v37;
  id v38 = v15;
  id v61 = v38;
  id v39 = v12;
  id v62 = v39;
  id v19 = v13;
  id v63 = v19;
  uint64_t v20 = _Block_copy(aBlock);
  uint64_t v50 = 0;
  id v51 = &v50;
  uint64_t v52 = 0x3032000000;
  id v53 = __Block_byref_object_copy_;
  __int16 v54 = __Block_byref_object_dispose_;
  id v55 = 0;
  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = __108__HFCameraPlaybackEngineEventCache__generateViewModelWithUpdatedIdentifiers_replacedIdentifiers_completion___block_invoke_14;
  v45[3] = &unk_26408CB98;
  v49 = &v50;
  id v21 = v11;
  id v46 = v21;
  id v22 = v20;
  id v48 = v22;
  id v23 = v17;
  id v47 = v23;
  [v21 enumerateObjectsUsingBlock:v45];
  if (v51[5])
  {
    v24 = objc_msgSend(v21, "lastObject", v35, v36);
    objc_opt_class();
    id v25 = v24;
    if (objc_opt_isKindOfClass()) {
      id v26 = v25;
    }
    else {
      id v26 = 0;
    }
    id v27 = v26;

    if ([v27 isReachable]) {
      id v28 = v27;
    }
    else {
      id v28 = 0;
    }
    id v29 = v28;
    uint64_t v30 = [HFCameraScrubberReachabilityEventContainer alloc];
    v31 = [(HFCameraScrubberReachabilityEventContainer *)v30 initWithStartEvent:v51[5] endEvent:v29];
    (*((void (**)(id, HFCameraScrubberReachabilityEventContainer *))v22 + 2))(v22, v31);
  }
  id v32 = HFLogForCategory(0x17uLL);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v33 = [v18 count];
    *(_DWORD *)buf = 136315394;
    v65 = "-[HFCameraPlaybackEngineEventCache _generateViewModelWithUpdatedIdentifiers:replacedIdentifiers:completion:]";
    __int16 v66 = 2048;
    uint64_t v67 = v33;
    _os_log_impl(&dword_20B986000, v32, OS_LOG_TYPE_DEFAULT, "%s, adding events to cache with total count: %lu", buf, 0x16u);
  }

  [(HFCameraPlaybackEngineEventCache *)self setEvents:v18];
  [(HFCameraPlaybackEngineEventCache *)self setClips:v23];
  [(HFCameraPlaybackEngineEventCache *)self setFirstOfTheDayClips:v39];
  [(HFCameraPlaybackEngineEventCache *)self setFirstOfTheDayEvents:v19];
  if (v40)
  {
    if (+[HFUtilities isInternalTest])
    {
      v40[2](v40, v37, v38);
    }
    else
    {
      uint64_t v34 = [(HFCameraPlaybackEngineEventCache *)self workQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __108__HFCameraPlaybackEngineEventCache__generateViewModelWithUpdatedIdentifiers_replacedIdentifiers_completion___block_invoke_17;
      block[3] = &unk_26408CBC0;
      v44 = v40;
      id v42 = v37;
      id v43 = v38;
      dispatch_async(v34, block);
    }
  }

  _Block_object_dispose(&v50, 8);
}

void __108__HFCameraPlaybackEngineEventCache__generateViewModelWithUpdatedIdentifiers_replacedIdentifiers_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v3 = a2;
  [*(id *)(a1 + 32) addObject:v3];
  if ([v3 containerType] != 2)
  {
    id v17 = *(void **)(a1 + 40);
    id v18 = [v3 uniqueIdentifier];
    LOBYTE(v17) = [v17 containsObject:v18];

    if (v17) {
      goto LABEL_14;
    }
    id v26 = *(void **)(a1 + 48);
    id v27 = [v3 uniqueIdentifier];
    LOBYTE(v26) = [v26 containsObject:v27];

    if ((v26 & 1) == 0) {
      goto LABEL_23;
    }
    goto LABEL_19;
  }
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (!v5) {
    goto LABEL_8;
  }
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  double v7 = v5;
  if (!v6)
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    id v9 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v8 handleFailureInFunction:v9, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v4, objc_opt_class() file lineNumber description];

LABEL_8:
    double v7 = 0;
  }

  double v10 = [v7 eventUniqueIdentifiers];
  int v11 = [v10 intersectsSet:*(void *)(a1 + 40)];

  if (v11)
  {
    double v12 = HFLogForCategory(0x17uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v13 = objc_msgSend(v7, "hf_prettyDescription");
      double v14 = *(void **)(a1 + 40);
      id v15 = [v7 eventUniqueIdentifiers];
      id v16 = objc_msgSend(v14, "na_setByIntersectingWithSet:", v15);
      *(_DWORD *)buf = 138412546;
      id v53 = v13;
      __int16 v54 = 2112;
      id v55 = v16;
      _os_log_impl(&dword_20B986000, v12, OS_LOG_TYPE_DEFAULT, "Reachability event container contains updated events: %@; identifiers: %@",
        buf,
        0x16u);
    }
LABEL_14:
    id v19 = *(void **)(a1 + 56);
    uint64_t v20 = [v3 uniqueIdentifier];
    [v19 addObject:v20];

    id v21 = HFLogForCategory(0x17uLL);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = objc_msgSend(v3, "hf_prettyDescription");
      *(_DWORD *)buf = 138412290;
      id v53 = v22;
      id v23 = "Added event to updatedIdentifiers: %@";
LABEL_21:
      _os_log_impl(&dword_20B986000, v21, OS_LOG_TYPE_DEFAULT, v23, buf, 0xCu);

      goto LABEL_22;
    }
    goto LABEL_22;
  }
  v24 = [v7 eventUniqueIdentifiers];
  int v25 = [v24 intersectsSet:*(void *)(a1 + 48)];

  if (v25)
  {
LABEL_19:
    id v28 = *(void **)(a1 + 64);
    id v29 = [v3 uniqueIdentifier];
    [v28 addObject:v29];

    id v21 = HFLogForCategory(0x17uLL);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = objc_msgSend(v3, "hf_prettyDescription");
      *(_DWORD *)buf = 138412290;
      id v53 = v22;
      id v23 = "Added event to replacedIdentifiers: %@";
      goto LABEL_21;
    }
LABEL_22:
  }
LABEL_23:
  uint64_t v30 = *(void **)(a1 + 80);
  id v31 = *(id *)(a1 + 72);
  id v32 = v30;
  id v33 = v3;
  uint64_t v34 = [v33 dateOfOccurrence];
  id v35 = objc_msgSend(v34, "hf_startOfDay");

  if ([v33 containerType] == 1)
  {
    id v36 = [v31 objectForKey:v35];
    id v37 = v36;
    if (v36)
    {
      id v38 = [v36 dateOfOccurrence];
      id v39 = [v33 dateOfOccurrence];
      uint64_t v40 = [v38 compare:v39];

      if (v40 != 1) {
        goto LABEL_34;
      }
    }
    uint64_t v41 = objc_opt_class();
    id v42 = v33;
    if (v42)
    {
      if (objc_opt_isKindOfClass()) {
        id v43 = v42;
      }
      else {
        id v43 = 0;
      }
      v44 = v42;
      if (v43) {
        goto LABEL_33;
      }
      uint64_t v45 = [MEMORY[0x263F08690] currentHandler];
      id v46 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      [v45 handleFailureInFunction:v46, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v41, objc_opt_class() file lineNumber description];
    }
    v44 = 0;
LABEL_33:

    [v31 setObject:v44 forKey:v35];
LABEL_34:
  }
  id v47 = [v32 objectForKey:v35];
  id v48 = v47;
  if (!v47
    || ([v47 dateOfOccurrence],
        v49 = objc_claimAutoreleasedReturnValue(),
        [v33 dateOfOccurrence],
        uint64_t v50 = objc_claimAutoreleasedReturnValue(),
        uint64_t v51 = [v49 compare:v50],
        v50,
        v49,
        v51 == 1))
  {
    [v32 setObject:v33 forKey:v35];
  }
}

void __108__HFCameraPlaybackEngineEventCache__generateViewModelWithUpdatedIdentifiers_replacedIdentifiers_completion___block_invoke_14(uint64_t a1, void *a2, uint64_t a3)
{
  id v26 = a2;
  uint64_t v5 = [v26 containerType];
  if (v5 == 2)
  {
    uint64_t v21 = objc_opt_class();
    id v22 = v26;
    if (v22)
    {
      if (objc_opt_isKindOfClass()) {
        id v23 = v22;
      }
      else {
        id v23 = 0;
      }
      id v9 = v22;
      if (v23)
      {
LABEL_26:

        if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) && ([v9 isReachable] & 1) == 0) {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v9);
        }
        goto LABEL_29;
      }
      v24 = [MEMORY[0x263F08690] currentHandler];
      int v25 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      [v24 handleFailureInFunction:v25, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v21, objc_opt_class() file lineNumber description];
    }
    id v9 = 0;
    goto LABEL_26;
  }
  if (v5 != 1) {
    goto LABEL_30;
  }
  uint64_t v6 = objc_opt_class();
  id v7 = v26;
  if (v7)
  {
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
    id v9 = v7;
    if (v8) {
      goto LABEL_10;
    }
    double v10 = [MEMORY[0x263F08690] currentHandler];
    int v11 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v10 handleFailureInFunction:v11, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v6, objc_opt_class() file lineNumber description];
  }
  id v9 = 0;
LABEL_10:

  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    double v12 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3 - 1];
    objc_opt_class();
    id v13 = v12;
    if (objc_opt_isKindOfClass()) {
      double v14 = v13;
    }
    else {
      double v14 = 0;
    }
    id v15 = v14;

    if ([v15 isReachable]) {
      id v16 = v15;
    }
    else {
      id v16 = v9;
    }
    id v17 = v16;
    id v18 = [[HFCameraScrubberReachabilityEventContainer alloc] initWithStartEvent:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) endEvent:v17];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    uint64_t v19 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [*(id *)(a1 + 40) addObject:v9];
LABEL_29:

LABEL_30:
}

uint64_t __108__HFCameraPlaybackEngineEventCache__generateViewModelWithUpdatedIdentifiers_replacedIdentifiers_completion___block_invoke_17(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

+ (BOOL)isValidEvent:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = v5;

  if (v6 && [v6 quality])
  {
    id v7 = HFLogForCategory(0x17uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = v6;
      _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "[INVALID]: timeline ineligible: %@", (uint8_t *)&v16, 0xCu);
    }

LABEL_9:
    BOOL v8 = 0;
    goto LABEL_18;
  }

  id v9 = v4;
  if ([v9 isComplete])
  {
    [v9 duration];
    if (fabs(v10) < 2.22044605e-16)
    {
      uint64_t v6 = HFLogForCategory(0x17uLL);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138412290;
        id v17 = v9;
        _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "[INVALID]: not displayable: %@", (uint8_t *)&v16, 0xCu);
      }
      goto LABEL_9;
    }
  }

  int v11 = v9;
  uint64_t v6 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:-*MEMORY[0x263F0BB18]];
  double v12 = [v11 dateOfOccurrence];
  uint64_t v13 = [v12 compare:v6];

  BOOL v8 = v13 == 1;
  if (v13 != 1)
  {
    double v14 = HFLogForCategory(0x17uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = v11;
      _os_log_impl(&dword_20B986000, v14, OS_LOG_TYPE_DEFAULT, "[INVALID]: expired: %@", (uint8_t *)&v16, 0xCu);
    }
  }
LABEL_18:

  return v8;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = HFLogForCategory(0x17uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v6 = "-[HFCameraPlaybackEngineEventCache dealloc]";
    _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)HFCameraPlaybackEngineEventCache;
  [(HFCameraPlaybackEngineEventCache *)&v4 dealloc];
}

- (void)_setupDebugHandler
{
  objc_initWeak(&location, self);
  v2 = +[HFDebugStateDumpManager sharedInstance];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __54__HFCameraPlaybackEngineEventCache__setupDebugHandler__block_invoke;
  v6[3] = &unk_26408CBE8;
  objc_copyWeak(&v7, &location);
  id v3 = (objc_class *)objc_opt_class();
  objc_super v4 = NSStringFromClass(v3);
  id v5 = (id)[v2 registerStateDumpHandler:v6 withName:v4];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

id __54__HFCameraPlaybackEngineEventCache__setupDebugHandler__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = +[HFStateDumpBuilderContext contextWithDetailLevel:2];
    id v3 = +[HFStateDumpBuilder builderWithObject:WeakRetained context:v2];

    objc_super v4 = [WeakRetained events];
    [v3 setObject:v4 forKeyedSubscript:@"events"];

    id v5 = [WeakRetained clips];
    [v3 setObject:v5 forKeyedSubscript:@"clips"];

    uint64_t v6 = [WeakRetained firstOfTheDayEvents];
    [v3 setObject:v6 forKeyedSubscript:@"firstOfTheDayEvents"];

    id v7 = [WeakRetained firstOfTheDayClips];
    [v3 setObject:v7 forKeyedSubscript:@"firstOfTheDayClips"];

    BOOL v8 = [v3 buildPropertyListRepresentation];
  }
  else
  {
    BOOL v8 = (void *)MEMORY[0x263EFFA78];
  }

  return v8;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_firstOfTheDayEvents, 0);
  objc_storeStrong((id *)&self->_firstOfTheDayClips, 0);
  objc_storeStrong((id *)&self->_clipWithLongestDuration, 0);
  objc_storeStrong((id *)&self->_clips, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_rawEventsByUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_rawEvents, 0);
}

@end