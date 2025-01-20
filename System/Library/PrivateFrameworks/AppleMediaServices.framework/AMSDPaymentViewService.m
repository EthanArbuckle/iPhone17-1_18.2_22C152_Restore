@interface AMSDPaymentViewService
+ (BOOL)isConnectionEntitled:(id)a3;
+ (id)sharedService;
@end

@implementation AMSDPaymentViewService

+ (id)sharedService
{
  if (qword_1001303C0 != -1) {
    dispatch_once(&qword_1001303C0, &stru_100113AE8);
  }
  v2 = (void *)qword_1001303C8;
  return v2;
}

+ (BOOL)isConnectionEntitled:(id)a3
{
  v3 = [a3 valueForEntitlement:@"com.apple.private.applemediaservices"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  unsigned __int8 v5 = [v4 BOOLValue];
  return v5;
}

@end