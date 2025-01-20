@interface OrgApacheLuceneStoreFilterDirectory
+ (id)unwrapWithOrgApacheLuceneStoreDirectory:(id)a3;
- (OrgApacheLuceneStoreFilterDirectory)initWithOrgApacheLuceneStoreDirectory:(id)a3;
- (id)createOutputWithNSString:(id)a3 withOrgApacheLuceneStoreIOContext:(id)a4;
- (id)description;
- (id)getDelegate;
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

@implementation OrgApacheLuceneStoreFilterDirectory

+ (id)unwrapWithOrgApacheLuceneStoreDirectory:(id)a3
{
  return (id)OrgApacheLuceneStoreFilterDirectory_unwrapWithOrgApacheLuceneStoreDirectory_((uint64_t)a3);
}

- (OrgApacheLuceneStoreFilterDirectory)initWithOrgApacheLuceneStoreDirectory:(id)a3
{
  return self;
}

- (id)getDelegate
{
  return self->in_;
}

- (id)listAll
{
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneStoreDirectory *)in listAll];
}

- (void)deleteFileWithNSString:(id)a3
{
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneStoreDirectory *)in deleteFileWithNSString:a3];
}

- (int64_t)fileLengthWithNSString:(id)a3
{
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  return (int64_t)[(OrgApacheLuceneStoreDirectory *)in fileLengthWithNSString:a3];
}

- (id)createOutputWithNSString:(id)a3 withOrgApacheLuceneStoreIOContext:(id)a4
{
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneStoreDirectory *)in createOutputWithNSString:a3 withOrgApacheLuceneStoreIOContext:a4];
}

- (void)syncWithJavaUtilCollection:(id)a3
{
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneStoreDirectory *)in syncWithJavaUtilCollection:a3];
}

- (void)renameFileWithNSString:(id)a3 withNSString:(id)a4
{
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneStoreDirectory *)in renameFileWithNSString:a3 withNSString:a4];
}

- (id)openInputWithNSString:(id)a3 withOrgApacheLuceneStoreIOContext:(id)a4
{
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneStoreDirectory *)in openInputWithNSString:a3 withOrgApacheLuceneStoreIOContext:a4];
}

- (id)obtainLockWithNSString:(id)a3
{
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneStoreDirectory *)in obtainLockWithNSString:a3];
}

- (void)close
{
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneStoreDirectory *)in close];
}

- (id)description
{
  id v3 = objc_msgSend(-[OrgApacheLuceneStoreFilterDirectory getClass](self, "getClass"), "getSimpleName");
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneStoreDirectory *)in description];
  return (id)JreStrcat("$C$C", v5, v6, v7, v8, v9, v10, v11, v3);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneStoreFilterDirectory;
  [(OrgApacheLuceneStoreFilterDirectory *)&v3 dealloc];
}

@end