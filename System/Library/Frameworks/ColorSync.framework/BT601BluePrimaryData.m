@interface BT601BluePrimaryData
@end

@implementation BT601BluePrimaryData

CFDataRef __get_BT601BluePrimaryData_block_invoke()
{
  if (ColorSyncProfileGetBT601BluePrimary_predicate != -1) {
    dispatch_once(&ColorSyncProfileGetBT601BluePrimary_predicate, &__block_literal_global_268);
  }
  CFDataRef result = CFDataCreateWithBytesNoCopy(0, (const UInt8 *)&ColorSyncProfileGetBT601BluePrimary_bXYZ, 20, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
  get_BT601BluePrimaryData_data = (uint64_t)result;
  return result;
}

@end