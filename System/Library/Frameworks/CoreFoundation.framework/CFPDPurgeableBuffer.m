@interface CFPDPurgeableBuffer
- (BOOL)beginAccessing;
- (BOOL)purgable;
- (CFPDPurgeableBuffer)initWithFileDescriptor:(int)a3 size:(unint64_t)a4;
- (CFPDPurgeableBuffer)initWithPropertyList:(void *)a3;
- (unint64_t)length;
- (void)beginAccessing;
- (void)bytes;
- (void)dealloc;
- (void)endAccessing;
@end

@implementation CFPDPurgeableBuffer

- (BOOL)purgable
{
  return !self->safe;
}

- (BOOL)beginAccessing
{
  uint64_t v8 = *(void *)off_1ECE0A5B0;
  if (self->usedMalloc) {
    return 1;
  }
  if (self->safe) {
    -[CFPDPurgeableBuffer beginAccessing]();
  }
  int v7 = 0;
  uint64_t v4 = *(unsigned int *)off_1ECE0A6C8;
  BytePtr = CFDataGetBytePtr(self->handle);
  int v6 = MEMORY[0x185313090](v4, BytePtr, 0, &v7);
  BOOL result = (v6 | v7) == 0;
  self->safe = result;
  return result;
}

- (unint64_t)length
{
  return CFDataGetLength(self->handle);
}

- (void)bytes
{
}

- (void)dealloc
{
  uint64_t v5 = *(void *)off_1ECE0A5B0;
  handle = self->handle;
  if (handle) {
    CFRelease(handle);
  }
  v4.receiver = self;
  v4.super_class = (Class)CFPDPurgeableBuffer;
  [(CFPDPurgeableBuffer *)&v4 dealloc];
}

- (CFPDPurgeableBuffer)initWithFileDescriptor:(int)a3 size:(unint64_t)a4
{
  uint64_t v24 = *(void *)off_1ECE0A5B0;
  if (a3 < 0 || !a4)
  {

    return 0;
  }
  v22.receiver = self;
  v22.super_class = (Class)CFPDPurgeableBuffer;
  int v6 = [(CFPDPurgeableBuffer *)&v22 init];
  int v7 = v6;
  if (v6)
  {
    if (a4 >= *(void *)off_1ECE0A708 >> 2)
    {
      context.version = 0;
      context.info = v6;
      memset(&context.retain, 0, 24);
      context.allocate = (CFAllocatorAllocateCallBack)allocatePurgeable;
      context.reallocate = 0;
      context.deallocate = (CFAllocatorDeallocateCallBack)deallocatePurgeable;
      context.preferredSize = 0;
      uint64_t v8 = CFAllocatorCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, &context);
      if (!v8) {
        goto LABEL_20;
      }
    }
    else
    {
      uint64_t v8 = CFRetain(&__kCFAllocatorSystemDefault);
      v7->usedMalloc = 1;
      if (!v8) {
        goto LABEL_20;
      }
    }
    Typed = (const UInt8 *)CFAllocatorAllocateTyped(v8, a4, 4179223152, 0);
    if (Typed)
    {
      v10 = (UInt8 *)Typed;
      FixedMutableWithBuffer = _CFDataCreateFixedMutableWithBuffer(&__kCFAllocatorSystemDefault, a4, Typed, v8);
      if (FixedMutableWithBuffer)
      {
        v12 = (__CFData *)FixedMutableWithBuffer;
        CFRelease(v8);
        CFDataSetLength(v12, a4);
        MutableBytePtr = CFDataGetMutableBytePtr(v12);
        uint64_t v14 = 0;
        size_t v15 = a4;
        do
        {
          ssize_t v16 = read(a3, &MutableBytePtr[v14], v15);
          ssize_t v17 = v16;
          if (v16 == -1)
          {
            if (*__error() != 4)
            {
              int v20 = *__error();
              bzero(&context, 0x400uLL);
              fcntl(a3, 50, &context);
              v21 = _CFPrefsDaemonLog();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
                -[CFPDPurgeableBuffer initWithFileDescriptor:size:]((uint64_t)&context, v20, v21);
              }
              v7->handle = v12;
              goto LABEL_20;
            }
          }
          else
          {
            v14 += v16;
            v15 -= v16;
          }
        }
        while (v17);
        v7->handle = v12;
        if (v14 == a4)
        {
          v7->safe = 1;
          return v7;
        }
        bzero(&context, 0x400uLL);
        fcntl(a3, 50, &context);
        v19 = _CFPrefsDaemonLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
          -[CFPDPurgeableBuffer initWithFileDescriptor:size:]((uint64_t)&context, v19);
        }
        goto LABEL_20;
      }
      CFAllocatorDeallocate((CFAllocatorRef)v8, v10);
    }
    CFRelease(v8);
