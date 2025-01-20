@interface JavaIoFileInputStream
+ (const)__metadata;
- (JavaIoFileInputStream)initWithJavaIoFile:(id)a3;
- (JavaIoFileInputStream)initWithJavaIoFileDescriptor:(id)a3;
- (JavaIoFileInputStream)initWithNSString:(id)a3;
- (id)getChannel;
- (id)getFD;
- (int)available;
- (int)readWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (int64_t)skipWithLong:(int64_t)a3;
- (void)close;
- (void)dealloc;
@end

@implementation JavaIoFileInputStream

- (JavaIoFileInputStream)initWithJavaIoFile:(id)a3
{
  return self;
}

- (JavaIoFileInputStream)initWithJavaIoFileDescriptor:(id)a3
{
  return self;
}

- (JavaIoFileInputStream)initWithNSString:(id)a3
{
  v4 = new_JavaIoFile_initWithNSString_(a3);
  JavaIoFileInputStream_initWithJavaIoFile_((uint64_t)self, v4);
  return self;
}

- (int)available
{
  return LibcoreIoIoBridge_availableWithJavaIoFileDescriptor_((uint64_t)self->fd_);
}

- (void)close
{
  guard = self->guard_;
  if (!guard) {
    JreThrowNullPointerException();
  }
  [(DalvikSystemCloseGuard *)guard close];
  objc_sync_enter(self);
  channel = self->channel_;
  if (channel) {
    [(JavaNioChannelsSpiAbstractInterruptibleChannel *)channel close];
  }
  if (self->shouldClose_)
  {
    LibcoreIoIoUtils_closeWithJavaIoFileDescriptor_(self->fd_);
  }
  else
  {
    v5 = new_JavaIoFileDescriptor_init();
    JreStrongAssignAndConsume((id *)&self->fd_, v5);
  }
  objc_sync_exit(self);
}

- (void)dealloc
{
  guard = self->guard_;
  if (guard) {
    [(DalvikSystemCloseGuard *)guard warnIfOpen];
  }
  [(JavaIoFileInputStream *)self close];

  v4.receiver = self;
  v4.super_class = (Class)JavaIoFileInputStream;
  [(JavaIoFileInputStream *)&v4 dealloc];
}

- (id)getChannel
{
  objc_sync_enter(self);
  channel = self->channel_;
  if (!channel)
  {
    objc_super v4 = JavaNioNioUtils_newFileChannelWithId_withJavaIoFileDescriptor_withInt_(self, self->fd_, 0);
    JreStrongAssign((id *)&self->channel_, v4);
    channel = self->channel_;
  }
  objc_sync_exit(self);
  return channel;
}

- (id)getFD
{
  return self->fd_;
}

- (int)readWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  return LibcoreIoIoBridge_readWithJavaIoFileDescriptor_withByteArray_withInt_withInt_((uint64_t)self->fd_, (uint64_t)a3, *(uint64_t *)&a4, *(uint64_t *)&a5);
}

- (int64_t)skipWithLong:(int64_t)a3
{
  if (a3 < 0)
  {
    CFStringRef v11 = JreStrcat("$J", (uint64_t)a2, a3, v3, v4, v5, v6, v7, @"byteCount < 0: ");
    v12 = new_JavaIoIOException_initWithNSString_((uint64_t)v11);
    objc_exception_throw(v12);
  }
  if ((atomic_load_explicit(LibcoreIoLibcore__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (!LibcoreIoLibcore_os_) {
    JreThrowNullPointerException();
  }
  [(id)LibcoreIoLibcore_os_ lseekWithJavaIoFileDescriptor:self->fd_ withLong:a3 withInt:1];
  return a3;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10040FDC0;
}

@end