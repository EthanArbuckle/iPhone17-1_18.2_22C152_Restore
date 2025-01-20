@interface BT601GreenPrimaryData
@end

@implementation BT601GreenPrimaryData

CFDataRef __get_BT601GreenPrimaryData_block_invoke()
{
  if (ColorSyncProfileGetBT601GreenPrimary_predicate != -1) {
    dispatch_once(&ColorSyncProfileGetBT601GreenPrimary_predicate, &__block_literal_global_265);
  }
  CFDataRef result = CFDataCreateWithBytesNoCopy(0, (const UInt8 *)&ColorSyncProfileGetBT601GreenPrimary_gXYZ, 20, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
  get_BT601GreenPrimaryData_data = (uint64_t)result;
  return result;
}

@end