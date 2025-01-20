@interface CGCMSUtilsCreateProfileWithNativeGamma
@end

@implementation CGCMSUtilsCreateProfileWithNativeGamma

uint64_t (*__CGCMSUtilsCreateProfileWithNativeGamma_block_invoke_2())()
{
  if (CGLibraryLoadColorSyncDYLD_once != -1) {
    dispatch_once(&CGLibraryLoadColorSyncDYLD_once, &__block_literal_global_21589);
  }
  result = (uint64_t (*)())CGLibraryLoadColorSyncDYLD_handle;
  if (CGLibraryLoadColorSyncDYLD_handle) {
    result = (uint64_t (*)())dlsym((void *)CGLibraryLoadColorSyncDYLD_handle, "ColorSyncMakeProfile");
  }
  if (result) {
    v1 = result;
  }
  else {
    v1 = colorsync_smart_null_1547;
  }
  CGCMSUtilsCreateProfileWithNativeGamma_f_460 = v1;
  return result;
}

uint64_t (*__CGCMSUtilsCreateProfileWithNativeGamma_block_invoke())()
{
  if (CGLibraryLoadColorSyncDYLD_once != -1) {
    dispatch_once(&CGLibraryLoadColorSyncDYLD_once, &__block_literal_global_21589);
  }
  result = (uint64_t (*)())CGLibraryLoadColorSyncDYLD_handle;
  if (CGLibraryLoadColorSyncDYLD_handle) {
    result = (uint64_t (*)())dlsym((void *)CGLibraryLoadColorSyncDYLD_handle, "ColorSyncProfileCreate");
  }
  if (result) {
    v1 = result;
  }
  else {
    v1 = colorsync_smart_null_1547;
  }
  CGCMSUtilsCreateProfileWithNativeGamma_f = v1;
  return result;
}

@end