@interface BWAudioSourceNode
+ (id)audioSourceNodeWithAttributes:(id)a3 sessionPreset:(id)a4 clock:(OpaqueCMClock *)a5 doConfigureAudio:(BOOL)a6 doMixWithOthers:(BOOL)a7 audioSession:(id)a8 CMSession:(opaqueCMSession *)a9 isAppAudioSession:(BOOL)a10 doEndInterruption:(BOOL)a11 audioSessionIsProxy:(BOOL)a12 audioIsPlayingToBuiltinSpeaker:(BOOL)a13 clientAuditToken:(id *)a14 clientOSVersionSupportsDecoupledIO:(BOOL)a15 clientAudioClockDeviceUID:(id)a16 audioCaptureConnectionConfigurations:(id)a17 isConfiguredForContinuityCapture:(BOOL)a18;
+ (void)initialize;
- (BOOL)cinematicVideoCaptureEnabled;
- (BOOL)didBeginInterruption;
- (BOOL)flipStereoAudioCaptureChannels;
- (BOOL)hasNonLiveConfigurationChanges;
- (BOOL)interrupted;
- (BOOL)isAudioPlayingToBuiltinSpeaker;
- (BOOL)levelMeteringEnabled;
- (BOOL)livePhotoCaptureEnabled;
- (BOOL)mixWithOthersActive;
- (BOOL)mixWithOthersEnabled;
- (BOOL)start:(id *)a3;
- (BOOL)stop:(id *)a3;
- (BOOL)videoRecordingEnabled;
- (BOOL)windNoiseRemovalEnabled;
- (CMSampleBufferRef)_createSampleBufferForTimestampedAudioBufferList:(int)a3 audioBufferIndex:;
- (NSArray)audioLevels;
- (OpaqueCMClock)clock;
- (char)_initWithAttributes:(uint64_t)a3 sessionPreset:(const void *)a4 clock:(char)a5 doConfigureAudio:(char)a6 doMixWithOthers:(unint64_t)a7 audioSession:(unint64_t)a8 CMSession:(char)a9 isAppAudioSession:(char)a10 doEndInterruption:(char)a11 audioSessionIsProxy:(char)a12 audioIsPlayingToBuiltinSpeaker:(_OWORD *)a13 clientAuditToken:(char)a14 clientOSVersionSupportsDecoupledIO:(void *)a15 clientAudioClockDeviceUID:(void *)a16 audioCaptureConnectionConfigurations:(char)a17 isConfiguredForContinuityCapture:;
- (float)stereoAudioCapturePairedCameraBaseFieldOfView;
- (float)stereoAudioCapturePairedCameraZoomFactor;
- (id)_copyAudioSessionMXProperty:(_DWORD *)a3 err:;
- (id)nodeSubType;
- (id)outputForMicSourcePosition:(int)a3;
- (int)audioCaptureMode;
- (uint64_t)_audioCombinedLatency;
- (uint64_t)_audioSessionMXBooleanPropertyIsTrue:(uint64_t)result;
- (uint64_t)_cmSessionBooleanPropertyIsTrue:(uint64_t)a1;
- (uint64_t)_configureAudioSessionWithDefaultHardwareSampleRate:(double)a3 didCallDoNotNotifyOtherSessionsOnNextInactive:;
- (uint64_t)_configureCMSessionWithDefaultHardwareSampleRate:(double)a3 didCallDoNotNotifyOtherSessionsOnNextInactive:;
- (uint64_t)_deactivateAudioSessionIfNecessary:(uint64_t)a1;
- (uint64_t)_deactivateCMSessionIfNecessary:(uint64_t)a1;
- (uint64_t)_generatePullBuffers;
- (uint64_t)_getAudioDevicePullFrames:(uint64_t)a1;
- (uint64_t)_selectMicForAudioRoute:(void *)a1;
- (uint64_t)_selectMicForCurrentAudioRoute;
- (uint64_t)_setAudioSessionAudioModeAndSelectMic:(uint64_t)a1;
- (uint64_t)_setAudioSessionMXPropertyWithKey:(uint64_t)a3 value:;
- (uint64_t)_setCMSessionAudioModeAndSelectMic:(uint64_t)a1;
- (uint64_t)_setCMSessionPropertyWithKey:(uint64_t)a1 value:;
- (uint64_t)_setVADCameraParametersWithDirection:(uint64_t)a3 zoomFactor:(float)a4 forTime:;
- (uint64_t)_setupAudioUnit;
- (uint64_t)_setupPrepareToRecordStateWithFlags:(uint64_t)result;
- (uint64_t)_updateAudioDeviceUID:(uint64_t)result;
- (uint64_t)_updatePullFormatDescription;
- (void)_activeAudioRouteDidChangeHandler;
- (void)_generateSamples;
- (void)_generateSilenceIfNeeded;
- (void)_updateMXSessionAudioMode;
- (void)_updateStereoAudioCapturePairedCameraZoomFactorAndStartTimer:(uint64_t)a1;
- (void)dealloc;
- (void)makeOutputsLiveIfNeeded;
- (void)prepareForCurrentConfigurationToBecomeLive;
- (void)prepareToStartRecordingWithOrientation:(int)a3 recordingSettingsID:(int64_t)a4 prefersNoInterruptionsByRingtonesAndAlerts:(BOOL)a5 completionHandler:(id)a6;
- (void)setAudioCaptureMode:(int)a3;
- (void)setCinematicVideoCaptureEnabled:(BOOL)a3;
- (void)setFlipStereoAudioCaptureChannels:(BOOL)a3;
- (void)setInterrupted:(BOOL)a3;
- (void)setLevelMeteringEnabled:(BOOL)a3;
- (void)setLivePhotoCaptureEnabled:(BOOL)a3;
- (void)setMixWithOthersEnabled:(BOOL)a3;
- (void)setStereoAudioCapturePairedCameraBaseFieldOfView:(float)a3;
- (void)setStereoAudioCapturePairedCameraZoomFactor:(float)a3;
- (void)setVideoRecordingEnabled:(BOOL)a3;
- (void)setWindNoiseRemovalEnabled:(BOOL)a3;
- (void)unprepareForRecording;
- (void)updateWithAudioSession:(id)a3 clientAuditToken:(id *)a4;
- (void)zoomCommandHandler:(id)a3 didApplyZoomFactor:(float)a4 zoomFactorWithoutFudge:(float)a5 targetZoomFactor:(float)a6 rampComplete:(BOOL)a7 rampCommandID:(int)a8;
@end

@implementation BWAudioSourceNode

- (OpaqueCMClock)clock
{
  return self->_clock;
}

- (BOOL)didBeginInterruption
{
  return self->_didBeginInterruption;
}

- (id)nodeSubType
{
  return @"AudioDevice";
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  v2.receiver = self;
  v2.super_class = (Class)BWAudioSourceNode;
  [(BWNode *)&v2 prepareForCurrentConfigurationToBecomeLive];
}

- (uint64_t)_generatePullBuffers
{
  if (!a1) {
    return 0;
  }
  int outData = 4096;
  TimestampedAudioBufferListQueueReleaseAndClear((CFTypeRef *)(a1 + 288));
  TimestampedAudioBufferListQueueReleaseAndClear((CFTypeRef *)(a1 + 296));
  objc_super v2 = *(const void **)(a1 + 280);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(a1 + 280) = 0;
  }
  StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(*(CMAudioFormatDescriptionRef *)(a1 + 248));
  if (StreamBasicDescription->mSampleRate <= 0.0)
  {
    unsigned int v4 = 0;
  }
  else
  {
    unsigned int v4 = *(_DWORD *)(a1 + 256);
    if (v4) {
      unsigned int v4 = (StreamBasicDescription->mSampleRate / (double)v4);
    }
  }
  if (v4 <= 5) {
    int32_t v5 = 5;
  }
  else {
    int32_t v5 = v4;
  }
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  uint64_t v7 = CMSimpleQueueCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v5, (CMSimpleQueueRef *)(a1 + 288));
  if (v7) {
    return v7;
  }
  uint64_t v7 = CMSimpleQueueCreate(v6, v5, (CMSimpleQueueRef *)(a1 + 296));
  if (v7) {
    return v7;
  }
  uint64_t v7 = CMSimpleQueueCreate(v6, v5, (CMSimpleQueueRef *)(a1 + 280));
  if (v7) {
    return v7;
  }
  UInt32 ioDataSize = 4;
  AudioUnitGetProperty(*(AudioUnit *)(a1 + 264), 0xEu, 0, 0, &outData, &ioDataSize);
  AudioFormatFlags mFormatFlags = StreamBasicDescription->mFormatFlags;
  if ((mFormatFlags & 0x20) != 0) {
    unsigned int mChannelsPerFrame = StreamBasicDescription->mChannelsPerFrame;
  }
  else {
    unsigned int mChannelsPerFrame = 1;
  }
  if ((mFormatFlags & 0x20) != 0) {
    unsigned int v10 = 1;
  }
  else {
    unsigned int v10 = StreamBasicDescription->mChannelsPerFrame;
  }
  while (1)
  {
    v11 = TimestampedAudioBufferListNew(v6, mChannelsPerFrame, v10, StreamBasicDescription->mBytesPerFrame * outData);
    uint64_t v12 = CMSimpleQueueEnqueue(*(CMSimpleQueueRef *)(a1 + 288), v11);
    if (v12) {
      break;
    }
    if (!--v5)
    {
      uint64_t v13 = 0;
      *(void *)(a1 + 304) = 0;
      long long v14 = *MEMORY[0x1E4F1F9F8];
      uint64_t v15 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
      *(void *)(a1 + 328) = v15;
      *(_OWORD *)(a1 + 312) = v14;
      *(_OWORD *)(a1 + 360) = v14;
      *(void *)(a1 + 376) = v15;
      return v13;
    }
  }
  uint64_t v13 = v12;
  TimestampedAudioBufferListDispose((const __CFAllocator **)v11);
  return v13;
}

- (CMSampleBufferRef)_createSampleBufferForTimestampedAudioBufferList:(int)a3 audioBufferIndex:
{
  if (result)
  {
    int32_t v5 = (CMTime *)result;
    CFAllocatorRef v6 = (const opaqueCMFormatDescription *)objc_msgSend((id)objc_msgSend(*((id *)result + 2), "format"), "formatDescription");
    StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(v6);
    v8 = StreamBasicDescription;
    UInt32 mBytesPerFrame = StreamBasicDescription->mBytesPerFrame;
    size_t v10 = mBytesPerFrame * *(_DWORD *)(a2 + 56);
    size_t v11 = *(_DWORD *)(a2 + 20) * mBytesPerFrame;
    if (StreamBasicDescription->mChannelsPerFrame >= 2
      && (StreamBasicDescription->mFormatFlags & 0x20) != 0
      && objc_msgSend((id)-[CMTime outputs](v5, "outputs"), "count") == 1)
    {
      UInt32 mChannelsPerFrame = v8->mChannelsPerFrame;
      size_t v10 = mChannelsPerFrame * (unint64_t)v10;
      size_t v11 = mChannelsPerFrame * (unint64_t)v11;
      int v13 = 1;
    }
    else
    {
      int v13 = 0;
    }
    CMSampleBufferRef v39 = 0;
    CMBlockBufferRef blockBufferOut = 0;
    dataPointerOut = 0;
    memset(&v37, 0, sizeof(v37));
    uint64_t mBytesPerPacket = 0;
    CFAllocatorRef v14 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    OSStatus DataPointer = CMBlockBufferCreateWithMemoryBlock((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, v11 + v10, (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, v11 + v10, 1u, &blockBufferOut);
    if (!DataPointer)
    {
      OSStatus DataPointer = CMBlockBufferGetDataPointer(blockBufferOut, 0, 0, 0, &dataPointerOut);
      if (!DataPointer)
      {
        v32 = v5;
        if (v10) {
          char v16 = v13;
        }
        else {
          char v16 = 1;
        }
        if ((v16 & 1) == 0) {
          bzero(dataPointerOut, v10);
        }
        formatDescription = v6;
        if (v11)
        {
          if (BYTE3(v5[22].epoch) && v8->mChannelsPerFrame == 2 && (v8->mFormatFlags & 0x20) == 0)
          {
            size_t v17 = 0;
            size_t v18 = (unint64_t)v8->mBytesPerFrame >> 1;
            v19 = *(char **)(*(void *)(a2 + 48) + 16 * a3 + 16);
            v20 = &dataPointerOut[v10];
            do
            {
              memcpy(&v20[v18], v19, v18);
              memcpy(v20, &v19[v18], v18);
              uint64_t v21 = v8->mBytesPerFrame;
              v19 += v21;
              v20 += v21;
              v17 += v21;
            }
            while (v17 < v11);
          }
          else if (v13)
          {
            if (**(_DWORD **)(a2 + 48))
            {
              unint64_t v22 = 0;
              unint64_t v23 = v8->mChannelsPerFrame;
              size_t v24 = v10 / v23;
              size_t v25 = v11 / v23;
              size_t v26 = v25 + v10 / v23;
              uint64_t v27 = 16;
              do
              {
                v28 = &dataPointerOut[v26 * v22];
                bzero(v28, v24);
                memcpy(&v28[v24], *(const void **)(*(void *)(a2 + 48) + v27), v25);
                ++v22;
                v27 += 16;
              }
              while (v22 < **(unsigned int **)(a2 + 48));
            }
          }
          else
          {
            memcpy(&dataPointerOut[v10], *(const void **)(*(void *)(a2 + 48) + 16 * a3 + 16), v11);
          }
        }
        uint64_t mBytesPerPacket = v8->mBytesPerPacket;
        if (v13) {
          sampleSizeArray = 0;
        }
        else {
          sampleSizeArray = (const size_t *)&mBytesPerPacket;
        }
        CMTimeMake(&v37.duration, 1, (int)v8->mSampleRate);
        CMTime lhs = *(CMTime *)(a2 + 24);
        CMTime rhs = v32[17];
        CMTimeSubtract(&v35, &lhs, &rhs);
        v37.presentationTimeStamp = v35;
        v37.decodeTimeStamp = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
        OSStatus DataPointer = CMSampleBufferCreate(v14, blockBufferOut, 1u, 0, 0, formatDescription, (*(_DWORD *)(a2 + 56) + *(_DWORD *)(a2 + 20)), 1, &v37, v13 ^ 1u, sampleSizeArray, &v39);
      }
    }
    OSStatus v30 = DataPointer;
    if (blockBufferOut) {
      CFRelease(blockBufferOut);
    }
    result = v39;
    if (v30)
    {
      if (v39)
      {
        CFRelease(v39);
        return 0;
      }
    }
  }
  return result;
}

void *__27__BWAudioSourceNode_start___block_invoke(uint64_t a1)
{
  for (uint64_t i = 0; i != 3; ++i)
  {
    result = *(void **)(*(void *)(a1 + 32) + 96 + 8 * i);
    if (result)
    {
      if ([result liveFormat])
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        result = (void *)fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      else
      {
        result = (void *)[*(id *)(*(void *)(a1 + 32) + 96 + 8 * i) makeConfiguredFormatLive];
      }
    }
  }
  return result;
}

- (id)_copyAudioSessionMXProperty:(_DWORD *)a3 err:
{
  if (!result) {
    return result;
  }
  int32_t v5 = result;
  CFAllocatorRef v6 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  id v10 = 0;
  if (FigCaptureAudiomxdSupportEnabled())
  {
    id v9 = 0;
    uint64_t v7 = (void *)[v5[16] getMXSessionProperty:a2 error:&v9];
    if (v9) {
      int v8 = [v9 code];
    }
    else {
      int v8 = 0;
    }
    id v10 = v7;
    if (!a3) {
      goto LABEL_12;
    }
  }
  else
  {
    int v8 = CMSessionCopyProperty();
    if (!a3) {
      goto LABEL_12;
    }
  }
  *a3 = v8;
LABEL_12:
  if (*v6 == 1) {
    kdebug_trace();
  }
  return (id *)v10;
}

- (uint64_t)_configureAudioSessionWithDefaultHardwareSampleRate:(double)a3 didCallDoNotNotifyOtherSessionsOnNextInactive:
{
  v26[3] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  CFAllocatorRef v6 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  id v24 = 0;
  int v7 = *(unsigned __int8 *)(a1 + 152);
  -[BWAudioSourceNode _deactivateAudioSessionIfNecessary:](a1, a2);
  if (-[BWAudioSourceNode _setAudioSessionMXPropertyWithKey:value:](a1, *MEMORY[0x1E4F75EC8], @"PlayAndRecord")|| -[BWAudioSourceNode _setAudioSessionMXPropertyWithKey:value:](a1, *MEMORY[0x1E4F75F00], *(void *)(a1 + 136)))
  {
    goto LABEL_38;
  }
  if (!v7)
  {
    if (-[BWAudioSourceNode _setAudioSessionMXPropertyWithKey:value:](a1, *MEMORY[0x1E4F75F80], @"Speaker"))goto LABEL_38; {
LABEL_11:
    }
    [*(id *)(a1 + 128) setPreferredOutputSampleRate:&v24 error:a3];
    goto LABEL_12;
  }
  [*(id *)(a1 + 128) preferDecoupledIO:1 error:&v24];
  int v8 = [v24 code];
  if (-[BWAudioSourceNode _setAudioSessionMXPropertyWithKey:value:](a1, *MEMORY[0x1E4F75F80], @"Speaker"))goto LABEL_38; {
  if (v8)
  }
    goto LABEL_11;
  [*(id *)(a1 + 128) setPreferredInputSampleRate:&v24 error:a3];
LABEL_12:
  [v24 code];
  if (*(unsigned char *)(a1 + 169)) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = 1048578;
  }
  [*(id *)(a1 + 128) setAudioHardwareControlFlags:v9 error:&v24];
  if (![v24 code])
  {
    if (!*(unsigned char *)(a1 + 169)
      || (id v10 = (void *)[MEMORY[0x1E4F74F68] sharedInstance],
          uint64_t v11 = objc_msgSend((id)objc_msgSend((id)a1, "graph"), "clientApplicationID"),
          [v10 setAttribute:v11 forKey:*MEMORY[0x1E4F74AA8] error:&v24],
          ![v24 code])
      && ([*(id *)(a1 + 128) setPreferredIOBufferFrameSize:(unint64_t)(a3 * 0.01) error:&v24],
          ![v24 code])
      && !-[BWAudioSourceNode _setAudioSessionMXPropertyWithKey:value:](a1, *MEMORY[0x1E4F76550], MEMORY[0x1E4F1CC38]))
    {
      if ((uint64_t v12 = (void *)[MEMORY[0x1E4F74F68] sharedAVSystemController],
            uint64_t v13 = objc_msgSend((id)objc_msgSend(v12, "attributeForKey:", *MEMORY[0x1E4F74CA8]), "count"),
            !*(unsigned char *)(a1 + 536))
        && (!*(unsigned char *)(a1 + 174) || v13)
        || !-[BWAudioSourceNode _setAudioSessionMXPropertyWithKey:value:](a1, *MEMORY[0x1E4F76248], (uint64_t)&unk_1EFB01100))
      {
        if (!-[BWAudioSourceNode _setAudioSessionMXPropertyWithKey:value:](a1, *MEMORY[0x1E4F76228], 0))
        {
          if (BWAudioCaptureModeIsSpatial(*(_DWORD *)(a1 + 540)))
          {
            BOOL v14 = *(void *)(a1 + 112) == 0;
            os_unfair_lock_lock((os_unfair_lock_t)(a1 + 596));
            int v15 = *(_DWORD *)(a1 + 592);
            os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 596));
            char v16 = *(NSObject **)(a1 + 560);
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __119__BWAudioSourceNode__configureAudioSessionWithDefaultHardwareSampleRate_didCallDoNotNotifyOtherSessionsOnNextInactive___block_invoke;
            block[3] = &unk_1E5C24F10;
            block[4] = a1;
            BOOL v22 = v14;
            int v23 = v15;
            dispatch_async(v16, block);
            goto LABEL_35;
          }
          if (!FigCFEqual() || *(unsigned char *)(a1 + 169)) {
            goto LABEL_35;
          }
          unsigned int v17 = *(void *)(a1 + 96) != 0;
          if (*(void *)(a1 + 104)) {
            v17 |= 2u;
          }
          uint64_t v18 = *(void *)(a1 + 112) ? v17 | 4 : v17;
          v25[0] = @"camera mics";
          v26[0] = [NSNumber numberWithInt:v18];
          v25[1] = @"camera wind suppression";
          v26[1] = [NSNumber numberWithUnsignedInt:*(unsigned __int8 *)(a1 + 544)];
          v25[2] = @"camera real time dynamics";
          v26[2] = [NSNumber numberWithUnsignedInt:*(unsigned char *)(a1 + 545) == 0];
          uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:3];
          if (!-[BWAudioSourceNode _setAudioSessionMXPropertyWithKey:value:](a1, *MEMORY[0x1E4F75F60], v19))goto LABEL_35; {
        }
          }
      }
    }
  }
