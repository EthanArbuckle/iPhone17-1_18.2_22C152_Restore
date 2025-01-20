@interface DTAllocationsRecorder
+ (BOOL)configureLocalLaunchEnvironment:(id)a3 recordedEventsMask:(unsigned int)a4;
+ (id)_libraryPath;
+ (id)serviceIdentifier;
+ (int)currentVersion;
+ (unsigned)allEventsMask;
+ (unsigned)cppClassNamesMask;
+ (unsigned)mallocReallocFreeEventsMask;
+ (unsigned)retainReleaseAutoEventsMask;
+ (unsigned)vmEventsMask;
+ (unsigned)zombieEventsMask;
- (BOOL)_startWithError:(id *)a3;
- (BOOL)readStackLogsUponAttach;
- (DTAllocationsRecorder)init;
- (id).cxx_construct;
- (id)bufferHandler;
- (id)eventHandler;
- (int)eventCount;
- (unint64_t)_setupSharedMemoryInTask:(unsigned int)a3;
- (unsigned)sharedMemorySize;
- (void)_endAndTossResources:(BOOL)a3;
- (void)_processIncomingData;
- (void)addKeyFrame:(id *)a3;
- (void)cancel;
- (void)createFullEventFromDelta:(id *)a3 withEvent:(id *)a4;
- (void)dealloc;
- (void)processBufferMessage:(id)a3;
- (void)setBufferHandler:(id)a3;
- (void)setEventHandler:(id)a3;
- (void)setReadStackLogsUponAttach:(BOOL)a3;
- (void)setSharedMemorySize:(unsigned int)a3;
- (void)startAttachingToTask:(unsigned int)a3 recordedEventsMask:(unsigned int)a4 errorHandler:(id)a5;
- (void)stop;
@end

@implementation DTAllocationsRecorder

