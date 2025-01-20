@interface NSConcreteFileHandle
- (BOOL)closeAndReturnError:(id *)a3;
- (BOOL)getOffset:(unint64_t *)a3 error:(id *)a4;
- (BOOL)seekToEndReturningOffset:(unint64_t *)a3 error:(id *)a4;
- (BOOL)seekToOffset:(unint64_t)a3 error:(id *)a4;
- (BOOL)synchronizeAndReturnError:(id *)a3;
- (BOOL)truncateAtOffset:(unint64_t)a3 error:(id *)a4;
- (BOOL)writeData:(id)a3 error:(id *)a4;
- (NSConcreteFileHandle)init;
- (NSConcreteFileHandle)initWithFileDescriptor:(int)a3;
- (NSConcreteFileHandle)initWithFileDescriptor:(int)a3 closeOnDealloc:(BOOL)a4;
- (NSConcreteFileHandle)initWithPath:(id)a3 flags:(int64_t)a4 createMode:(int64_t)a5;
- (NSConcreteFileHandle)initWithPath:(id)a3 flags:(int64_t)a4 createMode:(int64_t)a5 error:(id *)a6;
- (NSConcreteFileHandle)initWithURL:(id)a3 flags:(int64_t)a4 createMode:(int64_t)a5 error:(id *)a6;
- (id)_monitor:(int)a3;
- (id)availableData;
- (id)port;
- (id)readDataOfLength:(unint64_t)a3;
- (id)readDataToEndOfFile;
- (id)readDataToEndOfFileAndReturnError:(id *)a3;
- (id)readDataUpToLength:(unint64_t)a3 error:(id *)a4;
- (id)readabilityHandler;
- (id)writeabilityHandler;
- (int)fileDescriptor;
- (unint64_t)offsetInFile;
- (unint64_t)readDataOfLength:(unint64_t)a3 buffer:(char *)a4;
- (unint64_t)seekToEndOfFile;
- (void)_cancelDispatchSources;
- (void)_closeOnDealloc;
- (void)_locked_clearHandler:(id *)a3 forSource:(id *)a4;
- (void)acceptConnectionInBackgroundAndNotify;
- (void)acceptConnectionInBackgroundAndNotifyForModes:(id)a3;
- (void)closeFile;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)performActivity:(int64_t)a3 modes:(id)a4;
- (void)readInBackgroundAndNotify;
- (void)readInBackgroundAndNotifyForModes:(id)a3;
- (void)readToEndOfFileInBackgroundAndNotify;
- (void)readToEndOfFileInBackgroundAndNotifyForModes:(id)a3;
- (void)seekToFileOffset:(unint64_t)a3;
- (void)setReadabilityHandler:(id)a3;
- (void)setWriteabilityHandler:(id)a3;
- (void)synchronizeFile;
- (void)truncateFileAtOffset:(unint64_t)a3;
- (void)waitForDataInBackgroundAndNotify;
- (void)waitForDataInBackgroundAndNotifyForModes:(id)a3;
- (void)writeData:(id)a3;
@end

@implementation NSConcreteFileHandle

uint64_t __34__NSConcreteFileHandle_writeData___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unsigned char *a5)
{
  if (a4)
  {
    uint64_t v8 = result;
    unint64_t v9 = 0;
    while (1)
    {
      result = _NSWriteToFileDescriptorWithProgress(*(_DWORD *)(*(void *)(v8 + 32) + 96), (char *)(a2 + v9), a4 - v9, 0);
      if (result < 0) {
        break;
      }
      v9 += result;
      if (v9 >= a4) {
        return result;
      }
    }
    *(unsigned char *)(*(void *)(*(void *)(v8 + 40) + 8) + 24) = 0;
    *a5 = 1;
  }
  return result;
}

- (void)waitForDataInBackgroundAndNotify
{
}

- (void)waitForDataInBackgroundAndNotifyForModes:(id)a3
{
}

void __46__NSConcreteFileHandle_performActivity_modes___block_invoke_4(uint64_t a1)
{
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
  close(*(_DWORD *)(a1 + 56));
  CFRelease(*(CFTypeRef *)(a1 + 40));
  v2 = *(const void **)(a1 + 48);

  CFRelease(v2);
}

