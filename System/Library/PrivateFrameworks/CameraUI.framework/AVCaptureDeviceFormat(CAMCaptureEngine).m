@interface AVCaptureDeviceFormat(CAMCaptureEngine)
- (BOOL)cam_supportsPanoramaConfiguration:()CAMCaptureEngine;
- (BOOL)cam_supportsPortraitFrontFacingZoomed;
- (CMTime)cam_frameDurationForVideoConfiguration:()CAMCaptureEngine;
- (double)cam_frameRateForVideoConfiguration:()CAMCaptureEngine;
- (double)cam_maximumFrameRate;
- (uint64_t)_expectedVideoDimensionsForVideoConfiguration:()CAMCaptureEngine;
- (uint64_t)cam_compareUsingBinning:()CAMCaptureEngine;
- (uint64_t)cam_compareUsingDimensions:()CAMCaptureEngine;
- (uint64_t)cam_compareUsingMaximumFramerate:()CAMCaptureEngine;
- (uint64_t)cam_compareUsingQuality:()CAMCaptureEngine;
- (uint64_t)cam_supportsFrameDuration:()CAMCaptureEngine;
- (uint64_t)cam_supportsFrameRate:()CAMCaptureEngine;
- (uint64_t)cam_supportsFrameRate:()CAMCaptureEngine width:height:colorSpace:enableProResVideo:;
- (uint64_t)cam_supportsVideoConfiguration:()CAMCaptureEngine colorSpace:enableProResVideo:;
@end

@implementation AVCaptureDeviceFormat(CAMCaptureEngine)

- (double)cam_frameRateForVideoConfiguration:()CAMCaptureEngine
{
  switch(a3)
  {
    case 1:
    case 9:
      double v3 = 60.0;
      goto LABEL_10;
    case 2:
    case 4:
    case 13:
      double v3 = 120.0;
      goto LABEL_10;
    case 3:
    case 8:
      double v3 = 240.0;
      goto LABEL_10;
    case 5:
    case 6:
    case 7:
      goto LABEL_4;
    case 10:
      return 24.0;
    case 11:
    case 12:
      return 25.0;
    case 14:
      double v3 = 100.0;
LABEL_10:
      double result = v3;
      break;
    default:
      double result = 0.0;
      if (a3 == 10003) {
LABEL_4:
      }
        double result = 30.0;
      break;
  }
  return result;
}

- (CMTime)cam_frameDurationForVideoConfiguration:()CAMCaptureEngine
{
  objc_msgSend(a1, "cam_frameRateForVideoConfiguration:");
  return CMTimeMake(a2, 1, (int)v3);
}

- (uint64_t)_expectedVideoDimensionsForVideoConfiguration:()CAMCaptureEngine
{
  if (a3 <= 0xE)
  {
    if (((1 << a3) & 0x7620) != 0)
    {
      uint64_t v3 = 0x87000000000;
      uint64_t v4 = 3840;
      return v4 | v3;
    }
    if (((1 << a3) & 0x992) != 0)
    {
      uint64_t v3 = 0x43800000000;
      uint64_t v4 = 1920;
      return v4 | v3;
    }
    if (((1 << a3) & 0x4C) != 0)
    {
      uint64_t v3 = 0x2D000000000;
      uint64_t v4 = 1280;
      return v4 | v3;
    }
  }
  uint64_t v3 = 0x1E000000000;
  uint64_t v4 = 640;
  if (a3 != 10003)
  {
    uint64_t v3 = 0;
    uint64_t v4 = 0;
  }
  return v4 | v3;
}

- (uint64_t)cam_supportsVideoConfiguration:()CAMCaptureEngine colorSpace:enableProResVideo:
{
  objc_msgSend(a1, "cam_frameRateForVideoConfiguration:");
  double v10 = v9;
  uint64_t v11 = [a1 _expectedVideoDimensionsForVideoConfiguration:a3];
  return objc_msgSend(a1, "cam_supportsFrameRate:width:height:colorSpace:enableProResVideo:", (int)v11, v11 >> 32, a4, a5, v10);
}

- (uint64_t)cam_supportsFrameRate:()CAMCaptureEngine width:height:colorSpace:enableProResVideo:
{
  v13 = (const opaqueCMFormatDescription *)[a1 formatDescription];
  if (CMFormatDescriptionGetMediaType(v13) != 1986618469) {
    return 0;
  }
  char v22 = 0;
  int64_t v14 = +[CAMCaptureConversions AVCaptureColorSpaceForColorSpace:a6 hasValidConversion:&v22];
  if (v22)
  {
    int64_t v15 = v14;
    v16 = [a1 supportedColorSpaces];
    v17 = [NSNumber numberWithInteger:v15];
    int v18 = [v16 containsObject:v17];

    if (!v18) {
      return 0;
    }
  }
  if (a7) {
    int v19 = 2016686642;
  }
  else {
    int v19 = a6 > 3 ? 0 : dword_209C7BBD0[a6];
  }
  if (CMFormatDescriptionGetMediaSubType(v13) != v19) {
    return 0;
  }
  if (!a4) {
    return objc_msgSend(a1, "cam_supportsFrameRate:", a2);
  }
  if (!a5) {
    return objc_msgSend(a1, "cam_supportsFrameRate:", a2);
  }
  uint64_t Dimensions = (uint64_t)CMVideoFormatDescriptionGetDimensions(v13);
  uint64_t result = 0;
  if (a5 == Dimensions >> 32 && (int)Dimensions == a4) {
    return objc_msgSend(a1, "cam_supportsFrameRate:", a2);
  }
  return result;
}

