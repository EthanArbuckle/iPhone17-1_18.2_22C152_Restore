@interface OrgApacheLuceneStoreRAMDirectory
- (BOOL)fileNameExistsWithNSString:(id)a3;
- (OrgApacheLuceneStoreRAMDirectory)init;
- (OrgApacheLuceneStoreRAMDirectory)initWithOrgApacheLuceneStoreFSDirectory:(id)a3 withBoolean:(BOOL)a4 withOrgApacheLuceneStoreIOContext:(id)a5;
- (OrgApacheLuceneStoreRAMDirectory)initWithOrgApacheLuceneStoreFSDirectory:(id)a3 withOrgApacheLuceneStoreIOContext:(id)a4;
- (OrgApacheLuceneStoreRAMDirectory)initWithOrgApacheLuceneStoreLockFactory:(id)a3;
- (id)createOutputWithNSString:(id)a3 withOrgApacheLuceneStoreIOContext:(id)a4;
- (id)getChildResources;
- (id)listAll;
- (id)newRAMFile;
- (id)openInputWithNSString:(id)a3 withOrgApacheLuceneStoreIOContext:(id)a4;
- (int64_t)fileLengthWithNSString:(id)a3;
- (int64_t)ramBytesUsed;
- (void)close;
- (void)dealloc;
- (void)deleteFileWithNSString:(id)a3;
- (void)renameFileWithNSString:(id)a3 withNSString:(id)a4;
@end

@implementation OrgApacheLuceneStoreRAMDirectory

- (OrgApacheLuceneStoreRAMDirectory)init
{
  v3 = new_OrgApacheLuceneStoreSingleInstanceLockFactory_init();
  OrgApacheLuceneStoreRAMDirectory_initWithOrgApacheLuceneStoreLockFactory_((uint64_t)self, v3);
  return self;
}

- (OrgApacheLuceneStoreRAMDirectory)initWithOrgApacheLuceneStoreLockFactory:(id)a3
{
  return self;
}

- (OrgApacheLuceneStoreRAMDirectory)initWithOrgApacheLuceneStoreFSDirectory:(id)a3 withOrgApacheLuceneStoreIOContext:(id)a4
{
  return self;
}

- (OrgApacheLuceneStoreRAMDirectory)initWithOrgApacheLuceneStoreFSDirectory:(id)a3 withBoolean:(BOOL)a4 withOrgApacheLuceneStoreIOContext:(id)a5
{
  return self;
}

- (id)listAll
{
  [(OrgApacheLuceneStoreBaseDirectory *)self ensureOpen];
  fileMap = self->fileMap_;
  if (!fileMap || (id v4 = [(JavaUtilMap *)fileMap keySet]) == 0) {
    JreThrowNullPointerException();
  }
  v5 = v4;
  v6 = new_JavaUtilArrayList_initWithInt_((uint64_t)[v4 size]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v5);
        }
        [(JavaUtilArrayList *)v6 addWithId:*(void *)(*((void *)&v12 + 1) + 8 * i)];
      }
      id v8 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
  return [(JavaUtilArrayList *)v6 toArrayWithNSObjectArray:+[IOSObjectArray arrayWithLength:[(JavaUtilArrayList *)v6 size] type:NSString_class_()]];
}

- (BOOL)fileNameExistsWithNSString:(id)a3
{
  [(OrgApacheLuceneStoreBaseDirectory *)self ensureOpen];
  fileMap = self->fileMap_;
  if (!fileMap) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilMap *)fileMap containsKeyWithId:a3];
}

- (int64_t)fileLengthWithNSString:(id)a3
{
  [(OrgApacheLuceneStoreBaseDirectory *)self ensureOpen];
  fileMap = self->fileMap_;
  if (!fileMap) {
    JreThrowNullPointerException();
  }
  id v6 = [(JavaUtilMap *)fileMap getWithId:a3];
  if (!v6)
  {
    id v8 = new_JavaIoFileNotFoundException_initWithNSString_((uint64_t)a3);
    objc_exception_throw(v8);
  }
  return (int64_t)[v6 getLength];
}

- (int64_t)ramBytesUsed
{
  [(OrgApacheLuceneStoreBaseDirectory *)self ensureOpen];
  sizeInBytes = self->sizeInBytes_;
  if (!sizeInBytes) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilConcurrentAtomicAtomicLong *)sizeInBytes get];
}

