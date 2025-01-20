@interface HFCameraClipFeedbackPreparationOperation
- (HFCameraClipFeedbackPreparationOperation)initWithCameraClip:(id)a3 completionHandler:(id)a4;
- (HMCameraClip)cameraClip;
- (id)completionHandler;
- (void)main;
- (void)setCameraClip:(id)a3;
- (void)setCompletionHandler:(id)a3;
@end

@implementation HFCameraClipFeedbackPreparationOperation

- (HFCameraClipFeedbackPreparationOperation)initWithCameraClip:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HFCameraClipFeedbackPreparationOperation;
  v9 = [(HFCameraClipFeedbackPreparationOperation *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_cameraClip, a3);
    v11 = _Block_copy(v8);
    id completionHandler = v10->_completionHandler;
    v10->_id completionHandler = v11;
  }
  return v10;
}

- (void)main
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v3 = [(HFCameraClipFeedbackPreparationOperation *)self cameraClip];
  v4 = +[HFCameraUtilities videoDestinationURLForCameraClip:v3 strippedAudio:1];

  v5 = [MEMORY[0x263F08850] defaultManager];
  v6 = [v4 path];
  int v7 = [v5 fileExistsAtPath:v6];

  if (v7)
  {
    id v8 = HFLogForCategory(0x14uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v4;
      _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "Stripped audio file exists at url:%@.", buf, 0xCu);
    }

    v9 = [(HFCameraClipFeedbackPreparationOperation *)self completionHandler];
    ((void (**)(void, void *))v9)[2](v9, v4);
  }
  else
  {
    v10 = [(HFCameraClipFeedbackPreparationOperation *)self cameraClip];
    v9 = +[HFCameraUtilities videoDestinationURLForCameraClip:v10];

    v11 = [MEMORY[0x263F08850] defaultManager];
    v12 = [v9 path];
    char v13 = [v11 fileExistsAtPath:v12];

    objc_super v14 = HFLogForCategory(0x14uLL);
    v15 = v14;
    if (v13)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v16 = [(HFCameraClipFeedbackPreparationOperation *)self cameraClip];
        v17 = objc_msgSend(v16, "hf_prettyDescription");
        *(_DWORD *)buf = 138412290;
        v29 = v17;
        _os_log_impl(&dword_20B986000, v15, OS_LOG_TYPE_DEFAULT, "Proceed to strip audio file and truncate file to 20 seconds for clip: %@", buf, 0xCu);
      }
      v18 = [MEMORY[0x263EFA470] assetWithURL:v9];
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __48__HFCameraClipFeedbackPreparationOperation_main__block_invoke;
      v23[3] = &unk_26408D478;
      id v24 = v18;
      v25 = v9;
      v26 = self;
      id v27 = v4;
      id v19 = v18;
      [v19 loadValuesAsynchronouslyForKeys:&unk_26C0F81A0 completionHandler:v23];
    }
    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v20 = [(HFCameraClipFeedbackPreparationOperation *)self cameraClip];
        v21 = objc_msgSend(v20, "hf_prettyDescription");
        v22 = [v9 path];
        *(_DWORD *)buf = 138412546;
        v29 = v21;
        __int16 v30 = 2112;
        v31 = v22;
        _os_log_error_impl(&dword_20B986000, v15, OS_LOG_TYPE_ERROR, "Unable to find file to convert for clip: %@; URL: %@. THIS SHOULD NEVER HAPPEN.",
          buf,
          0x16u);
      }
      id v19 = [(HFCameraClipFeedbackPreparationOperation *)self completionHandler];
      (*((void (**)(id, void))v19 + 2))(v19, 0);
    }
  }
}

