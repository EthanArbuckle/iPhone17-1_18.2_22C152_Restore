@interface IrisStillImageSinkEndMomentCapture
@end

@implementation IrisStillImageSinkEndMomentCapture

uint64_t __captureSession_IrisStillImageSinkEndMomentCapture_block_invoke(void *a1)
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  v3 = (void *)[*(id *)(DerivedStorage + 664) movieFileSinkPipelineWithSinkID:a1[4]];
  v4 = (void *)[*(id *)(DerivedStorage + 664) stillImageSinkPipelineSessionStorageWithSinkID:a1[4]];
  uint64_t v39 = [v4 cameraSourcePipeline];
  v5 = *(void **)(a1[6] + 664);
  uint64_t v6 = -[FigCaptureMovieFileSinkPipeline videoSourceID]((uint64_t)v3);
  v7 = (void *)[v5 previewSinkPipelineWithSourceID:v6 sourceDeviceType:-[FigCaptureMovieFileSinkPipeline videoSourceDeviceType]((uint64_t)v3)];
  os_unfair_lock_lock((os_unfair_lock_t)(a1[6] + 360));
  uint64_t v8 = a1[7];
  uint64_t v9 = [*(id *)(a1[6] + 616) settingsID];
  uint64_t v10 = a1[6];
  if (v8 == v9)
  {

    uint64_t v10 = a1[6];
    *(void *)(v10 + 616) = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v10 + 360));
  CMClockOrTimebaseRef v56 = 0;
  cs_getMasterClockAndType(*(void **)(DerivedStorage + 664), (uint64_t *)&v56, 0);
  memset(&v55, 0, sizeof(v55));
  HostTimeClock = CMClockGetHostTimeClock();
  CMClockGetTime(&v55, HostTimeClock);
  v12 = (void *)[v4 previewSinkNode];
  CMTime hostTime = v55;
  uint64_t v13 = CMClockConvertHostTimeToSystemUnits(&hostTime);
  uint64_t v52 = 0;
  uint64_t v53 = 0;
  uint64_t v54 = 0;
  if (v12) {
    [v12 previewPTSDisplayedAtHostTime:v13 allowingExtrapolation:1];
  }
  memset(&v51, 0, sizeof(v51));
  CMClockRef v14 = CMClockGetHostTimeClock();
  CMTime hostTime = v55;
  CMSyncConvertTime(&v51, &hostTime, v14, v56);
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  v15 = (void *)[v3 pendingIrisRecordings];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v47 objects:v64 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v48;
LABEL_7:
    uint64_t v19 = 0;
    while (1)
    {
      if (*(void *)v48 != v18) {
        objc_enumerationMutation(v15);
      }
      v20 = *(void **)(*((void *)&v47 + 1) + 8 * v19);
      if (objc_msgSend((id)objc_msgSend(v20, "settings"), "settingsID") == a1[7]) {
        break;
      }
      if (v17 == ++v19)
      {
        uint64_t v17 = [v15 countByEnumeratingWithState:&v47 objects:v64 count:16];
        if (v17) {
          goto LABEL_7;
        }
        goto LABEL_21;
      }
    }
    if ((objc_msgSend((id)objc_msgSend(v20, "settings"), "isIrisMovieRecording") & 1) == 0 && dword_1EB4C5110)
    {
      LODWORD(v46.value) = 0;
      LOBYTE(type.value) = 0;
      os_log_and_send_and_compose_flags_and_os_log_CMTime type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (v20)
    {
      if (([v20 isEmpty] & 1) == 0)
      {
        v22 = (void *)[v20 irisMovieInfo];
        v23 = v22;
        memset(&v46, 0, sizeof(v46));
        if (v22) {
          [v22 stillImageCaptureTime];
        }
        else {
          memset(&rhs, 0, sizeof(rhs));
        }
        CMTime hostTime = v51;
        CMTimeSubtract(&v46, &hostTime, &rhs);
        memset(&type, 0, sizeof(type));
        CMTimeMake(&type, 500, 1000);
        if ((v46.flags & 1) == 0 || (hostTime = v46, CMTime time2 = type, CMTimeCompare(&hostTime, &time2) < 0))
        {
          if (v23) {
            [v23 stillImageCaptureTime];
          }
          else {
            memset(&lhs, 0, sizeof(lhs));
          }
          CMTime time2 = type;
          CMTimeAdd(&hostTime, &lhs, &time2);
          CMTime v51 = hostTime;
          if (dword_1EB4C5110)
          {
            int v42 = 0;
            os_log_type_t v41 = OS_LOG_TYPE_DEFAULT;
            v27 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
        }
      }
      if (dword_1EB4C5110)
      {
        LODWORD(v46.value) = 0;
        LOBYTE(type.value) = 0;
        v28 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int value = v46.value;
        if (os_log_type_enabled(v28, type.value)) {
          unsigned int v30 = value;
        }
        else {
          unsigned int v30 = value & 0xFFFFFFFE;
        }
        if (v30)
        {
          uint64_t v31 = *(void *)(a1[6] + 104);
          uint64_t v32 = objc_msgSend((id)objc_msgSend(v20, "settings"), "settingsID");
          if ([v20 isEmpty]) {
            v33 = @"YES";
          }
          else {
            v33 = @"NO";
          }
          CMTime hostTime = v51;
          Float64 Seconds = CMTimeGetSeconds(&hostTime);
          LODWORD(time2.value) = 136316162;
          *(CMTimeValue *)((char *)&time2.value + 4) = (CMTimeValue)"captureSession_IrisStillImageSinkEndMomentCapture_block_invoke";
          LOWORD(time2.flags) = 2114;
          *(void *)((char *)&time2.flags + 2) = v31;
          HIWORD(time2.epoch) = 2048;
          uint64_t v58 = v32;
          __int16 v59 = 2112;
          v60 = v33;
          __int16 v61 = 2048;
          Float64 v62 = Seconds;
          LODWORD(v38) = 52;
          p_CMTime time2 = &time2;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      CMTime v40 = v51;
      objc_msgSend(v20, "setMomentCaptureMovieRecordingMasterEndTime:", &v40, p_time2, v38);
      goto LABEL_43;
    }
  }
LABEL_21:
  if (dword_1EB4C5110)
  {
    LODWORD(v46.value) = 0;
    LOBYTE(type.value) = 0;
    v24 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v25 = (void *)-[FigCaptureMovieFileSinkPipeline irisStagingNode]((uint64_t)v3);
  uint64_t v26 = a1[7];
  CMTime hostTime = v51;
  [v25 setMomentCaptureMovieRecordingMasterEndTime:&hostTime forRequestWithSettingsID:v26];
LABEL_43:
  objc_msgSend(v7, "setVideoStabilizationOverscanCropEnabled:momentMovieRecordingEnabled:", 0, 0, p_time2, v38);
  [v7 setSemanticStyleRenderingSuspended:0 animated:1];
  [v4 setVideoStabilizationOverscanCropEnabled:0];
  if ([(id)-[FigCaptureMovieFileSinkPipeline captureDevice]((uint64_t)v3) temporalNoiseReductionBand0StrengthModulation])objc_msgSend((id)-[FigCaptureMovieFileSinkPipeline captureDevice]((uint64_t)v3), "setTemporalNoiseReductionBand0StrengthModulation:", 0); {
  v35 = (void *)-[FigCaptureCameraSourcePipeline captureDevice](v39);
  }
  [v35 setAutomaticallyAdjustsTorch:0];
  uint64_t result = [v35 setTorchLevel:0.0];
  if (v3) {
    return cs_resetImageControlModeAndStreamSelection((uint64_t)v3, 1);
  }
  return result;
}

@end