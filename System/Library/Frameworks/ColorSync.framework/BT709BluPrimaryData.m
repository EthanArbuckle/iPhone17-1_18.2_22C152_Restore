@interface BT709BluPrimaryData
@end

@implementation BT709BluPrimaryData

CFDataRef __get_BT709BluPrimaryData_block_invoke()
{
  if (ColorSyncProfileGetBT709BluePrimary_predicate != -1) {
    dispatch_once(&ColorSyncProfileGetBT709BluePrimary_predicate, &__block_literal_global_277);
  }
  CFDataRef result = CFDataCreateWithBytesNoCopy(0, (const UInt8 *)&ColorSyncProfileGetBT709BluePrimary_bXYZ, 20, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
  get_BT709BluPrimaryData_data = (uint64_t)result;
  return result;
}

@end