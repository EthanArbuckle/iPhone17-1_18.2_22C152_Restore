@interface CGCMSUtilsCreateLinearSRGBProfile
@end

@implementation CGCMSUtilsCreateLinearSRGBProfile

uint64_t (*__CGCMSUtilsCreateLinearSRGBProfile_block_invoke_7())()
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
  _block_invoke_2_f_239 = v1;
  return result;
}

uint64_t (*__CGCMSUtilsCreateLinearSRGBProfile_block_invoke_6())()
{
  if (CGLibraryLoadColorSyncDYLD_once != -1) {
    dispatch_once(&CGLibraryLoadColorSyncDYLD_once, &__block_literal_global_21589);
  }
  result = (uint64_t (*)())CGLibraryLoadColorSyncDYLD_handle;
  if (CGLibraryLoadColorSyncDYLD_handle) {
    result = (uint64_t (*)())dlsym((void *)CGLibraryLoadColorSyncDYLD_handle, "ColorSyncProfileCopyTag");
  }
  if (result) {
    v1 = result;
  }
  else {
    v1 = colorsync_smart_null_1547;
  }
  _block_invoke_2_f_228 = v1;
  return result;
}

uint64_t (*__CGCMSUtilsCreateLinearSRGBProfile_block_invoke_5())()
{
  if (CGLibraryLoadColorSyncDYLD_once != -1) {
    dispatch_once(&CGLibraryLoadColorSyncDYLD_once, &__block_literal_global_21589);
  }
  result = (uint64_t (*)())CGLibraryLoadColorSyncDYLD_handle;
  if (CGLibraryLoadColorSyncDYLD_handle) {
    result = (uint64_t (*)())dlsym((void *)CGLibraryLoadColorSyncDYLD_handle, "ColorSyncProfileCopyTag");
  }
  if (result) {
    v1 = result;
  }
  else {
    v1 = colorsync_smart_null_1547;
  }
  _block_invoke_2_f_223 = v1;
  return result;
}

uint64_t (*__CGCMSUtilsCreateLinearSRGBProfile_block_invoke_4())()
{
  if (CGLibraryLoadColorSyncDYLD_once != -1) {
    dispatch_once(&CGLibraryLoadColorSyncDYLD_once, &__block_literal_global_21589);
  }
  result = (uint64_t (*)())CGLibraryLoadColorSyncDYLD_handle;
  if (CGLibraryLoadColorSyncDYLD_handle) {
    result = (uint64_t (*)())dlsym((void *)CGLibraryLoadColorSyncDYLD_handle, "ColorSyncProfileCopyTag");
  }
  if (result) {
    v1 = result;
  }
  else {
    v1 = colorsync_smart_null_1547;
  }
  _block_invoke_2_f_217 = v1;
  return result;
}

uint64_t (*__CGCMSUtilsCreateLinearSRGBProfile_block_invoke_2())()
{
  if (CGLibraryLoadColorSyncDYLD_once != -1) {
    dispatch_once(&CGLibraryLoadColorSyncDYLD_once, &__block_literal_global_21589);
  }
  result = (uint64_t (*)())CGLibraryLoadColorSyncDYLD_handle;
  if (CGLibraryLoadColorSyncDYLD_handle) {
    result = (uint64_t (*)())dlsym((void *)CGLibraryLoadColorSyncDYLD_handle, "ColorSyncProfileCreateWithName");
  }
  if (result) {
    v1 = result;
  }
  else {
    v1 = colorsync_smart_null_1547;
  }
  _block_invoke_2_f = v1;
  return result;
}

@end