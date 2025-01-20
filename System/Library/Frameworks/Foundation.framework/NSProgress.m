@interface NSProgress
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (NSProgress)currentProgress;
+ (NSProgress)discreteProgressWithTotalUnitCount:(int64_t)unitCount;
+ (NSProgress)progressWithTotalUnitCount:(int64_t)unitCount;
+ (NSProgress)progressWithTotalUnitCount:(int64_t)unitCount parent:(NSProgress *)parent pendingUnitCount:(int64_t)portionOfParentTotalUnitCount;
+ (id)_addSubscriberForCategory:(id)a3 usingPublishingHandler:(id)a4;
+ (id)_publisherInterface;
+ (id)_registrarInterface;
+ (id)_serverConnection;
+ (id)_subscriberInterface;
+ (id)addSubscriberForFileURL:(NSURL *)url withPublishingHandler:(NSProgressPublishingHandler)publishingHandler;
+ (id)keyPathsForValuesAffectingLocalizedAdditionalDescription;
+ (id)keyPathsForValuesAffectingLocalizedDescription;
+ (void)removeSubscriber:(id)subscriber;
- (BOOL)_adoptChildUserInfo;
- (BOOL)isCancellable;
- (BOOL)isCancelled;
- (BOOL)isFinished;
- (BOOL)isIndeterminate;
- (BOOL)isOld;
- (BOOL)isPausable;
- (BOOL)isPaused;
- (BOOL)isPrioritizable;
- (NSDictionary)userInfo;
- (NSNumber)estimatedTimeRemaining;
- (NSNumber)fileCompletedCount;
- (NSNumber)fileTotalCount;
- (NSNumber)throughput;
- (NSProgress)init;
- (NSProgress)initWithParent:(NSProgress *)parentProgressOrNil userInfo:(NSDictionary *)userInfoOrNil;
- (NSProgressFileOperationKind)fileOperationKind;
- (NSProgressKind)kind;
- (NSString)description;
- (NSString)localizedAdditionalDescription;
- (NSString)localizedDescription;
- (NSURL)fileURL;
- (double)_remoteFractionCompleted;
- (double)fractionCompleted;
- (id)_indentedDescription:(unint64_t)a3;
- (id)_initWithValues:(id)a3;
- (id)_parent;
- (id)_publishingAppBundleIdentifier;
- (id)acknowledgementHandlerForAppBundleIdentifier:(id)a3;
- (id)byteCompletedCount;
- (id)byteTotalCount;
- (id)ownedDictionaryKeyEnumerator;
- (id)ownedDictionaryObjectForKey:(id)a3;
- (id)prioritizationHandler;
- (int64_t)completedUnitCount;
- (int64_t)totalUnitCount;
- (unint64_t)ownedDictionaryCount;
- (void)_addCompletedUnitCount:(int64_t)a3;
- (void)_addImplicitChild:(id)a3;
- (void)_notifyRemoteObserversOfUserInfoValueForKey:(id)a3;
- (void)_notifyRemoteObserversOfValueForKeys:(id)a3;
- (void)_receiveProgressMessage:(void *)result forSequence:(xpc_object_t)xdict;
- (void)_setCancellable:(BOOL)a3 fromChild:(BOOL)a4;
- (void)_setCompletedUnitCount:(int64_t)a3 totalUnitCount:(int64_t)a4;
- (void)_setParent:(id)a3 portion:(int64_t)a4;
- (void)_setPausable:(BOOL)a3 fromChild:(BOOL)a4;
- (void)_setRemoteUserInfoValue:(id)a3 forKey:(id)a4;
- (void)_setRemoteValues:(id)a3 forKeys:(id)a4;
- (void)_setUserInfoValue:(id)a3 forKey:(id)a4 fromChild:(BOOL)a5;
- (void)_setValueForKeys:(id)a3 settingBlock:(id)a4;
- (void)_updateChild:(id)a3 fraction:(_NSProgressFractionTuple *)a4 portion:(int64_t)a5;
- (void)_updateFractionCompleted:(_NSProgressFractionTuple *)a3;
- (void)addChild:(NSProgress *)child withPendingUnitCount:(int64_t)inUnitCount;
- (void)appWithBundleID:(id)a3 didAcknowledgeWithSuccess:(BOOL)a4;
- (void)becomeCurrentWithPendingUnitCount:(int64_t)unitCount;
- (void)cancel;
- (void)cancellationHandler;
- (void)dealloc;
- (void)handleAcknowledgementByAppWithBundleIdentifier:(id)a3 usingBlock:(id)a4;
- (void)pause;
- (void)pausingHandler;
- (void)performAsCurrentWithPendingUnitCount:(int64_t)unitCount usingBlock:(void *)work;
- (void)prioritize;
- (void)publish;
- (void)resignCurrent;
- (void)resume;
- (void)resumingHandler;
- (void)setAcknowledgementHandler:(id)a3 forAppBundleIdentifier:(id)a4;
- (void)setByteCompletedCount:(id)a3;
- (void)setByteTotalCount:(id)a3;
- (void)setCancellable:(BOOL)cancellable;
- (void)setCancellationHandler:(void *)cancellationHandler;
- (void)setCompletedUnitCount:(int64_t)completedUnitCount;
- (void)setEstimatedTimeRemaining:(NSNumber *)estimatedTimeRemaining;
- (void)setFileCompletedCount:(NSNumber *)fileCompletedCount;
- (void)setFileOperationKind:(NSProgressFileOperationKind)fileOperationKind;
- (void)setFileTotalCount:(NSNumber *)fileTotalCount;
- (void)setFileURL:(NSURL *)fileURL;
- (void)setKind:(NSProgressKind)kind;
- (void)setLocalizedAdditionalDescription:(NSString *)localizedAdditionalDescription;
- (void)setLocalizedDescription:(NSString *)localizedDescription;
- (void)setPausable:(BOOL)pausable;
- (void)setPausingHandler:(void *)pausingHandler;
- (void)setPrioritizable:(BOOL)a3;
- (void)setPrioritizationHandler:(id)a3;
- (void)setResumingHandler:(void *)resumingHandler;
- (void)setThroughput:(NSNumber *)throughput;
- (void)setTotalUnitCount:(int64_t)totalUnitCount;
- (void)setUserInfoObject:(id)objectOrNil forKey:(NSProgressUserInfoKey)key;
- (void)set_adoptChildUserInfo:(BOOL)a3;
- (void)unpublish;
@end

@implementation NSProgress

- (void)_setValueForKeys:(id)a3 settingBlock:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [(NSLock *)self->_lock lock];
  v7 = (void *)(*((uint64_t (**)(id, NSProgressValues *))a3 + 2))(a3, self->_values);
  [(NSLock *)self->_lock unlock];
  if (v7)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v13 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          [(NSProgress *)self willChangeValueForKey:*(void *)(*((void *)&v14 + 1) + 8 * v11++)];
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v13 count:16];
      }
      while (v9);
    }
    [(NSLock *)self->_lock lock];
    (*((void (**)(id, NSProgressValues *))a4 + 2))(a4, self->_values);
    [(NSProgress *)self _notifyRemoteObserversOfValueForKeys:v7];
    [(NSLock *)self->_lock unlock];
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __44__NSProgress__setValueForKeys_settingBlock___block_invoke;
  v12[3] = &unk_1E51FCAD8;
  v12[4] = self;
  [v7 enumerateObjectsWithOptions:2 usingBlock:v12];
}

- (void)_notifyRemoteObserversOfValueForKeys:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (self->_publisherID)
  {
    v23 = (void *)[MEMORY[0x1E4F1CA48] array];
    v22 = (void *)[MEMORY[0x1E4F1CA48] array];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v4 = [a3 countByEnumeratingWithState:&v31 objects:v30 count:16];
    if (v4)
    {
      uint64_t v6 = v4;
      uint64_t v25 = *(void *)v32;
      *(void *)&long long v5 = 134218242;
      long long v21 = v5;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v32 != v25) {
            objc_enumerationMutation(a3);
          }
          uint64_t v8 = *(void *)(*((void *)&v31 + 1) + 8 * v7);
          lastNotificationTimesByKey = self->_lastNotificationTimesByKey;
          if (!lastNotificationTimesByKey)
          {
            lastNotificationTimesByKey = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
            self->_lastNotificationTimesByKey = lastNotificationTimesByKey;
          }
          objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](lastNotificationTimesByKey, "objectForKeyedSubscript:", v8, v21), "doubleValue");
          double v11 = v10;
          [+[NSProcessInfo processInfo] systemUptime];
          double v13 = v12;
          if (qword_1EB1ECEF8 != -1) {
            dispatch_once(&qword_1EB1ECEF8, &__block_literal_global_320);
          }
          int v14 = [(id)qword_1EB1ECF00 containsObject:v8];
          values = self->_values;
          int64_t completed = values->_selfFraction.completed;
          if (!completed) {
            goto LABEL_19;
          }
          if (v13 - v11 > 0.0166666667 || completed == values->_selfFraction.total) {
            int v14 = 1;
          }
          if (v14 != 1)
          {
            if (qword_1EB1ECEE0 != -1) {
              dispatch_once(&qword_1EB1ECEE0, &__block_literal_global_90);
            }
            v20 = _MergedGlobals_25_1;
            if (os_log_type_enabled((os_log_t)_MergedGlobals_25_1, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v21;
              v27 = self;
              __int16 v28 = 2114;
              uint64_t v29 = v8;
              _os_log_debug_impl(&dword_181795000, v20, OS_LOG_TYPE_DEBUG, "<NSProgress %p> Dropped remote update for key %{public}@ due to throttling", buf, 0x16u);
            }
          }
          else
          {
LABEL_19:
            uint64_t v18 = [(NSProgressValues *)values valueForKey:v8];
            if (v18)
            {
              objc_msgSend(v23, "addObject:", v18, v19);
              [v22 addObject:v8];
              [(NSMutableDictionary *)lastNotificationTimesByKey setObject:+[NSNumber numberWithDouble:v13] forKeyedSubscript:v8];
            }
          }
          ++v7;
        }
        while (v6 != v7);
        uint64_t v6 = [a3 countByEnumeratingWithState:&v31 objects:v30 count:16];
      }
      while (v6);
    }
    if ([v23 count]) {
      objc_msgSend((id)objc_msgSend(+[NSProgress _serverConnection](NSProgress, "_serverConnection"), "remoteObjectProxy"), "observePublisherForID:values:forKeys:", self->_publisherID, v23, v22);
    }
  }
}

void *__36__NSProgress_setCompletedUnitCount___block_invoke(uint64_t a1, uint64_t a2)
{
  return keysChangedForFractionCompletedValues(a2, *(void *)(a1 + 40), *(void *)(a2 + 24));
}

void *__32__NSProgress_setTotalUnitCount___block_invoke(uint64_t a1, uint64_t a2)
{
  return keysChangedForFractionCompletedValues(a2, *(void *)(a2 + 16), *(void *)(a1 + 40));
}

double __37__NSProgress__addCompletedUnitCount___block_invoke_2(void *a1, void *a2)
{
  [a2 overallFraction];
  uint64_t v4 = *(void *)(a1[4] + 8);
  *(_OWORD *)(v4 + 32) = v9;
  *(void *)(v4 + 48) = v10;
  a2[2] += a1[6];
  [a2 overallFraction];
  uint64_t v5 = *(void *)(a1[4] + 8);
  double result = *(double *)&v7;
  *(_OWORD *)(v5 + 56) = v7;
  *(void *)(v5 + 72) = v8;
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
  return result;
}

void *__37__NSProgress__addCompletedUnitCount___block_invoke(uint64_t a1, uint64_t a2)
{
  return keysChangedForFractionCompletedValues(a2, *(void *)(a1 + 40) + *(void *)(a2 + 16), *(void *)(a2 + 24));
}

void *__26__NSProgress_setPausable___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(unsigned __int8 *)(a2 + 105) == *(unsigned __int8 *)(a1 + 32)) {
    return 0;
  }
  else {
    return &unk_1ECAB82E8;
  }
}

