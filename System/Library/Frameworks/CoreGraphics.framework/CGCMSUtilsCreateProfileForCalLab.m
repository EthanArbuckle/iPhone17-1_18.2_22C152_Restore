@interface CGCMSUtilsCreateProfileForCalLab
@end

@implementation CGCMSUtilsCreateProfileForCalLab

uint64_t (*__CGCMSUtilsCreateProfileForCalLab_block_invoke())()
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
  CGCMSUtilsCreateProfileForCalLab_f = (uint64_t (*)(void))v1;
  return result;
}

@end