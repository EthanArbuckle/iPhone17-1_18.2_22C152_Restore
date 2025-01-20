@interface HMIFeedbackSubmitClipOperation
+ (id)logCategory;
- (BOOL)_attachEncryptedDataUsingKey:(id)a3 toPayload:(id)a4 error:(id *)a5;
- (BOOL)_attachFaceCrops:(id)a3 toPayload:(id)a4 error:(id *)a5;
- (HMIFeedbackSession)feedbackSession;
- (HMIFeedbackSubmitClipOperation)initWithFeedbackSession:(id)a3 cameraProfileUUID:(id)a4 clipUUID:(id)a5;
- (NSData)assetData;
- (NSDictionary)serviceResult;
- (NSMutableArray)temporaryFileURLs;
- (NSSet)faceCrops;
- (NSUUID)cameraProfileUUID;
- (NSUUID)clipUUID;
- (id)_base64StringFromData:(id)a3;
- (id)_createPayloadWithServiceResult:(id)a3 error:(id *)a4;
- (id)_temporaryFileURLWithUUID:(id)a3 extension:(id)a4 error:(id *)a5;
- (id)feedbackRequestURLForClipWithUUID:(id)a3;
- (id)feedbackServiceHost;
- (id)feedbackServiceURL;
- (void)_downloadClipWithCameraProfileUUID:(id)a3 clipUUID:(id)a4 completionHandler:(id)a5;
- (void)_removeTemporaryFiles;
- (void)_requestPreSignedURLWithClipUUID:(id)a3 completionHandler:(id)a4;
- (void)_stripAudioTrackAndFacesFromAsset:(id)a3 completionHandler:(id)a4;
- (void)_submitClipWithCameraProfileUUID:(id)a3 clipUUID:(id)a4 completionHandler:(id)a5;
- (void)_uploadPayloadData:(id)a3 uploadURL:(id)a4 completionHandler:(id)a5;
- (void)main;
- (void)setAssetData:(id)a3;
- (void)setFaceCrops:(id)a3;
- (void)setServiceResult:(id)a3;
@end

@implementation HMIFeedbackSubmitClipOperation

- (HMIFeedbackSubmitClipOperation)initWithFeedbackSession:(id)a3 cameraProfileUUID:(id)a4 clipUUID:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)HMIFeedbackSubmitClipOperation;
  v12 = [(HMFOperation *)&v20 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_feedbackSession, a3);
    objc_storeStrong((id *)&v13->_cameraProfileUUID, a4);
    objc_storeStrong((id *)&v13->_clipUUID, a5);
    uint64_t v14 = [MEMORY[0x263EFF980] array];
    temporaryFileURLs = v13->_temporaryFileURLs;
    v13->_temporaryFileURLs = (NSMutableArray *)v14;

    faceCrops = v13->_faceCrops;
    v13->_faceCrops = 0;

    assetData = v13->_assetData;
    v13->_assetData = 0;

    serviceResult = v13->_serviceResult;
    v13->_serviceResult = 0;
  }
  return v13;
}

- (void)_downloadClipWithCameraProfileUUID:(id)a3 clipUUID:(id)a4 completionHandler:(id)a5
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x22A641C70]();
  v12 = self;
  v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v43 = v14;
    _os_log_impl(&dword_225DC6000, v13, OS_LOG_TYPE_INFO, "%{public}@Downloading Clip", buf, 0xCu);
  }
  v15 = [(HMIFeedbackSubmitClipOperation *)v12 feedbackSession];
  v16 = [v15 homeKitClient];
  v17 = [v16 cameraProfileWithUUID:v8];

  if (v17)
  {
    v18 = [(HMIFeedbackSubmitClipOperation *)v12 feedbackSession];
    v19 = [v18 homeKitClient];
    id v20 = [v19 homeWithCameraProfileUUID:v8];

    if (v20)
    {
      id v33 = v9;
      v39[0] = MEMORY[0x263EF8330];
      v39[1] = 3221225472;
      v39[2] = __96__HMIFeedbackSubmitClipOperation__downloadClipWithCameraProfileUUID_clipUUID_completionHandler___block_invoke;
      v39[3] = &unk_26477CD60;
      v39[4] = v12;
      id v21 = v10;
      id v41 = v21;
      id v22 = v17;
      id v40 = v22;
      v23 = (void *)MEMORY[0x22A641EE0](v39);
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __96__HMIFeedbackSubmitClipOperation__downloadClipWithCameraProfileUUID_clipUUID_completionHandler___block_invoke_152;
      v34[3] = &unk_26477CDB0;
      id v37 = v21;
      id v20 = v20;
      id v35 = v20;
      v36 = v12;
      id v24 = v23;
      id v38 = v24;
      v25 = (void *)MEMORY[0x22A641EE0](v34);
      v26 = (void *)MEMORY[0x22A641C70]();
      v27 = v12;
      v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v29 = id v32 = v22;
        *(_DWORD *)buf = 138543362;
        v43 = v29;
        _os_log_impl(&dword_225DC6000, v28, OS_LOG_TYPE_INFO, "%{public}@Fetching Clip", buf, 0xCu);

        id v22 = v32;
      }

      v30 = [v22 clipManager];
      id v9 = v33;
      [v30 fetchClipWithUUID:v33 completion:v25];
    }
    else
    {
      v31 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1000 description:@"Cannot find home for camera profile."];
      (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v31);
    }
  }
  else
  {
    id v20 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1000 description:@"Cannot find camera profile."];
    (*((void (**)(id, void, id))v10 + 2))(v10, 0, v20);
  }
}