void __48__HFCameraClipFeedbackPreparationOperation_main__block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFA788] composition];
  uint64_t v3 = *MEMORY[0x263EF9D48];
  v4 = [v2 addMutableTrackWithMediaType:*MEMORY[0x263EF9D48] preferredTrackID:0];
  v5 = [*(id *)(a1 + 32) tracksWithMediaType:v3];
  v6 = [v5 firstObject];

  if (v6)
  {
    int v7 = *(void **)(a1 + 32);
    if (v7) {
      [v7 duration];
    }
    else {
      memset(&duration, 0, sizeof(duration));
    }
    CMTime buf = *(CMTime *)*(void *)&MEMORY[0x263F010E0];
    long long v18 = *(_OWORD *)&buf.value;
    CMTimeEpoch epoch = buf.epoch;
    CMTimeRangeMake(&v29, &buf, &duration);
    *(_OWORD *)&buf.value = v18;
    buf.CMTimeEpoch epoch = epoch;
    [v4 insertTimeRange:&v29 ofTrack:v6 atTime:&buf error:0];
    id v14 = objc_alloc(MEMORY[0x263EFA4A8]);
    v15 = (void *)[v14 initWithAsset:v2 presetName:*MEMORY[0x263EF95C0]];
    [v15 setOutputFileType:*MEMORY[0x263EF9898]];
    [v15 setOutputURL:*(void *)(a1 + 56)];
    [v15 setShouldOptimizeForNetworkUse:1];
    CMTimeMake(&start, 0, 1000);
    CMTimeMakeWithSeconds(&v25, 20.0, 1000);
    CMTimeRangeMake(&v27, &start, &v25);
    CMTimeRange v24 = v27;
    [v15 setTimeRange:&v24];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __48__HFCameraClipFeedbackPreparationOperation_main__block_invoke_5;
    v19[3] = &unk_26408D478;
    uint64_t v16 = *(void *)(a1 + 48);
    v17 = *(void **)(a1 + 56);
    id v20 = v15;
    uint64_t v21 = v16;
    id v22 = v17;
    id v23 = *(id *)(a1 + 40);
    v10 = v15;
    [v10 exportAsynchronouslyWithCompletionHandler:v19];
  }
  else
  {
    id v8 = [MEMORY[0x263F08850] defaultManager];
    v9 = [*(id *)(a1 + 40) path];
    [v8 removeItemAtPath:v9 error:0];

    v10 = HFLogForCategory(0x14uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = [*(id *)(a1 + 48) cameraClip];
      v12 = objc_msgSend(v11, "hf_prettyDescription");
      LODWORD(buf.value) = 138412290;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v12;
      _os_log_error_impl(&dword_20B986000, v10, OS_LOG_TYPE_ERROR, "Missing video track. Unable to strip audio from clip: %@", (uint8_t *)&buf, 0xCu);
    }
  }
}

void __48__HFCameraClipFeedbackPreparationOperation_main__block_invoke_5(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) status];
  if (v2 == 5)
  {
    int v7 = [MEMORY[0x263F08850] defaultManager];
    id v8 = [*(id *)(a1 + 56) path];
    [v7 removeItemAtPath:v8 error:0];

    uint64_t v3 = HFLogForCategory(0x14uLL);
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    v9 = [*(id *)(a1 + 40) cameraClip];
    v10 = objc_msgSend(v9, "hf_prettyDescription");
    v11 = [*(id *)(a1 + 32) error];
    int v16 = 138412546;
    v17 = v10;
    __int16 v18 = 2112;
    id v19 = v11;
    v12 = "Cancelled audio stripping and truncation of clip: %@; error: %@";
LABEL_13:
    _os_log_error_impl(&dword_20B986000, v3, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v16, 0x16u);

    goto LABEL_10;
  }
  if (v2 == 4)
  {
    char v13 = [MEMORY[0x263F08850] defaultManager];
    id v14 = [*(id *)(a1 + 56) path];
    [v13 removeItemAtPath:v14 error:0];

    uint64_t v3 = HFLogForCategory(0x14uLL);
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    v9 = [*(id *)(a1 + 40) cameraClip];
    v10 = objc_msgSend(v9, "hf_prettyDescription");
    v11 = [*(id *)(a1 + 32) error];
    int v16 = 138412546;
    v17 = v10;
    __int16 v18 = 2112;
    id v19 = v11;
    v12 = "Failure to strip audio and truncate clip: %@; error: %@";
    goto LABEL_13;
  }
  if (v2 != 3) {
    return;
  }
  uint64_t v3 = HFLogForCategory(0x14uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [*(id *)(a1 + 40) cameraClip];
    v5 = objc_msgSend(v4, "hf_prettyDescription");
    v6 = *(void **)(a1 + 48);
    int v16 = 138412546;
    v17 = v5;
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "Finished stripping/truncating file for clip: %@; URL: %@.",
      (uint8_t *)&v16,
      0x16u);
  }
LABEL_10:

  v15 = [*(id *)(a1 + 40) completionHandler];
  v15[2]();
}

- (HMCameraClip)cameraClip
{
  return self->_cameraClip;
}

- (void)setCameraClip:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_cameraClip, 0);
}

@end