@interface FSBlockDeviceResource
+ (BOOL)supportsSecureCoding;
+ (id)newProxyForBSDName:(id)a3 isWritable:(BOOL)a4;
+ (id)proxyResourceForBSDName:(id)a3;
+ (id)proxyResourceForBSDName:(id)a3 isWritable:(BOOL)a4;
+ (id)resourceWithBSDName:(id)a3 devicePath:(id)a4 fileDescriptor:(int)a5 writable:(BOOL)a6;
+ (void)openWithBSDName:(id)a3 writable:(BOOL)a4 auditToken:(id)a5 replyHandler:(id)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTerminated;
- (BOOL)isWritable;
- (BOOL)terminated;
- (FSBlockDeviceResource)initWithBSDName:(id)a3 devicePath:(id)a4 fileDescriptor:(int)a5 writable:(BOOL)a6;
- (FSBlockDeviceResource)initWithCoder:(id)a3;
- (FSBlockDeviceResource)initWithResource:(id)a3;
- (FSWorkQueue)fsExecQueue;
- (IONotificationPort)notifyPort;
- (NSString)BSDName;
- (NSString)bsdName;
- (NSString)devicePath;
- (NSString)usingResourcePurpose;
- (OS_dispatch_queue)ioKitQueue;
- (id)asynchronousMetadataFlush;
- (id)delayedMetadataWriteFrom:(void *)a3 startingAt:(int64_t)a4 length:(unint64_t)a5;
- (id)getResourceID;
- (id)initProxyForBSDName:(id)a3;
- (id)initProxyForBSDName:(id)a3 isWritable:(BOOL)a4;
- (id)makeProxy;
- (id)metadataClear:(id)a3 wait:(BOOL)a4;
- (id)metadataFlush;
- (id)metadataPurge:(id)a3;
- (id)metadataReadInto:(void *)a3 startingAt:(int64_t)a4 length:(unint64_t)a5;
- (id)metadataReadInto:(void *)a3 startingAt:(int64_t)a4 length:(unint64_t)a5 readAheadExtents:(id *)a6 readAheadCount:(int64_t)a7;
- (id)metadataWriteFrom:(void *)a3 startingAt:(int64_t)a4 length:(unint64_t)a5;
- (id)startUsingResource:(id)a3;
- (id)stopUsingResource:(id)a3;
- (int)fileDescriptor;
- (int64_t)kind;
- (unint64_t)blockCount;
- (unint64_t)blockSize;
- (unint64_t)partitionBase;
- (unint64_t)physicalBlockSize;
- (unint64_t)readInto:(void *)a3 startingAt:(int64_t)a4 length:(unint64_t)a5 error:(id *)a6;
- (unint64_t)writeFrom:(void *)a3 startingAt:(int64_t)a4 length:(unint64_t)a5 error:(id *)a6;
- (unsigned)notification;
- (void)asynchronousMetadataFlush;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)metadataFlush;
- (void)metadataWriteFrom:(void *)a3 startingAt:(int64_t)a4 length:(unint64_t)a5 completionHandler:(id)a6;
- (void)readFirstSectorAndLog;
- (void)readInto:(void *)a3 startingAt:(int64_t)a4 length:(unint64_t)a5 completionHandler:(id)a6;
- (void)releaseNotification;
- (void)revoke;
- (void)setFsExecQueue:(id)a3;
- (void)setIoKitQueue:(id)a3;
- (void)setNotification:(unsigned int)a3;
- (void)setNotifyPort:(IONotificationPort *)a3;
- (void)setUsingResourcePurpose:(id)a3;
- (void)synchronousReadInto:(void *)a3 startingAt:(int64_t)a4 length:(unint64_t)a5 replyHandler:(id)a6;
- (void)terminate;
- (void)writeFrom:(void *)a3 startingAt:(int64_t)a4 length:(unint64_t)a5 completionHandler:(id)a6;
@end

@implementation FSBlockDeviceResource

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FSBlockDeviceResource;
  [(FSResource *)&v10 encodeWithCoder:v4];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"This object may only be encoded by an NSXPCCoder." userInfo:0];
    objc_exception_throw(v9);
  }
  int fileDescriptor = self->_fileDescriptor;
  if ((fileDescriptor & 0x80000000) == 0)
  {
    xpc_object_t v6 = xpc_fd_create(fileDescriptor);
    if (v6)
    {
      [v4 encodeXPCObject:v6 forKey:@"FSResource.fd"];
    }
    else
    {
      int v7 = *__error();
      v8 = fskit_std_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        [(FSBlockDeviceResource *)&self->_fileDescriptor encodeWithCoder:v8];
      }
    }
  }
  [v4 encodeObject:self->_BSDName forKey:@"FSResource.bsdName"];
  [v4 encodeObject:self->_devicePath forKey:@"FSResource.path"];
  [v4 encodeBool:self->_writable forKey:@"FSResource.writable"];
  [v4 encodeBool:self->_supportsBarrier forKey:@"FSResource.supportsBarrier"];
  [v4 encodeBool:self->_supportsPriority forKey:@"FSResource.supportsPriority"];
  [v4 encodeBool:self->_supportsUnmap forKey:@"FSResource.supportsUnmap"];
  [v4 encodeInteger:self->_blockSize forKey:@"FSResource.blockSize"];
  [v4 encodeInteger:self->_blockCount forKey:@"FSResource.blockCount"];
  [v4 encodeInteger:self->_physicalBlockSize forKey:@"FSResource.physicalBlockSize"];
  [v4 encodeInteger:self->_queueDepth forKey:@"FSResource.queueDepth"];
  [v4 encodeInteger:self->_partitionBase forKey:@"FSResource.partitionBase"];
}

