@interface DCIP3RedPrimaryData
@end

@implementation DCIP3RedPrimaryData

CFDataRef __get_DCIP3RedPrimaryData_block_invoke()
{
  if (ColorSyncProfileGetDCIP3RedPrimary_predicate != -1) {
    dispatch_once(&ColorSyncProfileGetDCIP3RedPrimary_predicate, &__block_literal_global_298);
  }
  CFDataRef result = CFDataCreateWithBytesNoCopy(0, (const UInt8 *)&ColorSyncProfileGetDCIP3RedPrimary_rXYZ, 20, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
  get_DCIP3RedPrimaryData_data = (uint64_t)result;
  return result;
}

@end