- (DTAllocationsRecorder)init
{
  v8.receiver = self;
  v8.super_class = (Class)DTAllocationsRecorder;
  v2 = [(DTAllocationsRecorder *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("Allocations processing queue", 0);
    processingQueue = v2->_processingQueue;
    v2->_processingQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("Allocations send queue", 0);
    serialEventQueue = v2->_serialEventQueue;
    v2->_serialEventQueue = (OS_dispatch_queue *)v5;

    v2->_stopCollection = 1;
  }
  return v2;
}

- (void)dealloc
{
  [(DTAllocationsRecorder *)self cancel];
  begin_node = (DTAllocationsRecorder *)self->_threadToKeyFramesMap.__tree_.__begin_node_;
  if (begin_node != (DTAllocationsRecorder *)&self->_threadToKeyFramesMap.__tree_.__pair1_)
  {
    do
    {
      serialEventQueue = (DTAllocationsRecorder *)begin_node->_serialEventQueue;
      if (serialEventQueue != (DTAllocationsRecorder *)&begin_node->_partialEvent)
      {
        do
        {
          free(serialEventQueue->_serialEventQueue);
          shmem = serialEventQueue->_shmem;
          if (shmem)
          {
            do
            {
              opaque_1 = ($D79576B0EA7C5703A726781FA3D9E9B9 **)shmem;
              shmem = (DTXSharedMemory *)shmem->var0;
            }
            while (shmem);
          }
          else
          {
            do
            {
              opaque_1 = ($D79576B0EA7C5703A726781FA3D9E9B9 **)serialEventQueue->_trackingSymbolicator._opaque_1;
              BOOL v7 = *opaque_1 == ($D79576B0EA7C5703A726781FA3D9E9B9 *)serialEventQueue;
              serialEventQueue = (DTAllocationsRecorder *)opaque_1;
            }
            while (!v7);
          }
          serialEventQueue = (DTAllocationsRecorder *)opaque_1;
        }
        while (opaque_1 != &begin_node->_partialEvent);
      }
      objc_super v8 = begin_node->_shmem;
      if (v8)
      {
        do
        {
          v9 = (DTAllocationsRecorder *)v8;
          objc_super v8 = (DTXSharedMemory *)v8->var0;
        }
        while (v8);
      }
      else
      {
        do
        {
          v9 = (DTAllocationsRecorder *)begin_node->_trackingSymbolicator._opaque_1;
          BOOL v7 = v9->super.isa == (Class)begin_node;
          begin_node = v9;
        }
        while (!v7);
      }
      begin_node = v9;
    }
    while (v9 != (DTAllocationsRecorder *)&self->_threadToKeyFramesMap.__tree_.__pair1_);
  }
  processingQueue = self->_processingQueue;
  self->_processingQueue = 0;

  partialEvent = self->_partialEvent;
  if (partialEvent) {
    free(partialEvent);
  }
  fullEvent = self->_fullEvent;
  if (fullEvent) {
    free(fullEvent);
  }
  v13.receiver = self;
  v13.super_class = (Class)DTAllocationsRecorder;
  [(DTAllocationsRecorder *)&v13 dealloc];
}

+ (unsigned)allEventsMask
{
  int v3 = [a1 vmEventsMask];
  int v4 = [a1 retainReleaseAutoEventsMask] | v3;
  return v4 | [a1 mallocReallocFreeEventsMask];
}

+ (unsigned)vmEventsMask
{
  return 1333788672;
}

+ (unsigned)retainReleaseAutoEventsMask
{
  return 809562120;
}

+ (unsigned)mallocReallocFreeEventsMask
{
  return 854784;
}

+ (unsigned)zombieEventsMask
{
  return 0x200000;
}

+ (unsigned)cppClassNamesMask
{
  return 1049600;
}

+ (id)serviceIdentifier
{
  return @"com.apple.instruments.server.services.objectalloc";
}

+ (int)currentVersion
{
  return 5;
}

+ (id)_libraryPath
{
  int v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  dispatch_queue_t v5 = [v4 pathForResource:@"liboainject" ofType:@"dylib"];
  if (!v5)
  {
    BOOL v7 = [MEMORY[0x263F08690] currentHandler];
    objc_super v8 = [v4 bundlePath];
    [v7 handleFailureInMethod:a2, a1, @"DTAllocationsRecorder.mm", 144, @"Allocations library could not be located! Expected in bundle with path: %@", v8 object file lineNumber description];
  }
  return v5;
}

+ (BOOL)configureLocalLaunchEnvironment:(id)a3 recordedEventsMask:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v24 = a3;
  [v24 setObject:@"YES" forKey:@"OAKeepAllocationStatistics"];
  v6 = [NSNumber numberWithInt:getpid()];
  BOOL v7 = [v6 stringValue];
  [v24 setObject:v7 forKeyedSubscript:@"OAWaitForSetupByPid"];

  objc_super v8 = [NSString stringWithFormat:@"0x%x", v4];
  [v24 setObject:v8 forKeyedSubscript:@"OAAllocationStatisticsOutputMask"];

  v9 = [v24 objectForKeyedSubscript:@"NSZombieEnabled"];
  LODWORD(v7) = [v9 BOOLValue];

  if (v7) {
    LODWORD(v4) = +[DTAllocationsRecorder zombieEventsMask] | v4;
  }
  if ((+[DTAllocationsRecorder zombieEventsMask] & v4) != 0) {
    [v24 setObject:@"YES" forKeyedSubscript:@"NSZombieEnabled"];
  }
  [v24 removeObjectForKey:@"MallocStackLogging"];
  [v24 removeObjectForKey:@"MallocStackLoggingNoCompact"];
  v10 = [a1 _libraryPath];
  v22 = [v24 objectForKeyedSubscript:@"DYLD_INSERT_LIBRARIES"];
  v23 = [v22 componentsSeparatedByString:@":"];
  v11 = [MEMORY[0x263EFF980] array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v12 = v23;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v12);
        }
        v16 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v17 = [v16 lastPathComponent];
        v18 = [v10 lastPathComponent];
        char v19 = [v17 isEqualToString:v18];

        if ((v19 & 1) == 0) {
          [v11 addObject:v16];
        }
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v13);
  }

  [v11 addObject:v10];
  v20 = [v11 componentsJoinedByString:@":"];
  [v24 setObject:v20 forKeyedSubscript:@"DYLD_INSERT_LIBRARIES"];

  return 1;
}

