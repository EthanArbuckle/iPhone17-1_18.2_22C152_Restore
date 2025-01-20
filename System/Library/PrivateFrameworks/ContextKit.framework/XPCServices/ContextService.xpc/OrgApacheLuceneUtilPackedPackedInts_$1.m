@interface OrgApacheLuceneUtilPackedPackedInts_$1
- (OrgApacheLuceneUtilPackedPackedInts_$1)initWithLong:(int64_t)a3 withInt:(int)a4 withInt:(int)a5 withOrgApacheLuceneStoreIndexInput:(id)a6;
- (int64_t)getWithInt:(int)a3;
@end

@implementation OrgApacheLuceneUtilPackedPackedInts_$1

- (int64_t)getWithInt:(int)a3
{
  v8.receiver = self;
  v8.super_class = (Class)OrgApacheLuceneUtilPackedPackedInts__1;
  id v5 = -[OrgApacheLuceneUtilPackedDirectPackedReader getWithInt:](&v8, "getWithInt:");
  if (self->super.super.valueCount_ - 1 == a3)
  {
    in = self->super.in_;
    if (!in) {
      JreThrowNullPointerException();
    }
    [(OrgApacheLuceneStoreIndexInput *)in seekWithLong:self->val$endPointer_];
  }
  return (int64_t)v5;
}

- (OrgApacheLuceneUtilPackedPackedInts_$1)initWithLong:(int64_t)a3 withInt:(int)a4 withInt:(int)a5 withOrgApacheLuceneStoreIndexInput:(id)a6
{
  self->val$endPointer_ = a3;
  OrgApacheLuceneUtilPackedDirectPackedReader_initWithInt_withInt_withOrgApacheLuceneStoreIndexInput_((uint64_t)self, a4, *(uint64_t *)&a5, a6);
  return self;
}

@end