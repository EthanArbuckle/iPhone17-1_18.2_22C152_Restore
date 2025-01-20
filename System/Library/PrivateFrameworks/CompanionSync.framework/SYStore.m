@interface SYStore
- (BOOL)_startResetSyncSession:(id)a3 error:(id *)a4;
- (BOOL)addObject:(id)a3 context:(id)a4 idsOptions:(id)a5 error:(id *)a6;
- (BOOL)addObject:(id)a3 error:(id *)a4;
- (BOOL)allowsDeletes;
- (BOOL)deleteObject:(id)a3 context:(id)a4 idsOptions:(id)a5 error:(id *)a6;
- (BOOL)deleteObject:(id)a3 error:(id *)a4;
- (BOOL)hasCompletedFullSync;
- (BOOL)inDeltaSync;
- (BOOL)isPaired;
- (BOOL)resume:(id *)a3;
- (BOOL)service:(id)a3 startSession:(id)a4 error:(id *)a5;
- (BOOL)updateObject:(id)a3 context:(id)a4 idsOptions:(id)a5 error:(id *)a6;
- (BOOL)updateObject:(id)a3 error:(id *)a4;
- (NSDictionary)customIDSDeliveryOptions;
- (OS_dispatch_queue)delegateQueue;
- (SYAtomicFIFO)sessionQueue;
- (SYPersistentStore)persistentStore;
- (SYSerialization)serializer;
- (SYService)syService;
- (SYStore)init;
- (SYStore)initWithService:(id)a3;
- (SYStore)initWithService:(id)a3 isGStore:(BOOL)a4 highPriority:(BOOL)a5;
- (SYStore)initWithService:(id)a3 isGStore:(BOOL)a4 highPriority:(BOOL)a5 isMasterStore:(BOOL)a6;
- (SYStore)initWithService:(id)a3 isGStore:(BOOL)a4 highPriority:(BOOL)a5 isMasterStore:(BOOL)a6 tracksChanges:(BOOL)a7;
- (SYStore)initWithService:(id)a3 isGStore:(BOOL)a4 priority:(int64_t)a5 isMasterStore:(BOOL)a6;
- (SYStore)initWithService:(id)a3 isGStore:(BOOL)a4 priority:(int64_t)a5 isMasterStore:(BOOL)a6 tracksChanges:(BOOL)a7;
- (SYStore)initWithServiceName:(id)a3 priority:(int64_t)a4 isMasterStore:(BOOL)a5;
- (SYStoreDelegate)delegate;
- (SYStoreResetSessionOwner)pendingResetSessionOwner;
- (SYStoreSessionOwner)sessionOwner;
- (double)timeToLive;
- (id)changeFromData:(id)a3 ofType:(int64_t)a4;
- (id)dataFromChange:(id)a3;
- (id)decodeChangeData:(id)a3 fromProtocolVersion:(int64_t)a4 ofType:(int64_t)a5;
- (id)decodeSYObject:(id)a3;
- (id)encodeSYObject:(id)a3;
- (int64_t)maxBytesInFlight;
- (int64_t)priority;
- (int64_t)state;
- (unsigned)deliveryQOS;
- (void)_enqueueDeltaSessionWithChanges:(id)a3 contextInfo:(id)a4 idsOptions:(id)a5 blockUntilSent:(BOOL)a6 reportError:(id)a7;
- (void)_signalNextQueuedSession;
- (void)_startIncomingSession:(id)a3;
- (void)_transaction:(id)a3 context:(id)a4 idsOptions:(id)a5 blockUntilSent:(BOOL)a6 reportError:(id)a7;
- (void)addObject:(id)a3;
- (void)addObject:(id)a3 completion:(id)a4;
- (void)addObject:(id)a3 context:(id)a4;
- (void)addObject:(id)a3 context:(id)a4 idsOptions:(id)a5;
- (void)blockingTransaction:(id)a3;
- (void)blockingTransaction:(id)a3 handlingError:(id)a4;
- (void)deleteObject:(id)a3;
- (void)deleteObject:(id)a3 completion:(id)a4;
- (void)deleteObject:(id)a3 context:(id)a4;
- (void)deleteObject:(id)a3 context:(id)a4 idsOptions:(id)a5;
- (void)didEndDeltaSync;
- (void)service:(id)a3 didSwitchFromPairingID:(id)a4 toPairingID:(id)a5;
- (void)service:(id)a3 encounteredError:(id)a4 context:(id)a5;
- (void)service:(id)a3 willSwitchFromPairingID:(id)a4 toPairingID:(id)a5;
- (void)setAllowsDeletes:(BOOL)a3;
- (void)setCustomIDSDeliveryOptions:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeliveryQOS:(unsigned int)a3;
- (void)setMaxBytesInFlight:(int64_t)a3;
- (void)setNeedsFullSync;
- (void)setNeedsFullSyncWithContext:(id)a3 idsOptions:(id)a4;
- (void)setPendingResetSessionOwner:(id)a3;
- (void)setPriority:(int64_t)a3;
- (void)setSerializer:(id)a3;
- (void)setSessionOwner:(id)a3;
- (void)setTimeToLive:(double)a3;
- (void)transaction:(id)a3;
- (void)transaction:(id)a3 completion:(id)a4;
- (void)transaction:(id)a3 context:(id)a4;
- (void)transaction:(id)a3 context:(id)a4 idsOptions:(id)a5;
- (void)transaction:(id)a3 context:(id)a4 idsOptions:(id)a5 blockUntilSent:(BOOL)a6;
- (void)transaction:(id)a3 handlingError:(id)a4;
- (void)updateObject:(id)a3;
- (void)updateObject:(id)a3 completion:(id)a4;
- (void)updateObject:(id)a3 context:(id)a4;
- (void)updateObject:(id)a3 context:(id)a4 idsOptions:(id)a5;
- (void)willBeginDeltaSync;
@end

