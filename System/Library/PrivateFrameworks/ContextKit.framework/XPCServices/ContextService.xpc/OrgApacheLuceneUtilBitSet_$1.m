@interface OrgApacheLuceneUtilBitSet_$1
- (OrgApacheLuceneUtilBitSet_$1)initWithOrgApacheLuceneUtilBitSet:(id)a3;
- (void)dealloc;
- (void)finish;
- (void)onMatchWithInt:(int)a3;
@end

@implementation OrgApacheLuceneUtilBitSet_$1

- (void)onMatchWithInt:(int)a3
{
  self->previous_ = a3;
}

- (void)finish
{
  int v3 = self->previous_ + 1;
  if (v3 < (int)[(OrgApacheLuceneUtilBitSet *)self->this$0_ length])
  {
    v4 = self->this$0_;
    uint64_t v5 = (self->previous_ + 1);
    id v6 = [(OrgApacheLuceneUtilBitSet *)v4 length];
    [(OrgApacheLuceneUtilBitSet *)v4 clearWithInt:v5 withInt:v6];
  }
}

- (OrgApacheLuceneUtilBitSet_$1)initWithOrgApacheLuceneUtilBitSet:(id)a3
{
  self->previous_ = -1;
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilBitSet__1;
  [(OrgApacheLuceneUtilBitSet_$1 *)&v3 dealloc];
}

@end