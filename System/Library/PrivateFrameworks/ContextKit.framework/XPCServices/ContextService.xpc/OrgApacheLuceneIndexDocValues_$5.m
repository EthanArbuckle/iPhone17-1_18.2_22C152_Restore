@interface OrgApacheLuceneIndexDocValues_$5
- (BOOL)getWithInt:(int)a3;
- (OrgApacheLuceneIndexDocValues_$5)initWithOrgApacheLuceneIndexSortedSetDocValues:(id)a3 withInt:(int)a4;
- (int)length;
- (void)dealloc;
@end

@implementation OrgApacheLuceneIndexDocValues_$5

- (BOOL)getWithInt:(int)a3
{
  v4 = self->val$dv_;
  if (!v4) {
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneIndexSortedSetDocValues *)v4 setDocumentWithInt:*(void *)&a3];
  return [(OrgApacheLuceneIndexSortedSetDocValues *)self->val$dv_ nextOrd] != (id)-1;
}

- (int)length
{
  return self->val$maxDoc_;
}

- (OrgApacheLuceneIndexDocValues_$5)initWithOrgApacheLuceneIndexSortedSetDocValues:(id)a3 withInt:(int)a4
{
  self->val$maxDoc_ = a4;
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexDocValues__5;
  [(OrgApacheLuceneIndexDocValues_$5 *)&v3 dealloc];
}

@end