void *__29__NSProgress_setCancellable___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(unsigned __int8 *)(a2 + 104) == *(unsigned __int8 *)(a1 + 32)) {
    return 0;
  }
  else {
    return &unk_1ECAB82D0;
  }
}

void __20__NSProgress_cancel__block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(a2 + 106) = 1;
}

void *__20__NSProgress_cancel__block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a2 + 106)) {
    return 0;
  }
  else {
    return &unk_1ECAB8300;
  }
}

uint64_t __22__NSProgress_setKind___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) copy];
  *(void *)(a2 + 88) = result;
  return result;
}

void *__22__NSProgress_setKind___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 32) == *(void *)(a2 + 88)) {
    return 0;
  }
  else {
    return &unk_1ECAB8348;
  }
}

uint64_t __44__NSProgress__setValueForKeys_settingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) didChangeValueForKey:a2];
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (id)ownedDictionaryKeyEnumerator
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [(NSLock *)self->_lock lock];
  values = self->_values;
  userInfo = values->_userInfo;
  if (!userInfo)
  {
    userInfo = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    values->_userInfo = userInfo;
  }
  uint64_t v5 = (void *)[(NSMutableDictionary *)userInfo allKeys];
  uint64_t v11 = 0;
  double v12 = &v11;
  uint64_t v13 = 0x3052000000;
  int v14 = __Block_byref_object_copy__34;
  long long v15 = __Block_byref_object_dispose__34;
  uint64_t v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __42__NSProgress_ownedDictionaryKeyEnumerator__block_invoke;
  v10[3] = &unk_1E51F8A60;
  v10[4] = v5;
  v10[5] = &v11;
  [v5 enumerateObjectsUsingBlock:v10];
  uint64_t v6 = (void *)v12[5];
  if (v6)
  {
    id v7 = (id)[v6 objectEnumerator];
  }
  else
  {
    id v7 = (id)[(NSMutableDictionary *)values->_userInfo keyEnumerator];
  }
  [(NSLock *)self->_lock unlock];
  id v8 = v7;
  _Block_object_dispose(&v11, 8);
  return v8;
}

+ (NSProgress)currentProgress
{
  uint64_t result = (NSProgress *)_CFGetTSD();
  if (result)
  {
    v3 = result->super.isa;
    return (NSProgress *)v3;
  }
  return result;
}

- (int64_t)totalUnitCount
{
  [(NSLock *)self->_lock lock];
  int64_t total = self->_values->_selfFraction.total;
  [(NSLock *)self->_lock unlock];
  return total;
}

- (void)setCancellationHandler:(void *)cancellationHandler
{
  [(NSLock *)self->_lock lock];
  id v5 = self->_cancellationHandler;
  if (v5 != cancellationHandler)
  {

    cancellationHandler = (void *)[cancellationHandler copy];
    self->_cancellationHandler = cancellationHandler;
  }
  if (self->_values->_isCancelled && cancellationHandler != 0)
  {
    qos_class_t v7 = qos_class_self();
    global_queue = dispatch_get_global_queue(v7, 0);
    dispatch_async(global_queue, self->_cancellationHandler);
  }
  lock = self->_lock;

  [(NSLock *)lock unlock];
}

- (void)setResumingHandler:(void *)resumingHandler
{
  [(NSLock *)self->_lock lock];
  id v5 = self->_resumingHandler;
  if (v5 != resumingHandler)
  {

    self->_resumingHandler = (id)[resumingHandler copy];
  }
  lock = self->_lock;

  [(NSLock *)lock unlock];
}

- (void)setPausingHandler:(void *)pausingHandler
{
  [(NSLock *)self->_lock lock];
  id v5 = self->_pausingHandler;
  if (v5 != pausingHandler)
  {

    pausingHandler = (void *)[pausingHandler copy];
    self->_pausingHandler = pausingHandler;
  }
  if (self->_values->_isPaused && pausingHandler != 0)
  {
    qos_class_t v7 = qos_class_self();
    global_queue = dispatch_get_global_queue(v7, 0);
    dispatch_async(global_queue, self->_pausingHandler);
  }
  lock = self->_lock;

  [(NSLock *)lock unlock];
}

- (void)set_adoptChildUserInfo:(BOOL)a3
{
  if (a3) {
    unint64_t v3 = self->_flags | 2;
  }
  else {
    unint64_t v3 = -3;
  }
  self->_flags = v3;
}

- (BOOL)isPausable
{
  [(NSLock *)self->_lock lock];
  BOOL isPausable = self->_values->_isPausable;
  [(NSLock *)self->_lock unlock];
  return isPausable;
}

- (BOOL)isCancellable
{
  [(NSLock *)self->_lock lock];
  BOOL isCancellable = self->_values->_isCancellable;
  [(NSLock *)self->_lock unlock];
  return isCancellable;
}

- (void).cxx_destruct
{
}

- (unint64_t)ownedDictionaryCount
{
  [(NSLock *)self->_lock lock];
  unint64_t v3 = [(NSMutableDictionary *)self->_values->_userInfo count];
  [(NSLock *)self->_lock unlock];
  return v3;
}

- (void)setKind:(NSProgressKind)kind
{
  v4[5] = *MEMORY[0x1E4F143B8];
  v3[4] = kind;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __22__NSProgress_setKind___block_invoke;
  v4[3] = &unk_1E51FEBA8;
  v4[4] = kind;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __22__NSProgress_setKind___block_invoke_2;
  v3[3] = &unk_1E51FEBD0;
  [(NSProgress *)self _setValueForKeys:v4 settingBlock:v3];
}

- (void)cancel
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [(NSProgress *)self _setValueForKeys:&__block_literal_global_391 settingBlock:&__block_literal_global_396];
  [(NSLock *)self->_lock lock];
  id cancellationHandler = self->_cancellationHandler;
  if (cancellationHandler)
  {
    id v4 = cancellationHandler;
    qos_class_t v5 = qos_class_self();
    global_queue = dispatch_get_global_queue(v5, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __20__NSProgress_cancel__block_invoke_3;
    block[3] = &unk_1E51F8650;
    block[4] = v4;
    dispatch_async(global_queue, block);
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  children = self->_children;
  uint64_t v8 = [(NSMutableSet *)children countByEnumeratingWithState:&v14 objects:v13 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(children);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * i) cancel];
      }
      uint64_t v9 = [(NSMutableSet *)children countByEnumeratingWithState:&v14 objects:v13 count:16];
    }
    while (v9);
  }
  [(NSLock *)self->_lock unlock];
}

double __52__NSProgress__setCompletedUnitCount_totalUnitCount___block_invoke_2(void *a1, void *a2)
{
  [a2 overallFraction];
  uint64_t v4 = *(void *)(a1[4] + 8);
  *(_OWORD *)(v4 + 32) = v9;
  *(void *)(v4 + 48) = v10;
  a2[2] = a1[6];
  a2[3] = a1[7];
  [a2 overallFraction];
  uint64_t v5 = *(void *)(a1[4] + 8);
  double result = *(double *)&v7;
  *(_OWORD *)(v5 + 56) = v7;
  *(void *)(v5 + 72) = v8;
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
  return result;
}

- (void)setCancellable:(BOOL)cancellable
{
  BOOL v3 = cancellable;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __29__NSProgress_setCancellable___block_invoke;
  v7[3] = &__block_descriptor_33_e35___NSArray_16__0__NSProgressValues_8l;
  BOOL v8 = cancellable;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__NSProgress_setCancellable___block_invoke_2;
  v5[3] = &__block_descriptor_33_e26_v16__0__NSProgressValues_8l;
  BOOL v6 = cancellable;
  [(NSProgress *)self _setValueForKeys:v7 settingBlock:v5];
  [objc_loadWeak((id *)&self->_parent) _setCancellable:v3 fromChild:1];
}

- (void)_setCompletedUnitCount:(int64_t)a3 totalUnitCount:(int64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = 0;
  long long v14 = &v13;
  uint64_t v15 = 0x5010000000;
  long long v16 = &unk_18246906D;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__NSProgress__setCompletedUnitCount_totalUnitCount___block_invoke;
  v8[3] = &unk_1E51FEB10;
  v8[4] = self;
  v8[5] = a3;
  v8[6] = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__NSProgress__setCompletedUnitCount_totalUnitCount___block_invoke_2;
  v7[3] = &unk_1E51FEB38;
  v7[6] = a3;
  v7[7] = a4;
  void v7[4] = &v13;
  v7[5] = &v9;
  [(NSProgress *)self _setValueForKeys:v8 settingBlock:v7];
  if (*((unsigned char *)v10 + 24))
  {
    long long v5 = *((_OWORD *)v14 + 3);
    v6[0] = *((_OWORD *)v14 + 2);
    v6[1] = v5;
    v6[2] = *((_OWORD *)v14 + 4);
    [(NSProgress *)self _updateFractionCompleted:v6];
  }
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
}

- (void)setPausable:(BOOL)pausable
{
  BOOL v3 = pausable;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __26__NSProgress_setPausable___block_invoke;
  v7[3] = &__block_descriptor_33_e35___NSArray_16__0__NSProgressValues_8l;
  BOOL v8 = pausable;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __26__NSProgress_setPausable___block_invoke_2;
  v5[3] = &__block_descriptor_33_e26_v16__0__NSProgressValues_8l;
  BOOL v6 = pausable;
  [(NSProgress *)self _setValueForKeys:v7 settingBlock:v5];
  [objc_loadWeak((id *)&self->_parent) _setPausable:v3 fromChild:1];
}

- (void)resignCurrent
{
  uint64_t v4 = (NSProgress **)_CFGetTSD();
  if (!v4 || (long long v5 = v4, *v4 != self))
  {
    BOOL v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: NSProgress was not the current progress on this thread %@", _NSMethodExceptionProem((objc_class *)self, a2), +[NSThread currentThread](NSThread, "currentThread")), 0 reason userInfo];
    objc_exception_throw(v6);
  }
  pthread_self();
  if (!*((unsigned char *)v5 + 24)) {
    [(NSProgress *)self _addCompletedUnitCount:v5[2]];
  }
  _CFSetTSD();

  free(v5);
}

- (void)_addCompletedUnitCount:(int64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x5010000000;
  uint64_t v15 = &unk_18246906D;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__NSProgress__addCompletedUnitCount___block_invoke;
  v7[3] = &unk_1E51FEAC0;
  void v7[4] = self;
  v7[5] = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__NSProgress__addCompletedUnitCount___block_invoke_2;
  _OWORD v6[3] = &unk_1E51FEAE8;
  v6[5] = &v8;
  v6[6] = a3;
  v6[4] = &v12;
  [(NSProgress *)self _setValueForKeys:v7 settingBlock:v6];
  if (*((unsigned char *)v9 + 24))
  {
    long long v4 = *((_OWORD *)v13 + 3);
    v5[0] = *((_OWORD *)v13 + 2);
    v5[1] = v4;
    v5[2] = *((_OWORD *)v13 + 4);
    [(NSProgress *)self _updateFractionCompleted:v5];
  }
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
}

- (double)fractionCompleted
{
  [(NSLock *)self->_lock lock];
  [(NSProgressValues *)self->_values fractionCompleted];
  double v4 = v3;
  [(NSLock *)self->_lock unlock];
  return v4;
}

- (void)_addImplicitChild:(id)a3
{
  uint64_t v5 = _CFGetTSD();
  if (!*(unsigned char *)(v5 + 24))
  {
    uint64_t v6 = v5;
    [(NSProgress *)self addChild:a3 withPendingUnitCount:*(void *)(v5 + 16)];
    *(unsigned char *)(v6 + 24) = 1;
  }
}

