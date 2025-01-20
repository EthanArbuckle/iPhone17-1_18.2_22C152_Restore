@interface NSCFOutputStream
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)_setCFClientFlags:(unint64_t)a3 callback:(void *)a4 context:(id *)a5;
- (BOOL)allowsWeakReference;
- (BOOL)hasSpaceAvailable;
- (BOOL)isEqual:(id)a3;
- (BOOL)retainWeakReference;
- (BOOL)setProperty:(id)a3 forKey:(id)a4;
- (NSCFOutputStream)initWithURL:(id)a3 append:(BOOL)a4;
- (NSCFOutputStream)retain;
- (id)delegate;
- (id)initToBuffer:(char *)a3 capacity:(unint64_t)a4;
- (id)initToFileAtPath:(id)a3 append:(BOOL)a4;
- (id)initToMemory;
- (id)propertyForKey:(id)a3;
- (id)streamError;
- (int64_t)write:(const char *)a3 maxLength:(unint64_t)a4;
- (unint64_t)hash;
- (void)_scheduleInCFRunLoop:(__CFRunLoop *)a3 forMode:(__CFString *)a4;
- (void)_unscheduleFromCFRunLoop:(__CFRunLoop *)a3 forMode:(__CFString *)a4;
- (void)removeFromRunLoop:(id)a3 forMode:(id)a4;
- (void)scheduleInRunLoop:(id)a3 forMode:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation NSCFOutputStream

+ (id)allocWithZone:(_NSZone *)a3
{
  return NSAllocateObject((Class)a1, 0, a3);
}

- (id)initToFileAtPath:(id)a3 append:(BOOL)a4
{
  BOOL v4 = a4;
  id result = (id)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:a3];
  if (result)
  {
    id v7 = result;
    v8 = [(NSCFOutputStream *)self initWithURL:result append:v4];

    return v8;
  }
  return result;
}

- (NSCFOutputStream)initWithURL:(id)a3 append:(BOOL)a4
{
  BOOL v4 = a4;
  NSDeallocateObject(self);
  if (a3)
  {
    CFWriteStreamRef v6 = CFWriteStreamCreateWithFile(0, (CFURLRef)a3);
    a3 = v6;
    if (v4) {
      CFWriteStreamSetProperty(v6, (CFStreamPropertyKey)*MEMORY[0x1E4F1D438], (CFTypeRef)*MEMORY[0x1E4F1CFD0]);
    }
  }
  return (NSCFOutputStream *)a3;
}

- (id)initToMemory
{
  NSDeallocateObject(self);
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];

  return CFWriteStreamCreateWithAllocatedBuffers(0, v2);
}

- (BOOL)isEqual:(id)a3
{
  if (!a3) {
    return 0;
  }
  if (self == a3) {
    return 1;
  }
  return _CFNonObjCEqual() != 0;
}

- (unint64_t)hash
{
  return MEMORY[0x1F40D8EB0](self, a2);
}

- (NSCFOutputStream)retain
{
  return (NSCFOutputStream *)MEMORY[0x1F40D8EC0](self, a2);
}

- (BOOL)allowsWeakReference
{
  return _CFIsDeallocating() == 0;
}

- (BOOL)retainWeakReference
{
  return _CFTryRetain() != 0;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (id)initToBuffer:(char *)a3 capacity:(unint64_t)a4
{
  NSDeallocateObject(self);

  return CFWriteStreamCreateWithBuffer(0, (UInt8 *)a3, a4);
}

- (id)delegate
{
  CFAllocatorRef v2 = (void *)[(id)_CFWriteStreamGetClient() retainedDelegate];

  return v2;
}

- (void)setDelegate:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    BOOL v4 = [[NSCFStreamWeakDelegateWrapper alloc] initWithDelegate:a3];
    v5.version = 0;
    v5.info = v4;
    v5.retain = (void *(__cdecl *)(void *))MEMORY[0x1E4F1C280];
    v5.release = (void (__cdecl *)(void *))MEMORY[0x1E4F1C278];
    v5.copyDescription = 0;
    CFWriteStreamSetClient((CFWriteStreamRef)self, 0x1DuLL, (CFWriteStreamClientCallBack)_outputStreamCallbackFunc, &v5);
  }
  else
  {
    CFWriteStreamSetClient((CFWriteStreamRef)self, 0, 0, 0);
  }
}

- (id)propertyForKey:(id)a3
{
  v3 = (void *)CFWriteStreamCopyProperty((CFWriteStreamRef)self, (CFStreamPropertyKey)a3);

  return v3;
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  return CFWriteStreamSetProperty((CFWriteStreamRef)self, (CFStreamPropertyKey)a4, a3) != 0;
}

- (void)scheduleInRunLoop:(id)a3 forMode:(id)a4
{
  if (a3)
  {
    uint64_t v6 = (__CFRunLoop *)[a3 getCFRunLoop];
    CFWriteStreamScheduleWithRunLoop((CFWriteStreamRef)self, v6, (CFRunLoopMode)a4);
  }
}

- (void)removeFromRunLoop:(id)a3 forMode:(id)a4
{
  if (a3)
  {
    uint64_t v6 = (__CFRunLoop *)[a3 getCFRunLoop];
    CFWriteStreamUnscheduleFromRunLoop((CFWriteStreamRef)self, v6, (CFRunLoopMode)a4);
  }
}

- (id)streamError
{
  CFErrorRef v2 = CFWriteStreamCopyError((CFWriteStreamRef)self);

  return v2;
}

- (int64_t)write:(const char *)a3 maxLength:(unint64_t)a4
{
  return CFWriteStreamWrite((CFWriteStreamRef)self, (const UInt8 *)a3, a4);
}

- (BOOL)hasSpaceAvailable
{
  return CFWriteStreamCanAcceptBytes((CFWriteStreamRef)self) != 0;
}

- (BOOL)_setCFClientFlags:(unint64_t)a3 callback:(void *)a4 context:(id *)a5
{
  return CFWriteStreamSetClient((CFWriteStreamRef)self, a3, (CFWriteStreamClientCallBack)a4, (CFStreamClientContext *)a5) != 0;
}

- (void)_scheduleInCFRunLoop:(__CFRunLoop *)a3 forMode:(__CFString *)a4
{
}

- (void)_unscheduleFromCFRunLoop:(__CFRunLoop *)a3 forMode:(__CFString *)a4
{
}

@end