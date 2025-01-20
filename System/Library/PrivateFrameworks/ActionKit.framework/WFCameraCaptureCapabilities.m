@interface WFCameraCaptureCapabilities
+ (WFCameraCaptureCapabilities)capabilities;
- (BOOL)isSupportedMode:(int64_t)a3 withDevice:(int64_t)a4;
- (CAMCaptureCapabilities)capabilities;
- (WFCameraCaptureCapabilities)init;
@end

@implementation WFCameraCaptureCapabilities

- (void).cxx_destruct
{
}

- (CAMCaptureCapabilities)capabilities
{
  return self->_capabilities;
}

- (BOOL)isSupportedMode:(int64_t)a3 withDevice:(int64_t)a4
{
  v6 = [(WFCameraCaptureCapabilities *)self capabilities];
  LOBYTE(a4) = [v6 isSupportedMode:a3 withDevice:a4];

  return a4;
}

- (WFCameraCaptureCapabilities)init
{
  v9.receiver = self;
  v9.super_class = (Class)WFCameraCaptureCapabilities;
  v2 = [(WFCameraCaptureCapabilities *)&v9 init];
  if (v2)
  {
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x2050000000;
    v3 = (void *)getCAMCaptureCapabilitiesClass_softClass;
    uint64_t v14 = getCAMCaptureCapabilitiesClass_softClass;
    if (!getCAMCaptureCapabilitiesClass_softClass)
    {
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __getCAMCaptureCapabilitiesClass_block_invoke;
      v10[3] = &unk_264E5EC88;
      v10[4] = &v11;
      __getCAMCaptureCapabilitiesClass_block_invoke((uint64_t)v10);
      v3 = (void *)v12[3];
    }
    v4 = v3;
    _Block_object_dispose(&v11, 8);
    uint64_t v5 = [[v4 alloc] initWithHostProcess:0];
    capabilities = v2->_capabilities;
    v2->_capabilities = (CAMCaptureCapabilities *)v5;

    v7 = v2;
  }

  return v2;
}

+ (WFCameraCaptureCapabilities)capabilities
{
  if (capabilities_onceToken != -1) {
    dispatch_once(&capabilities_onceToken, &__block_literal_global_1363);
  }
  v2 = (void *)capabilities_capabilities;
  return (WFCameraCaptureCapabilities *)v2;
}

void __43__WFCameraCaptureCapabilities_capabilities__block_invoke()
{
  v0 = objc_alloc_init(WFCameraCaptureCapabilities);
  v1 = (void *)capabilities_capabilities;
  capabilities_capabilities = (uint64_t)v0;
}

@end