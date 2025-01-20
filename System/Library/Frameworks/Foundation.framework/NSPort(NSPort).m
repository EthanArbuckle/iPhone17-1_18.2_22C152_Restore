@interface NSPort(NSPort)
+ (id)allocWithZone:()NSPort;
+ (id)port;
+ (id)portWithMachPort:()NSPort;
- (uint64_t)classForPortCoder;
- (uint64_t)initWithCoder:()NSPort;
- (uint64_t)initWithMachPort:()NSPort;
- (uint64_t)machPort;
- (uint64_t)replacementObjectForCoder:()NSPort;
- (uint64_t)reservedSpaceLength;
- (uint64_t)sendBeforeDate:()NSPort msgid:components:from:reserved:;
- (void)classForCoder;
- (void)delegate;
- (void)invalidate;
- (void)isValid;
- (void)sendBeforeDate:()NSPort components:from:reserved:;
- (void)setDelegate:()NSPort;
@end

@implementation NSPort(NSPort)

+ (id)allocWithZone:()NSPort
{
  if ((objc_class *)MEMORY[0x1E4F1CAB8] == a1) {
    return (id)objc_msgSend(MEMORY[0x1E4F1CA30], "allocWithZone:");
  }
  else {
    return NSAllocateObject(a1, 0, a3);
  }
}

+ (id)port
{
  v1 = (void *)[objc_allocWithZone(a1) init];

  return v1;
}

+ (id)portWithMachPort:()NSPort
{
  v3 = (void *)[objc_allocWithZone(MEMORY[0x1E4F1CA30]) initWithMachPort:a3];

  return v3;
}

- (uint64_t)initWithMachPort:()NSPort
{
  return 0;
}

- (void)invalidate
{
  v4 = NSClassFromString((NSString *)@"NSPort");

  NSRequestConcreteImplementation(a1, a2, v4);
}

- (void)isValid
{
  v4 = NSClassFromString((NSString *)@"NSPort");
  NSRequestConcreteImplementation(a1, a2, v4);
}

- (uint64_t)machPort
{
  return 0;
}

- (void)setDelegate:()NSPort
{
  v4 = NSClassFromString((NSString *)@"NSPort");

  NSRequestConcreteImplementation(a1, a2, v4);
}

- (void)delegate
{
  v4 = NSClassFromString((NSString *)@"NSPort");
  NSRequestConcreteImplementation(a1, a2, v4);
}

- (uint64_t)reservedSpaceLength
{
  return 0;
}

- (uint64_t)replacementObjectForCoder:()NSPort
{
  return 0;
}

- (uint64_t)classForPortCoder
{
  return self;
}

- (void)classForCoder
{
  uint64_t v0 = objc_opt_class();
  v1 = objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ asked to archive; %@ only codes for port coding (Distributed Objects).",
                   v0,
                   objc_opt_class()),
                 0);
  objc_exception_throw(v1);
}

- (uint64_t)initWithCoder:()NSPort
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2.receiver = a1;
  v2.super_class = (Class)NSPort_0;
  objc_msgSendSuper2(&v2, sel_dealloc);
  return 0;
}

- (void)sendBeforeDate:()NSPort components:from:reserved:
{
  v4 = NSClassFromString((NSString *)@"NSPort");
  NSRequestConcreteImplementation(a1, a2, v4);
}

- (uint64_t)sendBeforeDate:()NSPort msgid:components:from:reserved:
{
  return [a1 sendBeforeDate:a3 components:a5 from:a6 reserved:a7];
}

@end