- (FSBlockDeviceResource)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v18 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"This object may only be decoded by an NSXPCCoder." userInfo:0];
    objc_exception_throw(v18);
  }
  v19.receiver = self;
  v19.super_class = (Class)FSBlockDeviceResource;
  v5 = [(FSResource *)&v19 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FSResource.bsdName"];
    BSDName = v5->_BSDName;
    v5->_BSDName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FSResource.path"];
    devicePath = v5->_devicePath;
    v5->_devicePath = (NSString *)v8;

    v5->_writable = [v4 decodeBoolForKey:@"FSResource.writable"];
    v5->_supportsBarrier = [v4 decodeBoolForKey:@"FSResource.supportsBarrier"];
    v5->_supportsPriority = [v4 decodeBoolForKey:@"FSResource.supportsPriority"];
    v5->_supportsUnmap = [v4 decodeBoolForKey:@"FSResource.supportsUnmap"];
    v5->_blockSize = [v4 decodeIntegerForKey:@"FSResource.blockSize"];
    v5->_blockCount = [v4 decodeIntegerForKey:@"FSResource.blockCount"];
    v5->_physicalBlockSize = [v4 decodeIntegerForKey:@"FSResource.physicalBlockSize"];
    v5->_queueDepth = [v4 decodeIntegerForKey:@"FSResource.queueDepth"];
    v5->_partitionBase = [v4 decodeIntegerForKey:@"FSResource.partitionBase"];
    objc_super v10 = [v4 decodeXPCObjectOfType:MEMORY[0x263EF8728] forKey:@"FSResource.fd"];
    v11 = v10;
    if (v10) {
      int v12 = xpc_fd_dup(v10);
    }
    else {
      int v12 = -1;
    }
    v5->_int fileDescriptor = v12;
    v5->_terminated = 0;
    v13 = [FSWorkQueue alloc];
    v14 = [NSString stringWithFormat:@"fsblockdevice.%@", v5->_BSDName];
    uint64_t v15 = [(FSWorkQueue *)v13 initQueueWithDomain:v14 concurrency:16];
    fsExecQueue = v5->_fsExecQueue;
    v5->_fsExecQueue = (FSWorkQueue *)v15;
  }
  return v5;
}

- (int64_t)kind
{
  return 1;
}

- (id)makeProxy
{
  v3 = [(FSBlockDeviceResource *)self BSDName];
  id v4 = +[FSBlockDeviceResource newProxyForBSDName:v3 isWritable:[(FSBlockDeviceResource *)self isWritable]];

  return v4;
}

+ (id)proxyResourceForBSDName:(id)a3 isWritable:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  int v7 = v6;
  if ([v6 hasPrefix:@"/dev/"])
  {
    int v7 = [v6 substringFromIndex:objc_msgSend(@"/dev/", "length")];
  }
  uint64_t v8 = [NSString stringWithFormat:@"/dev/r%@", v7];
  id v9 = [a1 resourceWithBSDName:v7 devicePath:v8 fileDescriptor:0xFFFFFFFFLL writable:v4];

  return v9;
}

+ (id)newProxyForBSDName:(id)a3 isWritable:(BOOL)a4
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)terminated
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL terminated = v2->_terminated;
  objc_sync_exit(v2);

  return terminated;
}

- (void)terminate
{
  obj = self;
  objc_sync_enter(obj);
  [(FSBlockDeviceResource *)obj releaseNotification];
  v2 = obj;
  if (!obj->_terminated)
  {
    int fileDescriptor = obj->_fileDescriptor;
    if ((fileDescriptor & 0x80000000) == 0)
    {
      close(fileDescriptor);
      obj->_int fileDescriptor = -1;
    }
    v2 = obj;
    obj->_BOOL terminated = 1;
  }
  notifyPort = v2->_notifyPort;
  if (notifyPort)
  {
    IONotificationPortDestroy(notifyPort);
    obj->_notifyPort = 0;
  }
  objc_sync_exit(obj);
}

- (void)dealloc
{
  [(FSBlockDeviceResource *)self terminate];
  v3.receiver = self;
  v3.super_class = (Class)FSBlockDeviceResource;
  [(FSBlockDeviceResource *)&v3 dealloc];
}

- (void)revoke
{
  v1 = [a1 getResourceID];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5(&dword_24DDB2000, v2, v3, "%s:start:(%@)", v4, v5, v6, v7, 2u);
}

void __31__FSBlockDeviceResource_revoke__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = fskit_std_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __31__FSBlockDeviceResource_revoke__block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __31__FSBlockDeviceResource_revoke__block_invoke_71(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = fskit_std_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __31__FSBlockDeviceResource_revoke__block_invoke_71_cold_1(v3);
  }

  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 code];
}

- (void)readInto:(void *)a3 startingAt:(int64_t)a4 length:(unint64_t)a5 completionHandler:(id)a6
{
  objc_super v10 = (void (**)(id, void, void *))a6;
  v11 = self;
  objc_sync_enter(v11);
  if (v11->_terminated)
  {
    int v12 = fs_errorForPOSIXError(5);
    v10[2](v10, 0, v12);

    objc_sync_exit(v11);
  }
  else
  {
    objc_sync_exit(v11);

    if (a3)
    {
      objc_initWeak(&location, v11);
      fsExecQueue = v11->_fsExecQueue;
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __70__FSBlockDeviceResource_readInto_startingAt_length_completionHandler___block_invoke;
      v14[3] = &unk_26530B798;
      objc_copyWeak(v16, &location);
      v16[1] = a3;
      v16[2] = (id)a5;
      v16[3] = (id)a4;
      uint64_t v15 = v10;
      [(FSWorkQueue *)fsExecQueue enqueue:v14];

      objc_destroyWeak(v16);
      objc_destroyWeak(&location);
      goto LABEL_6;
    }
    fs_errorForPOSIXError(14);
    v11 = (FSBlockDeviceResource *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v11);
  }

LABEL_6:
}