- (uint64_t)cam_supportsFrameRate:()CAMCaptureEngine
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  uint64_t v3 = [a1 videoSupportedFrameRateRanges];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __65__AVCaptureDeviceFormat_CAMCaptureEngine__cam_supportsFrameRate___block_invoke;
  v6[3] = &unk_263FA64F8;
  *(double *)&v6[5] = a2;
  v6[4] = &v7;
  [v3 enumerateObjectsUsingBlock:v6];

  uint64_t v4 = *((unsigned __int8 *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (uint64_t)cam_supportsFrameDuration:()CAMCaptureEngine
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  uint64_t v4 = [a1 videoSupportedFrameRateRanges];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __69__AVCaptureDeviceFormat_CAMCaptureEngine__cam_supportsFrameDuration___block_invoke;
  v7[3] = &unk_263FA6520;
  long long v8 = *a3;
  uint64_t v9 = *((void *)a3 + 2);
  v7[4] = &v10;
  [v4 enumerateObjectsUsingBlock:v7];

  uint64_t v5 = *((unsigned __int8 *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v5;
}

- (BOOL)cam_supportsPanoramaConfiguration:()CAMCaptureEngine
{
  id v4 = a3;
  uint64_t v5 = (const opaqueCMFormatDescription *)[a1 formatDescription];
  uint64_t Dimensions = (uint64_t)CMVideoFormatDescriptionGetDimensions(v5);
  if ([v4 sampleBufferWidth] == (int)Dimensions
    && [v4 sampleBufferHeight] == Dimensions >> 32
    && CMFormatDescriptionGetMediaSubType(v5) == 875704422)
  {
    uint64_t v13 = 0;
    int64_t v14 = &v13;
    uint64_t v15 = 0x2020000000;
    char v16 = 0;
    uint64_t v7 = [a1 videoSupportedFrameRateRanges];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __77__AVCaptureDeviceFormat_CAMCaptureEngine__cam_supportsPanoramaConfiguration___block_invoke;
    v10[3] = &unk_263FA6548;
    id v11 = v4;
    uint64_t v12 = &v13;
    [v7 enumerateObjectsUsingBlock:v10];
    BOOL v8 = *((unsigned char *)v14 + 24) != 0;

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)cam_supportsPortraitFrontFacingZoomed
{
  v2 = (const opaqueCMFormatDescription *)[a1 formatDescription];
  if (CMVideoFormatDescriptionGetDimensions(v2) != 0x90C00000C10
    || CMFormatDescriptionGetMediaSubType(v2) != 875704422)
  {
    return 0;
  }
  uint64_t v3 = [a1 supportedDepthDataFormats];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (uint64_t)cam_compareUsingDimensions:()CAMCaptureEngine
{
  id v4 = a3;
  unint64_t Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)[a1 formatDescription]);
  int32_t v6 = Dimensions;
  unint64_t v7 = HIDWORD(Dimensions);
  BOOL v8 = (const opaqueCMFormatDescription *)[v4 formatDescription];

  CMVideoDimensions v9 = CMVideoFormatDescriptionGetDimensions(v8);
  uint64_t v10 = (int)v7 < v9.height && v6 < v9.width;
  BOOL v11 = (int)v7 <= v9.height || v6 <= v9.width;
  uint64_t v12 = v10 << 63 >> 63;
  if (v11) {
    return v12;
  }
  else {
    return 1;
  }
}

- (uint64_t)cam_compareUsingQuality:()CAMCaptureEngine
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(a1, "cam_compareUsingBinning:", v4);
  if (!v5) {
    uint64_t v5 = objc_msgSend(a1, "cam_compareUsingMaximumFramerate:", v4);
  }

  return v5;
}

- (uint64_t)cam_compareUsingBinning:()CAMCaptureEngine
{
  id v4 = a3;
  LODWORD(a1) = [a1 isVideoBinned];
  unsigned int v5 = [v4 isVideoBinned];

  if (a1) {
    return v5 - 1;
  }
  else {
    return v5;
  }
}

- (uint64_t)cam_compareUsingMaximumFramerate:()CAMCaptureEngine
{
  id v4 = a3;
  objc_msgSend(a1, "cam_maximumFrameRate");
  double v6 = v5;
  objc_msgSend(v4, "cam_maximumFrameRate");
  double v8 = v7;

  uint64_t v9 = -1;
  if (v6 <= v8) {
    uint64_t v9 = 0;
  }
  if (v6 >= v8) {
    return v9;
  }
  else {
    return 1;
  }
}

- (double)cam_maximumFrameRate
{
  uint64_t v5 = 0;
  double v6 = (double *)&v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v1 = [a1 videoSupportedFrameRateRanges];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __63__AVCaptureDeviceFormat_CAMCaptureEngine__cam_maximumFrameRate__block_invoke;
  v4[3] = &unk_263FA6570;
  v4[4] = &v5;
  [v1 enumerateObjectsUsingBlock:v4];

  double v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

@end