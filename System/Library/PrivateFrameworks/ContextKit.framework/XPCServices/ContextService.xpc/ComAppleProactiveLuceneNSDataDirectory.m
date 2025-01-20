@interface ComAppleProactiveLuceneNSDataDirectory
- (ComAppleProactiveLuceneNSDataDirectory)initWithOrgLukhnosPortmobileFilePath:(id)a3 withInt:(int)a4;
- (ComAppleProactiveLuceneNSDataDirectory)initWithOrgLukhnosPortmobileFilePath:(id)a3 withInt:(int)a4 withBoolean:(BOOL)a5 withBoolean:(BOOL)a6 withInt:(int)a7;
- (id)openInputWithNSString:(id)a3 withOrgApacheLuceneStoreIOContext:(id)a4;
- (void)dealloc;
- (void)madviseWithId:(id)a3 withLong:(int64_t)a4 withLong:(int64_t)a5;
@end

@implementation ComAppleProactiveLuceneNSDataDirectory

- (ComAppleProactiveLuceneNSDataDirectory)initWithOrgLukhnosPortmobileFilePath:(id)a3 withInt:(int)a4
{
  return self;
}

- (ComAppleProactiveLuceneNSDataDirectory)initWithOrgLukhnosPortmobileFilePath:(id)a3 withInt:(int)a4 withBoolean:(BOOL)a5 withBoolean:(BOOL)a6 withInt:(int)a7
{
  return self;
}

- (id)openInputWithNSString:(id)a3 withOrgApacheLuceneStoreIOContext:(id)a4
{
  if (-[OrgApacheLuceneStoreFSDirectory fileLengthWithNSString:](self, "fileLengthWithNSString:", a3, a4) <= self->minFileSizeForMapped_)
  {
    v6 = [ComAppleProactiveLuceneNSDataDirectory_RandomAccessFileIndexInput alloc];
    sub_1000461BC((uint64_t)v6, (uint64_t)self, a3);
  }
  else if (self->useOldDataInput_)
  {
    v6 = [ComAppleProactiveLuceneNSDataDirectory_NSDataIndexInputOld alloc];
    sub_100045824((uint64_t)v6, (uint64_t)self, a3);
  }
  else
  {
    v6 = [ComAppleProactiveLuceneNSDataDirectory_NSDataIndexInput alloc];
    sub_100045178((uint64_t)v6, (uint64_t)self, a3);
  }
  return v6;
}

- (void)madviseWithId:(id)a3 withLong:(int64_t)a4 withLong:(int64_t)a5
{
  v6 = (char *)[a3 bytes] + a4;
  madvise(v6, a5, 3);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ComAppleProactiveLuceneNSDataDirectory;
  [(OrgApacheLuceneStoreFSDirectory *)&v3 dealloc];
}

@end