void __70__FSBlockDeviceResource_readInto_startingAt_length_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v11 = WeakRetained;
    unint64_t v3 = pread([WeakRetained fileDescriptor], *(void **)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64));
    if ((v3 & 0x8000000000000000) != 0)
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = __error();
      objc_super v10 = fs_errorForPOSIXError(*v9);
      (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v10);
    }
    else
    {
      unint64_t v4 = v3;
      unint64_t v5 = *(void *)(a1 + 56);
      uint64_t v6 = *(void *)(a1 + 32);
      if (v3 >= v5)
      {
        (*(void (**)(uint64_t, unint64_t, void))(v6 + 16))(v6, v3, 0);
      }
      else
      {
        uint64_t v7 = fs_errorForPOSIXError(5);
        (*(void (**)(uint64_t, unint64_t, void *))(v6 + 16))(v6, v4, v7);
      }
    }
    id WeakRetained = v11;
  }
}

- (unint64_t)readInto:(void *)a3 startingAt:(int64_t)a4 length:(unint64_t)a5 error:(id *)a6
{
  objc_super v10 = self;
  objc_sync_enter(v10);
  if (v10->_terminated)
  {
    fs_errorForPOSIXError(5);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v10);

    return 0;
  }
  else
  {
    objc_sync_exit(v10);

    unint64_t v12 = pread([(FSBlockDeviceResource *)v10 fileDescriptor], a3, a5, a4);
    if ((v12 & 0x8000000000000000) != 0)
    {
      v14 = __error();
      fs_errorForPOSIXError(*v14);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      unint64_t v11 = 0;
    }
    else
    {
      unint64_t v11 = v12;
      if (v12 >= a5)
      {
        *a6 = 0;
        return v11;
      }
      fs_errorForPOSIXError(5);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    *a6 = v13;
  }
  return v11;
}

- (void)writeFrom:(void *)a3 startingAt:(int64_t)a4 length:(unint64_t)a5 completionHandler:(id)a6
{
  objc_super v10 = (void (**)(id, void, void *))a6;
  unint64_t v11 = self;
  objc_sync_enter(v11);
  if (v11->_terminated)
  {
    unint64_t v12 = fs_errorForPOSIXError(5);
    v10[2](v10, 0, v12);

    objc_sync_exit(v11);
  }
  else
  {
    objc_sync_exit(v11);

    if (a3)
    {
      objc_initWeak(&location, v11);
      fsExecQueue = v11->_fsExecQueue;
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __71__FSBlockDeviceResource_writeFrom_startingAt_length_completionHandler___block_invoke;
      v14[3] = &unk_26530B798;
      objc_copyWeak(v16, &location);
      v16[1] = a3;
      v16[2] = (id)a5;
      v16[3] = (id)a4;
      uint64_t v15 = v10;
      [(FSWorkQueue *)fsExecQueue enqueue:v14];

      objc_destroyWeak(v16);
      objc_destroyWeak(&location);
      goto LABEL_6;
    }
    fs_errorForPOSIXError(14);
    unint64_t v11 = (FSBlockDeviceResource *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v11);
  }

LABEL_6:
}

void __71__FSBlockDeviceResource_writeFrom_startingAt_length_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v11 = WeakRetained;
    unint64_t v3 = pwrite([WeakRetained fileDescriptor], *(const void **)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64));
    if ((v3 & 0x8000000000000000) != 0)
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = __error();
      objc_super v10 = fs_errorForPOSIXError(*v9);
      (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v10);
    }
    else
    {
      unint64_t v4 = v3;
      unint64_t v5 = *(void *)(a1 + 56);
      uint64_t v6 = *(void *)(a1 + 32);
      if (v3 >= v5)
      {
        (*(void (**)(uint64_t, unint64_t, void))(v6 + 16))(v6, v3, 0);
      }
      else
      {
        uint64_t v7 = fs_errorForPOSIXError(45);
        (*(void (**)(uint64_t, unint64_t, void *))(v6 + 16))(v6, v4, v7);
      }
    }
    id WeakRetained = v11;
  }
}

- (unint64_t)writeFrom:(void *)a3 startingAt:(int64_t)a4 length:(unint64_t)a5 error:(id *)a6
{
  objc_super v10 = self;
  objc_sync_enter(v10);
  if (v10->_terminated)
  {
    fs_errorForPOSIXError(5);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v10);

    return 0;
  }
  else
  {
    objc_sync_exit(v10);

    unint64_t v12 = pwrite([(FSBlockDeviceResource *)v10 fileDescriptor], a3, a5, a4);
    if ((v12 & 0x8000000000000000) != 0)
    {
      v14 = __error();
      fs_errorForPOSIXError(*v14);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      unint64_t v11 = 0;
    }
    else
    {
      unint64_t v11 = v12;
      if (v12 >= a5)
      {
        *a6 = 0;
        return v11;
      }
      fs_errorForPOSIXError(45);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    *a6 = v13;
  }
  return v11;
}

- (id)metadataReadInto:(void *)a3 startingAt:(int64_t)a4 length:(unint64_t)a5
{
  uint64_t v9 = [MEMORY[0x263F522B0] defaultClient];
  if ([v9 readMeta:self->_fileDescriptor buffer:a3 offset:a4 length:a5])
  {
    objc_super v10 = fs_errorForPOSIXError(5);
  }
  else
  {
    objc_super v10 = 0;
  }

  return v10;
}

- (id)metadataReadInto:(void *)a3 startingAt:(int64_t)a4 length:(unint64_t)a5 readAheadExtents:(id *)a6 readAheadCount:(int64_t)a7
{
  if (a7)
  {
    id v13 = [MEMORY[0x263F522B0] defaultClient];
    if ([v13 readMetaWithRA:self->_fileDescriptor buffer:a3 offset:a4 length:a5 raList:a6 raListCount:a7])
    {
      v14 = fs_errorForPOSIXError(5);
    }
    else
    {
      v14 = 0;
    }
  }
  else
  {
    uint64_t v15 = fskit_std_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[FSBlockDeviceResource metadataReadInto:startingAt:length:readAheadExtents:readAheadCount:](v15, v16, v17, v18, v19, v20, v21, v22);
    }

    v14 = fs_errorForPOSIXError(22);
  }
  return v14;
}