LABEL_38:
  FigDebugAssert3();
LABEL_35:
  if (*v6 == 1) {
    kdebug_trace();
  }
  return 0;
}

- (uint64_t)_setAudioSessionMXPropertyWithKey:(uint64_t)a3 value:
{
  if (!a1) {
    return 0;
  }
  CFAllocatorRef v6 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  if (FigCaptureAudiomxdSupportEnabled())
  {
    id v9 = 0;
    [*(id *)(a1 + 128) setMXSessionProperty:a2 value:a3 error:&v9];
    uint64_t v7 = [v9 code];
  }
  else
  {
    uint64_t v7 = -[BWAudioSourceNode _setCMSessionPropertyWithKey:value:](a1);
  }
  if (*v6 == 1) {
    kdebug_trace();
  }
  return v7;
}

- (uint64_t)_deactivateAudioSessionIfNecessary:(uint64_t)a1
{
  if (a1)
  {
    if ([*(id *)(a1 + 128) isActive])
    {
      unsigned int v4 = (void *)[*(id *)(a1 + 128) category];
      if (([v4 isEqualToString:*MEMORY[0x1E4F4E7E8]] & 1) == 0)
      {
        if (!*(unsigned char *)(a1 + 171))
        {
          -[BWAudioSourceNode _setAudioSessionMXPropertyWithKey:value:](a1, *MEMORY[0x1E4F76118], MEMORY[0x1E4F1CC38]);
          *a2 = 1;
        }
        uint64_t v6 = 0;
        [*(id *)(a1 + 128) setActive:0 error:&v6];
      }
    }
  }
  return 0;
}

- (void)_updateStereoAudioCapturePairedCameraZoomFactorAndStartTimer:(uint64_t)a1
{
  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue()) {
      FigDebugAssert3();
    }
    if (BWAudioCaptureModeIsSpatial(*(_DWORD *)(a1 + 540)) && *(unsigned char *)(a1 + 400) && !*(void *)(a1 + 584))
    {
      uint64_t UpTimeNanoseconds = FigGetUpTimeNanoseconds();
      dispatch_time_t v5 = dispatch_time(0, 0);
      if (UpTimeNanoseconds >= *(void *)(a1 + 576))
      {
        os_unfair_lock_lock((os_unfair_lock_t)(a1 + 596));
        float v6 = *(float *)(a1 + 592);
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 596));
        -[BWAudioSourceNode _setVADCameraParametersWithDirection:zoomFactor:forTime:](a1, 0xFFFFFFFFLL, UpTimeNanoseconds, v6);
      }
      if (a2)
      {
        uint64_t v7 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *(dispatch_queue_t *)(a1 + 560));
        *(void *)(a1 + 584) = v7;
        handler[0] = MEMORY[0x1E4F143A8];
        handler[1] = 3221225472;
        handler[2] = __82__BWAudioSourceNode__updateStereoAudioCapturePairedCameraZoomFactorAndStartTimer___block_invoke;
        handler[3] = &unk_1E5C24430;
        handler[4] = a1;
        dispatch_source_set_event_handler(v7, handler);
        int v8 = *(NSObject **)(a1 + 584);
        dispatch_time_t v9 = dispatch_time(v5, *(void *)(a1 + 576) - UpTimeNanoseconds);
        dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0);
        dispatch_resume(*(dispatch_object_t *)(a1 + 584));
      }
    }
  }
}

+ (id)audioSourceNodeWithAttributes:(id)a3 sessionPreset:(id)a4 clock:(OpaqueCMClock *)a5 doConfigureAudio:(BOOL)a6 doMixWithOthers:(BOOL)a7 audioSession:(id)a8 CMSession:(opaqueCMSession *)a9 isAppAudioSession:(BOOL)a10 doEndInterruption:(BOOL)a11 audioSessionIsProxy:(BOOL)a12 audioIsPlayingToBuiltinSpeaker:(BOOL)a13 clientAuditToken:(id *)a14 clientOSVersionSupportsDecoupledIO:(BOOL)a15 clientAudioClockDeviceUID:(id)a16 audioCaptureConnectionConfigurations:(id)a17 isConfiguredForContinuityCapture:(BOOL)a18
{
  uint64_t v19 = [BWAudioSourceNode alloc];
  long long v20 = *(_OWORD *)&a14->var0[4];
  v28[0] = *(_OWORD *)a14->var0;
  v28[1] = v20;
  uint64_t v21 = -[BWAudioSourceNode _initWithAttributes:sessionPreset:clock:doConfigureAudio:doMixWithOthers:audioSession:CMSession:isAppAudioSession:doEndInterruption:audioSessionIsProxy:audioIsPlayingToBuiltinSpeaker:clientAuditToken:clientOSVersionSupportsDecoupledIO:clientAudioClockDeviceUID:audioCaptureConnectionConfigurations:isConfiguredForContinuityCapture:]((char *)v19, a3, (uint64_t)a4, a5, a6, a7, (unint64_t)a8, (unint64_t)a9, a10, a11, a12, a13, v28, a15, a16, a17, a18);
  return v21;
}

- (char)_initWithAttributes:(uint64_t)a3 sessionPreset:(const void *)a4 clock:(char)a5 doConfigureAudio:(char)a6 doMixWithOthers:(unint64_t)a7 audioSession:(unint64_t)a8 CMSession:(char)a9 isAppAudioSession:(char)a10 doEndInterruption:(char)a11 audioSessionIsProxy:(char)a12 audioIsPlayingToBuiltinSpeaker:(_OWORD *)a13 clientAuditToken:(char)a14 clientOSVersionSupportsDecoupledIO:(void *)a15 clientAudioClockDeviceUID:(void *)a16 audioCaptureConnectionConfigurations:(char)a17 isConfiguredForContinuityCapture:
{
  unsigned int v17 = a1;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return v17;
  }
  if (!a4)
  {
LABEL_36:
    FigDebugAssert3();

    return 0;
  }
  v48.receiver = a1;
  v48.super_class = (Class)BWAudioSourceNode;
  unsigned int v17 = (char *)objc_msgSendSuper2(&v48, sel_init);
  if (!v17) {
    return v17;
  }
  *((void *)v17 + 29) = CFRetain(a4);
  *((_DWORD *)v17 + 60) = 0;
  *((_DWORD *)v17 + 101) = 1;
  *((void *)v17 + 15) = (id)objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"AudioSettingsForPresetsMap"), "objectForKeyedSubscript:", a3);
  v17[169] = a17;
  v17[600] = 0;
  if (v17[600] && dword_1EB4C5230)
  {
    int v47 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v17[601] = a12;
  if (a7 | a8)
  {
    if (a7)
    {
      CFTypeRef v26 = (id)a7;
      uint64_t v27 = &OBJC_IVAR___BWAudioSourceNode__audioSession;
    }
    else
    {
      if (!a8)
      {
LABEL_13:
        v17[173] = a5;
        v17[174] = a6;
        v17[171] = a10;
        v17[172] = a9;
        v17[168] = a11;
        if (v17[173])
        {
          *((void *)v17 + 17) = CFRetain((CFTypeRef)*MEMORY[0x1E4F75A58]);
          if (objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"PrefersDecoupledIO"), "BOOLValue"))
          {
            if (a14 && v17[172] && !v17[169]) {
              v17[152] = 1;
            }
          }
        }
        goto LABEL_19;
      }
      CFTypeRef v26 = CFRetain((CFTypeRef)a8);
      uint64_t v27 = &OBJC_IVAR___BWAudioSourceNode__CMSession;
    }
    *(void *)&v17[*v27] = v26;
    goto LABEL_13;
  }
LABEL_19:
  if ((FigCaptureAudiomxdSupportEnabled() & 1) == 0) {
    FigAudioDeviceClockSetIgnoresBluetoothPresentationTimeSupport();
  }
  long long v28 = a13[1];
  *(_OWORD *)(v17 + 184) = *a13;
  *(_OWORD *)(v17 + 200) = v28;
  long long v29 = *(_OWORD *)(v17 + 200);
  v50[0] = *(_OWORD *)(v17 + 184);
  v50[1] = v29;
  *((_DWORD *)v17 + 54) = FigCaptureGetPIDFromAuditToken(v50);
  uint64_t v30 = 0;
  *((void *)v17 + 28) = a15;
  *((_DWORD *)v17 + 68) = 1919512419;
  *((void *)v17 + 22) = 0;
  do
  {
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    uint64_t v31 = objc_msgSend(a16, "countByEnumeratingWithState:objects:count:", &v42, v49, 16, v40, v41);
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v43;
      while (2)
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v43 != v33) {
            objc_enumerationMutation(a16);
          }
          CMTime v35 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          if (v30 == [v35 builtInMicrophonePosition])
          {
            v36 = [[BWNodeOutput alloc] initWithMediaType:1936684398 node:v17];
            *(void *)&v17[8 * v30 + 96] = v36;
            [v17 addOutput:v36];

            [v35 builtInMicrophoneRequiredSampleRate];
            if (v37 > *((double *)v17 + 22))
            {
              [v35 builtInMicrophoneRequiredSampleRate];
              *((void *)v17 + 22) = v38;
            }
            goto LABEL_33;
          }
        }
        uint64_t v32 = [a16 countByEnumeratingWithState:&v42 objects:v49 count:16];
        if (v32) {
          continue;
        }
        break;
      }
    }
LABEL_33:
    ++v30;
  }
  while (v30 != 3);
  *((void *)v17 + 49) = FigDispatchQueueCreateWithPriority();
  *((void *)v17 + 70) = FigDispatchQueueCreateWithPriority();
  *((_DWORD *)v17 + 149) = 0;
  *((void *)v17 + 71) = 100000000;
  if (-[BWAudioSourceNode _setupAudioUnit]((uint64_t)v17)) {
    goto LABEL_36;
  }
  return v17;
}

- (void)setWindNoiseRemovalEnabled:(BOOL)a3
{
  self->_windNoiseRemovalEnabled = a3;
}

- (void)setVideoRecordingEnabled:(BOOL)a3
{
  self->_videoRecordingEnabled = a3;
}

- (void)setLivePhotoCaptureEnabled:(BOOL)a3
{
  self->_livePhotoCaptureEnabled = a3;
}

- (void)setLevelMeteringEnabled:(BOOL)a3
{
  self->_levelMeteringEnabled = a3;
  BOOL inData = a3;
  if (AudioUnitSetProperty(self->_audioUnit, 0x766u, 1u, 1u, &inData, 4u)) {
    self->_levelMeteringEnabled = 0;
  }
}

