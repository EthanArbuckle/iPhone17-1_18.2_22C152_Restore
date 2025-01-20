@interface OrgApacheLuceneCodecsDocValuesFormat_Holder
+ (void)initialize;
@end

@implementation OrgApacheLuceneCodecsDocValuesFormat_Holder

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    if (qword_100560530 != -1) {
      dispatch_once(&qword_100560530, &stru_1003F2310);
    }
    v2 = new_OrgApacheLuceneUtilNamedSPILoader_initWithIOSClass_((void *)qword_100560528);
    JreStrongAssignAndConsume((id *)&qword_100560538, v2);
    atomic_store(1u, (unsigned __int8 *)&OrgApacheLuceneCodecsDocValuesFormat_Holder__initialized);
  }
}

@end