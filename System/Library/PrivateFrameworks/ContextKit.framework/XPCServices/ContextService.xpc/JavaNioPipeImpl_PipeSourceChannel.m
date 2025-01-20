@interface JavaNioPipeImpl_PipeSourceChannel
+ (const)__metadata;
- (JavaNioPipeImpl_PipeSourceChannel)initWithJavaNioPipeImpl:(id)a3 withJavaNioChannelsSpiSelectorProvider:(id)a4 withJavaIoFileDescriptor:(id)a5;
- (id)getFD;
- (int)readWithJavaNioByteBuffer:(id)a3;
- (int64_t)readWithJavaNioByteBufferArray:(id)a3;
- (int64_t)readWithJavaNioByteBufferArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)dealloc;
- (void)implCloseSelectableChannel;
- (void)implConfigureBlockingWithBoolean:(BOOL)a3;
@end

@implementation JavaNioPipeImpl_PipeSourceChannel

- (JavaNioPipeImpl_PipeSourceChannel)initWithJavaNioPipeImpl:(id)a3 withJavaNioChannelsSpiSelectorProvider:(id)a4 withJavaIoFileDescriptor:(id)a5
{
  return self;
}

- (void)implCloseSelectableChannel
{
  v2 = *(JavaIoFileDescriptor **)((char *)&self->fd_ + 7);
  if (!v2) {
    JreThrowNullPointerException();
  }
  [v2 close];
}

- (void)implConfigureBlockingWithBoolean:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(JavaNioPipeImpl_PipeSourceChannel *)self getFD];
  LibcoreIoIoUtils_setBlockingWithJavaIoFileDescriptor_withBoolean_((uint64_t)v4, v3);
}

- (int)readWithJavaNioByteBuffer:(id)a3
{
  BOOL v3 = *(JavaIoFileDescriptor **)((char *)&self->fd_ + 7);
  if (!v3) {
    JreThrowNullPointerException();
  }
  return [v3 readWithJavaNioByteBuffer:a3];
}

- (int64_t)readWithJavaNioByteBufferArray:(id)a3
{
  BOOL v3 = *(JavaIoFileDescriptor **)((char *)&self->fd_ + 7);
  if (!v3) {
    JreThrowNullPointerException();
  }
  return (int64_t)[v3 readWithJavaNioByteBufferArray:a3];
}

- (int64_t)readWithJavaNioByteBufferArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  v5 = *(JavaIoFileDescriptor **)((char *)&self->fd_ + 7);
  if (!v5) {
    JreThrowNullPointerException();
  }
  return (int64_t)[v5 readWithJavaNioByteBufferArray:a3 withInt:*(void *)&a4 withInt:*(void *)&a5];
}

- (id)getFD
{
  return *(id *)((char *)&self->super.super.blockingLock_ + 7);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaNioPipeImpl_PipeSourceChannel;
  [(JavaNioChannelsSpiAbstractSelectableChannel *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1003FBC48;
}

@end