- (id)readDataToEndOfFileAndReturnError:(id *)a3
{
  if (a3) {
    *a3 = 0;
  }
  return [(NSConcreteFileHandle *)self readDataToEndOfFile];
}

- (id)readDataOfLength:(unint64_t)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  memset(&v21, 0, sizeof(v21));
  char v5 = atomic_load(&self->_flags);
  if ((v5 & 4) != 0 || fstat(self->_fd, &v21) < 0) {
    goto LABEL_40;
  }
  if ((v21.st_mode & 0xF000) != 0x8000)
  {
    v10 = malloc_type_malloc(0x2000uLL, 0x3D3E13BAuLL);
    size_t v11 = 0;
    size_t v14 = 0x2000;
    unint64_t v15 = a3;
    while (v15)
    {
      if (v15 >= 0x2000) {
        unint64_t v16 = 0x2000;
      }
      else {
        unint64_t v16 = v15;
      }
      if (v14 - v11 < v16)
      {
        v14 *= 2;
        v17 = reallocf(v10, v14);
        if (!v17) {
          goto LABEL_40;
        }
        v10 = v17;
      }
      uint64_t v18 = _NSReadFromFileDescriptorWithProgress(self->_fd, (char *)v10 + v11, v16, 0, 0);
      if (v18 < 0) {
        goto LABEL_39;
      }
      v11 += v18;
      v15 -= v18;
      if (v18) {
        BOOL v19 = v11 == a3;
      }
      else {
        BOOL v19 = 1;
      }
      if (v19) {
        break;
      }
    }
LABEL_31:
    if (a3 == -1 && v11)
    {
      v10 = reallocf(v10, v11);
    }
    else if (!v11)
    {
      goto LABEL_36;
    }
    return (id)objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:", v10, v11, *(_OWORD *)&v21.st_dev, *(_OWORD *)&v21.st_uid, *(_OWORD *)&v21.st_atimespec, *(_OWORD *)&v21.st_mtimespec, *(_OWORD *)&v21.st_ctimespec, *(_OWORD *)&v21.st_birthtimespec);
  }
  off_t v7 = lseek(self->_fd, 0, 1);
  if (v7 < 0) {
    goto LABEL_40;
  }
  if (v21.st_size <= v7) {
    return (id)objc_msgSend(MEMORY[0x1E4F1C9B8], "data", *(_OWORD *)&v21.st_dev, *(_OWORD *)&v21.st_uid, *(_OWORD *)&v21.st_atimespec, *(_OWORD *)&v21.st_mtimespec, *(_OWORD *)&v21.st_ctimespec, *(_OWORD *)&v21.st_birthtimespec);
  }
  if (v21.st_size - v7 >= a3) {
    int64_t v8 = a3;
  }
  else {
    int64_t v8 = v21.st_size - v7;
  }
  unint64_t v9 = malloc_type_malloc(v8, 0xA20D19F0uLL);
  if (!v9) {
    goto LABEL_40;
  }
  v10 = v9;
  if (v8 >= 1)
  {
    size_t v11 = 0;
    while (1)
    {
      uint64_t v12 = _NSReadFromFileDescriptorWithProgress(self->_fd, (char *)v10 + v11, v8, 0, 0);
      if (v12 < 0) {
        break;
      }
      if (v12)
      {
        v11 += v12;
        BOOL v13 = v8 <= v12;
        v8 -= v12;
        if (!v13) {
          continue;
        }
      }
      goto LABEL_31;
    }
LABEL_39:
    free(v10);
LABEL_40:
    _NSFileHandleRaiseOperationExceptionWhileReading((objc_class *)self, a2, 1);
  }
LABEL_36:
  free(v10);
  return (id)objc_msgSend(MEMORY[0x1E4F1C9B8], "data", *(_OWORD *)&v21.st_dev, *(_OWORD *)&v21.st_uid, *(_OWORD *)&v21.st_atimespec, *(_OWORD *)&v21.st_mtimespec, *(_OWORD *)&v21.st_ctimespec, *(_OWORD *)&v21.st_birthtimespec);
}

