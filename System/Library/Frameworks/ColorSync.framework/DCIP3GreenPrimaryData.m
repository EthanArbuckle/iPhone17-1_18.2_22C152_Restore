@interface DCIP3GreenPrimaryData
@end

@implementation DCIP3GreenPrimaryData

CFDataRef __get_DCIP3GreenPrimaryData_block_invoke()
{
  if (ColorSyncProfileGetDCIP3GreenPrimary_predicate != -1) {
    dispatch_once(&ColorSyncProfileGetDCIP3GreenPrimary_predicate, &__block_literal_global_301);
  }
  CFDataRef result = CFDataCreateWithBytesNoCopy(0, (const UInt8 *)&ColorSyncProfileGetDCIP3GreenPrimary_gXYZ, 20, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
  get_DCIP3GreenPrimaryData_data = (uint64_t)result;
  return result;
}

@end