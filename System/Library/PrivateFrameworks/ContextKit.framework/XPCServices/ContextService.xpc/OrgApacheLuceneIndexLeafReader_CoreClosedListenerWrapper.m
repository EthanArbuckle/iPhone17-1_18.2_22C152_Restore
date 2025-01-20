@interface OrgApacheLuceneIndexLeafReader_CoreClosedListenerWrapper
- (BOOL)isEqual:(id)a3;
- (OrgApacheLuceneIndexLeafReader_CoreClosedListenerWrapper)initWithOrgApacheLuceneIndexLeafReader_CoreClosedListener:(id)a3;
- (unint64_t)hash;
- (void)dealloc;
- (void)onCloseWithOrgApacheLuceneIndexIndexReader:(id)a3;
@end

@implementation OrgApacheLuceneIndexLeafReader_CoreClosedListenerWrapper

- (OrgApacheLuceneIndexLeafReader_CoreClosedListenerWrapper)initWithOrgApacheLuceneIndexLeafReader_CoreClosedListener:(id)a3
{
  return self;
}

- (void)onCloseWithOrgApacheLuceneIndexIndexReader:(id)a3
{
  listener = self->listener_;
  if (!listener || !a3) {
    JreThrowNullPointerException();
  }
  id v4 = [a3 getCoreCacheKey];
  [(OrgApacheLuceneIndexLeafReader_CoreClosedListener *)listener onCloseWithId:v4];
}

- (unint64_t)hash
{
  listener = self->listener_;
  if (!listener) {
    JreThrowNullPointerException();
  }
  return (int)[(OrgApacheLuceneIndexLeafReader_CoreClosedListener *)listener hash];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  listener = self->listener_;
  if (!listener || (objc_opt_class(), !a3)) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  uint64_t v6 = *((void *)a3 + 1);
  return [(OrgApacheLuceneIndexLeafReader_CoreClosedListener *)listener isEqual:v6];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexLeafReader_CoreClosedListenerWrapper;
  [(OrgApacheLuceneIndexLeafReader_CoreClosedListenerWrapper *)&v3 dealloc];
}

@end