- (id)availableData
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  memset(&v9, 0, sizeof(v9));
  char v4 = atomic_load(&self->_flags);
  if ((v4 & 4) != 0 || fstat(self->_fd, &v9) < 0) {
    goto LABEL_11;
  }
  if ((v9.st_mode & 0xF000) == 0x8000)
  {
    id result = [(NSConcreteFileHandle *)self readDataToEndOfFile];
    if (result) {
      return result;
    }
    return (id)objc_msgSend(MEMORY[0x1E4F1C9B8], "data", *(void *)&v9.st_dev);
  }
  unint64_t v6 = *MEMORY[0x1E4F14B00];
  off_t v7 = (char *)malloc_type_malloc(*MEMORY[0x1E4F14B00], 0x94C4F996uLL);
  uint64_t v8 = _NSReadFromFileDescriptorWithProgress(self->_fd, v7, v6, 0, 0);
  if (v8 > 0) {
    return (id)objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:", v7, v8, *(_OWORD *)&v9.st_dev, *(_OWORD *)&v9.st_uid, *(_OWORD *)&v9.st_atimespec, *(_OWORD *)&v9.st_mtimespec, *(_OWORD *)&v9.st_ctimespec, *(_OWORD *)&v9.st_birthtimespec, *(_OWORD *)&v9.st_size, *(_OWORD *)&v9.st_blksize, *(_OWORD *)v9.st_qspare);
  }
  free(v7);
  if (v8 < 0) {
LABEL_11:
  }
    _NSFileHandleRaiseOperationExceptionWhileReading((objc_class *)self, a2, 0);
  return (id)objc_msgSend(MEMORY[0x1E4F1C9B8], "data", *(void *)&v9.st_dev);
}

- (id)readDataToEndOfFile
{
  return [(NSConcreteFileHandle *)self readDataOfLength:-1];
}

- (BOOL)closeAndReturnError:(id *)a3
{
  if (a3) {
    *a3 = 0;
  }
  [(NSConcreteFileHandle *)self closeFile];
  return 1;
}

- (void)closeFile
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  char v2 = atomic_load(&self->_flags);
  if ((v2 & 4) == 0)
  {
    [(NSConcreteFileHandle *)self _cancelDispatchSources];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __33__NSConcreteFileHandle_closeFile__block_invoke;
    v5[3] = &unk_1E51F71D0;
    unint64_t v6 = self;
    monitoringQueue = self->_monitoringQueue;
    if (monitoringQueue)
    {
      dispatch_async(monitoringQueue, v5);
    }
    else
    {
      atomic_fetch_or((atomic_ushort *volatile)&self->_flags, 4u);
      close(v6->_fd);
    }
  }
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [(NSConcreteFileHandle *)self _cancelDispatchSources];
  if ((self->_fd & 0x80000000) == 0)
  {
    char v3 = atomic_load(&self->_flags);
    if ((v3 & 4) == 0)
    {
      char v4 = atomic_load(&self->_flags);
      if ((v4 & 2) == 0)
      {
        char v5 = atomic_load(&self->_flags);
        if (v5) {
          close(self->_fd);
        }
      }
    }
  }
  fhQueue = self->_fhQueue;
  if (fhQueue) {
    dispatch_release(fhQueue);
  }
  monitoringQueue = self->_monitoringQueue;
  if (monitoringQueue) {
    dispatch_release(monitoringQueue);
  }
  v8.receiver = self;
  v8.super_class = (Class)NSConcreteFileHandle;
  [(NSConcreteFileHandle *)&v8 dealloc];
}

- (void)_cancelDispatchSources
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  dsrc = self->_dsrc;
  self->_dsrc = 0;
  [(NSConcreteFileHandle *)self _locked_clearHandler:&self->_readabilityHandler forSource:&self->_readMonitoringSource];
  [(NSConcreteFileHandle *)self _locked_clearHandler:&self->_writeabilityHandler forSource:&self->_writeMonitoringSource];
  readChannel = self->_readChannel;
  if (readChannel) {
    dispatch_io_close(readChannel, 1uLL);
  }
  os_unfair_lock_unlock(p_lock);
  if (dsrc)
  {
    dispatch_source_cancel(dsrc);
  }
}

- (void)_locked_clearHandler:(id *)a3 forSource:(id *)a4
{
  char v5 = *a4;
  *a4 = 0;
  if (v5) {
    dispatch_source_cancel(v5);
  }

  *a3 = 0;
}

