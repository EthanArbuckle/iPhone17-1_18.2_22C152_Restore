@interface JavaNioSocketChannelImpl_BlockingCheckInputStream
+ (const)__metadata;
- (JavaNioSocketChannelImpl_BlockingCheckInputStream)initWithJavaIoInputStream:(id)a3 withJavaNioChannelsSocketChannel:(id)a4;
- (id)checkBlocking;
- (int)read;
- (int)readWithByteArray:(id)a3;
- (int)readWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)close;
- (void)dealloc;
@end

@implementation JavaNioSocketChannelImpl_BlockingCheckInputStream

- (JavaNioSocketChannelImpl_BlockingCheckInputStream)initWithJavaIoInputStream:(id)a3 withJavaNioChannelsSocketChannel:(id)a4
{
  return self;
}

- (int)read
{
  -[JavaNioSocketChannelImpl_BlockingCheckInputStream checkBlocking]_0((uint64_t)self);
  v3 = (void *)atomic_load((unint64_t *)&self->super.in_);
  if (!v3) {
    JreThrowNullPointerException();
  }
  return [v3 read];
}

- (id)checkBlocking
{
  v1 = *(void **)(a1 + 16);
  if (!v1) {
    JreThrowNullPointerException();
  }
  id result = [v1 isBlocking];
  if ((result & 1) == 0)
  {
    v3 = new_JavaNioChannelsIllegalBlockingModeException_init();
    objc_exception_throw(v3);
  }
  return result;
}

- (int)readWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  -[JavaNioSocketChannelImpl_BlockingCheckInputStream checkBlocking]_0((uint64_t)self);
  v9 = (void *)atomic_load((unint64_t *)&self->super.in_);
  if (!v9) {
    JreThrowNullPointerException();
  }
  return [v9 readWithByteArray:a3 withInt:v6 withInt:v5];
}

- (int)readWithByteArray:(id)a3
{
  -[JavaNioSocketChannelImpl_BlockingCheckInputStream checkBlocking]_0((uint64_t)self);
  uint64_t v5 = (void *)atomic_load((unint64_t *)&self->super.in_);
  if (!v5) {
    JreThrowNullPointerException();
  }
  return [v5 readWithByteArray:a3];
}

- (void)close
{
  v4.receiver = self;
  v4.super_class = (Class)JavaNioSocketChannelImpl_BlockingCheckInputStream;
  [(JavaIoFilterInputStream *)&v4 close];
  channel = self->channel_;
  if (!channel) {
    JreThrowNullPointerException();
  }
  [(JavaNioChannelsSpiAbstractInterruptibleChannel *)channel close];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaNioSocketChannelImpl_BlockingCheckInputStream;
  [(JavaIoFilterInputStream *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10043B468;
}

@end