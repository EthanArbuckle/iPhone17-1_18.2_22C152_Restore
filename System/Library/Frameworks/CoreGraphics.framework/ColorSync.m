@interface ColorSync
@end

@implementation ColorSync

uint64_t (*__create_colorspace_with_ColorSync_profile_block_invoke())()
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
    v1 = colorsync_smart_null_7440;
  }
  create_colorspace_with_ColorSync_profile_f = v1;
  return result;
}

uint64_t (*__create_colorspace_with_ColorSync_profile_block_invoke_3())()
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
    v1 = colorsync_smart_null_7440;
  }
  create_colorspace_with_ColorSync_profile_f_233 = (uint64_t (*)(void, void))v1;
  return result;
}

uint64_t (*__create_colorspace_with_ColorSync_profile_block_invoke_2())()
{
  if (CGLibraryLoadColorSyncDYLD_once != -1) {
    dispatch_once(&CGLibraryLoadColorSyncDYLD_once, &__block_literal_global_21589);
  }
  result = (uint64_t (*)())CGLibraryLoadColorSyncDYLD_handle;
  if (CGLibraryLoadColorSyncDYLD_handle) {
    result = (uint64_t (*)())dlsym((void *)CGLibraryLoadColorSyncDYLD_handle, "ColorSyncProfileVerify");
  }
  if (result) {
    v1 = result;
  }
  else {
    v1 = colorsync_smart_null_7440;
  }
  create_colorspace_with_ColorSync_profile_f_228 = (uint64_t (*)(void, void, void))v1;
  return result;
}

@end