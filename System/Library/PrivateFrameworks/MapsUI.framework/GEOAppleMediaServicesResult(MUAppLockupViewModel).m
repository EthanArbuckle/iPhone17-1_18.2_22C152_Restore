@interface GEOAppleMediaServicesResult(MUAppLockupViewModel)
- (id)actionButtonText;
- (void)loadAppArtworkWithCompletion:()MUAppLockupViewModel;
@end

@implementation GEOAppleMediaServicesResult(MUAppLockupViewModel)

- (id)actionButtonText
{
  if ([a1 isInstalled]) {
    v1 = @"OPEN [Placecard]";
  }
  else {
    v1 = @"GET [Placecard]";
  }
  v2 = _MULocalizedStringFromThisBundle(v1);
  return v2;
}

- (void)loadAppArtworkWithCompletion:()MUAppLockupViewModel
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F30E38] sharedImageManager];
  v6 = [a1 artworkURL];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __82__GEOAppleMediaServicesResult_MUAppLockupViewModel__loadAppArtworkWithCompletion___block_invoke;
  v8[3] = &unk_1E574F6A0;
  id v9 = v4;
  id v7 = v4;
  [v5 loadAppImageAtURL:v6 completionHandler:v8];
}

@end