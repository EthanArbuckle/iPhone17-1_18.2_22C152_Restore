@interface OrgApacheLuceneUtilIOUtils_$1
- (OrgApacheLuceneUtilIOUtils_$1)initWithJavaUtilLinkedHashMap:(id)a3;
- (id)postVisitDirectoryWithId:(id)a3 withJavaIoIOException:(id)a4;
- (id)preVisitDirectoryWithId:(id)a3 withOrgLukhnosPortmobileFileAttributeBasicFileAttributes:(id)a4;
- (id)visitFileFailedWithId:(id)a3 withJavaIoIOException:(id)a4;
- (id)visitFileWithId:(id)a3 withOrgLukhnosPortmobileFileAttributeBasicFileAttributes:(id)a4;
- (void)dealloc;
@end

@implementation OrgApacheLuceneUtilIOUtils_$1

- (id)preVisitDirectoryWithId:(id)a3 withOrgLukhnosPortmobileFileAttributeBasicFileAttributes:(id)a4
{
  if ((atomic_load_explicit(OrgLukhnosPortmobileFileFileVisitResultEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return (id)OrgLukhnosPortmobileFileFileVisitResultEnum_values_;
}

- (id)postVisitDirectoryWithId:(id)a3 withJavaIoIOException:(id)a4
{
  if ((atomic_load_explicit(OrgLukhnosPortmobileFileFileVisitResultEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return (id)OrgLukhnosPortmobileFileFileVisitResultEnum_values_;
}

- (id)visitFileWithId:(id)a3 withOrgLukhnosPortmobileFileAttributeBasicFileAttributes:(id)a4
{
  if ((atomic_load_explicit(OrgLukhnosPortmobileFileFileVisitResultEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return (id)OrgLukhnosPortmobileFileFileVisitResultEnum_values_;
}

- (id)visitFileFailedWithId:(id)a3 withJavaIoIOException:(id)a4
{
  if (a4)
  {
    v4 = self->val$unremoved_;
    if (!v4) {
      JreThrowNullPointerException();
    }
    -[JavaUtilHashMap putWithId:withId:](v4, "putWithId:withId:", a3);
  }
  if ((atomic_load_explicit(OrgLukhnosPortmobileFileFileVisitResultEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return (id)OrgLukhnosPortmobileFileFileVisitResultEnum_values_;
}

- (OrgApacheLuceneUtilIOUtils_$1)initWithJavaUtilLinkedHashMap:(id)a3
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilIOUtils__1;
  [(OrgApacheLuceneUtilIOUtils_$1 *)&v3 dealloc];
}

@end