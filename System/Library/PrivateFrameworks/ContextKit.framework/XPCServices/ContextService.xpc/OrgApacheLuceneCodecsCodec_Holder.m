@interface OrgApacheLuceneCodecsCodec_Holder
+ (void)initialize;
@end

@implementation OrgApacheLuceneCodecsCodec_Holder

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    if (qword_1005600E0 != -1) {
      dispatch_once(&qword_1005600E0, &stru_1003F1C90);
    }
    v2 = new_OrgApacheLuceneUtilNamedSPILoader_initWithIOSClass_((void *)qword_1005600D8);
    JreStrongAssignAndConsume((id *)&qword_1005600E8, v2);
    JreStrongAssign((id *)&qword_1005600D0, 0);
    atomic_store(1u, (unsigned __int8 *)&OrgApacheLuceneCodecsCodec_Holder__initialized);
  }
}

@end