- (id)metadataWriteFrom:(void *)a3 startingAt:(int64_t)a4 length:(unint64_t)a5
{
  uint64_t v9 = [MEMORY[0x263F522B0] defaultClient];
  if ([v9 writeMeta:self->_fileDescriptor buffer:a3 offset:a4 length:a5])
  {
    objc_super v10 = fs_errorForPOSIXError(5);
  }
  else
  {
    objc_super v10 = 0;
  }

  return v10;
}

- (id)delayedMetadataWriteFrom:(void *)a3 startingAt:(int64_t)a4 length:(unint64_t)a5
{
  uint64_t v9 = [MEMORY[0x263F522B0] defaultClient];
  if ([v9 writeMetaDelayed:self->_fileDescriptor buffer:a3 offset:a4 length:a5])
  {
    objc_super v10 = fs_errorForPOSIXError(5);
  }
  else
  {
    objc_super v10 = 0;
  }

  return v10;
}

- (id)asynchronousMetadataFlush
{
  unint64_t v3 = [MEMORY[0x263F522B0] defaultClient];
  if ([v3 flushMeta:self->_fileDescriptor wait:0])
  {
    unint64_t v4 = fskit_std_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[FSBlockDeviceResource asynchronousMetadataFlush]();
    }

    unint64_t v5 = fs_errorForPOSIXError(5);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (id)metadataFlush
{
  unint64_t v3 = [MEMORY[0x263F522B0] defaultClient];
  if ([v3 flushMeta:self->_fileDescriptor wait:1])
  {
    unint64_t v4 = fskit_std_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[FSBlockDeviceResource metadataFlush]();
    }

    unint64_t v5 = fs_errorForPOSIXError(5);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (id)metadataClear:(id)a3 wait:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x263F522B0] defaultClient];
  if ((unint64_t)[v6 count] >= 9)
  {
    uint64_t v8 = fskit_std_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[FSBlockDeviceResource metadataClear:wait:](v8, v9, v10, v11, v12, v13, v14, v15);
    }

    int v16 = 22;
LABEL_16:
    v27 = fs_errorForPOSIXError(v16);
    goto LABEL_17;
  }
  v29 = self;
  BOOL v30 = v4;
  memset(v36, 0, sizeof(v36));
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v17 = v6;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    int v20 = 0;
    uint64_t v21 = *(void *)v32;
    do
    {
      uint64_t v22 = 0;
      int v23 = v20;
      v24 = (_DWORD *)(((unint64_t)v36 | 0xC) + 16 * v20);
      do
      {
        if (*(void *)v32 != v21) {
          objc_enumerationMutation(v17);
        }
        v25 = *(void **)(*((void *)&v31 + 1) + 8 * v22);
        *(void *)(v24 - 3) = objc_msgSend(v25, "startBlockOffset", v29);
        *(v24 - 1) = [v25 blockLength];
        _DWORD *v24 = [v25 numberOfBlocks];
        v24 += 4;
        ++v22;
      }
      while (v19 != v22);
      uint64_t v19 = [v17 countByEnumeratingWithState:&v31 objects:v35 count:16];
      int v20 = v23 + v22;
    }
    while (v19);
  }

  if (objc_msgSend(v7, "clearMetaBlocks:ranges:rangesCount:wait:", v29->_fileDescriptor, v36, objc_msgSend(v17, "count"), v30))
  {
    v26 = fskit_std_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[FSBlockDeviceResource metadataClear:wait:]();
    }

    int v16 = 5;
    goto LABEL_16;
  }
  v27 = 0;
LABEL_17:

  return v27;
}

- (id)metadataPurge:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = [MEMORY[0x263F522B0] defaultClient];
  if ((unint64_t)[v4 count] >= 9)
  {
    id v6 = fskit_std_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[FSBlockDeviceResource metadataPurge:](v6, v7, v8, v9, v10, v11, v12, v13);
    }

    int v14 = 22;
LABEL_16:
    v25 = fs_errorForPOSIXError(v14);
    goto LABEL_17;
  }
  v27 = self;
  memset(v33, 0, sizeof(v33));
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v15 = v4;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    int v18 = 0;
    uint64_t v19 = *(void *)v29;
    do
    {
      uint64_t v20 = 0;
      int v21 = v18;
      uint64_t v22 = (_DWORD *)(((unint64_t)v33 | 0xC) + 16 * v18);
      do
      {
        if (*(void *)v29 != v19) {
          objc_enumerationMutation(v15);
        }
        int v23 = *(void **)(*((void *)&v28 + 1) + 8 * v20);
        *(void *)(v22 - 3) = [v23 startBlockOffset];
        *(v22 - 1) = [v23 blockLength];
        *uint64_t v22 = [v23 numberOfBlocks];
        v22 += 4;
        ++v20;
      }
      while (v17 != v20);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v28 objects:v32 count:16];
      int v18 = v21 + v20;
    }
    while (v17);
  }

  if (objc_msgSend(v5, "purgeMetaBlocks:ranges:rangesCount:", v27->_fileDescriptor, v33, objc_msgSend(v15, "count")))
  {
    v24 = fskit_std_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[FSBlockDeviceResource metadataPurge:]();
    }

    int v14 = 5;
    goto LABEL_16;
  }
  v25 = 0;
LABEL_17:

  return v25;
}

- (void)releaseNotification
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_24DDB2000, v0, v1, "%s:release:error:%d", v2, v3, v4, v5, 2u);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = +[FSResource dynamicCast:a3];
  uint64_t v5 = v4;
  if (v4)
  {
    BSDName = self->_BSDName;
    uint64_t v7 = [v4 BSDName];
    char v8 = [(NSString *)BSDName isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)getResourceID
{
  return (id)[NSString stringWithFormat:@"FSBlockDeviceResource:%@", self->_BSDName];
}

- (NSString)BSDName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)isWritable
{
  return self->_writable;
}

