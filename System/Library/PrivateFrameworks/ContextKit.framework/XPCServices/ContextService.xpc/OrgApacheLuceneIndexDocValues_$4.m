@interface OrgApacheLuceneIndexDocValues_$4
- (BOOL)getWithInt:(int)a3;
- (OrgApacheLuceneIndexDocValues_$4)initWithOrgApacheLuceneIndexSortedDocValues:(id)a3 withInt:(int)a4;
- (int)length;
- (void)dealloc;
@end

@implementation OrgApacheLuceneIndexDocValues_$4

- (BOOL)getWithInt:(int)a3
{
  v3 = self->val$dv_;
  if (!v3) {
    JreThrowNullPointerException();
  }
  return (int)[(OrgApacheLuceneIndexSortedDocValues *)v3 getOrdWithInt:*(void *)&a3] >= 0;
}

- (int)length
{
  return self->val$maxDoc_;
}

- (OrgApacheLuceneIndexDocValues_$4)initWithOrgApacheLuceneIndexSortedDocValues:(id)a3 withInt:(int)a4
{
  self->val$maxDoc_ = a4;
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexDocValues__4;
  [(OrgApacheLuceneIndexDocValues_$4 *)&v3 dealloc];
}

@end