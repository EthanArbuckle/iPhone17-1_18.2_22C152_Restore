@interface NSPipe
+ (NSPipe)allocWithZone:(_NSZone *)a3;
+ (NSPipe)pipe;
- (NSFileHandle)fileHandleForReading;
- (NSFileHandle)fileHandleForWriting;
- (NSPipe)init;
@end

@implementation NSPipe

- (NSPipe)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)NSPipe;
  return [(NSPipe *)&v3 init];
}

+ (NSPipe)allocWithZone:(_NSZone *)a3
{
  if (NSPipe == a1) {
    a1 = self;
  }

  return (NSPipe *)NSAllocateObject((Class)a1, 0, a3);
}

+ (NSPipe)pipe
{
  v2 = (void *)[objc_allocWithZone((Class)NSPipe) init];

  return (NSPipe *)v2;
}

- (NSFileHandle)fileHandleForReading
{
  uint64_t v4 = NSClassFromString((NSString *)@"NSPipe");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSFileHandle)fileHandleForWriting
{
  uint64_t v4 = NSClassFromString((NSString *)@"NSPipe");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

@end