@implementation SYStore

- (SYStore)init
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9.receiver = self;
    v9.super_class = (Class)SYStore;
    self = [(SYStore *)&v9 init];
    v3 = self;
  }
  else
  {
    v4 = (void *)MEMORY[0x263EFF940];
    uint64_t v5 = *MEMORY[0x263EFF498];
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    [v4 raise:v5, @"-[%@ init] is not supported.", v7 format];

    v3 = 0;
  }

  return v3;
}

- (SYStore)initWithService:(id)a3
{
  return [(SYStore *)self initWithService:a3 isGStore:0 highPriority:0];
}

- (SYStore)initWithService:(id)a3 isGStore:(BOOL)a4 highPriority:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  objc_super v9 = (void *)MGCopyAnswer();
  v10 = -[SYStore initWithService:isGStore:highPriority:isMasterStore:](self, "initWithService:isGStore:highPriority:isMasterStore:", v8, v6, v5, [v9 intValue] != 6);

  return v10;
}

- (SYStore)initWithService:(id)a3 isGStore:(BOOL)a4 highPriority:(BOOL)a5 isMasterStore:(BOOL)a6
{
  return [(SYStore *)self initWithService:a3 isGStore:a4 priority:a5 isMasterStore:a6];
}

- (SYStore)initWithService:(id)a3 isGStore:(BOOL)a4 priority:(int64_t)a5 isMasterStore:(BOOL)a6
{
  return [(SYStore *)self initWithService:a3 isGStore:a4 priority:a5 isMasterStore:a6 tracksChanges:1];
}

- (SYStore)initWithService:(id)a3 isGStore:(BOOL)a4 highPriority:(BOOL)a5 isMasterStore:(BOOL)a6 tracksChanges:(BOOL)a7
{
  return [(SYStore *)self initWithService:a3 isGStore:a4 priority:a5 isMasterStore:a6 tracksChanges:a7];
}

- (SYStore)initWithService:(id)a3 isGStore:(BOOL)a4 priority:(int64_t)a5 isMasterStore:(BOOL)a6 tracksChanges:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v10 = a4;
  id v12 = a3;
  v13 = [[SYLegacyStore alloc] initWithService:v12 isGStore:v10 priority:a5 isMasterStore:v8 tracksChanges:v7];

  return &v13->super;
}

- (SYStore)initWithServiceName:(id)a3 priority:(int64_t)a4 isMasterStore:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v24.receiver = self;
  v24.super_class = (Class)SYStore;
  id v9 = [(SYStore *)&v24 init];
  if (!v9) {
    goto LABEL_9;
  }
  uint64_t v10 = -20;
  if (a4 == 1) {
    uint64_t v10 = 0;
  }
  uint64_t v11 = a4 == 2 ? 20 : v10;
  id v12 = [[SYService alloc] initWithService:v8 priority:v11 asMasterStore:v5 options:0];
  v13 = (void *)*((void *)v9 + 6);
  *((void *)v9 + 6) = v12;

  if (*((void *)v9 + 6))
  {
    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = dispatch_queue_attr_make_with_qos_class(v14, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v16 = dispatch_queue_create("companionsync_serial_qos", v15);
    v17 = (void *)*((void *)v9 + 1);
    *((void *)v9 + 1) = v16;

    dispatch_queue_t v18 = dispatch_queue_create("companionsync_serial", 0);
    v19 = (void *)*((void *)v9 + 9);
    *((void *)v9 + 9) = v18;

    dispatch_set_target_queue(*((dispatch_object_t *)v9 + 9), *((dispatch_queue_t *)v9 + 1));
    [*((id *)v9 + 6) setDelegate:v9 queue:*((void *)v9 + 9)];
    v20 = [[SYAtomicFIFO alloc] initWithCapacity:10];
    v21 = (void *)*((void *)v9 + 10);
    *((void *)v9 + 10) = v20;

    *((unsigned char *)v9 + 20) = 1;
    v22 = (SYStore *)v9;
  }
  else
  {
LABEL_9:
    v22 = 0;
  }

  return v22;
}

- (id)dataFromChange:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v5 = [v4 wrappedObject];
    BOOL v6 = [(SYStore *)self encodeSYObject:v5];

    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v4 changeData];
LABEL_7:
    BOOL v6 = (void *)v7;
    goto LABEL_9;
  }
  if ([v4 conformsToProtocol:&unk_26CD37188])
  {
    uint64_t v7 = [(SYStore *)self encodeSYObject:v4];
    goto LABEL_7;
  }
  BOOL v6 = 0;
LABEL_9:

  return v6;
}

