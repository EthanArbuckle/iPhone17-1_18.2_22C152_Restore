@interface XRSpace
+ (void)runWhenOperationFinishes:(id)a3 block:(id)a4;
- (BOOL)currentlyInThisSpace;
- (BOOL)isBusy;
- (BOOL)isOpValidForSpace:(id)a3;
- (BOOL)isSerial;
- (BOOL)supportsOpNames;
- (NSOperationQueue)queue;
- (XRSpace)init;
- (XRSpace)initWithQueue:(id)a3;
- (id)_scheduleOperationFromCurrentQueue:(id)a3;
- (id)afterOperation:(id)a3 block:(id)a4;
- (id)afterOperation:(id)a3 priority:(int64_t)a4 spaceBlock:(id)a5;
- (id)afterOperation:(id)a3 spaceBlock:(id)a4;
- (id)afterOperations:(id)a3 priority:(int64_t)a4 spaceBlock:(id)a5;
- (id)afterOperationsRunBlock:(id)a3;
- (id)spaceName;
- (id)storeUserData:(id)a3;
- (id)userDataForToken:(id)a3;
- (unint64_t)operationCount;
- (void)_postQueueStateChanged;
- (void)_removeNotificationShim:(id)a3;
- (void)addOperation:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)receiveMobileAgent:(id)a3;
- (void)removeUserDataForToken:(id)a3;
- (void)replaceUserData:(id)a3 forToken:(id)a4;
- (void)requestLocalNotification:(id)a3 object:(id)a4 observer:(id)a5 block:(id)a6;
- (void)setSupportsOpNames:(BOOL)a3;
- (void)setupVisitAfterOperation:(id)a3 itinerary:(id)a4 mode:(id)a5;
- (void)stopObservationsOfObject:(id)a3 forObserver:(id)a4;
@end

@implementation XRSpace

+ (void)runWhenOperationFinishes:(id)a3 block:(id)a4
{
  id v18 = a3;
  id v9 = a4;
  if (v18 && ![v18 isFinished:v5 withTransitionContext:v6 withCompletion:v7 withCompletion:v8])
  {
    v11 = [XRFollowUpBlock alloc];
    v10 = [v11 initWithBlock:v12 operation:v9];
    [v10 v14:v15 v16:v17];
  }
  else
  {
    v10 = dispatch_get_global_queue(21, 0);
    dispatch_async(v10, v9);
  }
}

- (XRSpace)initWithQueue:(id)a3
{
  id v5 = a3;
  v52.receiver = self;
  v52.super_class = (Class)XRSpace;
  uint64_t v6 = [(XRSpace *)&v52 init];
  if (v6)
  {
    uint64_t v7 = objc_opt_class();
    v6->_supportsOpNames = [v7 respondsToSelector:sel_name];
    v11 = objc_opt_class();
    v6->_overridesQoS = [v11 respondsToSelector:@selector(setQualityOfService:)];
    p_queue = (void **)&v6->_queue;
    objc_storeStrong((id *)&v6->_queue, a3);
    [v6->_queue addObserver:v16 forKeyPath:@"operationCount" options:1 context:0];
    v25 = [v6 v17:v18 v19:v20];
    if (v25) {
      [*p_queue setName:v21 withName:(uint64_t)v25 withName:v23 withName:v24];
    }
    if ([v6 _isSerial:v21 v22:v23 v24:v24]) {
      [*p_queue setMaxConcurrentOperationCount:1];
    }
    if (v6->_overridesQoS) {
      [*p_queue setQualityOfService:v26 withValue:v28 withTimeout:v29];
    }
    uint64_t v30 = [v25 mutableCopyWithZone:v26];
    tag = v6->_tag;
    v6->_tag = (NSMutableString *)v30;

    id v32 = objc_alloc(MEMORY[0x263EFF9A0]);
    uint64_t v36 = [v32 initWithCapacity:v33 capacity:5];
    userDataByToken = v6->_userDataByToken;
    v6->_userDataByToken = (NSMutableDictionary *)v36;

    uint64_t v38 = objc_opt_new();
    notificationShims = v6->_notificationShims;
    v6->_notificationShims = (NSMutableSet *)v38;

    id v40 = [NSString alloc];
    v45 = [v6 v41:v42 v43:v43 v44:v44];
    uint64_t v49 = [v40 initWithFormat:v46, v47, v48, v45];
    opName = v6->_opName;
    v6->_opName = (NSString *)v49;
  }
  return v6;
}

