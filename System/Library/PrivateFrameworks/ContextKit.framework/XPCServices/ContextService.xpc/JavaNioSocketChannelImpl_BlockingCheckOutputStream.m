@interface JavaNioSocketChannelImpl_BlockingCheckOutputStream
+ (const)__metadata;
- (JavaNioSocketChannelImpl_BlockingCheckOutputStream)initWithJavaIoOutputStream:(id)a3 withJavaNioChannelsSocketChannel:(id)a4;
- (id)checkBlocking;
- (void)close;
- (void)dealloc;
- (void)writeWithByteArray:(id)a3;
- (void)writeWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)writeWithInt:(int)a3;
@end

@implementation JavaNioSocketChannelImpl_BlockingCheckOutputStream

- (JavaNioSocketChannelImpl_BlockingCheckOutputStream)initWithJavaIoOutputStream:(id)a3 withJavaNioChannelsSocketChannel:(id)a4
{
  return self;
}

- (void)writeWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  -[JavaNioSocketChannelImpl_BlockingCheckOutputStream checkBlocking]_0((uint64_t)self);
  out = self->super.out_;
  if (!out) {
    JreThrowNullPointerException();
  }
  [(JavaIoOutputStream *)out writeWithByteArray:a3 withInt:v6 withInt:v5];
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

- (void)writeWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  -[JavaNioSocketChannelImpl_BlockingCheckOutputStream checkBlocking]_0((uint64_t)self);
  out = self->super.out_;
  if (!out) {
    JreThrowNullPointerException();
  }
  [(JavaIoOutputStream *)out writeWithInt:v3];
}

- (void)writeWithByteArray:(id)a3
{
  -[JavaNioSocketChannelImpl_BlockingCheckOutputStream checkBlocking]_0((uint64_t)self);
  out = self->super.out_;
  if (!out) {
    JreThrowNullPointerException();
  }
  [(JavaIoOutputStream *)out writeWithByteArray:a3];
}

- (void)close
{
  v4.receiver = self;
  v4.super_class = (Class)JavaNioSocketChannelImpl_BlockingCheckOutputStream;
  [(JavaIoFilterOutputStream *)&v4 close];
  channel = self->channel_;
  if (!channel) {
    JreThrowNullPointerException();
  }
  [(JavaNioChannelsSpiAbstractInterruptibleChannel *)channel close];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaNioSocketChannelImpl_BlockingCheckOutputStream;
  [(JavaIoFilterOutputStream *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10043B2A0;
}

@end