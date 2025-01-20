@interface GenericLab
@end

@implementation GenericLab

CFIndex __verify_GenericLab_block_invoke()
{
  v0 = ColorSyncProfileCreateWithName(kColorSyncGenericLabProfile);
  verify_GenericLab_lab_profile_data = (uint64_t)ColorSyncProfileCopyData(v0, 0);
  CFIndex result = CFDataGetLength((CFDataRef)verify_GenericLab_lab_profile_data);
  verify_GenericLab_lab_profile_data_length = result;
  return result;
}

@end