void __96__HMIFeedbackSubmitClipOperation__downloadClipWithCameraProfileUUID_clipUUID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = [MEMORY[0x263F08C38] UUID];
  id v19 = 0;
  v6 = [v4 _temporaryFileURLWithUUID:v5 extension:@"mp4" error:&v19];
  id v7 = v19;

  if (v6)
  {
    id v8 = [MEMORY[0x263F08850] defaultManager];
    id v9 = [v6 path];
    int v10 = [v8 fileExistsAtPath:v9];

    if (!v10)
    {
      id v12 = objc_alloc(MEMORY[0x263F0E1B0]);
      v13 = [*(id *)(a1 + 40) clipManager];
      uint64_t v14 = (void *)[v12 initWithClipManager:v13 clip:v3];

      [v14 setClipDestinationFileURL:v6];
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __96__HMIFeedbackSubmitClipOperation__downloadClipWithCameraProfileUUID_clipUUID_completionHandler___block_invoke_2;
      v16[3] = &unk_26477CD10;
      v16[4] = *(void *)(a1 + 32);
      id v18 = *(id *)(a1 + 48);
      id v17 = v6;
      [v14 setFetchVideoAssetContextCompletionBlock:v16];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __96__HMIFeedbackSubmitClipOperation__downloadClipWithCameraProfileUUID_clipUUID_completionHandler___block_invoke_149;
      v15[3] = &unk_26477CD38;
      v15[4] = *(void *)(a1 + 32);
      [v14 setDownloadProgressHandler:v15];
      [v14 start];

      goto LABEL_7;
    }
    id v11 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    id v11 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v11();
LABEL_7:
}

void __96__HMIFeedbackSubmitClipOperation__downloadClipWithCameraProfileUUID_clipUUID_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x22A641C70]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = HMFGetLogIdentifier();
    int v13 = 138543874;
    uint64_t v14 = v10;
    __int16 v15 = 2112;
    id v16 = v5;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_225DC6000, v9, OS_LOG_TYPE_INFO, "%{public}@Fetched Clip videoAssetContext: %@, error: %@", (uint8_t *)&v13, 0x20u);
  }
  uint64_t v11 = *(void *)(a1 + 48);
  if (v5)
  {
    (*(void (**)(void, void, void))(v11 + 16))(*(void *)(a1 + 48), *(void *)(a1 + 40), 0);
  }
  else
  {
    id v12 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1000 description:@"Cannot download clip asset." suggestion:@"Check network connectivity." underlyingError:v6];
    (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v12);
  }
}

void __96__HMIFeedbackSubmitClipOperation__downloadClipWithCameraProfileUUID_clipUUID_completionHandler___block_invoke_149(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v4 = (void *)MEMORY[0x22A641C70]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    id v9 = v7;
    __int16 v10 = 2048;
    uint64_t v11 = a2;
    _os_log_impl(&dword_225DC6000, v6, OS_LOG_TYPE_INFO, "%{public}@Fetching Clip, progress %lu%%", (uint8_t *)&v8, 0x16u);
  }
}

void __96__HMIFeedbackSubmitClipOperation__downloadClipWithCameraProfileUUID_clipUUID_completionHandler___block_invoke_152(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    uint64_t v20 = *(void *)(a1 + 48);
    uint64_t v14 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1000 description:@"Cannot download clip for camera profile." suggestion:@"Ensure the clip belongs to the camera profile." underlyingError:v6];
    (*(void (**)(uint64_t, void, void *))(v20 + 16))(v20, 0, v14);