- (void)setAudioCaptureMode:(int)a3
{
  self->_audioCaptureMode = a3;
  if (a3 == 5)
  {
    self->_silenceFramesFillingDisabled = 1;
    if (dword_1EB4C5230)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
}

- (id)outputForMicSourcePosition:(int)a3
{
  if (a3 > 2) {
    return 0;
  }
  else {
    return self->_outputsByMicSourcePosition[a3];
  }
}

- (int)audioCaptureMode
{
  return self->_audioCaptureMode;
}

- (void)_generateSamples
{
  if (a1 && !*(unsigned char *)(a1 + 402))
  {
    context = (void *)MEMORY[0x1A6272C70]();
    StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(*(CMAudioFormatDescriptionRef *)(a1 + 248));
    AudioFormatFlags mFormatFlags = StreamBasicDescription->mFormatFlags;
    uint64_t v4 = *(void *)(a1 + 448);
    *(void *)(a1 + 448) = 0;
    while (CMSimpleQueueDequeue(*(CMSimpleQueueRef *)(a1 + 280)))
      ;
    dispatch_time_t v5 = (char *)CMSimpleQueueDequeue(*(CMSimpleQueueRef *)(a1 + 296));
    if (v5)
    {
      float v6 = v5;
      do
      {
        uint64_t v7 = v6 + 24;
        CMTime v22 = *(CMTime *)(v6 + 1);
        int64_t v8 = *((unsigned int *)v6 + 14);
        if (v8)
        {
          CMTimeMake(&rhs, v8, (int)StreamBasicDescription->mSampleRate);
          *(_OWORD *)&lhs.value = *v7;
          lhs.epoch = *((void *)v6 + 5);
          CMTimeAdd(&v22, &lhs, &rhs);
        }
        if (v4)
        {
          uint64_t v9 = *((unsigned int *)v6 + 14);
          if (v9)
          {
            int v10 = (v9 - v4) & ~((v9 - v4) >> 63);
            *((_DWORD *)v6 + 14) = v10;
            CMTimeMake(&v19, (v9 - v10), (int)StreamBasicDescription->mSampleRate);
            *(_OWORD *)&v18.value = *v7;
            v18.epoch = *((void *)v6 + 5);
            CMTimeAdd(&lhs, &v18, &v19);
            *uint64_t v7 = *(_OWORD *)&lhs.value;
            *((void *)v6 + 5) = lhs.epoch;
          }
        }
        if ((mFormatFlags & 0x20) != 0 && *(_DWORD *)(a1 + 540) == 6)
        {
          for (uint64_t i = 0; i != 3; ++i)
          {
            if (*(void *)(a1 + 96 + 8 * i))
            {
              CMSampleBufferRef v12 = -[BWAudioSourceNode _createSampleBufferForTimestampedAudioBufferList:audioBufferIndex:]((CMSampleBufferRef)a1, (uint64_t)v6, i);
              [*(id *)(a1 + 96 + 8 * i) emitSampleBuffer:v12];
              if (v12) {
                CFRelease(v12);
              }
            }
          }
        }
        else
        {
          CMSampleBufferRef v13 = -[BWAudioSourceNode _createSampleBufferForTimestampedAudioBufferList:audioBufferIndex:]((CMSampleBufferRef)a1, (uint64_t)v6, 0);
          objc_msgSend(*(id *)(a1 + 16), "emitSampleBuffer:", v13, context);
          if (v13) {
            CFRelease(v13);
          }
        }
        *(void *)(a1 + 464) = *((void *)v6 + 1);
        CMTimeMake(&v17, *((unsigned int *)v6 + 5), (int)StreamBasicDescription->mSampleRate);
        CMTime v18 = v22;
        CMTimeAdd(&lhs, &v18, &v17);
        *(CMTime *)(a1 + 480) = lhs;
        BOOL v14 = *(NSObject **)(a1 + 432);
        dispatch_time_t v15 = dispatch_time(0, (uint64_t)((double)(2 * *((_DWORD *)v6 + 5))/ StreamBasicDescription->mSampleRate* 1000000000.0));
        dispatch_source_set_timer(v14, v15, 0xFFFFFFFFFFFFFFFFLL, 0);
        TimestampedAudioBufferListReset((uint64_t)v6);
        CMSimpleQueueEnqueue(*(CMSimpleQueueRef *)(a1 + 288), v6);
        float v6 = (char *)CMSimpleQueueDequeue(*(CMSimpleQueueRef *)(a1 + 296));
        uint64_t v4 = 0;
      }
      while (v6);
    }
  }
}

- (void)setCinematicVideoCaptureEnabled:(BOOL)a3
{
  self->_cinematicVideoCaptureEnabled = a3;
}

- (uint64_t)_updatePullFormatDescription
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    *(_DWORD *)v93 = 0;
    memset(&__s2, 0, sizeof(__s2));
    unsigned int v91 = 0;
    objc_super v2 = *(void **)(result + 128);
    v3 = &unk_1EB4C5000;
    if (v2)
    {
      [v2 inputSampleRate];
      double v5 = v4;
    }
    else
    {
      if (!*(void *)(v1 + 144))
      {
        BOOL v14 = 0;
        double v10 = 0.0;
        double v5 = 0.0;
        goto LABEL_60;
      }
      *(_DWORD *)&v93[8] = 0;
      *(void *)v93 = CMSessionCopyProperty();
      if (*(_DWORD *)v93)
      {
        *(_DWORD *)os_log_type_t type = 0;
        v88[0] = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        goto LABEL_170;
      }
      objc_opt_class();
      double v5 = 0.0;
      if (objc_opt_isKindOfClass())
      {
        [*(id *)&v93[4] doubleValue];
        double v5 = v6;
      }
      CFRelease(*(CFTypeRef *)&v93[4]);
    }
    StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(*(CMAudioFormatDescriptionRef *)(v1 + 248));
    if (!StreamBasicDescription)
    {
      *(_DWORD *)v93 = -12710;
      *(_DWORD *)&v93[4] = 0;
      type[0] = OS_LOG_TYPE_DEFAULT;
      v77 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT);
      goto LABEL_170;
    }
    long long v8 = *(_OWORD *)&StreamBasicDescription->mSampleRate;
    long long v9 = *(_OWORD *)&StreamBasicDescription->mBytesPerPacket;
    *(void *)&__s2.UInt32 mBitsPerChannel = *(void *)&StreamBasicDescription->mBitsPerChannel;
    *(_OWORD *)&__s2.mSampleRate = v8;
    *(_OWORD *)&__s2.uint64_t mBytesPerPacket = v9;
    double v10 = v5;
    if (*(unsigned char *)(v1 + 173))
    {
      double v11 = fmax(*(double *)(v1 + 176), 0.0);
      if (*(unsigned char *)(v1 + 169)) {
        double v11 = 48000.0;
      }
      if (v11 == 0.0) {
        double v11 = 44100.0;
      }
      if (v5 <= v11) {
        double v10 = v5;
      }
      else {
        double v10 = v11;
      }
    }
    if ((int)__s2.mSampleRate == (int)v10)
    {
      if (dword_1EB4C5230)
      {
        *(_DWORD *)&v93[4] = 0;
        type[0] = OS_LOG_TYPE_DEFAULT;
        CMSampleBufferRef v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        BOOL v15 = 0;
        v3 = (_DWORD *)&unk_1EB4C5000;
      }
      else
      {
        BOOL v15 = 0;
      }
    }
    else
    {
      if (dword_1EB4C5230)
      {
        *(_DWORD *)&v93[4] = 0;
        type[0] = OS_LOG_TYPE_DEFAULT;
        CMSampleBufferRef v13 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        v3 = &unk_1EB4C5000;
      }
      __s2.mSampleRate = v10;
      BOOL v15 = 1;
    }
    if (*(void *)(v1 + 128))
    {
      char v16 = -[BWAudioSourceNode _copyAudioSessionMXProperty:err:]((id *)v1, *MEMORY[0x1E4F76020], v93);
      UInt32 v17 = [v16 intValue];

      if (v3[140])
      {
        *(_DWORD *)&v93[4] = 0;
        type[0] = OS_LOG_TYPE_DEFAULT;
        CMTime v18 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v19 = *(_DWORD *)&v93[4];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
          unsigned int v20 = v19;
        }
        else {
          unsigned int v20 = v19 & 0xFFFFFFFE;
        }
        if (v20)
        {
          LODWORD(__s1.mSampleRate) = 136315394;
          *(void *)((char *)&__s1.mSampleRate + 4) = "-[BWAudioSourceNode _updatePullFormatDescription]";
          LOWORD(__s1.mFormatFlags) = 1024;
          *(AudioFormatFlags *)((char *)&__s1.mFormatFlags + 2) = v17;
          LODWORD(v87) = 18;
          p_s1 = &__s1;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        v3 = (_DWORD *)&unk_1EB4C5000;
      }
      if (*(_DWORD *)v93)
      {
        *(_DWORD *)&v93[4] = 0;
        type[0] = OS_LOG_TYPE_DEFAULT;
        uint64_t v21 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v22 = *(_DWORD *)&v93[4];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
          unsigned int v23 = v22;
        }
        else {
          unsigned int v23 = v22 & 0xFFFFFFFE;
        }
        if (!v23) {
          goto LABEL_170;
        }
        goto LABEL_43;
      }
    }
    else if (*(void *)(v1 + 144))
    {
      *(_DWORD *)&v93[8] = 0;
      *(void *)v93 = CMSessionCopyProperty();
      if (*(_DWORD *)v93)
      {
        *(_DWORD *)os_log_type_t type = 0;
        v88[0] = OS_LOG_TYPE_DEFAULT;
        v85 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT);
        goto LABEL_170;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        UInt32 v17 = [*(id *)&v93[4] intValue];
      }
      else {
        UInt32 v17 = 0;
      }
      CFRelease(*(CFTypeRef *)&v93[4]);
    }
    else
    {
      UInt32 v17 = 0;
    }
    if (__s2.mChannelsPerFrame != v17)
    {
      if (v3[140])
      {
        *(_DWORD *)&v93[4] = 0;
        type[0] = OS_LOG_TYPE_DEFAULT;
        id v24 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v25 = *(_DWORD *)&v93[4];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
          unsigned int v26 = v25;
        }
        else {
          unsigned int v26 = v25 & 0xFFFFFFFE;
        }
        if (v26)
        {
          LODWORD(__s1.mSampleRate) = 136315650;
          *(void *)((char *)&__s1.mSampleRate + 4) = "-[BWAudioSourceNode _updatePullFormatDescription]";
          LOWORD(__s1.mFormatFlags) = 1024;
          *(AudioFormatFlags *)((char *)&__s1.mFormatFlags + 2) = __s2.mChannelsPerFrame;
          HIWORD(__s1.mBytesPerPacket) = 1024;
          __s1.mFramesPerPacket = v17;
          LODWORD(v87) = 24;
          p_s1 = &__s1;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        v3 = &unk_1EB4C5000;
      }
      __s2.UInt32 mBytesPerFrame = (__s2.mBitsPerChannel >> 3) * v17;
      __s2.UInt32 mChannelsPerFrame = v17;
      __s2.uint64_t mBytesPerPacket = __s2.mBytesPerFrame;
      BOOL v15 = 1;
    }
    if (FigCFEqual())
    {
      AudioStreamBasicDescription __s1 = __s2;
      if (__s2.mChannelsPerFrame != 3)
      {
        *(_DWORD *)v93 = -12780;
        *(_DWORD *)os_log_type_t type = 0;
        v88[0] = OS_LOG_TYPE_DEFAULT;
        v78 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT);
        goto LABEL_170;
      }
      __s2.mFormatFlags |= 0x20u;
      __s2.uint64_t mBytesPerPacket = __s2.mBitsPerChannel >> 3;
      __s2.mFramesPerPacket = 1;
      __s2.UInt32 mBytesPerFrame = __s2.mBitsPerChannel >> 3;
      BOOL v15 = memcmp(&__s1, &__s2, 0x28uLL) != 0;
    }
    BOOL v14 = v15;
LABEL_60:
    if (*(unsigned char *)(v1 + 169))
    {
      __s2.mSampleRate = 48000.0;
      __s2.UInt32 mBytesPerFrame = 4;
      *(_OWORD *)&__s2.mFormatID = xmmword_1A5F0CBE0;
      *(void *)&__s2.UInt32 mBitsPerChannel = 32;
      int v27 = *(_DWORD *)(v1 + 540);
      if (v27 == 5)
      {
        __s2.UInt32 mChannelsPerFrame = 4;
        goto LABEL_68;
      }
      BOOL v14 = 1;
      __s2.UInt32 mChannelsPerFrame = 1;
    }
    else
    {
      int v27 = *(_DWORD *)(v1 + 540);
    }
    if (v27 == 2)
    {
      __s2.mSampleRate = 48000.0;
      *(_OWORD *)&__s2.mFormatID = xmmword_1A5F0CBE0;
      *(_OWORD *)&__s2.UInt32 mBytesPerFrame = xmmword_1A5F0CBF0;
    }
    else if (!v14)
    {
      int v32 = 0;
      goto LABEL_82;
    }
LABEL_68:
    if (v3[140])
    {
      *(_DWORD *)&v93[4] = 0;
      type[0] = OS_LOG_TYPE_DEFAULT;
      long long v28 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v29 = *(_DWORD *)&v93[4];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v30 = v29;
      }
      else {
        unsigned int v30 = v29 & 0xFFFFFFFE;
      }
      if (v30)
      {
        LODWORD(__s1.mSampleRate) = 136316418;
        *(void *)((char *)&__s1.mSampleRate + 4) = "-[BWAudioSourceNode _updatePullFormatDescription]";
        LOWORD(__s1.mFormatFlags) = 1024;
        *(AudioFormatFlags *)((char *)&__s1.mFormatFlags + 2) = __s2.mFormatID;
        HIWORD(__s1.mBytesPerPacket) = 2048;
        *(Float64 *)&__s1.mFramesPerPacket = __s2.mSampleRate;
        LOWORD(__s1.mChannelsPerFrame) = 1024;
        *(UInt32 *)((char *)&__s1.mChannelsPerFrame + 2) = __s2.mFormatFlags;
        HIWORD(__s1.mBitsPerChannel) = 1024;
        __s1.mReserved = __s2.mChannelsPerFrame;
        __int16 v95 = 1024;
        UInt32 mBitsPerChannel = __s2.mBitsPerChannel;
        LODWORD(v87) = 46;
        p_s1 = &__s1;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    *(_DWORD *)v93 = AudioUnitSetProperty(*(AudioUnit *)(v1 + 264), 8u, 2u, 1u, &__s2, 0x28u);
    if (*(_DWORD *)v93) {
      return *(unsigned int *)v93;
    }
    if (*(_DWORD *)(v1 + 540) == 2)
    {
      *(_OWORD *)&__s1.mSampleRate = xmmword_1A5F0CC00;
      *(_OWORD *)&__s1.uint64_t mBytesPerPacket = *(_OWORD *)algn_1A5F0CC10;
      *(_DWORD *)v93 = AudioUnitSetProperty(*(AudioUnit *)(v1 + 264), 0x13u, 2u, 1u, &__s1, 0x20u);
      if (*(_DWORD *)v93)
      {
        *(_DWORD *)os_log_type_t type = 0;
        v88[0] = OS_LOG_TYPE_DEFAULT;
        v82 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT);
        goto LABEL_170;
      }
      if ((v3[140] & 0x20) != 0)
      {
        *(_DWORD *)os_log_type_t type = 0;
        v88[0] = OS_LOG_TYPE_DEFAULT;
        uint64_t v31 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        v3 = (_DWORD *)&unk_1EB4C5000;
      }
    }
    int v32 = 1;
LABEL_82:
    ChannelLayout = CMAudioFormatDescriptionGetChannelLayout(*(CMAudioFormatDescriptionRef *)(v1 + 248), 0);
    *(_DWORD *)v93 = AudioUnitInitialize(*(AudioUnit *)(v1 + 264));
    if (*(_DWORD *)v93)
    {
      *(_DWORD *)&v93[4] = 0;
      type[0] = OS_LOG_TYPE_DEFAULT;
      v74 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v75 = *(_DWORD *)&v93[4];
      if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v76 = v75;
      }
      else {
        unsigned int v76 = v75 & 0xFFFFFFFE;
      }
      if (!v76) {
        goto LABEL_170;
      }
LABEL_43:
      LODWORD(__s1.mSampleRate) = 136315394;
      *(void *)((char *)&__s1.mSampleRate + 4) = "-[BWAudioSourceNode _updatePullFormatDescription]";
      LOWORD(__s1.mFormatFlags) = 1024;
      *(AudioFormatFlags *)((char *)&__s1.mFormatFlags + 2) = *(_DWORD *)v93;
