@interface OrgApacheLuceneCodecsPostingsFormat_Holder
+ (void)initialize;
@end

@implementation OrgApacheLuceneCodecsPostingsFormat_Holder

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = (void *)OrgApacheLuceneCodecsPostingsFormat_class_();
    v3 = new_OrgApacheLuceneUtilNamedSPILoader_initWithIOSClass_(v2);
    JreStrongAssignAndConsume((id *)&qword_100560770, v3);
    atomic_store(1u, (unsigned __int8 *)OrgApacheLuceneCodecsPostingsFormat_Holder__initialized);
  }
}

@end