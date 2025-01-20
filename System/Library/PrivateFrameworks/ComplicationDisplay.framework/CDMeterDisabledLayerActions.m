@interface CDMeterDisabledLayerActions
@end

@implementation CDMeterDisabledLayerActions

void ___CDMeterDisabledLayerActions_block_invoke()
{
  v4[9] = *MEMORY[0x263EF8340];
  v0 = [MEMORY[0x263EFF9D0] null];
  v3[0] = @"instanceTransform";
  v3[1] = @"contentsMultiplyColor";
  v4[0] = v0;
  v4[1] = v0;
  v3[2] = @"transform";
  v3[3] = @"hidden";
  v4[2] = v0;
  v4[3] = v0;
  v3[4] = @"position";
  v3[5] = @"opacity";
  v4[4] = v0;
  v4[5] = v0;
  v3[6] = @"instanceCount";
  v3[7] = @"instanceDelay";
  v4[6] = v0;
  v4[7] = v0;
  v3[8] = @"backgroundColor";
  v4[8] = v0;
  uint64_t v1 = [NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:9];
  v2 = (void *)_CDMeterDisabledLayerActions__dictionary;
  _CDMeterDisabledLayerActions__dictionary = v1;
}

@end