- (void)encodeWithCoder:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"This object may only be encoded by an NSXPCCoder." userInfo:0]);
  }
  char v6 = atomic_load(&self->_flags);
  if ((v6 & 4) != 0) {
    _NSFileHandleRaiseOperationExceptionWhileReading((objc_class *)self, a2, 0);
  }
  xpc_object_t v7 = xpc_fd_create(self->_fd);
  if (v7)
  {
    objc_super v8 = v7;
    [a3 encodeXPCObject:v7 forKey:@"NS.fd"];
    xpc_release(v8);
  }
}

- (BOOL)truncateAtOffset:(unint64_t)a3 error:(id *)a4
{
  if (a4) {
    *a4 = 0;
  }
  [(NSConcreteFileHandle *)self truncateFileAtOffset:a3];
  return 1;
}

- (void)truncateFileAtOffset:(unint64_t)a3
{
  char v5 = atomic_load(&self->_flags);
  if ((v5 & 4) != 0 || lseek(self->_fd, a3, 0) < 0 || ftruncate(self->_fd, a3) < 0) {
    _NSFileHandleRaiseOperationExceptionWhileReading((objc_class *)self, a2, 0);
  }
}

- (BOOL)writeData:(id)a3 error:(id *)a4
{
  if (a4) {
    *a4 = 0;
  }
  [(NSConcreteFileHandle *)self writeData:a3];
  return 1;
}

- (void)writeData:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([a3 length])
  {
    char v6 = atomic_load(&self->_flags);
    if ((v6 & 4) != 0) {
      _NSFileHandleRaiseOperationExceptionWhileReading((objc_class *)self, a2, 0);
    }
    uint64_t v8 = 0;
    uint64_t v9 = &v8;
    uint64_t v10 = 0x2020000000;
    char v11 = 1;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __34__NSConcreteFileHandle_writeData___block_invoke;
    v7[3] = &unk_1E51F7068;
    v7[4] = self;
    v7[5] = &v8;
    [a3 enumerateByteRangesUsingBlock:v7];
    if (!*((unsigned char *)v9 + 24)) {
      _NSFileHandleRaiseOperationExceptionWhileReading((objc_class *)self, a2, 0);
    }
    _Block_object_dispose(&v8, 8);
  }
}

void __46__NSConcreteFileHandle_performActivity_modes___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 8));
  char v3 = *(NSObject **)(v2 + 24);
  *(void *)(v2 + 24) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 8));
  if (v3) {
    dispatch_source_cancel(v3);
  }
  if (*(_WORD *)(a1 + 60) == 12)
  {
    unsigned int v4 = accept(*(_DWORD *)(a1 + 56), 0, 0);
    if ((v4 & 0x80000000) != 0) {
      atomic_store(*__error(), (unsigned int *)(v2 + 12));
    }
    atomic_store(v4, (unsigned int *)(v2 + 16));
  }
  CFRunLoopSourceSignal(*(CFRunLoopSourceRef *)(a1 + 40));
  char v5 = *(__CFRunLoop **)(a1 + 48);

  CFRunLoopWakeUp(v5);
}

- (BOOL)seekToOffset:(unint64_t)a3 error:(id *)a4
{
  if (a4) {
    *a4 = 0;
  }
  [(NSConcreteFileHandle *)self seekToFileOffset:a3];
  return 1;
}

- (void)seekToFileOffset:(unint64_t)a3
{
  char v5 = atomic_load(&self->_flags);
  if ((v5 & 4) != 0 || lseek(self->_fd, a3, 0) < 0) {
    _NSFileHandleRaiseOperationExceptionWhileReading((objc_class *)self, a2, 1);
  }
}

- (NSConcreteFileHandle)initWithURL:(id)a3 flags:(int64_t)a4 createMode:(int64_t)a5 error:(id *)a6
{
  int v8 = a4;
  uint64_t v10 = self;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  self->_fd = -1;
  if (([a3 getFileSystemRepresentation:v16 maxLength:1026] & 1) == 0)
  {
    [(NSConcreteFileHandle *)&v15 dealloc];
    return 0;
  }
  int v11 = _NSOpenFileDescriptor(v16, v8, a5);
  v10->_fd = v11;
  if (v11 < 0)
  {
    if (a6)
    {
      uint64_t v12 = *__error();
      *a6 = _NSErrorWithFilePathErrnoVariantAndExtraUserInfo(v12, [a3 path], 0, 0, 0);
    }
    [(NSConcreteFileHandle *)&v14 dealloc];
    return 0;
  }
  atomic_fetch_or((atomic_ushort *volatile)&v10->_flags, 1u);
  v10->_fhQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.NSFileHandle.2", 0);
  v10->_lock._os_unfair_lock_opaque = 0;
  return v10;
}

