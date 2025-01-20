@interface AAURLSessionAdditionalDeviceHeaders
@end

@implementation AAURLSessionAdditionalDeviceHeaders

void ___AAURLSessionAdditionalDeviceHeaders_block_invoke()
{
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v0 = +[AADeviceInfo currentInfo];
  v1 = [v0 udid];

  if (v1) {
    [v6 setObject:v1 forKeyedSubscript:@"X-Apple-Device-Id"];
  }
  v2 = +[AADeviceInfo currentInfo];
  v3 = [v2 serialNumber];

  if (v3) {
    [v6 setObject:v3 forKeyedSubscript:@"X-Apple-I-SRL-NO"];
  }
  uint64_t v4 = [v6 copy];
  v5 = (void *)_AAURLSessionAdditionalDeviceHeaders_additionalDeviceHeaders;
  _AAURLSessionAdditionalDeviceHeaders_additionalDeviceHeaders = v4;
}

@end