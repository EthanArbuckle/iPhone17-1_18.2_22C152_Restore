@interface OrgApacheLuceneStoreTrackingDirectoryWrapper
- (OrgApacheLuceneStoreTrackingDirectoryWrapper)initWithOrgApacheLuceneStoreDirectory:(id)a3;
- (id)createOutputWithNSString:(id)a3 withOrgApacheLuceneStoreIOContext:(id)a4;
- (id)getCreatedFiles;
- (void)copyFromWithOrgApacheLuceneStoreDirectory:(id)a3 withNSString:(id)a4 withNSString:(id)a5 withOrgApacheLuceneStoreIOContext:(id)a6;
- (void)dealloc;
- (void)deleteFileWithNSString:(id)a3;
- (void)renameFileWithNSString:(id)a3 withNSString:(id)a4;
@end

@implementation OrgApacheLuceneStoreTrackingDirectoryWrapper

- (OrgApacheLuceneStoreTrackingDirectoryWrapper)initWithOrgApacheLuceneStoreDirectory:(id)a3
{
  return self;
}

- (void)deleteFileWithNSString:(id)a3
{
  in = self->super.in_;
  if (!in
    || (-[OrgApacheLuceneStoreDirectory deleteFileWithNSString:](in, "deleteFileWithNSString:"),
        (createdFileNames = self->createdFileNames_) == 0))
  {
    JreThrowNullPointerException();
  }
  [(JavaUtilSet *)createdFileNames removeWithId:a3];
}

- (id)createOutputWithNSString:(id)a3 withOrgApacheLuceneStoreIOContext:(id)a4
{
  in = self->super.in_;
  if (!in
    || (id v7 = [(OrgApacheLuceneStoreDirectory *)in createOutputWithNSString:a3 withOrgApacheLuceneStoreIOContext:a4], (createdFileNames = self->createdFileNames_) == 0))
  {
    JreThrowNullPointerException();
  }
  [(JavaUtilSet *)createdFileNames addWithId:a3];
  return v7;
}

- (void)copyFromWithOrgApacheLuceneStoreDirectory:(id)a3 withNSString:(id)a4 withNSString:(id)a5 withOrgApacheLuceneStoreIOContext:(id)a6
{
  in = self->super.in_;
  if (!in
    || ([(OrgApacheLuceneStoreDirectory *)in copyFromWithOrgApacheLuceneStoreDirectory:a3 withNSString:a4 withNSString:a5 withOrgApacheLuceneStoreIOContext:a6], (createdFileNames = self->createdFileNames_) == 0))
  {
    JreThrowNullPointerException();
  }
  [(JavaUtilSet *)createdFileNames addWithId:a5];
}

- (void)renameFileWithNSString:(id)a3 withNSString:(id)a4
{
  in = self->super.in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  -[OrgApacheLuceneStoreDirectory renameFileWithNSString:withNSString:](in, "renameFileWithNSString:withNSString:");
  createdFileNames = self->createdFileNames_;
  objc_sync_enter(createdFileNames);
  v9 = self->createdFileNames_;
  if (!v9) {
    JreThrowNullPointerException();
  }
  [(JavaUtilSet *)v9 addWithId:a4];
  [(JavaUtilSet *)self->createdFileNames_ removeWithId:a3];
  objc_sync_exit(createdFileNames);
}

- (id)getCreatedFiles
{
  return self->createdFileNames_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneStoreTrackingDirectoryWrapper;
  [(OrgApacheLuceneStoreFilterDirectory *)&v3 dealloc];
}

@end