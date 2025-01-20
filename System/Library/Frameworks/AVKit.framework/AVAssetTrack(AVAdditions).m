@interface AVAssetTrack(AVAdditions)
- (BOOL)_avkit_frameRateIsValid:()AVAdditions;
- (CMTime)_avkit_findTimeForFrameUsingFrameRateSteppedByFrameCount:()AVAdditions fromFrameAtTime:;
- (__n128)_avkit_timeForFrameUsingSampleCursorSteppedByFrameCount:()AVAdditions fromFrameAtTime:;
- (void)avkit_timeForFrameSteppedByFrameCount:()AVAdditions fromFrameAtTime:;
@end

@implementation AVAssetTrack(AVAdditions)

- (BOOL)_avkit_frameRateIsValid:()AVAdditions
{
  BOOL v1 = a1 < 0.0;
  if (a1 > 0.0) {
    BOOL v1 = 1;
  }
  if (a1 == 3.4028e38) {
    BOOL v1 = 0;
  }
  return a1 != 1.1755e-38 && v1;
}

- (CMTime)_avkit_findTimeForFrameUsingFrameRateSteppedByFrameCount:()AVAdditions fromFrameAtTime:
{
  *(_OWORD *)a4 = *(_OWORD *)&a3->value;
  *(void *)(a4 + 16) = a3->epoch;
  if (a2)
  {
    v7 = result;
    [(CMTime *)result nominalFrameRate];
    float v9 = v8;
    if ((-[CMTime _avkit_frameRateIsValid:](v7, "_avkit_frameRateIsValid:") & 1) == 0)
    {
      memset(&v15, 0, sizeof(v15));
      [(CMTime *)v7 minFrameDuration];
      CMTime time = v15;
      double v10 = 1.0 / CMTimeGetSeconds(&time);
      float v9 = v10;
    }
    *(float *)&double v10 = v9;
    int v11 = [(CMTime *)v7 _avkit_frameRateIsValid:v10];
    double v12 = 1.0 / v9;
    if (!v11) {
      double v12 = 0.1;
    }
    CMTimeMakeWithSeconds(&rhs, v12 * (double)a2, 6000);
    CMTime time = *a3;
    result = CMTimeAdd(&v15, &time, &rhs);
    *(CMTime *)a4 = v15;
  }
  return result;
}

- (__n128)_avkit_timeForFrameUsingSampleCursorSteppedByFrameCount:()AVAdditions fromFrameAtTime:
{
  uint64_t v1 = MEMORY[0x1E4F1F9F8];
  __n128 result = *(__n128 *)MEMORY[0x1E4F1F9F8];
  *(_OWORD *)a1 = *MEMORY[0x1E4F1F9F8];
  *(void *)(a1 + 16) = *(void *)(v1 + 16);
  return result;
}

- (void)avkit_timeForFrameSteppedByFrameCount:()AVAdditions fromFrameAtTime:
{
  uint64_t v8 = MEMORY[0x1E4F1F9F8];
  *(_OWORD *)a4 = *MEMORY[0x1E4F1F9F8];
  *(void *)(a4 + 16) = *(void *)(v8 + 16);
  float v9 = [a1 mediaType];
  char v10 = [v9 isEqualToString:*MEMORY[0x1E4F15C18]];

  if ((v10 & 1) == 0)
  {
    int v11 = _AVLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(time1.value) = 0;
      double v12 = "Invalid track type for frame stepping.";
      goto LABEL_13;
    }
LABEL_8:

    return;
  }
  if ((a3->flags & 0x1D) != 1)
  {
    CMTime time1 = *a3;
    CMTime v13 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
    if (CMTimeCompare(&time1, &v13) < 0)
    {
      int v11 = _AVLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        LOWORD(time1.value) = 0;
        double v12 = "Invalid input base frame time.";
LABEL_13:
        _os_log_error_impl(&dword_1B05B7000, v11, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&time1, 2u);
        goto LABEL_8;
      }
      goto LABEL_8;
    }
  }
  *(_OWORD *)a4 = *(_OWORD *)&a3->value;
  *(void *)(a4 + 16) = a3->epoch;
  if (a2)
  {
    CMTime v13 = *a3;
    objc_msgSend(a1, "_avkit_timeForFrameUsingSampleCursorSteppedByFrameCount:fromFrameAtTime:", a2, &v13);
    *(CMTime *)a4 = time1;
    if ((*(unsigned char *)(a4 + 12) & 1) == 0)
    {
      CMTime v13 = *a3;
      objc_msgSend(a1, "_avkit_findTimeForFrameUsingFrameRateSteppedByFrameCount:fromFrameAtTime:", a2, &v13);
      *(CMTime *)a4 = time1;
    }
  }
}

@end