@interface DisplayP3GreenPrimaryData
@end

@implementation DisplayP3GreenPrimaryData

CFDataRef __get_DisplayP3GreenPrimaryData_block_invoke()
{
  if (ColorSyncProfileGetDisplayP3GreenPrimary_predicate[0] != -1) {
    dispatch_once(ColorSyncProfileGetDisplayP3GreenPrimary_predicate, &__block_literal_global_292);
  }
  CFDataRef result = CFDataCreateWithBytesNoCopy(0, (const UInt8 *)&ColorSyncProfileGetDisplayP3GreenPrimary_gXYZ, 20, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
  get_DisplayP3GreenPrimaryData_data = (uint64_t)result;
  return result;
}

@end