@interface AMSPurchaseBagConsumer
+ (AMSBagKeySet)bagKeySet;
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
+ (id)createBagForSubProfile;
@end

@implementation AMSPurchaseBagConsumer

+ (NSString)bagSubProfile
{
  if (_MergedGlobals_139 != -1) {
    dispatch_once(&_MergedGlobals_139, &__block_literal_global_107);
  }
  v2 = (void *)qword_1EB38DF18;
  return (NSString *)v2;
}

void __39__AMSPurchaseBagConsumer_bagSubProfile__block_invoke()
{
  v0 = (void *)qword_1EB38DF18;
  qword_1EB38DF18 = @"AMSPurchase";
}

+ (NSString)bagSubProfileVersion
{
  if (qword_1EB38DF20 != -1) {
    dispatch_once(&qword_1EB38DF20, &__block_literal_global_3_4);
  }
  v2 = (void *)qword_1EB38DF28;
  return (NSString *)v2;
}

void __46__AMSPurchaseBagConsumer_bagSubProfileVersion__block_invoke()
{
  v0 = (void *)qword_1EB38DF28;
  qword_1EB38DF28 = @"1";
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