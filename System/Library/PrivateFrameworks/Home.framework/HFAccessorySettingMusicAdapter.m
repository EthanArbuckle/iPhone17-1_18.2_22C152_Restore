@interface HFAccessorySettingMusicAdapter
+ (BOOL)areAllAccessoriesLoggedIntoSameAccount:(id)a3;
+ (BOOL)areAllAccessoriesLoggedOut:(id)a3;
- (BOOL)shouldShowSettingsEntity:(id)a3;
- (HFAccessorySettingMusicAdapter)initWithHomeKitSettingsVendor:(id)a3 keyPaths:(id)a4 mode:(unint64_t)a5 updateHandler:(id)a6;
- (HFAccessorySettingMusicAdapter)initWithHomeKitSettingsVendor:(id)a3 keyPaths:(id)a4 updateHandler:(id)a5;
- (HFAccessorySettingMusicAdapter)initWithHomeKitSettingsVendor:(id)a3 mode:(unint64_t)a4;
@end

@implementation HFAccessorySettingMusicAdapter

- (HFAccessorySettingMusicAdapter)initWithHomeKitSettingsVendor:(id)a3 mode:(unint64_t)a4
{
  id v6 = a3;
  if (a4)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    v11 = [NSString stringWithUTF8String:"-[HFAccessorySettingMusicAdapter initWithHomeKitSettingsVendor:mode:]"];
    [v10 handleFailureInFunction:v11 file:@"HFAccessorySettingMusicAdapter.m" lineNumber:29 description:@"Music adapter does not do what you think it does."];
  }
  v7 = [MEMORY[0x263EFFA08] set];
  v12.receiver = self;
  v12.super_class = (Class)HFAccessorySettingMusicAdapter;
  v8 = [(HFAccessorySettingAdapter *)&v12 initWithHomeKitSettingsVendor:v6 keyPaths:v7 mode:a4 updateHandler:0];

  return v8;
}

- (HFAccessorySettingMusicAdapter)initWithHomeKitSettingsVendor:(id)a3 keyPaths:(id)a4 mode:(unint64_t)a5 updateHandler:(id)a6
{
  v8 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4, a5, a6);
  v9 = NSStringFromSelector(sel_initWithHomeKitSettingsVendor_mode_);
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFAccessorySettingMusicAdapter.m", 43, @"%s is unavailable; use %@ instead",
    "-[HFAccessorySettingMusicAdapter initWithHomeKitSettingsVendor:keyPaths:mode:updateHandler:]",
    v9);

  return 0;
}

- (HFAccessorySettingMusicAdapter)initWithHomeKitSettingsVendor:(id)a3 keyPaths:(id)a4 updateHandler:(id)a5
{
  v7 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4, a5);
  v8 = NSStringFromSelector(sel_initWithHomeKitSettingsVendor_mode_);
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFAccessorySettingMusicAdapter.m", 48, @"%s is unavailable; use %@ instead",
    "-[HFAccessorySettingMusicAdapter initWithHomeKitSettingsVendor:keyPaths:updateHandler:]",
    v8);

  return 0;
}

+ (BOOL)areAllAccessoriesLoggedIntoSameAccount:(id)a3
{
  v3 = [a3 accessories];
  v4 = [v3 anyObject];
  v5 = [v4 mediaProfile];
  id v6 = objc_msgSend(v5, "hf_appleMusicCurrentLoggedInAccount");

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __73__HFAccessorySettingMusicAdapter_areAllAccessoriesLoggedIntoSameAccount___block_invoke;
  v9[3] = &unk_26408D968;
  id v10 = v6;
  id v7 = v6;
  LOBYTE(v5) = objc_msgSend(v3, "na_all:", v9);

  return (char)v5;
}

uint64_t __73__HFAccessorySettingMusicAdapter_areAllAccessoriesLoggedIntoSameAccount___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 mediaProfile];
  v4 = objc_msgSend(v3, "hf_appleMusicCurrentLoggedInAccount");
  v5 = [v4 username];
  id v6 = [*(id *)(a1 + 32) username];
  uint64_t v7 = [v5 isEqual:v6];

  return v7;
}

+ (BOOL)areAllAccessoriesLoggedOut:(id)a3
{
  v3 = [a3 accessories];
  char v4 = objc_msgSend(v3, "na_all:", &__block_literal_global_17);

  return v4;
}

BOOL __61__HFAccessorySettingMusicAdapter_areAllAccessoriesLoggedOut___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 mediaProfile];
  v3 = objc_msgSend(v2, "hf_appleMusicCurrentLoggedInAccount");
  BOOL v4 = v3 == 0;

  return v4;
}

- (BOOL)shouldShowSettingsEntity:(id)a3
{
  BOOL v4 = [a3 keyPath];
  if ([v4 isEqualToString:@"root.music"])
  {
    LOBYTE(v5) = 1;
  }
  else if ([v4 isEqualToString:@"root.music.account"])
  {
    id v6 = [(HFAccessorySettingAdapter *)self homeKitSettingsVendor];
    if ([v6 conformsToProtocol:&unk_26C155B48]) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    id v8 = v7;

    if (v8)
    {
      if ([v8 isItemGroup])
      {
        BOOL v9 = +[HFAccessorySettingMusicAdapter areAllAccessoriesLoggedIntoSameAccount:v8];
        int v5 = v9 | +[HFAccessorySettingMusicAdapter areAllAccessoriesLoggedOut:v8];
      }
      else if ([v8 isContainedWithinItemGroup])
      {
        uint64_t v10 = [(HFAccessorySettingAdapter *)self homeKitSettingsVendor];
        v11 = objc_msgSend((id)v10, "hf_home");
        objc_super v12 = [v8 accessories];
        v13 = [v12 anyObject];
        v14 = objc_msgSend(v11, "hf_mediaSystemForAccessory:", v13);

        LODWORD(v10) = +[HFAccessorySettingMusicAdapter areAllAccessoriesLoggedIntoSameAccount:v14];
        int v5 = v10 | +[HFAccessorySettingMusicAdapter areAllAccessoriesLoggedOut:v14];

        LOBYTE(v5) = v5 ^ 1;
      }
      else
      {
        LOBYTE(v5) = 1;
      }
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

@end