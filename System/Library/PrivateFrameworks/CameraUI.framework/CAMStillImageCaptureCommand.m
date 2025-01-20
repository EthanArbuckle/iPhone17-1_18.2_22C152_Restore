@interface CAMStillImageCaptureCommand
- (CAMStillImageCaptureCommand)initWithCoder:(id)a3;
- (CAMStillImageCaptureCommand)initWithRequest:(id)a3;
- (CAMStillImageCaptureRequest)_request;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_videoOrientationForCaptureOrientation:(int64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMStillImageCaptureCommand

- (CAMStillImageCaptureCommand)initWithRequest:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CAMStillImageCaptureCommand;
  v6 = [(CAMCaptureCommand *)&v10 initWithSubcommands:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->__request, a3);
    v8 = v7;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMStillImageCaptureCommand;
  v4 = [(CAMCaptureCommand *)&v8 copyWithZone:a3];
  uint64_t v5 = [(CAMStillImageCaptureCommand *)self _request];
  v6 = (void *)v4[3];
  v4[3] = v5;

  return v4;
}

- (CAMStillImageCaptureRequest)_request
{
  return self->__request;
}

- (void)executeWithContext:(id)a3
{
  v75[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  double Current = CFAbsoluteTimeGetCurrent();
  v6 = [(CAMStillImageCaptureCommand *)self _request];
  v7 = [v4 currentStillImageOutput];
  objc_super v8 = [v7 connectionWithMediaType:*MEMORY[0x263EF9D48]];
  if ([v8 isVideoOrientationSupported])
  {
    int64_t v9 = -[CAMStillImageCaptureCommand _videoOrientationForCaptureOrientation:](self, "_videoOrientationForCaptureOrientation:", [v6 captureOrientation]);
    double v10 = CFAbsoluteTimeGetCurrent();
    [v8 setVideoOrientation:v9];
    double v11 = CFAbsoluteTimeGetCurrent() - v10;
    if (v11 > 0.2)
    {
      v12 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v64 = v11;
        _os_log_impl(&dword_2099F8000, v12, OS_LOG_TYPE_DEFAULT, "Call to -[AVCaptureConnection setVideoOrientation:] took %.3fs", buf, 0xCu);
      }
    }
  }
  uint64_t v13 = [v6 ctmCaptureType];
  if (v13 == 2)
  {
    int v14 = 0;
    goto LABEL_10;
  }
  if (v13 == 1)
  {
    int v14 = 1;
LABEL_10:
    int v15 = 1;
    goto LABEL_12;
  }
  int v14 = 0;
  int v15 = 0;
LABEL_12:
  uint64_t v16 = [v6 persistenceUUID];
  v17 = [v4 cachedMomentCaptureSettingsForIdentifier:v16];
  v18 = v17;
  if (v17) {
    int v19 = v15;
  }
  else {
    int v19 = 0;
  }
  if (v19 != 1)
  {
    if (v17)
    {
      v21 = v8;
      uint64_t v22 = [v17 uniqueID];
      v23 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        [(CAMStillImageCaptureCommand *)v16 executeWithContext:v23];
      }

      [v7 cancelMomentCaptureWithUniqueID:v22];
      objc_super v8 = v21;
    }
    else
    {
      if (!v15)
      {
LABEL_28:
        double v20 = [v6 capturePhotoSettingsWithContext:v4];
        v18 = 0;
        goto LABEL_29;
      }
      v18 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[CAMStillImageCaptureCommand executeWithContext:](v16, v18);
      }
      int v15 = 0;
    }

    goto LABEL_28;
  }
  if (v14) {
    [v4 clearCachedMomentCaptureSettingsForIdentifier:v16];
  }
  double v20 = [v18 photoSettings];
  int v15 = 1;