- (void)addChild:(NSProgress *)child withPendingUnitCount:(int64_t)inUnitCount
{
  id v8 = [(NSProgress *)child _parent];
  if (v8)
  {
    uint64_t v10 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: NSProgress %p was already the child of another progress %p", _NSMethodExceptionProem((objc_class *)self, a2), child, v8), 0 reason userInfo];
    objc_exception_throw(v10);
  }
  [(NSLock *)self->_lock lock];
  children = self->_children;
  if (!children)
  {
    children = (NSMutableSet *)(id)[MEMORY[0x1E4F1CA80] set];
    self->_children = children;
  }
  [(NSMutableSet *)children addObject:child];
  [(NSLock *)self->_lock unlock];
  [(NSProgress *)child _setParent:self portion:inUnitCount];
  if ([(NSProgress *)self isCancelled]) {
    [(NSProgress *)child cancel];
  }
  if ([(NSProgress *)self isPaused])
  {
    [(NSProgress *)child pause];
  }
}

- (BOOL)isCancelled
{
  [(NSLock *)self->_lock lock];
  BOOL isCancelled = self->_values->_isCancelled;
  [(NSLock *)self->_lock unlock];
  return isCancelled;
}

- (BOOL)isPaused
{
  [(NSLock *)self->_lock lock];
  BOOL isPaused = self->_values->_isPaused;
  [(NSLock *)self->_lock unlock];
  return isPaused;
}

- (void)_setParent:(id)a3 portion:(int64_t)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [(NSLock *)self->_lock lock];
  objc_storeWeak((id *)&self->_parent, a3);
  self->_values->_portionOfParent = a4;
  long long v11 = 0uLL;
  *(void *)uint64_t v12 = 0;
  values = self->_values;
  if (values)
  {
    [(NSProgressValues *)values overallFraction];
  }
  else
  {
    long long v8 = 0uLL;
    *(void *)&long long v9 = 0;
  }
  *(_OWORD *)&v12[8] = v8;
  *(void *)&v12[24] = v9;
  [(NSLock *)self->_lock unlock];
  long long v8 = v11;
  long long v9 = *(_OWORD *)v12;
  long long v10 = *(_OWORD *)&v12[16];
  [a3 _updateChild:self fraction:&v8 portion:a4];
}

+ (NSProgress)discreteProgressWithTotalUnitCount:(int64_t)unitCount
{
  double v4 = (void *)[objc_alloc((Class)a1) initWithParent:0 userInfo:0];
  [v4 setTotalUnitCount:unitCount];

  return (NSProgress *)v4;
}

+ (NSProgress)progressWithTotalUnitCount:(int64_t)unitCount
{
  double v4 = objc_msgSend(objc_alloc((Class)a1), "initWithParent:userInfo:", objc_msgSend(a1, "currentProgress"), 0);
  [v4 setTotalUnitCount:unitCount];

  return (NSProgress *)v4;
}

- (NSProgress)initWithParent:(NSProgress *)parentProgressOrNil userInfo:(NSDictionary *)userInfoOrNil
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (parentProgressOrNil && (NSProgress *)[(id)objc_opt_class() currentProgress] != parentProgressOrNil)
  {
    long long v10 = +[NSString stringWithFormat:@"%@: The parent of an NSProgress object must be the currentProgress.", _NSMethodExceptionProem((objc_class *)self, a2)];

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v10 userInfo:0]);
  }
  v11.receiver = self;
  v11.super_class = (Class)NSProgress;
  long long v8 = [(NSProgress *)&v11 init];
  if (v8)
  {
    v8->_lock = (NSLock *)objc_opt_new();
    v8->_values = objc_alloc_init(NSProgressValues);
    v8->_values->_userInfo = (NSMutableDictionary *)[(NSDictionary *)userInfoOrNil mutableCopy];
    if (parentProgressOrNil) {
      [(NSProgress *)parentProgressOrNil _addImplicitChild:v8];
    }
  }
  return v8;
}

double __44__NSProgress__updateChild_fraction_portion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  [a2 overallFraction];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  *(_OWORD *)(v4 + 32) = v25;
  *(void *)(v4 + 48) = v26;
  uint64_t v5 = a2[3];
  *(void *)&long long v23 = *(void *)(a1 + 64);
  *((void *)&v23 + 1) = v5;
  uint64_t v24 = 0;
  uint64_t v6 = (uint64_t *)(a1 + 96);
  uint64_t v22 = 0;
  long long v21 = *(_OWORD *)(a1 + 72);
  LOBYTE(v22) = *(unsigned char *)(a1 + 88);
  _NSProgressFractionMultiplyByFraction((uint64_t *)&v21, (uint64_t *)&v23);
  uint64_t v7 = *(void *)(a1 + 72);
  if ((v7 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(a1 + 80);
    if ((v8 & 0x8000000000000000) == 0)
    {
      if (v8 | v7) {
        _NSProgressFractionSubtractFraction((uint64_t)(a2 + 5), (uint64_t *)&v21);
      }
    }
  }
  uint64_t v9 = *v6;
  if ((*v6 & 0x8000000000000000) == 0)
  {
    uint64_t v10 = *(void *)(a1 + 104);
    if ((v10 & 0x8000000000000000) == 0)
    {
      if (v10 | v9)
      {
        *((void *)&v19 + 1) = *(void *)(a1 + 104);
        uint64_t v20 = 0;
        *(void *)&long long v19 = v9;
        LOBYTE(v20) = *(unsigned char *)(a1 + 112);
        _NSProgressFractionMultiplyByFraction((uint64_t *)&v19, (uint64_t *)&v23);
        _NSProgressFractionAddFraction((uint64_t)(a2 + 5), (uint64_t *)&v19);
        uint64_t v9 = *(void *)(a1 + 96);
      }
    }
  }
  uint64_t v11 = *(void *)(a1 + 104);
  BOOL v12 = v11 == 0;
  BOOL v13 = v11 > 0 && v9 >= v11;
  if (v12) {
    BOOL v13 = 1;
  }
  if (v9 >= 1 && v13)
  {
    [*(id *)(*(void *)(a1 + 32) + 96) removeObject:*(void *)(a1 + 40)];
    uint64_t v14 = *(void *)(a1 + 64);
    if (v14)
    {
      a2[2] += v14;
      long long v19 = v23;
      uint64_t v20 = v24;
      _NSProgressFractionMultiplyByFraction((uint64_t *)&v19, (uint64_t *)(a1 + 96));
      _NSProgressFractionSubtractFraction((uint64_t)(a2 + 5), (uint64_t *)&v19);
    }
  }
  [a2 overallFraction];
  uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
  double result = *(double *)&v17;
  *(_OWORD *)(v15 + 56) = v17;
  *(void *)(v15 + 72) = v18;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  return result;
}

void *__44__NSProgress__updateChild_fraction_portion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v31 = *(_OWORD *)(a2 + 40);
  uint64_t v32 = *(void *)(a2 + 56);
  uint64_t v5 = *(void *)(a2 + 24);
  uint64_t v6 = *(void *)(a1 + 40);
  v30[0] = *(void *)(a1 + 32);
  v30[1] = v5;
  v30[2] = 0;
  if ((v6 & 0x8000000000000000) == 0)
  {
    uint64_t v7 = *(void *)(a1 + 48);
    if ((v7 & 0x8000000000000000) == 0)
    {
      if (v7 | v6)
      {
        *((void *)&v28 + 1) = *(void *)(a1 + 48);
        uint64_t v29 = 0;
        *(void *)&long long v28 = v6;
        LOBYTE(v29) = *(unsigned char *)(a1 + 56);
        _NSProgressFractionMultiplyByFraction((uint64_t *)&v28, v30);
        _NSProgressFractionSubtractFraction((uint64_t)&v31, (uint64_t *)&v28);
      }
    }
  }
  uint64_t v8 = *(void *)(a1 + 64);
  if ((v8 & 0x8000000000000000) == 0)
  {
    uint64_t v9 = *(void *)(a1 + 72);
    if ((v9 & 0x8000000000000000) == 0)
    {
      if (v9 | v8)
      {
        *((void *)&v28 + 1) = *(void *)(a1 + 72);
        uint64_t v29 = 0;
        *(void *)&long long v28 = v8;
        LOBYTE(v29) = *(unsigned char *)(a1 + 80);
        _NSProgressFractionMultiplyByFraction((uint64_t *)&v28, v30);
        _NSProgressFractionAddFraction((uint64_t)&v31, (uint64_t *)&v28);
      }
    }
  }
  long long v28 = v31;
  uint64_t v29 = v32;
  _NSProgressFractionAddFraction((uint64_t)&v28, (uint64_t *)(a2 + 16));
  memset(v27, 0, sizeof(v27));
  [(id)a2 overallFraction];
  if ((_NSProgressFractionIsFractionCompletedEqual((uint64_t *)&v28, v27) & 1) == 0) {
    [v4 addObject:@"fractionCompleted"];
  }
  uint64_t v10 = *(void *)(a1 + 64);
  uint64_t v11 = *(void *)(a1 + 72);
  BOOL v12 = v10 >= v11;
  if (v11 <= 0) {
    BOOL v12 = 0;
  }
  if (!v11) {
    BOOL v12 = 1;
  }
  if (v10 >= 1 && v12)
  {
    long long v25 = *(_OWORD *)(a2 + 16);
    uint64_t v26 = *(void *)(a2 + 32);
    uint64_t v13 = *(void *)(a1 + 32);
    if (v13)
    {
      *(void *)&long long v25 = v25 + v13;
      [v4 addObject:@"completedUnitCount"];
      uint64_t v10 = *(void *)(a1 + 64);
      uint64_t v11 = *(void *)(a1 + 72);
    }
    v23[1] = v11;
    uint64_t v24 = 0;
    v23[0] = v10;
    LOBYTE(v24) = *(unsigned char *)(a1 + 80);
    _NSProgressFractionMultiplyByFraction(v23, v30);
    long long v21 = v31;
    uint64_t v22 = v32;
    _NSProgressFractionSubtractFraction((uint64_t)&v21, v23);
    _NSProgressFractionAddFraction((uint64_t)&v25, (uint64_t *)&v21);
    int v14 = (uint64_t)v25 >= 1 && (uint64_t)v25 >= *((uint64_t *)&v25 + 1) && *((uint64_t *)&v25 + 1) > 0
       || (uint64_t)v25 > 0 && *((void *)&v25 + 1) == 0;
    uint64_t v16 = *(void *)(a2 + 16);
    uint64_t v17 = *(void *)(a2 + 24);
    if (v16 >= 1 && v16 >= v17 && v17 >= 1)
    {
      if (v14) {
        goto LABEL_34;
      }
      goto LABEL_33;
    }
    int v20 = v16 > 0 && v17 == 0;
    if (v14 != v20) {
LABEL_33:
    }
      [v4 addObject:@"finished"];
  }
LABEL_34:
  if ([v4 count]) {
    return v4;
  }
  else {
    return 0;
  }
}

- (void)setTotalUnitCount:(int64_t)totalUnitCount
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x5010000000;
  uint64_t v15 = &unk_18246906D;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __32__NSProgress_setTotalUnitCount___block_invoke;
  v7[3] = &unk_1E51FEAC0;
  void v7[4] = self;
  v7[5] = totalUnitCount;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __32__NSProgress_setTotalUnitCount___block_invoke_2;
  _OWORD v6[3] = &unk_1E51FEAE8;
  v6[5] = &v8;
  v6[6] = totalUnitCount;
  v6[4] = &v12;
  [(NSProgress *)self _setValueForKeys:v7 settingBlock:v6];
  if (*((unsigned char *)v9 + 24))
  {
    long long v4 = *((_OWORD *)v13 + 3);
    v5[0] = *((_OWORD *)v13 + 2);
    v5[1] = v4;
    v5[2] = *((_OWORD *)v13 + 4);
    [(NSProgress *)self _updateFractionCompleted:v5];
  }
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
}

- (void)setCompletedUnitCount:(int64_t)completedUnitCount
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x5010000000;
  uint64_t v15 = &unk_18246906D;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__NSProgress_setCompletedUnitCount___block_invoke;
  v7[3] = &unk_1E51FEAC0;
  void v7[4] = self;
  v7[5] = completedUnitCount;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__NSProgress_setCompletedUnitCount___block_invoke_2;
  _OWORD v6[3] = &unk_1E51FEAE8;
  v6[5] = &v8;
  v6[6] = completedUnitCount;
  v6[4] = &v12;
  [(NSProgress *)self _setValueForKeys:v7 settingBlock:v6];
  if (*((unsigned char *)v9 + 24))
  {
    long long v4 = *((_OWORD *)v13 + 3);
    v5[0] = *((_OWORD *)v13 + 2);
    v5[1] = v4;
    v5[2] = *((_OWORD *)v13 + 4);
    [(NSProgress *)self _updateFractionCompleted:v5];
  }
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
}