LABEL_9:

    goto LABEL_13;
  }
  id v7 = [*(id *)(a1 + 32) personManager];

  int v8 = (void *)MEMORY[0x22A641C70]();
  id v9 = *(id *)(a1 + 40);
  __int16 v10 = HMFGetOSLogHandle();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v7)
  {
    if (v11)
    {
      uint64_t v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v26 = v12;
      _os_log_impl(&dword_225DC6000, v10, OS_LOG_TYPE_INFO, "%{public}@Fetching Face Crops", buf, 0xCu);
    }
    int v13 = [v5 significantEvents];
    uint64_t v14 = objc_msgSend(v13, "na_map:", &__block_literal_global_162);

    __int16 v15 = (void *)MEMORY[0x22A641C70]();
    id v16 = *(id *)(a1 + 40);
    __int16 v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v26 = v18;
      __int16 v27 = 2112;
      v28 = v14;
      _os_log_impl(&dword_225DC6000, v17, OS_LOG_TYPE_INFO, "%{public}@Fetched Person UUIDs: %@", buf, 0x16u);
    }
    uint64_t v19 = [*(id *)(a1 + 32) personManager];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __96__HMIFeedbackSubmitClipOperation__downloadClipWithCameraProfileUUID_clipUUID_completionHandler___block_invoke_163;
    v22[3] = &unk_26477CD88;
    v22[4] = *(void *)(a1 + 40);
    id v24 = *(id *)(a1 + 56);
    id v23 = v5;
    [v19 fetchFaceCropsForPersonsWithUUIDs:v14 completion:v22];

    goto LABEL_9;
  }
  if (v11)
  {
    id v21 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v26 = v21;
    _os_log_impl(&dword_225DC6000, v10, OS_LOG_TYPE_INFO, "%{public}@Face crops are not available.", buf, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_13:
}

id __96__HMIFeedbackSubmitClipOperation__downloadClipWithCameraProfileUUID_clipUUID_completionHandler___block_invoke_159(uint64_t a1, void *a2)
{
  v2 = [a2 faceClassification];
  id v3 = v2;
  if (v2)
  {
    v4 = [v2 person];
    id v5 = [v4 UUID];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

void __96__HMIFeedbackSubmitClipOperation__downloadClipWithCameraProfileUUID_clipUUID_completionHandler___block_invoke_163(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x22A641C70]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    __int16 v10 = HMFGetLogIdentifier();
    int v11 = 138543874;
    uint64_t v12 = v10;
    __int16 v13 = 2112;
    id v14 = v5;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_225DC6000, v9, OS_LOG_TYPE_INFO, "%{public}@Fetched Face Crops: %@, error: %@", (uint8_t *)&v11, 0x20u);
  }
  [*(id *)(a1 + 32) setFaceCrops:v5];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_stripAudioTrackAndFacesFromAsset:(id)a3 completionHandler:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  id v8 = [MEMORY[0x263F08C38] UUID];
  id v34 = 0;
  id v9 = [(HMIFeedbackSubmitClipOperation *)self _temporaryFileURLWithUUID:v8 extension:@"mp4" error:&v34];
  id v10 = v34;

  if (v9)
  {
    memset(&v33, 0, sizeof(v33));
    BOOL v11 = +[HMIPreference isInternalInstall];
    double v12 = 60.0;
    if (!v11) {
      double v12 = 20.0;
    }
    CMTimeMakeWithSeconds(&v33, v12, 1000);
    if (+[HMIPreference isInternalInstall]) {
      goto LABEL_5;
    }
    char v32 = 0;
    id v21 = objc_alloc_init(HMIFeedbackVisionProcessor);
    CMTime buf = v33;
    BOOL v22 = [(HMIFeedbackVisionProcessor *)v21 blurFacesFromAssetURL:v6 outputURL:v9 duration:&buf analysisFPS:5 windowSize:&v32 faceDetected:COERCE_DOUBLE(__PAIR64__(HIDWORD(v33.value), 15.0))];

    if (!v22)
    {
      uint64_t v17 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1000 description:@"Unable to blur faces."];
      v7[2](v7, 0, v17);
LABEL_19:

      goto LABEL_20;
    }
    if (!v32)
    {
LABEL_5:
      __int16 v13 = (void *)MEMORY[0x22A641C70]();
      id v14 = self;
      __int16 v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        id v16 = HMFGetLogIdentifier();
        LODWORD(buf.value) = 138543362;
        *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v16;
        _os_log_impl(&dword_225DC6000, v15, OS_LOG_TYPE_INFO, "%{public}@Use the original video without audio track for upload", (uint8_t *)&buf, 0xCu);
      }
      uint64_t v17 = [MEMORY[0x263EFA470] assetWithURL:v6];
      if ([v17 isReadable])
      {
        v27[0] = MEMORY[0x263EF8330];
        v27[1] = 3221225472;
        v27[2] = __86__HMIFeedbackSubmitClipOperation__stripAudioTrackAndFacesFromAsset_completionHandler___block_invoke;
        v27[3] = &unk_26477CE00;
        id v18 = v17;
        id v28 = v18;
        v30 = v7;
        id v29 = v9;
        CMTime v31 = v33;
        uint64_t v19 = (void *)MEMORY[0x22A641EE0](v27);
        [v18 loadValuesAsynchronouslyForKeys:&unk_26D9A9768 completionHandler:v19];

        uint64_t v20 = v28;
      }
      else
      {
        uint64_t v20 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1004 description:@"Unable to read the asset from disk."];
        v7[2](v7, 0, v20);
      }

      goto LABEL_19;
    }
    id v23 = (void *)MEMORY[0x22A641C70]();
    id v24 = self;
    v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v26 = HMFGetLogIdentifier();
      LODWORD(buf.value) = 138543362;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v26;
      _os_log_impl(&dword_225DC6000, v25, OS_LOG_TYPE_INFO, "%{public}@Use the face-blurred video for upload", (uint8_t *)&buf, 0xCu);
    }
    ((void (**)(id, void *, void *))v7)[2](v7, v9, 0);
  }
  else
  {
    v7[2](v7, 0, v10);
  }
LABEL_20:
}

