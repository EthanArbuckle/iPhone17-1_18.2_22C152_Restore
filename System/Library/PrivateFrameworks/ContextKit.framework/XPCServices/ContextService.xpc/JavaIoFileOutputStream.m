@interface JavaIoFileOutputStream
+ (const)__metadata;
- (JavaIoFileOutputStream)initWithJavaIoFile:(id)a3;
- (JavaIoFileOutputStream)initWithJavaIoFile:(id)a3 withBoolean:(BOOL)a4;
- (JavaIoFileOutputStream)initWithJavaIoFileDescriptor:(id)a3;
- (JavaIoFileOutputStream)initWithNSString:(id)a3;
- (JavaIoFileOutputStream)initWithNSString:(id)a3 withBoolean:(BOOL)a4;
- (id)getChannel;
- (id)getFD;
- (void)close;
- (void)dealloc;
- (void)writeWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)writeWithInt:(int)a3;
@end

@implementation JavaIoFileOutputStream

- (JavaIoFileOutputStream)initWithJavaIoFile:(id)a3
{
  return self;
}

- (JavaIoFileOutputStream)initWithJavaIoFile:(id)a3 withBoolean:(BOOL)a4
{
  return self;
}

- (JavaIoFileOutputStream)initWithJavaIoFileDescriptor:(id)a3
{
  return self;
}

- (JavaIoFileOutputStream)initWithNSString:(id)a3
{
  return self;
}

- (JavaIoFileOutputStream)initWithNSString:(id)a3 withBoolean:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = new_JavaIoFile_initWithNSString_(a3);
  JavaIoFileOutputStream_initWithJavaIoFile_withBoolean_((uint64_t)self, v6, v4);
  return self;
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
  [(JavaIoFileOutputStream *)self close];

  v4.receiver = self;
  v4.super_class = (Class)JavaIoFileOutputStream;
  [(JavaIoFileOutputStream *)&v4 dealloc];
}

- (id)getChannel
{
  objc_sync_enter(self);
  channel = self->channel_;
  if (!channel)
  {
    objc_super v4 = JavaNioNioUtils_newFileChannelWithId_withJavaIoFileDescriptor_withInt_(self, self->fd_, self->mode_);
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

- (void)writeWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
}

- (void)writeWithInt:(int)a3
{
  char v3 = a3;
  [(JavaIoFileOutputStream *)self writeWithByteArray:+[IOSByteArray arrayWithBytes:&v3 count:1] withInt:0 withInt:1];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100456B28;
}

@end