@interface OrgApacheLuceneIndexCompositeReaderContext_Builder
- (OrgApacheLuceneIndexCompositeReaderContext_Builder)initWithOrgApacheLuceneIndexCompositeReader:(id)a3;
- (id)build;
- (id)buildWithOrgApacheLuceneIndexCompositeReaderContext:(id)a3 withOrgApacheLuceneIndexIndexReader:(id)a4 withInt:(int)a5 withInt:(int)a6;
- (void)dealloc;
@end

@implementation OrgApacheLuceneIndexCompositeReaderContext_Builder

- (OrgApacheLuceneIndexCompositeReaderContext_Builder)initWithOrgApacheLuceneIndexCompositeReader:(id)a3
{
  p_leaves = &self->leaves_;
  v6 = new_JavaUtilArrayList_init();
  JreStrongAssignAndConsume((id *)p_leaves, v6);
  self->leafDocBase_ = 0;
  JreStrongAssign((id *)&self->reader_, a3);
  return self;
}

- (id)build
{
  v2 = sub_10009F568((uint64_t)self, 0, self->reader_, 0, 0);
  objc_opt_class();
  if (v2 && (objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  return v2;
}

- (id)buildWithOrgApacheLuceneIndexCompositeReaderContext:(id)a3 withOrgApacheLuceneIndexIndexReader:(id)a4 withInt:(int)a5 withInt:(int)a6
{
  return sub_10009F568((uint64_t)self, a3, a4, a5, a6);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexCompositeReaderContext_Builder;
  [(OrgApacheLuceneIndexCompositeReaderContext_Builder *)&v3 dealloc];
}

@end