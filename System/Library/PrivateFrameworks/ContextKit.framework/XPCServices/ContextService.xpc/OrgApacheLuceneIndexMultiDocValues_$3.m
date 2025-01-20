@interface OrgApacheLuceneIndexMultiDocValues_$3
- (OrgApacheLuceneIndexMultiDocValues_$3)initWithIntArray:(id)a3 withOrgApacheLuceneIndexBinaryDocValuesArray:(id)a4;
- (id)getWithInt:(int)a3;
- (void)dealloc;
@end

@implementation OrgApacheLuceneIndexMultiDocValues_$3

- (id)getWithInt:(int)a3
{
  uint64_t v5 = OrgApacheLuceneIndexReaderUtil_subIndexWithInt_withIntArray_(a3, (uint64_t)self->val$starts_);
  v6 = self->val$values_;
  if (!v6) {
    goto LABEL_11;
  }
  uint64_t v7 = v5;
  uint64_t v8 = (int)v5;
  uint64_t size = v6->super.size_;
  if ((v7 & 0x80000000) != 0 || (int)v7 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v7);
  }
  v10 = (&v6->elementType_)[v8];
  if (!v10 || (v11 = self->val$starts_) == 0) {
LABEL_11:
  }
    JreThrowNullPointerException();
  uint64_t v12 = v11->super.size_;
  if ((v7 & 0x80000000) != 0 || (int)v7 >= (int)v12) {
    IOSArray_throwOutOfBoundsWithMsg(v12, v7);
  }
  uint64_t v13 = (a3 - *(&v11->super.size_ + v8 + 1));
  return [(IOSClass *)v10 getWithInt:v13];
}

- (OrgApacheLuceneIndexMultiDocValues_$3)initWithIntArray:(id)a3 withOrgApacheLuceneIndexBinaryDocValuesArray:(id)a4
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexMultiDocValues__3;
  [(OrgApacheLuceneIndexMultiDocValues_$3 *)&v3 dealloc];
}

@end