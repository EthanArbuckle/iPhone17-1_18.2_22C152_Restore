@interface WFDevice
@end

@implementation WFDevice

void __56__WFDevice_SystemSettings__getBrightnessWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __56__WFDevice_SystemSettings__getBrightnessWithCompletion___block_invoke_2;
    v4[3] = &unk_264E577B8;
    id v5 = *(id *)(a1 + 32);
    [a2 getValueWithCompletionHandler:v4];
  }
  else
  {
    v3 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v3();
  }
}

void __56__WFDevice_SystemSettings__getBrightnessWithCompletion___block_invoke_2(uint64_t a1, void *a2, float a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = NSNumber;
  id v6 = a2;
  *(float *)&double v7 = a3;
  id v8 = [v5 numberWithFloat:v7];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v8, v6);
}

void __56__WFDevice_SystemSettings__getAppearanceWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  if (a2)
  {
    id v5 = a3;
    id v8 = -[WFAppearanceSettingValue initWithSetting:]([WFAppearanceSettingValue alloc], "initWithSetting:", [a2 currentAppearance]);
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 32);
    double v7 = *(void (**)(uint64_t, void))(v6 + 16);
    id v8 = a3;
    v7(v6, 0);
  }
}

@end