- (unint64_t)blockSize
{
  return self->_blockSize;
}

- (unint64_t)blockCount
{
  return self->_blockCount;
}

- (unint64_t)physicalBlockSize
{
  return self->_physicalBlockSize;
}

- (BOOL)isTerminated
{
  return self->_terminated;
}

- (FSWorkQueue)fsExecQueue
{
  return (FSWorkQueue *)objc_getProperty(self, a2, 80, 1);
}

- (void)setFsExecQueue:(id)a3
{
}

- (NSString)devicePath
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (int)fileDescriptor
{
  return self->_fileDescriptor;
}

- (unint64_t)partitionBase
{
  return self->_partitionBase;
}

- (unsigned)notification
{
  return self->_notification;
}

- (void)setNotification:(unsigned int)a3
{
  self->_notification = a3;
}

- (IONotificationPort)notifyPort
{
  return self->_notifyPort;
}

- (void)setNotifyPort:(IONotificationPort *)a3
{
  self->_notifyPort = a3;
}

- (OS_dispatch_queue)ioKitQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 112, 1);
}

- (void)setIoKitQueue:(id)a3
{
}

- (NSString)usingResourcePurpose
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setUsingResourcePurpose:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usingResourcePurpose, 0);
  objc_storeStrong((id *)&self->_ioKitQueue, 0);
  objc_storeStrong((id *)&self->_devicePath, 0);
  objc_storeStrong((id *)&self->_fsExecQueue, 0);
  objc_storeStrong((id *)&self->_BSDName, 0);
}

- (id)initProxyForBSDName:(id)a3
{
  return [(FSBlockDeviceResource *)self initProxyForBSDName:a3 isWritable:0];
}

- (id)initProxyForBSDName:(id)a3 isWritable:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = v6;
  if ([v6 hasPrefix:@"/dev/"])
  {
    uint64_t v7 = [v6 substringFromIndex:objc_msgSend(@"/dev/", "length")];
  }
  char v8 = [NSString stringWithFormat:@"/dev/r%@", v7];
  uint64_t v9 = [(FSBlockDeviceResource *)self initWithBSDName:v7 devicePath:v8 fileDescriptor:0xFFFFFFFFLL writable:v4];

  return v9;
}

- (FSBlockDeviceResource)initWithBSDName:(id)a3 devicePath:(id)a4 fileDescriptor:(int)a5 writable:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  v31.receiver = self;
  v31.super_class = (Class)FSBlockDeviceResource;
  uint64_t v13 = [(FSBlockDeviceResource *)&v31 init];
  int v14 = v13;
  if (v13)
  {
    p_BSDName = &v13->_BSDName;
    objc_storeStrong((id *)&v13->_BSDName, a3);
    objc_storeStrong((id *)&v14->_devicePath, a4);
    v14->_int fileDescriptor = a5;
    v14->_writable = a6;
    unsigned int v30 = 0;
    unint64_t v29 = 0;
    if (ioctl(a5, 0x40046418uLL, &v30)) {
      uint64_t v16 = 512;
    }
    else {
      uint64_t v16 = v30;
    }
    v14->_unint64_t blockSize = v16;
    int v17 = ioctl(v14->_fileDescriptor, 0x40086419uLL, &v29);
    unint64_t v18 = v29;
    if (v17) {
      unint64_t v18 = 0;
    }
    v14->_blockCount = v18;
    if (ioctl(v14->_fileDescriptor, 0x4004644DuLL, &v30)) {
      unint64_t blockSize = v14->_blockSize;
    }
    else {
      unint64_t blockSize = v30;
    }
    v14->_physicalBlockSize = blockSize;
    if (ioctl(v14->_fileDescriptor, 0x4004644EuLL, &v30)) {
      unint64_t v20 = 0;
    }
    else {
      unint64_t v20 = v30;
    }
    v14->_queueDepth = v20;
    if (ioctl(v14->_fileDescriptor, 0x4004644CuLL, &v30))
    {
      v14->_supportsUnmap = 0;
      v14->_supportsPriority = 0;
      v14->_supportsBarrier = 0;
    }
    else
    {
      char v21 = v30;
      v14->_supportsBarrier = (v30 & 2) != 0;
      v14->_supportsPriority = (v21 & 4) != 0;
      v14->_supportsUnmap = (v21 & 0x10) != 0;
    }
    int v22 = ioctl(v14->_fileDescriptor, 0x40086449uLL, &v29);
    unint64_t v23 = v29;
    if (v22) {
      unint64_t v23 = 0;
    }
    v14->_partitionBase = v23;
    v14->_notification = 0;
    v14->_BOOL terminated = 0;
    v24 = [FSWorkQueue alloc];
    v25 = [NSString stringWithFormat:@"fsblockdevice.%@", *p_BSDName];
    uint64_t v26 = [(FSWorkQueue *)v24 initQueueWithDomain:v25 concurrency:16];
    fsExecQueue = v14->_fsExecQueue;
    v14->_fsExecQueue = (FSWorkQueue *)v26;
  }
  return v14;
}

