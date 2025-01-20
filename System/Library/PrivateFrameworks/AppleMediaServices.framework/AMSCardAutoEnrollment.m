@interface AMSCardAutoEnrollment
+ (AMSBagKeySet)bagKeySet;
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
+ (id)createBagForSubProfile;
@end

@implementation AMSCardAutoEnrollment

+ (NSString)bagSubProfile
{
  if (_MergedGlobals_89 != -1) {
    dispatch_once(&_MergedGlobals_89, &__block_literal_global_24);
  }
  v2 = (void *)qword_1EB38D708;
  return (NSString *)v2;
}

void __38__AMSCardAutoEnrollment_bagSubProfile__block_invoke()
{
  v0 = (void *)qword_1EB38D708;
  qword_1EB38D708 = @"AMSCardEnrollment";
}

+ (NSString)bagSubProfileVersion
{
  if (qword_1EB38D710 != -1) {
    dispatch_once(&qword_1EB38D710, &__block_literal_global_3_1);
  }
  v2 = (void *)qword_1EB38D718;
  return (NSString *)v2;
}

void __45__AMSCardAutoEnrollment_bagSubProfileVersion__block_invoke()
{
  v0 = (void *)qword_1EB38D718;
  qword_1EB38D718 = @"1";
}

+ (id)createBagForSubProfile
{
  v2 = [(id)objc_opt_class() bagSubProfile];
  v3 = [(id)objc_opt_class() bagSubProfileVersion];
  v4 = +[AMSBag bagForProfile:v2 profileVersion:v3];

  return v4;
}

+ (AMSBagKeySet)bagKeySet
{
  v2 = objc_alloc_init(AMSBagKeySet);
  return v2;
}

@end