- (id)changeFromData:(id)a3 ofType:(int64_t)a4
{
  BOOL v5 = [(SYStore *)self decodeSYObject:a3];
  if (v5) {
    BOOL v6 = [[SYObjectWrapper alloc] initWithSYObject:v5 type:a4];
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)decodeChangeData:(id)a3 fromProtocolVersion:(int64_t)a4 ofType:(int64_t)a5
{
  return [(SYStore *)self changeFromData:a3 ofType:a5];
}

- (void)setDelegate:(id)a3
{
  id v19 = a3;
  objc_storeWeak((id *)&self->_delegate, v19);
  if (v19)
  {
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | objc_opt_respondsToSelector() & 1;
    if (objc_opt_respondsToSelector()) {
      __int16 v4 = 2;
    }
    else {
      __int16 v4 = 0;
    }
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v4;
    if (objc_opt_respondsToSelector()) {
      __int16 v5 = 4;
    }
    else {
      __int16 v5 = 0;
    }
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v5;
    if (objc_opt_respondsToSelector()) {
      __int16 v6 = 8;
    }
    else {
      __int16 v6 = 0;
    }
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v6;
    if (objc_opt_respondsToSelector()) {
      __int16 v7 = 16;
    }
    else {
      __int16 v7 = 0;
    }
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFEF | v7;
    if (objc_opt_respondsToSelector()) {
      __int16 v8 = 32;
    }
    else {
      __int16 v8 = 0;
    }
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFDF | v8;
    if (objc_opt_respondsToSelector()) {
      __int16 v9 = 64;
    }
    else {
      __int16 v9 = 0;
    }
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFBF | v9;
    if (objc_opt_respondsToSelector()) {
      __int16 v10 = 128;
    }
    else {
      __int16 v10 = 0;
    }
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFF7F | v10;
    if (objc_opt_respondsToSelector()) {
      __int16 v11 = 256;
    }
    else {
      __int16 v11 = 0;
    }
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFEFF | v11;
    if (objc_opt_respondsToSelector()) {
      __int16 v12 = 512;
    }
    else {
      __int16 v12 = 0;
    }
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFDFF | v12;
    if (objc_opt_respondsToSelector()) {
      __int16 v13 = 1024;
    }
    else {
      __int16 v13 = 0;
    }
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFBFF | v13;
    if (objc_opt_respondsToSelector()) {
      __int16 v14 = 2048;
    }
    else {
      __int16 v14 = 0;
    }
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xF7FF | v14;
    if (objc_opt_respondsToSelector()) {
      __int16 v15 = 4096;
    }
    else {
      __int16 v15 = 0;
    }
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xEFFF | v15;
    if (objc_opt_respondsToSelector()) {
      __int16 v16 = 0x2000;
    }
    else {
      __int16 v16 = 0;
    }
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xDFFF | v16;
    if (objc_opt_respondsToSelector()) {
      __int16 v17 = 0x4000;
    }
    else {
      __int16 v17 = 0;
    }
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xBFFF | v17;
    if (objc_opt_respondsToSelector()) {
      __int16 v18 = 0x8000;
    }
    else {
      __int16 v18 = 0;
    }
    *(_WORD *)&self->_flags = v18 & 0x8000 | *(_WORD *)&self->_flags & 0x7FFF;
  }
}

- (BOOL)resume:(id *)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    syService = self->_syService;
    return [(SYService *)syService resume:a3];
  }
  else
  {
    if (a3)
    {
      id v8 = objc_alloc(MEMORY[0x263F087E8]);
      uint64_t v10 = *MEMORY[0x263F08320];
      v11[0] = @"SYStore must be given a delegate object before it can be resumed.";
      __int16 v9 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
      *a3 = (id)[v8 initWithSYError:2001 userInfo:v9];
    }
    return 0;
  }
}

- (int64_t)priority
{
  syService = [(SYService *)self->_syService currentSession];
  __int16 v4 = syService;
  if (!syService) {
    syService = self->_syService;
  }
  uint64_t v5 = [syService priority];
  if (v5 == 20) {
    int64_t v6 = 2;
  }
  else {
    int64_t v6 = v5 == 0;
  }

  return v6;
}

- (void)setPriority:(int64_t)a3
{
  syService = [(SYService *)self->_syService currentSession];
  uint64_t v6 = -20;
  if (a3 == 1) {
    uint64_t v6 = 0;
  }
  if (a3 == 2) {
    uint64_t v7 = 20;
  }
  else {
    uint64_t v7 = v6;
  }
  id v8 = syService;
  if (!syService) {
    syService = self->_syService;
  }
  [syService setPriority:v7];
}

- (double)timeToLive
{
  [(SYService *)self->_syService defaultMessageTimeout];
  return result;
}

- (void)setTimeToLive:(double)a3
{
}

- (NSDictionary)customIDSDeliveryOptions
{
  return [(SYService *)self->_syService customIDSOptions];
}

- (void)setCustomIDSDeliveryOptions:(id)a3
{
}

- (BOOL)isPaired
{
  return [(SYService *)self->_syService hasPairingStore];
}

- (unsigned)deliveryQOS
{
  return dispatch_queue_get_qos_class((dispatch_queue_t)self->_qosTargetQueue, 0);
}