LABEL_185:
      _os_log_send_and_compose_impl();
      goto LABEL_170;
    }
    if (ChannelLayout) {
      int v34 = v32;
    }
    else {
      int v34 = 1;
    }
    if (v34 != 1) {
      goto LABEL_159;
    }
    *(void *)os_log_type_t type = 0;
    UInt32 outDataSize = 0;
    *(_DWORD *)v93 = AudioUnitGetPropertyInfo(*(AudioUnit *)(v1 + 264), 0x13u, 1u, 1u, &outDataSize, 0);
    if (*(_DWORD *)v93 || !outDataSize)
    {
      *(_DWORD *)&v93[4] = 0;
      v88[0] = OS_LOG_TYPE_DEFAULT;
      uint64_t v41 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v42 = *(_DWORD *)&v93[4];
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v43 = v42;
      }
      else {
        unsigned int v43 = v42 & 0xFFFFFFFE;
      }
      if (v43)
      {
        LODWORD(__s1.mSampleRate) = 136315650;
        *(void *)((char *)&__s1.mSampleRate + 4) = "-[BWAudioSourceNode _updatePullFormatDescription]";
        LOWORD(__s1.mFormatFlags) = 1024;
        *(AudioFormatFlags *)((char *)&__s1.mFormatFlags + 2) = *(_DWORD *)v93;
        HIWORD(__s1.mBytesPerPacket) = 1024;
        __s1.mFramesPerPacket = outDataSize;
        LODWORD(v87) = 24;
        p_s1 = &__s1;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      CMTime v35 = 0;
    }
    else
    {
      CMTime v35 = (AudioChannelLayout *)malloc_type_malloc(outDataSize, 0x3D4F2A1CuLL);
      *(_DWORD *)v93 = AudioUnitGetProperty(*(AudioUnit *)(v1 + 264), 0x13u, 1u, 1u, v35, &outDataSize);
      if (*(_DWORD *)v93)
      {
        *(_DWORD *)&v93[4] = 0;
        v88[0] = OS_LOG_TYPE_DEFAULT;
        v36 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v37 = *(_DWORD *)&v93[4];
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT)) {
          unsigned int v38 = v37;
        }
        else {
          unsigned int v38 = v37 & 0xFFFFFFFE;
        }
        if (v38)
        {
          AudioFormatFlags v39 = *(_DWORD *)v93;
          uint64_t v40 = BWStringFromAudioChannelLayout(&v35->mChannelLayoutTag);
          LODWORD(__s1.mSampleRate) = 136315906;
          *(void *)((char *)&__s1.mSampleRate + 4) = "-[BWAudioSourceNode _updatePullFormatDescription]";
          LOWORD(__s1.mFormatFlags) = 1024;
          *(AudioFormatFlags *)((char *)&__s1.mFormatFlags + 2) = v39;
          HIWORD(__s1.mBytesPerPacket) = 2112;
          *(void *)&__s1.mFramesPerPacket = v40;
          LOWORD(__s1.mChannelsPerFrame) = 1024;
          *(UInt32 *)((char *)&__s1.mChannelsPerFrame + 2) = outDataSize;
          LODWORD(v87) = 34;
          p_s1 = &__s1;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        UInt32 outDataSize = 0;
        if (v35)
        {
          free(v35);
          CMTime v35 = 0;
        }
        v3 = &unk_1EB4C5000;
      }
    }
    if (v3[140])
    {
      *(_DWORD *)&v93[4] = 0;
      v88[0] = OS_LOG_TYPE_DEFAULT;
      long long v44 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v45 = *(_DWORD *)&v93[4];
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v46 = v45;
      }
      else {
        unsigned int v46 = v45 & 0xFFFFFFFE;
      }
      if (v46)
      {
        int v47 = BWStringFromAudioChannelLayout(&v35->mChannelLayoutTag);
        LODWORD(__s1.mSampleRate) = 136315394;
        *(void *)((char *)&__s1.mSampleRate + 4) = "-[BWAudioSourceNode _updatePullFormatDescription]";
        LOWORD(__s1.mFormatFlags) = 2112;
        *(void *)((char *)&__s1.mFormatFlags + 2) = v47;
        LODWORD(v87) = 22;
        p_s1 = &__s1;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      v3 = (_DWORD *)&unk_1EB4C5000;
    }
    int v48 = *(_DWORD *)(v1 + 540);
    if (v35 && v48 == 2)
    {
      if (!v35->mChannelLayoutTag
        && v35->mNumberChannelDescriptions == 6
        && v35->mChannelDescriptions[0].mChannelLabel == 208
        && v35[1].mChannelLayoutTag == 209
        && LODWORD(v35[1].mChannelDescriptions[0].mCoordinates[0]) == 0x20000
        && v35[2].mNumberChannelDescriptions == 131073
        && LODWORD(v35[2].mChannelDescriptions[0].mCoordinates[2]) == 131074
        && v35[3].mChannelDescriptions[0].mChannelFlags == 131075)
      {
LABEL_136:
        CFAllocatorRef v57 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
        *(_DWORD *)v93 = CMAudioFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &__s2, outDataSize, v35, 0, 0, 0, (CMAudioFormatDescriptionRef *)type);
        free(v35);
        if (*(_DWORD *)v93)
        {
          *(_DWORD *)&v93[4] = 0;
          v88[0] = OS_LOG_TYPE_DEFAULT;
          v79 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v80 = *(_DWORD *)&v93[4];
          if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT)) {
            unsigned int v81 = v80;
          }
          else {
            unsigned int v81 = v80 & 0xFFFFFFFE;
          }
          if (!v81) {
            goto LABEL_170;
          }
          LODWORD(__s1.mSampleRate) = 136316674;
          *(void *)((char *)&__s1.mSampleRate + 4) = "-[BWAudioSourceNode _updatePullFormatDescription]";
          LOWORD(__s1.mFormatFlags) = 1024;
          *(AudioFormatFlags *)((char *)&__s1.mFormatFlags + 2) = *(_DWORD *)v93;
          HIWORD(__s1.mBytesPerPacket) = 1024;
          __s1.mFramesPerPacket = __s2.mFormatID;
          LOWORD(__s1.mBytesPerFrame) = 2048;
          *(Float64 *)((char *)&__s1.mBytesPerFrame + 2) = __s2.mSampleRate;
          HIWORD(__s1.mBitsPerChannel) = 1024;
          __s1.mReserved = __s2.mFormatFlags;
          __int16 v95 = 1024;
          UInt32 mBitsPerChannel = __s2.mChannelsPerFrame;
          __int16 v97 = 1024;
          UInt32 v98 = __s2.mBitsPerChannel;
          goto LABEL_185;
        }
        if (v3[140])
        {
          *(_DWORD *)&v93[4] = 0;
          v88[0] = OS_LOG_TYPE_DEFAULT;
          v58 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v59 = *(_DWORD *)&v93[4];
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT)) {
            unsigned int v60 = v59;
          }
          else {
            unsigned int v60 = v59 & 0xFFFFFFFE;
          }
          if (v60)
          {
            LODWORD(__s1.mSampleRate) = 136315394;
            *(void *)((char *)&__s1.mSampleRate + 4) = "-[BWAudioSourceNode _updatePullFormatDescription]";
            LOWORD(__s1.mFormatFlags) = 2112;
            *(void *)((char *)&__s1.mFormatFlags + 2) = *(void *)type;
            LODWORD(v87) = 22;
            p_s1 = &__s1;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        v61 = *(const void **)(v1 + 248);
        v62 = *(const void **)type;
        *(void *)(v1 + 248) = *(void *)type;
        if (v62) {
          CFRetain(v62);
        }
        if (v61) {
          CFRelease(v61);
        }
        if (*(void *)type) {
          CFRelease(*(CFTypeRef *)type);
        }
        *(void *)v88 = 0;
        if (FigCFEqual())
        {
          *(AudioStreamBasicDescription *)&v93[4] = __s2;
          *(_DWORD *)&v93[32] = 1;
          *(_DWORD *)&v93[16] = __s2.mFormatFlags & 0xFFFFFFDF;
          v63 = (AudioChannelLayout *)malloc_type_calloc(0xCuLL, 1uLL, 0x426530ACuLL);
          v63->mChannelLayoutTag = 6553601;
          OSStatus v64 = CMAudioFormatDescriptionCreate(v57, (const AudioStreamBasicDescription *)&v93[4], 0xCuLL, v63, 0, 0, 0, (CMAudioFormatDescriptionRef *)v88);
          *(_DWORD *)v93 = v64;
          if (v3[140])
          {
            v65 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
            OSStatus v66 = *(_DWORD *)v93;
          }
          else
          {
            OSStatus v66 = v64;
          }
          free(v63);
          if (v66)
          {
            v83 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT);
            goto LABEL_170;
          }
        }
        else
        {
          *(void *)v88 = CFRetain(*(CFTypeRef *)(v1 + 248));
        }
        for (uint64_t i = 0; i != 24; i += 8)
          objc_msgSend(*(id *)(v1 + 96 + i), "setFormat:", +[BWAudioFormat formatWithAudioFormatDescription:](BWAudioFormat, "formatWithAudioFormatDescription:", *(void *)v88, p_s1, v87));
        CFRelease(*(CFTypeRef *)v88);
LABEL_159:
        *(_DWORD *)v93 = -[BWAudioSourceNode _getAudioDevicePullFrames:](v1, &v91);
        if (*(_DWORD *)v93) {
          return *(unsigned int *)v93;
        }
        unsigned int v68 = v91;
        if (v10 != v5)
        {
          unsigned int v68 = vcvtpd_u64_f64(v10 * (double)v91 / v5);
          unsigned int v91 = v68;
        }
        if (v68 != *(_DWORD *)(v1 + 256))
        {
          *(_DWORD *)(v1 + 256) = v68;
          *(_DWORD *)v93 = -[BWAudioSourceNode _generatePullBuffers](v1);
          if (*(_DWORD *)v93) {
            return *(unsigned int *)v93;
          }
        }
        unsigned int v69 = -[BWAudioSourceNode _audioCombinedLatency](v1);
        CMTimeMake(&v99, v69, (int)__s2.mSampleRate);
        *(CMTime *)(v1 + 408) = v99;
        CMTimeMake(&v99, 2, (int)__s2.mSampleRate);
        *(CMTime *)(v1 + 336) = v99;
        if (!v3[140]) {
          return *(unsigned int *)v93;
        }
        *(_DWORD *)&v93[4] = 0;
        type[0] = OS_LOG_TYPE_DEFAULT;
        v70 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v71 = *(_DWORD *)&v93[4];
        if (os_log_type_enabled(v70, type[0])) {
          unsigned int v72 = v71;
        }
        else {
          unsigned int v72 = v71 & 0xFFFFFFFE;
        }
        if (v72)
        {
          AudioFormatFlags v73 = *(_DWORD *)(v1 + 256);
          LODWORD(__s1.mSampleRate) = 136315394;
          *(void *)((char *)&__s1.mSampleRate + 4) = "-[BWAudioSourceNode _updatePullFormatDescription]";
          LOWORD(__s1.mFormatFlags) = 1024;
          *(AudioFormatFlags *)((char *)&__s1.mFormatFlags + 2) = v73;
          _os_log_send_and_compose_impl();
        }
LABEL_170:
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        return *(unsigned int *)v93;
      }
      *(_DWORD *)&v93[4] = 0;
      v88[0] = OS_LOG_TYPE_DEFAULT;
      v49 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v50 = *(_DWORD *)&v93[4];
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v51 = v50;
      }
      else {
        unsigned int v51 = v50 & 0xFFFFFFFE;
      }
      if (v51)
      {
        v52 = BWStringFromAudioChannelLayout(&v35->mChannelLayoutTag);
        LODWORD(__s1.mSampleRate) = 136315394;
        *(void *)((char *)&__s1.mSampleRate + 4) = "-[BWAudioSourceNode _updatePullFormatDescription]";
        LOWORD(__s1.mFormatFlags) = 2112;
        *(void *)((char *)&__s1.mFormatFlags + 2) = v52;
        LODWORD(v87) = 22;
        p_s1 = &__s1;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      int v48 = *(_DWORD *)(v1 + 540);
      v3 = (_DWORD *)&unk_1EB4C5000;
    }
    if (v35 && v48 == 1 && v35->mNumberChannelDescriptions != 2)
    {
      *(_DWORD *)&v93[4] = 0;
      v88[0] = OS_LOG_TYPE_DEFAULT;
      v53 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v54 = *(_DWORD *)&v93[4];
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v55 = v54;
      }
      else {
        unsigned int v55 = v54 & 0xFFFFFFFE;
      }
      if (v55)
      {
        v56 = BWStringFromAudioChannelLayout(&v35->mChannelLayoutTag);
        LODWORD(__s1.mSampleRate) = 136315394;
        *(void *)((char *)&__s1.mSampleRate + 4) = "-[BWAudioSourceNode _updatePullFormatDescription]";
        LOWORD(__s1.mFormatFlags) = 2112;
        *(void *)((char *)&__s1.mFormatFlags + 2) = v56;
        LODWORD(v87) = 22;
        p_s1 = &__s1;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      v3 = &unk_1EB4C5000;
    }
    goto LABEL_136;
  }
  return result;
}

- (uint64_t)_setupAudioUnit
{
  if (!a1) {
    return 0;
  }
  memset(&outData, 0, sizeof(outData));
  memset(&asbd, 0, sizeof(asbd));
  long long v28 = 0;
  uint64_t v29 = 0;
  objc_super v2 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  OSType v3 = *(_DWORD *)(a1 + 272);
  inDesc.componentType = 1635086197;
  inDesc.componentSubType = v3;
  *(void *)&inDesc.componentManufacturer = 1634758764;
  inDesc.componentFlagsMask = 0;
  AudioComponent Next = AudioComponentFindNext(0, &inDesc);
  if (Next)
  {
    double v5 = Next;
    double v6 = *(OpaqueAudioComponentInstance **)(a1 + 264);
    if (v6)
    {
      AudioUnitUninitialize(v6);
      AudioComponentInstanceDispose(*(AudioComponentInstance *)(a1 + 264));
      *(void *)(a1 + 264) = 0;
    }
    uint64_t Property = AudioComponentInstanceNew(v5, (AudioComponentInstance *)(a1 + 264));
    if (Property) {
      goto LABEL_41;
    }
    uint64_t Property = AudioUnitSetProperty(*(AudioUnit *)(a1 + 264), 0x7D9u, 0, 0, (const void *)(a1 + 184), 0x20u);
    if (Property) {
      goto LABEL_41;
    }
    if (*(_DWORD *)(a1 + 216))
    {
      long long v8 = *(void **)(a1 + 128);
      if (v8)
      {
        int PrimaryAudioSessionIDForAuditToken = [v8 opaqueSessionID];
LABEL_14:
        int inData = PrimaryAudioSessionIDForAuditToken;
        AudioUnitSetProperty(*(AudioUnit *)(a1 + 264), 0x7E7u, 0, 0, &inData, 4u);
        goto LABEL_15;
      }
      if (*(unsigned char *)(a1 + 172))
      {
        int PrimaryAudioSessionIDForAuditToken = AudioSessionGetPrimaryAudioSessionIDForAuditToken();
        goto LABEL_14;
      }
    }
LABEL_15:
    int v25 = 1;
    uint64_t Property = AudioUnitSetProperty(*(AudioUnit *)(a1 + 264), 0x7D3u, 1u, 1u, &v25, 4u);
    if (Property
      || (int v25 = 0, Property = AudioUnitSetProperty(*(AudioUnit *)(a1 + 264), 0x7D3u, 2u, 0, &v25, 4u), Property)
      || (UInt32 ioDataSize = 40,
          uint64_t Property = AudioUnitGetProperty(*(AudioUnit *)(a1 + 264), 8u, 1u, 1u, &outData, &ioDataSize),
          Property))
    {
LABEL_41:
      uint64_t v21 = Property;
      goto LABEL_42;
    }
    AudioStreamBasicDescription asbd = outData;
    asbd.AudioFormatFlags mFormatFlags = 12;
    if (outData.mFormatFlags)
    {
      asbd.UInt32 mBitsPerChannel = 16;
      UInt32 v10 = 2;
    }
    else
    {
      UInt32 v10 = asbd.mBitsPerChannel >> 3;
    }
    asbd.UInt32 mBytesPerFrame = v10 * asbd.mChannelsPerFrame;
    asbd.uint64_t mBytesPerPacket = v10 * asbd.mChannelsPerFrame;
    double v11 = *(void **)(a1 + 128);
    if (v11)
    {
      if (!*(unsigned char *)(a1 + 173))
      {
        [v11 sampleRate];
        asbd.mSampleRate = v12;
        goto LABEL_34;
      }
LABEL_26:
      double v13 = fmax(*(double *)(a1 + 176), 0.0);
      if (*(unsigned char *)(a1 + 169)) {
        double v13 = 48000.0;
      }
      if (v13 == 0.0) {
        double v13 = 44100.0;
      }
      asbd.mSampleRate = v13;
      if (v11)
      {
        id v14 = +[FigWeakReference weakReferenceToObject:a1];
        BOOL v15 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
        uint64_t v16 = *MEMORY[0x1E4F4E9B8];
        uint64_t v17 = *(void *)(a1 + 128);
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __36__BWAudioSourceNode__setupAudioUnit__block_invoke;
        v23[3] = &unk_1E5C247D8;
        v23[4] = v14;
        [v15 addObserverForName:v16 object:v17 queue:0 usingBlock:v23];
      }
      else
      {
        CMNotificationCenterGetDefaultLocalCenter();
        FigNotificationCenterAddWeakListener();
      }
      goto LABEL_34;
    }
    if (*(void *)(a1 + 144))
    {
      if (*(unsigned char *)(a1 + 173)) {
        goto LABEL_26;
      }
      CMTime v18 = -[BWAudioSourceNode _copyAudioSessionMXProperty:err:]((id *)a1, *MEMORY[0x1E4F76048], 0);
      asbd.mSampleRate = (double)[v18 longLongValue];
    }
LABEL_34:
    uint64_t Property = AudioUnitSetProperty(*(AudioUnit *)(a1 + 264), 8u, 2u, 1u, &asbd, 0x28u);
    if (!Property)
    {
      unsigned int v19 = *(const void **)(a1 + 248);
      if (v19)
      {
        CFRelease(v19);
        *(void *)(a1 + 248) = 0;
      }
      uint64_t Property = CMAudioFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &asbd, 0, 0, 0, 0, 0, (CMAudioFormatDescriptionRef *)(a1 + 248));
      if (!Property)
      {
        for (uint64_t i = 0; i != 24; i += 8)
          objc_msgSend(*(id *)(a1 + 96 + i), "setFormat:", +[BWAudioFormat formatWithAudioFormatDescription:](BWAudioFormat, "formatWithAudioFormatDescription:", *(void *)(a1 + 248)));
        long long v28 = asn_audioUnitRenderProc;
        uint64_t v29 = a1;
        uint64_t Property = AudioUnitSetProperty(*(AudioUnit *)(a1 + 264), 0x7D5u, 0, 0, &v28, 0x10u);
      }
    }
    goto LABEL_41;
  }
  uint64_t v21 = 4294954514;
