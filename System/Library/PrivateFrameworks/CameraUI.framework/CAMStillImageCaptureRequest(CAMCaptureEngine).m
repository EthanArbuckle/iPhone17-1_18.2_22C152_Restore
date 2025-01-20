@interface CAMStillImageCaptureRequest(CAMCaptureEngine)
@end

@implementation CAMStillImageCaptureRequest(CAMCaptureEngine)

- (void)_configurePhotoSettings:()CAMCaptureEngine shouldIgnoreInitiationSettingsProperties:context:.cold.1(unint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (a1 > 2) {
    v2 = 0;
  }
  else {
    v2 = off_263FA6AE0[a1];
  }
  int v3 = 138543362;
  v4 = v2;
  _os_log_error_impl(&dword_2099F8000, a2, OS_LOG_TYPE_ERROR, "Cannot enable stereo capture because photoQualityPrioritization is set to %{public}@ (must be Quality)", (uint8_t *)&v3, 0xCu);
}

- (void)_configurePhotoSettings:()CAMCaptureEngine shouldIgnoreInitiationSettingsProperties:context:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2099F8000, log, OS_LOG_TYPE_ERROR, "Failed to find a defaultRawThumbnailFormat for the rawEmbeddedThumbnailPhotoFormat", v1, 2u);
}

- (void)_configurePhotoSettings:()CAMCaptureEngine shouldIgnoreInitiationSettingsProperties:context:.cold.3(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2099F8000, log, OS_LOG_TYPE_ERROR, "Failed to find a embeddedThumbnailCodec for the embeddedThumbnailFormat", v1, 2u);
}

@end