- (void)setDeliveryQOS:(unsigned int)a3
{
  if ([(SYStore *)self deliveryQOS] != a3)
  {
    delegateQueue = self->_delegateQueue;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __26__SYStore_setDeliveryQOS___block_invoke;
    v6[3] = &unk_264422B80;
    v6[4] = self;
    unsigned int v7 = a3;
    dispatch_async(delegateQueue, v6);
  }
}

void __26__SYStore_setDeliveryQOS___block_invoke(uint64_t a1)
{
  label = dispatch_queue_get_label(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 8));
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  __int16 v4 = dispatch_queue_attr_make_with_qos_class(v3, *(dispatch_qos_class_t *)(a1 + 40), 0);
  uint64_t v5 = dispatch_queue_create(label, v4);

  dispatch_set_target_queue(*(dispatch_object_t *)(*(void *)(a1 + 32) + 72), v5);
  uint64_t v6 = *(void *)(a1 + 32);
  unsigned int v7 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v5;
}

- (int64_t)state
{
  v2 = [(SYService *)self->_syService name];
  v3 = +[SYPersistentStore sharedPersistentStoreForService:v2];

  if ([v3 inFullSync])
  {
    if ([v3 currentSyncSendComplete]) {
      int64_t v4 = 2;
    }
    else {
      int64_t v4 = 1;
    }
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (BOOL)hasCompletedFullSync
{
  v2 = [(SYService *)self->_syService name];
  v3 = +[SYPersistentStore sharedPersistentStoreForService:v2];
  char v4 = [v3 completedSync];

  return v4;
}

- (void)_signalNextQueuedSession
{
  sessionOwner = self->_sessionOwner;
  self->_sessionOwner = 0;

  char v4 = [(SYAtomicFIFO *)self->_sessionQueue head];
  if (v4)
  {
    id v5 = v4;
    [(SYService *)self->_syService setHasChangesAvailable];
    char v4 = v5;
  }
}

- (void)_enqueueDeltaSessionWithChanges:(id)a3 contextInfo:(id)a4 idsOptions:(id)a5 blockUntilSent:(BOOL)a6 reportError:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  __int16 v16 = [[SYStoreDeltaSessionOwner alloc] initWithChanges:v12];
  [(SYStoreSessionOwner *)v16 setContext:v13];
  [(SYStoreSessionOwner *)v16 setIdsOptions:v14];
  [(SYStoreSessionOwner *)v16 setErrorCallback:v15];
  [(SYStoreSessionOwner *)v16 setStore:self];
  if (v8) {
    dispatch_semaphore_t v17 = dispatch_semaphore_create(0);
  }
  else {
    dispatch_semaphore_t v17 = 0;
  }
  objc_initWeak(&location, self);
  uint64_t v30 = MEMORY[0x263EF8330];
  uint64_t v31 = 3221225472;
  v32 = __93__SYStore__enqueueDeltaSessionWithChanges_contextInfo_idsOptions_blockUntilSent_reportError___block_invoke;
  v33 = &unk_264422BD0;
  __int16 v18 = v17;
  v34 = v18;
  objc_copyWeak(&v36, &location);
  id v19 = v13;
  id v35 = v19;
  [(SYStoreSessionOwner *)v16 setOnComplete:&v30];
  -[SYAtomicFIFO enqueue:](self->_sessionQueue, "enqueue:", v16, v30, v31, v32, v33);
  [(SYService *)self->_syService setHasChangesAvailable];
  if (v8)
  {
    [(SYStore *)self timeToLive];
    dispatch_time_t v21 = dispatch_time(0, (uint64_t)(v20 * 1000000000.0));
    if (dispatch_semaphore_wait(v18, v21))
    {
      v22 = [(SYStoreSessionOwner *)v16 session];
      [v22 cancel];

      v23 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithSYError:2007 userInfo:0];
      objc_super v24 = [(SYStoreSessionOwner *)v16 errorCallback];

      if (v24)
      {
        id WeakRetained = [(SYStoreSessionOwner *)v16 errorCallback];
        ((void (**)(void, void *))WeakRetained)[2](WeakRetained, v23);
      }
      else
      {
        if ((*(_WORD *)&self->_flags & 0x400) == 0)
        {
LABEL_11:
          v29 = [(SYStoreSessionOwner *)v16 onComplete];
          v29[2]();

          goto LABEL_12;
        }
        id WeakRetained = (void (**)(void, void))objc_loadWeakRetained((id *)&self->_delegate);
        uint64_t v26 = [(SYStoreSessionOwner *)v16 context];
        v27 = self;
        v28 = (void *)v26;
        [WeakRetained syncStore:v27 encounteredError:v23 context:v26];
      }
      goto LABEL_11;
    }
  }
LABEL_12:

  objc_destroyWeak(&v36);
  objc_destroyWeak(&location);
}