LABEL_42:
  if (*v2 == 1) {
    kdebug_trace();
  }
  return v21;
}

- (void)updateWithAudioSession:(id)a3 clientAuditToken:(id *)a4
{
  if (!self->_streamStarted)
  {
    long long v6 = *(_OWORD *)&a4->var0[4];
    *(_OWORD *)self->_clientAuditToken.val = *(_OWORD *)a4->var0;
    *(_OWORD *)&self->_clientAuditToken.val[4] = v6;
    long long v7 = *(_OWORD *)&a4->var0[4];
    v9[0] = *(_OWORD *)a4->var0;
    v9[1] = v7;
    self->_clientPID = FigCaptureGetPIDFromAuditToken(v9);

    self->_audioSession = (AVAudioSession *)a3;
    self->_audioSessionIsProxy = 0;
    *(void *)&v9[0] = 0;
    if (FigAudioSessionClockCreateForAVAudioSession()) {
      goto LABEL_7;
    }
    clock = self->_clock;
    if (clock) {
      CFRelease(clock);
    }
    self->_clock = *(OpaqueCMClock **)&v9[0];
    if (-[BWAudioSourceNode _setupAudioUnit]((uint64_t)self)) {
LABEL_7:
    }
      FigDebugAssert3();
  }
}

- (uint64_t)_getAudioDevicePullFrames:(uint64_t)a1
{
  uint64_t v2 = a1;
  if (a1)
  {
    int outData = 0;
    if (FigCaptureAudiomxdSupportEnabled())
    {
      if (a2)
      {
        int v4 = [*(id *)(v2 + 128) IOBufferFrameSize];
        uint64_t v2 = 0;
        *a2 = v4;
        return v2;
      }
    }
    else
    {
      AudioObjectID v5 = *(_DWORD *)(v2 + 240);
      if (v5)
      {
        *(void *)&inAddress.mSelector = 0x676C6F627666737ALL;
        inAddress.mElement = 0;
        UInt32 ioDataSize = 4;
        if (AudioObjectGetPropertyData(v5, &inAddress, 0, 0, &ioDataSize, &outData))
        {
          inAddress.mSelector = 1718839674;
          UInt32 ioDataSize = 4;
          uint64_t PropertyData = AudioObjectGetPropertyData(*(_DWORD *)(v2 + 240), &inAddress, 0, 0, &ioDataSize, &outData);
          if (PropertyData)
          {
            uint64_t v2 = PropertyData;
            FigDebugAssert3();
            return v2;
          }
        }
        if (a2)
        {
          uint64_t v2 = 0;
          *a2 = outData;
          return v2;
        }
      }
    }
    return 0;
  }
  return v2;
}

- (uint64_t)_audioCombinedLatency
{
  if (result)
  {
    uint64_t v1 = result;
    AudioObjectID outData = 0;
    int v5 = 0;
    int v6 = 0;
    if (FigCaptureAudiomxdSupportEnabled())
    {
      [*(id *)(v1 + 128) sampleRate];
      double v3 = v2;
      [*(id *)(v1 + 128) inputLatency];
      return (v3 * v4 + 0.5);
    }
    result = *(unsigned int *)(v1 + 240);
    if (result)
    {
      *(void *)&inAddress.mSelector = 0x696E707473746D23;
      inAddress.mElement = 0;
      UInt32 ioDataSize = 4;
      if (AudioObjectGetPropertyData(result, &inAddress, 0, 0, &ioDataSize, &outData)
        || (*(void *)&inAddress.mSelector = 0x676C6F626C746E63,
            inAddress.mElement = 0,
            UInt32 ioDataSize = 4,
            !AudioObjectGetPropertyData(outData, &inAddress, 0, 0, &ioDataSize, &v6)))
      {
        *(void *)&inAddress.mSelector = 0x696E70746C746E63;
        inAddress.mElement = 0;
        UInt32 ioDataSize = 4;
        if (!AudioObjectGetPropertyData(*(_DWORD *)(v1 + 240), &inAddress, 0, 0, &ioDataSize, &v5)) {
          return (v5 + v6);
        }
        FigDebugAssert3();
      }
      return 0;
    }
  }
  return result;
}

- (BOOL)start:(id *)a3
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  int v6 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  char v89 = 0;
  BOOL streamStarted = self->_streamStarted;
  if (self->_streamStarted) {
    goto LABEL_4;
  }
  unsigned int v80 = a3;
  AudioDeviceID deviceIDOut = 0;
  if (CMAudioDeviceClockGetAudioDevice(self->_clock, 0, &deviceIDOut, 0)) {
    self->_audioDeviceID = deviceIDOut;
  }
  if (FigCaptureAudiomxdSupportEnabled() && self->_audioSessionIsProxy)
  {
    LODWORD(v87) = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    int v47 = 1;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    signed int v21 = -12782;
    goto LABEL_102;
  }
  int v9 = FigCaptureAudiomxdSupportEnabled();
  int v10 = v9;
  audioSession = self->_audioSession;
  if (!self->_configuresSession)
  {
    if (audioSession)
    {
      if (!dword_1EB4C5230) {
        goto LABEL_25;
      }
    }
    else
    {
      if (self->_CMSession) {
        BOOL v12 = dword_1EB4C5230 == 0;
      }
      else {
        BOOL v12 = 1;
      }
      if (v12) {
        goto LABEL_25;
      }
    }
    int v13 = v9;
    LODWORD(v87) = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    id v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    int v10 = v13;
    goto LABEL_25;
  }
  if (audioSession)
  {
    -[BWAudioSourceNode _setAudioSessionAudioModeAndSelectMic:]((uint64_t)self, &v89);
  }
  else if (self->_CMSession)
  {
    -[BWAudioSourceNode _setCMSessionAudioModeAndSelectMic:]((uint64_t)self, &v89);
  }
LABEL_25:
  if (!self->_audioSession && !self->_CMSession) {
    goto LABEL_51;
  }
  clientAudioClockDeviceUID = self->_clientAudioClockDeviceUID;
  if (clientAudioClockDeviceUID) {
    -[BWAudioSourceNode _setAudioSessionMXPropertyWithKey:value:]((uint64_t)self, *MEMORY[0x1E4F75EE0], (uint64_t)clientAudioClockDeviceUID);
  }
  char v16 = -[BWAudioSourceNode _audioSessionMXBooleanPropertyIsTrue:]((uint64_t)self, *MEMORY[0x1E4F76258]);
  uint64_t v17 = self->_audioSession;
  if ((v16 & 1) == 0)
  {
    if (v17)
    {
      if (dword_1EB4C5230)
      {
        LODWORD(v87) = 0;
        type[0] = OS_LOG_TYPE_DEFAULT;
        unsigned int v19 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        uint64_t v17 = self->_audioSession;
      }
      id v87 = 0;
      -[AVAudioSession setActive:error:](v17, "setActive:error:", 1, &v87, p_pts, v79);
      signed int v21 = [v87 code];
      if (!v21 && !self->_isConfiguredForContinuityCapture)
      {
        v91[0] = @"camera wind suppression";
        uint64_t v22 = [NSNumber numberWithUnsignedInt:self->_windNoiseRemovalEnabled];
        v91[1] = @"camera real time dynamics";
        v92[0] = v22;
        v92[1] = [NSNumber numberWithUnsignedInt:!self->_cinematicVideoCaptureEnabled];
        unsigned int v23 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v92 forKeys:v91 count:2];
        if ([v23 count])
        {
          if (dword_1EB4C5230)
          {
            *(_DWORD *)os_log_type_t type = 0;
            os_log_type_t v85 = OS_LOG_TYPE_DEFAULT;
            id v24 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          signed int v45 = -[BWAudioSourceNode _setAudioSessionMXPropertyWithKey:value:]((uint64_t)self, *MEMORY[0x1E4F75F60], (uint64_t)v23);
          if (v45)
          {
            signed int v46 = v45;
            uint64_t v79 = v3;
            LODWORD(p_pts) = v45;
            FigDebugAssert3();
            int v47 = 1;
            signed int v21 = v46;
            goto LABEL_102;
          }
        }
      }
    }
    else
    {
      if (!self->_CMSession)
      {
LABEL_49:
        self->_didBeginInterruption = 1;
        self->_streamInterrupted = 0;
        goto LABEL_50;
      }
      if (dword_1EB4C5230)
      {
        LODWORD(v87) = 0;
        type[0] = OS_LOG_TYPE_DEFAULT;
        unsigned int v20 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      signed int v21 = CMSessionBeginInterruption();
    }
    if (v21)
    {
      LODWORD(v87) = 0;
      type[0] = OS_LOG_TYPE_DEFAULT;
      v52 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v53 = v87;
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v54 = v53;
      }
      else {
        unsigned int v54 = v53 & 0xFFFFFFFE;
      }
      if (v54)
      {
        LODWORD(pts.value) = 136315394;
        *(CMTimeValue *)((char *)&pts.value + 4) = (CMTimeValue)"-[BWAudioSourceNode start:]";
        LOWORD(pts.flags) = 1024;
        *(CMTimeFlags *)((char *)&pts.flags + 2) = v21;
        LODWORD(v79) = 18;
        p_CMTime pts = &pts;
        _os_log_send_and_compose_impl();
      }
      int v47 = 1;
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      goto LABEL_102;
    }
    goto LABEL_49;
  }
  if (v17)
  {
    if (!dword_1EB4C5230) {
      goto LABEL_50;
    }
    goto LABEL_32;
  }
  if (self->_CMSession && dword_1EB4C5230)
  {
LABEL_32:
    LODWORD(v87) = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    CMTime v18 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
LABEL_50:
  -[BWAudioSourceNode _setAudioSessionMXPropertyWithKey:value:]((uint64_t)self, *MEMORY[0x1E4F76120], MEMORY[0x1E4F1CC28]);
  if ((FigCaptureAudiomxdSupportEnabled() & 1) == 0)
  {
    int v26 = -[BWAudioSourceNode _cmSessionBooleanPropertyIsTrue:]((uint64_t)self);
    if (v26) {
      CFStringRef v25 = @"VirtualAudioDevice_DecoupledInput";
    }
    else {
      CFStringRef v25 = @"VirtualAudioDevice_Default";
    }
    if ((v26 & 1) == 0 && ((v10 ^ 1) & 1) == 0) {
      goto LABEL_59;
    }
    goto LABEL_58;
  }
LABEL_51:
  if ((v10 & 1) == 0)
  {
    CFStringRef v25 = @"VirtualAudioDevice_Default";
LABEL_58:
    -[BWAudioSourceNode _updateAudioDeviceUID:]((uint64_t)self, v25);
  }
LABEL_59:
  signed int updated = -[BWAudioSourceNode _updatePullFormatDescription]((uint64_t)self);
  if (updated)
  {
    signed int v21 = updated;
    int v47 = 1;
    goto LABEL_102;
  }
  generateSamplesDispatchQueue = self->_generateSamplesDispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__BWAudioSourceNode_start___block_invoke;
  block[3] = &unk_1E5C24430;
  block[4] = self;
  dispatch_async(generateSamplesDispatchQueue, block);
  self->_auRenderCount = 0;
  self->_silenceFramesGeneratedSinceLastAURenderProc = 0;
  self->_currentSilenceBuffer.sampleTime = 0.0;
  *(_OWORD *)&self->_currentSilenceBuffer.pts.timescale = 0u;
  *(_OWORD *)&self->_currentSilenceBuffer.abl = 0u;
  *(_OWORD *)&self->_currentSilenceBuffer.allocator = 0u;
  *(_OWORD *)&self->_currentSilenceBuffer.dataBytesCapacity = 0u;
  TimestampedAudioBufferListQueueTransfer(self->_activeBuffersQueue, self->_inactiveBuffersQueue);
  if ((self->_audioSession || self->_CMSession) && !self->_isAppAudioSession)
  {
    signed int v29 = -[BWAudioSourceNode _setAudioSessionMXPropertyWithKey:value:]((uint64_t)self, *MEMORY[0x1E4F762D8], MEMORY[0x1E4F1CC38]);
    if (v29)
    {
      signed int v21 = v29;
      LODWORD(v87) = 0;
      type[0] = OS_LOG_TYPE_DEFAULT;
      unsigned int v55 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v56 = v87;
      if (os_log_type_enabled(v55, type[0])) {
        unsigned int v57 = v56;
      }
      else {
        unsigned int v57 = v56 & 0xFFFFFFFE;
      }
      if (!v57) {
        goto LABEL_101;
      }
      goto LABEL_75;
    }
    signed int v30 = -[BWAudioSourceNode _setAudioSessionMXPropertyWithKey:value:]((uint64_t)self, *MEMORY[0x1E4F762E8], MEMORY[0x1E4F1CC38]);
    if (v30)
    {
      signed int v21 = v30;
      LODWORD(v87) = 0;
      type[0] = OS_LOG_TYPE_DEFAULT;
      v58 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v59 = v87;
      if (os_log_type_enabled(v58, type[0])) {
        unsigned int v60 = v59;
      }
      else {
        unsigned int v60 = v59 & 0xFFFFFFFE;
      }
      if (!v60) {
        goto LABEL_101;
      }
      goto LABEL_75;
    }
  }
  uint64_t v31 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_generateSamplesDispatchQueue);
  self->_silenceTimer = v31;
  if (v31)
  {
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __27__BWAudioSourceNode_start___block_invoke_26;
    handler[3] = &unk_1E5C24430;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v31, handler);
    StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(self->_auOutputFormatDescription);
    uint64_t v33 = mach_absolute_time();
    int64_t v34 = AudioConvertHostTimeToNanos(v33);
    CMTimeMake(&time, v34, 1000000000);
    CMClockRef HostTimeClock = CMClockGetHostTimeClock();
    CMSyncConvertTime(&v93, &time, HostTimeClock, self->_clock);
    self->_currentSilenceBuffer.CMTime pts = ($95D729B680665BEAEFA1D6FCA8238556)v93;
    int32_t mSampleRate = (int)StreamBasicDescription->mSampleRate;
    CMTime pts = (CMTime)self->_currentSilenceBuffer.pts;
    CMTimeConvertScale(&v93, &pts, mSampleRate, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
    self->_currentSilenceBuffer.CMTime pts = ($95D729B680665BEAEFA1D6FCA8238556)v93;
    silenceTimer = self->_silenceTimer;
    dispatch_time_t v38 = dispatch_time(0, 2000000000);
    dispatch_source_set_timer(silenceTimer, v38, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume((dispatch_object_t)self->_silenceTimer);
    OSStatus v39 = AudioOutputUnitStart(self->_audioUnit);
    if (!v39)
    {
      self->_BOOL streamStarted = 1;
      zoomHandlerQueue = self->_zoomHandlerQueue;
      v81[0] = MEMORY[0x1E4F143A8];
      v81[1] = 3221225472;
      v81[2] = __27__BWAudioSourceNode_start___block_invoke_27;
      v81[3] = &unk_1E5C24430;
      v81[4] = self;
      dispatch_sync(zoomHandlerQueue, v81);
      BOOL streamStarted = 1;
      int v6 = (_DWORD *)MEMORY[0x1E4F1EBA8];
      goto LABEL_5;
    }
    signed int v21 = v39;
    if ((self->_audioSession || self->_CMSession) && !self->_isAppAudioSession)
    {
      uint64_t v40 = MEMORY[0x1E4F1CC28];
      -[BWAudioSourceNode _setAudioSessionMXPropertyWithKey:value:]((uint64_t)self, *MEMORY[0x1E4F762D8], MEMORY[0x1E4F1CC28]);
      -[BWAudioSourceNode _setAudioSessionMXPropertyWithKey:value:]((uint64_t)self, *MEMORY[0x1E4F762E8], v40);
    }
    LODWORD(v87) = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    uint64_t v41 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v42 = v87;
    if (os_log_type_enabled(v41, type[0])) {
      unsigned int v43 = v42;
    }
    else {
      unsigned int v43 = v42 & 0xFFFFFFFE;
    }
    if (!v43) {
      goto LABEL_101;
    }
LABEL_75:
    LODWORD(pts.value) = 136315394;
    *(CMTimeValue *)((char *)&pts.value + 4) = (CMTimeValue)"-[BWAudioSourceNode start:]";
    LOWORD(pts.flags) = 1024;
    *(CMTimeFlags *)((char *)&pts.flags + 2) = v21;
    LODWORD(v79) = 18;
    p_CMTime pts = &pts;
    _os_log_send_and_compose_impl();
LABEL_101:
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    int v47 = 0;
    goto LABEL_102;
  }
  LODWORD(v87) = 0;
  type[0] = OS_LOG_TYPE_DEFAULT;
  int v48 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  unsigned int v49 = v87;
  if (os_log_type_enabled(v48, type[0])) {
    unsigned int v50 = v49;
  }
  else {
    unsigned int v50 = v49 & 0xFFFFFFFE;
  }
  if (v50)
  {
    LODWORD(pts.value) = 136315138;
    *(CMTimeValue *)((char *)&pts.value + 4) = (CMTimeValue)"-[BWAudioSourceNode start:]";
    LODWORD(v79) = 12;
    p_CMTime pts = &pts;
    _os_log_send_and_compose_impl();
  }
  fig_log_call_emit_and_clean_up_after_send_and_compose();
  int v47 = 0;
  signed int v21 = -12780;
LABEL_102:
  AudioUnitUninitialize(self->_audioUnit);
  if (self->_didBeginInterruption)
  {
    self->_didBeginInterruption = 0;
    v61 = self->_audioSession;
    if (v61)
    {
      id v87 = 0;
      [(AVAudioSession *)v61 setActive:0 error:&v87];
      if (!v87) {
        goto LABEL_134;
      }
      AudioDeviceID deviceIDOut = 0;
      type[0] = OS_LOG_TYPE_DEFAULT;
      v62 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      AudioDeviceID v63 = deviceIDOut;
      if (os_log_type_enabled(v62, type[0])) {
        unsigned int v64 = v63;
      }
      else {
        unsigned int v64 = v63 & 0xFFFFFFFE;
      }
      if (!v64) {
        goto LABEL_133;
      }
      goto LABEL_117;
    }
    if (self->_CMSession)
    {
      LODWORD(v87) = 0;
      LOBYTE(deviceIDOut) = 0;
      unsigned int v69 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v70 = v87;
      if (os_log_type_enabled(v69, (os_log_type_t)deviceIDOut)) {
        unsigned int v71 = v70;
      }
      else {
        unsigned int v71 = v70 & 0xFFFFFFFE;
      }
      if (v71)
      {
        CMSession = self->_CMSession;
        LODWORD(pts.value) = 136315394;
        *(CMTimeValue *)((char *)&pts.value + 4) = (CMTimeValue)"-[BWAudioSourceNode start:]";
        LOWORD(pts.flags) = 2048;
        *(void *)((char *)&pts.flags + 2) = CMSession;
        LODWORD(v79) = 22;
        p_CMTime pts = &pts;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      CMTimeFlags v73 = CMSessionEndInterruption();
      if (v73)
      {
        CMTimeFlags v74 = v73;
        LODWORD(v87) = 0;
        LOBYTE(deviceIDOut) = 0;
        unsigned int v75 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v76 = v87;
        if (os_log_type_enabled(v75, (os_log_type_t)deviceIDOut)) {
          unsigned int v77 = v76;
        }
        else {
          unsigned int v77 = v76 & 0xFFFFFFFE;
        }
        if (v77)
        {
          LODWORD(pts.value) = 136315394;
          *(CMTimeValue *)((char *)&pts.value + 4) = (CMTimeValue)"-[BWAudioSourceNode start:]";
          LOWORD(pts.flags) = 1024;
          *(CMTimeFlags *)((char *)&pts.flags + 2) = v74;
          LODWORD(v79) = 18;
          p_CMTime pts = &pts;
          _os_log_send_and_compose_impl();
        }
        goto LABEL_133;
      }
    }
  }
  else
  {
    if (!v89) {
      goto LABEL_134;
    }
    -[BWAudioSourceNode _setAudioSessionMXPropertyWithKey:value:]((uint64_t)self, *MEMORY[0x1E4F76118], MEMORY[0x1E4F1CC28]);
    v65 = self->_audioSession;
    if (v65)
    {
      id v87 = 0;
      [(AVAudioSession *)v65 setActive:0 error:&v87];
      if (!v87) {
        goto LABEL_134;
      }
      AudioDeviceID deviceIDOut = 0;
      type[0] = OS_LOG_TYPE_DEFAULT;
      OSStatus v66 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      AudioDeviceID v67 = deviceIDOut;
      if (os_log_type_enabled(v66, type[0])) {
        unsigned int v68 = v67;
      }
      else {
        unsigned int v68 = v67 & 0xFFFFFFFE;
      }
      if (!v68) {
        goto LABEL_133;
      }
LABEL_117:
      LODWORD(pts.value) = 136315394;
      *(CMTimeValue *)((char *)&pts.value + 4) = (CMTimeValue)"-[BWAudioSourceNode start:]";
      LOWORD(pts.flags) = 2112;
      *(void *)((char *)&pts.flags + 2) = v87;
      LODWORD(v79) = 22;
      p_CMTime pts = &pts;
      _os_log_send_and_compose_impl();
LABEL_133:
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      goto LABEL_134;
    }
    if (self->_CMSession) {
      CMSessionEndInterruption();
    }
  }
LABEL_134:
  if (v80)
  {
    *unsigned int v80 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v21 userInfo:0];
    int v6 = (_DWORD *)MEMORY[0x1E4F1EBA8];
    if ((v47 & 1) == 0) {
      goto LABEL_138;
    }
LABEL_4:
    [(BWAudioSourceNode *)self makeOutputsLiveIfNeeded];
    goto LABEL_5;
  }
  int v6 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (v47) {
    goto LABEL_4;
  }
LABEL_138:
  BOOL streamStarted = 0;
LABEL_5:
  if (*v6 == 1) {
    kdebug_trace();
  }
  return streamStarted;
}

