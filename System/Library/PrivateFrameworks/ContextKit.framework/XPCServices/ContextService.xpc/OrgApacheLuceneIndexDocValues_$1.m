@interface OrgApacheLuceneIndexDocValues_$1
- (OrgApacheLuceneIndexDocValues_$1)initWithOrgApacheLuceneUtilBytesRef:(id)a3;
- (id)getWithInt:(int)a3;
- (void)dealloc;
@end

@implementation OrgApacheLuceneIndexDocValues_$1

- (id)getWithInt:(int)a3
{
  return self->val$empty_;
}

- (OrgApacheLuceneIndexDocValues_$1)initWithOrgApacheLuceneUtilBytesRef:(id)a3
{
  JreStrongAssign((id *)&self->val$empty_, a3);
  OrgApacheLuceneIndexBinaryDocValues_init(self, v4);
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexDocValues__1;
  [(OrgApacheLuceneIndexDocValues_$1 *)&v3 dealloc];
}

@end