double __32__NSProgress_setTotalUnitCount___block_invoke_2(void *a1, uint64_t *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [a2 overallFraction];
  uint64_t v4 = *(void *)(a1[4] + 8);
  *(void *)(v4 + 48) = v14;
  *(_OWORD *)(v4 + 32) = v13;
  uint64_t v5 = a2[3];
  uint64_t v6 = a1[6];
  if (v5 >= 1 && v5 != v6)
  {
    v12[1] = a1[6];
    v12[2] = 0;
    v12[0] = v5;
    _NSProgressFractionMultiplyByFraction(a2 + 5, v12);
    uint64_t v6 = a1[6];
  }
  a2[3] = v6;
  [a2 overallFraction];
  uint64_t v8 = *(void *)(a1[4] + 8);
  double result = *(double *)&v10;
  *(_OWORD *)(v8 + 56) = v10;
  *(void *)(v8 + 72) = v11;
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
  return result;
}

double __36__NSProgress_setCompletedUnitCount___block_invoke_2(void *a1, void *a2)
{
  [a2 overallFraction];
  uint64_t v4 = *(void *)(a1[4] + 8);
  *(_OWORD *)(v4 + 32) = v9;
  *(void *)(v4 + 48) = v10;
  a2[2] = a1[6];
  [a2 overallFraction];
  uint64_t v5 = *(void *)(a1[4] + 8);
  double result = *(double *)&v7;
  *(_OWORD *)(v5 + 56) = v7;
  *(void *)(v5 + 72) = v8;
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
  return result;
}

- (void)_updateFractionCompleted:(_NSProgressFractionTuple *)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ((_NSProgressFractionIsEqual(&a3->var0.completed, &a3->var1.completed) & 1) == 0)
  {
    id v5 = [(NSProgress *)self _parent];
    int64_t portionOfParent = self->_values->_portionOfParent;
    long long v7 = *(_OWORD *)&a3->var0.overflowed;
    v8[0] = *(_OWORD *)&a3->var0.completed;
    v8[1] = v7;
    v8[2] = *(_OWORD *)&a3->var1.total;
    [v5 _updateChild:self fraction:v8 portion:portionOfParent];
  }
}

- (id)_parent
{
  return objc_loadWeak((id *)&self->_parent);
}

- (void)_updateChild:(id)a3 fraction:(_NSProgressFractionTuple *)a4 portion:(int64_t)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v24 = 0;
  long long v25 = &v24;
  uint64_t v26 = 0x5010000000;
  uint64_t v27 = &unk_18246906D;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v20 = 0;
  long long v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __44__NSProgress__updateChild_fraction_portion___block_invoke;
  v16[3] = &__block_descriptor_88_e35___NSArray_16__0__NSProgressValues_8l;
  v16[4] = a5;
  long long v6 = *(_OWORD *)&a4->var0.completed;
  long long v7 = *(_OWORD *)&a4->var1.total;
  long long v18 = *(_OWORD *)&a4->var0.overflowed;
  long long v19 = v7;
  long long v17 = v6;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __44__NSProgress__updateChild_fraction_portion___block_invoke_2;
  uint64_t v12[3] = &unk_1E51FEB80;
  v12[7] = &v20;
  v12[8] = a5;
  long long v8 = *(_OWORD *)&a4->var0.completed;
  long long v9 = *(_OWORD *)&a4->var0.overflowed;
  long long v15 = *(_OWORD *)&a4->var1.total;
  long long v14 = v9;
  long long v13 = v8;
  v12[4] = self;
  void v12[5] = a3;
  v12[6] = &v24;
  [(NSProgress *)self _setValueForKeys:v16 settingBlock:v12];
  if (*((unsigned char *)v21 + 24))
  {
    long long v10 = *((_OWORD *)v25 + 3);
    v11[0] = *((_OWORD *)v25 + 2);
    v11[1] = v10;
    v11[2] = *((_OWORD *)v25 + 4);
    [(NSProgress *)self _updateFractionCompleted:v11];
  }
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
}

- (int64_t)completedUnitCount
{
  [(NSLock *)self->_lock lock];
  int64_t completed = self->_values->_selfFraction.completed;
  [(NSLock *)self->_lock unlock];
  return completed;
}

- (void)setUserInfoObject:(id)objectOrNil forKey:(NSProgressUserInfoKey)key
{
}

- (void)_setUserInfoValue:(id)a3 forKey:(id)a4 fromChild:(BOOL)a5
{
  BOOL v5 = a5;
  [(NSLock *)self->_lock lock];
  if (v5 && (self->_flags & 2) == 0)
  {
    lock = self->_lock;
    [(NSLock *)lock unlock];
    return;
  }
  long long v13 = self->_userInfoProxy;
  [(NSLock *)self->_lock unlock];
  id v10 = a4;
  if ([a4 hasSuffix:@".data"]) {
    id v10 = (id)objc_msgSend(a4, "substringToIndex:", objc_msgSend(a4, "length") - 5);
  }
  [(NSOwnedDictionaryProxy *)v13 willChangeValueForKey:v10];
  [(NSLock *)self->_lock lock];
  values = self->_values;
  userInfo = values->_userInfo;
  if (!userInfo)
  {
    userInfo = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    values->_userInfo = userInfo;
    if (a3) {
      goto LABEL_10;
    }
LABEL_12:
    [(NSMutableDictionary *)userInfo removeObjectForKey:a4];
    goto LABEL_13;
  }
  if (!a3) {
    goto LABEL_12;
  }
LABEL_10:
  [(NSMutableDictionary *)userInfo setObject:a3 forKey:a4];
LABEL_13:
  [(NSProgress *)self _notifyRemoteObserversOfUserInfoValueForKey:a4];
  [(NSLock *)self->_lock unlock];
  objc_msgSend(-[NSProgress _parent](self, "_parent"), "_setUserInfoValue:forKey:fromChild:", a3, a4, 1);
  [(NSOwnedDictionaryProxy *)v13 didChangeValueForKey:v10];
}

- (void)_notifyRemoteObserversOfUserInfoValueForKey:(id)a3
{
  if (self->_publisherID)
  {
    BOOL v5 = (void *)-[NSMutableDictionary objectForKey:](self->_values->_userInfo, "objectForKey:");
    if (objc_lookUpClass("NSImage") && (objc_opt_isKindOfClass() & 1) != 0)
    {
      BOOL v5 = (void *)[v5 performSelector:sel_TIFFRepresentation];
      a3 = (id)[a3 stringByAppendingString:@".data"];
    }
    long long v7 = objc_msgSend(+[NSProgress _serverConnection](NSProgress, "_serverConnection", v6), "remoteObjectProxy");
    publisherID = self->_publisherID;
    [v7 observePublisherUserInfoForID:publisherID value:v5 forKey:a3];
  }
}

- (NSDictionary)userInfo
{
  [(NSLock *)self->_lock lock];
  userInfoProxy = self->_userInfoProxy;
  if (!userInfoProxy)
  {
    userInfoProxy = [[NSOwnedDictionaryProxy alloc] initWithOwner:self];
    self->_userInfoProxy = userInfoProxy;
  }
  uint64_t v4 = userInfoProxy;
  [(NSLock *)self->_lock unlock];
  return v4;
}

- (void)_setRemoteUserInfoValue:(id)a3 forKey:(id)a4
{
}

+ (id)_serverConnection
{
  if (qword_1EB1ECF40 != -1) {
    dispatch_once(&qword_1EB1ECF40, &__block_literal_global_508);
  }
  return (id)qword_1EB1ECF38;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  objc_storeWeak((id *)&self->_parent, 0);
  [(NSOwnedDictionaryProxy *)self->_userInfoProxy superRelease];

  v3.receiver = self;
  v3.super_class = (Class)NSProgress;
  [(NSProgress *)&v3 dealloc];
}

- (void)setFileTotalCount:(NSNumber *)fileTotalCount
{
}

- (void)setFileCompletedCount:(NSNumber *)fileCompletedCount
{
}

- (NSProgress)init
{
  return [(NSProgress *)self initWithParent:0 userInfo:0];
}

- (NSProgressKind)kind
{
  [(NSLock *)self->_lock lock];
  objc_super v3 = self->_values->_kind;
  [(NSLock *)self->_lock unlock];

  return v3;
}

- (id)ownedDictionaryObjectForKey:(id)a3
{
  [(NSLock *)self->_lock lock];
  values = self->_values;
  id v6 = (id)[(NSMutableDictionary *)values->_userInfo objectForKey:a3];
  if (!v6)
  {
    if ([a3 isEqualToString:@"NSProgressPhysicalFileURLKey"])
    {
      id v7 = (id)[(NSMutableDictionary *)values->_userInfo objectForKey:@"NSProgressFileURLKey"];
LABEL_7:
      id v6 = v7;
      goto LABEL_9;
    }
    uint64_t v8 = -[NSMutableDictionary objectForKey:](values->_userInfo, "objectForKey:", [a3 stringByAppendingString:@".data"]);
    if (v8)
    {
      uint64_t v9 = v8;
      if (_NSIsNSData())
      {
        id v7 = (id)[objc_alloc(objc_lookUpClass("NSImage")) performSelector:sel_initWithData_ withObject:v9];
        goto LABEL_7;
      }
    }
    id v6 = 0;
  }
LABEL_9:
  [(NSLock *)self->_lock unlock];

  return v6;
}

- (void)becomeCurrentWithPendingUnitCount:(int64_t)unitCount
{
  id v6 = (NSProgress **)_CFGetTSD();
  id v7 = v6;
  if (v6 && *v6 == self)
  {
    id v10 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: NSProgress object is already current on this thread %@", _NSMethodExceptionProem((objc_class *)self, a2), +[NSThread currentThread](NSThread, "currentThread")), 0 reason userInfo];
    objc_exception_throw(v10);
  }
  pthread_self();
  uint64_t v8 = malloc_default_zone();
  uint64_t v9 = malloc_type_zone_calloc(v8, 1uLL, 0x20uLL, 0xC2E5A2B2uLL);
  *uint64_t v9 = 0u;
  v9[1] = 0u;
  *(void *)uint64_t v9 = self;
  *((void *)v9 + 1) = v7;
  *((void *)v9 + 2) = unitCount;

  _CFSetTSD();
}

- (BOOL)isIndeterminate
{
  [(NSLock *)self->_lock lock];
  values = self->_values;
  int64_t completed = values->_selfFraction.completed;
  if (completed < 0)
  {
    BOOL v7 = 1;
  }
  else
  {
    uint64_t total = values->_selfFraction.total;
    BOOL v6 = (total | completed) == 0;
    BOOL v7 = total < 0 || v6;
  }
  [(NSLock *)self->_lock unlock];
  return v7;
}

- (BOOL)isFinished
{
  [(NSLock *)self->_lock lock];
  values = self->_values;
  uint64_t completed = values->_selfFraction.completed;
  int64_t total = values->_selfFraction.total;
  BOOL v7 = completed > 0 && total == 0;
  BOOL v10 = completed >= 1 && completed >= total && total > 0 || v7;
  [(NSLock *)self->_lock unlock];
  return v10;
}

void *__42__NSProgress_ownedDictionaryKeyEnumerator__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2;
  if ([a2 hasSuffix:@".data"])
  {
    uint64_t v4 = objc_msgSend(v4, "substringToIndex:", objc_msgSend(v4, "length") - 5);
    double result = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (!result)
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "subarrayWithRange:", 0, a3), "mutableCopy");
      double result = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    }
  }
  else
  {
    double result = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (!result) {
      return result;
    }
  }

  return (void *)[result addObject:v4];
}

- (void)cancellationHandler
{
  [(NSLock *)self->_lock lock];
  id v3 = self->_cancellationHandler;
  [(NSLock *)self->_lock unlock];

  return v3;
}