void __86__HMIFeedbackSubmitClipOperation__stripAudioTrackAndFacesFromAsset_completionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v31 = 0;
  uint64_t v3 = [v2 statusOfValueForKey:@"tracks" error:&v31];
  id v4 = v31;
  if (v3 == 2)
  {
    id v5 = [MEMORY[0x263EFA788] composition];
    uint64_t v6 = *MEMORY[0x263EF9D48];
    id v7 = [v5 addMutableTrackWithMediaType:*MEMORY[0x263EF9D48] preferredTrackID:0];
    id v8 = [*(id *)(a1 + 32) tracksWithMediaType:v6];
    id v9 = [v8 firstObject];

    if (v9)
    {
      id v10 = *(void **)(a1 + 32);
      if (v10) {
        [v10 duration];
      }
      else {
        memset(&duration, 0, sizeof(duration));
      }
      CMTime start = *(CMTime *)*(void *)&MEMORY[0x263F010E0];
      long long v19 = *(_OWORD *)&start.value;
      CMTimeEpoch epoch = start.epoch;
      CMTimeRangeMake(&v30, &start, &duration);
      id v27 = v4;
      *(_OWORD *)&start.value = v19;
      start.CMTimeEpoch epoch = epoch;
      char v14 = [v7 insertTimeRange:&v30 ofTrack:v9 atTime:&start error:&v27];
      id v15 = v27;

      if (v14)
      {
        id v16 = objc_alloc(MEMORY[0x263EFA4A8]);
        uint64_t v17 = (void *)[v16 initWithAsset:v5 presetName:*MEMORY[0x263EF95C0]];
        [v17 setOutputFileType:*MEMORY[0x263EF9888]];
        [v17 setOutputURL:*(void *)(a1 + 40)];
        [v17 setShouldOptimizeForNetworkUse:1];
        CMTimeMake(&v25, 0, 1000);
        CMTime start = *(CMTime *)(a1 + 56);
        CMTimeRangeMake(&v26, &v25, &start);
        CMTimeRange v24 = v26;
        [v17 setTimeRange:&v24];
        v20[0] = MEMORY[0x263EF8330];
        v20[1] = 3221225472;
        v20[2] = __86__HMIFeedbackSubmitClipOperation__stripAudioTrackAndFacesFromAsset_completionHandler___block_invoke_2;
        v20[3] = &unk_26477CDD8;
        id v21 = v17;
        id v23 = *(id *)(a1 + 48);
        id v22 = *(id *)(a1 + 40);
        id v18 = v17;
        [v18 exportAsynchronouslyWithCompletionHandler:v20];
      }
      else
      {
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      }
      id v4 = v15;
    }
    else
    {
      uint64_t v11 = *(void *)(a1 + 48);
      double v12 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1000 description:@"Clip doesn't have a video track."];
      (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v12);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __86__HMIFeedbackSubmitClipOperation__stripAudioTrackAndFacesFromAsset_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) status];
  uint64_t v3 = *(void *)(a1 + 48);
  if (v2 == 3)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = *(void (**)(uint64_t, uint64_t, void))(v3 + 16);
    uint64_t v6 = *(void *)(a1 + 48);
    v5(v6, v4, 0);
  }
  else
  {
    id v7 = [*(id *)(a1 + 32) error];
    (*(void (**)(uint64_t, void, id))(v3 + 16))(v3, 0, v7);
  }
}

- (id)feedbackRequestURLForClipWithUUID:(id)a3
{
  uint64_t v4 = NSURL;
  id v5 = NSString;
  id v6 = a3;
  id v7 = [(HMIFeedbackSubmitClipOperation *)self feedbackServiceURL];
  id v8 = [v6 UUIDString];

  id v9 = [v5 stringWithFormat:@"%@%@", v7, v8];
  id v10 = [v4 URLWithString:v9];

  return v10;
}

- (id)feedbackServiceHost
{
  uint64_t v2 = [(HMIFeedbackSubmitClipOperation *)self feedbackSession];
  uint64_t v3 = [v2 feedbackServiceHost];

  return v3;
}

- (id)feedbackServiceURL
{
  uint64_t v2 = NSString;
  uint64_t v3 = [(HMIFeedbackSubmitClipOperation *)self feedbackServiceHost];
  uint64_t v4 = [v2 stringWithFormat:@"https://%@/v2/clip-uuid/", v3];

  return v4;
}

- (id)_base64StringFromData:(id)a3
{
  uint64_t v3 = [a3 base64EncodedDataWithOptions:1];
  uint64_t v4 = (void *)[[NSString alloc] initWithData:v3 encoding:4];

  return v4;
}

- (id)_temporaryFileURLWithUUID:(id)a3 extension:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = HMIURLForCacheDirectory(a5);
  uint64_t v11 = v10;
  if (v10)
  {
    double v12 = [v10 URLByAppendingPathComponent:@"feedback"];
    __int16 v13 = [MEMORY[0x263F08850] defaultManager];
    char v14 = [v12 path];
    char v15 = [v13 fileExistsAtPath:v14];

    if (v15) {
      goto LABEL_4;
    }
    id v16 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v17 = [v12 path];
    int v18 = [v16 createDirectoryAtPath:v17 withIntermediateDirectories:1 attributes:0 error:a5];

    long long v19 = 0;
    if (v18)
    {
LABEL_4:
      uint64_t v20 = [v12 path];
      id v21 = [NSString stringWithFormat:@"%@.%@", v8, v9];
      id v22 = [v20 stringByAppendingPathComponent:v21];

      long long v19 = [NSURL fileURLWithPath:v22];
      [(NSMutableArray *)self->_temporaryFileURLs addObject:v19];
    }
  }
  else
  {
    long long v19 = 0;
  }

  return v19;
}

- (void)_uploadPayloadData:(id)a3 uploadURL:(id)a4 completionHandler:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)MEMORY[0x22A641C70]();
  double v12 = self;
  __int16 v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    char v14 = HMFGetLogIdentifier();
    *(_DWORD *)CMTime buf = 138543874;
    id v29 = v14;
    __int16 v30 = 2112;
    id v31 = v8;
    __int16 v32 = 2112;
    id v33 = v9;
    _os_log_impl(&dword_225DC6000, v13, OS_LOG_TYPE_INFO, "%{public}@Uploading payload data: %@, to URL %@", buf, 0x20u);
  }
  char v15 = [MEMORY[0x263F08C38] UUID];
  id v27 = 0;
  id v16 = [(HMIFeedbackSubmitClipOperation *)v12 _temporaryFileURLWithUUID:v15 extension:@"json" error:&v27];
  id v17 = v27;

  if (v16)
  {
    [v8 writeToURL:v16 atomically:1];
    int v18 = [MEMORY[0x263F089E0] requestWithURL:v9];
    [v18 setHTTPMethod:@"PUT"];
    [v18 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    long long v19 = [(HMIFeedbackSubmitClipOperation *)v12 feedbackSession];
    uint64_t v20 = [v19 session];
    uint64_t v22 = MEMORY[0x263EF8330];
    uint64_t v23 = 3221225472;
    CMTimeRange v24 = __81__HMIFeedbackSubmitClipOperation__uploadPayloadData_uploadURL_completionHandler___block_invoke;
    CMTime v25 = &unk_26477CE28;
    id v26 = v10;
    id v21 = [v20 uploadTaskWithRequest:v18 fromFile:v16 completionHandler:&v22];

    objc_msgSend(v21, "resume", v22, v23, v24, v25);
  }
  else
  {
    (*((void (**)(id, id))v10 + 2))(v10, v17);
  }
}