LABEL_20:

    return 0;
  }
  return v7;
}

- (CFPDPurgeableBuffer)initWithPropertyList:(void *)a3
{
  uint64_t v10 = *(void *)off_1ECE0A5B0;
  v9.receiver = self;
  v9.super_class = (Class)CFPDPurgeableBuffer;
  objc_super v4 = [(CFPDPurgeableBuffer *)&v9 init];
  uint64_t v5 = v4;
  if (v4)
  {
    v8[0] = off_1ECE0A5A0;
    v8[1] = 3221225472;
    v8[2] = __44__CFPDPurgeableBuffer_initWithPropertyList___block_invoke;
    v8[3] = &unk_1ECDABEB0;
    v8[4] = v4;
    DataUsingExternalBufferAllocator = __CFBinaryPlistCreateDataUsingExternalBufferAllocator(a3, 0, 0, (uint64_t)v8, 0);
    if (DataUsingExternalBufferAllocator)
    {
      v5->handle = (__CFData *)DataUsingExternalBufferAllocator;
      v5->safe = 1;
    }
    else
    {

      return 0;
    }
  }
  return v5;
}

CFAllocatorRef __44__CFPDPurgeableBuffer_initWithPropertyList___block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t v5 = *(void *)off_1ECE0A5B0;
  if (a2 >= *(void *)off_1ECE0A708 >> 2)
  {
    v3 = *(void **)(a1 + 32);
    v4.version = 0;
    v4.info = v3;
    memset(&v4.retain, 0, 24);
    v4.allocate = (CFAllocatorAllocateCallBack)allocatePurgeable;
    v4.reallocate = 0;
    v4.deallocate = (CFAllocatorDeallocateCallBack)deallocatePurgeable;
    v4.preferredSize = 0;
    return CFAllocatorCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, &v4);
  }
  else
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 25) = 1;
    return (CFAllocatorRef)CFRetain(&__kCFAllocatorSystemDefault);
  }
}

- (void)endAccessing
{
  uint64_t v6 = *(void *)off_1ECE0A5B0;
  if (!self->usedMalloc && self->safe)
  {
    int v5 = 1;
    uint64_t v3 = *(unsigned int *)off_1ECE0A6C8;
    BytePtr = CFDataGetBytePtr(self->handle);
    MEMORY[0x185313090](v3, BytePtr, 0, &v5);
    self->safe = 0;
  }
}

- (void)initWithFileDescriptor:(uint64_t)a1 size:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *(void *)off_1ECE0A5B0;
  int v2 = 136380675;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_182B90000, a2, OS_LOG_TYPE_FAULT, "read an unexpected amount of data from %{private}s. This likely means that someone wrote directly to that file behind cfprefsd's back, which is unsupported.", (uint8_t *)&v2, 0xCu);
}

- (void)initWithFileDescriptor:(NSObject *)a3 size:.cold.2(uint64_t a1, int __errnum, NSObject *a3)
{
  uint64_t v8 = *(void *)off_1ECE0A5B0;
  int v4 = 136446466;
  uint64_t v5 = a1;
  __int16 v6 = 2082;
  int v7 = strerror(__errnum);
  _os_log_fault_impl(&dword_182B90000, a3, OS_LOG_TYPE_FAULT, "couldn't read preferences file %{public}s due to %{public}s", (uint8_t *)&v4, 0x16u);
}

- (void)beginAccessing
{
}

@end