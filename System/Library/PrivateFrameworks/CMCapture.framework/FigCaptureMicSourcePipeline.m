@interface FigCaptureMicSourcePipeline
+ (void)initialize;
- (uint64_t)_buildMicSourcePipelineWithConfiguration:(void *)a3 graph:(void *)a4 audioSession:(uint64_t)a5 cmSession:(char)a6 isAppAudioSession:(char)a7 audioSessionIsProxy:(unsigned __int8)a8 audioIsPlayingToBuiltinSpeaker:(uint64_t)a9 renderDelegate:;
- (uint64_t)cinematicAudioOutputForMicSourcePosition:(uint64_t)a1;
- (uint64_t)clock;
- (uint64_t)nextOutputForMicSourcePosition:(uint64_t)result;
- (uint64_t)sourceNode;
- (uint64_t)updateWithAudioSession:(_OWORD *)a3 clientAuditToken:;
- (void)dealloc;
- (void)initWithConfiguration:(void *)a3 graph:(uint64_t)a4 name:(void *)a5 audioSession:(uint64_t)a6 cmSession:(char)a7 isAppAudioSession:(char)a8 audioSessionIsProxy:(unsigned __int8)a9 audioIsPlayingToBuiltinSpeaker:(uint64_t)a10 renderDelegate:;
@end

@implementation FigCaptureMicSourcePipeline

- (uint64_t)sourceNode
{
  if (result) {
    return *(void *)(result + 40);
  }
  return result;
}

- (uint64_t)clock
{
  if (result) {
    return [*(id *)(result + 40) clock];
  }
  return result;
}

