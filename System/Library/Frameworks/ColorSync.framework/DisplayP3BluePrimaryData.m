@interface DisplayP3BluePrimaryData
@end

@implementation DisplayP3BluePrimaryData

CFDataRef __get_DisplayP3BluePrimaryData_block_invoke()
{
  if (ColorSyncProfileGetDisplayP3BluePrimary_predicate != -1) {
    dispatch_once(&ColorSyncProfileGetDisplayP3BluePrimary_predicate, &__block_literal_global_295);
  }
  CFDataRef result = CFDataCreateWithBytesNoCopy(0, (const UInt8 *)&ColorSyncProfileGetDisplayP3BluePrimary_bXYZ, 20, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
  get_DisplayP3BluePrimaryData_data = (uint64_t)result;
  return result;
}

@end