+ (NSProgress)progressWithTotalUnitCount:(int64_t)unitCount parent:(NSProgress *)parent pendingUnitCount:(int64_t)portionOfParentTotalUnitCount
{
  uint64_t v8 = [[NSProgress alloc] initWithParent:0 userInfo:0];
  [(NSProgress *)v8 setTotalUnitCount:unitCount];
  [(NSProgress *)parent addChild:v8 withPendingUnitCount:portionOfParentTotalUnitCount];

  return v8;
}

- (void)performAsCurrentWithPendingUnitCount:(int64_t)unitCount usingBlock:(void *)work
{
  [(NSProgress *)self becomeCurrentWithPendingUnitCount:unitCount];
  (*((void (**)(void *))work + 2))(work);

  [(NSProgress *)self resignCurrent];
}

- (BOOL)_adoptChildUserInfo
{
  return (LOBYTE(self->_flags) >> 1) & 1;
}

id __51__NSProgress__notifyRemoteObserversOfValueForKeys___block_invoke()
{
  id result = +[NSProgressValues _importantKeys];
  qword_1EB1ECF00 = (uint64_t)result;
  return result;
}

void *__52__NSProgress__setCompletedUnitCount_totalUnitCount___block_invoke(uint64_t a1, uint64_t a2)
{
  return keysChangedForFractionCompletedValues(a2, *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)setLocalizedDescription:(NSString *)localizedDescription
{
  v4[5] = *MEMORY[0x1E4F143B8];
  v3[4] = localizedDescription;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __38__NSProgress_setLocalizedDescription___block_invoke;
  v4[3] = &unk_1E51FEBA8;
  v4[4] = localizedDescription;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __38__NSProgress_setLocalizedDescription___block_invoke_2;
  v3[3] = &unk_1E51FEBD0;
  [(NSProgress *)self _setValueForKeys:v4 settingBlock:v3];
}

void *__38__NSProgress_setLocalizedDescription___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 32) == *(void *)(a2 + 72)) {
    return 0;
  }
  else {
    return &unk_1ECAB82A0;
  }
}

uint64_t __38__NSProgress_setLocalizedDescription___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) copy];
  *(void *)(a2 + 72) = result;
  return result;
}

+ (id)keyPathsForValuesAffectingLocalizedDescription
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"kind", @"completedUnitCount", @"totalUnitCount", @"fractionCompleted", @"userInfo.NSProgressFileOperationKindKey", @"userInfo.NSProgressFileURLKey", @"userInfo.NSProgressFileTotalCountKey", @"userInfo.NSProgressFileCompletedCountKey", @"userInfo.NSProgressByteTotalCountKey", @"userInfo.NSProgressByteCompletedCountKey", @"userInfo.NSProgressFileDisplayNameKey", 0);
}

- (NSString)localizedDescription
{
  v33[1] = *MEMORY[0x1E4F143B8];
  [(NSLock *)self->_lock lock];
  values = self->_values;
  uint64_t v4 = values->_localizedDescription;
  if (!v4)
  {
    if (![(NSString *)values->_kind isEqualToString:@"NSProgressKindFile"])
    {
      int64_t completed = values->_selfFraction.completed;
      if (completed < 0
        || ((total = values->_selfFraction.total, uint64_t v14 = total | completed, total >= 1) ? (v15 = v14 == 0) : (v15 = 1),
            v15))
      {
        [(NSLock *)self->_lock unlock];
        return (NSString *)&stru_1ECA5C228;
      }
      [(NSProgressValues *)values fractionCompleted];
      double v20 = v19;
      uint64_t v21 = [(NSMutableDictionary *)values->_userInfo objectForKey:@"NSProgressLocalizedDescriptionPercentCompleteFormatterKey"];
      if (!v21 || (uint64_t v22 = (void *)v21, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        if (qword_1EB1ECF48 != -1) {
          dispatch_once(&qword_1EB1ECF48, &__block_literal_global_809);
        }
        uint64_t v22 = (void *)qword_1EB1ECF50;
      }
      char v23 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", [(id)_NSFoundationBundle() localizedStringForKey:@"%@ completed" value:&stru_1ECA5C228 table:@"Progress"], objc_msgSend(v22, "stringFromNumber:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v20)), v32);
      goto LABEL_60;
    }
    BOOL v6 = (void *)[(NSMutableDictionary *)values->_userInfo objectForKey:@"NSProgressFileDisplayNameKey"];
    v33[0] = v6;
    if ((_NSIsNSString() & 1) == 0)
    {
      BOOL v6 = 0;
      v33[0] = 0;
    }
    if (![v6 length])
    {
      BOOL v6 = 0;
      v33[0] = 0;
    }
    BOOL v7 = (__objc2_class **)[(NSMutableDictionary *)values->_userInfo objectForKey:@"NSProgressFileTotalCountKey"];
    if (_NSIsNSNumber()) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
    uint64_t v9 = (void *)[(NSMutableDictionary *)values->_userInfo objectForKey:@"NSProgressFileURLKey"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      uint64_t v9 = 0;
    }
    if (!v8 || [v8 longLongValue] <= 1)
    {
      if (!v6)
      {
        BOOL v7 = v8;
        if (!v9) {
          goto LABEL_17;
        }
        if (([v9 getResourceValue:v33 forKey:*MEMORY[0x1E4F1C6C8] error:0] & 1) == 0) {
          v33[0] = 0;
        }
      }
      BOOL v7 = &off_1ECAB6110;
    }
LABEL_17:
    BOOL v10 = (void *)[(NSMutableDictionary *)values->_userInfo objectForKey:@"NSProgressUseItemDescriptionKey"];
    if (_NSIsNSNumber()) {
      int v11 = [v10 BOOLValue];
    }
    else {
      int v11 = 0;
    }
    long long v16 = (void *)[(NSMutableDictionary *)values->_userInfo objectForKey:@"NSProgressFileOperationKindKey"];
    if ([v16 isEqualToString:@"NSProgressFileOperationKindDownloading"])
    {
      long long v17 = (void *)_NSFoundationBundle();
      long long v18 = @"Downloading";
    }
    else if ([v16 isEqualToString:@"NSProgressFileOperationKindUploading"])
    {
      long long v17 = (void *)_NSFoundationBundle();
      long long v18 = @"Uploading";
    }
    else if ([v16 isEqualToString:@"NSProgressFileOperationKindDecompressingAfterDownloading"])
    {
      long long v17 = (void *)_NSFoundationBundle();
      long long v18 = @"DecompressingAfterDownloading";
    }
    else if ([v16 isEqualToString:@"NSProgressFileOperationKindReceiving"])
    {
      long long v17 = (void *)_NSFoundationBundle();
      long long v18 = @"Receiving";
    }
    else if ([v16 isEqualToString:@"NSProgressFileOperationKindCopying"])
    {
      long long v17 = (void *)_NSFoundationBundle();
      long long v18 = @"Copying";
    }
    else if ([v16 isEqualToString:@"NSProgressFileOperationKindDuplicating"])
    {
      long long v17 = (void *)_NSFoundationBundle();
      long long v18 = @"Duplicating";
    }
    else if ([v16 isEqualToString:@"NSProgressFileOperationKindCompressing"])
    {
      long long v17 = (void *)_NSFoundationBundle();
      long long v18 = @"Compressing";
    }
    else if ([v16 isEqualToString:@"NSProgressFileOperationKindDecompressing"])
    {
      long long v17 = (void *)_NSFoundationBundle();
      long long v18 = @"Decompressing";
    }
    else if ([v16 isEqualToString:@"NSProgressFileOperationKindArchiving"])
    {
      long long v17 = (void *)_NSFoundationBundle();
      long long v18 = @"Archiving";
    }
    else
    {
      int v24 = [v16 isEqualToString:@"NSProgressFileOperationKindUnarchiving"];
      long long v17 = (void *)_NSFoundationBundle();
      if (v24) {
        long long v18 = @"Unarchiving";
      }
      else {
        long long v18 = @"Processing";
      }
    }
    uint64_t v25 = [v17 localizedStringForKey:v18 value:&stru_1ECA5C228 table:@"Progress"];
    if (v33[0])
    {
      uint64_t v26 = [(id)_NSFoundationBundle() localizedStringForKey:@"%@ \\U201C%@\\U201D\\U2026" value:&stru_1ECA5C228 table:@"Progress"];
      uint64_t v32 = v33[0];
LABEL_59:
      char v23 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v26, v25, v32);
      goto LABEL_60;
    }
    if (!v7)
    {
      long long v30 = (void *)_NSFoundationBundle();
      if (v11) {
        uint64_t v31 = @"%@ items\\U2026";
      }
      else {
        uint64_t v31 = @"%@ files\\U2026";
      }
      uint64_t v26 = [v30 localizedStringForKey:v31 value:&stru_1ECA5C228 table:@"Progress"];
      goto LABEL_59;
    }
    long long v28 = (void *)_NSFoundationBundle();
    if (v11) {
      long long v29 = @"%@ %lld items…";
    }
    else {
      long long v29 = @"%@ %lld files…";
    }
    char v23 = +[NSString localizedStringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", [v28 localizedStringForKey:v29 value:&stru_1ECA5C228 table:@"Progress"], @"%lld %@", 0, objc_msgSend(v7, "longLongValue"), v25);
LABEL_60:
    BOOL v5 = v23;
    [(NSLock *)self->_lock unlock];
    if (v5) {
      return v5;
    }
    return (NSString *)&stru_1ECA5C228;
  }
  BOOL v5 = v4;
  [(NSLock *)self->_lock unlock];
  return v5;
}

- (void)setLocalizedAdditionalDescription:(NSString *)localizedAdditionalDescription
{
  v4[5] = *MEMORY[0x1E4F143B8];
  v3[4] = localizedAdditionalDescription;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__NSProgress_setLocalizedAdditionalDescription___block_invoke;
  v4[3] = &unk_1E51FEBA8;
  v4[4] = localizedAdditionalDescription;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __48__NSProgress_setLocalizedAdditionalDescription___block_invoke_2;
  v3[3] = &unk_1E51FEBD0;
  [(NSProgress *)self _setValueForKeys:v4 settingBlock:v3];
}

void *__48__NSProgress_setLocalizedAdditionalDescription___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 32) == *(void *)(a2 + 80)) {
    return 0;
  }
  else {
    return &unk_1ECAB82B8;
  }
}

uint64_t __48__NSProgress_setLocalizedAdditionalDescription___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) copy];
  *(void *)(a2 + 80) = result;
  return result;
}

+ (id)keyPathsForValuesAffectingLocalizedAdditionalDescription
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"kind", @"completedUnitCount", @"fractionCompleted", @"totalUnitCount", @"userInfo.NSProgressFileOperationKindKey", @"userInfo.NSProgressFileTotalCountKey", @"userInfo.NSProgressFileCompletedCountKey", @"userInfo.NSProgressByteTotalCountKey", @"userInfo.NSProgressByteCompletedCountKey", @"userInfo.NSProgressEstimatedTimeRemainingKey", @"userInfo.NSProgressThroughputKey", 0);
}