- (NSConcreteFileHandle)initWithPath:(id)a3 flags:(int64_t)a4 createMode:(int64_t)a5 error:(id *)a6
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([a3 length])
  {
    uint64_t v11 = [MEMORY[0x1E4F1CB10] fileURLWithPath:a3];
    return [(NSConcreteFileHandle *)self initWithURL:v11 flags:a4 createMode:a5 error:a6];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)NSConcreteFileHandle;
    [(NSConcreteFileHandle *)&v13 dealloc];
    return 0;
  }
}

- (NSConcreteFileHandle)initWithPath:(id)a3 flags:(int64_t)a4 createMode:(int64_t)a5
{
  return [(NSConcreteFileHandle *)self initWithPath:a3 flags:a4 createMode:a5 error:0];
}

- (BOOL)seekToEndReturningOffset:(unint64_t *)a3 error:(id *)a4
{
  if (a4) {
    *a4 = 0;
  }
  unint64_t v5 = [(NSConcreteFileHandle *)self seekToEndOfFile];
  if (a3) {
    *a3 = v5;
  }
  return 1;
}

- (unint64_t)seekToEndOfFile
{
  char v4 = atomic_load(&self->_flags);
  if ((v4 & 4) != 0 || (unint64_t result = lseek(self->_fd, 0, 2), (result & 0x8000000000000000) != 0)) {
    _NSFileHandleRaiseOperationExceptionWhileReading((objc_class *)self, a2, 1);
  }
  return result;
}

