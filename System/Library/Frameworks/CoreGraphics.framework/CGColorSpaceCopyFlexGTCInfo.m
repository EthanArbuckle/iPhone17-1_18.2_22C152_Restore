@interface CGColorSpaceCopyFlexGTCInfo
@end

@implementation CGColorSpaceCopyFlexGTCInfo

uint64_t (*__CGColorSpaceCopyFlexGTCInfo_block_invoke_2())()
{
  if (CGLibraryLoadColorSyncDYLD_once != -1) {
    dispatch_once(&CGLibraryLoadColorSyncDYLD_once, &__block_literal_global_21589);
  }
  result = (uint64_t (*)())CGLibraryLoadColorSyncDYLD_handle;
  if (CGLibraryLoadColorSyncDYLD_handle) {
    result = (uint64_t (*)())dlsym((void *)CGLibraryLoadColorSyncDYLD_handle, "ColorSyncProfileCopyFlexGTCInfo");
  }
  if (result) {
    v1 = result;
  }
  else {
    v1 = colorsync_smart_null_6672;
  }
  CGColorSpaceCopyFlexGTCInfo_f_50 = (uint64_t (*)(void))v1;
  return result;
}

uint64_t (*__CGColorSpaceCopyFlexGTCInfo_block_invoke())()
{
  if (CGLibraryLoadColorSyncDYLD_once != -1) {
    dispatch_once(&CGLibraryLoadColorSyncDYLD_once, &__block_literal_global_21589);
  }
  result = (uint64_t (*)())CGLibraryLoadColorSyncDYLD_handle;
  if (CGLibraryLoadColorSyncDYLD_handle) {
    result = (uint64_t (*)())dlsym((void *)CGLibraryLoadColorSyncDYLD_handle, "ColorSyncProfileGetTypeID");
  }
  if (result) {
    v1 = result;
  }
  else {
    v1 = colorsync_smart_null_6672;
  }
  CGColorSpaceCopyFlexGTCInfo_f = v1;
  return result;
}

@end