@interface OrgApacheLuceneUtilLongValues
+ (void)initialize;
- (OrgApacheLuceneUtilLongValues)init;
- (int64_t)getWithInt:(int)a3;
@end

@implementation OrgApacheLuceneUtilLongValues

- (int64_t)getWithInt:(int)a3
{
  return (int64_t)[(OrgApacheLuceneUtilLongValues *)self getWithLong:a3];
}

- (OrgApacheLuceneUtilLongValues)init
{
  return self;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = [OrgApacheLuceneUtilLongValues__1 alloc];
    OrgApacheLuceneIndexNumericDocValues_init(v2, v3);
    JreStrongAssignAndConsume((id *)&OrgApacheLuceneUtilLongValues_IDENTITY_, v2);
    atomic_store(1u, (unsigned __int8 *)OrgApacheLuceneUtilLongValues__initialized);
  }
}

@end