@interface NSStream(NSStream)
- (id)init;
- (void)close;
- (void)delegate;
- (void)open;
- (void)propertyForKey:()NSStream;
- (void)removeFromRunLoop:()NSStream forMode:;
- (void)scheduleInRunLoop:()NSStream forMode:;
- (void)setDelegate:()NSStream;
- (void)setProperty:()NSStream forKey:;
- (void)streamError;
- (void)streamStatus;
@end

@implementation NSStream(NSStream)

- (id)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = a1;
  v3.super_class = (Class)NSStream_0;
  id v1 = objc_msgSendSuper2(&v3, sel_init);
  if (v1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      _CFReadStreamInitialize();
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        _CFWriteStreamInitialize();
      }
    }
  }
  return v1;
}

- (void)open
{
  uint64_t v4 = NSClassFromString((NSString *)@"NSStream");

  NSRequestConcreteImplementation(a1, a2, v4);
}

- (void)close
{
  uint64_t v4 = NSClassFromString((NSString *)@"NSStream");

  NSRequestConcreteImplementation(a1, a2, v4);
}

- (void)delegate
{
  uint64_t v4 = NSClassFromString((NSString *)@"NSStream");
  NSRequestConcreteImplementation(a1, a2, v4);
}

- (void)setDelegate:()NSStream
{
  uint64_t v4 = NSClassFromString((NSString *)@"NSStream");

  NSRequestConcreteImplementation(a1, a2, v4);
}

- (void)propertyForKey:()NSStream
{
  uint64_t v4 = NSClassFromString((NSString *)@"NSStream");
  NSRequestConcreteImplementation(a1, a2, v4);
}

- (void)setProperty:()NSStream forKey:
{
  uint64_t v4 = NSClassFromString((NSString *)@"NSStream");
  NSRequestConcreteImplementation(a1, a2, v4);
}

- (void)scheduleInRunLoop:()NSStream forMode:
{
  uint64_t v4 = NSClassFromString((NSString *)@"NSStream");

  NSRequestConcreteImplementation(a1, a2, v4);
}

- (void)removeFromRunLoop:()NSStream forMode:
{
  uint64_t v4 = NSClassFromString((NSString *)@"NSStream");

  NSRequestConcreteImplementation(a1, a2, v4);
}

- (void)streamStatus
{
  uint64_t v4 = NSClassFromString((NSString *)@"NSStream");
  NSRequestConcreteImplementation(a1, a2, v4);
}

- (void)streamError
{
  uint64_t v4 = NSClassFromString((NSString *)@"NSStream");
  NSRequestConcreteImplementation(a1, a2, v4);
}

@end