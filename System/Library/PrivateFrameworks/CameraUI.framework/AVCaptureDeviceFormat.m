@interface AVCaptureDeviceFormat
@end

@implementation AVCaptureDeviceFormat

void __65__AVCaptureDeviceFormat_CAMCaptureEngine__cam_supportsFrameRate___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  [v9 minFrameRate];
  double v6 = *(double *)(a1 + 40);
  if (v7 <= v6)
  {
    [v9 maxFrameRate];
    if (v6 <= v8)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
}

void __69__AVCaptureDeviceFormat_CAMCaptureEngine__cam_supportsFrameDuration___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  double v7 = v6;
  if (v6) {
    [v6 minFrameDuration];
  }
  else {
    memset(&time1, 0, sizeof(time1));
  }
  CMTime time2 = *(CMTime *)(a1 + 40);
  if (CMTimeCompare(&time1, &time2) <= 0)
  {
    if (v7) {
      [v7 maxFrameDuration];
    }
    else {
      memset(&v8, 0, sizeof(v8));
    }
    CMTime time2 = *(CMTime *)(a1 + 40);
    if (CMTimeCompare(&time2, &v8) <= 0)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
}

void __77__AVCaptureDeviceFormat_CAMCaptureEngine__cam_supportsPanoramaConfiguration___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  [v6 minFrameRate];
  double v8 = v7;
  id v9 = *(void **)(a1 + 32);
  if (v9)
  {
    [v9 minimumFramerate];
    double v10 = (double)(int)v18;
  }
  else
  {
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    double v10 = 0.0;
    uint64_t v19 = 0;
  }
  if (v8 <= v10)
  {
    v11 = *(void **)(a1 + 32);
    if (v11)
    {
      [v11 maximumFramerate];
      double v12 = (double)(int)v15;
    }
    else
    {
      uint64_t v14 = 0;
      uint64_t v15 = 0;
      double v12 = 0.0;
      uint64_t v16 = 0;
    }
    objc_msgSend(v6, "maxFrameRate", v14, v15, v16, v17, v18, v19);
    if (v13 >= v12)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
}

void __63__AVCaptureDeviceFormat_CAMCaptureEngine__cam_maximumFrameRate__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  [v5 maxFrameRate];
  if (v3 > *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    [v5 maxFrameRate];
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4;
  }
}

@end