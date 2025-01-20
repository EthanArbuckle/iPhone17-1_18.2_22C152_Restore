@interface OrgApacheLuceneIndexDocValues_$6
- (BOOL)getWithInt:(int)a3;
- (OrgApacheLuceneIndexDocValues_$6)initWithOrgApacheLuceneIndexSortedNumericDocValues:(id)a3 withInt:(int)a4;
- (int)length;
- (void)dealloc;
@end

@implementation OrgApacheLuceneIndexDocValues_$6

- (BOOL)getWithInt:(int)a3
{
  v4 = self->val$dv_;
  if (!v4) {
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneIndexSortedNumericDocValues *)v4 setDocumentWithInt:*(void *)&a3];
  return [(OrgApacheLuceneIndexSortedNumericDocValues *)self->val$dv_ count] != 0;
}

- (int)length
{
  return self->val$maxDoc_;
}

- (OrgApacheLuceneIndexDocValues_$6)initWithOrgApacheLuceneIndexSortedNumericDocValues:(id)a3 withInt:(int)a4
{
  self->val$maxDoc_ = a4;
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexDocValues__6;
  [(OrgApacheLuceneIndexDocValues_$6 *)&v3 dealloc];
}

@end