@interface AXBackgroundSoundsIntentHandler
- (void)handleSetBackgroundSound:(id)a3 completion:(id)a4;
- (void)handleSetBackgroundSoundVolume:(id)a3 completion:(id)a4;
- (void)handleToggleBackgroundSounds:(id)a3 completion:(id)a4;
- (void)resolveBackgroundSoundForSetBackgroundSound:(id)a3 withCompletion:(id)a4;
- (void)resolveOperationForToggleBackgroundSounds:(id)a3 withCompletion:(id)a4;
- (void)resolveSettingForToggleBackgroundSounds:(id)a3 withCompletion:(id)a4;
- (void)resolveStateForToggleBackgroundSounds:(id)a3 withCompletion:(id)a4;
- (void)resolveVolumeTypeForSetBackgroundSoundVolume:(id)a3 withCompletion:(id)a4;
- (void)resolveVolumeValueForSetBackgroundSoundVolume:(id)a3 withCompletion:(id)a4;
@end

@implementation AXBackgroundSoundsIntentHandler

- (void)handleToggleBackgroundSounds:(id)a3 completion:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, id))a4;
  if ([v5 operation] != (id)1 || objc_msgSend(v5, "state"))
  {
    id v7 = [v5 setting];
    v8 = +[HUComfortSoundsSettings sharedInstance];
    v9 = v8;
    if (v7 == (id)1) {
      unsigned int v10 = [v8 comfortSoundsEnabled];
    }
    else {
      unsigned int v10 = [v8 mixesWithMedia];
    }
    unsigned int v11 = v10;

    if ([v5 operation] == (id)1) {
      uint64_t v12 = [v5 state] == (id)1;
    }
    else {
      uint64_t v12 = v11 ^ 1;
    }
    if ([v5 setting] == (id)1)
    {
      v13 = +[HUComfortSoundsSettings sharedInstance];
      [v13 setComfortSoundsEnabled:v12];
    }
    else
    {
      if ([v5 setting] != (id)2)
      {
LABEL_14:
        v14 = [AXToggleBackgroundSoundsIntentResponse alloc];
        uint64_t v15 = 4;
        goto LABEL_15;
      }
      v13 = +[HUComfortSoundsSettings sharedInstance];
      [v13 setMixesWithMedia:v12];
    }

    goto LABEL_14;
  }
  v17 = AXLogSiriShortcuts();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    sub_10000C1B8((uint64_t)v5, v17);
  }

  v14 = [AXToggleBackgroundSoundsIntentResponse alloc];
  uint64_t v15 = 5;
LABEL_15:
  v16 = [(AXToggleBackgroundSoundsIntentResponse *)v14 initWithCode:v15 userActivity:0];
  v6[2](v6, v16);
}

- (void)resolveOperationForToggleBackgroundSounds:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  +[AXOperationResolutionResult successWithResolvedOperation:](AXOperationResolutionResult, "successWithResolvedOperation:", [a3 operation]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (void)resolveStateForToggleBackgroundSounds:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  +[AXStateResolutionResult successWithResolvedState:](AXStateResolutionResult, "successWithResolvedState:", [a3 state]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (void)resolveSettingForToggleBackgroundSounds:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  +[AXBackgroundSoundsSettingResolutionResult successWithResolvedBackgroundSoundsSetting:](AXBackgroundSoundsSettingResolutionResult, "successWithResolvedBackgroundSoundsSetting:", [a3 setting]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (void)handleSetBackgroundSound:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, AXSetBackgroundSoundIntentResponse *))a4;
  switch((unint64_t)[v5 backgroundSound])
  {
    case 1uLL:
      id v7 = +[HUComfortSoundsSettings sharedInstance];
      uint64_t v8 = 1;
      goto LABEL_10;
    case 2uLL:
      id v7 = +[HUComfortSoundsSettings sharedInstance];
      uint64_t v8 = 2;
      goto LABEL_10;
    case 3uLL:
      id v7 = +[HUComfortSoundsSettings sharedInstance];
      uint64_t v8 = 3;
      goto LABEL_10;
    case 4uLL:
      id v7 = +[HUComfortSoundsSettings sharedInstance];
      uint64_t v8 = 4;
      goto LABEL_10;
    case 5uLL:
      id v7 = +[HUComfortSoundsSettings sharedInstance];
      uint64_t v8 = 5;
      goto LABEL_10;
    case 6uLL:
      id v7 = +[HUComfortSoundsSettings sharedInstance];
      uint64_t v8 = 6;
LABEL_10:
      unsigned int v10 = +[HUComfortSound defaultComfortSoundForGroup:v8];
      [v7 setSelectedComfortSound:v10];

      v9 = [[AXSetBackgroundSoundIntentResponse alloc] initWithCode:4 userActivity:0];
      v6[2](v6, v9);
      break;
    default:
      AXLogSiriShortcuts();
      v9 = (AXSetBackgroundSoundIntentResponse *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v9->super.super, OS_LOG_TYPE_INFO))
      {
        int v11 = 138412290;
        id v12 = v5;
        _os_log_impl((void *)&_mh_execute_header, &v9->super.super, OS_LOG_TYPE_INFO, "SetBackgroundSoundIntentHandler: Comfort sound type was unknown: %@", (uint8_t *)&v11, 0xCu);
      }
      break;
  }
}

- (void)resolveBackgroundSoundForSetBackgroundSound:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  +[AXBackgroundSoundsResolutionResult successWithResolvedBackgroundSounds:](AXBackgroundSoundsResolutionResult, "successWithResolvedBackgroundSounds:", [a3 backgroundSound]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (void)handleSetBackgroundSoundVolume:(id)a3 completion:(id)a4
{
  id v11 = a3;
  id v5 = (void (**)(id, AXSetBackgroundSoundVolumeIntentResponse *))a4;
  id v6 = [v11 volumeValue];
  [v6 doubleValue];
  double v8 = v7 / 100.0;

  if ([v11 volumeType] == (id)1)
  {
    v9 = +[HUComfortSoundsSettings sharedInstance];
    [v9 setRelativeVolume:v8];
  }
  else
  {
    if ([v11 volumeType] != (id)2) {
      goto LABEL_6;
    }
    v9 = +[HUComfortSoundsSettings sharedInstance];
    [v9 setMediaVolume:v8];
  }

LABEL_6:
  unsigned int v10 = [[AXSetBackgroundSoundVolumeIntentResponse alloc] initWithCode:4 userActivity:0];
  v5[2](v5, v10);
}

- (void)resolveVolumeTypeForSetBackgroundSoundVolume:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  +[AXBackgroundSoundsVolumeResolutionResult successWithResolvedBackgroundSoundsVolume:](AXBackgroundSoundsVolumeResolutionResult, "successWithResolvedBackgroundSoundsVolume:", [a3 volumeType]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (void)resolveVolumeValueForSetBackgroundSoundVolume:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v8 = [a3 volumeValue];
  [v8 doubleValue];
  id v7 = +[AXSetBackgroundSoundVolumeVolumeValueResolutionResult successWithResolvedValue:](AXSetBackgroundSoundVolumeVolumeValueResolutionResult, "successWithResolvedValue:");
  (*((void (**)(id, void *))a4 + 2))(v6, v7);
}

@end