LABEL_29:
  if ([v6 needsLivePhotoCaptureResumedOnPhotoOutput:v7]) {
    [v7 setLivePhotoCaptureSuspended:0];
  }
  if (objc_opt_respondsToSelector())
  {
    char v24 = objc_opt_respondsToSelector();
    if ([v6 isCTMVideo] & 1) == 0 && (v24)
    {
      if ([v7 isUltraHighResolutionZeroShutterLagEnabled])
      {
        if ([*(id *)&v20 photoQualityPrioritization] != 1)
        {
          uint64_t v25 = [*(id *)&v20 maxPhotoDimensions];
          if (v25 != [v7 maxPhotoDimensions])
          {
            v26 = os_log_create("com.apple.camera", "Camera");
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
              -[CAMStillImageCaptureCommand executeWithContext:](v26);
            }

            [v7 setUltraHighResolutionZeroShutterLagEnabled:0];
          }
        }
      }
    }
  }
  else
  {
    [v6 isCTMVideo];
  }
  [v4 registerStillImageCaptureRequest:v6 withSettings:*(void *)&v20];
  unint64_t v27 = [v6 captureOrientation];
  if (v27 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unexpected:%ld", v27);
    v62 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v62 = off_263FA0B20[v27];
  }
  v61 = (void *)v16;
  if ([*(id *)&v20 digitalFlashMode])
  {
    v28 = NSString;
    unint64_t v29 = [v6 lowLightMode];
    if (v29 > 2) {
      v30 = 0;
    }
    else {
      v30 = off_263FA0B48[v29];
    }
    v31 = [v28 stringWithFormat:@" NightMode%@", v30];
  }
  else
  {
    v31 = &stru_26BD78BA0;
  }
  uint64_t v32 = [v4 currentStillImageDelegate];
  v60 = (void *)v32;
  if ((v19 & v15) != 1)
  {
    uint64_t v44 = v32;
    double v45 = CFAbsoluteTimeGetCurrent();
    [v7 capturePhotoWithSettings:*(void *)&v20 delegate:v44];
    double v46 = CFAbsoluteTimeGetCurrent();
    double v47 = CFAbsoluteTimeGetCurrent();
    v33 = os_log_create("com.apple.camera", "Camera");
    v43 = v62;
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_60;
    }
    uint64_t v48 = [*(id *)&v20 uniqueID];
    *(_DWORD *)buf = 134219266;
    double v64 = *(double *)&v48;
    __int16 v65 = 2114;
    v66 = v31;
    __int16 v67 = 2114;
    v68 = v62;
    __int16 v69 = 2114;
    double v70 = v20;
    __int16 v71 = 2048;
    double v72 = v47 - v45;
    __int16 v73 = 2048;
    double v74 = v46 - Current;
    v49 = "captureID:%lld Called capturePhotoWithSettings:%{public}@ (%{public}@) %{public}@. Took %.3fs of %.3fs command time";
