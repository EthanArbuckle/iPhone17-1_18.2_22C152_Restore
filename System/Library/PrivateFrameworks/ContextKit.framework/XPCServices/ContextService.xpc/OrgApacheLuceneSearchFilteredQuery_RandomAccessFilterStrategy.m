@interface OrgApacheLuceneSearchFilteredQuery_RandomAccessFilterStrategy
- (BOOL)alwaysUseRandomAccess;
- (BOOL)useRandomAccessWithOrgApacheLuceneUtilBits:(id)a3 withLong:(int64_t)a4;
- (id)rewriteWithOrgApacheLuceneSearchFilter:(id)a3;
@end

@implementation OrgApacheLuceneSearchFilteredQuery_RandomAccessFilterStrategy

- (id)rewriteWithOrgApacheLuceneSearchFilter:(id)a3
{
  v5 = [OrgApacheLuceneSearchFilteredQuery_RandomAccessFilterWrapperQuery alloc];
  sub_10002A520((uint64_t)v5, (uint64_t)a3, (uint64_t)self);
  return v5;
}

- (BOOL)useRandomAccessWithOrgApacheLuceneUtilBits:(id)a3 withLong:(int64_t)a4
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  return 100 * a4 > (int)[a3 length];
}

- (BOOL)alwaysUseRandomAccess
{
  return 0;
}

@end