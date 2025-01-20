@interface OrgApacheLuceneUtilCounter
+ (id)newCounter;
+ (id)newCounterWithBoolean:(BOOL)a3;
@end

@implementation OrgApacheLuceneUtilCounter

+ (id)newCounter
{
  v2 = [OrgApacheLuceneUtilCounter_SerialCounter alloc];
  v2->count_ = 0;
  return v2;
}

+ (id)newCounterWithBoolean:(BOOL)a3
{
  return OrgApacheLuceneUtilCounter_newCounterWithBoolean_(a3);
}

@end