uint64_t __81__HMIFeedbackSubmitClipOperation__uploadPayloadData_uploadURL_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_attachEncryptedDataUsingKey:(id)a3 toPayload:(id)a4 error:(id *)a5
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if ([v8 length] == 32)
  {
    id v10 = objc_msgSend(MEMORY[0x263EFF990], "dataWithLength:", -[NSData length](self->_assetData, "length"));
    uint64_t v11 = [MEMORY[0x263EFF990] dataWithLength:16];
    uint64_t v71 = 0;
    double v12 = NSRandomData();
    id v13 = 0;
    char v14 = v13;
    v59 = v11;
    if (v12)
    {
      id v55 = v13;
      v57 = v9;
      id v15 = v8;
      [v15 bytes];
      [v15 length];
      v54 = v12;
      id v16 = v12;
      [v16 bytes];
      id v65 = v16;
      [v16 length];
      [(NSData *)self->_assetData bytes];
      NSUInteger v17 = [(NSData *)self->_assetData length];
      v56 = v10;
      id v62 = v10;
      int v18 = self;
      uint64_t v19 = [v62 mutableBytes];
      id v20 = v11;
      uint64_t v49 = [v20 mutableBytes];
      uint64_t v51 = [v20 length];
      v66 = v18;
      if (CCCryptorGCMOneshotEncrypt())
      {
        id v21 = objc_msgSend(MEMORY[0x263F087E8], "hmiPrivateErrorWithCode:description:", 1000, @"Failed to encrypt data.", v17, v19, v49, v51);
        uint64_t v22 = v21;
        id v9 = v57;
        if (a5) {
          *a5 = v21;
        }
        HMIErrorLog(v66, v22);
        BOOL v23 = 0;
      }
      else
      {
        id v64 = v15;
        id v28 = v16;
        id v29 = -[HMIFeedbackSubmitClipOperation _base64StringFromData:](v18, "_base64StringFromData:", v16, v17, v19, v49, v51);
        id v9 = v57;
        [v57 setObject:v29 forKeyedSubscript:@"iv"];

        __int16 v30 = [(HMIFeedbackSubmitClipOperation *)v18 _base64StringFromData:v20];
        [v57 setObject:v30 forKeyedSubscript:@"authTag"];

        id v31 = [(HMIFeedbackSubmitClipOperation *)v18 _base64StringFromData:v62];
        [v57 setObject:v31 forKeyedSubscript:@"clip"];

        if (!+[HMIPreference isInternalInstall])
        {
          BOOL v23 = 1;
          char v14 = v55;
          id v10 = v56;
          double v12 = v54;
          goto LABEL_15;
        }
        id v53 = v8;
        v63 = [MEMORY[0x263EFF980] array];
        long long v67 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        id obj = [(HMIFeedbackSubmitClipOperation *)v18 faceCrops];
        __int16 v32 = v64;
        uint64_t v61 = [obj countByEnumeratingWithState:&v67 objects:v74 count:16];
        if (v61)
        {
          uint64_t v60 = *(void *)v68;
          while (2)
          {
            for (uint64_t i = 0; i != v61; ++i)
            {
              if (*(void *)v68 != v60) {
                objc_enumerationMutation(obj);
              }
              uint64_t v34 = [*(id *)(*((void *)&v67 + 1) + 8 * i) dataRepresentation];
              id v35 = objc_msgSend(MEMORY[0x263EFF990], "dataWithLength:", objc_msgSend(v34, "length"));
              uint64_t v36 = [MEMORY[0x263EFF990] dataWithLength:16];
              id v37 = v32;
              [v37 bytes];
              [v37 length];
              id v38 = v28;
              [v38 bytes];
              [v38 length];
              id v39 = v34;
              [v39 bytes];
              uint64_t v40 = [v39 length];
              id v41 = v35;
              uint64_t v42 = [v41 mutableBytes];
              id v43 = v36;
              uint64_t v50 = [v43 mutableBytes];
              uint64_t v52 = [v43 length];
              if (CCCryptorGCMOneshotEncrypt())
              {
                v47 = objc_msgSend(MEMORY[0x263F087E8], "hmiPrivateErrorWithCode:description:", 1000, @"Failed to encrypt face crop data.", v40, v42, v50, v52);
                v48 = v47;
                id v8 = v53;
                char v14 = v55;
                if (a5) {
                  *a5 = v47;
                }
                HMIErrorLog(v66, v48);

                BOOL v23 = 0;
                id v10 = v56;
                id v9 = v57;
                double v12 = v54;
                uint64_t v22 = v63;
                goto LABEL_14;
              }
              v72[0] = @"data";
              uint64_t v44 = -[HMIFeedbackSubmitClipOperation _base64StringFromData:](v66, "_base64StringFromData:", v41, v40, v42, v50, v52);
              v73[0] = v44;
              v72[1] = @"authTag";
              v45 = [(HMIFeedbackSubmitClipOperation *)v66 _base64StringFromData:v43];
              v73[1] = v45;
              v46 = [NSDictionary dictionaryWithObjects:v73 forKeys:v72 count:2];
              [v63 addObject:v46];

              __int16 v32 = v64;
              id v28 = v65;
            }
            uint64_t v61 = [obj countByEnumeratingWithState:&v67 objects:v74 count:16];
            if (v61) {
              continue;
            }
            break;
          }
        }

        id v9 = v57;
        uint64_t v22 = v63;
        [v57 setObject:v63 forKeyedSubscript:@"faceCrops"];
        BOOL v23 = 1;
        id v8 = v53;
      }
      char v14 = v55;
      id v10 = v56;
      double v12 = v54;
    }
    else
    {
      id v26 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1000 description:@"Cannot generate initialization vector."];
      uint64_t v22 = v26;
      if (a5) {
        *a5 = v26;
      }
      HMIErrorLog(self, v22);
      BOOL v23 = 0;
    }
