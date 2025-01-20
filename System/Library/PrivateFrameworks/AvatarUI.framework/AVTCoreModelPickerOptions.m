@interface AVTCoreModelPickerOptions
+ (unint64_t)displayModeFromString:(id)a3;
+ (unint64_t)sortingOptionFromString:(id)a3;
- (AVTAvatarPose)poseOverride;
- (AVTCoreModelFramingModeOverrides)framingModeOverrides;
- (AVTCoreModelPickerDisplayCondition)displayCondition;
- (AVTCoreModelPickerOptions)initWithFramingMode:(id)a3 separatorFlag:(BOOL)a4 presetOverrides:(id)a5 poseOverride:(id)a6 framingModeOverrides:(id)a7 displayMode:(unint64_t)a8 displayCondition:(id)a9 sortingOption:(unint64_t)a10 stickerConfiguration:(id)a11 showsLabel:(BOOL)a12;
- (AVTStickerConfiguration)stickerConfiguration;
- (BOOL)separator;
- (BOOL)showsLabel;
- (NSArray)presetOverrides;
- (NSString)framingMode;
- (unint64_t)displayMode;
- (unint64_t)sortingOption;
@end

@implementation AVTCoreModelPickerOptions

+ (unint64_t)displayModeFromString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"colorPickerHeaderAccessory"]) {
    unint64_t v4 = 1;
  }
  else {
    unint64_t v4 = [v3 isEqualToString:@"highlightPicker"];
  }

  return v4;
}

+ (unint64_t)sortingOptionFromString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"defaultFirst"]) {
    unint64_t v4 = 2;
  }
  else {
    unint64_t v4 = [v3 isEqualToString:@"reversed"];
  }

  return v4;
}

- (AVTCoreModelPickerOptions)initWithFramingMode:(id)a3 separatorFlag:(BOOL)a4 presetOverrides:(id)a5 poseOverride:(id)a6 framingModeOverrides:(id)a7 displayMode:(unint64_t)a8 displayCondition:(id)a9 sortingOption:(unint64_t)a10 stickerConfiguration:(id)a11 showsLabel:(BOOL)a12
{
  id v31 = a3;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a9;
  id v21 = a11;
  v32.receiver = self;
  v32.super_class = (Class)AVTCoreModelPickerOptions;
  v22 = [(AVTCoreModelPickerOptions *)&v32 init];
  if (v22)
  {
    uint64_t v23 = [v31 copy];
    framingMode = v22->_framingMode;
    v22->_framingMode = (NSString *)v23;

    v22->_separator = a4;
    uint64_t v25 = [v17 copy];
    presetOverrides = v22->_presetOverrides;
    v22->_presetOverrides = (NSArray *)v25;

    uint64_t v27 = [v18 copy];
    poseOverride = v22->_poseOverride;
    v22->_poseOverride = (AVTAvatarPose *)v27;

    objc_storeStrong((id *)&v22->_framingModeOverrides, a7);
    v22->_displayMode = a8;
    objc_storeStrong((id *)&v22->_displayCondition, a9);
    v22->_sortingOption = a10;
    objc_storeStrong((id *)&v22->_stickerConfiguration, a11);
    v22->_showsLabel = a12;
  }

  return v22;
}

- (NSString)framingMode
{
  return self->_framingMode;
}

- (BOOL)separator
{
  return self->_separator;
}

- (NSArray)presetOverrides
{
  return self->_presetOverrides;
}

- (AVTCoreModelFramingModeOverrides)framingModeOverrides
{
  return self->_framingModeOverrides;
}

- (AVTAvatarPose)poseOverride
{
  return self->_poseOverride;
}

- (AVTCoreModelPickerDisplayCondition)displayCondition
{
  return self->_displayCondition;
}

- (unint64_t)displayMode
{
  return self->_displayMode;
}

- (unint64_t)sortingOption
{
  return self->_sortingOption;
}

- (AVTStickerConfiguration)stickerConfiguration
{
  return self->_stickerConfiguration;
}

- (BOOL)showsLabel
{
  return self->_showsLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stickerConfiguration, 0);
  objc_storeStrong((id *)&self->_displayCondition, 0);
  objc_storeStrong((id *)&self->_poseOverride, 0);
  objc_storeStrong((id *)&self->_framingModeOverrides, 0);
  objc_storeStrong((id *)&self->_presetOverrides, 0);
  objc_storeStrong((id *)&self->_framingMode, 0);
}

@end