- (NSString)localizedAdditionalDescription
{
  [(NSLock *)self->_lock lock];
  values = self->_values;
  uint64_t v4 = values->_localizedAdditionalDescription;
  if (v4)
  {
    BOOL v5 = v4;
LABEL_3:
    [(NSLock *)self->_lock unlock];
    return v5;
  }
  BOOL v7 = (void *)[(NSMutableDictionary *)values->_userInfo objectForKey:@"NSProgressByteTotalCountKey"];
  uint64_t v8 = (void *)[(NSMutableDictionary *)values->_userInfo objectForKey:@"NSProgressByteCompletedCountKey"];
  if ([(NSString *)values->_kind isEqualToString:@"NSProgressKindFile"]
    || (v8 ? (BOOL v9 = v7 == 0) : (BOOL v9 = 1), !v9))
  {
    locked = (NSString *)_lockedLocalizedTimeRemaining((uint64_t)values);
    int v11 = _localizedAppendedTimeRemaining(locked);
    uint64_t v12 = (void *)[(NSMutableDictionary *)values->_userInfo objectForKey:@"NSProgressUseItemDescriptionKey"];
    if (_NSIsNSNumber()) {
      int v13 = [v12 BOOLValue];
    }
    else {
      int v13 = 0;
    }
    uint64_t v14 = [(NSMutableDictionary *)values->_userInfo objectForKey:@"NSProgressLocalizedDescriptionFileSizeFormatterOptionsKey"];
    if (v14 && (BOOL v15 = (void *)v14, _NSIsNSNumber())) {
      unint64_t v16 = [v15 unsignedLongLongValue];
    }
    else {
      unint64_t v16 = 0x1000000;
    }
    if ([(NSMutableDictionary *)values->_userInfo objectForKey:@"NSProgressThroughputKey"]
      && (long long v17 = (void *)[(NSMutableDictionary *)values->_userInfo objectForKey:@"NSProgressThroughputKey"], _NSIsNSNumber()))
    {
      uint64_t v18 = [v17 unsignedLongLongValue];
      double v19 = locked;
      double v20 = v11;
      int v21 = v13;
      uint64_t v22 = [(id)_NSFoundationBundle() localizedStringForKey:@"%@/s" value:&stru_1ECA5C228 table:@"Progress"];
      char v23 = NSLocalizedFileSizeDescription(v18, 0, v16);
      uint64_t v24 = v22;
      int v13 = v21;
      int v11 = v20;
      locked = v19;
      BOOL v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v24, v23);
      if (!v7) {
        goto LABEL_24;
      }
    }
    else
    {
      BOOL v5 = 0;
      if (!v7) {
        goto LABEL_24;
      }
    }
    if (v8)
    {
      uint64_t total = [v7 longLongValue];
      uint64_t completed = [v8 longLongValue];
LABEL_25:
      uint64_t v27 = 0;
      long long v28 = 0;
      if (total && completed <= total)
      {
        uint64_t v27 = NSLocalizedFileSizeDescription(completed, 0, v16);
        long long v28 = NSLocalizedFileSizeDescription(total, 0, v16);
      }
      long long v29 = (void *)[(NSMutableDictionary *)values->_userInfo objectForKey:@"NSProgressFileOperationKindKey"];
      if (([v29 isEqualToString:@"NSProgressFileOperationKindDownloading"] & 1) != 0
        || ([v29 isEqualToString:@"NSProgressFileOperationKindUploading"] & 1) != 0)
      {
        if (!v27) {
          goto LABEL_43;
        }
      }
      else if (![v29 isEqualToString:@"NSProgressFileOperationKindReceiving"] {
             || !v27)
      }
      {
        goto LABEL_38;
      }
      if (v28 && v5)
      {
        BOOL v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", [(id)_NSFoundationBundle() localizedStringForKey:@"%@ of %@ (%@)" value:&stru_1ECA5C228 table:@"Progress"], v27, v28, v5);
        if (!v11) {
          goto LABEL_59;
        }
        long long v30 = +[NSString stringWithFormat:@"%@%@", v5, v11];
LABEL_58:
        BOOL v5 = v30;
LABEL_59:
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_60;
      }
LABEL_38:
      if (v27 && v28)
      {
        uint64_t v31 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", [(id)_NSFoundationBundle() localizedStringForKey:@"%@ of %@" value:&stru_1ECA5C228 table:@"Progress"], v27, v28);
        if (v31) {
          goto LABEL_41;
        }
        goto LABEL_49;
      }
LABEL_43:
      uint64_t v32 = (void *)[(NSMutableDictionary *)values->_userInfo objectForKey:@"NSProgressFileCompletedCountKey"];
      uint64_t v33 = [(NSMutableDictionary *)values->_userInfo objectForKey:@"NSProgressFileTotalCountKey"];
      if (!v32)
      {
LABEL_48:
        uint64_t v31 = 0;
        goto LABEL_49;
      }
      long long v34 = (void *)v33;
      int v35 = _NSIsNSNumber();
      uint64_t v31 = 0;
      if (v35 && v34)
      {
        if (!_NSIsNSNumber()) {
          goto LABEL_48;
        }
        uint64_t v36 = [v32 longLongValue];
        uint64_t v37 = [v34 longLongValue];
        if (v36 > v37) {
          goto LABEL_48;
        }
        uint64_t v48 = v37;
        v49 = (void *)_NSFoundationBundle();
        if (v13) {
          v50 = @"%lld of %lld items";
        }
        else {
          v50 = @"%lld of %lld files";
        }
        uint64_t v31 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", [v49 localizedStringForKey:v50 value:&stru_1ECA5C228 table:@"Progress"], v48, v36);
        if (!v31) {
          goto LABEL_49;
        }
LABEL_41:
        if (v11) {
          uint64_t v31 = +[NSString stringWithFormat:@"%@%@", v31, v11];
        }
      }
LABEL_49:
      if (v31) {
        BOOL v38 = 1;
      }
      else {
        BOOL v38 = v5 == 0;
      }
      int v39 = !v38;
      if (!locked || !v39)
      {
        if (v39) {
          goto LABEL_3;
        }
        BOOL v46 = v31 || locked == 0;
        BOOL v5 = v46 ? v31 : locked;
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_60;
      }
      long long v30 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", [(id)_NSFoundationBundle() localizedStringForKey:@"%@ (%@)" value:&stru_1ECA5C228 table:@"Progress"], locked, v5);
      goto LABEL_58;
    }
LABEL_24:
    uint64_t completed = values->_selfFraction.completed;
    uint64_t total = values->_selfFraction.total;
    goto LABEL_25;
  }
LABEL_60:
  BOOL v5 = (NSString *)_lockedLocalizedTimeRemaining((uint64_t)values);
  v40 = _localizedAppendedTimeRemaining(v5);
  uint64_t v41 = [(NSMutableDictionary *)values->_userInfo objectForKey:@"NSProgressSuppressUnitCountInAdditionalDescriptionKey"];
  if (v41 && (v42 = (void *)v41, _NSIsNSNumber()) && ([v42 BOOLValue] & 1) != 0
    || values->_selfFraction.total < 1
    || values->_selfFraction.completed < 0)
  {
    if (!v40)
    {
      [(NSLock *)self->_lock unlock];
      goto LABEL_85;
    }
  }
  else
  {
    uint64_t v43 = [(NSMutableDictionary *)values->_userInfo objectForKey:@"NSProgressLocalizedDescriptionUnitCountFormatterKey"];
    if (v43 && (v44 = (void *)v43, (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v45 = objc_msgSend(v44, "stringFromNumber:", +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", values->_selfFraction.completed));
    }
    else
    {
      if (qword_1EB1ECF68 != -1) {
        dispatch_once(&qword_1EB1ECF68, &__block_literal_global_842);
      }
      uint64_t v45 = objc_msgSend((id)qword_1EB1ECF70, "stringFromNumber:", +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", values->_selfFraction.completed));
      v44 = (void *)qword_1EB1ECF70;
    }
    BOOL v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", [(id)_NSFoundationBundle() localizedStringForKey:@"%@ of %@" value:&stru_1ECA5C228 table:@"Progress"], v45, objc_msgSend(v44, "stringFromNumber:", +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", values->_selfFraction.total)));
    if (v40) {
      BOOL v5 = +[NSString stringWithFormat:@"%@%@", v5, v40];
    }
  }
  [(NSLock *)self->_lock unlock];
  if (v5) {
    return v5;
  }
LABEL_85:
  v47 = &stru_1ECA5C228;

  return (NSString *)v47;
}

uint64_t __29__NSProgress_setCancellable___block_invoke_2(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(a2 + 104) = *(unsigned char *)(result + 32);
  return result;
}

- (void)_setCancellable:(BOOL)a3 fromChild:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  [(NSLock *)self->_lock lock];
  if (!v4 || (self->_flags & 2) != 0)
  {
    [(NSLock *)self->_lock unlock];
    id Weak = objc_loadWeak((id *)&self->_parent);
    [Weak _setCancellable:v5 fromChild:1];
  }
  else
  {
    lock = self->_lock;
    [(NSLock *)lock unlock];
  }
}

uint64_t __26__NSProgress_setPausable___block_invoke_2(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(a2 + 105) = *(unsigned char *)(result + 32);
  return result;
}

- (void)_setPausable:(BOOL)a3 fromChild:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  [(NSLock *)self->_lock lock];
  if (!v4 || (self->_flags & 2) != 0)
  {
    [(NSLock *)self->_lock unlock];
    id Weak = objc_loadWeak((id *)&self->_parent);
    [Weak _setPausable:v5 fromChild:1];
  }
  else
  {
    lock = self->_lock;
    [(NSLock *)lock unlock];
  }
}

- (void)pausingHandler
{
  [(NSLock *)self->_lock lock];
  id v3 = self->_pausingHandler;
  [(NSLock *)self->_lock unlock];

  return v3;
}

- (void)resumingHandler
{
  [(NSLock *)self->_lock lock];
  id v3 = self->_resumingHandler;
  [(NSLock *)self->_lock unlock];

  return v3;
}

- (id)_indentedDescription:(unint64_t)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  BOOL v5 = +[NSString string];
  if (a3)
  {
    unint64_t v6 = a3;
    do
    {
      [(NSString *)v5 appendString:@"  "];
      --v6;
    }
    while (v6);
  }
  values = self->_values;
  uint64_t v8 = +[NSString string];
  v22.receiver = self;
  v22.super_class = (Class)NSProgress;
  BOOL v9 = [(NSProgress *)&v22 description];
  id v10 = [(NSProgress *)self _parent];
  int64_t portionOfParent = values->_portionOfParent;
  [(NSProgressValues *)values fractionCompleted];
  if (values->_isCancelled) {
    int v13 = "CANCELLED";
  }
  else {
    int v13 = "";
  }
  if (values->_isPaused) {
    uint64_t v14 = "PAUSED";
  }
  else {
    uint64_t v14 = "";
  }
  [(NSString *)v8 appendFormat:@"%@%@ : Parent: %p (portion: %lld) / Fraction completed: %0.4f / Completed: %lld of %lld %s %s", v5, v9, v10, portionOfParent, v12, values->_selfFraction.completed, values->_selfFraction.total, v13, v14];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  children = self->_children;
  uint64_t v16 = [(NSMutableSet *)children countByEnumeratingWithState:&v24 objects:v23 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v25;
    unint64_t v19 = a3 + 1;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(children);
        }
        -[NSString appendFormat:](v8, "appendFormat:", @"\n%@", [*(id *)(*((void *)&v24 + 1) + 8 * i) _indentedDescription:v19]);
      }
      uint64_t v17 = [(NSMutableSet *)children countByEnumeratingWithState:&v24 objects:v23 count:16];
    }
    while (v17);
  }
  return v8;
}

- (NSString)description
{
  return (NSString *)[(NSProgress *)self _indentedDescription:0];
}

void __20__NSProgress_cancel__block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v2 = *(void **)(a1 + 32);
}

- (void)pause
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(NSProgress *)self _setValueForKeys:&__block_literal_global_398 settingBlock:&__block_literal_global_403_0];
  [(NSLock *)self->_lock lock];
  if (self->_pausingHandler)
  {
    qos_class_t v3 = qos_class_self();
    global_queue = dispatch_get_global_queue(v3, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __19__NSProgress_pause__block_invoke_3;
    block[3] = &unk_1E51F71D0;
    block[4] = self;
    dispatch_async(global_queue, block);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  children = self->_children;
  uint64_t v6 = [(NSMutableSet *)children countByEnumeratingWithState:&v12 objects:v11 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(children);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * i) pause];
      }
      uint64_t v7 = [(NSMutableSet *)children countByEnumeratingWithState:&v12 objects:v11 count:16];
    }
    while (v7);
  }
  [(NSLock *)self->_lock unlock];
}

void *__19__NSProgress_pause__block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a2 + 107)) {
    return 0;
  }
  else {
    return &unk_1ECAB8318;
  }
}

void __19__NSProgress_pause__block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(a2 + 107) = 1;
}

