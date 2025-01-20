@interface OrgApacheLuceneStoreFileSwitchDirectory
+ (id)getExtensionWithNSString:(id)a3;
- (OrgApacheLuceneStoreFileSwitchDirectory)initWithJavaUtilSet:(id)a3 withOrgApacheLuceneStoreDirectory:(id)a4 withOrgApacheLuceneStoreDirectory:(id)a5 withBoolean:(BOOL)a6;
- (id)createOutputWithNSString:(id)a3 withOrgApacheLuceneStoreIOContext:(id)a4;
- (id)getDirectoryWithNSString:(id)a3;
- (id)getPrimaryDir;
- (id)getSecondaryDir;
- (id)listAll;
- (id)obtainLockWithNSString:(id)a3;
- (id)openInputWithNSString:(id)a3 withOrgApacheLuceneStoreIOContext:(id)a4;
- (int64_t)fileLengthWithNSString:(id)a3;
- (void)close;
- (void)dealloc;
- (void)deleteFileWithNSString:(id)a3;
- (void)renameFileWithNSString:(id)a3 withNSString:(id)a4;
- (void)syncWithJavaUtilCollection:(id)a3;
@end

@implementation OrgApacheLuceneStoreFileSwitchDirectory

- (OrgApacheLuceneStoreFileSwitchDirectory)initWithJavaUtilSet:(id)a3 withOrgApacheLuceneStoreDirectory:(id)a4 withOrgApacheLuceneStoreDirectory:(id)a5 withBoolean:(BOOL)a6
{
  return self;
}

- (id)getPrimaryDir
{
  return self->primaryDir_;
}

- (id)getSecondaryDir
{
  return self->secondaryDir_;
}

- (id)obtainLockWithNSString:(id)a3
{
  v4 = (void *)sub_10003A38C((uint64_t)self, a3);
  if (!v4) {
    JreThrowNullPointerException();
  }
  return [v4 obtainLockWithNSString:a3];
}

- (void)close
{
  if (self->doClose_)
  {
    secondaryDir = self->secondaryDir_;
    v5[0] = self->primaryDir_;
    v5[1] = secondaryDir;
    v4 = +[IOSObjectArray arrayWithObjects:v5 count:2 type:JavaIoCloseable_class_()];
    OrgApacheLuceneUtilIOUtils_closeWithJavaIoCloseableArray_(v4);
    self->doClose_ = 0;
  }
}

- (id)listAll
{
  v3 = new_JavaUtilHashSet_init();
  primaryDir = self->primaryDir_;
  if (!primaryDir) {
    JreThrowNullPointerException();
  }
  v5 = (char *)[(OrgApacheLuceneStoreDirectory *)primaryDir listAll];
  if (!v5) {
    JreThrowNullPointerException();
  }
  v6 = v5 + 24;
  unint64_t v7 = (unint64_t)&v5[8 * *((int *)v5 + 2) + 24];
  while ((unint64_t)v6 < v7)
    [(JavaUtilHashSet *)v3 addWithId:*v6++];
  secondaryDir = self->secondaryDir_;
  if (!secondaryDir) {
    JreThrowNullPointerException();
  }
  v9 = (char *)[(OrgApacheLuceneStoreDirectory *)secondaryDir listAll];
  if (!v9) {
    JreThrowNullPointerException();
  }
  v10 = v9 + 24;
  unint64_t v11 = (unint64_t)&v9[8 * *((int *)v9 + 2) + 24];
  while ((unint64_t)v10 < v11)
    [(JavaUtilHashSet *)v3 addWithId:*v10++];
  v12 = +[IOSObjectArray arrayWithLength:[(JavaUtilHashSet *)v3 size] type:NSString_class_()];
  return [(JavaUtilAbstractCollection *)v3 toArrayWithNSObjectArray:v12];
}

+ (id)getExtensionWithNSString:(id)a3
{
  return (id)OrgApacheLuceneStoreFileSwitchDirectory_getExtensionWithNSString_(a3);
}

- (id)getDirectoryWithNSString:(id)a3
{
  return (id)sub_10003A38C((uint64_t)self, a3);
}

- (void)deleteFileWithNSString:(id)a3
{
  v4 = (void *)sub_10003A38C((uint64_t)self, a3);
  if (!v4) {
    JreThrowNullPointerException();
  }
  [v4 deleteFileWithNSString:a3];
}

- (int64_t)fileLengthWithNSString:(id)a3
{
  v4 = (void *)sub_10003A38C((uint64_t)self, a3);
  if (!v4) {
    JreThrowNullPointerException();
  }
  return (int64_t)[v4 fileLengthWithNSString:a3];
}

- (id)createOutputWithNSString:(id)a3 withOrgApacheLuceneStoreIOContext:(id)a4
{
  v6 = (void *)sub_10003A38C((uint64_t)self, a3);
  if (!v6) {
    JreThrowNullPointerException();
  }
  return [v6 createOutputWithNSString:a3 withOrgApacheLuceneStoreIOContext:a4];
}

- (void)syncWithJavaUtilCollection:(id)a3
{
  v5 = new_JavaUtilArrayList_init();
  v6 = new_JavaUtilArrayList_init();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  if (!a3) {
    goto LABEL_16;
  }
  unint64_t v7 = v6;
  id v8 = [a3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(a3);
        }
        primaryExtensions = self->primaryExtensions_;
        if (!primaryExtensions) {
          goto LABEL_16;
        }
        v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        CFStringRef ExtensionWithNSString = OrgApacheLuceneStoreFileSwitchDirectory_getExtensionWithNSString_(v13);
        if (-[JavaUtilSet containsWithId:](primaryExtensions, "containsWithId:", ExtensionWithNSString, (void)v18))v15 = v5; {
        else
        }
          v15 = v7;
        [(JavaUtilArrayList *)v15 addWithId:v13];
      }
      id v9 = [a3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }
  primaryDir = self->primaryDir_;
  if (!primaryDir
    || ([(OrgApacheLuceneStoreDirectory *)primaryDir syncWithJavaUtilCollection:v5],
        (secondaryDir = self->secondaryDir_) == 0))
  {
LABEL_16:
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneStoreDirectory *)secondaryDir syncWithJavaUtilCollection:v7];
}

- (void)renameFileWithNSString:(id)a3 withNSString:(id)a4
{
  unint64_t v7 = (void *)sub_10003A38C((uint64_t)self, a3);
  if (v7 != (void *)sub_10003A38C((uint64_t)self, a4))
  {
    id v8 = new_OrgLukhnosPortmobileFileAtomicMoveNotSupportedException_initWithNSString_withNSString_withNSString_((uint64_t)a3, (uint64_t)a4, @"source and dest are in different directories");
    objc_exception_throw(v8);
  }
  if (!v7) {
    JreThrowNullPointerException();
  }
  [v7 renameFileWithNSString:a3 withNSString:a4];
}

- (id)openInputWithNSString:(id)a3 withOrgApacheLuceneStoreIOContext:(id)a4
{
  v6 = (void *)sub_10003A38C((uint64_t)self, a3);
  if (!v6) {
    JreThrowNullPointerException();
  }
  return [v6 openInputWithNSString:a3 withOrgApacheLuceneStoreIOContext:a4];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneStoreFileSwitchDirectory;
  [(OrgApacheLuceneStoreFileSwitchDirectory *)&v3 dealloc];
}

@end