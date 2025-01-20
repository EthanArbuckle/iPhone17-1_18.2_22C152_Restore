@interface OrgApacheLuceneSearchTermCollectingRewrite_TermCollector
- (OrgApacheLuceneSearchTermCollectingRewrite_TermCollector)init;
- (void)dealloc;
- (void)setReaderContextWithOrgApacheLuceneIndexIndexReaderContext:(id)a3 withOrgApacheLuceneIndexLeafReaderContext:(id)a4;
@end

@implementation OrgApacheLuceneSearchTermCollectingRewrite_TermCollector

- (void)setReaderContextWithOrgApacheLuceneIndexIndexReaderContext:(id)a3 withOrgApacheLuceneIndexLeafReaderContext:(id)a4
{
  JreStrongAssign((id *)&self->readerContext_, a4);
  JreStrongAssign((id *)&self->topReaderContext_, a3);
}

- (OrgApacheLuceneSearchTermCollectingRewrite_TermCollector)init
{
  p_attributes = &self->attributes_;
  v4 = new_OrgApacheLuceneUtilAttributeSource_init();
  JreStrongAssignAndConsume((id *)p_attributes, v4);
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchTermCollectingRewrite_TermCollector;
  [(OrgApacheLuceneSearchTermCollectingRewrite_TermCollector *)&v3 dealloc];
}

@end