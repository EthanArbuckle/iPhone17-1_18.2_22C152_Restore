@interface AVCaptureDevice(JFX)
- (uint64_t)jfx_highestQualityColorSpace;
- (uint64_t)jfx_supportsDepth;
- (uint64_t)jfx_trueDepthCamera;
@end

@implementation AVCaptureDevice(JFX)

- (uint64_t)jfx_trueDepthCamera
{
  v1 = [a1 deviceType];
  uint64_t v2 = [v1 isEqualToString:*MEMORY[0x263EF9658]];

  return v2;
}

- (uint64_t)jfx_supportsDepth
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v1 = objc_msgSend(a1, "formats", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v9 != v3) {
          objc_enumerationMutation(v1);
        }
        v5 = [*(id *)(*((void *)&v8 + 1) + 8 * i) supportedDepthDataFormats];
        uint64_t v6 = [v5 count];

        if (v6)
        {
          uint64_t v2 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v2;
}

- (uint64_t)jfx_highestQualityColorSpace
{
  if (jfx_highestQualityColorSpace_onceToken != -1) {
    dispatch_once(&jfx_highestQualityColorSpace_onceToken, &__block_literal_global_649);
  }
  uint64_t v2 = [a1 deviceType];
  id v3 = (id)jfx_highestQualityColorSpace_s_colorSpaceLookup;
  objc_sync_enter(v3);
  v4 = [(id)jfx_highestQualityColorSpace_s_colorSpaceLookup objectForKeyedSubscript:v2];

  if (!v4)
  {
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x2020000000;
    uint64_t v14 = 0;
    v5 = [a1 formats];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __52__AVCaptureDevice_JFX__jfx_highestQualityColorSpace__block_invoke_2;
    v10[3] = &unk_264C0C000;
    v10[4] = &v11;
    [v5 enumerateObjectsUsingBlock:v10];
    uint64_t v6 = [NSNumber numberWithInteger:v12[3]];
    [(id)jfx_highestQualityColorSpace_s_colorSpaceLookup setObject:v6 forKeyedSubscript:v2];

    _Block_object_dispose(&v11, 8);
  }
  objc_sync_exit(v3);

  v7 = [(id)jfx_highestQualityColorSpace_s_colorSpaceLookup objectForKeyedSubscript:v2];
  uint64_t v8 = [v7 integerValue];

  return v8;
}

@end