void __93__SYStore__enqueueDeltaSessionWithChanges_contextInfo_idsOptions_blockUntilSent_reportError___block_invoke(uint64_t a1)
{
  v2 = *(NSObject **)(a1 + 32);
  if (v2) {
    dispatch_semaphore_signal(v2);
  }
  id WeakRetained = (unsigned __int16 *)objc_loadWeakRetained((id *)(a1 + 48));
  char v4 = WeakRetained;
  if (WeakRetained)
  {
    unsigned int v5 = WeakRetained[8];
    if ((v5 & 0x6000) != 0)
    {
      int v6 = (v5 >> 14) & 1;
      int v7 = (v5 >> 13) & 1;
      id v8 = objc_loadWeakRetained((id *)WeakRetained + 3);
      __int16 v9 = v4[9];
      uint64_t v11 = MEMORY[0x263EF8330];
      uint64_t v12 = 3221225472;
      id v13 = __93__SYStore__enqueueDeltaSessionWithChanges_contextInfo_idsOptions_blockUntilSent_reportError___block_invoke_2;
      id v14 = &unk_264422BA8;
      char v18 = v7;
      id v15 = v8;
      __int16 v16 = v4;
      id v17 = *(id *)(a1 + 40);
      char v19 = v6;
      id v10 = v8;
      dispatch_async(v9, &v11);
    }
    objc_msgSend(v4, "_signalNextQueuedSession", v11, v12, v13, v14);
  }
}

uint64_t __93__SYStore__enqueueDeltaSessionWithChanges_contextInfo_idsOptions_blockUntilSent_reportError___block_invoke_2(uint64_t result)
{
  uint64_t v1 = result;
  if (*(unsigned char *)(result + 56)) {
    double result = [*(id *)(result + 32) syncStore:*(void *)(result + 40) sentMessageWithContext:*(void *)(result + 48)];
  }
  if (*(unsigned char *)(v1 + 57))
  {
    v2 = *(void **)(v1 + 32);
    uint64_t v3 = *(void *)(v1 + 40);
    uint64_t v4 = *(void *)(v1 + 48);
    return [v2 syncStore:v3 peerFinishedProcessingMessageWithContext:v4];
  }
  return result;
}

- (BOOL)addObject:(id)a3 context:(id)a4 idsOptions:(id)a5 error:(id *)a6
{
  v17[1] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = _os_activity_create(&dword_21C7C9000, "CompanionSync AddObject", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  v16.opaque[0] = 0;
  v16.opaque[1] = 0;
  os_activity_scope_enter(v12, &v16);
  id v13 = +[SYChange changeWithObject:v9 updateType:0 store:self];
  v17[0] = v13;
  id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
  [(SYStore *)self _enqueueDeltaSessionWithChanges:v14 contextInfo:v10 idsOptions:v11 blockUntilSent:0 reportError:0];

  os_activity_scope_leave(&v16);
  return 1;
}

- (void)addObject:(id)a3 context:(id)a4 idsOptions:(id)a5
{
}

- (BOOL)addObject:(id)a3 error:(id *)a4
{
  return [(SYStore *)self addObject:a3 context:0 idsOptions:0 error:a4];
}

- (void)addObject:(id)a3
{
}

- (void)addObject:(id)a3 completion:(id)a4
{
}

- (void)addObject:(id)a3 context:(id)a4
{
}

- (BOOL)updateObject:(id)a3 context:(id)a4 idsOptions:(id)a5 error:(id *)a6
{
  v17[1] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = _os_activity_create(&dword_21C7C9000, "CompanionSync UpdateObject", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  v16.opaque[0] = 0;
  v16.opaque[1] = 0;
  os_activity_scope_enter(v12, &v16);
  id v13 = +[SYChange changeWithObject:v9 updateType:1 store:self];
  v17[0] = v13;
  id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
  [(SYStore *)self _enqueueDeltaSessionWithChanges:v14 contextInfo:v10 idsOptions:v11 blockUntilSent:0 reportError:0];

  os_activity_scope_leave(&v16);
  return 1;
}

- (void)updateObject:(id)a3 context:(id)a4 idsOptions:(id)a5
{
}

- (void)updateObject:(id)a3
{
}

- (BOOL)updateObject:(id)a3 error:(id *)a4
{
  return [(SYStore *)self updateObject:a3 context:0 idsOptions:0 error:a4];
}

- (void)updateObject:(id)a3 completion:(id)a4
{
}

- (void)updateObject:(id)a3 context:(id)a4
{
}

- (BOOL)deleteObject:(id)a3 context:(id)a4 idsOptions:(id)a5 error:(id *)a6
{
  v24[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  BOOL v13 = [(SYStore *)self allowsDeletes];
  if (v13)
  {
    id v14 = _os_activity_create(&dword_21C7C9000, "CompanionSync DeleteObject", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v14, &state);
    id v15 = +[SYChange changeWithObject:v10 updateType:2 store:self];
    v24[0] = v15;
    os_activity_scope_state_s v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
    [(SYStore *)self _enqueueDeltaSessionWithChanges:v16 contextInfo:v11 idsOptions:v12 blockUntilSent:0 reportError:0];

    os_activity_scope_leave(&state);
  }
  else
  {
    id v17 = [objc_alloc(MEMORY[0x263F087E8]) initWithSYError:1006 userInfo:0];
    id v14 = v17;
    if (a6)
    {
      id v14 = v17;
      *a6 = v14;
    }
    else if ((*(_WORD *)&self->_flags & 0x400) != 0)
    {
      delegateQueue = self->_delegateQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __49__SYStore_deleteObject_context_idsOptions_error___block_invoke;
      block[3] = &unk_264422BF8;
      block[4] = self;
      id v14 = v17;
      v22 = v14;
      id v23 = v11;
      dispatch_async(delegateQueue, block);
    }
  }

  return v13;
}

void __49__SYStore_deleteObject_context_idsOptions_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 syncStore:*(void *)(a1 + 32) encounteredError:*(void *)(a1 + 40) context:*(void *)(a1 + 48)];
}

- (void)deleteObject:(id)a3 context:(id)a4 idsOptions:(id)a5
{
}

- (void)deleteObject:(id)a3
{
}

- (BOOL)deleteObject:(id)a3 error:(id *)a4
{
  return [(SYStore *)self deleteObject:a3 context:0 idsOptions:0 error:a4];
}

- (void)deleteObject:(id)a3 completion:(id)a4
{
}

- (void)deleteObject:(id)a3 context:(id)a4
{
}

- (void)transaction:(id)a3
{
}

- (void)transaction:(id)a3 handlingError:(id)a4
{
}

- (void)transaction:(id)a3 completion:(id)a4
{
}

- (void)transaction:(id)a3 context:(id)a4
{
}

- (void)transaction:(id)a3 context:(id)a4 idsOptions:(id)a5
{
}

- (void)blockingTransaction:(id)a3
{
}

- (void)blockingTransaction:(id)a3 handlingError:(id)a4
{
}

- (void)transaction:(id)a3 context:(id)a4 idsOptions:(id)a5 blockUntilSent:(BOOL)a6
{
}

- (void)_transaction:(id)a3 context:(id)a4 idsOptions:(id)a5 blockUntilSent:(BOOL)a6 reportError:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  os_activity_scope_state_s v16 = [(SYService *)self->_syService name];
  id v17 = +[SYPersistentStore sharedPersistentStoreForService:v16];

  if ([v17 completedSync])
  {
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __70__SYStore__transaction_context_idsOptions_blockUntilSent_reportError___block_invoke;
    v19[3] = &unk_264422C20;
    v19[4] = self;
    id v22 = v12;
    id v20 = v13;
    id v21 = v14;
    BOOL v24 = a6;
    id v23 = v15;
    _os_activity_initiate(&dword_21C7C9000, "CompanionSync Transaction", OS_ACTIVITY_FLAG_DEFAULT, v19);
  }
  else if (v15)
  {
    char v18 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithSYError:1005 userInfo:0];
    (*((void (**)(id, void *))v15 + 2))(v15, v18);
  }
}

