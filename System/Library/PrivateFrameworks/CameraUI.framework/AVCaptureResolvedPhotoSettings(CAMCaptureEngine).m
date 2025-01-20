@interface AVCaptureResolvedPhotoSettings(CAMCaptureEngine)
- (BOOL)cam_isRecordingMovieForLivePhoto;
@end

@implementation AVCaptureResolvedPhotoSettings(CAMCaptureEngine)

- (BOOL)cam_isRecordingMovieForLivePhoto
{
  uint64_t v1 = [a1 livePhotoMovieDimensions];
  return (int)v1 > 0 && SHIDWORD(v1) > 0;
}

@end