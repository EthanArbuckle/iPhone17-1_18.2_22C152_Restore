@interface StateManagerRingBufferSize
@end

@implementation StateManagerRingBufferSize

void *GeoOfflineConfig_StateManagerRingBufferSize_Metadata_block_invoke_9()
{
  return &unk_1ED73E908;
}

uint64_t GeoOfflineConfig_StateManagerRingBufferSize_Metadata_block_invoke_10(uint64_t a1, void *a2)
{
  unint64_t v2 = [a2 unsignedIntegerValue];
  unint64_t v3 = 10;
  if (v2 > 0xA) {
    unint64_t v3 = v2;
  }
  if (v3 >= 0x1F4) {
    uint64_t v4 = 500;
  }
  else {
    uint64_t v4 = v3;
  }
  v5 = NSNumber;

  return [v5 numberWithUnsignedInteger:v4];
}

@end