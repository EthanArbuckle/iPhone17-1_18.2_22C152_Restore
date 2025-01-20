@interface OrgApacheLuceneUtilBits
+ (void)initialize;
@end

@implementation OrgApacheLuceneUtilBits

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v2 = +[IOSObjectArray newArrayWithLength:0 type:OrgApacheLuceneUtilBits_class_()];
    JreStrongAssignAndConsume(&OrgApacheLuceneUtilBits_EMPTY_ARRAY_, v2);
    atomic_store(1u, (unsigned __int8 *)OrgApacheLuceneUtilBits__initialized);
  }
}

@end