- (XRSpace)init
{
  v3 = objc_opt_new();
  uint64_t v7 = (XRSpace *)[self initWithQueue:v4 queueIdentifier:v3 queuePriority:v5 queueOptions:v6];

  return v7;
}

- (void)dealloc
{
  [self->_queue removeObserver:a2 forKeyPath:@"operationCount" context:(uint64_t)self];
  v4.receiver = self;
  v4.super_class = (Class)XRSpace;
  [(XRSpace *)&v4 dealloc];
}

- (void)_postQueueStateChanged
{
  [MEMORY[0x263F08B88] a2:v2 v3:v3 v4:v4];
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x263F08B88] v6:v7:v8:v9];
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v19 != v10) {
    DVTIUAssertMainThread((uint64_t)"-[XRSpace _postQueueStateChanged]", (const char *)0x62, v12, v13, v14);
  }
  if (qword_2687AA048 != -1) {
    dispatch_once(&qword_2687AA048, &unk_26E752450);
  }
  [MEMORY[0x263F08A10] performSelectorOnMainThread:v11 withObject:v12 waitUntilDone:v13 withObject:v14];
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = [MEMORY[0x263F089F8] _notificationWithName:@"XRSpaceQueueCountChangedNotification" object:self count:v16];
  [v20 enqueueNotification:v18 postingStyle:v17 coalesceMask:3 forModes:qword_2687AA050];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v10 isEqual:v13 forKey:@"operationCount" withValue:v14 andValue:v15])
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    [self performSelectorOnMainThread:@selector(_postQueueStateChanged) withObject:nil waitUntilDone:NO];
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)XRSpace;
    [(XRSpace *)&v17 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)addOperation:(id)a3
{
  id v5 = (id)[self _scheduleOperationFromCurrentQueue:a2 withDelay:a3 withQualityOfService:v3 withOptions:v4];
}

- (id)_scheduleOperationFromCurrentQueue:(id)a3
{
  id v4 = a3;
  if ([self isOpValidForSpace:v5 withSpace:v4 withOptions:v6 withOptions:v7] == NO) {
    [v8 raise:@"XRInvalidOperationForSpaceException" format:@"%@ is invalid in %@", v11, v4, self];
  }
  if (self->_supportsOpNames)
  {
    id v12 = [v4 v8:v9 v10:v11];

    if (!v12) {
      [v4 setName:v8 withName:(uint64_t)self->_opName withName:v10 withName:v11];
    }
  }
  [self->_queue addOperation:v8 priority:v4 name:v10 qos:v11];

  return v4;
}

- (id)afterOperation:(id)a3 block:(id)a4
{
  id v6 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_234579900;
  v11[3] = &unk_264BF0C30;
  id v12 = v6;
  id v7 = v6;
  uint64_t v9 = [self _afterOperation:v8 priority:a3 spaceBlock:v11];

  return v9;
}

- (id)afterOperation:(id)a3 spaceBlock:(id)a4
{
  id v4 = [self _afterOperation:a2 priority:a3 spaceBlock:a4];

  return v4;
}

- (id)afterOperations:(id)a3 priority:(int64_t)a4 spaceBlock:(id)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [XRSpaceBlockOp alloc];
  uint64_t v14 = [v10 initWithSpaceBlock:v11 space:v9 block:v12 blockSize:v13];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v15 = v8;
  uint64_t v20 = [v15 countByEnumeratingWithState:v16 objects:v35 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v32 != v21) {
          objc_enumerationMutation(v15);
        }
        [v14 addDependency:v17 withBlock:^(void) {
    return (void)v31;
}];
      }
      uint64_t v20 = [v15 countByEnumeratingWithState:v17 objects:v35 count:16];
    }
    while (v20);
  }

  [v14 setQueuePriority:a4];
  uint64_t v29 = [self _scheduleOperationFromCurrentQueue:v26 withDelay:v27 withLeeway:v28];

  return v29;
}

