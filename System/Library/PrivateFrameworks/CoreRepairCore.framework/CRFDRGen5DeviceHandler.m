@interface CRFDRGen5DeviceHandler
+ (BOOL)isGen5ProductType:(int)a3;
+ (id)getDeviceHandlerForProductType:(int)a3;
@end

@implementation CRFDRGen5DeviceHandler

+ (BOOL)isGen5ProductType:(int)a3
{
  BOOL result = 1;
  if (*(uint64_t *)&a3 > 2688879998)
  {
    if (*(void *)&a3 == 2688879999) {
      return result;
    }
    uint64_t v4 = 2940697645;
  }
  else
  {
    if (*(void *)&a3 == 1434404433) {
      return result;
    }
    uint64_t v4 = 2021146989;
  }
  if (*(void *)&a3 != v4) {
    return 0;
  }
  return result;
}

+ (id)getDeviceHandlerForProductType:(int)a3
{
  if (objc_msgSend_isGen5ProductType_(CRFDRGen5DeviceHandler, a2, *(uint64_t *)&a3, v3)) {
    uint64_t v4 = objc_alloc_init(CRFDRGen5DeviceHandler);
  }
  else {
    uint64_t v4 = 0;
  }
  return v4;
}

@end