uint64_t __19__NSProgress_pause__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 40) + 16))();
}

- (void)resume
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(NSProgress *)self _setValueForKeys:&__block_literal_global_405 settingBlock:&__block_literal_global_410];
  [(NSLock *)self->_lock lock];
  if (self->_resumingHandler)
  {
    qos_class_t v3 = qos_class_self();
    global_queue = dispatch_get_global_queue(v3, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __20__NSProgress_resume__block_invoke_3;
    block[3] = &unk_1E51F71D0;
    block[4] = self;
    dispatch_async(global_queue, block);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  children = self->_children;
  uint64_t v6 = [(NSMutableSet *)children countByEnumeratingWithState:&v12 objects:v11 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(children);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * i) resume];
      }
      uint64_t v7 = [(NSMutableSet *)children countByEnumeratingWithState:&v12 objects:v11 count:16];
    }
    while (v7);
  }
  [(NSLock *)self->_lock unlock];
}

void *__20__NSProgress_resume__block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a2 + 107)) {
    return &unk_1ECAB8330;
  }
  else {
    return 0;
  }
}

void __20__NSProgress_resume__block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(a2 + 107) = 0;
}

uint64_t __20__NSProgress_resume__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 24) + 16))();
}

- (NSNumber)estimatedTimeRemaining
{
  v2 = [(NSProgress *)self userInfo];

  return (NSNumber *)[(NSDictionary *)v2 objectForKey:@"NSProgressEstimatedTimeRemainingKey"];
}

- (void)setEstimatedTimeRemaining:(NSNumber *)estimatedTimeRemaining
{
}

- (NSNumber)throughput
{
  v2 = [(NSProgress *)self userInfo];

  return (NSNumber *)[(NSDictionary *)v2 objectForKey:@"NSProgressThroughputKey"];
}

- (void)setThroughput:(NSNumber *)throughput
{
}

- (NSProgressFileOperationKind)fileOperationKind
{
  v2 = [(NSProgress *)self userInfo];

  return (NSProgressFileOperationKind)[(NSDictionary *)v2 objectForKey:@"NSProgressFileOperationKindKey"];
}

- (void)setFileOperationKind:(NSProgressFileOperationKind)fileOperationKind
{
}

- (NSURL)fileURL
{
  v2 = [(NSProgress *)self userInfo];

  return (NSURL *)[(NSDictionary *)v2 objectForKey:@"NSProgressFileURLKey"];
}

- (void)setFileURL:(NSURL *)fileURL
{
}

- (NSNumber)fileTotalCount
{
  v2 = [(NSProgress *)self userInfo];

  return (NSNumber *)[(NSDictionary *)v2 objectForKey:@"NSProgressFileTotalCountKey"];
}

- (NSNumber)fileCompletedCount
{
  v2 = [(NSProgress *)self userInfo];

  return (NSNumber *)[(NSDictionary *)v2 objectForKey:@"NSProgressFileCompletedCountKey"];
}

- (id)byteTotalCount
{
  v2 = [(NSProgress *)self userInfo];

  return [(NSDictionary *)v2 objectForKey:@"NSProgressByteTotalCountKey"];
}

- (void)setByteTotalCount:(id)a3
{
}

- (id)byteCompletedCount
{
  v2 = [(NSProgress *)self userInfo];

  return [(NSDictionary *)v2 objectForKey:@"NSProgressByteCompletedCountKey"];
}

- (void)setByteCompletedCount:(id)a3
{
}

- (void)publish
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  [(NSLock *)self->_lock lock];
  if (self->_publisherID)
  {
    [(NSLock *)self->_lock unlock];
    uint64_t v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"-[%p publish]: this instance of NSProgress has already been published and can't be published again.", self);
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v16 userInfo:0]);
  }
  self->_publisherID = [+[NSUUID UUID] UUIDString];
  userInfo = self->_values->_userInfo;
  BOOL v4 = (void *)[(NSMutableDictionary *)userInfo objectForKey:@"NSProgressCategoryKey"];
  uint64_t v5 = [(NSMutableDictionary *)userInfo objectForKey:@"NSProgressFileURLKey"];
  acknowledgementHandlersByLowercaseBundleID = self->_acknowledgementHandlersByLowercaseBundleID;
  if (acknowledgementHandlersByLowercaseBundleID) {
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", -[NSMutableDictionary allKeys](acknowledgementHandlersByLowercaseBundleID, "allKeys"));
  }
  else {
    uint64_t v7 = 0;
  }
  if (qword_1EB1ECEE0 != -1) {
    dispatch_once(&qword_1EB1ECEE0, &__block_literal_global_90);
  }
  if (os_log_type_enabled((os_log_t)_MergedGlobals_25_1, OS_LOG_TYPE_DEBUG))
  {
    id v10 = _MergedGlobals_25_1;
    if (os_log_type_enabled((os_log_t)_MergedGlobals_25_1, OS_LOG_TYPE_DEBUG))
    {
      publisherID = self->_publisherID;
      *(_DWORD *)buf = 134218755;
      unint64_t v19 = self;
      __int16 v20 = 2113;
      uint64_t v21 = v5;
      __int16 v22 = 2114;
      char v23 = v4;
      __int16 v24 = 2114;
      long long v25 = publisherID;
      _os_log_debug_impl(&dword_181795000, v10, OS_LOG_TYPE_DEBUG, "<NSProgress %p> Publishing for URL %{private}@ in category %{public}@ with ID %{public}@", buf, 0x2Au);
    }
  }
  int v11 = objc_msgSend(+[NSProgress _serverConnection](NSProgress, "_serverConnection", v8, v9), "remoteObjectProxy");
  long long v12 = self->_publisherID;
  uint64_t v13 = [v4 lowercaseString];
  values = self->_values;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __21__NSProgress_publish__block_invoke;
  v17[3] = &unk_1E51FEC78;
  v17[4] = self;
  [v11 addPublisher:self forID:v12 acknowledgementAppBundleIDs:v7 category:v13 fileURL:v5 initialValues:values completionHandler:v17];
  [(NSLock *)self->_lock unlock];
}

uint64_t __21__NSProgress_publish__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t result = [a2 countByEnumeratingWithState:&v9 objects:v8 count:16];
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(a2);
        }
        [*(id *)(a1 + 32) appWithBundleID:*(void *)(*((void *)&v9 + 1) + 8 * v7++) didAcknowledgeWithSuccess:0];
      }
      while (v5 != v7);
      uint64_t result = [a2 countByEnumeratingWithState:&v9 objects:v8 count:16];
      uint64_t v5 = result;
    }
    while (result);
  }
  return result;
}

- (void)unpublish
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [(NSLock *)self->_lock lock];
  if (qword_1EB1ECEE0 != -1) {
    dispatch_once(&qword_1EB1ECEE0, &__block_literal_global_90);
  }
  if (os_log_type_enabled((os_log_t)_MergedGlobals_25_1, OS_LOG_TYPE_DEBUG))
  {
    qos_class_t v3 = _MergedGlobals_25_1;
    if (os_log_type_enabled((os_log_t)_MergedGlobals_25_1, OS_LOG_TYPE_DEBUG))
    {
      publisherID = self->_publisherID;
      int v5 = 134218242;
      uint64_t v6 = self;
      __int16 v7 = 2114;
      uint64_t v8 = publisherID;
      _os_log_debug_impl(&dword_181795000, v3, OS_LOG_TYPE_DEBUG, "<NSProgress %p> Unpublishing %{public}@", (uint8_t *)&v5, 0x16u);
    }
  }
  [(NSProgress *)self _notifyRemoteObserversOfValueForKeys:&unk_1ECAB8360];
  objc_msgSend((id)objc_msgSend(+[NSProgress _serverConnection](NSProgress, "_serverConnection"), "remoteObjectProxy"), "removePublisherForID:", self->_publisherID);
  [(NSLock *)self->_lock unlock];
}

- (void)setAcknowledgementHandler:(id)a3 forAppBundleIdentifier:(id)a4
{
  [(NSLock *)self->_lock lock];
  if (!self->_acknowledgementHandlersByLowercaseBundleID) {
    self->_acknowledgementHandlersByLowercaseBundleID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  __int16 v7 = (void *)[a3 copy];
  -[NSMutableDictionary setObject:forKey:](self->_acknowledgementHandlersByLowercaseBundleID, "setObject:forKey:", v7, [a4 lowercaseString]);

  lock = self->_lock;

  [(NSLock *)lock unlock];
}

- (id)acknowledgementHandlerForAppBundleIdentifier:(id)a3
{
  [(NSLock *)self->_lock lock];
  id v5 = (id)-[NSMutableDictionary objectForKey:](self->_acknowledgementHandlersByLowercaseBundleID, "objectForKey:", [a3 lowercaseString]);
  [(NSLock *)self->_lock unlock];

  return v5;
}

- (void)appWithBundleID:(id)a3 didAcknowledgeWithSuccess:(BOOL)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(NSLock *)self->_lock lock];
  uint64_t v7 = [a3 lowercaseString];
  uint64_t v8 = [(NSMutableDictionary *)self->_acknowledgementHandlersByLowercaseBundleID objectForKey:v7];
  if (v8)
  {
    uint64_t v9 = v8;
    qos_class_t v10 = qos_class_self();
    global_queue = dispatch_get_global_queue(v10, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__NSProgress_appWithBundleID_didAcknowledgeWithSuccess___block_invoke;
    block[3] = &unk_1E51FD4A0;
    block[4] = v9;
    BOOL v13 = a4;
    dispatch_async(global_queue, block);
    [(NSMutableDictionary *)self->_acknowledgementHandlersByLowercaseBundleID removeObjectForKey:v7];
  }
  [(NSLock *)self->_lock unlock];
}

uint64_t __56__NSProgress_appWithBundleID_didAcknowledgeWithSuccess___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

+ (id)addSubscriberForFileURL:(NSURL *)url withPublishingHandler:(NSProgressPublishingHandler)publishingHandler
{
  id v5 = [[_NSProgressSubscriber alloc] initWithPublishingHandler:publishingHandler];
  [(_NSProgressSubscriber *)v5 startForFileURL:url];

  return v5;
}

+ (void)removeSubscriber:(id)subscriber
{
}

- (BOOL)isOld
{
  return 0;
}

- (id)_publishingAppBundleIdentifier
{
  return 0;
}

+ (id)_addSubscriberForCategory:(id)a3 usingPublishingHandler:(id)a4
{
  id v5 = [[_NSProgressSubscriber alloc] initWithPublishingHandler:a4];
  [(_NSProgressSubscriber *)v5 startForCategory:a3];

  return v5;
}

- (void)setPrioritizable:(BOOL)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __31__NSProgress_setPrioritizable___block_invoke;
  _OWORD v5[3] = &__block_descriptor_33_e35___NSArray_16__0__NSProgressValues_8l;
  BOOL v6 = a3;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __31__NSProgress_setPrioritizable___block_invoke_2;
  v3[3] = &__block_descriptor_33_e26_v16__0__NSProgressValues_8l;
  BOOL v4 = a3;
  [(NSProgress *)self _setValueForKeys:v5 settingBlock:v3];
}

void *__31__NSProgress_setPrioritizable___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(unsigned __int8 *)(a2 + 109) == *(unsigned __int8 *)(a1 + 32)) {
    return 0;
  }
  else {
    return &unk_1ECAB8378;
  }
}

uint64_t __31__NSProgress_setPrioritizable___block_invoke_2(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(a2 + 109) = *(unsigned char *)(result + 32);
  return result;
}

- (BOOL)isPrioritizable
{
  [(NSLock *)self->_lock lock];
  BOOL isPrioritizable = self->_values->_isPrioritizable;
  [(NSLock *)self->_lock unlock];
  return isPrioritizable;
}

- (void)setPrioritizationHandler:(id)a3
{
  [(NSLock *)self->_lock lock];
  id prioritizationHandler = self->_prioritizationHandler;
  if (prioritizationHandler != a3)
  {

    self->_id prioritizationHandler = (id)[a3 copy];
  }
  lock = self->_lock;

  [(NSLock *)lock unlock];
}

