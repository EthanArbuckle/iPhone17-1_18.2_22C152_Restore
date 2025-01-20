@interface __NSCFOutputStream
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)_isDeallocating;
- (BOOL)_setCFClientFlags:(unint64_t)a3 callback:(void *)a4 context:(id *)a5;
- (BOOL)_tryRetain;
- (BOOL)hasSpaceAvailable;
- (BOOL)isEqual:(id)a3;
- (BOOL)setProperty:(id)a3 forKey:(id)a4;
- (__NSCFOutputStream)initWithURL:(id)a3 append:(BOOL)a4;
- (id)delegate;
- (id)initToBuffer:(char *)a3 capacity:(unint64_t)a4;
- (id)initToFileAtPath:(id)a3 append:(BOOL)a4;
- (id)initToMemory;
- (id)propertyForKey:(id)a3;
- (id)streamError;
- (int64_t)write:(const char *)a3 maxLength:(unint64_t)a4;
- (void)_scheduleInCFRunLoop:(__CFRunLoop *)a3 forMode:(__CFString *)a4;
- (void)_unscheduleFromCFRunLoop:(__CFRunLoop *)a3 forMode:(__CFString *)a4;
- (void)removeFromRunLoop:(id)a3 forMode:(id)a4;
- (void)scheduleInRunLoop:(id)a3 forMode:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation __NSCFOutputStream

- (int64_t)write:(const char *)a3 maxLength:(unint64_t)a4
{
  return CFWriteStreamWrite((CFWriteStreamRef)self, (const UInt8 *)a3, a4);
}

- (void)setDelegate:(id)a3
{
  uint64_t v6 = *(void *)off_1ECE0A5B0;
  if (a3)
  {
    v4 = [[__NSCFStreamWeakDelegateWrapper alloc] initWithDelegate:a3];
    v5.version = 0;
    v5.info = v4;
    v5.retain = (void *(__cdecl *)(void *))CFRetain;
    v5.release = (void (__cdecl *)(void *))CFRelease;
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

- (BOOL)isEqual:(id)a3
{
  if (!a3) {
    return 0;
  }
  if (self == a3) {
    return 1;
  }
  return _CFNonObjCEqual((unint64_t *)self, (unint64_t)a3) != 0;
}

- (BOOL)_tryRetain
{
  return _CFTryRetain((unint64_t *)self) != 0;
}

- (BOOL)_isDeallocating
{
  return _CFIsDeallocating((uint64_t)self) != 0;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return 0;
}

- (id)initToMemory
{
  [(__NSCFOutputStream *)self dealloc];

  return CFWriteStreamCreateWithAllocatedBuffers(0, 0);
}

- (id)initToBuffer:(char *)a3 capacity:(unint64_t)a4
{
  [(__NSCFOutputStream *)self dealloc];

  return CFWriteStreamCreateWithBuffer(0, (UInt8 *)a3, a4);
}

- (id)initToFileAtPath:(id)a3 append:(BOOL)a4
{
  BOOL v4 = a4;
  id result = [[NSURL alloc] initFileURLWithPath:a3];
  if (result)
  {
    id v7 = result;
    v8 = [(__NSCFOutputStream *)self initWithURL:result append:v4];

    return v8;
  }
  return result;
}

- (__NSCFOutputStream)initWithURL:(id)a3 append:(BOOL)a4
{
  BOOL v4 = a4;
  [(__NSCFOutputStream *)self dealloc];
  if (a3)
  {
    CFWriteStreamRef v6 = CFWriteStreamCreateWithFile(0, (CFURLRef)a3);
    a3 = v6;
    if (v4) {
      CFWriteStreamSetProperty(v6, @"kCFStreamPropertyAppendToFile", &__kCFBooleanTrue);
    }
  }
  return (__NSCFOutputStream *)a3;
}

- (id)delegate
{
  v2 = (void *)[(id)_CFWriteStreamGetClient((uint64_t)self) retainedDelegate];

  return v2;
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  return CFWriteStreamSetProperty((CFWriteStreamRef)self, (CFStreamPropertyKey)a4, a3) != 0;
}

- (void)scheduleInRunLoop:(id)a3 forMode:(id)a4
{
  if (a3)
  {
    CFWriteStreamRef v6 = (__CFRunLoop *)[a3 getCFRunLoop];
    CFWriteStreamScheduleWithRunLoop((CFWriteStreamRef)self, v6, (CFRunLoopMode)a4);
  }
}

- (void)removeFromRunLoop:(id)a3 forMode:(id)a4
{
  if (a3)
  {
    CFWriteStreamRef v6 = (__CFRunLoop *)[a3 getCFRunLoop];
    CFWriteStreamUnscheduleFromRunLoop((CFWriteStreamRef)self, v6, (CFRunLoopMode)a4);
  }
}

- (id)streamError
{
  CFErrorRef v2 = CFWriteStreamCopyError((CFWriteStreamRef)self);

  return v2;
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