- (unint64_t)_setupSharedMemoryInTask:(unsigned int)a3
{
  kern_return_t v14;
  mach_vm_address_t v15;
  mach_vm_size_t v16;
  kern_return_t v17;
  DTXSharedMemory *shmem;
  void v21[2];
  uint64_t (*v22)(uint64_t, DTXSharedMemory *);
  void *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  vm_prot_t cur_protection[2];
  mach_vm_address_t target_address;
  uint8_t buf[4];
  DTXSharedMemory *v32;
  __int16 v33;
  vm_map_t v34;
  __int16 v35;
  vm_prot_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x263EF8340];
  if (self->_shmem) {
    return 0;
  }
  self->_targetTask = a3;
  unsigned int v6 = [(DTAllocationsRecorder *)self sharedMemorySize];
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0x2000000;
  }
  objc_super v8 = (DTXSharedMemory *)mmap(0, (v7 + 16463) & 0x1FFFFC000, 3, 4098, 167772160, 0);
  if (v8 == (DTXSharedMemory *)-1)
  {
LABEL_31:
    mach_vm_address_t v3 = 0;
    self->_shmem = 0;
    return v3;
  }
  v9 = v8;
  v8->var0 = (v7 + 16463) & 0x1FFFFC000;
  v8->var1 = (unint64_t)v8;
  v8->var2 = 0;
  *(void *)&v8->var3 = 0;
  v8->var5 = 0;
  v8->var6 = v7;
  atomic_store(0, (unsigned int *)&v8->var10);
  atomic_store(0, (unsigned int *)&v8->var11);
  atomic_store(0, (unsigned int *)&v8->var12);
  atomic_store(0, (unsigned int *)&v8->var13);
  atomic_store(0, &v8->var9);
  atomic_store(getpid(), (unsigned int *)&v8->var7);
  atomic_store(0, (unsigned int *)&v9->var8);
  self->_shmem = v9;
  v10 = (vm_map_t *)MEMORY[0x263EF8960];
  if (a3 - 1 > 0xFFFFFFFD || (vm_map_t v11 = *MEMORY[0x263EF8960], (*MEMORY[0x263EF8960] - 1) >= 0xFFFFFFFE))
  {
LABEL_26:
    shmem = self->_shmem;
    if (shmem)
    {
      atomic_store(1u, &shmem->var9);
      if (shmem->var2)
      {
        if (!atomic_load((unsigned int *)&shmem->var8)) {
          shm_unlink((const char *)shmem + shmem->var2);
        }
      }
      mach_vm_deallocate(*v10, (mach_vm_address_t)shmem, shmem->var0);
    }
    goto LABEL_31;
  }
  long long v25 = 0;
  long long v26 = &v25;
  long long v27 = 0x2020000000;
  long long v28 = 0;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v22 = (uint64_t (*)(uint64_t, DTXSharedMemory *))sub_2309059DC;
  v23 = &unk_264B90440;
  id v24 = &v25;
  id v12 = v21;
  if (mach_task_is_self(v11))
  {
    v22((uint64_t)v12, v9);
  }
  else
  {
    vm_map_t v13 = *v10;
    *(void *)cur_protection = 0;
    target_address = 0;
    uint64_t v14 = mach_vm_remap(v13, &target_address, 0x50uLL, 0, 1048577, v11, (mach_vm_address_t)v9, 0, &cur_protection[1], cur_protection, 2u);
    if (v14)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218496;
        v32 = v9;
        v33 = 1024;
        v34 = v11;
        v35 = 1024;
        v36 = v14;
        _os_log_impl(&dword_23087D000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Unable to map memory for address: %#llx in task: %d (%d)\n", buf, 0x18u);
      }
      v15 = 0;
    }
    else
    {
      if ((~cur_protection[1] & 3) != 0)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218496;
          v32 = v9;
          v33 = 1024;
          v34 = v11;
          v35 = 1024;
          v36 = cur_protection[1];
          _os_log_impl(&dword_23087D000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Unable to map memory r/w for address: %#llx in task: %d (%d)\n", buf, 0x18u);
        }
        mach_vm_deallocate(v13, target_address, 0x50uLL);
      }
      v15 = target_address;
    }
    v22((uint64_t)v12, (DTXSharedMemory *)v15);
    mach_vm_deallocate(*v10, v15, 0x50uLL);
  }

  v16 = v26[3];
  if (!v16)
  {
LABEL_25:
    _Block_object_dispose(&v25, 8);
    goto LABEL_26;
  }
  *(void *)cur_protection = 0;
  target_address = 0;
  v17 = mach_vm_remap(a3, &target_address, v16, 0, 1048577, v11, (mach_vm_address_t)v9, 0, &cur_protection[1], cur_protection, 2u);
  if (v17)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218496;
      v32 = v9;
      v33 = 1024;
      v34 = v11;
      v35 = 1024;
      v36 = v17;
      _os_log_impl(&dword_23087D000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Unable to map memory for address: %#llx in task: %d (%d)\n", buf, 0x18u);
    }
    goto LABEL_25;
  }
  if ((~cur_protection[1] & 3) != 0)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218496;
      v32 = v9;
      v33 = 1024;
      v34 = v11;
      v35 = 1024;
      v36 = cur_protection[1];
      _os_log_impl(&dword_23087D000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Unable to map memory r/w for address: %#llx in task: %d (%d)\n", buf, 0x18u);
    }
    mach_vm_deallocate(a3, target_address, v16);
  }
  mach_vm_address_t v3 = target_address;
  _Block_object_dispose(&v25, 8);
  if (!v3) {
    goto LABEL_26;
  }
  return v3;
}

