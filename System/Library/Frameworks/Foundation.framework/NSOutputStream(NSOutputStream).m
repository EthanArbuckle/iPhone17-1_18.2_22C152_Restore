@interface NSOutputStream(NSOutputStream)
+ (NSCFOutputStream)allocWithZone:()NSOutputStream;
+ (id)outputStreamToBuffer:()NSOutputStream capacity:;
+ (id)outputStreamToFileAtPath:()NSOutputStream append:;
+ (id)outputStreamToMemory;
+ (id)outputStreamWithURL:()NSOutputStream append:;
- (id)dealloc;
- (id)initToBuffer:()NSOutputStream capacity:;
- (id)initToMemory;
- (id)initWithURL:()NSOutputStream append:;
- (void)hasSpaceAvailable;
- (void)write:()NSOutputStream maxLength:;
@end

@implementation NSOutputStream(NSOutputStream)

+ (id)outputStreamToMemory
{
  v1 = (void *)[objc_allocWithZone(a1) initToMemory];

  return v1;
}

+ (id)outputStreamToFileAtPath:()NSOutputStream append:
{
  v4 = (void *)[objc_allocWithZone(a1) initToFileAtPath:a3 append:a4];

  return v4;
}

+ (NSCFOutputStream)allocWithZone:()NSOutputStream
{
  if ((objc_class *)MEMORY[0x1E4F1CAA8] == a1) {
    return +[NSCFOutputStream allocWithZone:](NSCFOutputStream, "allocWithZone:");
  }
  else {
    return (NSCFOutputStream *)NSAllocateObject(a1, 0, a3);
  }
}

- (void)write:()NSOutputStream maxLength:
{
  v4 = NSClassFromString((NSString *)@"NSStream");
  NSRequestConcreteImplementation(a1, a2, v4);
}

- (void)hasSpaceAvailable
{
  v4 = NSClassFromString((NSString *)@"NSStream");
  NSRequestConcreteImplementation(a1, a2, v4);
}

+ (id)outputStreamToBuffer:()NSOutputStream capacity:
{
  v4 = (void *)[objc_allocWithZone(a1) initToBuffer:a3 capacity:a4];

  return v4;
}

+ (id)outputStreamWithURL:()NSOutputStream append:
{
  v4 = (void *)[objc_allocWithZone(a1) initWithURL:a3 append:a4];

  return v4;
}

- (id)initToMemory
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2.receiver = a1;
  v2.super_class = (Class)NSOutputStream_0;
  return objc_msgSendSuper2(&v2, sel_init);
}

- (id)initToBuffer:()NSOutputStream capacity:
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2.receiver = a1;
  v2.super_class = (Class)NSOutputStream_0;
  return objc_msgSendSuper2(&v2, sel_init);
}

- (id)initWithURL:()NSOutputStream append:
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2.receiver = a1;
  v2.super_class = (Class)NSOutputStream_0;
  return objc_msgSendSuper2(&v2, sel_init);
}

- (id)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  MEMORY[0x185306A10]();
  v3.receiver = a1;
  v3.super_class = (Class)NSOutputStream_0;
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

@end