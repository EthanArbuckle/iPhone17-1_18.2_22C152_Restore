@interface CAMStartVideoRecordingCommand
- (CAMStartVideoRecordingCommand)initWithCoder:(id)a3;
- (CAMStartVideoRecordingCommand)initWithRequest:(id)a3;
- (CAMVideoCaptureRequest)_request;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_videoOrientationForCaptureOrientation:(int64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMStartVideoRecordingCommand

- (CAMStartVideoRecordingCommand)initWithRequest:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CAMStartVideoRecordingCommand;
  v6 = [(CAMCaptureCommand *)&v10 initWithSubcommands:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->__request, a3);
    v8 = v7;
  }

  return v7;
}

- (CAMStartVideoRecordingCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CAMStartVideoRecordingCommand;
  id v5 = [(CAMCaptureCommand *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"CAMVideoCaptureCommandRequest"];
    request = v5->__request;
    v5->__request = (CAMVideoCaptureRequest *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CAMStartVideoRecordingCommand *)self _request];
  [v4 encodeObject:v5 forKey:@"CAMVideoCaptureCommandRequest"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CAMStartVideoRecordingCommand;
  id v4 = [(CAMCaptureCommand *)&v9 copyWithZone:a3];
  id v5 = [(CAMStartVideoRecordingCommand *)self _request];
  uint64_t v6 = [v5 copy];
  v7 = (void *)v4[3];
  v4[3] = v6;

  return v4;
}

- (void)executeWithContext:(id)a3
{
  v30[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(CAMStartVideoRecordingCommand *)self _request];
  uint64_t v6 = [v5 localDestinationURL];
  v7 = [v6 path];

  if (!v7)
  {
    v8 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CAMStartVideoRecordingCommand executeWithContext:]((uint64_t)v6, v8);
    }
  }
  objc_super v9 = [v4 currentMovieFileOutput];
  objc_super v10 = [v9 connectionWithMediaType:*MEMORY[0x263EF9D48]];
  unint64_t v11 = [v5 captureOrientation];
  objc_msgSend(v10, "setVideoOrientation:", -[CAMStartVideoRecordingCommand _videoOrientationForCaptureOrientation:](self, "_videoOrientationForCaptureOrientation:", v11));
  v23 = [MEMORY[0x263EFF910] date];
  v22 = +[CAMPersistenceController clientVideoMetadataForRequest:withCreationDate:isEV0ForHDR:livePhotoIdentifierOverride:slomoPlayback:](CAMPersistenceController, "clientVideoMetadataForRequest:withCreationDate:isEV0ForHDR:livePhotoIdentifierOverride:slomoPlayback:", v5, v23, 0, 0, [v5 captureMode] == 2);
  objc_msgSend(v9, "setMetadata:");
  [v5 maximumRecordedDuration];
  if (v12 > 0.0)
  {
    CMTimeMake(&v24, (uint64_t)v12, 1);
    [v9 setMaxRecordedDuration:&v24];
  }
  uint64_t v13 = [v5 maximumRecordedFileSize];
  if (v13 >= 1) {
    [v9 setMaxRecordedFileSize:v13];
  }
  objc_msgSend(v9, "setMinFreeDiskSpaceLimit:", objc_msgSend(v5, "remainingDiskUsageThreshold"));
  objc_msgSend(v9, "setSendsLastVideoPreviewFrame:", objc_msgSend(v5, "shouldGenerateVideoPreviewImage"));
  uint64_t v14 = [v5 videoEncodingBehavior];
  v15 = [v9 availableVideoCodecTypes];
  uint64_t v16 = +[CAMCaptureEncodingUtilities selectVideoCodecFromAvailableCodecs:v15 withBehavior:v14];
  v17 = (void *)v16;
  if (v16)
  {
    uint64_t v29 = *MEMORY[0x263EFA338];
    v30[0] = v16;
    v18 = [NSDictionary dictionaryWithObjects:v30 forKeys:&v29 count:1];
    [v9 setOutputSettings:v18 forConnection:v10];
  }
  [v4 registerVideoCaptureRequest:v5];
  objc_msgSend(v4, "updateControlEnablementForRecording:mode:devicePosition:", 1, objc_msgSend(v5, "captureMode"), objc_msgSend(v5, "captureDevicePosition"));
  objc_msgSend(v4, "updateLensSelectorForRecording:mode:devicePosition:", 1, objc_msgSend(v5, "captureMode"), objc_msgSend(v5, "captureDevicePosition"));
  v19 = [v4 currentRecordingDelegate];
  [v9 startRecordingToOutputFileURL:v6 recordingDelegate:v19];
  if (v11 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unexpected:%ld", v11);
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = off_263FA3988[v11];
  }
  v21 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v26 = v20;
    __int16 v27 = 2114;
    v28 = v6;
    _os_log_impl(&dword_2099F8000, v21, OS_LOG_TYPE_DEFAULT, "startRecordingToOutputFileURL: (%{public}@) url=%{public}@", buf, 0x16u);
  }
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

- (CAMVideoCaptureRequest)_request
{
  return self->__request;
}

- (void).cxx_destruct
{
}

- (void)executeWithContext:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2099F8000, a2, OS_LOG_TYPE_ERROR, "Missing localDestinationURL while starting video recording %{public}@", (uint8_t *)&v2, 0xCu);
}

@end