- (void)startAttachingToTask:(unsigned int)a3 recordedEventsMask:(unsigned int)a4 errorHandler:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  v9 = (void (**)(void, void))v8;
  if ((v6 - 1) < 0xFFFFFFFE)
  {
    int x = -1;
    if (pid_for_task(v6, &x))
    {
      if (v9)
      {
        v10 = sub_230903FE8(@"Unable to determine pid for task");
        ((void (**)(void, void *))v9)[2](v9, v10);
LABEL_21:

        goto LABEL_22;
      }
      goto LABEL_22;
    }
    unint64_t v11 = [(DTAllocationsRecorder *)self _setupSharedMemoryInTask:v6];
    if (!v11)
    {
      if (v9)
      {
        v10 = sub_230903FE8(@"Couldn't map shared memory into target process");
        ((void (**)(void, void *))v9)[2](v9, v10);
        goto LABEL_21;
      }
      goto LABEL_22;
    }
    v10 = objc_opt_new();
    id v12 = [NSString stringWithFormat:@"%#llx", v11];
    [v10 addObject:v12];

    vm_map_t v13 = [NSNumber numberWithUnsignedInt:v5];
    uint64_t v14 = [v13 stringValue];
    [v10 addObject:v14];

    v15 = [[RemoteBundleLoader alloc] initWithTask:v6];
    if (v15)
    {
      v16 = +[DTAllocationsRecorder _libraryPath];
      v37[0] = MEMORY[0x263EF8330];
      v37[1] = 3221225472;
      v37[2] = sub_2309040E0;
      v37[3] = &unk_264B902D8;
      id v17 = v9;
      id v38 = v17;
      [(RemoteBundleLoader *)v15 scheduleLibraryLoad:v16 calling:@"_OAAttachAndInitialize" arguments:v10 callback:v37];

      id v36 = 0;
      BOOL v18 = [(DTAllocationsRecorder *)self _startWithError:&v36];
      id v19 = v36;
      if (v18)
      {
        v35[0] = 0;
        v35[1] = v35;
        v35[2] = 0x2020000000;
        v35[3] = 0;
        v28[0] = MEMORY[0x263EF8330];
        v28[1] = 3221225472;
        v29 = sub_230904154;
        uint64_t v30 = &unk_264B90328;
        int v34 = v6;
        v32 = v35;
        unint64_t v33 = v11;
        id v31 = v17;
        v20 = v28;
        uint64_t v49 = 0;
        v50 = &v49;
        uint64_t v51 = 0x3032000000;
        v52 = sub_2309059F4;
        v53 = sub_230905A20;
        id v54 = 0;
        aBlock[0] = MEMORY[0x263EF8330];
        aBlock[1] = 3221225472;
        aBlock[2] = sub_230905A28;
        aBlock[3] = &unk_264B90468;
        v21 = v20;
        id v47 = v21;
        v48 = &v49;
        v22 = _Block_copy(aBlock);
        v23 = (void *)v50[5];
        v50[5] = (uint64_t)v22;

        uint64_t v40 = MEMORY[0x263EF8330];
        uint64_t v41 = 3221225472;
        v42 = sub_230905A78;
        v43 = &unk_264B90490;
        v44 = &v49;
        v45 = "liboainject.dylib";
        unint64_t v24 = CSSymbolicatorCreateWithTaskFlagsAndNotification();
        unint64_t v26 = v25;
        if (CSIsNull()) {
          ((void (*)(void *, void, void))v29)(v21, 0, 0);
        }
        _Block_object_dispose(&v49, 8);

        self->_trackingSymbolicator._opaque_1 = v24;
        self->_trackingSymbolicator._opaque_2 = v26;

        _Block_object_dispose(v35, 8);
      }
      else
      {
        (*((void (**)(id, id))v17 + 2))(v17, v19);
      }

      long long v27 = v38;
    }
    else
    {
      if (!v9)
      {
LABEL_20:

        goto LABEL_21;
      }
      long long v27 = sub_230903FE8(@"Unable to instantiate loader for target.");
      ((void (**)(void, void *))v9)[2](v9, v27);
    }

    goto LABEL_20;
  }
  if (v8)
  {
    v10 = sub_230903FE8(@"Instruments could not acquire the necessary privileges to profile the target application.");
    ((void (**)(void, void *))v9)[2](v9, v10);
    goto LABEL_21;
  }
