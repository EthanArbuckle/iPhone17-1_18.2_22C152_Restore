@interface ARRecordingTechniquePublic
@end

@implementation ARRecordingTechniquePublic

void __72__ARRecordingTechniquePublic_ARKitAdditions___saveVideoInPhotosLibrary___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  if (a2 == 3)
  {
    v4 = (id *)v7;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v5 = __72__ARRecordingTechniquePublic_ARKitAdditions___saveVideoInPhotosLibrary___block_invoke_2;
  }
  else
  {
    v4 = (id *)v6;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v5 = __72__ARRecordingTechniquePublic_ARKitAdditions___saveVideoInPhotosLibrary___block_invoke_3;
  }
  v4[2] = v5;
  v4[3] = &unk_264000D80;
  objc_copyWeak(v4 + 5, &location);
  v4[4] = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x263EF83A0], v4);

  objc_destroyWeak(v4 + 5);
  objc_destroyWeak(&location);
}

void __72__ARRecordingTechniquePublic_ARKitAdditions___saveVideoInPhotosLibrary___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained copyVideoToPhotoLibrary:*(void *)(a1 + 32)];
}

void __72__ARRecordingTechniquePublic_ARKitAdditions___saveVideoInPhotosLibrary___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v2 = [NSString stringWithFormat:@"Saved video to file at %@, but not in the photo library because the permission has not been granted.", *(void *)(a1 + 32)];
    v3 = [MEMORY[0x263EFF9A0] dictionary];
    [v3 setObject:v2 forKeyedSubscript:*MEMORY[0x263F08320]];
    v4 = ARErrorWithCodeAndUserInfo();
    [WeakRetained _fail:v4];
  }
}

id __70__ARRecordingTechniquePublic_ARKitAdditions__copyVideoToPhotoLibrary___block_invoke(uint64_t a1)
{
  return (id)[MEMORY[0x263F14D20] creationRequestForAssetFromVideoAtFileURL:*(void *)(a1 + 32)];
}

void __70__ARRecordingTechniquePublic_ARKitAdditions__copyVideoToPhotoLibrary___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a2)
  {
    if (_ARLogTechnique_onceToken != -1) {
      dispatch_once(&_ARLogTechnique_onceToken, &__block_literal_global_14);
    }
    v6 = (void *)_ARLogTechnique_logObj;
    if (os_log_type_enabled((os_log_t)_ARLogTechnique_logObj, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v19 = v9;
      __int16 v20 = 2048;
      uint64_t v21 = v10;
      __int16 v22 = 2112;
      uint64_t v23 = v11;
      _os_log_impl(&dword_20B202000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Saved video to file at %@ and to the photo library.", buf, 0x20u);
    }
    [*(id *)(a1 + 32) _finish:0];
  }
  else
  {
    v16[0] = *MEMORY[0x263F08320];
    v12 = [NSString stringWithFormat:@"Saved video to file at %@, but not in the photo library because of an error.", *(void *)(a1 + 40)];
    v16[1] = *MEMORY[0x263F08608];
    v17[0] = v12;
    v17[1] = v5;
    v13 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];

    v14 = *(void **)(a1 + 32);
    v15 = ARErrorWithCodeAndUserInfo();
    [v14 _fail:v15];
  }
}

@end