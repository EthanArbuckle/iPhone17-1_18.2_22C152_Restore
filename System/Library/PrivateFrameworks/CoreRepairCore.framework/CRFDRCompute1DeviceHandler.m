@interface CRFDRCompute1DeviceHandler
+ (BOOL)isCompute1ProductType:(int)a3;
+ (id)getDeviceHandlerForProductType:(int)a3;
- (BOOL)supportPatch;
- (BOOL)validatePatchWithPartSPC:(id)a3 originalClasses:(id)a4 originalInstances:(id)a5 originalValues:(id)a6 validClasses:(id)a7 validInstances:(id)a8;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation CRFDRCompute1DeviceHandler

+ (BOOL)isCompute1ProductType:(int)a3
{
  return *(void *)&a3 == 791036992;
}

+ (id)getDeviceHandlerForProductType:(int)a3
{
  if (objc_msgSend_isCompute1ProductType_(CRFDRCompute1DeviceHandler, a2, *(uint64_t *)&a3, v3))v4 = objc_alloc_init(CRFDRCompute1DeviceHandler); {
  else
  }
    v4 = 0;
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_alloc_init(CRFDRCompute1DeviceHandler);
}

- (BOOL)supportPatch
{
  return 1;
}

- (BOOL)validatePatchWithPartSPC:(id)a3 originalClasses:(id)a4 originalInstances:(id)a5 originalValues:(id)a6 validClasses:(id)a7 validInstances:(id)a8
{
  return 1;
}

@end