- (FSBlockDeviceResource)initWithResource:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FSBlockDeviceResource;
  uint64_t v5 = [(FSBlockDeviceResource *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 BSDName];
    BSDName = v5->_BSDName;
    v5->_BSDName = (NSString *)v6;

    uint64_t v8 = [v4 devicePath];
    devicePath = v5->_devicePath;
    v5->_devicePath = (NSString *)v8;

    v5->_int fileDescriptor = [v4 fileDescriptor];
    v5->_writable = [v4 isWritable];
    v5->_unint64_t blockSize = [v4 blockSize];
    v5->_blockCount = [v4 blockCount];
    v5->_physicalBlockSize = [v4 physicalBlockSize];
    v5->_queueDepth = *((void *)v4 + 3);
    v5->_supportsBarrier = *((unsigned char *)v4 + 17);
    v5->_supportsUnmap = *((unsigned char *)v4 + 19);
    v5->_supportsPriority = *((unsigned char *)v4 + 18);
    v5->_partitionBase = [v4 partitionBase];
    v5->_notification = 0;
    v5->_BOOL terminated = [v4 isTerminated];
    uint64_t v10 = [FSWorkQueue alloc];
    id v11 = [NSString stringWithFormat:@"fsblockdevice.%@", v5->_BSDName];
    uint64_t v12 = [(FSWorkQueue *)v10 initQueueWithDomain:v11 concurrency:16];
    fsExecQueue = v5->_fsExecQueue;
    v5->_fsExecQueue = (FSWorkQueue *)v12;
  }
  return v5;
}

+ (id)resourceWithBSDName:(id)a3 devicePath:(id)a4 fileDescriptor:(int)a5 writable:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = *(void *)&a5;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = (void *)[objc_alloc((Class)a1) initWithBSDName:v11 devicePath:v10 fileDescriptor:v7 writable:v6];

  return v12;
}

+ (void)openWithBSDName:(id)a3 writable:(BOOL)a4 auditToken:(id)a5 replyHandler:(id)a6
{
  kern_return_t v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  NSObject *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  void v70[6];
  void v71[5];
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t (*v75)(uint64_t, uint64_t);
  void (*v76)(uint64_t);
  id v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t (*v81)(uint64_t, uint64_t);
  void (*v82)(uint64_t);
  id v83;
  io_object_t notification;
  const char *v85;
  __int16 v86;
  id v87;
  __int16 v88;
  uint64_t v89;
  uint64_t v90;

  BOOL v8 = a4;
  v90 = *MEMORY[0x263EF8340];
  id v9 = a3;
  v69 = a5;
  id v10 = (void (**)(id, uint64_t, uint64_t))a6;
  id v11 = fskit_std_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    +[FSBlockDeviceResource(Project) openWithBSDName:writable:auditToken:replyHandler:].cold.7();
  }

  uint64_t v12 = [NSString stringWithFormat:@"/dev/r%@", v9];
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.fskit.fskit_helper" options:4096];
  int v14 = +[FSKitConstants FSKitHelperProtocol];
  [v13 setRemoteObjectInterface:v14];

  [v13 resume];
  v78 = 0;
  v79 = &v78;
  v80 = 0x3032000000;
  v81 = __Block_byref_object_copy__1;
  v82 = __Block_byref_object_dispose__1;
  v83 = 0;
  v72 = 0;
  v73 = &v72;
  v74 = 0x3032000000;
  v75 = __Block_byref_object_copy__1;
  v76 = __Block_byref_object_dispose__1;
  v77 = 0;
  v71[0] = MEMORY[0x263EF8330];
  v71[1] = 3221225472;
  v71[2] = __83__FSBlockDeviceResource_Project__openWithBSDName_writable_auditToken_replyHandler___block_invoke;
  v71[3] = &unk_26530B770;
  v71[4] = &v78;
  objc_super v15 = [v13 synchronousRemoteObjectProxyWithErrorHandler:v71];
  uint64_t v16 = v15;
  v70[0] = MEMORY[0x263EF8330];
  v70[1] = 3221225472;
  v70[2] = __83__FSBlockDeviceResource_Project__openWithBSDName_writable_auditToken_replyHandler___block_invoke_196;
  v70[3] = &unk_26530B7C0;
  if (v8) {
    uint64_t v17 = 2;
  }
  else {
    uint64_t v17 = 0;
  }
  v70[4] = &v72;
  v70[5] = &v78;
  [v15 openDevice:v9 devicePath:v12 flags:v17 auditToken:v69 replyHandler:v70];
  unint64_t v18 = (void *)v73[5];
  if (!v18 || ([v18 fileDescriptor] & 0x80000000) != 0)
  {
    int v22 = fskit_std_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v39 = v79[5];
      notification = 136315650;
      v85 = "+[FSBlockDeviceResource(Project) openWithBSDName:writable:auditToken:replyHandler:]";
      v86 = 2112;
      v87 = v9;
      v88 = 2112;
      v89 = v39;
      _os_log_impl(&dword_24DDB2000, v22, OS_LOG_TYPE_INFO, "%s: failed to open device %@, %@", (uint8_t *)&notification, 0x20u);
    }
  }
  else
  {
    uint64_t v19 = NSString;
    unint64_t v20 = [(id)v73[5] BSDName];
    char v21 = [v19 stringWithFormat:@"com.apple.fskit.iokit.queue.%@.%d", v20, objc_msgSend((id)v73[5], "fileDescriptor")];

    int v22 = v21;
    dispatch_queue_t v23 = dispatch_queue_create((const char *)[v22 UTF8String], 0);
    [(id)v73[5] setIoKitQueue:v23];

    v24 = [(id)v73[5] ioKitQueue];

    if (v24)
    {
      v25 = IONotificationPortCreate(*MEMORY[0x263F0EC88]);
      uint64_t v26 = fskit_std_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
        +[FSBlockDeviceResource(Project) openWithBSDName:writable:auditToken:replyHandler:].cold.6();
      }

      v27 = [(id)v73[5] ioKitQueue];
      IONotificationPortSetDispatchQueue(v25, v27);

      [(id)v73[5] setNotifyPort:v25];
      long long v28 = (const char *)[v9 UTF8String];
      LODWORD(v27) = *MEMORY[0x263F0EC90];
      CFDictionaryRef v29 = IOBSDNameMatching(*MEMORY[0x263F0EC90], 0, v28);
      io_service_t MatchingService = IOServiceGetMatchingService((mach_port_t)v27, v29);
      notification = 0;
      if (MatchingService)
      {
        objc_super v31 = objc_opt_new();
        [v31 setResource:v73[5]];
        long long v32 = (IONotificationPort *)[(id)v73[5] notifyPort];
        id v33 = v31;
        uint64_t v34 = IOServiceAddInterestNotification(v32, MatchingService, "IOGeneralInterest", (IOServiceInterestCallback)deviceNotificationCallback, v33, &notification);
        IOObjectRelease(MatchingService);
        if (v34)
        {
          v35 = fskit_std_log();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
            +[FSBlockDeviceResource(Project) openWithBSDName:writable:auditToken:replyHandler:].cold.5();
          }

          [v33 setResource:0];
          [(id)v73[5] terminate];
          v36 = (void *)v73[5];
          v73[5] = 0;

          uint64_t v37 = fs_errorForMachError(v34);
          v38 = v79[5];
          v79[5] = v37;
        }
        else
        {
          [(id)v73[5] setNotification:notification];
          v38 = fskit_std_log();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
            +[FSBlockDeviceResource(Project) openWithBSDName:writable:auditToken:replyHandler:].cold.4(v38, v54, v55, v56, v57, v58, v59, v60);
          }
        }
      }
      else
      {
        v51 = fskit_std_log();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
          +[FSBlockDeviceResource(Project) openWithBSDName:writable:auditToken:replyHandler:]();
        }

        [(id)v73[5] terminate];
        v52 = (void *)v73[5];
        v73[5] = 0;

        v53 = fs_errorForPOSIXError(2);
        id v33 = (id)v79[5];
        v79[5] = v53;
      }
    }
    else
    {
      v40 = fskit_std_log();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
        +[FSBlockDeviceResource(Project) openWithBSDName:writable:auditToken:replyHandler:](v40, v41, v42, v43, v44, v45, v46, v47);
      }

      [(id)v73[5] terminate];
      v48 = (void *)v73[5];
      v73[5] = 0;

      v49 = fs_errorForPOSIXError(12);
      v50 = (void *)v79[5];
      v79[5] = v49;
    }
  }

  v61 = fskit_std_log();
  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG)) {
    +[FSBlockDeviceResource(Project) openWithBSDName:writable:auditToken:replyHandler:](v61, v62, v63, v64, v65, v66, v67, v68);
  }

  v10[2](v10, v73[5], v79[5]);
  _Block_object_dispose(&v72, 8);

  _Block_object_dispose(&v78, 8);
}

