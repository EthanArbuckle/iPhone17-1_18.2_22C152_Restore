@interface OrgApacheLuceneIndexSegmentCoreReaders_TermVectorsLocal
- (OrgApacheLuceneIndexSegmentCoreReaders_TermVectorsLocal)initWithOrgApacheLuceneIndexSegmentCoreReaders:(id)a3;
- (id)initialValue;
- (void)__javaClone;
@end

@implementation OrgApacheLuceneIndexSegmentCoreReaders_TermVectorsLocal

- (id)initialValue
{
  v2 = &self->this$0_;
  if (!*(objc_loadWeak((id *)&self->this$0_) + 4)) {
    return 0;
  }
  v3 = (void *)*(objc_loadWeak((id *)v2) + 4);
  return [v3 clone];
}

- (OrgApacheLuceneIndexSegmentCoreReaders_TermVectorsLocal)initWithOrgApacheLuceneIndexSegmentCoreReaders:(id)a3
{
  return self;
}

- (void)__javaClone
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexSegmentCoreReaders_TermVectorsLocal;
  [(OrgApacheLuceneIndexSegmentCoreReaders_TermVectorsLocal *)&v3 __javaClone];
}

- (void).cxx_destruct
{
}

@end