- (void)performActivity:(int64_t)a3 modes:(id)a4
{
  __int16 v5 = a3;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  xpc_object_t v7 = (unsigned int *)malloc_type_malloc(0x20uLL, 0x10A0040D4BD8B5AuLL);
  atomic_store(0, v7);
  *((void *)v7 + 1) = self;
  *((_WORD *)v7 + 8) = v5;
  context.version = 0;
  context.info = v7;
  context.retain = (const void *(__cdecl *)(const void *))_NSFileHandlePerformSourceContextRetain;
  context.release = (void (__cdecl *)(const void *))_NSFileHandlePerformSourceContextRelease;
  memset(&context.copyDescription, 0, 40);
  context.perform = (void (__cdecl *)(void *))_performFileHandleSource;
  if (a4)
  {
    id v8 = a4;
  }
  else
  {
    id v9 = objc_allocWithZone(MEMORY[0x1E4F1C978]);
    a4 = (id)objc_msgSend(v9, "initWithObjects:", *MEMORY[0x1E4F1D418], 0);
  }
  CFRetain(self);
  CFRunLoopSourceRef v10 = CFRunLoopSourceCreate(0, 50, &context);
  *((void *)v7 + 3) = v10;
  CFRunLoopRef Current = CFRunLoopGetCurrent();
  CFRetain(Current);
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3052000000;
  v34[3] = __Block_byref_object_copy__2;
  v34[4] = __Block_byref_object_dispose__2;
  v34[5] = self;
  int v12 = [(NSConcreteFileHandle *)self fileDescriptor];
  dispatch_fd_t v13 = dup(v12);
  atomic_store(0, (unsigned int *)&self->_error);
  CFRetain(v10);
  switch(v5)
  {
    case 12:
    case 20:
      uint64_t v14 = dispatch_source_create(MEMORY[0x1E4F14478], v13, 0, (dispatch_queue_t)self->_fhQueue);
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __46__NSConcreteFileHandle_performActivity_modes___block_invoke_4;
      handler[3] = &unk_1E51F7A90;
      dispatch_fd_t v28 = v13;
      handler[4] = v14;
      handler[5] = v10;
      handler[6] = Current;
      dispatch_source_set_cancel_handler(v14, handler);
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __46__NSConcreteFileHandle_performActivity_modes___block_invoke_5;
      v24[3] = &unk_1E51F7AB8;
      __int16 v26 = v5;
      int v25 = v12;
      v24[4] = v34;
      v24[5] = v10;
      v24[6] = Current;
      dispatch_source_set_event_handler(v14, v24);
      os_unfair_lock_lock(&self->_lock);
      self->_dsrc = (OS_dispatch_source *)v14;
      os_unfair_lock_unlock(&self->_lock);
      dispatch_resume(v14);
      break;
    case 14:
      size_t v15 = 16 * *MEMORY[0x1E4F14B00];
      fhQueue = self->_fhQueue;
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __46__NSConcreteFileHandle_performActivity_modes___block_invoke_3;
      v29[3] = &unk_1E51F7A68;
      v29[4] = self;
      v29[5] = v34;
      v29[6] = v10;
      v29[7] = Current;
      dispatch_fd_t v30 = v13;
      dispatch_read(v13, v15, fhQueue, v29);
      break;
    case 16:
      uint64_t v17 = self->_fhQueue;
      cleanup_handler[0] = MEMORY[0x1E4F143A8];
      cleanup_handler[1] = 3221225472;
      cleanup_handler[2] = __46__NSConcreteFileHandle_performActivity_modes___block_invoke;
      cleanup_handler[3] = &__block_descriptor_36_e8_v12__0i8l;
      dispatch_fd_t v33 = v13;
      uint64_t v18 = (OS_dispatch_io *)dispatch_io_create(0, v13, v17, cleanup_handler);
      os_unfair_lock_lock(&self->_lock);
      self->_readChannel = v18;
      os_unfair_lock_unlock(&self->_lock);
      dispatch_io_set_low_water((dispatch_io_t)v18, 0xFFFFFFFFFFFFFFFFLL);
      BOOL v19 = self->_fhQueue;
      io_handler[0] = MEMORY[0x1E4F143A8];
      io_handler[1] = 3221225472;
      io_handler[2] = __46__NSConcreteFileHandle_performActivity_modes___block_invoke_2;
      io_handler[3] = &unk_1E51F7A40;
      io_handler[4] = self;
      io_handler[5] = v34;
      io_handler[6] = v10;
      io_void handler[7] = Current;
      dispatch_io_read((dispatch_io_t)v18, 0, 0xFFFFFFFFFFFFFFFFLL, v19, io_handler);
      break;
    default:
      break;
  }
  uint64_t v20 = [a4 count];
  if (v20 >= 1)
  {
    for (CFIndex i = 0; i != v20; ++i)
    {
      CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)a4, i);
      v23 = CFRunLoopGetCurrent();
      CFRunLoopAddSource(v23, v10, ValueAtIndex);
    }
  }

  _Block_object_dispose(v34, 8);
}

- (int)fileDescriptor
{
  char v2 = atomic_load(&self->_flags);
  if ((v2 & 4) != 0) {
    _NSFileHandleRaiseOperationExceptionWhileReading((objc_class *)self, a2, 0);
  }
  return self->_fd;
}

- (NSConcreteFileHandle)initWithFileDescriptor:(int)a3 closeOnDealloc:(BOOL)a4
{
  self->_fd = a3;
  self->_fhQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.NSFileHandle.1", 0);
  if (!a4) {
    atomic_fetch_or((atomic_ushort *volatile)&self->_flags, 2u);
  }
  self->_lock._os_unfair_lock_opaque = 0;
  atomic_fetch_or((atomic_ushort *volatile)&self->_flags, 1u);
  return self;
}

- (BOOL)synchronizeAndReturnError:(id *)a3
{
  if (a3) {
    *a3 = 0;
  }
  [(NSConcreteFileHandle *)self synchronizeFile];
  return 1;
}

- (void)synchronizeFile
{
  char v4 = atomic_load(&self->_flags);
  if ((v4 & 4) != 0 || fsync(self->_fd) < 0) {
    _NSFileHandleRaiseOperationExceptionWhileReading((objc_class *)self, a2, 0);
  }
}

- (NSConcreteFileHandle)initWithFileDescriptor:(int)a3
{
  return [(NSConcreteFileHandle *)self initWithFileDescriptor:*(void *)&a3 closeOnDealloc:0];
}

- (NSConcreteFileHandle)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)NSConcreteFileHandle;
  [(NSConcreteFileHandle *)&v3 dealloc];
  return 0;
}

