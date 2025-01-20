@interface DisplayP3RedPrimaryData
@end

@implementation DisplayP3RedPrimaryData

CFDataRef __get_DisplayP3RedPrimaryData_block_invoke()
{
  if (ColorSyncProfileGetDisplayP3RedPrimary_predicate != -1) {
    dispatch_once(&ColorSyncProfileGetDisplayP3RedPrimary_predicate, &__block_literal_global_289);
  }
  CFDataRef result = CFDataCreateWithBytesNoCopy(0, (const UInt8 *)&ColorSyncProfileGetDisplayP3RedPrimary_rXYZ, 20, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
  get_DisplayP3RedPrimaryData_data = (uint64_t)result;
  return result;
}

@end