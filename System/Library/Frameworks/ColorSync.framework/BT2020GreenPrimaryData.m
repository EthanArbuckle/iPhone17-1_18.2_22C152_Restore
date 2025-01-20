@interface BT2020GreenPrimaryData
@end

@implementation BT2020GreenPrimaryData

CFDataRef __get_BT2020GreenPrimaryData_block_invoke()
{
  if (ColorSyncProfileGetBT2020GreenPrimary_predicate[0] != -1) {
    dispatch_once(ColorSyncProfileGetBT2020GreenPrimary_predicate, &__block_literal_global_283);
  }
  CFDataRef result = CFDataCreateWithBytesNoCopy(0, (const UInt8 *)&ColorSyncProfileGetBT2020GreenPrimary_gXYZ, 20, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
  get_BT2020GreenPrimaryData_data = (uint64_t)result;
  return result;
}

@end