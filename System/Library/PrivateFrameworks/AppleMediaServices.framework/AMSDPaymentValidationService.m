@interface AMSDPaymentValidationService
+ (BOOL)isConnectionEntitled:(id)a3;
+ (OS_dispatch_queue)sharedQueue;
+ (id)paymentHardwareType;
+ (id)sharedService;
- (void)paymentHardwareStatusHeaderWithCompletion:(id)a3;
@end

@implementation AMSDPaymentValidationService

+ (id)sharedService
{
  if (qword_100130390 != -1) {
    dispatch_once(&qword_100130390, &stru_100113A68);
  }
  v2 = (void *)qword_100130398;
  return v2;
}

+ (OS_dispatch_queue)sharedQueue
{
  if (qword_1001303A0 != -1) {
    dispatch_once(&qword_1001303A0, &stru_100113A88);
  }
  v2 = (void *)qword_1001303A8;
  return (OS_dispatch_queue *)v2;
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

- (void)paymentHardwareStatusHeaderWithCompletion:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(id)objc_opt_class() sharedQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100049AA0;
  v7[3] = &unk_100112600;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  +[AMSDTransactionStore takeKeepAliveTransaction:@"com.apple.amsaccountsd.paymentvalidation" withQueue:v5 whilePerformingBlock:v7];
}

+ (id)paymentHardwareType
{
  return @"ARM64";
}

@end