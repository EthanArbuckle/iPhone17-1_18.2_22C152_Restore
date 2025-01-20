@interface OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_$7
- (OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_$7)initWithOrgApacheLuceneUtilLongValues:(id)a3 withOrgApacheLuceneIndexBinaryDocValues:(id)a4 withInt:(int)a5;
- (id)lookupOrdWithInt:(int)a3;
- (id)termsEnum;
- (int)getOrdWithInt:(int)a3;
- (int)getValueCount;
- (int)lookupTermWithOrgApacheLuceneUtilBytesRef:(id)a3;
- (void)dealloc;
@end

@implementation OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_$7

- (int)getOrdWithInt:(int)a3
{
  v3 = self->val$ordinals_;
  if (!v3) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneUtilLongValues *)v3 getWithInt:*(void *)&a3];
}

- (id)lookupOrdWithInt:(int)a3
{
  v3 = self->val$binary_;
  if (!v3) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneIndexBinaryDocValues *)v3 getWithInt:*(void *)&a3];
}

- (int)getValueCount
{
  return self->val$valueCount_;
}

- (int)lookupTermWithOrgApacheLuceneUtilBytesRef:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = self->val$binary_;
    objc_opt_class();
    if (!v5) {
      JreThrowNullPointerException();
    }
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      JreThrowClassCastException();
    }
    return [(OrgApacheLuceneIndexBinaryDocValues *)v5 lookupTermWithOrgApacheLuceneUtilBytesRef:a3];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer__7;
    return [(OrgApacheLuceneIndexSortedDocValues *)&v7 lookupTermWithOrgApacheLuceneUtilBytesRef:a3];
  }
}

- (id)termsEnum
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = self->val$binary_;
    objc_opt_class();
    if (!v3) {
      JreThrowNullPointerException();
    }
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      JreThrowClassCastException();
    }
    return [(OrgApacheLuceneIndexBinaryDocValues *)v3 getTermsEnum];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer__7;
    return [(OrgApacheLuceneIndexSortedDocValues *)&v5 termsEnum];
  }
}

- (OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_$7)initWithOrgApacheLuceneUtilLongValues:(id)a3 withOrgApacheLuceneIndexBinaryDocValues:(id)a4 withInt:(int)a5
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer__7;
  [(OrgApacheLuceneIndexSortedDocValues *)&v3 dealloc];
}

@end