void __70__SYStore__transaction_context_idsOptions_blockUntilSent_reportError___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x21D4B1560]();
  uint64_t v3 = [[SYTransaction alloc] initWithStore:*(void *)(a1 + 32)];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  uint64_t v4 = *(void **)(a1 + 32);
  unsigned int v5 = [(SYTransaction *)v3 changeList];
  [v4 _enqueueDeltaSessionWithChanges:v5 contextInfo:*(void *)(a1 + 40) idsOptions:*(void *)(a1 + 48) blockUntilSent:*(unsigned __int8 *)(a1 + 72) reportError:*(void *)(a1 + 64)];
}

- (void)setNeedsFullSync
{
}

- (void)setNeedsFullSyncWithContext:(id)a3 idsOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(SYStoreSessionOwner *)self->_sessionOwner isResetSync])
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    id v8 = qword_26AB04788;
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl(&dword_21C7C9000, v8, OS_LOG_TYPE_DEFAULT, "SYStore skipping full sync, already in progress.", v14, 2u);
    }
  }
  else
  {
    pendingResetSessionOwner = self->_pendingResetSessionOwner;
    if (!pendingResetSessionOwner)
    {
      id v10 = (SYStoreResetSessionOwner *)objc_opt_new();
      id v11 = self->_pendingResetSessionOwner;
      self->_pendingResetSessionOwner = v10;

      pendingResetSessionOwner = self->_pendingResetSessionOwner;
    }
    [(SYStoreSessionOwner *)pendingResetSessionOwner setContext:v6];
    [(SYStoreSessionOwner *)self->_pendingResetSessionOwner setIdsOptions:v7];
    id v12 = [(SYService *)self->_syService name];
    id v13 = +[SYPersistentStore sharedPersistentStoreForService:v12];

    [v13 setCompletedSync:0];
    [v13 setFullSyncUserInfo:v6];
    [v13 setFullSyncIDSOptions:v7];
    [(SYService *)self->_syService setNeedsResetSync];
  }
}

- (id)decodeSYObject:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(SYStore *)self serializer];

  if (!v5)
  {
    id v9 = objc_alloc(MEMORY[0x263EFF940]);
    objc_exception_throw((id)[v9 initWithName:*MEMORY[0x263EFF498] reason:@"SYStore does not have a serializer. You must set it." userInfo:0]);
  }
  id v6 = [(SYStore *)self serializer];
  id v7 = [v6 SYObjectWithData:v4];

  return v7;
}

