@interface NIPlatformInfo
+ (BOOL)isInternalBuild;
+ (BOOL)supportsARKit;
+ (BOOL)supportsAoA;
+ (BOOL)supportsNBAMMS;
+ (BOOL)supportsSyntheticAperture;
+ (BOOL)supportsUWB;
@end

@implementation NIPlatformInfo

+ (BOOL)supportsUWB
{
  if (+[NIPlatformInfo supportsUWB]::onceToken != -1) {
    dispatch_once(&+[NIPlatformInfo supportsUWB]::onceToken, &__block_literal_global_3);
  }
  return +[NIPlatformInfo supportsUWB]::supportsUWB;
}

+ (BOOL)isInternalBuild
{
  if (+[NIPlatformInfo isInternalBuild]::onceToken != -1) {
    dispatch_once(&+[NIPlatformInfo isInternalBuild]::onceToken, &__block_literal_global);
  }
  return +[NIPlatformInfo isInternalBuild]::isInternalBuild;
}

uint64_t __33__NIPlatformInfo_isInternalBuild__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  +[NIPlatformInfo isInternalBuild]::isInternalBuild = result;
  return result;
}

uint64_t __29__NIPlatformInfo_supportsUWB__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  +[NIPlatformInfo supportsUWB]::supportsUWB = result;
  return result;
}

+ (BOOL)supportsAoA
{
  if (+[NIPlatformInfo supportsAoA]::onceToken != -1) {
    dispatch_once(&+[NIPlatformInfo supportsAoA]::onceToken, &__block_literal_global_8);
  }
  return +[NIPlatformInfo supportsAoA]::supportsAoA;
}

uint64_t __29__NIPlatformInfo_supportsAoA__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  if (!result) {
    goto LABEL_17;
  }
  char v1 = 1;
  uint64_t result = MGGetProductType();
  if (result <= 2309863437)
  {
    if (result <= 1169082143)
    {
      if (result == 689804742) {
        goto LABEL_18;
      }
      uint64_t v2 = 1060988941;
    }
    else
    {
      if (result == 1169082144 || result == 1371389549) {
        goto LABEL_18;
      }
      uint64_t v2 = 2080700391;
    }
  }
  else if (result > 3585085678)
  {
    if (result == 3585085679 || result == 3885279870) {
      goto LABEL_18;
    }
    uint64_t v2 = 4201643249;
  }
  else
  {
    if (result == 2309863438 || result == 2722529672) {
      goto LABEL_18;
    }
    uint64_t v2 = 3001488778;
  }
  if (result != v2) {
LABEL_17:
  }
    char v1 = 0;
LABEL_18:
  +[NIPlatformInfo supportsAoA]::supportsAoA = v1;
  return result;
}

+ (BOOL)supportsSyntheticAperture
{
  if (+[NIPlatformInfo supportsSyntheticAperture]::onceToken != -1) {
    dispatch_once(&+[NIPlatformInfo supportsSyntheticAperture]::onceToken, &__block_literal_global_10);
  }
  return +[NIPlatformInfo supportsSyntheticAperture]::supportsSyntheticAperture;
}

uint64_t __43__NIPlatformInfo_supportsSyntheticAperture__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  if (result)
  {
    uint64_t result = MGGetSInt32Answer();
    BOOL v1 = result == 1;
  }
  else
  {
    BOOL v1 = 0;
  }
  +[NIPlatformInfo supportsSyntheticAperture]::supportsSyntheticAperture = v1;
  return result;
}

+ (BOOL)supportsARKit
{
  if (+[NIPlatformInfo supportsARKit]::onceToken != -1) {
    dispatch_once(&+[NIPlatformInfo supportsARKit]::onceToken, &__block_literal_global_15);
  }
  return +[NIPlatformInfo supportsARKit]::supportsARKit;
}

uint64_t __31__NIPlatformInfo_supportsARKit__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  +[NIPlatformInfo supportsARKit]::supportsARKit = result;
  return result;
}

+ (BOOL)supportsNBAMMS
{
  if (+[NIPlatformInfo supportsNBAMMS]::onceToken != -1) {
    dispatch_once(&+[NIPlatformInfo supportsNBAMMS]::onceToken, &__block_literal_global_20);
  }
  return +[NIPlatformInfo supportsNBAMMS]::supportsNBAMMS;
}

uint64_t __32__NIPlatformInfo_supportsNBAMMS__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  if (!result) {
    goto LABEL_14;
  }
  char v1 = 1;
  uint64_t result = MGGetProductType();
  if (result > 2793418700)
  {
    if (result > 2941181570)
    {
      if (result == 2941181571) {
        goto LABEL_15;
      }
      uint64_t v2 = 3825599860;
    }
    else
    {
      if (result == 2793418701) {
        goto LABEL_15;
      }
      uint64_t v2 = 2795618603;
    }
  }
  else if (result > 574536382)
  {
    if (result == 574536383) {
      goto LABEL_15;
    }
    uint64_t v2 = 851437781;
  }
  else
  {
    if (result == 133314240) {
      goto LABEL_15;
    }
    uint64_t v2 = 330877086;
  }
  if (result != v2) {
LABEL_14:
  }
    char v1 = 0;
LABEL_15:
  +[NIPlatformInfo supportsNBAMMS]::supportsNBAMMS = v1;
  return result;
}

@end