LABEL_22:
}

- (BOOL)_startWithError:(id *)a3
{
  int stopCollection = self->_stopCollection;
  if (stopCollection)
  {
    self->_int stopCollection = 0;
    uint64_t v6 = [(DTAllocationsRecorder *)self bufferHandler];

    if (!v6)
    {
      uint64_t v7 = [(DTAllocationsRecorder *)self eventHandler];
      self->_partialEvent = ($D79576B0EA7C5703A726781FA3D9E9B9 *)malloc_type_malloc(0x1030uLL, 0xD13C6C2FuLL);
      self->_fullEvent = ($D79576B0EA7C5703A726781FA3D9E9B9 *)malloc_type_malloc(0x1030uLL, 0x21D2C2D1uLL);
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 3221225472;
      aBlock[2] = sub_230904668;
      aBlock[3] = &unk_264B90350;
      id v8 = v7;
      void aBlock[4] = self;
      id v15 = v8;
      SEL v16 = a2;
      v9 = _Block_copy(aBlock);
      [(DTAllocationsRecorder *)self setBufferHandler:v9];
    }
    processingQueue = self->_processingQueue;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = sub_2309049B8;
    v13[3] = &unk_264B8F5B0;
    v13[4] = self;
    dispatch_async(processingQueue, v13);
  }
  else if (a3)
  {
    sub_230903FE8(@"Allocations recording already in process.");
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return stopCollection != 0;
}

- (void)addKeyFrame:(id *)a3
{
  unint64_t var1_low = LOBYTE(a3->var1);
  p_pair1 = &self->_threadToKeyFramesMap.__tree_.__pair1_;
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, std::map<unsigned int, OAKeyFrame *>>, void *>>> *)self->_threadToKeyFramesMap.__tree_.__pair1_.__value_.__left_;
  if (!left) {
    goto LABEL_12;
  }
  unint64_t var5 = a3->var5;
  id v8 = &self->_threadToKeyFramesMap.__tree_.__pair1_;
  do
  {
    unint64_t v9 = (unint64_t)left[4].__value_.__left_;
    BOOL v10 = v9 >= var5;
    if (v9 >= var5) {
      unint64_t v11 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, std::map<unsigned int, OAKeyFrame *>>, void *>>> **)left;
    }
    else {
      unint64_t v11 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, std::map<unsigned int, OAKeyFrame *>>, void *>>> **)&left[1];
    }
    if (v10) {
      id v8 = left;
    }
    left = *v11;
  }
  while (*v11);
  if (v8 != p_pair1 && (void *)var5 >= v8[4].__value_.__left_)
  {
    SEL v16 = (char *)v8[6].__value_.__left_;
    uint64_t v14 = v8 + 6;
    id v15 = v16;
    if (!v16) {
      goto LABEL_25;
    }
    id v17 = v14;
    do
    {
      unsigned int v18 = *((_DWORD *)v15 + 8);
      BOOL v19 = v18 >= var1_low;
      if (v18 >= var1_low) {
        v20 = (void **)v15;
      }
      else {
        v20 = (void **)(v15 + 8);
      }
      if (v19) {
        id v17 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, std::map<unsigned int, OAKeyFrame *>>, void *>>> *)v15;
      }
      id v15 = (char *)*v20;
    }
    while (*v20);
    if (v17 != v14 && var1_low >= LODWORD(v17[4].__value_.__left_))
    {
      id v12 = v17[5].__value_.__left_;
    }
    else
    {
LABEL_25:
      v21 = (uint64_t **)&v14[-1];
      id v12 = malloc_type_calloc(1uLL, 0x1010uLL, 0x10000408E8BD56EuLL);
      unint64_t v22 = var1_low;
      v23[0] = (uint64_t)v12;
      sub_230905ED4(v21, (unsigned int *)&v22, (uint64_t)&v22);
    }
  }
  else
  {
LABEL_12:
    v25[0] = 0;
    v25[1] = 0;
    unint64_t v24 = (uint64_t *)v25;
    id v12 = malloc_type_calloc(1uLL, 0x1010uLL, 0x10000408E8BD56EuLL);
    unint64_t v22 = var1_low;
    v23[0] = (uint64_t)v12;
    sub_230905ED4(&v24, (unsigned int *)&v22, (uint64_t)&v22);
    unint64_t v22 = a3->var5;
    sub_230905B58(v23, (uint64_t)&v24);
    sub_230905F98((uint64_t)&p_pair1[-1], &v22, &v22);
    sub_230905E6C((uint64_t)v23, (void *)v23[1]);
    sub_230905E6C((uint64_t)&v24, v25[0]);
  }
  unsigned int var2 = a3->var2;
  a3->var1 &= 0xFF0000FF;
  v12[2] = 512 - var2;
  memcpy(&v12[2 * (512 - var2) + 4], a3->var7, 8 * a3->var2);
}

