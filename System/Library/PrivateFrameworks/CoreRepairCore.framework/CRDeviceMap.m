@interface CRDeviceMap
+ (id)currentDevice;
+ (id)getComponentName:(int)a3;
+ (id)getKeysInComponent:(int)a3;
+ (id)getSupportedComponentTypes;
@end

@implementation CRDeviceMap

+ (id)currentDevice
{
  if (qword_26AC133D8 != -1) {
    dispatch_once(&qword_26AC133D8, &unk_26D1578A8);
  }
  v2 = (void *)qword_26AC133D0;
  return v2;
}

+ (id)getSupportedComponentTypes
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_21FC2CDF8;
  block[3] = &unk_26452A940;
  block[4] = a1;
  if (qword_26AC133E0 != -1) {
    dispatch_once(&qword_26AC133E0, block);
  }
  v2 = (void *)qword_26AC133E8;
  return v2;
}

+ (id)getComponentName:(int)a3
{
  uint64_t v4 = *(void *)&a3;
  v5 = objc_msgSend_currentDevice(a1, a2, *(uint64_t *)&a3, v3);
  v8 = objc_msgSend_getComponentByType_(v5, v6, v4, v7);
  v12 = objc_msgSend_name(v8, v9, v10, v11);

  return v12;
}

+ (id)getKeysInComponent:(int)a3
{
  uint64_t v4 = *(void *)&a3;
  v5 = objc_msgSend_currentDevice(a1, a2, *(uint64_t *)&a3, v3);
  v8 = objc_msgSend_getComponentByType_(v5, v6, v4, v7);
  v12 = objc_msgSend_fdrKeys(v8, v9, v10, v11);

  return v12;
}

@end