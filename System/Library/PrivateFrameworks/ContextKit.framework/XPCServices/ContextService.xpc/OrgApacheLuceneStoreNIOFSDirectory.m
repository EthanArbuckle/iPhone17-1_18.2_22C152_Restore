@interface OrgApacheLuceneStoreNIOFSDirectory
- (OrgApacheLuceneStoreNIOFSDirectory)initWithOrgLukhnosPortmobileFilePath:(id)a3;
- (OrgApacheLuceneStoreNIOFSDirectory)initWithOrgLukhnosPortmobileFilePath:(id)a3 withOrgApacheLuceneStoreLockFactory:(id)a4;
- (id)openInputWithNSString:(id)a3 withOrgApacheLuceneStoreIOContext:(id)a4;
@end

@implementation OrgApacheLuceneStoreNIOFSDirectory

- (OrgApacheLuceneStoreNIOFSDirectory)initWithOrgLukhnosPortmobileFilePath:(id)a3 withOrgApacheLuceneStoreLockFactory:(id)a4
{
  return self;
}

- (OrgApacheLuceneStoreNIOFSDirectory)initWithOrgLukhnosPortmobileFilePath:(id)a3
{
  Default = (void *)OrgApacheLuceneStoreFSLockFactory_getDefault();
  OrgApacheLuceneStoreFSDirectory_initWithOrgLukhnosPortmobileFilePath_withOrgApacheLuceneStoreLockFactory_((uint64_t)self, a3, Default);
  return self;
}

- (id)openInputWithNSString:(id)a3 withOrgApacheLuceneStoreIOContext:(id)a4
{
  [(OrgApacheLuceneStoreBaseDirectory *)self ensureOpen];
  id v7 = [(OrgApacheLuceneStoreFSDirectory *)self getDirectory];
  if (!v7) {
    JreThrowNullPointerException();
  }
  id v8 = [v7 resolveWithNSString:a3];
  if ((atomic_load_explicit(OrgLukhnosPortmobileFileStandardOpenOptionEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  uint64_t v21 = OrgLukhnosPortmobileFileStandardOpenOptionEnum_values_;
  v9 = +[IOSObjectArray arrayWithObjects:&v21 count:1 type:OrgLukhnosPortmobileFileStandardOpenOptionEnum_class_()];
  id v10 = OrgLukhnosPortmobileChannelsUtilsFileChannelUtils_openWithOrgLukhnosPortmobileFilePath_withOrgLukhnosPortmobileFileStandardOpenOptionEnumArray_(v8, v9);
  v18 = (__CFString *)JreStrcat("$@$", v11, v12, v13, v14, v15, v16, v17, @"NIOFSIndexInput(path=\"");
  v19 = [OrgApacheLuceneStoreNIOFSDirectory_NIOFSIndexInput alloc];
  OrgApacheLuceneStoreNIOFSDirectory_NIOFSIndexInput_initWithNSString_withJavaNioChannelsFileChannel_withOrgApacheLuceneStoreIOContext_((uint64_t)v19, v18, v10, (uint64_t)a4);
  return v19;
}

@end