- (uint64_t)_buildMicSourcePipelineWithConfiguration:(void *)a3 graph:(void *)a4 audioSession:(uint64_t)a5 cmSession:(char)a6 isAppAudioSession:(char)a7 audioSessionIsProxy:(unsigned __int8)a8 audioIsPlayingToBuiltinSpeaker:(uint64_t)a9 renderDelegate:
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v15 = a2;
  id v95 = 0;
  id v96 = 0;
  CFTypeRef cf = 0;
  if (a2) {
    v16 = *(void **)(a2 + 8);
  }
  else {
    v16 = 0;
  }
  uint64_t v17 = [v16 source];
  uint64_t v18 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v18) {
    uint64_t v19 = v18;
  }
  else {
    uint64_t v19 = 0;
  }
  v20 = *(uint64_t (**)(uint64_t, __CFString *, void, id *))(v19 + 48);
  if (!v20)
  {
    uint64_t v24 = 4294954514;
LABEL_14:
    fig_log_get_emitter();
    goto LABEL_15;
  }
  char v87 = a7;
  uint64_t v21 = *MEMORY[0x1E4F1CF80];
  uint64_t v22 = v20(v17, @"AttributesDictionary", *MEMORY[0x1E4F1CF80], &v95);
  if (v22)
  {
    uint64_t v24 = v22;
    goto LABEL_14;
  }
  if (!FigCaptureAudiomxdSupportEnabled())
  {
    if (v15) {
      v25 = *(void **)(v15 + 8);
    }
    else {
      v25 = 0;
    }
    uint64_t v26 = [v25 source];
    uint64_t v27 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v27) {
      uint64_t v28 = v27;
    }
    else {
      uint64_t v28 = 0;
    }
    v29 = *(uint64_t (**)(uint64_t, __CFString *, uint64_t, CFTypeRef *))(v28 + 48);
    if (v29)
    {
      uint64_t v30 = v29(v26, @"Clock", v21, &cf);
      if (!v30)
      {
LABEL_24:
        if (v15) {
          v31 = *(void **)(v15 + 16);
        }
        else {
          v31 = 0;
        }
        obuint64_t j = a4;
        v77 = a3;
        long long v97 = 0u;
        long long v98 = 0u;
        long long v99 = 0u;
        long long v100 = 0u;
        uint64_t v32 = [v31 countByEnumeratingWithState:&v97 objects:v101 count:16];
        uint64_t v83 = v15;
        if (v32)
        {
          uint64_t v33 = v32;
          uint64_t v34 = *(void *)v98;
          while (2)
          {
            for (uint64_t i = 0; i != v33; ++i)
            {
              if (*(void *)v98 != v34) {
                objc_enumerationMutation(v31);
              }
              v36 = *(void **)(*((void *)&v97 + 1) + 8 * i);
              if ([v36 audioCaptureMode] == 3
                || [v36 audioCaptureMode] == 4
                || [v36 audioCaptureMode] == 5)
              {
                char v37 = 1;
                uint64_t v15 = v83;
                goto LABEL_41;
              }
            }
            uint64_t v33 = [v31 countByEnumeratingWithState:&v97 objects:v101 count:16];
            char v37 = 0;
            uint64_t v15 = v83;
            if (v33) {
              continue;
            }
            break;
          }
        }
        else
        {
          char v37 = 0;
        }
LABEL_41:
        char v78 = a6;
        uint64_t v80 = a5;
        unsigned __int8 v82 = a8;
        id v38 = v95;
        if (v15)
        {
          uint64_t v39 = *(void *)(v15 + 48);
          CFTypeRef v40 = cf;
          BOOL v41 = *(unsigned char *)(v15 + 56) != 0;
          BOOL v42 = *(unsigned char *)(v15 + 57) != 0;
          BOOL v43 = *(unsigned char *)(v15 + 58) != 0;
          long long v44 = *(_OWORD *)(v15 + 76);
          long long v92 = *(_OWORD *)(v15 + 60);
          long long v93 = v44;
          BOOL v45 = *(unsigned char *)(v15 + 59) != 0;
          uint64_t v46 = [*(id *)(v15 + 8) clientAudioClockDeviceUID];
          uint64_t v47 = *(void *)(v15 + 16);
        }
        else
        {
          CFTypeRef v40 = cf;
          long long v92 = 0u;
          long long v93 = 0u;
          uint64_t v46 = [0 clientAudioClockDeviceUID];
          BOOL v42 = 0;
          uint64_t v39 = 0;
          BOOL v41 = 0;
          BOOL v43 = 0;
          BOOL v45 = 0;
          uint64_t v47 = 0;
        }
        LOBYTE(v74) = v37;
        LOBYTE(v73) = v45;
        BYTE3(v72) = v82;
        BYTE2(v72) = v87;
        BYTE1(v72) = v43;
        LOBYTE(v72) = v78;
        v48 = +[BWAudioSourceNode audioSourceNodeWithAttributes:sessionPreset:clock:doConfigureAudio:doMixWithOthers:audioSession:CMSession:isAppAudioSession:doEndInterruption:audioSessionIsProxy:audioIsPlayingToBuiltinSpeaker:clientAuditToken:clientOSVersionSupportsDecoupledIO:clientAudioClockDeviceUID:audioCaptureConnectionConfigurations:isConfiguredForContinuityCapture:](BWAudioSourceNode, "audioSourceNodeWithAttributes:sessionPreset:clock:doConfigureAudio:doMixWithOthers:audioSession:CMSession:isAppAudioSession:doEndInterruption:audioSessionIsProxy:audioIsPlayingToBuiltinSpeaker:clientAuditToken:clientOSVersionSupportsDecoupledIO:clientAudioClockDeviceUID:audioCaptureConnectionConfigurations:isConfiguredForContinuityCapture:", v38, v39, v40, v41, v42, obj, v80, v72, &v92, v73, v46, v47, v74);
        if (cf) {
          CFRelease(cf);
        }

        BOOL v49 = v83;
        if (!v48)
        {
          fig_log_get_emitter();
          FigDebugAssert3();
          return 4294954510;
        }
        [(BWNode *)v48 setRenderDelegate:a9];
        if (v83)
        {
          v50 = *(void **)(v83 + 16);
          v75 = *(void **)(v83 + 24);
          v51 = *(void **)(v83 + 32);
          BOOL v49 = *(unsigned char *)(v83 + 40) != 0;
        }
        else
        {
          v51 = 0;
          v50 = 0;
          v75 = 0;
        }
        v81 = v48;
        long long v97 = 0u;
        long long v98 = 0u;
        long long v99 = 0u;
        long long v100 = 0u;
        uint64_t v52 = [v50 countByEnumeratingWithState:&v97 objects:v101 count:16];
        v79 = v51;
        BOOL v76 = v49;
        if (v52)
        {
          uint64_t v53 = v52;
          char v54 = 0;
          char v55 = 0;
          char v56 = 0;
          unsigned int v88 = 0;
          uint64_t v57 = *(void *)v98;
          id obja = v50;
          do
          {
            for (uint64_t j = 0; j != v53; ++j)
            {
              if (*(void *)v98 != v57) {
                objc_enumerationMutation(obja);
              }
              v59 = *(void **)(*((void *)&v97 + 1) + 8 * j);
              if (objc_msgSend((id)objc_msgSend(v59, "sinkConfiguration"), "sinkType") == 4) {
                char v60 = 1;
              }
              else {
                char v60 = objc_msgSend((id)objc_msgSend(v59, "irisSinkConfiguration"), "irisMovieCaptureEnabled");
              }
              char v61 = objc_msgSend((id)objc_msgSend(v59, "irisSinkConfiguration"), "irisMovieCaptureEnabled");
              char v62 = [v59 windNoiseRemovalEnabled];
              if ([v59 audioCaptureMode]) {
                unsigned int v88 = [v59 audioCaptureMode];
              }
              v55 |= v60;
              v54 |= v61;
              v56 |= v62;
            }
            uint64_t v53 = [obja countByEnumeratingWithState:&v97 objects:v101 count:16];
          }
          while (v53);
        }
        else
        {
          char v54 = 0;
          char v55 = 0;
          char v56 = 0;
          unsigned int v88 = 0;
        }
        if ((v82 & (v88 == 2)) != 0) {
          unsigned int v63 = 0;
        }
        else {
          unsigned int v63 = v88;
        }
        if (v54) {
          uint64_t v64 = 0;
        }
        else {
          uint64_t v64 = v63;
        }
        [(BWAudioSourceNode *)v81 setLivePhotoCaptureEnabled:v54 & 1];
        [(BWAudioSourceNode *)v81 setAudioCaptureMode:v64];
        [(BWAudioSourceNode *)v81 setWindNoiseRemovalEnabled:v56 & 1];
        [(BWAudioSourceNode *)v81 setVideoRecordingEnabled:v55 & 1];
        [(BWAudioSourceNode *)v81 setLevelMeteringEnabled:1];
        if (BWAudioCaptureModeIsSpatial(v63))
        {
          objc_msgSend((id)objc_msgSend(v75, "requiredFormat"), "fieldOfView");
          -[BWAudioSourceNode setStereoAudioCapturePairedCameraBaseFieldOfView:](v81, "setStereoAudioCapturePairedCameraBaseFieldOfView:");
          [v75 videoZoomFactor];
          -[BWAudioSourceNode setStereoAudioCapturePairedCameraZoomFactor:](v81, "setStereoAudioCapturePairedCameraZoomFactor:");
          [v79 setZoomCompletionDelegateForStereoAudio:v81];
          [(BWAudioSourceNode *)v81 setFlipStereoAudioCaptureChannels:v76];
        }
        v65 = a1;
        v91.receiver = a1;
        v91.super_class = (Class)FigCaptureMicSourcePipeline;
        if (objc_msgSendSuper2(&v91, sel_addNode_error_, v81, &v96))
        {
          uint64_t v66 = 0;
          a1[5] = v81;
          while (1)
          {
            uint64_t v67 = objc_msgSend(-[FigCaptureMicSourcePipelineConfiguration micConnectionConfigurationsForMicSourcePosition:](v83, v66), "count");
            if ((int)v67 >= 1)
            {
              if ([v65[5] audioCaptureMode] == 2)
              {
                v68 = [[BWAudioSplitNode alloc] initWithInputChannelLayoutTag:4027580422 output1ChannelLayoutTag:6619138 output2ChannelLayoutTag:12451844];
                -[BWNode setName:](v68, "setName:", objc_msgSend(NSString, "stringWithFormat:", @"AudioSplitNode (%d -> %d:%d)", 6, 2, 4));
                v90.receiver = v65;
                v90.super_class = (Class)FigCaptureMicSourcePipeline;
                if ((objc_msgSendSuper2(&v90, sel_addNode_error_, v68, &v96) & 1) == 0
                  || (objc_msgSend(v77, "connectOutput:toInput:pipelineStage:", objc_msgSend(v65[5], "outputForMicSourcePosition:", v66), -[BWNode input](v68, "input"), 0) & 1) == 0)
                {
                  break;
                }
                v65[v66 + 9] = v68;
              }
              else
              {
                v68 = 0;
              }
              v69 = [[BWFanOutNode alloc] initWithFanOutCount:v67 mediaType:1936684398];
              -[BWNode setName:](v69, "setName:", [NSString stringWithFormat:@"Audio FanOutNode (%@)", BWCaptureDevicePositionToString(v66)]);
              v89.receiver = v65;
              v89.super_class = (Class)FigCaptureMicSourcePipeline;
              if ((objc_msgSendSuper2(&v89, sel_addNode_error_, v69, &v96) & 1) == 0) {
                break;
              }
              v65[v66 + 6] = v69;
              uint64_t v70 = [v65[5] outputForMicSourcePosition:v66];
              if (v68) {
                uint64_t v70 = [(NSArray *)[(BWNode *)v68 outputs] objectAtIndexedSubscript:0];
              }
              v65 = a1;
              if ((objc_msgSend(v77, "connectOutput:toInput:pipelineStage:", v70, -[BWNode input](v69, "input"), 0) & 1) == 0) {
                break;
              }
            }
            if (++v66 == 3) {
              goto LABEL_83;
            }
          }
          fig_log_get_emitter();
        }
        else
        {
          fig_log_get_emitter();
        }
        goto LABEL_88;
      }
      uint64_t v24 = v30;
    }
    else
    {
      uint64_t v24 = 4294954514;
    }
    fig_log_get_emitter();
