@interface ARRecordingTechniquePublic(ARKitAdditions)
- (void)_saveVideoInPhotosLibrary:()ARKitAdditions;
- (void)_subscribeToBackgroundNotifications;
- (void)copyVideoToPhotoLibrary:()ARKitAdditions;
@end

@implementation ARRecordingTechniquePublic(ARKitAdditions)

- (void)_subscribeToBackgroundNotifications
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 addObserver:a1 selector:sel_finishRecording name:*MEMORY[0x263F1D050] object:0];
}

- (void)_saveVideoInPhotosLibrary:()ARKitAdditions
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263F14E98];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __72__ARRecordingTechniquePublic_ARKitAdditions___saveVideoInPhotosLibrary___block_invoke;
  v7[3] = &unk_264000DA8;
  v7[4] = a1;
  id v8 = v4;
  id v6 = v4;
  [v5 requestAuthorization:v7];
}

- (void)copyVideoToPhotoLibrary:()ARKitAdditions
{
  id v4 = a3;
  v5 = [MEMORY[0x263F14E98] sharedPhotoLibrary];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __70__ARRecordingTechniquePublic_ARKitAdditions__copyVideoToPhotoLibrary___block_invoke;
  v9[3] = &unk_264000B80;
  id v10 = v4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __70__ARRecordingTechniquePublic_ARKitAdditions__copyVideoToPhotoLibrary___block_invoke_2;
  v7[3] = &unk_264000DD0;
  v7[4] = a1;
  id v8 = v10;
  id v6 = v10;
  [v5 performChanges:v9 completionHandler:v7];
}

@end