@interface ProfileRegistryHelper
+ (id)getDirectoryName;
+ (id)getFileExtension;
+ (id)getFileNames;
+ (id)getFileNames:(int64_t)a3;
@end

@implementation ProfileRegistryHelper

+ (id)getDirectoryName
{
  return @"Profiles";
}

+ (id)getFileNames
{
  return (id)[a1 getFileNames:1];
}

+ (id)getFileNames:(int64_t)a3
{
  unsigned __int16 IsInternalBuild = Phase::Controller::DeviceInfo::IsInternalBuild((Phase::Controller::DeviceInfo *)a1);
  v5 = &unk_26D48B720;
  if (a3 == 1) {
    v5 = &unk_26D48B708;
  }
  v6 = &unk_26D48B750;
  if (a3 == 1) {
    v6 = &unk_26D48B738;
  }
  if ((_BYTE)IsInternalBuild) {
    BOOL v7 = IsInternalBuild >= 0x100u;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7) {
    return v5;
  }
  else {
    return v6;
  }
}

+ (id)getFileExtension
{
  return @"json";
}

@end