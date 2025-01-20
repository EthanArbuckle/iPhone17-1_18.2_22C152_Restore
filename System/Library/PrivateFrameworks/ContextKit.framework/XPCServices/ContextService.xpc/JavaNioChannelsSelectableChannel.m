@interface JavaNioChannelsSelectableChannel
+ (const)__metadata;
- (BOOL)isBlocking;
- (BOOL)isRegistered;
- (JavaNioChannelsSelectableChannel)init;
- (id)blockingLock;
- (id)configureBlockingWithBoolean:(BOOL)a3;
- (id)keyForWithJavaNioChannelsSelector:(id)a3;
- (id)provider;
- (id)register__WithJavaNioChannelsSelector:(id)a3 withInt:(int)a4;
- (id)register__WithJavaNioChannelsSelector:(id)a3 withInt:(int)a4 withId:(id)a5;
- (int)validOps;
@end

@implementation JavaNioChannelsSelectableChannel

- (JavaNioChannelsSelectableChannel)init
{
  return self;
}

- (id)blockingLock
{
  return 0;
}

- (id)configureBlockingWithBoolean:(BOOL)a3
{
  return 0;
}

- (BOOL)isBlocking
{
  return 0;
}

- (BOOL)isRegistered
{
  return 0;
}

- (id)keyForWithJavaNioChannelsSelector:(id)a3
{
  return 0;
}

- (id)provider
{
  return 0;
}

- (id)register__WithJavaNioChannelsSelector:(id)a3 withInt:(int)a4
{
  return [(JavaNioChannelsSelectableChannel *)self register__WithJavaNioChannelsSelector:a3 withInt:*(void *)&a4 withId:0];
}

- (id)register__WithJavaNioChannelsSelector:(id)a3 withInt:(int)a4 withId:(id)a5
{
  return 0;
}

- (int)validOps
{
  return 0;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10041C8F8;
}

@end