- (uint64_t)_setAudioSessionAudioModeAndSelectMic:(uint64_t)a1
{
  if (a1)
  {
    if (*(void *)(a1 + 128))
    {
      -[BWAudioSourceNode _updateMXSessionAudioMode](a1);
      double v4 = fmax(*(double *)(a1 + 176), 0.0);
      if (*(unsigned char *)(a1 + 169)) {
        double v4 = 48000.0;
      }
      if (v4 == 0.0) {
        double v4 = 44100.0;
      }
      -[BWAudioSourceNode _configureAudioSessionWithDefaultHardwareSampleRate:didCallDoNotNotifyOtherSessionsOnNextInactive:](a1, a2, v4);
    }
    -[BWAudioSourceNode _selectMicForCurrentAudioRoute](a1);
  }
  return 0;
}

- (void)_updateMXSessionAudioMode
{
  if (a1)
  {
    int v1 = *(_DWORD *)(a1 + 540);
    if (v1 == 6)
    {
      double v2 = (const void **)MEMORY[0x1E4F75AE8];
    }
    else if (*(unsigned char *)(a1 + 536))
    {
      double v2 = (const void **)MEMORY[0x1E4F75AB0];
    }
    else if (v1 == 2)
    {
      double v2 = (const void **)MEMORY[0x1E4F75B50];
    }
    else if (v1 == 1)
    {
      double v2 = (const void **)MEMORY[0x1E4F75B58];
    }
    else if (*(unsigned char *)(a1 + 546))
    {
      double v2 = (const void **)MEMORY[0x1E4F75BB0];
    }
    else if ((v1 - 3) >= 2)
    {
      if (v1 == 5) {
        double v2 = (const void **)MEMORY[0x1E4F75BF8];
      }
      else {
        double v2 = (const void **)MEMORY[0x1E4F75A58];
      }
    }
    else
    {
      double v2 = (const void **)MEMORY[0x1E4F75BE8];
    }
    uint64_t v3 = *v2;
    double v4 = *(const void **)(a1 + 136);
    *(void *)(a1 + 136) = v3;
    if (v3) {
      CFRetain(v3);
    }
    if (v4)
    {
      CFRelease(v4);
    }
  }
}

- (uint64_t)_selectMicForCurrentAudioRoute
{
  if (!result) {
    return result;
  }
  uint64_t v1 = result;
  double v2 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  unsigned int v16 = 0;
  uint64_t v3 = (void *)[*(id *)(v1 + 128) availableInputs];
  if ([v3 count])
  {
    double v4 = (void *)[v3 objectAtIndexedSubscript:0];
    int v5 = (void *)[v4 portType];
    int v6 = [v5 isEqualToString:*MEMORY[0x1E4F4E948]];
    if (v4 && v6 != 0)
    {
      if (FigCFEqual() || FigCFEqual() || FigCFEqual())
      {
        long long v8 = -[BWAudioSourceNode _copyAudioSessionMXProperty:err:]((id *)v1, *MEMORY[0x1E4F765E0], &v16);
        uint64_t v9 = objc_msgSend(v8, "bw_builtInMicRouteDictionary");
        if (v9)
        {
          int v10 = (void *)v9;
          if (*(void *)(v1 + 112))
          {
            if ([(id)v1 isAudioPlayingToBuiltinSpeaker]) {
              uint64_t v11 = 1651799149;
            }
            else {
              uint64_t v11 = 1718775412;
            }
LABEL_19:
            BOOL v12 = objc_msgSend(v10, "bw_dataSourceDictionaryForDesiredMicOrientation:", v11);
            if (v12)
            {
              int v13 = v12;
              uint64_t v14 = objc_msgSend(v12, "bw_optimalMicPolarPattern");
              uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1C978], "bw_selectedInputsArrayForBuiltInMicRouteDictionary:dataSource:polarPattern:", v10, v13, v14);
              if (v15)
              {
                unsigned int v16 = -[BWAudioSourceNode _setAudioSessionMXPropertyWithKey:value:](v1, *MEMORY[0x1E4F76468], v15);
                if (v16) {
                  FigDebugAssert3();
                }
              }
              else
              {
                FigDebugAssert3();
                unsigned int v16 = -12783;
              }
            }
            goto LABEL_23;
          }
          if (*(void *)(v1 + 104))
          {
            uint64_t v11 = 1650549611;
            goto LABEL_19;
          }
        }
LABEL_23:
        if (v8) {
          CFRelease(v8);
        }
        goto LABEL_25;
      }
      -[BWAudioSourceNode _setAudioSessionMXPropertyWithKey:value:](v1, *MEMORY[0x1E4F76468], 0);
    }
  }
LABEL_25:
  if (*v2 == 1) {
    kdebug_trace();
  }
  return v16;
}

- (uint64_t)_audioSessionMXBooleanPropertyIsTrue:(uint64_t)result
{
  if (result)
  {
    double v2 = *(void **)(result + 128);
    if (v2)
    {
      uint64_t v3 = 0;
      return objc_msgSend((id)objc_msgSend(v2, "getMXSessionProperty:error:", a2, &v3), "BOOLValue");
    }
    else if (*(void *)(result + 144))
    {
      return -[BWAudioSourceNode _cmSessionBooleanPropertyIsTrue:](result);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (BOOL)hasNonLiveConfigurationChanges
{
  return 0;
}

- (uint64_t)_setCMSessionAudioModeAndSelectMic:(uint64_t)a1
{
  if (a1 && *(void *)(a1 + 144))
  {
    -[BWAudioSourceNode _updateMXSessionAudioMode](a1);
    double v4 = fmax(*(double *)(a1 + 176), 0.0);
    if (*(unsigned char *)(a1 + 169)) {
      double v4 = 48000.0;
    }
    if (v4 == 0.0) {
      double v4 = 44100.0;
    }
    -[BWAudioSourceNode _configureCMSessionWithDefaultHardwareSampleRate:didCallDoNotNotifyOtherSessionsOnNextInactive:](a1, a2, v4);
    CMSessionCopyProperty();
  }
  return 0;
}

- (uint64_t)_cmSessionBooleanPropertyIsTrue:(uint64_t)a1
{
  if (a1 && *(void *)(a1 + 144)) {
    CMSessionCopyProperty();
  }
  return 0;
}

- (uint64_t)_updateAudioDeviceUID:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    result = CMAudioDeviceClockSetAudioDeviceUID(*(CMClockRef *)(result + 232), a2);
    if (!result)
    {
      AudioDeviceID deviceIDOut = 0;
      result = CMAudioDeviceClockGetAudioDevice(*(CMClockRef *)(v2 + 232), 0, &deviceIDOut, 0);
      if (!result) {
        *(_DWORD *)(v2 + 240) = deviceIDOut;
      }
    }
  }
  return result;
}

void __27__BWAudioSourceNode_start___block_invoke_26(uint64_t a1)
{
}

- (void)_generateSilenceIfNeeded
{
  if (a1 && !*(unsigned char *)(a1 + 600) && *(unsigned char *)(a1 + 400) && !*(unsigned char *)(a1 + 402))
  {
    uint64_t v2 = (void *)MEMORY[0x1A6272C70]();
    if (*(void *)(a1 + 464) == atomic_fetch_add((atomic_ullong *volatile)(a1 + 440), 0))
    {
      context = v2;
      StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(*(CMAudioFormatDescriptionRef *)(a1 + 248));
      memset(&v23, 0, sizeof(v23));
      CMTimeMake(&v23, *(unsigned int *)(a1 + 256), (int)StreamBasicDescription->mSampleRate);
      memset(&v22, 0, sizeof(v22));
      uint64_t v4 = mach_absolute_time();
      int64_t v5 = AudioConvertHostTimeToNanos(v4);
      CMTimeMake(&time, v5, 1000000000);
      CMClockRef HostTimeClock = CMClockGetHostTimeClock();
      CMSyncConvertTime(&v22, &time, HostTimeClock, *(CMClockOrTimebaseRef *)(a1 + 232));
      int32_t mSampleRate = (int)StreamBasicDescription->mSampleRate;
      CMTime lhs = v22;
      CMTimeConvertScale(&v20, &lhs, mSampleRate, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
      CMTime v22 = v20;
      CMTime lhs = v20;
      CMTime rhs = v23;
      CMTimeSubtract(&v20, &lhs, &rhs);
      CMTime v22 = v20;
      memset(&v20, 0, sizeof(v20));
      CMTime lhs = *(CMTime *)(a1 + 480);
      CMTime rhs = v23;
      CMTimeAdd(&v20, &lhs, &rhs);
      CMTime lhs = v20;
      CMTime rhs = v22;
      if (CMTimeCompare(&lhs, &rhs) <= 0)
      {
        while (1)
        {
          *(_DWORD *)(a1 + 512) = *(_DWORD *)(a1 + 256);
          if ((StreamBasicDescription->mFormatFlags & 0x20) != 0 && *(_DWORD *)(a1 + 540) == 6) {
            break;
          }
          uint64_t v11 = -[BWAudioSourceNode _createSampleBufferForTimestampedAudioBufferList:audioBufferIndex:]((CMSampleBufferRef)a1, a1 + 456, 0);
          [*(id *)(a1 + 16) emitSampleBuffer:v11];
          CMItemCount NumSamples = CMSampleBufferGetNumSamples(v11);
          if (v11) {
            CFRelease(v11);
          }
LABEL_20:
          *(void *)(a1 + 448) += NumSamples;
          memset(&lhs, 0, sizeof(lhs));
          CMTimeMake(&lhs, *(unsigned int *)(a1 + 512), (int)StreamBasicDescription->mSampleRate);
          CMTime v17 = *(CMTime *)(a1 + 480);
          CMTime v16 = lhs;
          CMTimeAdd(&rhs, &v17, &v16);
          *(CMTime *)(a1 + 480) = rhs;
          CMTime v17 = *(CMTime *)(a1 + 480);
          CMTime v16 = v23;
          CMTimeAdd(&rhs, &v17, &v16);
          CMTime v20 = rhs;
          CMTime lhs = rhs;
          CMTime rhs = v22;
          if (CMTimeCompare(&lhs, &rhs) >= 1) {
            goto LABEL_21;
          }
        }
        uint64_t v8 = 0;
        CMItemCount NumSamples = 0;
        while (1)
        {
          if (*(void *)(a1 + 96 + 8 * v8))
          {
            int v10 = -[BWAudioSourceNode _createSampleBufferForTimestampedAudioBufferList:audioBufferIndex:]((CMSampleBufferRef)a1, a1 + 456, v8);
            [*(id *)(a1 + 96 + 8 * v8) emitSampleBuffer:v10];
            if (!NumSamples)
            {
              CMItemCount NumSamples = CMSampleBufferGetNumSamples(v10);
              if (!v10) {
                goto LABEL_14;
              }
LABEL_13:
              CFRelease(v10);
              goto LABEL_14;
            }
            if (v10) {
              goto LABEL_13;
            }
          }
LABEL_14:
          if (++v8 == 3) {
            goto LABEL_20;
          }
        }
      }
LABEL_21:
      BOOL v12 = *(NSObject **)(a1 + 432);
      CMTime lhs = v23;
      Float64 Seconds = CMTimeGetSeconds(&lhs);
      dispatch_time_t v14 = dispatch_time(0, (uint64_t)(Seconds * 1000000000.0));
      dispatch_source_set_timer(v12, v14, 0xFFFFFFFFFFFFFFFFLL, 0);
      uint64_t v2 = context;
    }
  }
}

void __27__BWAudioSourceNode_start___block_invoke_27(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 576) = FigGetUpTimeNanoseconds();
  uint64_t v2 = *(void *)(a1 + 32);
  -[BWAudioSourceNode _updateStereoAudioCapturePairedCameraZoomFactorAndStartTimer:](v2, 0);
}

- (void)makeOutputsLiveIfNeeded
{
  generateSamplesDispatchQueue = self->_generateSamplesDispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__BWAudioSourceNode_makeOutputsLiveIfNeeded__block_invoke;
  block[3] = &unk_1E5C24430;
  block[4] = self;
  dispatch_async(generateSamplesDispatchQueue, block);
}

void *__44__BWAudioSourceNode_makeOutputsLiveIfNeeded__block_invoke(uint64_t a1)
{
  for (uint64_t i = 0; i != 24; i += 8)
  {
    result = *(void **)(*(void *)(a1 + 32) + 96 + i);
    if (result)
    {
      result = (void *)[result liveFormat];
      if (!result) {
        result = (void *)[*(id *)(*(void *)(a1 + 32) + 96 + i) makeConfiguredFormatLive];
      }
    }
  }
  return result;
}

- (BOOL)stop:(id *)a3
{
  uint64_t v4 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  BOOL streamStarted = self->_streamStarted;
  self->_BOOL streamStarted = 0;
  silenceTimer = self->_silenceTimer;
  if (silenceTimer) {
    dispatch_source_cancel(silenceTimer);
  }
  generateSamplesDispatchQueue = self->_generateSamplesDispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__BWAudioSourceNode_stop___block_invoke;
  block[3] = &unk_1E5C24430;
  block[4] = self;
  dispatch_async(generateSamplesDispatchQueue, block);
  if (streamStarted)
  {
    AudioOutputUnitStop(self->_audioUnit);
    AudioUnitUninitialize(self->_audioUnit);
    if (self->_audioSession || self->_CMSession)
    {
      if (self->_clientAudioClockDeviceUID) {
        -[BWAudioSourceNode _setAudioSessionMXPropertyWithKey:value:]((uint64_t)self, *MEMORY[0x1E4F75EE0], (uint64_t)&stru_1EFA403E0);
      }
      if (!self->_isAppAudioSession)
      {
        uint64_t v8 = MEMORY[0x1E4F1CC28];
        -[BWAudioSourceNode _setAudioSessionMXPropertyWithKey:value:]((uint64_t)self, *MEMORY[0x1E4F762D8], MEMORY[0x1E4F1CC28]);
        -[BWAudioSourceNode _setAudioSessionMXPropertyWithKey:value:]((uint64_t)self, *MEMORY[0x1E4F762E8], v8);
      }
    }
    self->_nextExpectedHostTime = 0;
    uint64_t v9 = (long long *)MEMORY[0x1E4F1F9F8];
    int64_t v10 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    self->_nextExpectedSampleTime.epoch = v10;
    long long v11 = *v9;
    *(_OWORD *)&self->_nextExpectedSampleTime.value = *v9;
    *(_OWORD *)&self->_prevPTS.value = v11;
    self->_prevPTS.epoch = v10;
    if (!self->_streamInterrupted && self->_didBeginInterruption)
    {
      audioSession = self->_audioSession;
      if (audioSession)
      {
        if (self->_doEndInterruption || self->_livePhotoCaptureEnabled || self->_mixWithOthersEnabled)
        {
          uint64_t v16 = 0;
          [(AVAudioSession *)audioSession setActive:0 error:&v16];
        }
      }
      else if (self->_CMSession {
             && (self->_doEndInterruption || self->_livePhotoCaptureEnabled || self->_mixWithOthersEnabled))
      }
      {
        CMSessionEndInterruption();
      }
    }
    self->_streamInterrupted = 0;
    self->_didBeginInterruption = 0;
  }
  zoomHandlerQueue = self->_zoomHandlerQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __26__BWAudioSourceNode_stop___block_invoke_2;
  v15[3] = &unk_1E5C24430;
  v15[4] = self;
  dispatch_sync(zoomHandlerQueue, v15);
  if (*v4 == 1) {
    kdebug_trace();
  }
  return 1;
}

void __26__BWAudioSourceNode_stop___block_invoke(uint64_t a1)
{
  for (uint64_t i = 0; i != 24; i += 8)
    [*(id *)(*(void *)(a1 + 32) + 96 + i) markEndOfLiveOutput];
  *(unsigned char *)(*(void *)(a1 + 32) + 402) = 1;
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 432);
  if (v3)
  {

    *(void *)(*(void *)(a1 + 32) + 432) = 0;
  }
}

