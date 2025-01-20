@interface AMSApplePayClassic
+ (AMSBagKeySet)bagKeySet;
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
+ (id)createBagForSubProfile;
@end

@implementation AMSApplePayClassic

+ (NSString)bagSubProfile
{
  if (_MergedGlobals_81 != -1) {
    dispatch_once(&_MergedGlobals_81, &__block_literal_global_8);
  }
  v2 = (void *)qword_1EB38D628;
  return (NSString *)v2;
}

void __35__AMSApplePayClassic_bagSubProfile__block_invoke()
{
  v0 = (void *)qword_1EB38D628;
  qword_1EB38D628 = @"AMSApplePayClassic";
}

+ (NSString)bagSubProfileVersion
{
  if (qword_1EB38D630 != -1) {
    dispatch_once(&qword_1EB38D630, &__block_literal_global_3);
  }
  v2 = (void *)qword_1EB38D638;
  return (NSString *)v2;
}

void __42__AMSApplePayClassic_bagSubProfileVersion__block_invoke()
{
  v0 = (void *)qword_1EB38D638;
  qword_1EB38D638 = @"1";
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