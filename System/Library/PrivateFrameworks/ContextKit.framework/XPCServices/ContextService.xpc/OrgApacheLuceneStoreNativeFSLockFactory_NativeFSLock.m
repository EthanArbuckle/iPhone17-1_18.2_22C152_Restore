@interface OrgApacheLuceneStoreNativeFSLockFactory_NativeFSLock
- (OrgApacheLuceneStoreNativeFSLockFactory_NativeFSLock)initWithJavaNioChannelsFileLock:(id)a3 withJavaNioChannelsFileChannel:(id)a4 withOrgLukhnosPortmobileFilePath:(id)a5 withOrgLukhnosPortmobileFileAttributeFileTime:(id)a6;
- (id)description;
- (void)close;
- (void)dealloc;
- (void)ensureValid;
@end

@implementation OrgApacheLuceneStoreNativeFSLockFactory_NativeFSLock

- (OrgApacheLuceneStoreNativeFSLockFactory_NativeFSLock)initWithJavaNioChannelsFileLock:(id)a3 withJavaNioChannelsFileChannel:(id)a4 withOrgLukhnosPortmobileFilePath:(id)a5 withOrgLukhnosPortmobileFileAttributeFileTime:(id)a6
{
  return self;
}

- (void)ensureValid
{
  unsigned __int8 v9 = atomic_load((unsigned __int8 *)&self->closed_);
  if (v9)
  {
    v31 = @"Lock instance already released: ";
LABEL_19:
    CFStringRef v32 = JreStrcat("$@", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v31);
    goto LABEL_22;
  }
  if ((atomic_load_explicit(OrgApacheLuceneStoreNativeFSLockFactory__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (!qword_1005605B8) {
    goto LABEL_15;
  }
  path = self->path_;
  if (!path) {
    goto LABEL_15;
  }
  if ((objc_msgSend((id)qword_1005605B8, "containsWithId:", -[OrgLukhnosPortmobileFilePath description](path, "description")) & 1) == 0)
  {
    v31 = @"Lock path unexpectedly cleared from map: ";
    goto LABEL_19;
  }
  lock = self->lock_;
  if (!lock) {
    goto LABEL_15;
  }
  if (![(JavaNioChannelsFileLock *)lock isValid])
  {
    v31 = @"FileLock invalidated by an external force: ";
    goto LABEL_19;
  }
  channel = self->channel_;
  if (!channel) {
    goto LABEL_15;
  }
  if ([(JavaNioChannelsFileChannel *)channel size])
  {
    CFStringRef v32 = JreStrcat("$J$@C", v13, v14, v15, v16, v17, v18, v19, @"Unexpected lock file size: ");
    goto LABEL_22;
  }
  v20 = self->path_;
  OrgLukhnosPortmobileFileAttributeBasicFileAttributes_class_();
  AttributesWithOrgLukhnosPortmobileFilePath_withIOSClass = OrgLukhnosPortmobileFileFiles_readAttributesWithOrgLukhnosPortmobileFilePath_withIOSClass_(v20);
  if (!AttributesWithOrgLukhnosPortmobileFilePath_withIOSClass
    || (id v22 = [(OrgLukhnosPortmobileFileAttributeBasicFileAttributes *)AttributesWithOrgLukhnosPortmobileFilePath_withIOSClass creationTime], (creationTime = self->creationTime_) == 0))
  {
LABEL_15:
    JreThrowNullPointerException();
  }
  if (![(OrgLukhnosPortmobileFileAttributeFileTime *)creationTime isEqual:v22])
  {
    CFStringRef v32 = JreStrcat("$@$@C", v24, v25, v26, v27, v28, v29, v30, @"Underlying file changed by an external force at ");
LABEL_22:
    v33 = new_OrgApacheLuceneStoreAlreadyClosedException_initWithNSString_((uint64_t)v32);
    objc_exception_throw(v33);
  }
}

- (void)close
{
  objc_sync_enter(self);
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->closed_);
  if ((v3 & 1) == 0)
  {
    channel = self->channel_;
    lock = self->lock_;
    if (!lock) {
      JreThrowNullPointerException();
    }
    [(JavaNioChannelsFileLock *)lock release];
    if (channel) {
      [(JavaNioChannelsSpiAbstractInterruptibleChannel *)channel close];
    }
    atomic_store(1u, (unsigned __int8 *)&self->closed_);
    sub_10011F740(self->path_);
  }
  objc_sync_exit(self);
}

- (id)description
{
  return (id)JreStrcat("$@$@$@C", (uint64_t)a2, v2, v3, v4, v5, v6, v7, @"NativeFSLock(path=");
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneStoreNativeFSLockFactory_NativeFSLock;
  [(OrgApacheLuceneStoreNativeFSLockFactory_NativeFSLock *)&v3 dealloc];
}

@end