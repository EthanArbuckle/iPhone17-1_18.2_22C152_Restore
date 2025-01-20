@interface BT2020RedPrimaryData
@end

@implementation BT2020RedPrimaryData

CFDataRef __get_BT2020RedPrimaryData_block_invoke()
{
  if (ColorSyncProfileGetBT2020RedPrimary_predicate != -1) {
    dispatch_once(&ColorSyncProfileGetBT2020RedPrimary_predicate, &__block_literal_global_280);
  }
  CFDataRef result = CFDataCreateWithBytesNoCopy(0, (const UInt8 *)&ColorSyncProfileGetBT2020RedPrimary_rXYZ, 20, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
  get_BT2020RedPrimaryData_data = (uint64_t)result;
  return result;
}

@end