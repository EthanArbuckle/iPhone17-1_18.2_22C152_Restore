@interface CAMFrameworkUtilities
+ (BOOL)isPasscodeLocked;
+ (BOOL)isPhotosAppLocked;
+ (id)snapshotForCrossFadingView:(id)a3 fadeOutDuration:(double)a4 fadeOutDelay:(double)a5 fadeInDuration:(double)a6 fadeInDelay:(double)a7 embedSnapshot:(BOOL)a8;
+ (void)isPhotosAppLocked;
@end

@implementation CAMFrameworkUtilities

+ (id)snapshotForCrossFadingView:(id)a3 fadeOutDuration:(double)a4 fadeOutDelay:(double)a5 fadeInDuration:(double)a6 fadeInDelay:(double)a7 embedSnapshot:(BOOL)a8
{
  BOOL v8 = a8;
  id v13 = a3;
  v14 = [v13 snapshotViewAfterScreenUpdates:0];
  [v13 bounds];
  objc_msgSend(v14, "setBounds:");
  [v13 center];
  objc_msgSend(v14, "setCenter:");
  if (v13)
  {
    [v13 transform];
  }
  else
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v30 = 0u;
  }
  v29[0] = v30;
  v29[1] = v31;
  v29[2] = v32;
  [v14 setTransform:v29];
  if (v8)
  {
    v15 = [v13 superview];
    [v15 addSubview:v14];
  }
  v16 = (void *)MEMORY[0x263F82E00];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __122__CAMFrameworkUtilities_snapshotForCrossFadingView_fadeOutDuration_fadeOutDelay_fadeInDuration_fadeInDelay_embedSnapshot___block_invoke;
  v27[3] = &unk_263FA0208;
  id v28 = v14;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __122__CAMFrameworkUtilities_snapshotForCrossFadingView_fadeOutDuration_fadeOutDelay_fadeInDuration_fadeInDelay_embedSnapshot___block_invoke_2;
  v25[3] = &unk_263FA0430;
  id v17 = v28;
  id v26 = v17;
  [v16 animateWithDuration:0 delay:v27 options:v25 animations:a4 completion:a5];
  [v13 setAlpha:0.0];
  v18 = (void *)MEMORY[0x263F82E00];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __122__CAMFrameworkUtilities_snapshotForCrossFadingView_fadeOutDuration_fadeOutDelay_fadeInDuration_fadeInDelay_embedSnapshot___block_invoke_3;
  v23[3] = &unk_263FA0208;
  id v24 = v13;
  id v19 = v13;
  [v18 animateWithDuration:2 delay:v23 options:0 animations:a6 completion:a7];
  v20 = v24;
  id v21 = v17;

  return v21;
}

uint64_t __122__CAMFrameworkUtilities_snapshotForCrossFadingView_fadeOutDuration_fadeOutDelay_fadeInDuration_fadeInDelay_embedSnapshot___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __122__CAMFrameworkUtilities_snapshotForCrossFadingView_fadeOutDuration_fadeOutDelay_fadeInDuration_fadeInDelay_embedSnapshot___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

uint64_t __122__CAMFrameworkUtilities_snapshotForCrossFadingView_fadeOutDuration_fadeOutDelay_fadeInDuration_fadeInDelay_embedSnapshot___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

+ (BOOL)isPasscodeLocked
{
  v9[1] = *MEMORY[0x263EF8340];
  BOOL v8 = @"ExtendedDeviceLockState";
  v9[0] = MEMORY[0x263EFFA88];
  v2 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  unsigned int v3 = MKBGetDeviceLockState();
  char v4 = v3;
  BOOL v5 = v3 < 7;

  return v5 & (0x46u >> v4);
}

+ (BOOL)isPhotosAppLocked
{
  v2 = [MEMORY[0x263F251C8] applicationWithBundleIdentifier:@"com.apple.mobileslideshow"];
  unsigned int v3 = v2;
  if (v2)
  {
    char v4 = [v2 isLocked];
  }
  else
  {
    BOOL v5 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      +[CAMFrameworkUtilities isPhotosAppLocked](v5);
    }

    char v4 = 0;
  }

  return v4;
}

+ (void)isPhotosAppLocked
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138543362;
  v2 = @"com.apple.mobileslideshow";
  _os_log_debug_impl(&dword_2099F8000, log, OS_LOG_TYPE_DEBUG, "App not found with bundle identifier: %{public}@", (uint8_t *)&v1, 0xCu);
}

@end