- (unint64_t)readDataOfLength:(unint64_t)a3 buffer:(char *)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  memset(&v16, 0, sizeof(v16));
  char v6 = atomic_load(&self->_flags);
  if ((v6 & 4) != 0 || fstat(self->_fd, &v16) < 0) {
    goto LABEL_13;
  }
  if ((v16.st_mode & 0xF000) != 0x8000)
  {
    if (a3)
    {
      unint64_t v12 = 0;
      if (a3 >= 0x1000) {
        unint64_t v13 = 4096;
      }
      else {
        unint64_t v13 = a3;
      }
      while (1)
      {
        uint64_t v14 = _NSReadFromFileDescriptorWithProgress(self->_fd, &a4[v12], v13, 0, 0);
        if (v14 < 0) {
          break;
        }
        if (v14)
        {
          v12 += v14;
          a3 -= v14;
          unint64_t v13 = a3 >= 0x1000 ? 4096 : a3;
          if (a3) {
            continue;
          }
        }
        return v12;
      }
LABEL_13:
      _NSFileHandleRaiseOperationExceptionWhileReading((objc_class *)self, a2, 0);
    }
    return 0;
  }
  off_t v9 = lseek(self->_fd, 0, 1);
  if (v9 < 0) {
    goto LABEL_13;
  }
  int64_t v10 = v16.st_size - v9;
  if (v16.st_size <= v9) {
    return 0;
  }
  if (v10 >= a3) {
    int64_t v10 = a3;
  }
  if (v10 < 1) {
    return 0;
  }
  if (v10 >= 0x80000000) {
    unint64_t v11 = 0x80000000;
  }
  else {
    unint64_t v11 = v10;
  }
  unint64_t v12 = _NSReadFromFileDescriptorWithProgress(self->_fd, a4, v11, 0, 0);
  if ((v12 & 0x8000000000000000) != 0) {
    goto LABEL_13;
  }
  return v12;
}

- (id)readDataUpToLength:(unint64_t)a3 error:(id *)a4
{
  if (a4) {
    *a4 = 0;
  }
  return [(NSConcreteFileHandle *)self readDataOfLength:a3];
}

- (unint64_t)offsetInFile
{
  char v4 = atomic_load(&self->_flags);
  if ((v4 & 4) != 0 || (unint64_t result = lseek(self->_fd, 0, 1), (result & 0x8000000000000000) != 0)) {
    _NSFileHandleRaiseOperationExceptionWhileReading((objc_class *)self, a2, 1);
  }
  return result;
}

- (BOOL)getOffset:(unint64_t *)a3 error:(id *)a4
{
  if (a4) {
    *a4 = 0;
  }
  unint64_t v5 = [(NSConcreteFileHandle *)self offsetInFile];
  if (a3) {
    *a3 = v5;
  }
  return 1;
}

uint64_t __33__NSConcreteFileHandle_closeFile__block_invoke(uint64_t a1)
{
  return close(*(_DWORD *)(*(void *)(a1 + 32) + 96));
}

- (id)port
{
  return 0;
}

uint64_t __46__NSConcreteFileHandle_performActivity_modes___block_invoke(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

void __46__NSConcreteFileHandle_performActivity_modes___block_invoke_2(uint64_t a1, int a2, NSObject *a3, unsigned int a4)
{
  if (a4) {
    atomic_store(a4, (unsigned int *)(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) + 12));
  }
  if (a3 && a3 != MEMORY[0x1E4F14410])
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
    uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v8 = *(NSObject **)(v7 + 32);
    if (v8)
    {
      *(void *)(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) + 32) = dispatch_data_create_concat(*(dispatch_data_t *)(v7 + 32), a3);
      dispatch_release(v8);
    }
    else
    {
      *(void *)(v7 + 32) = a3;
      dispatch_retain(a3);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  }
  if (a2)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
    uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    int64_t v10 = *(NSObject **)(v9 + 48);
    *(void *)(v9 + 48) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
    if (v10) {
      dispatch_release(v10);
    }
    CFRunLoopSourceSignal(*(CFRunLoopSourceRef *)(a1 + 48));
    CFRunLoopWakeUp(*(CFRunLoopRef *)(a1 + 56));
    CFRelease(*(CFTypeRef *)(a1 + 48));
    unint64_t v11 = *(const void **)(a1 + 56);
    CFRelease(v11);
  }
}