void __26__BWAudioSourceNode_stop___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 584);
  if (v2)
  {
    dispatch_source_cancel(v2);

    *(void *)(*(void *)(a1 + 32) + 584) = 0;
  }
}

- (void)dealloc
{
  if (self->_configuresSession)
  {
    if (self->_audioSession)
    {
      uint64_t v3 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
      [v3 removeObserver:self name:*MEMORY[0x1E4F4E9B8] object:self->_audioSession];
    }
    else if (self->_CMSession)
    {
      CMNotificationCenterGetDefaultLocalCenter();
      FigNotificationCenterRemoveWeakListener();
    }
  }

  CMSession = self->_CMSession;
  if (CMSession)
  {
    CFRelease(CMSession);
    self->_CMSession = 0;
  }
  MXSessionAudioMode = self->_MXSessionAudioMode;
  if (MXSessionAudioMode)
  {
    CFRelease(MXSessionAudioMode);
    self->_MXSessionAudioMode = 0;
  }
  audioUnit = self->_audioUnit;
  if (audioUnit)
  {
    AudioUnitUninitialize(audioUnit);
    AudioComponentInstanceDispose(self->_audioUnit);
    self->_audioUnit = 0;
  }

  renderProcErrorQueue = self->_renderProcErrorQueue;
  if (renderProcErrorQueue)
  {
    CFRelease(renderProcErrorQueue);
    self->_renderProcErrorQueue = 0;
  }
  TimestampedAudioBufferListQueueReleaseAndClear((CFTypeRef *)&self->_inactiveBuffersQueue);
  TimestampedAudioBufferListQueueReleaseAndClear((CFTypeRef *)&self->_activeBuffersQueue);
  clock = self->_clock;
  if (clock)
  {
    CFRelease(clock);
    self->_clock = 0;
  }
  auOutputFormatDescription = self->_auOutputFormatDescription;
  if (auOutputFormatDescription)
  {
    CFRelease(auOutputFormatDescription);
    self->_auOutputFormatDescription = 0;
  }

  v10.receiver = self;
  v10.super_class = (Class)BWAudioSourceNode;
  [(BWNode *)&v10 dealloc];
}

- (BOOL)levelMeteringEnabled
{
  return self->_levelMeteringEnabled;
}

- (BOOL)livePhotoCaptureEnabled
{
  return self->_livePhotoCaptureEnabled;
}

- (BOOL)mixWithOthersEnabled
{
  return self->_mixWithOthersEnabled;
}

- (void)setMixWithOthersEnabled:(BOOL)a3
{
  self->_mixWithOthersEnabled = a3;
}

- (BOOL)mixWithOthersActive
{
  int v7 = 0;
  uint64_t v2 = -[BWAudioSourceNode _copyAudioSessionMXProperty:err:]((id *)&self->super.super.super.isa, *MEMORY[0x1E4F76248], &v7);
  uint64_t v3 = v2;
  BOOL v4 = 0;
  if (v7) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v2 == 0;
  }
  if (!v5) {
    BOOL v4 = [v2 unsignedIntValue] == 16;
  }

  return v4;
}

- (BOOL)windNoiseRemovalEnabled
{
  return self->_windNoiseRemovalEnabled;
}

- (BOOL)cinematicVideoCaptureEnabled
{
  return self->_cinematicVideoCaptureEnabled;
}

- (BOOL)flipStereoAudioCaptureChannels
{
  return self->_flipStereoAudioCaptureChannels;
}

- (void)setFlipStereoAudioCaptureChannels:(BOOL)a3
{
  self->_flipStereoAudioCaptureChannels = a3;
}

- (BOOL)videoRecordingEnabled
{
  return self->_videoRecordingEnabled;
}

- (BOOL)isAudioPlayingToBuiltinSpeaker
{
  return self->_audioPlayingToBuiltinSpeaker;
}

- (NSArray)audioLevels
{
  UInt32 outDataSize = 0;
  if (self->_audioLevelUnits == 1) {
    AudioUnitPropertyID v3 = 1892;
  }
  else {
    AudioUnitPropertyID v3 = 1893;
  }
  if (AudioUnitGetPropertyInfo(self->_audioUnit, v3, 1u, 1u, &outDataSize, 0) || outDataSize - 136 < 0xFFFFFF79)
  {
    int v6 = 0;
    BOOL v4 = 0;
    goto LABEL_14;
  }
  BOOL v4 = (char *)malloc_type_calloc(1uLL, outDataSize, 0x83579E27uLL);
  if (!v4)
  {
    FigDebugAssert3();
LABEL_17:
    int v6 = 0;
    goto LABEL_14;
  }
  if (AudioUnitGetProperty(self->_audioUnit, v3, 1u, 1u, v4, &outDataSize) || outDataSize < 8) {
    goto LABEL_17;
  }
  unint64_t v5 = (unint64_t)outDataSize >> 3;
  int v6 = (NSArray *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:2 * v5];
  uint64_t v8 = 0;
  if (v5 <= 1) {
    unsigned int v9 = 1;
  }
  else {
    unsigned int v9 = v5;
  }
  uint64_t v10 = 8 * v9;
  do
  {
    LODWORD(v7) = *(_DWORD *)&v4[v8];
    -[NSArray addObject:](v6, "addObject:", [NSNumber numberWithFloat:v7]);
    LODWORD(v11) = *(_DWORD *)&v4[v8 + 4];
    -[NSArray addObject:](v6, "addObject:", [NSNumber numberWithFloat:v11]);
    v8 += 8;
  }
  while (v10 != v8);
LABEL_14:
  free(v4);
  return v6;
}

- (float)stereoAudioCapturePairedCameraBaseFieldOfView
{
  return self->_stereoAudioCapturePairedCameraBaseFieldOfView;
}

- (void)setStereoAudioCapturePairedCameraBaseFieldOfView:(float)a3
{
  self->_stereoAudioCapturePairedCameraBaseFieldOfView = a3;
}

- (float)stereoAudioCapturePairedCameraZoomFactor
{
  return self->_stereoAudioCapturePairedCameraZoomFactor;
}

- (void)setStereoAudioCapturePairedCameraZoomFactor:(float)a3
{
  if (!self->_streamStarted)
  {
    self->_stereoAudioCapturePairedCameraZoomFactor = a3;
    self->_nextZoomFactor = a3;
  }
}

- (void)zoomCommandHandler:(id)a3 didApplyZoomFactor:(float)a4 zoomFactorWithoutFudge:(float)a5 targetZoomFactor:(float)a6 rampComplete:(BOOL)a7 rampCommandID:(int)a8
{
  p_zoomLock = &self->_zoomLock;
  os_unfair_lock_lock(&self->_zoomLock);
  self->_nextZoomFactor = a4;
  os_unfair_lock_unlock(p_zoomLock);
  zoomHandlerQueue = self->_zoomHandlerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __126__BWAudioSourceNode_zoomCommandHandler_didApplyZoomFactor_zoomFactorWithoutFudge_targetZoomFactor_rampComplete_rampCommandID___block_invoke;
  block[3] = &unk_1E5C24430;
  block[4] = self;
  dispatch_async(zoomHandlerQueue, block);
}

void __126__BWAudioSourceNode_zoomCommandHandler_didApplyZoomFactor_zoomFactorWithoutFudge_targetZoomFactor_rampComplete_rampCommandID___block_invoke(uint64_t a1)
{
}

- (uint64_t)_setVADCameraParametersWithDirection:(uint64_t)a3 zoomFactor:(float)a4 forTime:
{
  if (result)
  {
    uint64_t v8 = result;
    result = _FigIsCurrentDispatchQueue();
    if (!result)
    {
      uint64_t v16 = v4;
      LODWORD(v15) = 0;
      result = FigDebugAssert3();
    }
    if (!*(unsigned char *)(v8 + 169))
    {
      if (a4 < 1.0) {
        a4 = 1.0;
      }
      if (a2 != -1 || a4 != *(float *)(v8 + 552))
      {
        *(float *)&double v9 = *(float *)(v8 + 548) / a4;
        uint64_t v10 = objc_msgSend(NSNumber, "numberWithFloat:", v9, v15, v16);
        if ((a2 & 0x80000000) != 0) {
          uint64_t v11 = 0;
        }
        else {
          uint64_t v11 = [NSNumber numberWithInt:a2];
        }
        BOOL v12 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v13 = [NSNumber numberWithUnsignedInt:*(unsigned __int8 *)(v8 + 544)];
        uint64_t v14 = objc_msgSend(v12, "dictionaryWithObjectsAndKeys:", v10, @"camera fov", v13, @"camera wind suppression", objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(unsigned char *)(v8 + 545) == 0), @"camera real time dynamics", v11, @"camera dir", 0);
        result = -[BWAudioSourceNode _setAudioSessionMXPropertyWithKey:value:](v8, *MEMORY[0x1E4F75F60], v14);
        if (!result) {
          *(float *)(v8 + 552) = a4;
        }
      }
      *(void *)(v8 + 576) = *(void *)(v8 + 568) + a3;
    }
  }
  return result;
}

uint64_t __82__BWAudioSourceNode__updateStereoAudioCapturePairedCameraZoomFactorAndStartTimer___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 584) = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  return -[BWAudioSourceNode _updateStereoAudioCapturePairedCameraZoomFactorAndStartTimer:](v2, 0);
}

void __36__BWAudioSourceNode__setupAudioUnit__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) referencedObject];
  -[BWAudioSourceNode _activeAudioRouteDidChangeHandler](v1);
}

- (void)_activeAudioRouteDidChangeHandler
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v2 = (void *)MEMORY[0x1A6272C70]();
    AudioUnitPropertyID v3 = (void *)[*(id *)(a1 + 128) currentRoute];
    id v25 = 0;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v4 = (void *)[v3 inputs];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v22;
      uint64_t v8 = *MEMORY[0x1E4F4E948];
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v22 != v7) {
            objc_enumerationMutation(v4);
          }
          if (objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "portType"), "isEqualToString:", v8))
          {
            char v10 = 0;
            goto LABEL_12;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v27 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    char v10 = 1;
LABEL_12:
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v11 = objc_msgSend(v3, "outputs", 0);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v18;
      uint64_t v15 = *MEMORY[0x1E4F4E958];
LABEL_14:
      uint64_t v16 = 0;
      while (1)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        if (objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v16), "portType"), "isEqualToString:", v15))break; {
        if (v13 == ++v16)
        }
        {
          uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v26 count:16];
          if (v13) {
            goto LABEL_14;
          }
          goto LABEL_22;
        }
      }
      if (v10) {
        goto LABEL_22;
      }
      [*(id *)(a1 + 128) overrideOutputAudioPort:1936747378 error:&v25];
      [v25 code];
    }
    else
    {
LABEL_22:
      -[BWAudioSourceNode _selectMicForCurrentAudioRoute](a1);
    }
  }
}

- (uint64_t)_setCMSessionPropertyWithKey:(uint64_t)a1 value:
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  if (*(_DWORD *)(a1 + 216) && *(unsigned char *)(a1 + 172)) {
    uint64_t v3 = AudioSessionSetCMProperty();
  }
  else {
    uint64_t v3 = CMSessionSetProperty();
  }
  uint64_t v4 = v3;
  if (*v2 == 1) {
    kdebug_trace();
  }
  return v4;
}