LABEL_14:

LABEL_15:
    goto LABEL_16;
  }
  CMTimeRange v24 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1000 description:@"Invalid key size."];
  CMTime v25 = v24;
  if (a5) {
    *a5 = v24;
  }
  HMIErrorLog(self, v25);

  BOOL v23 = 0;
LABEL_16:

  return v23;
}

- (BOOL)_attachFaceCrops:(id)a3 toPayload:(id)a4 error:(id *)a5
{
  return 1;
}

- (id)_createPayloadWithServiceResult:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 objectForKeyedSubscript:@"key"];
  id v8 = [v7 dataUsingEncoding:4];

  id v9 = [MEMORY[0x263EFF9A0] dictionary];
  if ([(HMIFeedbackSubmitClipOperation *)self _attachEncryptedDataUsingKey:v8 toPayload:v9 error:a4])
  {
    id v10 = [v6 objectForKeyedSubscript:@"wrappedKey"];
    [v9 setObject:v10 forKeyedSubscript:@"key"];

    if (+[HMIPreference isInternalInstall]) {
      [v9 setObject:@"1" forKeyedSubscript:@"internal"];
    }
    uint64_t v11 = [MEMORY[0x263F08900] dataWithJSONObject:v9 options:8 error:a4];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (void)_submitClipWithCameraProfileUUID:(id)a3 clipUUID:(id)a4 completionHandler:(id)a5
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)MEMORY[0x22A641C70]();
  double v12 = self;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    char v14 = HMFGetLogIdentifier();
    *(_DWORD *)CMTime buf = 138543874;
    id v35 = v14;
    __int16 v36 = 2112;
    id v37 = v9;
    __int16 v38 = 2112;
    id v39 = v8;
    _os_log_impl(&dword_225DC6000, v13, OS_LOG_TYPE_INFO, "%{public}@Submitting clipUUID: %@, cameraProfileUUID: %@", buf, 0x20u);
  }
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __94__HMIFeedbackSubmitClipOperation__submitClipWithCameraProfileUUID_clipUUID_completionHandler___block_invoke;
  v32[3] = &unk_26477CE50;
  v32[4] = v12;
  id v15 = v10;
  id v33 = v15;
  id v16 = (void *)MEMORY[0x22A641EE0](v32);
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __94__HMIFeedbackSubmitClipOperation__submitClipWithCameraProfileUUID_clipUUID_completionHandler___block_invoke_231;
  v29[3] = &unk_26477CE78;
  v29[4] = v12;
  id v17 = v15;
  id v30 = v17;
  id v31 = v16;
  id v18 = v16;
  uint64_t v19 = (void *)MEMORY[0x22A641EE0](v29);
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __94__HMIFeedbackSubmitClipOperation__submitClipWithCameraProfileUUID_clipUUID_completionHandler___block_invoke_232;
  v24[3] = &unk_26477CEA0;
  v24[4] = v12;
  id v25 = v8;
  id v26 = v9;
  id v27 = v17;
  id v28 = v19;
  id v20 = v19;
  id v21 = v9;
  id v22 = v8;
  id v23 = v17;
  [(HMIFeedbackSubmitClipOperation *)v12 _requestPreSignedURLWithClipUUID:v21 completionHandler:v24];
}

