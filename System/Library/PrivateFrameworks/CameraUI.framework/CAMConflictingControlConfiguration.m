@interface CAMConflictingControlConfiguration
+ (BOOL)shouldDisableMacroForLockedPortraitForMode:(int64_t)a3 devicePosition:(int64_t)a4 photoFormat:(id)a5 optionalDepthEffectEnabled:(BOOL)a6;
+ (int64_t)resolveDesiredMacroMode:(int64_t)a3 forMode:(int64_t)a4 device:(int64_t)a5 videoConfiguration:(int64_t)a6 videoStabilizationStrength:(int64_t)a7 photoFormat:(id)a8 optionalDepthEffectEnabled:(BOOL)a9 spatialVideoEnabled:(BOOL)a10;
+ (unint64_t)resolveDesiredLowLightControlMode:(unint64_t)a3 lowLightConflicts:(unint64_t)a4 resolvedFlashMode:(int64_t)a5;
+ (void)resolveDesiredFlashMode:(int64_t)a3 desiredHDRMode:(int64_t)a4 primaryConflictingControl:(int64_t)a5 device:(int64_t)a6 toFlashMode:(int64_t *)a7 HDRMode:(int64_t *)a8;
+ (void)resolveDesiredRAWMode:(int64_t)a3 photoFormatConflicts:(unint64_t)a4 desiredLivePhotoMode:(int64_t)a5 desiredFlashMode:(int64_t)a6 toRAWMode:(int64_t *)a7 toLivePhotoMode:(int64_t *)a8 toFlashMode:(int64_t *)a9;
- (CAMConflictingControlConfiguration)initWithDesiredFlashMode:(int64_t)a3 desiredHDRMode:(int64_t)a4 flashAndHDRConflictingControl:(int64_t)a5 desiredLivePhotoMode:(int64_t)a6 desiredRAWMode:(int64_t)a7 desiredPhotoResolution:(int64_t)a8 photoFormatConflicts:(unint64_t)a9 desiredLowLightControlMode:(unint64_t)a10 lowLightConflicts:(unint64_t)a11 desiredMacroMode:(int64_t)a12;
- (int64_t)desiredFlashMode;
- (int64_t)desiredHDRMode;
- (int64_t)desiredLivePhotoMode;
- (int64_t)desiredMacroMode;
- (int64_t)desiredPhotoResolution;
- (int64_t)desiredRAWMode;
- (int64_t)flashAndHDRConflictingControl;
- (unint64_t)desiredLowLightControlMode;
- (unint64_t)lowLightConflicts;
- (unint64_t)photoFormatConflicts;
@end

@implementation CAMConflictingControlConfiguration

- (int64_t)desiredFlashMode
{
  return self->_desiredFlashMode;
}

- (int64_t)desiredHDRMode
{
  return self->_desiredHDRMode;
}

- (int64_t)flashAndHDRConflictingControl
{
  return self->_flashAndHDRConflictingControl;
}

- (CAMConflictingControlConfiguration)initWithDesiredFlashMode:(int64_t)a3 desiredHDRMode:(int64_t)a4 flashAndHDRConflictingControl:(int64_t)a5 desiredLivePhotoMode:(int64_t)a6 desiredRAWMode:(int64_t)a7 desiredPhotoResolution:(int64_t)a8 photoFormatConflicts:(unint64_t)a9 desiredLowLightControlMode:(unint64_t)a10 lowLightConflicts:(unint64_t)a11 desiredMacroMode:(int64_t)a12
{
  v22.receiver = self;
  v22.super_class = (Class)CAMConflictingControlConfiguration;
  v18 = [(CAMConflictingControlConfiguration *)&v22 init];
  v19 = v18;
  if (v18)
  {
    v18->_desiredFlashMode = a3;
    v18->_desiredHDRMode = a4;
    v18->_flashAndHDRConflictingControl = a5;
    v18->_desiredLivePhotoMode = a6;
    v18->_desiredRAWMode = a7;
    v18->_desiredPhotoResolution = a8;
    v18->_photoFormatConflicts = a9;
    v18->_desiredLowLightControlMode = a10;
    v18->_lowLightConflicts = a11;
    v18->_desiredMacroMode = a12;
    v20 = v18;
  }

  return v19;
}

