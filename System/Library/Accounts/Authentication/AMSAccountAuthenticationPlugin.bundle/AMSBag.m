@interface AMSBag
+ (id)ams_bagForProcessInfo:(id)a3;
@end

@implementation AMSBag

+ (id)ams_bagForProcessInfo:(id)a3
{
  return +[AMSBag bagForProfile:@"Accounts" profileVersion:@"1" processInfo:a3];
}

@end