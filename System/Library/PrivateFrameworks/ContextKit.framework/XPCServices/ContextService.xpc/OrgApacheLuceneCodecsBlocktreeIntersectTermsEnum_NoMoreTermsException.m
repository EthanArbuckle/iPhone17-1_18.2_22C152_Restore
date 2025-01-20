@interface OrgApacheLuceneCodecsBlocktreeIntersectTermsEnum_NoMoreTermsException
+ (void)initialize;
- (OrgApacheLuceneCodecsBlocktreeIntersectTermsEnum_NoMoreTermsException)init;
@end

@implementation OrgApacheLuceneCodecsBlocktreeIntersectTermsEnum_NoMoreTermsException

- (OrgApacheLuceneCodecsBlocktreeIntersectTermsEnum_NoMoreTermsException)init
{
  return self;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = [OrgApacheLuceneCodecsBlocktreeIntersectTermsEnum_NoMoreTermsException alloc];
    JavaLangRuntimeException_init(v2, v3);
    JreStrongAssignAndConsume((id *)&qword_1005606B8, v2);
    atomic_store(1u, (unsigned __int8 *)&OrgApacheLuceneCodecsBlocktreeIntersectTermsEnum_NoMoreTermsException__initialized);
  }
}

@end