- (id)afterOperation:(id)a3 priority:(int64_t)a4 spaceBlock:(id)a5
{
  v16[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v11 = a5;
  if (v8)
  {
    v16[0] = v8;
    uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:v16];
    [self _callOutQueue_willDestroyWithTransitionContext:v13 priority:v12 afterOperations:a4];
  }
  else
  {
    uint64_t v12 = 0;
    [self performSelector:v9 afterDelay:v11];
  uint64_t v14 = };
  if (v8) {

  }
  return v14;
}

- (id)afterOperationsRunBlock:(id)a3
{
  id v4 = a3;
  long long v34 = 0;
  objc_opt_class();
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  long long v31 = sub_234579EEC;
  long long v32 = sub_234579EFC;
  id v33 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 1;
  if (!NSClassFromString(&cfstr_Nsblock.isa)) {
    __assert_rtn("-[XRSpace afterOperationsRunBlock:]", "XRSpace.mm", 182, "MyBlockClass != nil");
  }
  long long v34 = (id *)&v36;
  id v5 = objc_alloc_init(MEMORY[0x263F086D0]);
  id v6 = (void *)v29[5];
  v29[5] = (uint64_t)v5;

  id v7 = v4;
  id v11 = v7;
  id v12 = v7;
  if (*((unsigned char *)v25 + 24))
  {
    uint64_t v13 = v7;
    while (1)
    {
      if (v13)
      {
        if (objc_opt_isKindOfClass())
        {
          [v29[5] addDependency:v14 forToken:v13 withTransitionContext:v15 withCompletion:v16];
        }
        else if (objc_opt_isKindOfClass())
        {
          [v29[5] addExecutionBlock:v17 withExecutionTime:v13 withQualityOfService:v18 withFlags:v19];
          *((unsigned char *)v25 + 24) = 0;
        }
        else
        {
          v23[0] = MEMORY[0x263EF8330];
          v23[1] = 3221225472;
          v23[2] = sub_234579F04;
          v23[3] = &unk_264BF0C58;
          v23[4] = &v24;
          v23[5] = &v28;
          DVTIUAssertRecover((uint64_t)"-[XRSpace afterOperationsRunBlock:]", 212, v23);
        }
      }
      if (!*((unsigned char *)v25 + 24)) {
        break;
      }
      uint64_t v20 = v34++;
      id v12 = *v20;

      uint64_t v13 = v12;
      if (!*((unsigned char *)v25 + 24)) {
        goto LABEL_14;
      }
    }
    id v12 = v13;
  }
LABEL_14:
  uint64_t v21 = [self _scheduleOperationFromCurrentQueue:v8 withOperation:v29[5] withOperationQueue:v9 withOperationCompletion:v10];

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);

  return v21;
}

- (id)storeUserData:(id)a3
{
  id v4 = a3;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 1;
  if ([self _callOutQueue_willDestroyWithTransitionContext:v5 completion:v6] == NO)
  {
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = sub_23457A0B0;
    v19[3] = &unk_264BF0C80;
    v19[4] = &v20;
    DVTIUAssertRecover((uint64_t)"-[XRSpace storeUserData:]", 231, v19);
  }
  if (*((unsigned char *)v21 + 24))
  {
    uint64_t v9 = self->_userDataByToken;
    objc_sync_enter(v9);
    uint64_t v10 = [XRSpaceDataToken alloc];
    tag = self->_tag;
    unint64_t seqNum = self->_seqNum;
    self->_unint64_t seqNum = seqNum + 1;
    uint64_t v15 = [v10 initWithSpaceTag:v13 sequenceID:seqNum];
    [self->_userDataByToken setObject:v16 forKey:(uint64_t)v4];
    objc_sync_exit(v9);
  }
  else
  {
    uint64_t v15 = 0;
  }
  _Block_object_dispose(&v20, 8);

  return v15;
}

