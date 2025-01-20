@interface CRLocalization
+ (id)localizedStringWithKey:(id)a3;
@end

@implementation CRLocalization

+ (id)localizedStringWithKey:(id)a3
{
  id v4 = a3;
  if (qword_267EF8218 != -1) {
    dispatch_once(&qword_267EF8218, &unk_26D157B88);
  }
  if (qword_267EF8210)
  {
    objc_msgSend_localizedStringForKey_value_table_((void *)qword_267EF8210, v3, (uint64_t)v4, (uint64_t)&stru_26D158688, @"Localizable-Release");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = v4;
  }
  v6 = v5;

  return v6;
}

@end