void __83__FSBlockDeviceResource_Project__openWithBSDName_writable_auditToken_replyHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = fskit_std_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __31__FSBlockDeviceResource_revoke__block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  }

  uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v3;
}

void __83__FSBlockDeviceResource_Project__openWithBSDName_writable_auditToken_replyHandler___block_invoke_196(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    uint64_t v8 = fskit_std_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __83__FSBlockDeviceResource_Project__openWithBSDName_writable_auditToken_replyHandler___block_invoke_196_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  else
  {
    uint64_t v16 = fskit_std_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 136315394;
      unint64_t v20 = "+[FSBlockDeviceResource(Project) openWithBSDName:writable:auditToken:replyHandler:]_block_invoke";
      __int16 v21 = 2112;
      id v22 = v7;
      _os_log_impl(&dword_24DDB2000, v16, OS_LOG_TYPE_DEFAULT, "%s: Open device returned error %@", (uint8_t *)&v19, 0x16u);
    }

    uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
    id v18 = v7;
    uint64_t v8 = *(NSObject **)(v17 + 40);
    *(void *)(v17 + 40) = v18;
  }
}

- (id)startUsingResource:(id)a3
{
  id v5 = a3;
  if (self->_usingResourcePurpose)
  {
    id v6 = fskit_std_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[FSBlockDeviceResource(Project) startUsingResource:].cold.4();
    }

    int v7 = 16;
LABEL_13:
    uint64_t v14 = fs_errorForPOSIXError(v7);
    goto LABEL_14;
  }
  uint64_t v8 = [MEMORY[0x263F522B0] defaultClient];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v15 = fskit_std_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[FSBlockDeviceResource(Project) startUsingResource:](v15, v16, v17, v18, v19, v20, v21, v22);
    }

    int v7 = 22;
    goto LABEL_13;
  }
  uint64_t v10 = [MEMORY[0x263F522B0] defaultClient];
  int v11 = [v10 openFileDescriptorForKernel:self->_fileDescriptor flags:2 * self->_writable];
  if (v11)
  {
    int v12 = v11;
    uint64_t v13 = fskit_std_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[FSBlockDeviceResource(Project) startUsingResource:]();
    }

    uint64_t v14 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:v12 userInfo:0];
  }
  else
  {
    objc_storeStrong((id *)&self->_usingResourcePurpose, a3);
    v24 = fskit_std_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      [(FSBlockDeviceResource(Project) *)self startUsingResource:v24];
    }

    uint64_t v14 = 0;
  }

LABEL_14:
  return v14;
}

- (id)stopUsingResource:(id)a3
{
  id v4 = a3;
  usingResourcePurpose = self->_usingResourcePurpose;
  if (usingResourcePurpose && [(NSString *)usingResourcePurpose length])
  {
    if ([(NSString *)self->_usingResourcePurpose isEqualToString:v4]
      || ([v4 isEqualToString:@"serviceTerminated"] & 1) != 0)
    {
      id v6 = [MEMORY[0x263F522B0] defaultClient];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        uint64_t v8 = [MEMORY[0x263F522B0] defaultClient];
        int v9 = [v8 closeFileDescriptorForKernel:self->_fileDescriptor];
        uint64_t v10 = fskit_std_log();
        int v11 = v10;
        if (v9)
        {
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
            -[FSBlockDeviceResource(Project) stopUsingResource:]();
          }

          int v12 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:v9 userInfo:0];
        }
        else
        {
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
            -[FSBlockDeviceResource(Project) stopUsingResource:](self);
          }

          int v12 = 0;
        }

        goto LABEL_22;
      }
      uint64_t v21 = fskit_std_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[FSBlockDeviceResource(Project) stopUsingResource:].cold.4(v21, v22, v23, v24, v25, v26, v27, v28);
      }
    }
    else
    {
      uint64_t v21 = fskit_std_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[FSBlockDeviceResource(Project) stopUsingResource:].cold.5();
      }
    }

    int v12 = fs_errorForPOSIXError(22);
    goto LABEL_22;
  }
  uint64_t v13 = fskit_std_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[FSBlockDeviceResource(Project) stopUsingResource:](v13, v14, v15, v16, v17, v18, v19, v20);
  }

  int v12 = 0;