LABEL_59:
    _os_log_impl(&dword_2099F8000, v33, OS_LOG_TYPE_DEFAULT, v49, buf, 0x3Eu);
    goto LABEL_60;
  }
  if (![v6 isCTMVideo])
  {
    double v50 = CFAbsoluteTimeGetCurrent();
    objc_msgSend(v7, "commitMomentCaptureToPhotoWithUniqueID:", -[NSObject uniqueID](v18, "uniqueID"));
    double v51 = CFAbsoluteTimeGetCurrent();
    double v52 = CFAbsoluteTimeGetCurrent();
    v33 = os_log_create("com.apple.camera", "Camera");
    v43 = v62;
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_60;
    }
    uint64_t v53 = [*(id *)&v20 uniqueID];
    *(_DWORD *)buf = 134219266;
    double v64 = *(double *)&v53;
    __int16 v65 = 2114;
    v66 = v31;
    __int16 v67 = 2114;
    v68 = v62;
    __int16 v69 = 2114;
    double v70 = v20;
    __int16 v71 = 2048;
    double v72 = v52 - v50;
    __int16 v73 = 2048;
    double v74 = v51 - Current;
    v49 = "captureID:%lld Called commitMomentCapture as Photo:%{public}@ (%{public}@) %{public}@. Took %.3fs of %.3fs command time";
    goto LABEL_59;
  }
  v59 = v8;
  v33 = [v4 currentMomentCaptureMovieRecordingDelegate];
  v34 = [MEMORY[0x263EFA768] movieRecordingSettingsFromMomentCaptureSettings:v18];
  v58 = [v6 localCTMVideoDestinationURL];
  -[__CFString setMovieFileURL:](v34, "setMovieFileURL:");
  [v6 videoEncodingBehavior];
  uint64_t v35 = *MEMORY[0x263EFA370];
  v75[0] = *MEMORY[0x263EFA368];
  v75[1] = v35;
  v57 = [MEMORY[0x263EFF8C0] arrayWithObjects:v75 count:2];
  v56 = +[CAMCaptureEncodingUtilities selectVideoCodecFromAvailableCodecs:withBehavior:](CAMCaptureEncodingUtilities, "selectVideoCodecFromAvailableCodecs:withBehavior:");
  -[__CFString setVideoCodecType:](v34, "setVideoCodecType:");
  uint64_t v36 = [MEMORY[0x263EFF910] date];
  v54 = [v6 location];
  v55 = (void *)v36;
  v37 = +[CAMPersistenceController clientVideoMetadataForLocation:withCreationDate:](CAMPersistenceController, "clientVideoMetadataForLocation:withCreationDate:");
  [(__CFString *)v34 setMovieMetadata:v37];
  double v38 = CFAbsoluteTimeGetCurrent();
  objc_msgSend(v7, "commitMomentCaptureWithUniqueID:toMovieRecordingWithSettings:delegate:", -[NSObject uniqueID](v18, "uniqueID"), v34, v33);
  double v39 = CFAbsoluteTimeGetCurrent();
  double v40 = CFAbsoluteTimeGetCurrent();
  v41 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v42 = [(__CFString *)v34 uniqueID];
    *(_DWORD *)buf = 134219010;
    double v64 = *(double *)&v42;
    __int16 v65 = 2114;
    v66 = v62;
    __int16 v67 = 2114;
    v68 = v34;
    __int16 v69 = 2048;
    double v70 = v40 - v38;
    __int16 v71 = 2048;
    double v72 = v39 - Current;
    _os_log_impl(&dword_2099F8000, v41, OS_LOG_TYPE_DEFAULT, "captureID:%lld Called commitMomentCapture as Video: (%{public}@) %{public}@. Took %.3fs of %.3fs command time", buf, 0x34u);
  }

  objc_super v8 = v59;
  v43 = v62;
LABEL_60:
}

- (void).cxx_destruct
{
}

- (int64_t)_videoOrientationForCaptureOrientation:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) >= 3) {
    return 1;
  }
  else {
    return a3;
  }
}

- (CAMStillImageCaptureCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CAMStillImageCaptureCommand;
  uint64_t v5 = [(CAMCaptureCommand *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"CAMStillImageCaptureCommandRequest"];
    request = v5->__request;
    v5->__request = (CAMStillImageCaptureRequest *)v6;

    objc_super v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CAMStillImageCaptureCommand *)self _request];
  [v4 encodeObject:v5 forKey:@"CAMStillImageCaptureCommandRequest"];
}

- (void)executeWithContext:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2099F8000, log, OS_LOG_TYPE_ERROR, "Capture dimensions should match photo output maximums when ultraHighResolutionZeroShutterLagEnabled==YES. Setting ultraHighResolutionZeroShutterLagEnabled=NO", v1, 2u);
}

- (void)executeWithContext:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 134349314;
  uint64_t v4 = a2;
  __int16 v5 = 2114;
  uint64_t v6 = a1;
  _os_log_error_impl(&dword_2099F8000, log, OS_LOG_TYPE_ERROR, "Non-moment capture requested, canceling moment capture %{public}lld for identifier %{public}@", (uint8_t *)&v3, 0x16u);
}

- (void)executeWithContext:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2099F8000, a2, OS_LOG_TYPE_ERROR, "Failed to find moment settings for identifier %{public}@", (uint8_t *)&v2, 0xCu);
}

@end