void __94__HMIFeedbackSubmitClipOperation__submitClipWithCameraProfileUUID_clipUUID_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x22A641C70]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    *(_DWORD *)CMTime buf = 138543874;
    id v21 = v10;
    __int16 v22 = 2112;
    id v23 = v5;
    __int16 v24 = 2112;
    id v25 = v6;
    _os_log_impl(&dword_225DC6000, v9, OS_LOG_TYPE_INFO, "%{public}@Stripped Audio %@, error: %@", buf, 0x20u);
  }
  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v11 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v5];
    [*(id *)(a1 + 32) setAssetData:v11];

    double v12 = *(void **)(a1 + 32);
    id v13 = [v12 serviceResult];
    id v19 = 0;
    char v14 = [v12 _createPayloadWithServiceResult:v13 error:&v19];
    id v6 = v19;

    if (v14)
    {
      id v15 = NSURL;
      id v16 = [*(id *)(a1 + 32) serviceResult];
      id v17 = [v16 objectForKeyedSubscript:@"url"];
      id v18 = [v15 URLWithString:v17];

      [*(id *)(a1 + 32) _uploadPayloadData:v14 uploadURL:v18 completionHandler:*(void *)(a1 + 40)];
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

void __94__HMIFeedbackSubmitClipOperation__submitClipWithCameraProfileUUID_clipUUID_completionHandler___block_invoke_231(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x22A641C70]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    int v11 = 138543874;
    double v12 = v10;
    __int16 v13 = 2112;
    id v14 = v5;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_225DC6000, v9, OS_LOG_TYPE_INFO, "%{public}@Downloaded %@, error: %@", (uint8_t *)&v11, 0x20u);
  }
  if (v5) {
    [*(id *)(a1 + 32) _stripAudioTrackAndFacesFromAsset:v5 completionHandler:*(void *)(a1 + 48)];
  }
  else {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __94__HMIFeedbackSubmitClipOperation__submitClipWithCameraProfileUUID_clipUUID_completionHandler___block_invoke_232(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    [*(id *)(a1 + 32) setServiceResult:v5];
    [*(id *)(a1 + 32) _downloadClipWithCameraProfileUUID:*(void *)(a1 + 40) clipUUID:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 64)];
  }
  else
  {
    id v7 = (void *)MEMORY[0x22A641C70]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      int v11 = 138543618;
      double v12 = v10;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_225DC6000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch pre-signed URL, error: %@", (uint8_t *)&v11, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)_requestPreSignedURLWithClipUUID:(id)a3 completionHandler:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x22A641C70]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = HMFGetLogIdentifier();
    double v12 = [(HMIFeedbackSubmitClipOperation *)v9 feedbackServiceHost];
    *(_DWORD *)CMTime buf = 138543874;
    id v25 = v11;
    __int16 v26 = 2112;
    id v27 = v12;
    __int16 v28 = 2112;
    id v29 = v6;
    _os_log_impl(&dword_225DC6000, v10, OS_LOG_TYPE_INFO, "%{public}@Requesting a pre-signed url from server endpoint:%@, for clipUUID:%@", buf, 0x20u);
  }
  __int16 v13 = [(HMIFeedbackSubmitClipOperation *)v9 feedbackSession];
  id v14 = [v13 session];
  uint64_t v15 = [(HMIFeedbackSubmitClipOperation *)v9 feedbackRequestURLForClipWithUUID:v6];
  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  id v20 = __85__HMIFeedbackSubmitClipOperation__requestPreSignedURLWithClipUUID_completionHandler___block_invoke;
  id v21 = &unk_26477CEC8;
  __int16 v22 = v9;
  id v23 = v7;
  id v16 = v7;
  uint64_t v17 = [v14 dataTaskWithURL:v15 completionHandler:&v18];

  objc_msgSend(v17, "resume", v18, v19, v20, v21, v22);
}

void __85__HMIFeedbackSubmitClipOperation__requestPreSignedURLWithClipUUID_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (!v9)
  {
    id v44 = 0;
    id v14 = [MEMORY[0x263F08900] JSONObjectWithData:v7 options:4 error:&v44];
    id v15 = v44;
    if (!v14)
    {
      __int16 v22 = (void *)MEMORY[0x22A641C70]();
      id v23 = *(id *)(a1 + 32);
      __int16 v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        id v25 = HMFGetLogIdentifier();
        *(_DWORD *)CMTime buf = 138543618;
        v46 = v25;
        __int16 v47 = 2112;
        id v48 = v15;
        _os_log_impl(&dword_225DC6000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode server response, error: %@", buf, 0x16u);
      }
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      goto LABEL_26;
    }
    id v16 = v8;
    uint64_t v17 = [v16 statusCode];
    switch(v17)
    {
      case 500:
        __int16 v26 = (void *)MEMORY[0x22A641C70]();
        id v27 = *(id *)(a1 + 32);
        __int16 v28 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          id v29 = v42 = v26;
          *(_DWORD *)CMTime buf = 138543618;
          v46 = v29;
          __int16 v47 = 2112;
          id v48 = v14;
          _os_log_impl(&dword_225DC6000, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to request service result due to internal server error, serverResponse: %@", buf, 0x16u);

          __int16 v26 = v42;
        }

        uint64_t v30 = (void *)MEMORY[0x263F087E8];
        id v31 = @"Status Code:500, Error: Internal server error";
        uint64_t v32 = 1049;
        break;
      case 404:
        id v33 = (void *)MEMORY[0x22A641C70]();
        id v34 = *(id *)(a1 + 32);
        id v35 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          __int16 v36 = v42 = v33;
          *(_DWORD *)CMTime buf = 138543618;
          v46 = v36;
          __int16 v47 = 2112;
          id v48 = v14;
          _os_log_impl(&dword_225DC6000, v35, OS_LOG_TYPE_ERROR, "%{public}@Failed to request service result, resource is not found, serverResponse: %@", buf, 0x16u);

          id v33 = v42;
        }

        uint64_t v30 = (void *)MEMORY[0x263F087E8];
        id v31 = @"Status Code:400, Error: Resource not found on server error";
        uint64_t v32 = 1050;
        break;
      case 200:
        uint64_t v18 = (void *)MEMORY[0x22A641C70]();
        id v19 = *(id *)(a1 + 32);
        id v20 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          id v21 = v43 = v18;
          *(_DWORD *)CMTime buf = 138543618;
          v46 = v21;
          __int16 v47 = 2112;
          id v48 = v14;
          _os_log_impl(&dword_225DC6000, v20, OS_LOG_TYPE_INFO, "%{public}@Service result: %@", buf, 0x16u);

          uint64_t v18 = v43;
        }

        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        goto LABEL_25;
      default:
        id v37 = (void *)MEMORY[0x22A641C70]();
        id v38 = *(id *)(a1 + 32);
        id v39 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          uint64_t v40 = v42 = v37;
          *(_DWORD *)CMTime buf = 138543618;
          v46 = v40;
          __int16 v47 = 2112;
          id v48 = v14;
          _os_log_impl(&dword_225DC6000, v39, OS_LOG_TYPE_ERROR, "%{public}@Failed to request service result due to server error, serverResponse: %@", buf, 0x16u);

          id v37 = v42;
        }

        uint64_t v30 = (void *)MEMORY[0x263F087E8];
        id v31 = @"Unkown server error";
        uint64_t v32 = 1000;
        break;
    }
    uint64_t v41 = objc_msgSend(v30, "hmiPrivateErrorWithCode:description:", v32, v31, v42);

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v15 = (id)v41;
LABEL_25:

LABEL_26:
    goto LABEL_27;
  }
  id v10 = (void *)MEMORY[0x22A641C70]();
  id v11 = *(id *)(a1 + 32);
  double v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    __int16 v13 = HMFGetLogIdentifier();
    *(_DWORD *)CMTime buf = 138543618;
    v46 = v13;
    __int16 v47 = 2112;
    id v48 = v9;
    _os_log_impl(&dword_225DC6000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to request service result from server, error: %@", buf, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_27:
}

- (void)_removeTemporaryFiles
{
  temporaryFileURLs = self->_temporaryFileURLs;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __55__HMIFeedbackSubmitClipOperation__removeTemporaryFiles__block_invoke;
  v3[3] = &unk_26477CEF0;
  v3[4] = self;
  [(NSMutableArray *)temporaryFileURLs na_each:v3];
}

void __55__HMIFeedbackSubmitClipOperation__removeTemporaryFiles__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x22A641C70]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    *(_DWORD *)CMTime buf = 138543618;
    id v20 = v7;
    __int16 v21 = 2112;
    id v22 = v3;
    _os_log_impl(&dword_225DC6000, v6, OS_LOG_TYPE_INFO, "%{public}@Deleting Temporary File %@", buf, 0x16u);
  }
  id v8 = [MEMORY[0x263F08850] defaultManager];
  id v9 = [v3 path];
  int v10 = [v8 fileExistsAtPath:v9];

  if (v10)
  {
    id v11 = [MEMORY[0x263F08850] defaultManager];
    id v18 = 0;
    char v12 = [v11 removeItemAtURL:v3 error:&v18];
    id v13 = v18;

    if ((v12 & 1) == 0)
    {
      id v14 = (void *)MEMORY[0x22A641C70]();
      id v15 = *(id *)(a1 + 32);
      id v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        uint64_t v17 = HMFGetLogIdentifier();
        *(_DWORD *)CMTime buf = 138543874;
        id v20 = v17;
        __int16 v21 = 2112;
        id v22 = v3;
        __int16 v23 = 2112;
        id v24 = v13;
        _os_log_impl(&dword_225DC6000, v16, OS_LOG_TYPE_INFO, "%{public}@Deleted Temporary File %@, error: %@", buf, 0x20u);
      }
    }
  }
}

- (void)main
{
  cameraProfileUUID = self->_cameraProfileUUID;
  clipUUID = self->_clipUUID;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __38__HMIFeedbackSubmitClipOperation_main__block_invoke;
  v4[3] = &unk_26477B940;
  v4[4] = self;
  [(HMIFeedbackSubmitClipOperation *)self _submitClipWithCameraProfileUUID:cameraProfileUUID clipUUID:clipUUID completionHandler:v4];
}

void __38__HMIFeedbackSubmitClipOperation_main__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [*(id *)(a1 + 32) _removeTemporaryFiles];
  id v3 = *(void **)(a1 + 32);
  if (v4) {
    [v3 cancelWithError:v4];
  }
  else {
    [v3 finish];
  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t31 != -1) {
    dispatch_once(&logCategory__hmf_once_t31, &__block_literal_global_246);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v32;
  return v2;
}

uint64_t __45__HMIFeedbackSubmitClipOperation_logCategory__block_invoke()
{
  logCategory__hmf_once_uint64_t v32 = HMFCreateOSLogHandle();
  return MEMORY[0x270F9A758]();
}

- (HMIFeedbackSession)feedbackSession
{
  return (HMIFeedbackSession *)objc_getProperty(self, a2, 312, 1);
}

- (NSUUID)cameraProfileUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 320, 1);
}

- (NSUUID)clipUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 328, 1);
}

- (NSMutableArray)temporaryFileURLs
{
  return (NSMutableArray *)objc_getProperty(self, a2, 336, 1);
}

- (NSSet)faceCrops
{
  return (NSSet *)objc_getProperty(self, a2, 344, 1);
}

- (void)setFaceCrops:(id)a3
{
}

- (NSData)assetData
{
  return (NSData *)objc_getProperty(self, a2, 352, 1);
}

- (void)setAssetData:(id)a3
{
}

- (NSDictionary)serviceResult
{
  return (NSDictionary *)objc_getProperty(self, a2, 360, 1);
}

- (void)setServiceResult:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceResult, 0);
  objc_storeStrong((id *)&self->_assetData, 0);
  objc_storeStrong((id *)&self->_faceCrops, 0);
  objc_storeStrong((id *)&self->_temporaryFileURLs, 0);
  objc_storeStrong((id *)&self->_clipUUID, 0);
  objc_storeStrong((id *)&self->_cameraProfileUUID, 0);
  objc_storeStrong((id *)&self->_feedbackSession, 0);
}

@end