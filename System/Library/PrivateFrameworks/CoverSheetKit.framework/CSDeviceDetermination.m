@interface CSDeviceDetermination
+ (BOOL)_screenScaleMatchesZoomScale:(double)a3;
+ (BOOL)isCategoryPad:(unint64_t)a3;
+ (BOOL)isCategoryPhone:(unint64_t)a3;
+ (double)_zoomScaleForBaseDevice:(unint64_t)a3;
+ (unint64_t)_zoomAwareCategoryForDevice:(unint64_t)a3 zoomVariant:(unint64_t)a4;
+ (unint64_t)baseCategory;
+ (unint64_t)categoryFromScreenSize;
@end

@implementation CSDeviceDetermination

+ (unint64_t)baseCategory
{
  if (_CS_Private_MainScreenClass_onceToken != -1) {
    dispatch_once(&_CS_Private_MainScreenClass_onceToken, &__block_literal_global_7);
  }
  unint64_t result = 24;
  switch(_CS_Private_MainScreenClass_mainScreenClass)
  {
    case 5:
      unint64_t result = 0;
      break;
    case 8:
      unint64_t result = 1;
      break;
    case 9:
      unint64_t result = 2;
      break;
    case 11:
      return result;
    case 14:
      unint64_t result = 23;
      break;
    case 15:
      unint64_t result = 4;
      break;
    case 18:
    case 19:
      if (_CS_Private_BaseIsN84OrSimilarDevice_onceToken != -1) {
        dispatch_once(&_CS_Private_BaseIsN84OrSimilarDevice_onceToken, &__block_literal_global_14);
      }
      if (_CS_Private_BaseIsN84OrSimilarDevice_baseIsN84OrSimilarDevice) {
        unint64_t result = 7;
      }
      else {
        unint64_t result = 5;
      }
      break;
    case 20:
    case 23:
      unint64_t result = 26;
      break;
    case 21:
      unint64_t result = 22;
      break;
    case 22:
      unint64_t result = 9;
      break;
    case 24:
      if (_CS_Private_ProductType_onceToken != -1) {
        dispatch_once(&_CS_Private_ProductType_onceToken, &__block_literal_global_12);
      }
      if (_CS_Private_ProductType_productType == 689804742) {
        unint64_t result = 11;
      }
      else {
        unint64_t result = 10;
      }
      break;
    case 25:
      unint64_t result = 16;
      break;
    case 28:
      unint64_t result = 25;
      break;
    case 30:
      unint64_t result = 13;
      break;
    case 31:
      unint64_t result = 18;
      break;
    case 32:
      unint64_t result = 30;
      break;
    case 33:
      unint64_t result = 27;
      break;
    case 36:
      unint64_t result = 15;
      break;
    case 37:
      unint64_t result = 20;
      break;
    default:
      unint64_t result = 32;
      break;
  }
  return result;
}