- (void)createFullEventFromDelta:(id *)a3 withEvent:(id *)a4
{
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, std::map<unsigned int, OAKeyFrame *>>, void *>>> *)self->_threadToKeyFramesMap.__tree_.__pair1_.__value_.__left_;
  p_pair1 = &self->_threadToKeyFramesMap.__tree_.__pair1_;
  uint64_t v5 = left;
  if (left)
  {
    unsigned int var1_low = LOBYTE(a3->var1);
    unint64_t var5 = a3->var5;
    unint64_t v11 = p_pair1;
    do
    {
      unint64_t v12 = (unint64_t)v5[4].__value_.__left_;
      BOOL v13 = v12 >= var5;
      if (v12 >= var5) {
        uint64_t v14 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, std::map<unsigned int, OAKeyFrame *>>, void *>>> **)v5;
      }
      else {
        uint64_t v14 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, std::map<unsigned int, OAKeyFrame *>>, void *>>> **)&v5[1];
      }
      if (v13) {
        unint64_t v11 = v5;
      }
      uint64_t v5 = *v14;
    }
    while (*v14);
    if (v11 != p_pair1 && (void *)var5 >= v11[4].__value_.__left_)
    {
      id v17 = (char *)v11[6].__value_.__left_;
      id v15 = v11 + 6;
      SEL v16 = v17;
      if (v17)
      {
        unsigned int v18 = v15;
        do
        {
          unsigned int v19 = *((_DWORD *)v16 + 8);
          BOOL v20 = v19 >= var1_low;
          if (v19 >= var1_low) {
            v21 = (char **)v16;
          }
          else {
            v21 = (char **)(v16 + 8);
          }
          if (v20) {
            unsigned int v18 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, std::map<unsigned int, OAKeyFrame *>>, void *>>> *)v16;
          }
          SEL v16 = *v21;
        }
        while (*v21);
        if (v18 != v15 && var1_low >= LODWORD(v18[4].__value_.__left_))
        {
          unint64_t v22 = v18[5].__value_.__left_;
          v22[2] = LOWORD(a3->var2);
          memcpy(&v22[2 * (unsigned __int16)a3->var2 + 4], a3->var7, ((unint64_t)a3->var2 >> 13) & 0x7FFF8);
          uint64_t v23 = 512 - (int)v22[2];
          long long v24 = *(_OWORD *)&a3->var0;
          long long v25 = *(_OWORD *)&a3->var5;
          *(_OWORD *)&a4->var3 = *(_OWORD *)&a3->var3;
          *(_OWORD *)&a4->unint64_t var5 = v25;
          *(_OWORD *)&a4->var0 = v24;
          memcpy(a4->var7, &v22[2 * v22[2] + 4], 8 * v23);
          a4->var1 &= 0xFF0000FF;
          a4->unsigned int var2 = v23 & 0x1FFFFFFF;
        }
      }
    }
  }
}