- (id)prioritizationHandler
{
  [(NSLock *)self->_lock lock];
  id v3 = self->_prioritizationHandler;
  [(NSLock *)self->_lock unlock];

  return v3;
}

- (void)prioritize
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(NSLock *)self->_lock lock];
  if (self->_prioritizationHandler)
  {
    qos_class_t v3 = qos_class_self();
    global_queue = dispatch_get_global_queue(v3, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __24__NSProgress_prioritize__block_invoke;
    block[3] = &unk_1E51F71D0;
    block[4] = self;
    dispatch_async(global_queue, block);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  children = self->_children;
  uint64_t v6 = [(NSMutableSet *)children countByEnumeratingWithState:&v12 objects:v11 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(children);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * i) prioritize];
      }
      uint64_t v7 = [(NSMutableSet *)children countByEnumeratingWithState:&v12 objects:v11 count:16];
    }
    while (v7);
  }
  [(NSLock *)self->_lock unlock];
}

uint64_t __24__NSProgress_prioritize__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 48) + 16))();
}

- (void)handleAcknowledgementByAppWithBundleIdentifier:(id)a3 usingBlock:(id)a4
{
}

+ (id)_publisherInterface
{
  if (qword_1EB1ECF08 != -1) {
    dispatch_once(&qword_1EB1ECF08, &__block_literal_global_433);
  }
  return (id)qword_1EB1ECF10;
}

NSXPCInterface *__33__NSProgress__publisherInterface__block_invoke()
{
  uint64_t result = +[NSXPCInterface interfaceWithProtocol:&unk_1ECAC15A8];
  qword_1EB1ECF10 = (uint64_t)result;
  return result;
}

+ (id)_subscriberInterface
{
  void v3[5] = *MEMORY[0x1E4F143B8];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __34__NSProgress__subscriberInterface__block_invoke;
  v3[3] = &unk_1E51F71D0;
  void v3[4] = a1;
  if (qword_1EB1ECF18 != -1) {
    dispatch_once(&qword_1EB1ECF18, v3);
  }
  return (id)qword_1EB1ECF20;
}

uint64_t __34__NSProgress__subscriberInterface__block_invoke(uint64_t a1)
{
  qword_1EB1ECF20 = +[NSXPCInterface interfaceWithProtocol:&unk_1ECAC1820];
  objc_msgSend((id)qword_1EB1ECF20, "setInterface:forSelector:argumentIndex:ofReply:", objc_msgSend(*(id *)(a1 + 32), "_publisherInterface"), sel_addPublisher_forID_withValues_isOld_, 0, 0);
  objc_msgSend((id)qword_1EB1ECF20, "setClasses:forSelector:argumentIndex:ofReply:", +[NSProgressValues decodableClasses](NSProgressValues, "decodableClasses"), sel_observePublisherForID_values_forKeys_, 1, 0);
  v2 = (void *)qword_1EB1ECF20;
  id v3 = +[NSProgressValues decodableClasses];

  return [v2 setClasses:v3 forSelector:sel_observePublisherUserInfoForID_value_forKey_ argumentIndex:1 ofReply:0];
}

+ (id)_registrarInterface
{
  void v3[5] = *MEMORY[0x1E4F143B8];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __33__NSProgress__registrarInterface__block_invoke;
  v3[3] = &unk_1E51F71D0;
  void v3[4] = a1;
  if (qword_1EB1ECF28 != -1) {
    dispatch_once(&qword_1EB1ECF28, v3);
  }
  return (id)qword_1EB1ECF30;
}

uint64_t __33__NSProgress__registrarInterface__block_invoke(uint64_t a1)
{
  qword_1EB1ECF30 = +[NSXPCInterface interfaceWithProtocol:&unk_1ECAC1A88];
  objc_msgSend((id)qword_1EB1ECF30, "setInterface:forSelector:argumentIndex:ofReply:", objc_msgSend(*(id *)(a1 + 32), "_publisherInterface"), sel_addPublisher_forID_acknowledgementAppBundleIDs_category_fileURL_initialValues_completionHandler_, 0, 0);
  v2 = (void *)qword_1EB1ECF30;
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0), sel_addPublisher_forID_acknowledgementAppBundleIDs_category_fileURL_initialValues_completionHandler_, 2, 0);
  id v5 = (void *)qword_1EB1ECF30;
  uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0), sel_addPublisher_forID_acknowledgementAppBundleIDs_category_fileURL_initialValues_completionHandler_, 0, 1);
  objc_msgSend((id)qword_1EB1ECF30, "setClasses:forSelector:argumentIndex:ofReply:", +[NSProgressValues decodableClasses](NSProgressValues, "decodableClasses"), sel_observePublisherForID_values_forKeys_, 1, 0);
  objc_msgSend((id)qword_1EB1ECF30, "setClasses:forSelector:argumentIndex:ofReply:", +[NSProgressValues decodableClasses](NSProgressValues, "decodableClasses"), sel_observePublisherUserInfoForID_value_forKey_, 1, 0);
  objc_msgSend((id)qword_1EB1ECF30, "setInterface:forSelector:argumentIndex:ofReply:", objc_msgSend(*(id *)(a1 + 32), "_subscriberInterface"), sel_addSubscriber_forID_appBundleID_category_completionHandler_, 0, 0);
  uint64_t v8 = (void *)qword_1EB1ECF30;
  uint64_t v9 = [*(id *)(a1 + 32) _subscriberInterface];

  return [v8 setInterface:v9 forSelector:sel_addSubscriber_forID_appBundleID_fileURL_completionHandler_ argumentIndex:0 ofReply:0];
}

- (id)_initWithValues:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)NSProgress;
  uint64_t v4 = [(NSProgress *)&v8 init];
  if (v4)
  {
    id v5 = (NSProgressValues *)[a3 copy];
    v4->_values = v5;
    [(NSProgressValues *)v5 fractionCompleted];
    v4->_values->_remoteFractionCompleted = v6;
  }
  return v4;
}

- (void)_setRemoteValues:(id)a3 forKeys:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [a3 count];
  if ([a4 count] == v7)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __39__NSProgress__setRemoteValues_forKeys___block_invoke;
    v10[3] = &unk_1E51FECA0;
    v10[5] = a4;
    void v10[6] = v7;
    v10[4] = a3;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __39__NSProgress__setRemoteValues_forKeys___block_invoke_2;
    v9[3] = &unk_1E51FECC8;
    v9[5] = a4;
    v9[6] = v7;
    v9[4] = a3;
    [(NSProgress *)self _setValueForKeys:v10 settingBlock:v9];
  }
  else
  {
    if (qword_1EB1ECEE0 != -1) {
      dispatch_once(&qword_1EB1ECEE0, &__block_literal_global_90);
    }
    objc_super v8 = _MergedGlobals_25_1;
    if (os_log_type_enabled((os_log_t)_MergedGlobals_25_1, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_181795000, v8, OS_LOG_TYPE_ERROR, "mismatched count of values and keys from remote progress KVO update", buf, 2u);
    }
  }
}

uint64_t __39__NSProgress__setRemoteValues_forKeys___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  if (*(void *)(a1 + 48))
  {
    unint64_t v5 = 0;
    do
    {
      double v6 = (void *)[*(id *)(a1 + 32) objectAtIndexedSubscript:v5];
      uint64_t v7 = (__CFString *)[*(id *)(a1 + 40) objectAtIndexedSubscript:v5];
      if (![(__CFString *)v7 isEqualToString:@"fractionCompleted"]
        || (double v8 = *(double *)(a2 + 64), [v6 doubleValue], v8 == v9))
      {
        qos_class_t v10 = (void *)v4;
        long long v11 = v7;
      }
      else
      {
        qos_class_t v10 = (void *)v4;
        long long v11 = @"fractionCompleted";
      }
      [v10 addObject:v11];
      ++v5;
    }
    while (v5 < *(void *)(a1 + 48));
  }
  return v4;
}

uint64_t __39__NSProgress__setRemoteValues_forKeys___block_invoke_2(uint64_t result, void *a2)
{
  if (*(void *)(result + 48))
  {
    uint64_t v3 = result;
    unint64_t v4 = 0;
    do
    {
      unint64_t v5 = (void *)[*(id *)(v3 + 32) objectAtIndexedSubscript:v4];
      double v6 = (void *)[*(id *)(v3 + 40) objectAtIndexedSubscript:v4];
      if ([v6 isEqualToString:@"fractionCompleted"])
      {
        uint64_t result = [v5 doubleValue];
        a2[8] = v7;
      }
      else
      {
        uint64_t result = [a2 setValue:v5 forKey:v6];
      }
      ++v4;
    }
    while (v4 < *(void *)(v3 + 48));
  }
  return result;
}

- (double)_remoteFractionCompleted
{
  return self->_values->_remoteFractionCompleted;
}

uint64_t __31__NSProgress__serverConnection__block_invoke()
{
  qword_1EB1ECF38 = +[NSFileCoordinator _createConnectionToProgressRegistrar];
  objc_msgSend((id)qword_1EB1ECF38, "setRemoteObjectInterface:", +[NSProgress _registrarInterface](NSProgress, "_registrarInterface"));
  [(id)qword_1EB1ECF38 setOptions:4096];
  v0 = (void *)qword_1EB1ECF38;

  return [v0 resume];
}

- (void)_receiveProgressMessage:(void *)result forSequence:(xpc_object_t)xdict
{
  if (!result) {
    return result;
  }
  uint64_t v3 = result;
  if (xpc_dictionary_get_BOOL(xdict, "isUserInfo"))
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(xdict, "userInfoKey");
    if ((uint64 & 0xFFFFFFFFFFFFFFFBLL) - 1 > 1)
    {
      if ((unint64_t)(uint64 - 3) > 1)
      {
        if (uint64 == 8)
        {
          uint64_t uint64 = objc_msgSend(v3, "setPausable:", xpc_dictionary_get_BOOL(xdict, "isPausable"));
        }
        else if (uint64 == 7)
        {
          uint64_t uint64 = objc_msgSend(v3, "setCancellable:", xpc_dictionary_get_BOOL(xdict, "isCancellable"));
        }
        uint64_t v10 = 0;
        goto LABEL_30;
      }
      double v8 = @"_NSProgressRemoteLocalizedAdditionalDescriptionKey";
      if (uint64 != 4) {
        double v8 = 0;
      }
      if (uint64 == 3) {
        unint64_t v5 = @"_NSProgressRemoteLocalizedDescriptionKey";
      }
      else {
        unint64_t v5 = v8;
      }
      string = xpc_dictionary_get_string(xdict, "userInfoVal");
      uint64_t uint64 = xpc_dictionary_get_BOOL(xdict, "userInfoValNil");
      uint64_t v10 = 0;
      if (!string || (uint64 & 1) != 0)
      {
LABEL_26:
        if (v5)
        {
          uint64_t v11 = v10;
          uint64_t uint64 = [v3 setUserInfoObject:v10 forKey:v5];
          uint64_t v10 = v11;
        }
LABEL_30:
        return (void *)MEMORY[0x1F41817F8](uint64, v10);
      }
      uint64_t uint64 = [[NSString alloc] initWithUTF8String:string];
    }
    else
    {
      if ((unint64_t)(uint64 - 1) > 5) {
        unint64_t v5 = 0;
      }
      else {
        unint64_t v5 = off_1E51FECE8[uint64 - 1];
      }
      uint64_t uint64 = xpc_dictionary_get_BOOL(xdict, "userInfoValNil");
      if (uint64)
      {
        uint64_t v10 = 0;
        goto LABEL_26;
      }
      uint64_t uint64 = [[NSNumber alloc] initWithUnsignedInteger:xpc_dictionary_get_uint64(xdict, "userInfoVal")];
    }
    uint64_t v10 = uint64;
    goto LABEL_26;
  }
  uint64_t v6 = xpc_dictionary_get_uint64(xdict, "totalCount");
  uint64_t v7 = xpc_dictionary_get_uint64(xdict, "completedCount");

  return (void *)[v3 _setCompletedUnitCount:v7 totalUnitCount:v6];
}

@end