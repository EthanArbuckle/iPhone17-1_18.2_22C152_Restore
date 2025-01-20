@interface JavaNioFileChannelImpl_FileLockImpl
+ (const)__metadata;
- (BOOL)isValid;
- (JavaNioFileChannelImpl_FileLockImpl)initWithJavaNioChannelsFileChannel:(id)a3 withLong:(int64_t)a4 withLong:(int64_t)a5 withBoolean:(BOOL)a6;
- (void)release__;
@end

@implementation JavaNioFileChannelImpl_FileLockImpl

- (JavaNioFileChannelImpl_FileLockImpl)initWithJavaNioChannelsFileChannel:(id)a3 withLong:(int64_t)a4 withLong:(int64_t)a5 withBoolean:(BOOL)a6
{
  JavaNioChannelsFileLock_initWithJavaNioChannelsFileChannel_withLong_withLong_withBoolean_((uint64_t)self, a3, a4, a5, a6, a6, v6, v7);
  *(&self->super.shared_ + 1) = 0;
  return self;
}

- (BOOL)isValid
{
  if (*(&self->super.shared_ + 1)) {
    return 0;
  }
  id v3 = [(JavaNioChannelsFileLock *)self channel];
  if (!v3) {
    JreThrowNullPointerException();
  }
  return [v3 isOpen];
}

- (void)release__
{
  id v3 = [(JavaNioChannelsFileLock *)self channel];
  if (!v3) {
    goto LABEL_8;
  }
  if (([v3 isOpen] & 1) == 0)
  {
    v5 = new_JavaNioChannelsClosedChannelException_init();
    objc_exception_throw(v5);
  }
  if (!*(&self->super.shared_ + 1))
  {
    id v4 = [(JavaNioChannelsFileLock *)self channel];
    objc_opt_class();
    if (v4)
    {
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        JreThrowClassCastException();
      }
      objc_msgSend(v4, "release__WithJavaNioChannelsFileLock:", self);
      *(&self->super.shared_ + 1) = 1;
      return;
    }
LABEL_8:
    JreThrowNullPointerException();
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004577A0;
}

@end