- (void)replaceUserData:(id)a3 forToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 1;
  if ([self _callOutQueue_willDestroyWithTransitionContext:v8 completion:v9] == NO)
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = sub_23457A238;
    v15[3] = &unk_264BF0C80;
    v15[4] = &v16;
    DVTIUAssertRecover((uint64_t)"-[XRSpace replaceUserData:forToken:]", 253, v15);
  }
  if (*((unsigned char *)v17 + 24))
  {
    id v12 = self->_userDataByToken;
    objc_sync_enter(v12);
    if (v7) {
      [self->_userDataByToken setObject:v13 forKey:(uint64_t)v6];
    }
    objc_sync_exit(v12);
  }
  _Block_object_dispose(&v16, 8);
}

- (void)removeUserDataForToken:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 1;
  if ([self _callOutQueue_willDestroyWithTransitionContext:v5 completion:v6] == NO)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = sub_23457A3A8;
    v13[3] = &unk_264BF0C80;
    v13[4] = &v14;
    DVTIUAssertRecover((uint64_t)"-[XRSpace removeUserDataForToken:]", 272, v13);
  }
  if (*((unsigned char *)v15 + 24))
  {
    uint64_t v9 = self->_userDataByToken;
    objc_sync_enter(v9);
    if (v4) {
      [self->_userDataByToken removeObjectForKey:v10];
    }
    objc_sync_exit(v9);
  }
  _Block_object_dispose(&v14, 8);
}

- (id)userDataForToken:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  char v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 1;
  if ([self _callOutQueue_willDestroyWithTransitionContext:v5 completion:v6] == NO)
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = sub_23457A544;
    v15[3] = &unk_264BF0C80;
    v15[4] = &v16;
    DVTIUAssertRecover((uint64_t)"-[XRSpace userDataForToken:]", 289, v15);
  }
  if (*((unsigned char *)v17 + 24))
  {
    uint64_t v9 = self->_userDataByToken;
    objc_sync_enter(v9);
    if (v4)
    {
      uint64_t v13 = [self->_userDataByToken objectForKey:v10];
    }
    else
    {
      uint64_t v13 = 0;
    }
    objc_sync_exit(v9);
  }
  else
  {
    uint64_t v13 = 0;
  }
  _Block_object_dispose(&v16, 8);

  return v13;
}

- (BOOL)isOpValidForSpace:(id)a3
{
  return 1;
}

- (id)spaceName
{
  return 0;
}

- (BOOL)isSerial
{
  return 0;
}

- (BOOL)currentlyInThisSpace
{
  [MEMORY[0x263F08A48] a2:v2 v3:v3 v4:v4];
  uint64_t v6 = (NSOperationQueue *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = v6 == self->_queue;

  return (char)self;
}

- (unint64_t)operationCount
{
  return [self->_queue performSelector:a2 withObject:v2 withObject:v3 withObject:v4];
}

- (BOOL)isBusy
{
  return [self->_queue operationCount] != 0;
}

- (void)requestLocalNotification:(id)a3 object:(id)a4 observer:(id)a5 block:(id)a6
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v57 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (_DVTIURuntimeCheckForBlockCaptureOfObject((uint64_t)v12, v11))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
      sub_23459B8AC();
    }
    _DVTIUInvalidBlockCaptureBreak(v12, v11);
  }
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  char v17 = [self->_notificationShims copyWithZone:v13];
  uint64_t v23 = [v17 countByEnumeratingWithState:v18 objects:&v63 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v64;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v64 != v24) {
          objc_enumerationMutation(v17);
        }
        uint64_t v26 = *(void **)(*((void *)&v63 + 1) + 8 * i);
        if ([v26 _callOutQueue_willDestroyWithTransitionContext:v19 completion:v20] == NO)
        {
          uint64_t v28 = [v26 v19:v27 v21:v22];
          BOOL v29 = v28 == 0;

          if (v29) {
            goto LABEL_13;
          }
        }
        uint64_t v30 = [v26 v19:v27 v21:v22];
        BOOL v31 = v30 == 0;

        if (v31) {
LABEL_13:
        }
          [self _removeNotificationShim_:v19 withTransitionContext:v21 completion:v22];
      }
      uint64_t v23 = [v17 countByEnumeratingWithState:v19 objects:&v63 count:16];
    }
    while (v23);
  }

  long long v32 = objc_opt_new();
  [v32 setObserver:v33 forKey:(uint64_t)v11 withOptions:v34 withContext:v35];
  if (v10)
  {
    [v32 setTarget:v36 action:(SEL)v10 forControlEvents:v37];
    [v32 setTarget:v39];
  }
  objc_initWeak(&location, v32);
  v46 = [MEMORY[0x263F08A00] performSelector:v42 withObject:v43 withObject:v44 withObject:v45];
  queue = self->_queue;
  v59[0] = MEMORY[0x263EF8330];
  v59[1] = 3221225472;
  v59[2] = sub_23457A974;
  v59[3] = &unk_264BF0CA8;
  objc_copyWeak(&v61, &location);
  id v48 = v12;
  id v60 = v48;
  v50 = [v46 addObserverForName:v49 object:(id)v58 queue:(id)v10 usingBlock:v59];
  [v32 setToken:v51 withToken:(uint64_t)v50 withToken:v52 withToken:v53];

  [self->_notificationShims addObject:v54 withKey:(uint64_t)v32 value:v55 withKey:v56];
  objc_destroyWeak(&v61);
  objc_destroyWeak(&location);
}

