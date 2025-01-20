@interface SetSectionProperty
@end

@implementation SetSectionProperty

void __captureSession_SetSectionProperty_block_invoke(uint64_t a1)
{
  captureSession_setPreviewSinkProperty(*(void *)(a1 + 32), *(void *)(a1 + 40), *(const void **)(a1 + 48), *(void **)(a1 + 56));
  v2 = *(const void **)(a1 + 40);
  if (v2) {
    CFRelease(v2);
  }
  v3 = *(const void **)(a1 + 48);
  if (v3) {
    CFRelease(v3);
  }
  v4 = *(const void **)(a1 + 56);
  if (v4)
  {
    CFRelease(v4);
  }
}

void __captureSession_SetSectionProperty_block_invoke_2(uint64_t a1)
{
  captureSession_setPreviewSinkProperty(*(void *)(a1 + 32), *(void *)(a1 + 40), *(const void **)(a1 + 48), *(void **)(a1 + 56));
  v2 = *(const void **)(a1 + 40);
  if (v2) {
    CFRelease(v2);
  }
  v3 = *(const void **)(a1 + 48);
  if (v3) {
    CFRelease(v3);
  }
  v4 = *(const void **)(a1 + 56);
  if (v4)
  {
    CFRelease(v4);
  }
}

void __captureSession_SetSectionProperty_block_invoke_3(uint64_t a1)
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 40) + 664) movieFileSinkPipelineWithSinkID:*(void *)(a1 + 48)];
  uint64_t v3 = [*(id *)(*(void *)(a1 + 40) + 664) visionDataSinkPipelineWithSinkID:*(void *)(a1 + 48)];
  uint64_t v4 = [*(id *)(*(void *)(a1 + 40) + 664) stillImageSinkPipelineSessionStorageWithSinkID:*(void *)(a1 + 48)];
  if (CFEqual(*(CFTypeRef *)(a1 + 56), @"BeginIrisMovieCaptureHostTime"))
  {
    if (dword_1EB4C5110)
    {
      LODWORD(time.value) = 0;
      type[0] = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (v2)
    {
      *(void *)type = 0;
      cs_getMasterClockAndType(*(void **)(*(void *)(a1 + 40) + 664), (uint64_t *)type, 0);
      memset(&v74, 0, sizeof(v74));
      CMTimeMakeFromDictionary(&v74, *(CFDictionaryRef *)(a1 + 64));
      memset(&v73, 0, sizeof(v73));
      CMClockRef HostTimeClock = CMClockGetHostTimeClock();
      CMTime time = v74;
      CMSyncConvertTime(&v73, &time, HostTimeClock, *(CMClockOrTimebaseRef *)type);
      *(CMTime *)&v67[32] = v73;
      *(CMTime *)v67 = v73;
      [(id)-[FigCaptureMovieFileSinkPipeline irisStagingNode](v2) setBeginIrisMovieCaptureTime:v67];
    }
LABEL_29:
    captureSession_updateInflightConfigurationWithIrisSinkPropertyForKey(*(void *)(a1 + 72), *(void *)(a1 + 48), *(const void **)(a1 + 56), *(void **)(a1 + 64));
    return;
  }
  if (CFEqual(*(CFTypeRef *)(a1 + 56), @"EndIrisMovieCaptureHostTime"))
  {
    if (dword_1EB4C5110)
    {
      LODWORD(time.value) = 0;
      type[0] = OS_LOG_TYPE_DEFAULT;
      v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (v2)
    {
      *(void *)type = 0;
      cs_getMasterClockAndType(*(void **)(*(void *)(a1 + 40) + 664), (uint64_t *)type, 0);
      memset(&v74, 0, sizeof(v74));
      CMTimeMakeFromDictionary(&v74, *(CFDictionaryRef *)(a1 + 64));
      memset(&v73, 0, sizeof(v73));
      CMClockRef v9 = CMClockGetHostTimeClock();
      CMTime time = v74;
      CMSyncConvertTime(&v73, &time, v9, *(CMClockOrTimebaseRef *)type);
      *(CMTime *)&v66[32] = v73;
      *(CMTime *)v66 = v73;
      [(id)-[FigCaptureMovieFileSinkPipeline irisStagingNode](v2) setEndIrisMovieCaptureTime:v66];
    }
    goto LABEL_29;
  }
  if (CFEqual(*(CFTypeRef *)(a1 + 56), @"PreservesLivePhotoCaptureSuspendedOnSessionStop"))
  {
    if (dword_1EB4C5110)
    {
      LODWORD(time.value) = 0;
      type[0] = OS_LOG_TYPE_DEFAULT;
      v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    goto LABEL_29;
  }
  if (!(v2 | v4))
  {
    v15 = *(const void **)(a1 + 56);
    if (v3)
    {
      if (CFEqual(v15, @"CaptureSessionVideoDataSinkProperty_KeypointDetectionThreshold"))
      {
        [*(id *)(a1 + 64) floatValue];
        -[FigCaptureVisionDataSinkPipeline setKeypointDetectionThreshold:](v3);
      }
      else if (CFEqual(*(CFTypeRef *)(a1 + 56), @"kFigCaptureSessionVisionDataSinkProperty_RuntimeUpdates"))
      {
        uint64_t v21 = *(void *)(a1 + 64);
        -[FigCaptureVisionDataSinkPipeline setRuntimeUpdates:](v3, v21);
      }
      return;
    }
    if (CFEqual(v15, @"CaptureSessionVideoConnection_VideoOrientation"))
    {
      uint64_t v17 = [*(id *)(*(void *)(a1 + 40) + 664) movieFileSinkPipelineWithVideoConnectionID:*(void *)(a1 + 48)];
      if (-[FigCaptureMovieFileSinkPipeline videoOrientationMetadataNode](v17))
      {
        v18 = *(void **)(a1 + 64);
        v19 = (void *)-[FigCaptureMovieFileSinkPipeline videoOrientationMetadataNode](v17);
        uint64_t v20 = [v18 intValue];
        [v19 updateVideoOrientation:v20];
        return;
      }
    }
    else if (CFEqual(*(CFTypeRef *)(a1 + 56), @"CaptureSessionVideoConnection_VideoMirrored"))
    {
      uint64_t v28 = [*(id *)(*(void *)(a1 + 40) + 664) movieFileSinkPipelineWithVideoConnectionID:*(void *)(a1 + 48)];
      if (-[FigCaptureMovieFileSinkPipeline videoOrientationMetadataNode](v28))
      {
        v29 = *(void **)(a1 + 64);
        v30 = (void *)-[FigCaptureMovieFileSinkPipeline videoOrientationMetadataNode](v28);
        uint64_t v31 = [v29 BOOLValue];
        [v30 updateVideoMirrored:v31];
        return;
      }
    }
    else if (CFEqual(*(CFTypeRef *)(a1 + 56), @"CaptureSessionMetadataSource_MetadataSampleBuffer"))
    {
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      v39 = (void *)[*(id *)(*(void *)(a1 + 40) + 664) metadataSourcePipelines];
      uint64_t v40 = [v39 countByEnumeratingWithState:&v46 objects:v70 count:16];
      if (v40)
      {
        uint64_t v41 = v40;
        uint64_t v42 = *(void *)v47;
LABEL_65:
        uint64_t v43 = 0;
        while (1)
        {
          if (*(void *)v47 != v42) {
            objc_enumerationMutation(v39);
          }
          v44 = *(void **)(*((void *)&v46 + 1) + 8 * v43);
          if (objc_msgSend((id)objc_msgSend(v44, "sourceID"), "isEqualToString:", *(void *)(a1 + 48))) {
            break;
          }
          if (v41 == ++v43)
          {
            uint64_t v41 = [v39 countByEnumeratingWithState:&v46 objects:v70 count:16];
            if (v41) {
              goto LABEL_65;
            }
            goto LABEL_75;
          }
        }
        -[FigCaptureMetadataSourcePipeline appendSampleBuffer:]((uint64_t)v44, *(void *)(a1 + 64));
        if (v44) {
          return;
        }
      }
      goto LABEL_75;
    }
    uint64_t v37 = *(void *)(*(void *)(a1 + 32) + 8);
    int v38 = -12784;
    goto LABEL_73;
  }
  if (CFEqual(*(CFTypeRef *)(a1 + 56), @"CaptureSessionMovieFileSink_MovieLevelMetadata"))
  {
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    v10 = (void *)-[FigCaptureMovieFileSinkPipeline movieFileSinkNodes](v2);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v62 objects:v72 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v63;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v63 != v13) {
            objc_enumerationMutation(v10);
          }
          [*(id *)(*((void *)&v62 + 1) + 8 * i) setMovieLevelMetadata:*(void *)(a1 + 64)];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v62 objects:v72 count:16];
      }
      while (v12);
    }
    return;
  }
  if (CFEqual(*(CFTypeRef *)(a1 + 56), @"CaptureSessionMovieFileSink_BravoCameraSelectionConfigurationForRecording"))
  {
    v16 = *(void **)(a1 + 64);
    memset(&v74, 0, 20);
    [v16 getBytes:&v74 length:20];
    objc_msgSend((id)-[FigCaptureMovieFileSinkPipeline captureDevice](v2), "setBravoStreamSelectionConfigurationForRecording:", *(CMTimeValue *)((char *)&v74.value + 4), *(void *)&v74.flags);
    [(id)-[FigCaptureMovieFileSinkPipeline captureDevice](v2) setBravoStreamSelectionConfigurationForRecordingEnabled:LOBYTE(v74.value)];
    return;
  }
  if (CFEqual(*(CFTypeRef *)(a1 + 56), @"IrisMovieProcessingSuspended"))
  {
    v22 = *(void **)(a1 + 64);
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    v23 = (void *)-[FigCaptureMovieFileSinkPipeline movieFileSinkNodes](v2);
    uint64_t v24 = [v23 countByEnumeratingWithState:&v58 objects:v71 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v59;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v59 != v26) {
            objc_enumerationMutation(v23);
          }
          objc_msgSend(*(id *)(*((void *)&v58 + 1) + 8 * j), "setIrisMovieProcessingSuspended:", objc_msgSend(v22, "BOOLValue"));
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v58 objects:v71 count:16];
      }
      while (v25);
    }
    return;
  }
  if (!CFEqual(*(CFTypeRef *)(a1 + 56), @"UserInitiatedCaptureRequestTime"))
  {
LABEL_75:
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = FigSignalErrorAt();
    return;
  }
  uint64_t v32 = [(id)v4 cameraSourcePipeline];
  if (![(id)-[FigCaptureCameraSourcePipeline captureDevice](v32) zeroShutterLagEnabled]
    || [(id)-[FigCaptureCameraSourcePipeline captureDevice](v32) unifiedBracketingMode])
  {
    return;
  }
  uint64_t v33 = [*(id *)(a1 + 64) unsignedLongLongValue];
  v34 = (void *)[(id)v4 previewSinkNode];
  if (!v34
    || ([v34 previewPTSDisplayedAtHostTime:v33 allowingExtrapolation:1],
        CMTimeEpoch epoch = v74.epoch,
        v73.CMTimeValue value = v74.value,
        CMTimeFlags flags = v74.flags,
        v73.CMTimeScale timescale = v74.timescale,
        (v74.flags & 1) == 0))
  {
    uint64_t v37 = *(void *)(*(void *)(a1 + 32) + 8);
    int v38 = -12780;
LABEL_73:
    *(_DWORD *)(v37 + 24) = v38;
    return;
  }
  v45 = [[FigCaptureStillImageSettings alloc] initWithSettingsID:0];
  [(FigCaptureStillImageSettings *)v45 setUserInitiatedRequestSettings:1];
  [(FigCaptureStillImageSettings *)v45 setStillImageUserInitiatedRequestTime:v33];
  CMTimeValue value = v73.value;
  CMTimeScale timescale = v73.timescale;
  CMTimeFlags v56 = flags;
  CMTimeEpoch v57 = epoch;
  [(FigCaptureStillImageSettings *)v45 setStillImageUserInitiatedRequestPTS:&value];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)v4, "stillImageSinkPipeline"), "stillImageCoordinatorNode"), "initiateStillImageCaptureNowWithSettings:", v45);

  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    [(id)v4 setCurrentUserInitiatedRequestHostTime:v33];
    CMTimeValue v50 = v73.value;
    CMTimeScale v51 = v73.timescale;
    CMTimeFlags v52 = flags;
    CMTimeEpoch v53 = epoch;
    [(id)v4 setCurrentUserInitiatedRequestPTS:&v50];
  }
}

@end