LABEL_15:
    FigDebugAssert3();
    if (v24) {
      return v24;
    }
    goto LABEL_84;
  }
  if (a4)
  {
    uint64_t v23 = FigAudioSessionClockCreateForAVAudioSession();
    if (v23)
    {
      uint64_t v24 = v23;
      fig_log_get_emitter();
      goto LABEL_15;
    }
    goto LABEL_24;
  }
  fig_log_get_emitter();
LABEL_88:
  FigDebugAssert3();
LABEL_83:
  uint64_t v24 = 0;
LABEL_84:
  if (v96) {
    return [v96 code];
  }
  return v24;
}

- (uint64_t)nextOutputForMicSourcePosition:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    v4 = (void *)[*(id *)(result + 48 + 8 * a2) outputs];
    ++*(_DWORD *)(v3 + 96 + 4 * a2);
    return objc_msgSend(v4, "objectAtIndexedSubscript:");
  }
  return result;
}

- (void)initWithConfiguration:(void *)a3 graph:(uint64_t)a4 name:(void *)a5 audioSession:(uint64_t)a6 cmSession:(char)a7 isAppAudioSession:(char)a8 audioSessionIsProxy:(unsigned __int8)a9 audioIsPlayingToBuiltinSpeaker:(uint64_t)a10 renderDelegate:
{
  if (!a1) {
    return 0;
  }
  if (a5 && a6) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"*** AVAudioSession and CMSession arguments cannot both be non-nil -- AVAudioSession: %@, CMSession: %@", a5, a6 format];
  }
  if (a2) {
    uint64_t v18 = *(void **)(a2 + 8);
  }
  else {
    uint64_t v18 = 0;
  }
  v22.receiver = a1;
  v22.super_class = (Class)FigCaptureMicSourcePipeline;
  uint64_t v19 = objc_msgSendSuper2(&v22, sel_initWithGraph_name_sourceID_, a3, a4, [v18 sourceID]);
  if (v19)
  {
    v20 = a2 ? *(void **)(a2 + 32) : 0;
    v19[14] = v20;
    if (-[FigCaptureMicSourcePipeline _buildMicSourcePipelineWithConfiguration:graph:audioSession:cmSession:isAppAudioSession:audioSessionIsProxy:audioIsPlayingToBuiltinSpeaker:renderDelegate:]((id *)v19, a2, a3, a5, a6, a7, a8, a9, a10))
    {
      fig_log_get_emitter();
      FigDebugAssert3();

      return 0;
    }
  }
  return v19;
}

- (uint64_t)updateWithAudioSession:(_OWORD *)a3 clientAuditToken:
{
  if (result)
  {
    uint64_t v3 = *(void **)(result + 40);
    long long v4 = a3[1];
    v5[0] = *a3;
    v5[1] = v4;
    return [v3 updateWithAudioSession:a2 clientAuditToken:v5];
  }
  return result;
}

+ (void)initialize
{
}

- (void)dealloc
{
  [(BWZoomCommandHandler *)self->_zoomCommandHandlerForStereoAudioCapture setZoomCompletionDelegateForStereoAudio:0];

  for (uint64_t i = 0; i != 3; ++i)
  for (uint64_t j = 0; j != 3; ++j)

  v5.receiver = self;
  v5.super_class = (Class)FigCaptureMicSourcePipeline;
  [(FigCaptureSourcePipeline *)&v5 dealloc];
}

- (uint64_t)cinematicAudioOutputForMicSourcePosition:(uint64_t)a1
{
  if (!a1 || (unint64_t)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 72 + 8 * a2), "outputs"), "count") < 2) {
    return 0;
  }
  long long v4 = (void *)[*(id *)(a1 + 72 + 8 * a2) outputs];
  return [v4 objectAtIndexedSubscript:1];
}

@end