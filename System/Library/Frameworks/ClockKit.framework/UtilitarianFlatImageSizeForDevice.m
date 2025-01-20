@interface UtilitarianFlatImageSizeForDevice
@end

@implementation UtilitarianFlatImageSizeForDevice

void ___UtilitarianFlatImageSizeForDevice_block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  *(void *)&xmmword_267C8B078 = ___UtilitarianFlatImageSizeForDevice_block_invoke_2((uint64_t)v4, v4);
  *((void *)&xmmword_267C8B078 + 1) = v2;
  _UtilitarianFlatImageSizeForDevice__imageSize = ___UtilitarianFlatImageSizeForDevice_block_invoke_2([v4 setNewestAllowedSizeClass:&unk_26CCDB6E0], v4);
  unk_267C8B070 = v3;
}

double ___UtilitarianFlatImageSizeForDevice_block_invoke_2(uint64_t a1, void *a2)
{
  v9[2] = *MEMORY[0x263EF8340];
  v8[0] = &unk_26CCDB6C8;
  v8[1] = &unk_26CCDB6E0;
  v9[0] = &unk_26CCDC228;
  v9[1] = &unk_26CCDC238;
  uint64_t v2 = NSDictionary;
  id v3 = a2;
  id v4 = [v2 dictionaryWithObjects:v9 forKeys:v8 count:2];
  [v3 scaledValue:v4 withOverrides:22.0];
  double v6 = v5;

  [v3 scaledValue:10.0];
  return v6;
}

@end