+ (void)resolveDesiredFlashMode:(int64_t)a3 desiredHDRMode:(int64_t)a4 primaryConflictingControl:(int64_t)a5 device:(int64_t)a6 toFlashMode:(int64_t *)a7 HDRMode:(int64_t *)a8
{
  v14 = +[CAMCaptureCapabilities capabilities];
  char v15 = [v14 isSmartHDRSupported];

  if ((v15 & 1) == 0)
  {
    if (a5 == 1)
    {
      if (a3 == 1)
      {
        a4 = 0;
      }
      else if (a3 == 2 && a4 == 1)
      {
        if ((unint64_t)(a6 - 1) > 0xA) {
          uint64_t v19 = 0;
        }
        else {
          uint64_t v19 = qword_209C79758[a6 - 1];
        }
        v20 = +[CAMCaptureCapabilities capabilities];
        int v21 = [v20 isAutomaticHDRSupportedForDevicePosition:v19];

        a3 = 2;
        if (v21) {
          a4 = 2;
        }
        else {
          a4 = 0;
        }
      }
    }
    else
    {
      int64_t v16 = 1;
      int64_t v17 = 2;
      if (a3 == 1 && a4 == 2) {
        int64_t v18 = 2;
      }
      else {
        int64_t v18 = a4;
      }
      if (a3 != 1 || a4 != 2) {
        int64_t v17 = a3;
      }
      if (a4 == 1) {
        int64_t v17 = 0;
      }
      else {
        int64_t v16 = v18;
      }
      if (a5 == 2)
      {
        a4 = v16;
        a3 = v17;
      }
    }
  }
  if (a7) {
    *a7 = a3;
  }
  if (a8) {
    *a8 = a4;
  }
}

+ (void)resolveDesiredRAWMode:(int64_t)a3 photoFormatConflicts:(unint64_t)a4 desiredLivePhotoMode:(int64_t)a5 desiredFlashMode:(int64_t)a6 toRAWMode:(int64_t *)a7 toLivePhotoMode:(int64_t *)a8 toFlashMode:(int64_t *)a9
{
  if (a3 == 1) {
    int64_t v9 = a4 == 0;
  }
  else {
    int64_t v9 = a3;
  }
  if (a3 == 1 && a4 == 0) {
    int64_t v10 = 0;
  }
  else {
    int64_t v10 = a5;
  }
  if (a9) {
    *a9 = a6;
  }
  if (a8) {
    *a8 = v10;
  }
  if (a7) {
    *a7 = v9;
  }
}

+ (unint64_t)resolveDesiredLowLightControlMode:(unint64_t)a3 lowLightConflicts:(unint64_t)a4 resolvedFlashMode:(int64_t)a5
{
  BOOL v6 = a4 != 1 || a5 != 2;
  if (a4)
  {
    BOOL v7 = a3 == 2;
  }
  else
  {
    BOOL v6 = 0;
    BOOL v7 = 0;
  }
  if (v7) {
    unint64_t v8 = 1;
  }
  else {
    unint64_t v8 = a3;
  }
  if (v8 == 1 && v6) {
    return 0;
  }
  else {
    return v8;
  }
}

+ (int64_t)resolveDesiredMacroMode:(int64_t)a3 forMode:(int64_t)a4 device:(int64_t)a5 videoConfiguration:(int64_t)a6 videoStabilizationStrength:(int64_t)a7 photoFormat:(id)a8 optionalDepthEffectEnabled:(BOOL)a9 spatialVideoEnabled:(BOOL)a10
{
  int64_t v16 = +[CAMCaptureCapabilities capabilities];
  if ([v16 isSuperWideAutoMacroSupportedForMode:a4 device:a5 videoConfiguration:a6 videoStabilizationStrength:a7 spatialVideoEnabled:a10])
  {
    if ((unint64_t)(a5 - 1) > 0xA) {
      uint64_t v17 = 0;
    }
    else {
      uint64_t v17 = qword_209C79758[a5 - 1];
    }
    if (objc_msgSend(a1, "shouldDisableMacroForLockedPortraitForMode:devicePosition:photoFormat:optionalDepthEffectEnabled:", a4, v17, a8.var0, a8.var1, a9))a3 = 0; {
  }
    }
  else
  {
    a3 = 0;
  }

  return a3;
}

+ (BOOL)shouldDisableMacroForLockedPortraitForMode:(int64_t)a3 devicePosition:(int64_t)a4 photoFormat:(id)a5 optionalDepthEffectEnabled:(BOOL)a6
{
  int64_t var1 = a5.var1;
  int64_t var0 = a5.var0;
  v11 = +[CAMCaptureCapabilities capabilities];
  char v12 = objc_msgSend(v11, "isDepthSuggestionSupportedForMode:devicePosition:photoFormat:", a3, a4, var0, var1);
  BOOL v13 = (~[v11 portraitInPhotoModeBehavior] & 0x11) == 0 && a6;
  BOOL v14 = v12 & v13;

  return v14;
}

- (int64_t)desiredLivePhotoMode
{
  return self->_desiredLivePhotoMode;
}

- (int64_t)desiredRAWMode
{
  return self->_desiredRAWMode;
}

- (int64_t)desiredPhotoResolution
{
  return self->_desiredPhotoResolution;
}

- (unint64_t)photoFormatConflicts
{
  return self->_photoFormatConflicts;
}

- (unint64_t)desiredLowLightControlMode
{
  return self->_desiredLowLightControlMode;
}

- (unint64_t)lowLightConflicts
{
  return self->_lowLightConflicts;
}

- (int64_t)desiredMacroMode
{
  return self->_desiredMacroMode;
}

@end