- (void)stopObservationsOfObject:(id)a3 forObserver:(id)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v12 = [MEMORY[0x263EFF9C0] setFoo:v8 bar:v9 baz:v10 qux:v11];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v13 = self->_notificationShims;
  uint64_t v19 = [v13 countByEnumeratingWithState:v14 objects:&v39 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v40 != v20) {
          objc_enumerationMutation(v13);
        }
        uint64_t v22 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        [v22 _observeValueForKeyPath:v15 ofObject:v16 change:v17 context:v18];
        id v23 = (id)objc_claimAutoreleasedReturnValue();
        BOOL v24 = v23 == v7;

        if (v24)
        {
          if (!v6
            || [v22 _callOutQueue_willDestroyWithTransitionContext:v15 completion:v16]
            && [v22 v15:v16 v17:v18],
                id v25 = (id)objc_claimAutoreleasedReturnValue(),
                BOOL v26 = v25 == v6,
                v25,
                v26))
          {
            [v12 addObject:v15 withObject:v22 withObject:v17 withObject:v18];
          }
        }
      }
      uint64_t v19 = [v13 countByEnumeratingWithState:v15 objects:&v39 count:16];
    }
    while (v19);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v27 = v12;
  uint64_t v32 = [v27 countByEnumeratingWithState:v28 objects:v43 count:16];
  if (v32)
  {
    uint64_t v33 = *(void *)v36;
    do
    {
      for (uint64_t j = 0; j != v32; ++j)
      {
        if (*(void *)v36 != v33) {
          objc_enumerationMutation(v27);
        }
        [self removeNotificationShim:v29 withIdentifier:v30 withUserInfo:v31 withCompletion:v35];
      }
      uint64_t v32 = [v27 countByEnumeratingWithState:v29 objects:v43 count:16];
    }
    while (v32);
  }
}

- (void)_removeNotificationShim:(id)a3
{
  [self->_notificationShims removeObject:a2];
}

- (void)receiveMobileAgent:(id)a3
{
  id v4 = a3;
  uint64_t v9 = [v4 v5:v6:v7:v8];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = sub_23457ADD0;
  v14[3] = &unk_264BF0CD0;
  id v10 = v4;
  id v15 = v10;
  id v13 = (id)[self _afterOperation:v11 block:(uint64_t)v9, (uint64_t)v14, v12];
}

- (void)setupVisitAfterOperation:(id)a3 itinerary:(id)a4 mode:(id)a5
{
}

- (BOOL)supportsOpNames
{
  return self->_supportsOpNames;
}

- (void)setSupportsOpNames:(BOOL)a3
{
  self->_supportsOpNames = a3;
}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_opName, 0);
  objc_storeStrong((id *)&self->_notificationShims, 0);
  objc_storeStrong((id *)&self->_userDataByToken, 0);
  objc_storeStrong((id *)&self->_tag, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end