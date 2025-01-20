@interface NSProcessInfo
@end

@implementation NSProcessInfo

id __57__NSProcessInfo_MIMEAdditions__mf_thermalStateObservable__block_invoke(uint64_t a1)
{
  v1 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "thermalState"));
  return v1;
}

@end