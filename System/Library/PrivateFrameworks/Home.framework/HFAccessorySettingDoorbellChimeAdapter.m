@interface HFAccessorySettingDoorbellChimeAdapter
- (BOOL)shouldShowSettingsEntity:(id)a3;
- (HFAccessorySettingDoorbellChimeAdapter)initWithHomeKitSettingsVendor:(id)a3 keyPaths:(id)a4 mode:(unint64_t)a5 updateHandler:(id)a6;
- (HFAccessorySettingDoorbellChimeAdapter)initWithHomeKitSettingsVendor:(id)a3 mode:(unint64_t)a4;
@end

@implementation HFAccessorySettingDoorbellChimeAdapter

- (HFAccessorySettingDoorbellChimeAdapter)initWithHomeKitSettingsVendor:(id)a3 mode:(unint64_t)a4
{
  id v7 = a3;
  if (a4)
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"HFAccessorySettingDoorbellChimeAdapter.m" lineNumber:21 description:@"The Doorbell Chime Adapter is only used on the Controller"];
  }
  v8 = [MEMORY[0x263EFFA08] set];
  v12.receiver = self;
  v12.super_class = (Class)HFAccessorySettingDoorbellChimeAdapter;
  v9 = [(HFAccessorySettingAdapter *)&v12 initWithHomeKitSettingsVendor:v7 keyPaths:v8 mode:a4 updateHandler:0];

  return v9;
}

- (HFAccessorySettingDoorbellChimeAdapter)initWithHomeKitSettingsVendor:(id)a3 keyPaths:(id)a4 mode:(unint64_t)a5 updateHandler:(id)a6
{
  v8 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4, a5, a6);
  v9 = NSStringFromSelector(sel_initWithHomeKitSettingsVendor_mode_);
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFAccessorySettingDoorbellChimeAdapter.m", 35, @"%s is unavailable; use %@ instead",
    "-[HFAccessorySettingDoorbellChimeAdapter initWithHomeKitSettingsVendor:keyPaths:mode:updateHandler:]",
    v9);

  return 0;
}

- (BOOL)shouldShowSettingsEntity:(id)a3
{
  v3 = [(HFAccessorySettingAdapter *)self homeKitSettingsVendor];
  if ([v3 conformsToProtocol:&unk_26C155B48]) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  BOOL v9 = v5
    && (objc_msgSend(v5, "hf_home"),
        v6 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "hf_allCameraProfilesWithDoorbellService"),
        id v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 count],
        v7,
        v6,
        v8)
    && +[HFMediaHelper supportsDoorbellChime:v5];

  return v9;
}

@end