- (void)processBufferMessage:(id)a3
{
  id v4 = a3;
  processingQueue = self->_processingQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_230904D5C;
  v7[3] = &unk_264B90378;
  id v8 = v4;
  unint64_t v9 = self;
  id v6 = v4;
  dispatch_async(processingQueue, v7);
}

- (void)stop
{
}

- (void)cancel
{
}

- (void)_endAndTossResources:(BOOL)a3
{
  if (a3) {
    int v3 = 1;
  }
  else {
    int v3 = 2;
  }
  self->_int stopCollection = v3;
  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_230904E88;
  block[3] = &unk_264B8F5B0;
  block[4] = self;
  dispatch_sync(processingQueue, block);
}

- (int)eventCount
{
  return self->_eventTotal;
}

- (void)_processIncomingData
{
  v2 = self;
  uint64_t v62 = *MEMORY[0x263EF8340];
  v35 = (void *)MEMORY[0x230FC2180](self, a2);
  id v40 = [(DTAllocationsRecorder *)v2 bufferHandler];
  if ([(DTAllocationsRecorder *)v2 readStackLogsUponAttach])
  {
    task_read_t targetTask = v2->_targetTask;
    if (targetTask + 1 >= 2)
    {
      MEMORY[0x270FA5388]();
      bzero(v34, 0x1030uLL);
      suspend_token[0] = 0;
      task_suspend2(targetTask, suspend_token);
      uint64_t v4 = v2->_targetTask;
      v51[0] = MEMORY[0x263EF8330];
      v51[1] = 3221225472;
      v51[2] = sub_2309055CC;
      v51[3] = &unk_264B903A0;
      v53 = v34;
      id v52 = v40;
      uint64_t v5 = v51;
      id v6 = (void *)[objc_alloc(MEMORY[0x263F7C058]) initWithTask:v4];
      uint64_t v56 = MEMORY[0x263EF8330];
      uint64_t v57 = 3221225472;
      uint64_t v58 = (uint64_t)sub_230905EC0;
      v59 = &unk_264B904B8;
      uint64_t v7 = v5;
      id v60 = v6;
      id v61 = v7;
      id v8 = v6;
      [v8 enumerateMSLRecordsAndPayloads:&v56];

      task_resume2(suspend_token[0]);
    }
  }
  uint64_t v56 = 0;
  uint64_t v57 = (uint64_t)&v56;
  uint64_t v58 = 0x2020000000;
  LOBYTE(v59) = 0;
  dispatch_semaphore_t v39 = dispatch_semaphore_create(1);
  if (!v2->_stopCollection)
  {
    uint64_t v41 = v47;
    v34[518] = v43;
    v37 = v2;
    do
    {
      shmem = v2->_shmem;
      if (!shmem) {
        break;
      }
      v46[0] = MEMORY[0x263EF8330];
      v46[1] = 3221225472;
      v47[0] = sub_2309056F4;
      v47[1] = &unk_264B903F0;
      v47[2] = v2;
      id v36 = v39;
      v48 = v36;
      id v38 = v40;
      id v49 = v38;
      v50 = &v56;
      BOOL v10 = v46;
      int v11 = 0;
      unsigned int var6 = shmem->var6;
      uint64_t v13 = (uint64_t)&shmem->var17[shmem->var5];
      unsigned int v14 = 64;
      unint64_t v15 = 128000000;
      while (1)
      {
        while (1)
        {
          signed int v16 = atomic_load((unsigned int *)&shmem->var12);
          signed int v17 = atomic_load((unsigned int *)&shmem->var13);
          unsigned int v18 = v16 >= v17 ? 0 : var6;
          unsigned int v19 = v18 + v16;
          unsigned int v20 = atomic_load_explicit((atomic_uint *volatile)&shmem->var9, memory_order_acquire) | v11;
          unsigned int v21 = v19 - v17;
          if (v19 == v17) {
            break;
          }
          signed int v25 = v17;
          if ((v14 & 0xFFFE0000) != 0 || v21 > var6 >> 2) {
            unsigned int v14 = 64;
          }
          if (var6 - v17 >= v21) {
            uint64_t v27 = v21;
          }
          else {
            uint64_t v27 = var6 - v17;
          }
          unsigned __int8 v55 = 0;
          ((void (*)(void *, uint64_t, uint64_t, unsigned __int8 *))v47[0])(v10, v13 + v17, v27, &v55);
          uint64_t v28 = v21 - v27;
          if (v28) {
            ((void (*)(void *, uint64_t, uint64_t, unsigned __int8 *))v47[0])(v10, v13, v28, &v55);
          }
          else {
            LODWORD(v28) = v27 + v25;
          }
          signed int v32 = v25;
          atomic_compare_exchange_strong(&shmem->var13, (unsigned int *)&v32, v28);
          if (v32 != v25 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
          {
            LOWORD(suspend_token[0]) = 0;
            _os_log_impl(&dword_23087D000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Inconsistent reader offset in shared memory! MT reception suspected...\n", (uint8_t *)suspend_token, 2u);
          }
          int v11 = v55;
          if (v55)
          {
            atomic_store(1u, &shmem->var9);
LABEL_48:
            v2 = v37;
LABEL_49:

            goto LABEL_50;
          }
          unint64_t v15 = 128000000;
          if (v20) {
            goto LABEL_48;
          }
        }
        if (v20) {
          goto LABEL_48;
        }
        if (!v15) {
          break;
        }
        pid_t v22 = atomic_load((unsigned int *)&shmem->var8);
        if (v14 <= 0x40) {
          useconds_t v23 = 64;
        }
        else {
          useconds_t v23 = v14;
        }
        usleep(v23);
        int v24 = 2 * v23;
        if (2 * v23 <= 0x20000)
        {
          int v11 = 0;
        }
        else
        {
          int v11 = v22 && kill(v22, 0) == -1 && *__error() == 3;
          int v24 = 0x20000;
        }
        unint64_t v29 = 1000 * v14;
        BOOL v30 = v15 >= v29;
        unint64_t v31 = v15 - v29;
        if (v30) {
          unint64_t v15 = v31;
        }
        else {
          unint64_t v15 = 0;
        }
        unsigned int v14 = v24;
      }

      v2 = v37;
      if (*(unsigned char *)(v57 + 24))
      {
        serialEventQueue = v37->_serialEventQueue;
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        v43[0] = sub_2309058DC;
        v43[1] = &unk_264B90418;
        v44 = v38;
        v45 = &v56;
        dispatch_sync(serialEventQueue, block);
        BOOL v10 = v44;
        goto LABEL_49;
      }
LABEL_50:
    }
    while (!v2->_stopCollection);
  }

  _Block_object_dispose(&v56, 8);
}

- (id)eventHandler
{
  return self->_eventHandler;
}

- (void)setEventHandler:(id)a3
{
}

- (id)bufferHandler
{
  return self->_bufferHandler;
}

- (void)setBufferHandler:(id)a3
{
}

- (BOOL)readStackLogsUponAttach
{
  return self->_readStackLogsUponAttach;
}

- (void)setReadStackLogsUponAttach:(BOOL)a3
{
  self->_readStackLogsUponAttach = a3;
}

- (unsigned)sharedMemorySize
{
  return self->_sharedMemorySize;
}

- (void)setSharedMemorySize:(unsigned int)a3
{
  self->_sharedMemorySize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_bufferHandler, 0);
  objc_storeStrong(&self->_eventHandler, 0);
  sub_2309060C8((uint64_t)&self->_threadToKeyFramesMap, (void *)self->_threadToKeyFramesMap.__tree_.__pair1_.__value_.__left_);
  objc_storeStrong((id *)&self->_serialEventQueue, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
}

- (id).cxx_construct
{
  *((void *)self + 15) = 0;
  *((void *)self + 14) = 0;
  *((void *)self + 13) = (char *)self + 112;
  return self;
}

@end