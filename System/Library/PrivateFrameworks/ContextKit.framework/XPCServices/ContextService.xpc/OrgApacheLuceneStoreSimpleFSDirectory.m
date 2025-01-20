@interface OrgApacheLuceneStoreSimpleFSDirectory
- (OrgApacheLuceneStoreSimpleFSDirectory)initWithOrgLukhnosPortmobileFilePath:(id)a3;
- (OrgApacheLuceneStoreSimpleFSDirectory)initWithOrgLukhnosPortmobileFilePath:(id)a3 withOrgApacheLuceneStoreLockFactory:(id)a4;
- (id)openInputWithNSString:(id)a3 withOrgApacheLuceneStoreIOContext:(id)a4;
@end

@implementation OrgApacheLuceneStoreSimpleFSDirectory

- (OrgApacheLuceneStoreSimpleFSDirectory)initWithOrgLukhnosPortmobileFilePath:(id)a3 withOrgApacheLuceneStoreLockFactory:(id)a4
{
  return self;
}

- (OrgApacheLuceneStoreSimpleFSDirectory)initWithOrgLukhnosPortmobileFilePath:(id)a3
{
  Default = (void *)OrgApacheLuceneStoreFSLockFactory_getDefault();
  OrgApacheLuceneStoreFSDirectory_initWithOrgLukhnosPortmobileFilePath_withOrgApacheLuceneStoreLockFactory_((uint64_t)self, a3, Default);
  return self;
}

- (id)openInputWithNSString:(id)a3 withOrgApacheLuceneStoreIOContext:(id)a4
{
  [(OrgApacheLuceneStoreBaseDirectory *)self ensureOpen];
  directory = self->super.directory_;
  if (!directory) {
    JreThrowNullPointerException();
  }
  id v8 = [(OrgLukhnosPortmobileFilePath *)directory resolveWithNSString:a3];
  if ((atomic_load_explicit(OrgLukhnosPortmobileFileStandardOpenOptionEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  id v9 = OrgLukhnosPortmobileFileFiles_newByteChannelWithOrgLukhnosPortmobileFilePath_withOrgLukhnosPortmobileFileStandardOpenOptionEnum_(v8, OrgLukhnosPortmobileFileStandardOpenOptionEnum_values_[0]);
  v17 = (__CFString *)JreStrcat("$@$", v10, v11, v12, v13, v14, v15, v16, @"SimpleFSIndexInput(path=\"");
  v18 = [OrgApacheLuceneStoreSimpleFSDirectory_SimpleFSIndexInput alloc];
  OrgApacheLuceneStoreSimpleFSDirectory_SimpleFSIndexInput_initWithNSString_withJavaNioChannelsSeekableByteChannel_withOrgApacheLuceneStoreIOContext_((uint64_t)v18, v17, v9, (uint64_t)a4);
  return v18;
}

@end