@interface OrgApacheLuceneStoreFSDirectory
+ (id)listAllWithOrgLukhnosPortmobileFilePath:(id)a3;
+ (id)openWithOrgLukhnosPortmobileFilePath:(id)a3;
+ (id)openWithOrgLukhnosPortmobileFilePath:(id)a3 withOrgApacheLuceneStoreLockFactory:(id)a4;
- (OrgApacheLuceneStoreFSDirectory)initWithOrgLukhnosPortmobileFilePath:(id)a3 withOrgApacheLuceneStoreLockFactory:(id)a4;
- (id)createOutputWithNSString:(id)a3 withOrgApacheLuceneStoreIOContext:(id)a4;
- (id)description;
- (id)getDirectory;
- (id)listAll;
- (int64_t)fileLengthWithNSString:(id)a3;
- (void)close;
- (void)dealloc;
- (void)deleteFileWithNSString:(id)a3;
- (void)ensureCanWriteWithNSString:(id)a3;
- (void)fsyncWithNSString:(id)a3;
- (void)renameFileWithNSString:(id)a3 withNSString:(id)a4;
- (void)syncWithJavaUtilCollection:(id)a3;
@end

@implementation OrgApacheLuceneStoreFSDirectory

- (OrgApacheLuceneStoreFSDirectory)initWithOrgLukhnosPortmobileFilePath:(id)a3 withOrgApacheLuceneStoreLockFactory:(id)a4
{
  return self;
}

+ (id)openWithOrgLukhnosPortmobileFilePath:(id)a3
{
  Default = (void *)OrgApacheLuceneStoreFSLockFactory_getDefault();
  return OrgApacheLuceneStoreFSDirectory_openWithOrgLukhnosPortmobileFilePath_withOrgApacheLuceneStoreLockFactory_(a3, Default);
}

+ (id)openWithOrgLukhnosPortmobileFilePath:(id)a3 withOrgApacheLuceneStoreLockFactory:(id)a4
{
  return OrgApacheLuceneStoreFSDirectory_openWithOrgLukhnosPortmobileFilePath_withOrgApacheLuceneStoreLockFactory_(a3, a4);
}

+ (id)listAllWithOrgLukhnosPortmobileFilePath:(id)a3
{
  return OrgApacheLuceneStoreFSDirectory_listAllWithOrgLukhnosPortmobileFilePath_(a3);
}

- (id)listAll
{
  [(OrgApacheLuceneStoreBaseDirectory *)self ensureOpen];
  directory = self->directory_;
  return OrgApacheLuceneStoreFSDirectory_listAllWithOrgLukhnosPortmobileFilePath_(directory);
}

- (int64_t)fileLengthWithNSString:(id)a3
{
  [(OrgApacheLuceneStoreBaseDirectory *)self ensureOpen];
  directory = self->directory_;
  if (!directory) {
    JreThrowNullPointerException();
  }
  id v6 = [(OrgLukhnosPortmobileFilePath *)directory resolveWithNSString:a3];
  return (int64_t)OrgLukhnosPortmobileFileFiles_sizeWithOrgLukhnosPortmobileFilePath_(v6);
}

- (void)deleteFileWithNSString:(id)a3
{
  [(OrgApacheLuceneStoreBaseDirectory *)self ensureOpen];
  directory = self->directory_;
  if (!directory) {
    JreThrowNullPointerException();
  }
  id v6 = [(OrgLukhnosPortmobileFilePath *)directory resolveWithNSString:a3];
  OrgLukhnosPortmobileFileFiles_delete__WithOrgLukhnosPortmobileFilePath_(v6);
}

- (id)createOutputWithNSString:(id)a3 withOrgApacheLuceneStoreIOContext:(id)a4
{
  [(OrgApacheLuceneStoreBaseDirectory *)self ensureOpen];
  [(OrgApacheLuceneStoreFSDirectory *)self ensureCanWriteWithNSString:a3];
  id v6 = [OrgApacheLuceneStoreFSDirectory_FSIndexOutput alloc];
  OrgApacheLuceneStoreFSDirectory_FSIndexOutput_initWithOrgApacheLuceneStoreFSDirectory_withNSString_((uint64_t)v6, (uint64_t)self, (uint64_t)a3);
  return v6;
}

- (void)ensureCanWriteWithNSString:(id)a3
{
  directory = self->directory_;
  if (!directory) {
    JreThrowNullPointerException();
  }
  v4 = [(OrgLukhnosPortmobileFilePath *)directory resolveWithNSString:a3];
  OrgLukhnosPortmobileFileFiles_deleteIfExistsWithOrgLukhnosPortmobileFilePath_(v4);
}

- (void)syncWithJavaUtilCollection:(id)a3
{
  [(OrgApacheLuceneStoreBaseDirectory *)self ensureOpen];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  if (!a3) {
    JreThrowNullPointerException();
  }
  id v5 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(a3);
        }
        -[OrgApacheLuceneStoreFSDirectory fsyncWithNSString:](self, "fsyncWithNSString:", *(void *)(*((void *)&v9 + 1) + 8 * i), (void)v9);
      }
      id v6 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)renameFileWithNSString:(id)a3 withNSString:(id)a4
{
  [(OrgApacheLuceneStoreBaseDirectory *)self ensureOpen];
  directory = self->directory_;
  if (!directory) {
    JreThrowNullPointerException();
  }
  id v8 = [(OrgLukhnosPortmobileFilePath *)directory resolveWithNSString:a3];
  id v9 = [(OrgLukhnosPortmobileFilePath *)self->directory_ resolveWithNSString:a4];
  if ((atomic_load_explicit((atomic_uchar *volatile)OrgLukhnosPortmobileFileStandardCopyOption__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
  uint64_t v10 = OrgLukhnosPortmobileFileStandardCopyOption_ATOMIC_MOVE_;
  }
  +[IOSObjectArray arrayWithObjects:&v10 count:1 type:OrgLukhnosPortmobileFileStandardCopyOption_class_()];
  OrgLukhnosPortmobileFileFiles_moveWithOrgLukhnosPortmobileFilePath_withOrgLukhnosPortmobileFilePath_withOrgLukhnosPortmobileFileStandardCopyOptionArray_(v8, v9);
  OrgApacheLuceneUtilIOUtils_fsyncWithOrgLukhnosPortmobileFilePath_withBoolean_(self->directory_, 1);
}

- (void)close
{
  objc_sync_enter(self);
  atomic_store(0, (unsigned __int8 *)&self->super.isOpen_);
  objc_sync_exit(self);
}

- (id)getDirectory
{
  return self->directory_;
}

- (id)description
{
  id v2 = objc_msgSend(-[OrgApacheLuceneStoreFSDirectory getClass](self, "getClass"), "getSimpleName");
  return (id)JreStrcat("$C@$@", v3, v4, v5, v6, v7, v8, v9, v2);
}

- (void)fsyncWithNSString:(id)a3
{
  directory = self->directory_;
  if (!directory) {
    JreThrowNullPointerException();
  }
  id v4 = [(OrgLukhnosPortmobileFilePath *)directory resolveWithNSString:a3];
  OrgApacheLuceneUtilIOUtils_fsyncWithOrgLukhnosPortmobileFilePath_withBoolean_(v4, 0);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneStoreFSDirectory;
  [(OrgApacheLuceneStoreBaseDirectory *)&v3 dealloc];
}

@end