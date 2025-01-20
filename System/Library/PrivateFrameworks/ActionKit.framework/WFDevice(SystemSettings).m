@interface WFDevice(SystemSettings)
- (id)volumeWithError:()SystemSettings;
- (void)getAppearanceWithCompletion:()SystemSettings;
- (void)getBrightnessWithCompletion:()SystemSettings;
@end

@implementation WFDevice(SystemSettings)

- (void)getBrightnessWithCompletion:()SystemSettings
{
  id v3 = a3;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __56__WFDevice_SystemSettings__getBrightnessWithCompletion___block_invoke;
  v5[3] = &unk_264E577E0;
  id v6 = v3;
  id v4 = v3;
  +[WFBrightnessSettingsClient createClientWithCompletionHandler:v5];
}

- (void)getAppearanceWithCompletion:()SystemSettings
{
  id v3 = a3;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __56__WFDevice_SystemSettings__getAppearanceWithCompletion___block_invoke;
  v5[3] = &unk_264E57790;
  id v6 = v3;
  id v4 = v3;
  +[WFAppearanceSettingsClient createClientWithCompletionHandler:v5];
}

- (id)volumeWithError:()SystemSettings
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2050000000;
  v0 = (void *)getAVSystemControllerClass_softClass;
  uint64_t v11 = getAVSystemControllerClass_softClass;
  if (!getAVSystemControllerClass_softClass)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __getAVSystemControllerClass_block_invoke;
    v7[3] = &unk_264E5EC88;
    v7[4] = &v8;
    __getAVSystemControllerClass_block_invoke((uint64_t)v7);
    v0 = (void *)v9[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v8, 8);
  v2 = [v1 sharedAVSystemController];
  LODWORD(v7[0]) = 0;
  uint64_t v6 = 0;
  id v4 = 0;
  if ([v2 getActiveCategoryVolume:v7 andName:&v6])
  {
    LODWORD(v3) = v7[0];
    id v4 = [NSNumber numberWithFloat:v3];
  }

  return v4;
}

@end