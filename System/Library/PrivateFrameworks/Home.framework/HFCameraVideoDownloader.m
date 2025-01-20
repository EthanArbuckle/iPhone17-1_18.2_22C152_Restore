@interface HFCameraVideoDownloader
- (HFCameraVideoDownloader)initWithCameraProfile:(id)a3;
- (HMCameraProfile)cameraProfile;
- (id)_downloadOperationForClip:(id)a3;
- (id)_fetchOperationForClip:(id)a3 withClipManager:(id)a4;
- (id)downloadOperationForClip:(id)a3;
- (id)priorityDownloadOperationForClip:(id)a3;
- (void)setCameraProfile:(id)a3;
@end

@implementation HFCameraVideoDownloader

- (HFCameraVideoDownloader)initWithCameraProfile:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HFCameraVideoDownloader;
  v5 = [(HFCameraVideoDownloader *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_cameraProfile, v4);
  }

  return v6;
}

- (id)priorityDownloadOperationForClip:(id)a3
{
  v3 = [(HFCameraVideoDownloader *)self _downloadOperationForClip:a3];
  [v3 setQueuePriority:4];
  [v3 setQualityOfService:25];
  return v3;
}

- (id)downloadOperationForClip:(id)a3
{
  v3 = [(HFCameraVideoDownloader *)self _downloadOperationForClip:a3];
  [v3 setQueuePriority:0];
  [v3 setQualityOfService:25];
  return v3;
}

- (id)_downloadOperationForClip:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = HFLogForCategory(0x1DuLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_msgSend(v4, "hf_prettyDescription");
    *(_DWORD *)buf = 138412290;
    v14 = v6;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "Called download block for clip: %@", buf, 0xCu);
  }
  v7 = +[HFCameraVideoDownloadOperation downloadOperationForClip:v4];
  objc_initWeak((id *)buf, v7);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __53__HFCameraVideoDownloader__downloadOperationForClip___block_invoke;
  v10[3] = &unk_2640905E0;
  objc_copyWeak(&v12, (id *)buf);
  v10[4] = self;
  id v8 = v4;
  id v11 = v8;
  [v7 setDownloadBlock:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);

  return v7;
}

void __53__HFCameraVideoDownloader__downloadOperationForClip___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5 = [v4 cameraProfile];
  v6 = [v5 clipManager];
  v7 = [v4 _fetchOperationForClip:v3 withClipManager:v6];

  id v8 = [MEMORY[0x263EFF910] date];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __53__HFCameraVideoDownloader__downloadOperationForClip___block_invoke_2;
  v14[3] = &unk_264098D18;
  id v9 = WeakRetained;
  id v15 = v9;
  id v10 = v8;
  id v16 = v10;
  [v7 setFetchVideoAssetContextCompletionBlock:v14];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __53__HFCameraVideoDownloader__downloadOperationForClip___block_invoke_3;
  v12[3] = &unk_264098D40;
  id v11 = v9;
  id v13 = v11;
  [v7 setDownloadProgressHandler:v12];
  [v7 start];
  if (+[HFUtilities isInternalTest]) {
    [v7 waitUntilFinishedOrTimeout:0.5];
  }
  else {
    [v7 waitUntilFinished];
  }
}

uint64_t __53__HFCameraVideoDownloader__downloadOperationForClip___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    id v4 = *(void **)(a1 + 32);
    return objc_msgSend(v4, "fileDownloadFailedWithError:");
  }
  else
  {
    v6 = [MEMORY[0x263EFF910] date];
    [v6 timeIntervalSinceDate:*(void *)(a1 + 40)];
    double v8 = v7;

    id v9 = *(void **)(a1 + 32);
    return [v9 fileDownloadFinishedWithElapsedTime:v8];
  }
}

uint64_t __53__HFCameraVideoDownloader__downloadOperationForClip___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) fileDownloadProgress:a2];
}

- (id)_fetchOperationForClip:(id)a3 withClipManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"HFCameraVideoDownloader.m", 103, @"Invalid parameter not satisfying: %@", @"clipManager" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
  }
  id v15 = [MEMORY[0x263F08690] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"HFCameraVideoDownloader.m", 104, @"Invalid parameter not satisfying: %@", @"cameraClip" object file lineNumber description];

LABEL_3:
  id v9 = (void *)[objc_alloc(MEMORY[0x263F0E1B0]) initWithClipManager:v8 clip:v7];
  id v10 = [MEMORY[0x263F08850] defaultManager];
  id v11 = +[HFCameraUtilities videoCachesDirectoryURL];
  [v10 createDirectoryAtURL:v11 withIntermediateDirectories:1 attributes:0 error:0];

  id v12 = +[HFCameraUtilities videoDestinationURLForCameraClip:v7];
  [v9 setClipDestinationFileURL:v12];

  return v9;
}

- (HMCameraProfile)cameraProfile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cameraProfile);
  return (HMCameraProfile *)WeakRetained;
}

- (void)setCameraProfile:(id)a3
{
}

- (void).cxx_destruct
{
}

@end