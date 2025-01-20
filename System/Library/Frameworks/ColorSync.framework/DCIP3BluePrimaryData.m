@interface DCIP3BluePrimaryData
@end

@implementation DCIP3BluePrimaryData

CFDataRef __get_DCIP3BluePrimaryData_block_invoke()
{
  if (ColorSyncProfileGetDCIP3BluePrimary_predicate[0] != -1) {
    dispatch_once(ColorSyncProfileGetDCIP3BluePrimary_predicate, &__block_literal_global_304);
  }
  CFDataRef result = CFDataCreateWithBytesNoCopy(0, (const UInt8 *)&ColorSyncProfileGetDCIP3BluePrimary_bXYZ, 20, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
  get_DCIP3BluePrimaryData_data = (uint64_t)result;
  return result;
}

@end