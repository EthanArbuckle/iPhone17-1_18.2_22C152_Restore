@interface CALSDKVersionInit
@end

@implementation CALSDKVersionInit

uint64_t ___CALSDKVersionInit_block_invoke()
{
  uint64_t result = dyld_program_sdk_at_least();
  if (result)
  {
    char v1 = 15;
  }
  else
  {
    uint64_t result = dyld_program_sdk_at_least();
    if (result)
    {
      char v1 = 14;
    }
    else
    {
      uint64_t result = dyld_program_sdk_at_least();
      if (result)
      {
        char v1 = 12;
      }
      else
      {
        uint64_t result = dyld_program_sdk_at_least();
        if (result) {
          char v1 = 8;
        }
        else {
          char v1 = 0;
        }
      }
    }
  }
  _CAL_sdk_version_mask = v1;
  return result;
}

@end