+ (unint64_t)categoryFromScreenSize
{
  v3 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v3 _referenceBounds];

  BSSizeRoundForScale();
  v4 = [MEMORY[0x1E4F4F7D0] sharedInstance];
  int v5 = [v4 deviceClass];

  v6 = [MEMORY[0x1E4F4F7D0] sharedInstance];
  v7 = v6;
  if (v5 == 2)
  {
    uint64_t v8 = [v6 homeButtonType];

    if (v8 == 2)
    {
      if (BSFloatGreaterThanFloat()) {
        return 30;
      }
      if (BSFloatGreaterThanFloat()) {
        return 29;
      }
      if (BSFloatGreaterThanFloat()) {
        return 27;
      }
      if (BSFloatGreaterThanFloat()) {
        return 26;
      }
      if (BSFloatGreaterThanFloat() & 1) != 0 || (BSSizeEqualToSize()) {
        return 25;
      }
      if (BSFloatGreaterThanFloat()) {
        return 31;
      }
      if (BSSizeEqualToSize()) {
        return 28;
      }
      return 32;
    }
    if (BSFloatGreaterThanFloat()) {
      return 24;
    }
    if (BSFloatGreaterThanFloat()) {
      return 23;
    }
    if (BSFloatGreaterThanFloat()) {
      return 22;
    }
    return 21;
  }
  int v10 = [v6 deviceClass];

  if (v10) {
    return 32;
  }
  if (CSEffectiveArtworkSubtype_onceToken != -1) {
    dispatch_once(&CSEffectiveArtworkSubtype_onceToken, &__block_literal_global_1);
  }
  uint64_t v11 = CSEffectiveArtworkSubtype_deviceSubtype;
  v12 = [MEMORY[0x1E4F4F7D0] sharedInstance];
  uint64_t v13 = [v12 homeButtonType];

  if (v13 != 2)
  {
    if (BSFloatGreaterThanFloat()) {
      return 2;
    }
    else {
      return BSFloatGreaterThanFloat();
    }
  }
  if (_CS_Private_MainScreenClass_onceToken != -1) {
    dispatch_once(&_CS_Private_MainScreenClass_onceToken, &__block_literal_global_7);
  }
  if (_CS_Private_MainScreenClass_mainScreenClass == 22)
  {
    id v14 = a1;
    uint64_t v15 = 9;
    uint64_t v16 = 8;
LABEL_31:
    return [v14 _zoomAwareCategoryForDevice:v15 zoomVariant:v16];
  }
  if (_CS_Private_BaseIsN84OrSimilarDevice_onceToken != -1) {
    dispatch_once(&_CS_Private_BaseIsN84OrSimilarDevice_onceToken, &__block_literal_global_14);
  }
  if (_CS_Private_BaseIsN84OrSimilarDevice_baseIsN84OrSimilarDevice)
  {
    id v14 = a1;
    uint64_t v15 = 7;
    uint64_t v16 = 6;
    goto LABEL_31;
  }
  if (BSFloatGreaterThanFloat())
  {
    unint64_t v17 = 16;
    if (v11 == 2796) {
      unint64_t v17 = 18;
    }
    BOOL v18 = v11 == 2868;
    unint64_t v19 = 20;
LABEL_48:
    if (v18) {
      return v19;
    }
    else {
      return v17;
    }
  }
  if (BSFloatGreaterThanFloat())
  {
    unint64_t v17 = 5;
    if (v11 == 2556) {
      unint64_t v17 = 13;
    }
    BOOL v18 = v11 == 2622;
    unint64_t v19 = 15;
    goto LABEL_48;
  }
  if (v11 > 2795)
  {
    if (v11 == 2796)
    {
      if (BSFloatEqualToFloat()) {
        return 17;
      }
    }
    else if (v11 == 2868 && (BSFloatEqualToFloat() & 1) != 0)
    {
      return 19;
    }
  }
  else if (v11 == 2556)
  {
    if (BSFloatEqualToFloat()) {
      return 12;
    }
  }
  else if (v11 == 2622 && (BSFloatEqualToFloat() & 1) != 0)
  {
    return 14;
  }
  if (BSFloatGreaterThanFloat())
  {
    if (_CS_Private_ProductType_onceToken != -1) {
      dispatch_once(&_CS_Private_ProductType_onceToken, &__block_literal_global_12);
    }
    if (_CS_Private_ProductType_productType == 689804742 || _CS_Private_ProductType_productType == 2309863438) {
      return 11;
    }
    else {
      return 10;
    }
  }
  else if (BSFloatGreaterThanFloat())
  {
    return 4;
  }
  else
  {
    if ((BSFloatGreaterThanFloat() & 1) == 0) {
      return 32;
    }
    return 3;
  }
}

+ (BOOL)isCategoryPad:(unint64_t)a3
{
  return a3 - 21 < 0xB;
}

+ (BOOL)isCategoryPhone:(unint64_t)a3
{
  return (a3 > 0x20) | (0x1FFFFFuLL >> a3) & 1;
}

+ (unint64_t)_zoomAwareCategoryForDevice:(unint64_t)a3 zoomVariant:(unint64_t)a4
{
  if (objc_msgSend(a1, "_screenScaleMatchesZoomScale:")) {
    return a4;
  }
  else {
    return a3;
  }
}

+ (double)_zoomScaleForBaseDevice:(unint64_t)a3
{
  double result = 0.0;
  if (a3 - 4 <= 5) {
    return dbl_1ADA42408[a3 - 4];
  }
  return result;
}

+ (BOOL)_screenScaleMatchesZoomScale:(double)a3
{
  v3 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v3 nativeScale];
  char v4 = BSFloatEqualToFloat();

  return v4;
}

@end