@interface HMCameraSnapshot
@end

@implementation HMCameraSnapshot

uint64_t __63__HMCameraSnapshot_HFAdditions__hf_localizedAgeForCaptureDate___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08780]);
  v1 = (void *)_MergedGlobals_314;
  _MergedGlobals_314 = (uint64_t)v0;

  [(id)_MergedGlobals_314 setMaximumUnitCount:1];
  v2 = [MEMORY[0x263EFF960] autoupdatingCurrentLocale];
  v3 = [v2 languageCode];
  int v4 = [v3 hasPrefix:@"ja"];

  if (v4) {
    uint64_t v5 = 5;
  }
  else {
    uint64_t v5 = 1;
  }
  v6 = (void *)_MergedGlobals_314;
  return [v6 setUnitsStyle:v5];
}

@end