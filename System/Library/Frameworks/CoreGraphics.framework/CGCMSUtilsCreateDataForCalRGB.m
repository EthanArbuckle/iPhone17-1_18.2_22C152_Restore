@interface CGCMSUtilsCreateDataForCalRGB
@end

@implementation CGCMSUtilsCreateDataForCalRGB

uint64_t (*__CGCMSUtilsCreateDataForCalRGB_block_invoke())()
{
  if (CGLibraryLoadColorSyncDYLD_once != -1) {
    dispatch_once(&CGLibraryLoadColorSyncDYLD_once, &__block_literal_global_21589);
  }
  result = (uint64_t (*)())CGLibraryLoadColorSyncDYLD_handle;
  if (CGLibraryLoadColorSyncDYLD_handle) {
    result = (uint64_t (*)())dlsym((void *)CGLibraryLoadColorSyncDYLD_handle, "ColorSyncProfileCopyData");
  }
  if (result) {
    v1 = result;
  }
  else {
    v1 = colorsync_smart_null_1547;
  }
  CGCMSUtilsCreateDataForCalRGB_f = (uint64_t)v1;
  return result;
}

@end