- (uint64_t)_selectMicForAudioRoute:(void *)a1
{
  if (!a1) {
    return 0;
  }
  uint64_t v4 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  if (!objc_msgSend(a2, "bw_containsBuiltInMicAsAnInput"))
  {
    uint64_t v8 = 0;
    goto LABEL_25;
  }
  if (!FigCFEqual() && !FigCFEqual() && !FigCFEqual())
  {
    -[BWAudioSourceNode _setCMSessionPropertyWithKey:value:]((uint64_t)a1);
    goto LABEL_24;
  }
  if (!a2)
  {
    FigDebugAssert3();
    uint64_t v8 = 4294954516;
    goto LABEL_25;
  }
  uint64_t v5 = (void *)a1[18];
  if (v5)
  {
    uint64_t v6 = CMSessionCopyProperty();
    if (v6)
    {
      uint64_t v8 = v6;
LABEL_30:
      FigDebugAssert3();
      goto LABEL_25;
    }
    uint64_t v5 = 0;
  }
  uint64_t v7 = objc_msgSend(v5, "bw_builtInMicRouteDictionary");
  uint64_t v8 = (uint64_t)v7;
  if (!v7) {
    goto LABEL_25;
  }
  if (a1[14])
  {
    uint64_t v9 = 1718775412;
  }
  else
  {
    if (!a1[13]) {
      goto LABEL_24;
    }
    uint64_t v9 = 1650549611;
  }
  char v10 = objc_msgSend(v7, "bw_dataSourceDictionaryForDesiredMicOrientation:", v9);
  if (!v10) {
    goto LABEL_24;
  }
  uint64_t v11 = v10;
  uint64_t v12 = objc_msgSend(v10, "bw_optimalMicPolarPattern");
  if (objc_msgSend(MEMORY[0x1E4F1C978], "bw_selectedInputsArrayForBuiltInMicRouteDictionary:dataSource:polarPattern:", v8, v11, v12))
  {
    if (a1[18])
    {
      uint64_t v8 = -[BWAudioSourceNode _setCMSessionPropertyWithKey:value:]((uint64_t)a1);
      if (!v8) {
        goto LABEL_25;
      }
      goto LABEL_30;
    }
LABEL_24:
    uint64_t v8 = 0;
    goto LABEL_25;
  }
  FigDebugAssert3();
  uint64_t v8 = 4294954513;
LABEL_25:
  if (*v4 == 1) {
    kdebug_trace();
  }
  return v8;
}

uint64_t __119__BWAudioSourceNode__configureAudioSessionWithDefaultHardwareSampleRate_didCallDoNotNotifyOtherSessionsOnNextInactive___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(unsigned int *)(a1 + 40);
  float v3 = *(float *)(a1 + 44);
  uint64_t UpTimeNanoseconds = FigGetUpTimeNanoseconds();
  return -[BWAudioSourceNode _setVADCameraParametersWithDirection:zoomFactor:forTime:](v1, v2, UpTimeNanoseconds, v3);
}

- (uint64_t)_configureCMSessionWithDefaultHardwareSampleRate:(double)a3 didCallDoNotNotifyOtherSessionsOnNextInactive:
{
  v19[1] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v6 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  int v7 = *(unsigned __int8 *)(a1 + 152);
  if (!-[BWAudioSourceNode _deactivateCMSessionIfNecessary:](a1, a2))
  {
    if (!-[BWAudioSourceNode _setCMSessionPropertyWithKey:value:](a1)
      && !-[BWAudioSourceNode _setCMSessionPropertyWithKey:value:](a1))
    {
      if (v7)
      {
        -[BWAudioSourceNode _setCMSessionPropertyWithKey:value:](a1);
        if (!-[BWAudioSourceNode _setCMSessionPropertyWithKey:value:](a1)) {
          goto LABEL_11;
        }
      }
      else if (!-[BWAudioSourceNode _setCMSessionPropertyWithKey:value:](a1))
      {
LABEL_11:
        [NSNumber numberWithDouble:a3];
        -[BWAudioSourceNode _setCMSessionPropertyWithKey:value:](a1);
        if (*(unsigned char *)(a1 + 169)) {
          uint64_t v8 = 2;
        }
        else {
          uint64_t v8 = 1048578;
        }
        [NSNumber numberWithUnsignedInt:v8];
        if (!-[BWAudioSourceNode _setCMSessionPropertyWithKey:value:](a1))
        {
          if (!*(unsigned char *)(a1 + 169)
            || (objc_msgSend((id)objc_msgSend((id)a1, "graph"), "clientApplicationID"),
                !-[BWAudioSourceNode _setCMSessionPropertyWithKey:value:](a1))
            && ([NSNumber numberWithDouble:a3 * 0.01],
                !-[BWAudioSourceNode _setCMSessionPropertyWithKey:value:](a1))
            && !-[BWAudioSourceNode _setCMSessionPropertyWithKey:value:](a1))
          {
            if ((!*(unsigned char *)(a1 + 536) && !*(unsigned char *)(a1 + 174)
               || !-[BWAudioSourceNode _setCMSessionPropertyWithKey:value:](a1))
              && !-[BWAudioSourceNode _setCMSessionPropertyWithKey:value:](a1))
            {
              if (BWAudioCaptureModeIsSpatial(*(_DWORD *)(a1 + 540)))
              {
                BOOL v9 = *(void *)(a1 + 112) == 0;
                os_unfair_lock_lock((os_unfair_lock_t)(a1 + 596));
                int v10 = *(_DWORD *)(a1 + 592);
                os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 596));
                uint64_t v11 = *(NSObject **)(a1 + 560);
                block[0] = MEMORY[0x1E4F143A8];
                block[1] = 3221225472;
                block[2] = __116__BWAudioSourceNode__configureCMSessionWithDefaultHardwareSampleRate_didCallDoNotNotifyOtherSessionsOnNextInactive___block_invoke;
                block[3] = &unk_1E5C24F10;
                block[4] = a1;
                BOOL v16 = v9;
                int v17 = v10;
                dispatch_async(v11, block);
                goto LABEL_32;
              }
              if (!FigCFEqual()) {
                goto LABEL_32;
              }
              unsigned int v12 = *(void *)(a1 + 96) != 0;
              if (*(void *)(a1 + 104)) {
                v12 |= 2u;
              }
              uint64_t v13 = *(void *)(a1 + 112) ? v12 | 4 : v12;
              long long v18 = @"camera mics";
              v19[0] = [NSNumber numberWithInt:v13];
              [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
              if (!-[BWAudioSourceNode _setCMSessionPropertyWithKey:value:](a1)) {
                goto LABEL_32;
              }
            }
          }
        }
      }
    }
    FigDebugAssert3();
  }
LABEL_32:
  if (*v6 == 1) {
    kdebug_trace();
  }
  return 0;
}

- (uint64_t)_deactivateCMSessionIfNecessary:(uint64_t)a1
{
  if (!a1 || !*(void *)(a1 + 144) || !-[BWAudioSourceNode _cmSessionBooleanPropertyIsTrue:](a1)) {
    return 0;
  }
  uint64_t v4 = CMSessionCopyProperty();
  if (v4)
  {
    FigDebugAssert3();
  }
  else if (!FigCFEqual())
  {
    if (!*(unsigned char *)(a1 + 171))
    {
      CMSessionSetProperty();
      *a2 = 1;
    }
    CMSessionEndInterruption();
  }
  return v4;
}

uint64_t __116__BWAudioSourceNode__configureCMSessionWithDefaultHardwareSampleRate_didCallDoNotNotifyOtherSessionsOnNextInactive___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(unsigned int *)(a1 + 40);
  float v3 = *(float *)(a1 + 44);
  uint64_t UpTimeNanoseconds = FigGetUpTimeNanoseconds();
  return -[BWAudioSourceNode _setVADCameraParametersWithDirection:zoomFactor:forTime:](v1, v2, UpTimeNanoseconds, v3);
}

- (uint64_t)_setupPrepareToRecordStateWithFlags:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    if ((a2 & 1) != 0 && !*(void *)(result + 160))
    {
      result = FigDispatchQueueCreateWithPriority();
      *(void *)(v3 + 160) = result;
      if ((a2 & 2) == 0) {
        return result;
      }
    }
    else if ((a2 & 2) == 0)
    {
      return result;
    }
    if (!*(void *)(v3 + 528))
    {
      result = FigDispatchQueueCreateWithPriority();
      *(void *)(v3 + 528) = result;
    }
  }
  return result;
}

- (void)prepareToStartRecordingWithOrientation:(int)a3 recordingSettingsID:(int64_t)a4 prefersNoInterruptionsByRingtonesAndAlerts:(BOOL)a5 completionHandler:(id)a6
{
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  BOOL v16 = a5;
  self->_prefersNoInterruptionsByRingtonesAndAlerts = a5;
  if (a5 || FigCFEqual())
  {
    -[BWAudioSourceNode _setupPrepareToRecordStateWithFlags:]((uint64_t)self, -1);
    audioSessionSetRecordingRelatedPropertyQueue = self->_audioSessionSetRecordingRelatedPropertyQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __141__BWAudioSourceNode_prepareToStartRecordingWithOrientation_recordingSettingsID_prefersNoInterruptionsByRingtonesAndAlerts_completionHandler___block_invoke;
    block[3] = &unk_1E5C2AFB0;
    int v14 = a3;
    block[4] = self;
    void block[5] = a6;
    block[6] = v15;
    block[7] = a4;
    uint64_t v11 = block;
  }
  else
  {
    audioSessionSetRecordingRelatedPropertyQueue = self->_preparedToRecordHandlerCallbackQueue;
    if (!audioSessionSetRecordingRelatedPropertyQueue)
    {
      audioSessionSetRecordingRelatedPropertyQueue = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
      self->_preparedToRecordHandlerCallbackQueue = audioSessionSetRecordingRelatedPropertyQueue;
    }
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __141__BWAudioSourceNode_prepareToStartRecordingWithOrientation_recordingSettingsID_prefersNoInterruptionsByRingtonesAndAlerts_completionHandler___block_invoke_3;
    v12[3] = &unk_1E5C28920;
    v12[4] = a6;
    v12[5] = a4;
    uint64_t v11 = v12;
  }
  dispatch_async((dispatch_queue_t)audioSessionSetRecordingRelatedPropertyQueue, v11);
  _Block_object_dispose(v15, 8);
}

void __141__BWAudioSourceNode_prepareToStartRecordingWithOrientation_recordingSettingsID_prefersNoInterruptionsByRingtonesAndAlerts_completionHandler___block_invoke(uint64_t a1)
{
  CMTime v19 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    if (*(void *)(v2 + 128))
    {
      FigGetUpTimeNanoseconds();
      v18.value = 0;
      [*(id *)(*(void *)(a1 + 32) + 128) setPrefersNoInterruptionsFromSystemAlerts:1 error:&v18];
      [(id)v18.value code];
    }
    else
    {
      if (!*(void *)(v2 + 144)) {
        goto LABEL_7;
      }
      FigGetUpTimeNanoseconds();
      CMSessionSetProperty();
    }
    FigGetUpTimeNanoseconds();
  }
LABEL_7:
  if (FigCFEqual())
  {
    FigGetUpTimeNanoseconds();
    uint64_t v3 = (void *)[MEMORY[0x1E4F1CA58] dataWithLength:16];
    uint64_t v4 = [v3 mutableBytes];
    *(_DWORD *)uint64_t v4 = *(_DWORD *)(a1 + 64);
    *(void *)(v4 + 8) = 0;
    -[BWAudioSourceNode _setAudioSessionMXPropertyWithKey:value:](*(void *)(a1 + 32), *MEMORY[0x1E4F75F78], (uint64_t)v3);
    FigGetUpTimeNanoseconds();
    int64_t v5 = AudioConvertHostTimeToNanos(*(void *)([v3 mutableBytes] + 8));
    CMTimeMake(&v19, v5, 1000000000);
    CMClockRef HostTimeClock = CMClockGetHostTimeClock();
    int v7 = *(const void **)(*(void *)(a1 + 32) + 232);
    CMTime time = v19;
    CMSyncConvertTime(&v18, &time, HostTimeClock, v7);
    CMTime v19 = v18;
    int32_t v8 = *(_DWORD *)(*(void *)(a1 + 32) + 416);
    CMTime time = v18;
    CMTimeConvertScale(&v18, &time, v8, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
    CMTime v19 = v18;
    uint64_t v9 = *(void *)(a1 + 32) + 408;
    CMTime time = v18;
    long long v10 = *(_OWORD *)v9;
    rhs.epoch = *(void *)(v9 + 16);
    *(_OWORD *)&rhs.value = v10;
    CMTimeSubtract(&v18, &time, &rhs);
    CMTime v19 = v18;
  }
  uint64_t v11 = *(NSObject **)(*(void *)(a1 + 32) + 528);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __141__BWAudioSourceNode_prepareToStartRecordingWithOrientation_recordingSettingsID_prefersNoInterruptionsByRingtonesAndAlerts_completionHandler___block_invoke_2;
  block[3] = &unk_1E5C2AF88;
  uint64_t v12 = *(void *)(a1 + 40);
  CMTime v15 = v19;
  uint64_t v13 = *(void *)(a1 + 56);
  block[4] = v12;
  void block[5] = v13;
  dispatch_async(v11, block);
}

uint64_t __141__BWAudioSourceNode_prepareToStartRecordingWithOrientation_recordingSettingsID_prefersNoInterruptionsByRingtonesAndAlerts_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v3 = *(uint64_t (**)(uint64_t, long long *, uint64_t))(v2 + 16);
  long long v5 = *(_OWORD *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 64);
  return v3(v2, &v5, v1);
}

uint64_t __141__BWAudioSourceNode_prepareToStartRecordingWithOrientation_recordingSettingsID_prefersNoInterruptionsByRingtonesAndAlerts_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v3 = *(uint64_t (**)(uint64_t, long long *, uint64_t))(v2 + 16);
  long long v5 = *MEMORY[0x1E4F1FA48];
  uint64_t v6 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  return v3(v2, &v5, v1);
}

- (void)unprepareForRecording
{
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  BOOL prefersNoInterruptionsByRingtonesAndAlerts = self->_prefersNoInterruptionsByRingtonesAndAlerts;
  BOOL v3 = prefersNoInterruptionsByRingtonesAndAlerts;
  self->_BOOL prefersNoInterruptionsByRingtonesAndAlerts = 0;
  if (v3 || FigCFEqual())
  {
    audioSessionSetRecordingRelatedPropertyQueue = self->_audioSessionSetRecordingRelatedPropertyQueue;
    if (!audioSessionSetRecordingRelatedPropertyQueue)
    {
      audioSessionSetRecordingRelatedPropertyQueue = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
      self->_audioSessionSetRecordingRelatedPropertyQueue = audioSessionSetRecordingRelatedPropertyQueue;
    }
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __42__BWAudioSourceNode_unprepareForRecording__block_invoke;
    v5[3] = &unk_1E5C246B8;
    v5[4] = self;
    v5[5] = v6;
    dispatch_async((dispatch_queue_t)audioSessionSetRecordingRelatedPropertyQueue, v5);
  }
  _Block_object_dispose(v6, 8);
}

uint64_t __42__BWAudioSourceNode_unprepareForRecording__block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    FigGetUpTimeNanoseconds();
    uint64_t v2 = *(void *)(a1 + 32);
    BOOL v3 = *(void **)(v2 + 128);
    if (v3)
    {
      id v6 = 0;
      [v3 setPrefersNoInterruptionsFromSystemAlerts:0 error:&v6];
      [v6 code];
    }
    else if (*(void *)(v2 + 144))
    {
      CMSessionSetProperty();
    }
    FigGetUpTimeNanoseconds();
  }
  uint64_t result = FigCFEqual();
  if (result)
  {
    long long v5 = (void *)[MEMORY[0x1E4F1CA58] dataWithLength:16];
    *(_DWORD *)[v5 mutableBytes] = 5;
    FigGetUpTimeNanoseconds();
    -[BWAudioSourceNode _setAudioSessionMXPropertyWithKey:value:](*(void *)(a1 + 32), *MEMORY[0x1E4F75F78], (uint64_t)v5);
    return FigGetUpTimeNanoseconds();
  }
  return result;
}

- (BOOL)interrupted
{
  return self->_streamInterrupted;
}

- (void)setInterrupted:(BOOL)a3
{
  self->_streamInterrupted = a3;
}

@end