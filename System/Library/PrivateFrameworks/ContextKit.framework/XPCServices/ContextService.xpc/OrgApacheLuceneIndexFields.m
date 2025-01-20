@interface OrgApacheLuceneIndexFields
+ (void)initialize;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
@end

@implementation OrgApacheLuceneIndexFields

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v2 = +[IOSObjectArray newArrayWithLength:0 type:OrgApacheLuceneIndexFields_class_()];
    JreStrongAssignAndConsume((id *)&OrgApacheLuceneIndexFields_EMPTY_ARRAY_, v2);
    atomic_store(1u, (unsigned __int8 *)OrgApacheLuceneIndexFields__initialized);
  }
}

@end