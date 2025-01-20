@interface OrgApacheLuceneIndexLeafReader_LeafReaderClosedListener
- (OrgApacheLuceneIndexLeafReader_LeafReaderClosedListener)initWithOrgApacheLuceneIndexLeafReader:(id)a3;
- (void)dealloc;
- (void)onCloseWithOrgApacheLuceneIndexIndexReader:(id)a3;
@end

@implementation OrgApacheLuceneIndexLeafReader_LeafReaderClosedListener

- (OrgApacheLuceneIndexLeafReader_LeafReaderClosedListener)initWithOrgApacheLuceneIndexLeafReader:(id)a3
{
  p_weakRef = &self->weakRef_;
  v5 = new_JavaLangRefWeakReference_initWithId_((unint64_t)a3);
  JreStrongAssignAndConsume((id *)p_weakRef, v5);
  return self;
}

- (void)onCloseWithOrgApacheLuceneIndexIndexReader:(id)a3
{
  weakRef = self->weakRef_;
  if (!weakRef) {
    JreThrowNullPointerException();
  }
  id v6 = [(JavaLangRefReference *)weakRef get];
  if (v6) {
    BOOL v7 = v6 == a3;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    JreStrongAssign((id *)a3 + 5, 0);
    v8 = self->weakRef_;
    [(JavaLangRefReference *)v8 clear];
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexLeafReader_LeafReaderClosedListener;
  [(OrgApacheLuceneIndexLeafReader_LeafReaderClosedListener *)&v3 dealloc];
}

@end