@interface CAMOrientationUtilities
+ (int)exifOrientationForVideoRequest:(id)a3;
+ (int64_t)captureOrientationFromPanoramaCaptureOrientation:(int64_t)a3;
+ (int64_t)imageOrientationForVideoRequest:(id)a3;
+ (int64_t)imageOrientationOfResult:(id)a3 withCaptureDevice:(int64_t)a4 captureOrientation:(int64_t)a5;
+ (int64_t)panoramaCaptureOrientationFromCaptureOrientation:(int64_t)a3;
+ (int64_t)videoTrackOrientationForVideoRequest:(id)a3;
@end

@implementation CAMOrientationUtilities

+ (int64_t)imageOrientationOfResult:(id)a3 withCaptureDevice:(int64_t)a4 captureOrientation:(int64_t)a5
{
  v5 = [a3 metadata];
  v6 = [v5 objectForKey:*MEMORY[0x263F0F4C8]];
  v7 = v6;
  if (v6)
  {
    [v6 intValue];
    uint64_t v8 = PLImageOrientationFromExifOrientation();
  }
  else
  {
    PLSensorOrientationFromCaptureOrientation();
    uint64_t v8 = PLImageOrientationFromDeviceOrientation();
  }
  int64_t v9 = v8;

  return v9;
}

+ (int64_t)imageOrientationForVideoRequest:(id)a3
{
  id v3 = a3;
  int v4 = [v3 isCaptureMirrored];
  uint64_t v5 = [v3 captureOrientation];

  switch(v5)
  {
    case 0:
    case 1:
      BOOL v6 = v4 == 0;
      int64_t v7 = 3;
      int64_t v8 = 6;
      goto LABEL_5;
    case 2:
      BOOL v6 = v4 == 0;
      int64_t v7 = 2;
      int64_t v8 = 7;
LABEL_5:
      if (v6) {
        int64_t result = v7;
      }
      else {
        int64_t result = v8;
      }
      break;
    case 3:
      if (v4) {
        int64_t result = 4;
      }
      else {
        int64_t result = 0;
      }
      break;
    case 4:
      if (v4) {
        int64_t result = 5;
      }
      else {
        int64_t result = 1;
      }
      break;
    default:
      int64_t result = 0;
      break;
  }
  return result;
}

+ (int64_t)videoTrackOrientationForVideoRequest:(id)a3
{
  id v3 = a3;
  unsigned int v4 = [v3 isCaptureMirrored];
  uint64_t v5 = [v3 captureOrientation];

  switch(v5)
  {
    case 0:
    case 1:
      if (v4) {
        int64_t result = 2;
      }
      else {
        int64_t result = 3;
      }
      break;
    case 2:
      if (v4) {
        int64_t result = 3;
      }
      else {
        int64_t result = 2;
      }
      break;
    case 3:
      int64_t result = v4;
      break;
    case 4:
      int64_t result = v4 ^ 1;
      break;
    default:
      int64_t result = 0;
      break;
  }
  return result;
}

+ (int)exifOrientationForVideoRequest:(id)a3
{
  id v3 = a3;
  [v3 isCaptureMirrored];
  [v3 captureDevicePosition];
  [v3 captureOrientation];

  return PLExifOrientationFromImageOrientation();
}

+ (int64_t)panoramaCaptureOrientationFromCaptureOrientation:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 2) {
    return 3;
  }
  else {
    return qword_209C78DB0[a3 - 2];
  }
}

+ (int64_t)captureOrientationFromPanoramaCaptureOrientation:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    return 0;
  }
  else {
    return qword_209C78DC8[a3];
  }
}

@end