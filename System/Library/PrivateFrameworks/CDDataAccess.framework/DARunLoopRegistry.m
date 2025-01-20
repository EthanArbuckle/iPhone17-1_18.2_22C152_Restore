@interface DARunLoopRegistry
+ (NSRunLoop)sharedRunLoop;
@end

@implementation DARunLoopRegistry

+ (NSRunLoop)sharedRunLoop
{
  return (NSRunLoop *)[MEMORY[0x1E4F1CAC0] mainRunLoop];
}

@end