- (id)getChildResources
{
  return OrgApacheLuceneUtilAccountables_namedAccountablesWithNSString_withJavaUtilMap_(@"file", self->fileMap_);
}

- (void)deleteFileWithNSString:(id)a3
{
  [(OrgApacheLuceneStoreBaseDirectory *)self ensureOpen];
  fileMap = self->fileMap_;
  if (!fileMap) {
    goto LABEL_7;
  }
  id v6 = (id *)[(JavaUtilMap *)fileMap removeWithId:a3];
  if (!v6)
  {
    v10 = new_JavaIoFileNotFoundException_initWithNSString_((uint64_t)a3);
    objc_exception_throw(v10);
  }
  id v7 = v6;
  JreStrongAssign(v6 + 3, 0);
  sizeInBytes = self->sizeInBytes_;
  if (!sizeInBytes) {
LABEL_7:
  }
    JreThrowNullPointerException();
  uint64_t v9 = -(uint64_t)v7[4];
  [(JavaUtilConcurrentAtomicAtomicLong *)sizeInBytes addAndGetWithLong:v9];
}

- (id)createOutputWithNSString:(id)a3 withOrgApacheLuceneStoreIOContext:(id)a4
{
  [(OrgApacheLuceneStoreBaseDirectory *)self ensureOpen];
  id v6 = [(OrgApacheLuceneStoreRAMDirectory *)self newRAMFile];
  fileMap = self->fileMap_;
  if (!fileMap) {
    goto LABEL_8;
  }
  id v8 = [(JavaUtilMap *)fileMap removeWithId:a3];
  if (!v8) {
    goto LABEL_5;
  }
  id v9 = v8;
  sizeInBytes = self->sizeInBytes_;
  if (!sizeInBytes) {
LABEL_8:
  }
    JreThrowNullPointerException();
  [(JavaUtilConcurrentAtomicAtomicLong *)sizeInBytes addAndGetWithLong:-*((void *)v9 + 4)];
  JreStrongAssign((id *)v9 + 3, 0);
LABEL_5:
  [(JavaUtilMap *)self->fileMap_ putWithId:a3 withId:v6];
  v11 = new_OrgApacheLuceneStoreRAMOutputStream_initWithNSString_withOrgApacheLuceneStoreRAMFile_withBoolean_((uint64_t)a3, v6, 1);
  return v11;
}

- (id)newRAMFile
{
  v2 = new_OrgApacheLuceneStoreRAMFile_initWithOrgApacheLuceneStoreRAMDirectory_(self);
  return v2;
}

- (void)renameFileWithNSString:(id)a3 withNSString:(id)a4
{
  [(OrgApacheLuceneStoreBaseDirectory *)self ensureOpen];
  fileMap = self->fileMap_;
  if (!fileMap) {
    JreThrowNullPointerException();
  }
  id v8 = [(JavaUtilMap *)fileMap getWithId:a3];
  if (!v8)
  {
    v10 = new_JavaIoFileNotFoundException_initWithNSString_((uint64_t)a3);
    objc_exception_throw(v10);
  }
  [(JavaUtilMap *)self->fileMap_ putWithId:a4 withId:v8];
  id v9 = self->fileMap_;
  [(JavaUtilMap *)v9 removeWithId:a3];
}

- (id)openInputWithNSString:(id)a3 withOrgApacheLuceneStoreIOContext:(id)a4
{
  [(OrgApacheLuceneStoreBaseDirectory *)self ensureOpen];
  fileMap = self->fileMap_;
  if (!fileMap) {
    JreThrowNullPointerException();
  }
  id v7 = (uint64_t *)[(JavaUtilMap *)fileMap getWithId:a3];
  if (!v7)
  {
    v10 = new_JavaIoFileNotFoundException_initWithNSString_((uint64_t)a3);
    objc_exception_throw(v10);
  }
  id v8 = new_OrgApacheLuceneStoreRAMInputStream_initWithNSString_withOrgApacheLuceneStoreRAMFile_((uint64_t)a3, v7);
  return v8;
}

- (void)close
{
  atomic_store(0, (unsigned __int8 *)&self->super.isOpen_);
  fileMap = self->fileMap_;
  if (!fileMap) {
    JreThrowNullPointerException();
  }
  [(JavaUtilMap *)fileMap clear];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneStoreRAMDirectory;
  [(OrgApacheLuceneStoreBaseDirectory *)&v3 dealloc];
}

@end