- (id)encodeSYObject:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(SYStore *)self serializer];

  if (v5)
  {
    id v6 = [(SYStore *)self serializer];
    id v7 = [v6 dataWithSYObject:v4];
  }
  else if ([v4 conformsToProtocol:&unk_26CD347C0])
  {
    id v7 = [MEMORY[0x263F08910] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:0];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)_startIncomingSession:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [[SYStoreIncomingSessionOwner alloc] initWithIncomingSession:v4];
  id v6 = [v4 userContext];
  [(SYStoreSessionOwner *)v5 setContext:v6];

  id v7 = [v4 options];
  [(SYStoreSessionOwner *)v5 setIdsOptions:v7];

  [(SYStoreSessionOwner *)v5 setStore:self];
  [v4 setDelegate:v5];
  [v4 setTargetQueue:self->_delegateQueue];
  [v4 setSerializer:self];
  id v8 = [(SYStoreSessionOwner *)v5 idsOptions];
  [v4 setOptions:v8];

  id v9 = [(SYStoreSessionOwner *)v5 context];
  [v4 setUserContext:v9];

  if (*(_WORD *)&self->_flags)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained syncStoreWillUpdate:self];
  }
  char v11 = [v4 isResetSync];
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __33__SYStore__startIncomingSession___block_invoke;
  v14[3] = &unk_264422C48;
  objc_copyWeak(&v15, &location);
  char v16 = v11;
  v14[4] = self;
  [(SYStoreSessionOwner *)v5 setOnComplete:v14];
  sessionOwner = self->_sessionOwner;
  self->_sessionOwner = &v5->super;
  id v13 = v5;

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

uint64_t __33__SYStore__startIncomingSession___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    id v4 = objc_loadWeakRetained(WeakRetained + 3);
    unsigned int v5 = v8;
    id v6 = v4;
    if (((_WORD)v8[2] & 4) != 0)
    {
      [v4 syncStoreDidUpdate:v8];
      unsigned int v5 = v8;
    }
    if (*(unsigned char *)(a1 + 48) && (*(_WORD *)(*(void *)(a1 + 32) + 16) & 8) != 0)
    {
      [v6 syncStoreDidCompleteFullSync:v8];
      unsigned int v5 = v8;
    }
    [v5 _signalNextQueuedSession];

    uint64_t v3 = v8;
  }
  return MEMORY[0x270F9A758](WeakRetained, v3);
}

- (BOOL)_startResetSyncSession:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = self->_pendingResetSessionOwner;
  if (!v7) {
    id v7 = (SYStoreResetSessionOwner *)objc_opt_new();
  }
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x80) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v10 = [WeakRetained beginSyncingAllObjectsForStore:self];

    if (v10)
    {
LABEL_8:
      [(SYStoreResetSessionOwner *)v7 setFetchNextBatch:v10];
      objc_initWeak(&location, self);
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __40__SYStore__startResetSyncSession_error___block_invoke_2;
      v15[3] = &unk_264422C90;
      objc_copyWeak(&v16, &location);
      [(SYStoreSessionOwner *)v7 setOnComplete:v15];
      [(SYStoreSessionOwner *)v7 setStore:self];
      objc_storeStrong((id *)&self->_sessionOwner, v7);
      [v6 setDelegate:v7];
      [v6 setTargetQueue:self->_delegateQueue];
      [v6 setSerializer:self];
      char v11 = [(SYStoreSessionOwner *)v7 idsOptions];
      [v6 setOptions:v11];

      id v12 = [(SYStoreSessionOwner *)v7 context];
      [v6 setUserContext:v12];

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);

      BOOL v13 = 1;
      goto LABEL_11;
    }
    __int16 flags = (__int16)self->_flags;
  }
  if ((flags & 0x20) != 0)
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __40__SYStore__startResetSyncSession_error___block_invoke;
    v18[3] = &__block_descriptor_40_e28_q24__0__NSMutableArray_8__16lu32l8;
    v18[4] = self;
    id v10 = (void *)MEMORY[0x21D4B17C0](v18);
    if (v10) {
      goto LABEL_8;
    }
  }
  BOOL v13 = 0;
  if (a4) {
    *a4 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithSYError:-128 userInfo:0];
  }
LABEL_11:

  return v13;
}

uint64_t __40__SYStore__startResetSyncSession_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  unsigned int v5 = [v3 delegate];
  id v6 = [v5 syncStoreAllObjects:*(void *)(a1 + 32)];
  [v4 addObjectsFromArray:v6];

  return 1;
}

void __40__SYStore__startResetSyncSession_error___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained;
    if (((_WORD)WeakRetained[2] & 8) != 0)
    {
      id v2 = objc_loadWeakRetained(WeakRetained + 3);
      [v2 syncStoreDidCompleteFullSync:v3];
    }
    [v3 _signalNextQueuedSession];
    id WeakRetained = v3;
  }
}