LABEL_22:

  return v12;
}

+ (id)proxyResourceForBSDName:(id)a3
{
  return (id)[a1 proxyResourceForBSDName:a3 isWritable:0];
}

- (void)readFirstSectorAndLog
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = (unsigned __int8 *)malloc_type_malloc(self->_blockSize, 0xBC5C127EuLL);
  unint64_t blockSize = self->_blockSize;
  id v14 = 0;
  unint64_t v5 = [(FSBlockDeviceResource *)self readInto:v3 startingAt:0 length:blockSize error:&v14];
  id v6 = v14;
  int v7 = fskit_std_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int fileDescriptor = self->_fileDescriptor;
    *(_DWORD *)buf = 67109634;
    int v16 = fileDescriptor;
    __int16 v17 = 2048;
    *(void *)uint64_t v18 = v5;
    *(_WORD *)&v18[8] = 2112;
    id v19 = v6;
    _os_log_impl(&dword_24DDB2000, v7, OS_LOG_TYPE_DEFAULT, "readFirstSectorAndLog reading from %d got rv %zu error %@", buf, 0x1Cu);
  }

  if (v5 >= 5)
  {
    int v9 = fskit_std_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = *v3;
      int v11 = v3[1];
      int v12 = v3[2];
      int v13 = v3[3];
      *(_DWORD *)buf = 67109888;
      int v16 = v10;
      __int16 v17 = 1024;
      *(_DWORD *)uint64_t v18 = v11;
      *(_WORD *)&v18[4] = 1024;
      *(_DWORD *)&v18[6] = v12;
      LOWORD(v19) = 1024;
      *(_DWORD *)((char *)&v19 + 2) = v13;
      _os_log_impl(&dword_24DDB2000, v9, OS_LOG_TYPE_DEFAULT, "Successful read, first characters %02x%02x:%02x%02x", buf, 0x1Au);
    }
  }
  if (v3) {
    free(v3);
  }
}

- (NSString)bsdName
{
  uint64_t v2 = (void *)[(NSString *)self->_BSDName copy];
  return (NSString *)v2;
}

- (void)metadataWriteFrom:(void *)a3 startingAt:(int64_t)a4 length:(unint64_t)a5 completionHandler:(id)a6
{
  int v12 = (void (**)(id, void *))a6;
  int v10 = [MEMORY[0x263F522B0] defaultClient];
  if ([v10 writeMetaAsync:self->_fileDescriptor buffer:a3 offset:a4 length:a5])
  {
    int v11 = fs_errorForPOSIXError(5);
    v12[2](v12, v11);
  }
  else
  {
    v12[2](v12, 0);
  }
}

- (void)synchronousReadInto:(void *)a3 startingAt:(int64_t)a4 length:(unint64_t)a5 replyHandler:(id)a6
{
  id v13 = 0;
  int v10 = (void (**)(id, unint64_t, id))a6;
  unint64_t v11 = [(FSBlockDeviceResource *)self readInto:a3 startingAt:a4 length:a5 error:&v13];
  id v12 = v13;
  v10[2](v10, v11, v12);
}

- (void)encodeWithCoder:(os_log_t)log .cold.1(int *a1, int a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = *a1;
  v4[0] = 67109376;
  v4[1] = v3;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_fault_impl(&dword_24DDB2000, log, OS_LOG_TYPE_FAULT, "error creating fdWrapper for fd %d, maybe error: %d", (uint8_t *)v4, 0xEu);
}

void __31__FSBlockDeviceResource_revoke__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __31__FSBlockDeviceResource_revoke__block_invoke_71_cold_1(void *a1)
{
  [a1 code];
  OUTLINED_FUNCTION_5(&dword_24DDB2000, v1, v2, "%s:replyHandler:block:error:%lu", v3, v4, v5, v6, 2u);
}

- (void)metadataReadInto:(uint64_t)a3 startingAt:(uint64_t)a4 length:(uint64_t)a5 readAheadExtents:(uint64_t)a6 readAheadCount:(uint64_t)a7 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8(&dword_24DDB2000, a1, a3, "%s:EINVAL: readAheadExtentsCount is 0, returning EINVAL", a5, a6, a7, a8, 2u);
}

- (void)asynchronousMetadataFlush
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_24DDB2000, v0, v1, "%s: flushMeta failed, status: %d", v2, v3, v4, v5, 2u);
}

- (void)metadataFlush
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_24DDB2000, v0, v1, "%s: flushMeta failed, status: %d, returning EIO", v2, v3, v4, v5, 2u);
}

- (void)metadataClear:(uint64_t)a3 wait:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)metadataClear:wait:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_24DDB2000, v0, v1, "%s: clearMetaBlocks failed, status: %d, returning EIO", v2, v3, v4, v5, 2u);
}

- (void)metadataPurge:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)metadataPurge:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_24DDB2000, v0, v1, "%s: purgeMetaBlocks failed, status: %d, returning EIO", v2, v3, v4, v5, 2u);
}

void __83__FSBlockDeviceResource_Project__openWithBSDName_writable_auditToken_replyHandler___block_invoke_196_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end