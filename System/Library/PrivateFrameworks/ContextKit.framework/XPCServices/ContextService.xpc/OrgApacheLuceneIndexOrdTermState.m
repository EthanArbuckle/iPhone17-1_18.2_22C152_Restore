@interface OrgApacheLuceneIndexOrdTermState
- (OrgApacheLuceneIndexOrdTermState)init;
- (id)description;
- (void)copyFromWithOrgApacheLuceneIndexTermState:(id)a3;
@end

@implementation OrgApacheLuceneIndexOrdTermState

- (OrgApacheLuceneIndexOrdTermState)init
{
  return self;
}

- (void)copyFromWithOrgApacheLuceneIndexTermState:(id)a3
{
  if (a3 && (objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  self->ord_ = *((void *)a3 + 1);
}

- (id)description
{
  return (id)JreStrcat("$J", (uint64_t)a2, v2, v3, v4, v5, v6, v7, @"OrdTermState ord=");
}

@end