- (BOOL)service:(id)a3 startSession:(id)a4 error:(id *)a5
{
  id v7 = a4;
  if ([v7 isSending])
  {
    int v8 = [v7 isResetSync];
    sessionQueue = self->_sessionQueue;
    if (v8)
    {
      [(SYAtomicFIFO *)sessionQueue removeAllObjects];
      BOOL v10 = [(SYStore *)self _startResetSyncSession:v7 error:a5];
    }
    else
    {
      char v11 = [(SYAtomicFIFO *)sessionQueue dequeue];
      BOOL v10 = v11 != 0;
      if (v11)
      {
        [v7 setCanRestart:0];
        [v7 setCanRollback:0];
        [v7 setDelegate:v11];
        [v7 setTargetQueue:self->_delegateQueue];
        [v7 setSerializer:self];
        id v12 = [v11 idsOptions];
        [v7 setOptions:v12];

        BOOL v13 = [v11 context];
        [v7 setUserContext:v13];

        [v11 setSession:v7];
        [v11 setStore:self];
        objc_storeStrong((id *)&self->_sessionOwner, v11);
      }
      else if (a5)
      {
        *a5 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithSYError:2009 userInfo:0];
      }
    }
  }
  else
  {
    [(SYStore *)self _startIncomingSession:v7];
    BOOL v10 = 1;
  }

  return v10;
}

- (void)service:(id)a3 willSwitchFromPairingID:(id)a4 toPairingID:(id)a5
{
  [a3 suspend];
  if (!a5 && (*(_WORD *)&self->_flags & 0x1000) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained syncStoreDidUnpair:self];
  }
}

- (void)service:(id)a3 didSwitchFromPairingID:(id)a4 toPairingID:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    id v20 = 0;
    char v11 = [v8 resume:&v20];
    id v12 = v20;
    BOOL v13 = v12;
    if (v11)
    {
LABEL_3:
      if (!v9 && (*(_WORD *)&self->_flags & 0x800) != 0)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained syncStoreDidSetupAfterPairing:self];
      }
LABEL_14:

      goto LABEL_15;
    }
    id v15 = [v12 domain];
    if ([v15 isEqualToString:@"SYErrorDomain"])
    {
      uint64_t v16 = [v13 code];

      if (v16 == 2002) {
        goto LABEL_3;
      }
    }
    else
    {
    }
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    id v17 = (void *)qword_26AB04788;
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_ERROR))
    {
      char v18 = v17;
      char v19 = _SYObfuscate(v13);
      *(_DWORD *)buf = 138543874;
      id v22 = v9;
      __int16 v23 = 2114;
      id v24 = v10;
      __int16 v25 = 2114;
      uint64_t v26 = v19;
      _os_log_error_impl(&dword_21C7C9000, v18, OS_LOG_TYPE_ERROR, "Failed to resume SYService after switching from device %{public}@ to %{public}@: %{public}@", buf, 0x20u);
    }
    goto LABEL_14;
  }
LABEL_15:
}

- (void)service:(id)a3 encounteredError:(id)a4 context:(id)a5
{
  if ((*(_WORD *)&self->_flags & 0x400) != 0)
  {
    p_delegate = &self->_delegate;
    id v8 = a5;
    id v9 = a4;
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    [WeakRetained syncStore:self encounteredError:v9 context:v8];
  }
}

- (SYStoreDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SYStoreDelegate *)WeakRetained;
}

- (SYSerialization)serializer
{
  return self->_serializer;
}

- (void)setSerializer:(id)a3
{
}

- (int64_t)maxBytesInFlight
{
  return self->_maxBytesInFlight;
}

- (void)setMaxBytesInFlight:(int64_t)a3
{
  self->_maxBytesInFlight = a3;
}

- (BOOL)allowsDeletes
{
  return self->_allowsDeletes;
}

- (void)setAllowsDeletes:(BOOL)a3
{
  self->_allowsDeletes = a3;
}

- (SYService)syService
{
  return self->_syService;
}

- (SYStoreSessionOwner)sessionOwner
{
  return self->_sessionOwner;
}

- (void)setSessionOwner:(id)a3
{
}

- (SYStoreResetSessionOwner)pendingResetSessionOwner
{
  return self->_pendingResetSessionOwner;
}

- (void)setPendingResetSessionOwner:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (SYAtomicFIFO)sessionQueue
{
  return self->_sessionQueue;
}

- (SYPersistentStore)persistentStore
{
  return self->_persistentStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentStore, 0);
  objc_storeStrong((id *)&self->_sessionQueue, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_pendingResetSessionOwner, 0);
  objc_storeStrong((id *)&self->_sessionOwner, 0);
  objc_storeStrong((id *)&self->_syService, 0);
  objc_storeStrong((id *)&self->_serializer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_qosTargetQueue, 0);
}

- (BOOL)inDeltaSync
{
  id v2 = [(SYService *)self->_syService name];
  uint64_t v3 = +[SYPersistentStore sharedPersistentStoreForService:v2];
  char v4 = [v3 isPerformingDeltaSync];

  return v4;
}

- (void)willBeginDeltaSync
{
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  uint64_t v3 = qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_21C7C9000, v3, OS_LOG_TYPE_DEFAULT, "Beginning SYStore delta sync", v6, 2u);
  }
  char v4 = [(SYService *)self->_syService name];
  unsigned int v5 = +[SYPersistentStore sharedPersistentStoreForService:v4];
  [v5 setPerformingDeltaSync:1];
}

- (void)didEndDeltaSync
{
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  uint64_t v3 = qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_21C7C9000, v3, OS_LOG_TYPE_DEFAULT, "Ended SYStore delta sync", v6, 2u);
  }
  char v4 = [(SYService *)self->_syService name];
  unsigned int v5 = +[SYPersistentStore sharedPersistentStoreForService:v4];
  [v5 setPerformingDeltaSync:0];
}

@end