void __46__NSConcreteFileHandle_performActivity_modes___block_invoke_3(uint64_t a1, NSObject *a2, unsigned int a3)
{
  if (a3) {
    atomic_store(a3, (unsigned int *)(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) + 12));
  }
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  *(void *)(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) + 32) = a2;
  dispatch_retain(a2);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  CFRunLoopSourceSignal(*(CFRunLoopSourceRef *)(a1 + 48));
  CFRunLoopWakeUp(*(CFRunLoopRef *)(a1 + 56));
  close(*(_DWORD *)(a1 + 64));
  CFRelease(*(CFTypeRef *)(a1 + 48));
  unint64_t v5 = *(const void **)(a1 + 56);

  CFRelease(v5);
}

- (void)readInBackgroundAndNotifyForModes:(id)a3
{
}

- (void)readInBackgroundAndNotify
{
}

- (void)readToEndOfFileInBackgroundAndNotifyForModes:(id)a3
{
}

- (void)readToEndOfFileInBackgroundAndNotify
{
}

- (void)acceptConnectionInBackgroundAndNotifyForModes:(id)a3
{
}

- (void)acceptConnectionInBackgroundAndNotify
{
}

- (id)_monitor:(int)a3
{
  location[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v5 = 7;
  if (!a3) {
    uint64_t v5 = 5;
  }
  uint64_t v6 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR___NSConcreteFileHandle__flags[v5]);
  int v7 = dup(self->_fd);
  monitoringQueue = self->_monitoringQueue;
  if (!monitoringQueue)
  {
    monitoringQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.NSFileHandle.fd_monitoring", 0);
    self->_monitoringQueue = monitoringQueue;
  }
  if (a3) {
    uint64_t v9 = (const dispatch_source_type_s *)MEMORY[0x1E4F144B0];
  }
  else {
    uint64_t v9 = (const dispatch_source_type_s *)MEMORY[0x1E4F14478];
  }
  int64_t v10 = dispatch_source_create(v9, v7, 0, (dispatch_queue_t)monitoringQueue);
  objc_initWeak(location, self);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __33__NSConcreteFileHandle__monitor___block_invoke;
  handler[3] = &unk_1E51F7AE0;
  objc_copyWeak(&v15, location);
  handler[4] = v6;
  dispatch_source_set_event_handler(v10, handler);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __33__NSConcreteFileHandle__monitor___block_invoke_2;
  v12[3] = &unk_1E51F7B08;
  int v13 = v7;
  v12[4] = v10;
  dispatch_source_set_cancel_handler(v10, v12);
  dispatch_resume(v10);
  objc_destroyWeak(&v15);
  objc_destroyWeak(location);
  return v10;
}

uint64_t __33__NSConcreteFileHandle__monitor___block_invoke(uint64_t a1)
{
  _CFAutoreleasePoolPush();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_super v3 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }

  return _CFAutoreleasePoolPop();
}

void __33__NSConcreteFileHandle__monitor___block_invoke_2(uint64_t a1)
{
  close(*(_DWORD *)(a1 + 40));
  char v2 = *(NSObject **)(a1 + 32);

  dispatch_release(v2);
}

- (id)readabilityHandler
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_readabilityHandler;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setReadabilityHandler:(id)a3
{
  id v4 = (void *)[a3 copy];
  os_unfair_lock_lock(&self->_lock);
  [(NSConcreteFileHandle *)self _locked_clearHandler:&self->_readabilityHandler forSource:&self->_readMonitoringSource];
  self->_readabilityHandler = v4;
  if (v4) {
    self->_readMonitoringSource = (OS_dispatch_source *)[(NSConcreteFileHandle *)self _monitor:0];
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (id)writeabilityHandler
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_writeabilityHandler;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setWriteabilityHandler:(id)a3
{
  id v4 = (void *)[a3 copy];
  os_unfair_lock_lock(&self->_lock);
  [(NSConcreteFileHandle *)self _locked_clearHandler:&self->_writeabilityHandler forSource:&self->_writeMonitoringSource];
  self->_writeabilityHandler = v4;
  if (v4) {
    self->_writeMonitoringSource = (OS_dispatch_source *)[(NSConcreteFileHandle *)self _monitor:1];
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void)_closeOnDealloc
{
}

@end