@interface MTLFXSpatialScaler
@end

@implementation MTLFXSpatialScaler

id __48___MTLFXSpatialScaler__emitTelemetry_forDevice___block_invoke(void *a1)
{
  v21[11] = *MEMORY[0x263EF8340];
  MainBundle = CFBundleGetMainBundle();
  if (MainBundle)
  {
    v3 = CFBundleGetInfoDictionary(MainBundle);
    if (v3)
    {
      id v19 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      v4 = @"Unknown";
      v5 = [v3 objectForKeyedSubscript:*MEMORY[0x263EFFB58]];
      v6 = v5;
      if (v5) {
        v4 = v5;
      }
      v7 = [v3 objectForKeyedSubscript:*MEMORY[0x263EFFB70]];

      if (v7) {
        v8 = v7;
      }
      else {
        v8 = @"Unknown";
      }
    }
    else
    {
      id v19 = 0;
      v4 = @"Unknown";
      v8 = @"Unknown";
    }
  }
  else
  {
    id v19 = 0;
    v4 = @"Unknown";
    v8 = @"Unknown";
  }
  v20[0] = @"bundleIdentifier";
  v20[1] = @"bundleVersion";
  v21[0] = v4;
  v21[1] = v8;
  v20[2] = @"class";
  v20[3] = @"gpu";
  uint64_t v9 = a1[5];
  v21[2] = a1[4];
  v21[3] = v9;
  v20[4] = @"colorTextureFormat";
  v10 = [NSNumber numberWithUnsignedInteger:a1[6]];
  v21[4] = v10;
  v20[5] = @"outputTextureFormat";
  v11 = [NSNumber numberWithUnsignedInteger:a1[7]];
  v21[5] = v11;
  v20[6] = @"inputWidth";
  v12 = [NSNumber numberWithUnsignedInteger:a1[8]];
  v21[6] = v12;
  v20[7] = @"inputHeight";
  v13 = [NSNumber numberWithUnsignedInteger:a1[9]];
  v21[7] = v13;
  v20[8] = @"outputWidth";
  v14 = [NSNumber numberWithUnsignedInteger:a1[10]];
  v21[8] = v14;
  v20[9] = @"outputHeight";
  v15 = [NSNumber numberWithUnsignedInteger:a1[11]];
  v21[9] = v15;
  v20[10] = @"version";
  v16 = [NSNumber numberWithUnsignedInteger:a1[12]];
  v21[10] = v16;
  v17 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:11];

  return v17;
}

@end