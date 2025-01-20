@interface NSInputStream(NSInputStream)
+ (NSCFInputStream)allocWithZone:()NSInputStream;
+ (id)inputStreamWithData:()NSInputStream;
+ (id)inputStreamWithFileAtPath:()NSInputStream;
+ (id)inputStreamWithURL:()NSInputStream;
- (id)dealloc;
- (id)initWithData:()NSInputStream;
- (id)initWithURL:()NSInputStream;
- (void)getBuffer:()NSInputStream length:;
- (void)hasBytesAvailable;
- (void)read:()NSInputStream maxLength:;
@end

@implementation NSInputStream(NSInputStream)

+ (id)inputStreamWithURL:()NSInputStream
{
  v3 = (void *)[objc_allocWithZone(a1) initWithURL:a3];

  return v3;
}

+ (id)inputStreamWithData:()NSInputStream
{
  v3 = (void *)[objc_allocWithZone(a1) initWithData:a3];

  return v3;
}

+ (NSCFInputStream)allocWithZone:()NSInputStream
{
  if ((objc_class *)MEMORY[0x1E4F1CA10] == a1) {
    return +[NSCFInputStream allocWithZone:](NSCFInputStream, "allocWithZone:");
  }
  else {
    return (NSCFInputStream *)NSAllocateObject(a1, 0, a3);
  }
}

+ (id)inputStreamWithFileAtPath:()NSInputStream
{
  v3 = (void *)[objc_allocWithZone(a1) initWithFileAtPath:a3];

  return v3;
}

- (id)initWithData:()NSInputStream
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2.receiver = a1;
  v2.super_class = (Class)NSInputStream_0;
  return objc_msgSendSuper2(&v2, sel_init);
}

- (id)initWithURL:()NSInputStream
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2.receiver = a1;
  v2.super_class = (Class)NSInputStream_0;
  return objc_msgSendSuper2(&v2, sel_init);
}

- (id)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  MEMORY[0x185306630]();
  v3.receiver = a1;
  v3.super_class = (Class)NSInputStream_0;
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

- (void)read:()NSInputStream maxLength:
{
  uint64_t v4 = NSClassFromString((NSString *)@"NSStream");
  NSRequestConcreteImplementation(a1, a2, v4);
}

- (void)getBuffer:()NSInputStream length:
{
  uint64_t v4 = NSClassFromString((NSString *)@"NSStream");
  NSRequestConcreteImplementation(a1, a2, v4);
}

- (void)hasBytesAvailable
{
  uint64_t v4 = NSClassFromString((NSString *)@"NSStream");
  NSRequestConcreteImplementation(a1, a2, v4);
}

@end