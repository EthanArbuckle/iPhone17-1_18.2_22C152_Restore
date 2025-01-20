@interface NSCFInputStream
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)_setCFClientFlags:(unint64_t)a3 callback:(void *)a4 context:(id *)a5;
- (BOOL)allowsWeakReference;
- (BOOL)getBuffer:(char *)a3 length:(unint64_t *)a4;
- (BOOL)hasBytesAvailable;
- (BOOL)isEqual:(id)a3;
- (BOOL)retainWeakReference;
- (BOOL)setProperty:(id)a3 forKey:(id)a4;
- (NSCFInputStream)initWithData:(id)a3;
- (NSCFInputStream)initWithFileAtPath:(id)a3;
- (NSCFInputStream)initWithURL:(id)a3;
- (NSCFInputStream)retain;
- (id)delegate;
- (id)propertyForKey:(id)a3;
- (id)streamError;
- (int64_t)read:(char *)a3 maxLength:(unint64_t)a4;
- (unint64_t)hash;
- (void)_scheduleInCFRunLoop:(__CFRunLoop *)a3 forMode:(__CFString *)a4;
- (void)_unscheduleFromCFRunLoop:(__CFRunLoop *)a3 forMode:(__CFString *)a4;
- (void)removeFromRunLoop:(id)a3 forMode:(id)a4;
- (void)scheduleInRunLoop:(id)a3 forMode:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation NSCFInputStream

+ (id)allocWithZone:(_NSZone *)a3
{
  return NSAllocateObject((Class)a1, 0, a3);
}

- (NSCFInputStream)initWithData:(id)a3
{
  NSDeallocateObject(self);

  return (NSCFInputStream *)MEMORY[0x1F40D7FB8](0, a3);
}

- (NSCFInputStream)initWithURL:(id)a3
{
  NSDeallocateObject(self);
  result = 0;
  if (a3)
  {
    return (NSCFInputStream *)CFReadStreamCreateWithFile(0, (CFURLRef)a3);
  }
  return result;
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

- (NSCFInputStream)retain
{
  return (NSCFInputStream *)MEMORY[0x1F40D8EC0](self, a2);
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

- (NSCFInputStream)initWithFileAtPath:(id)a3
{
  uint64_t v4 = [objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:a3];
  if (v4)
  {
    v5 = (void *)v4;
    v6 = [(NSCFInputStream *)self initWithURL:v4];

    return v6;
  }
  else
  {
    NSDeallocateObject(self);
    return 0;
  }
}

- (id)delegate
{
  v2 = (void *)[(id)_CFReadStreamGetClient() retainedDelegate];

  return v2;
}

- (void)setDelegate:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v4 = [[NSCFStreamWeakDelegateWrapper alloc] initWithDelegate:a3];
    v5.version = 0;
    v5.info = v4;
    v5.retain = (void *(__cdecl *)(void *))MEMORY[0x1E4F1C280];
    v5.release = (void (__cdecl *)(void *))MEMORY[0x1E4F1C278];
    v5.copyDescription = 0;
    CFReadStreamSetClient((CFReadStreamRef)self, 0x1BuLL, (CFReadStreamClientCallBack)_inputStreamCallbackFunc, &v5);
  }
  else
  {
    CFReadStreamSetClient((CFReadStreamRef)self, 0, 0, 0);
  }
}

- (id)propertyForKey:(id)a3
{
  v3 = (void *)CFReadStreamCopyProperty((CFReadStreamRef)self, (CFStreamPropertyKey)a3);

  return v3;
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  return CFReadStreamSetProperty((CFReadStreamRef)self, (CFStreamPropertyKey)a4, a3) != 0;
}

- (void)scheduleInRunLoop:(id)a3 forMode:(id)a4
{
  if (a3)
  {
    uint64_t v6 = (__CFRunLoop *)[a3 getCFRunLoop];
    CFReadStreamScheduleWithRunLoop((CFReadStreamRef)self, v6, (CFRunLoopMode)a4);
  }
}

- (void)removeFromRunLoop:(id)a3 forMode:(id)a4
{
  if (a3)
  {
    uint64_t v6 = (__CFRunLoop *)[a3 getCFRunLoop];
    CFReadStreamUnscheduleFromRunLoop((CFReadStreamRef)self, v6, (CFRunLoopMode)a4);
  }
}

- (id)streamError
{
  CFErrorRef v2 = CFReadStreamCopyError((CFReadStreamRef)self);

  return v2;
}

- (int64_t)read:(char *)a3 maxLength:(unint64_t)a4
{
  return CFReadStreamRead((CFReadStreamRef)self, (UInt8 *)a3, a4);
}

- (BOOL)getBuffer:(char *)a3 length:(unint64_t *)a4
{
  Buffer = (char *)CFReadStreamGetBuffer((CFReadStreamRef)self, 0, (CFIndex *)a4);
  unint64_t v7 = *a4;
  if (*a4) {
    *a3 = Buffer;
  }
  return v7 != 0;
}

- (BOOL)hasBytesAvailable
{
  return CFReadStreamHasBytesAvailable((CFReadStreamRef)self) != 0;
}

- (BOOL)_setCFClientFlags:(unint64_t)a3 callback:(void *)a4 context:(id *)a5
{
  return CFReadStreamSetClient((CFReadStreamRef)self, a3, (CFReadStreamClientCallBack)a4, (CFStreamClientContext *)a5) != 0;
}

- (void)_scheduleInCFRunLoop:(__CFRunLoop *)a3 forMode:(__CFString *)a4
{
}

- (void)_unscheduleFromCFRunLoop:(__CFRunLoop *)a3 forMode:(__CFString *)a4
{
}

@end