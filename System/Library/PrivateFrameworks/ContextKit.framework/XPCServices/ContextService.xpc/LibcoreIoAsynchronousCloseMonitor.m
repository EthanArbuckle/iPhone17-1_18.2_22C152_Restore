@interface LibcoreIoAsynchronousCloseMonitor
+ (const)__metadata;
+ (id)newAsynchronousSocketCloseMonitorWithInt:(int)a3;
+ (void)signalBlockedThreadsWithJavaIoFileDescriptor:(id)a3;
@end

@implementation LibcoreIoAsynchronousCloseMonitor

+ (void)signalBlockedThreadsWithJavaIoFileDescriptor:(id)a3
{
  id v3 = [a3 getInt$];
  +[AsynchronousSocketCloseMonitor signalBlockedThreads:v3];
}

+ (id)newAsynchronousSocketCloseMonitorWithInt:(int)a3
{
  id v3 = [[AsynchronousSocketCloseMonitor alloc] initWithFileDescriptor:*(void *)&a3];
  return v3;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004809E0;
}

@end