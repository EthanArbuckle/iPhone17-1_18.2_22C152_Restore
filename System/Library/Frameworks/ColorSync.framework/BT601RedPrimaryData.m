@interface BT601RedPrimaryData
@end

@implementation BT601RedPrimaryData

CFDataRef __get_BT601RedPrimaryData_block_invoke()
{
  if (ColorSyncProfileGetBT601RedPrimary_predicate != -1) {
    dispatch_once(&ColorSyncProfileGetBT601RedPrimary_predicate, &__block_literal_global_262);
  }
  CFDataRef result = CFDataCreateWithBytesNoCopy(0, (const UInt8 *)&ColorSyncProfileGetBT601RedPrimary_rXYZ, 20, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
  get_BT601RedPrimaryData_data = (uint64_t)result;
  return result;
}

@end