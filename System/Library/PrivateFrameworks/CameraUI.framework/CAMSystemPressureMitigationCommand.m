@interface CAMSystemPressureMitigationCommand
- (void)executeWithContext:(id)a3;
@end

@implementation CAMSystemPressureMitigationCommand

- (void)executeWithContext:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [v3 currentCaptureSession];
  v5 = [v3 currentVideoDevice];
  v6 = +[CAMCaptureCapabilities capabilities];
  if ([v6 isBackPortraitModeSupported]) {
    int v7 = 1;
  }
  else {
    int v7 = [v6 isFrontPortraitModeSupported];
  }
  v8 = [v4 sessionPreset];
  int v9 = [v8 isEqualToString:*MEMORY[0x263EF9780]];

  v10 = [v5 activeFormat];
  int v11 = objc_msgSend(v10, "cam_supportsPortraitFrontFacingZoomed");

  if (v7 && v9 | v11)
  {
    *(_OWORD *)&v38.value = *MEMORY[0x263F01090];
    CMTimeEpoch v12 = *(void *)(MEMORY[0x263F01090] + 16);
    v38.epoch = v12;
    long long v29 = *(_OWORD *)&v38.value;
    *(_OWORD *)&v37.value = *(_OWORD *)&v38.value;
    v37.epoch = v12;
    v13 = [v3 currentStillImageOutput];
    int v14 = [v13 isDepthDataDeliveryEnabled];
    v15 = [v3 currentVideoPreviewLayer];
    v16 = [v15 videoPreviewFilters];
    BOOL v17 = +[CAMEffectFilterManager isDepthEffectInFilters:v16];

    if (v14 && v17)
    {
      v18 = [v5 systemPressureState];
      v19 = [v18 recommendedFrameRateRangeForPortrait];
      v20 = v19;
      if (v19)
      {
        [v19 maxFrameDuration];
        CMTime v38 = time1;
        [v20 minFrameDuration];
      }
      else
      {
        memset(&v38, 0, sizeof(v38));
        memset(&time1, 0, sizeof(time1));
      }
      CMTime v37 = time1;
    }
    if (v5) {
      [v5 activeVideoMinFrameDuration];
    }
    else {
      memset(&time2, 0, sizeof(time2));
    }
    CMTime time1 = v37;
    if (CMTimeCompare(&time1, &time2)) {
      goto LABEL_20;
    }
    if (v5) {
      [v5 activeVideoMaxFrameDuration];
    }
    else {
      memset(&v35, 0, sizeof(v35));
    }
    CMTime time1 = v38;
    if (CMTimeCompare(&time1, &v35))
    {
LABEL_20:
      v28 = v15;
      v21 = v13;
      CFAllocatorRef v22 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CMTime time1 = v37;
      v23 = (__CFString *)CMTimeCopyDescription(v22, &time1);
      CMTime time1 = v38;
      v24 = (__CFString *)CMTimeCopyDescription(v22, &time1);
      CMTime time1 = v37;
      *(_OWORD *)&v34.value = v29;
      v34.epoch = v12;
      if (CMTimeCompare(&time1, &v34)
        || (CMTime time1 = v38, *(_OWORD *)&v34.value = v29, v34.epoch = v12, CMTimeCompare(&time1, &v34)))
      {
        v25 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(time1.value) = 138543618;
          *(CMTimeValue *)((char *)&time1.value + 4) = (CMTimeValue)v23;
          LOWORD(time1.flags) = 2114;
          *(void *)((char *)&time1.flags + 2) = v24;
          _os_log_impl(&dword_2099F8000, v25, OS_LOG_TYPE_DEFAULT, "SystemPressureState: setting min/maxFrameDuration %{public}@/%{public}@", (uint8_t *)&time1, 0x16u);
        }
      }
      else
      {
        if (v5)
        {
          [v5 activeVideoMinFrameDuration];
          v25 = CMTimeCopyDescription(v22, &time);
          [v5 activeVideoMaxFrameDuration];
        }
        else
        {
          memset(&time, 0, sizeof(time));
          v25 = CMTimeCopyDescription(v22, &time);
          memset(&v32, 0, sizeof(v32));
        }
        v26 = (__CFString *)CMTimeCopyDescription(v22, &v32);
        v27 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(time1.value) = 138543618;
          *(CMTimeValue *)((char *)&time1.value + 4) = (CMTimeValue)v25;
          LOWORD(time1.flags) = 2114;
          *(void *)((char *)&time1.flags + 2) = v26;
          _os_log_impl(&dword_2099F8000, v27, OS_LOG_TYPE_DEFAULT, "SystemPressureState: setting min/maxFrameDuration to default values for current preset (previously %{public}@/%{public}@)", (uint8_t *)&time1, 0x16u);
        }
      }
      v13 = v21;

      v15 = v28;
    }
    CMTime v31 = v37;
    [v5 setActiveVideoMinFrameDuration:&v31];
    CMTime v30 = v38;
    [v5 setActiveVideoMaxFrameDuration:&v30];
  }
}

@end