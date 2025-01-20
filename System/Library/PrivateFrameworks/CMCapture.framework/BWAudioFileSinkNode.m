@interface BWAudioFileSinkNode
+ (void)initialize;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastFileDuration;
- (BWAudioFileSinkNode)initWithSinkID:(id)a3;
- (id)nodeSubType;
- (uint64_t)_applyRecordingLimits;
- (uint64_t)_handleMarkerBuffer:(unint64_t)a1;
- (uint64_t)_setupFileWriter;
- (uint64_t)_setupStateMachine;
- (uint64_t)_stopRecordingWithError:(uint64_t)result;
- (uint64_t)_teardownFileWriter;
- (unint64_t)_setupMinFreeDiskSpace;
- (unint64_t)lastFileSize;
- (void)_updateFilePropertiesForSbuf:(uint64_t)a1;
- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
@end

@implementation BWAudioFileSinkNode

+ (void)initialize
{
}

- (BWAudioFileSinkNode)initWithSinkID:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BWAudioFileSinkNode;
  v3 = [(BWSinkNode *)&v7 initWithSinkID:a3];
  if (v3)
  {
    v4 = [[BWNodeInput alloc] initWithMediaType:1936684398 node:v3 index:0];
    [(BWNode *)v3 addInput:v4];

    v3->_propertySyncQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.celestial.capture.audiofilesink.PropertySyncQueue", 0);
    -[BWAudioFileSinkNode _setupStateMachine]((uint64_t)v3);
    uint64_t v5 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)&v3->_startPTS.value = *MEMORY[0x1E4F1F9F8];
    v3->_startPTS.epoch = *(void *)(v5 + 16);
  }
  return v3;
}

- (uint64_t)_setupStateMachine
{
  if (result)
  {
    uint64_t v1 = result;
    v2 = [[FigStateMachine alloc] initWithLabel:@"BWAudioFileSinkNodeState" stateCount:3 initialState:1 owner:result];
    *(void *)(v1 + 176) = v2;
    [(FigStateMachine *)v2 setLabel:@"Idle" forState:1];
    [*(id *)(v1 + 176) setLabel:@"Recording" forState:2];
    [*(id *)(v1 + 176) setLabel:@"Paused" forState:4];
    [*(id *)(v1 + 176) whenTransitioningFromState:1 toState:2 callHandler:&__block_literal_global_99];
    [*(id *)(v1 + 176) whenTransitioningFromState:2 toState:4 callHandler:&__block_literal_global_29_0];
    [*(id *)(v1 + 176) whenTransitioningFromState:4 toState:2 callHandler:&__block_literal_global_31_0];
    v3 = *(void **)(v1 + 176);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __41__BWAudioFileSinkNode__setupStateMachine__block_invoke_4;
    v4[3] = &unk_1E5C2B3D0;
    v4[4] = v1;
    return [v3 whenTransitioningToState:1 callHandler:v4];
  }
  return result;
}

- (void)dealloc
{
  -[BWAudioFileSinkNode _stopRecordingWithError:]((uint64_t)self, 0);

  free(self->_parentPath);
  v3.receiver = self;
  v3.super_class = (Class)BWAudioFileSinkNode;
  [(BWSinkNode *)&v3 dealloc];
}

- (uint64_t)_stopRecordingWithError:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    -[BWAudioFileSinkNode _teardownFileWriter](result);
    result = [*(id *)(v3 + 176) currentState];
    if (result != 1)
    {
      v4 = *(void **)(v3 + 176);
      return [v4 transitionToState:1 errorStatus:a2];
    }
  }
  return result;
}

- (id)nodeSubType
{
  return @"AudioFile";
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  v5.receiver = self;
  v5.super_class = (Class)BWAudioFileSinkNode;
  [(BWSinkNode *)&v5 configurationWithID:a3 updatedFormat:a4 didBecomeLiveForInput:a5];
}

- (void)didReachEndOfDataForInput:(id)a3
{
  -[BWAudioFileSinkNode _stopRecordingWithError:]((uint64_t)self, 0);
  v5.receiver = self;
  v5.super_class = (Class)BWAudioFileSinkNode;
  [(BWSinkNode *)&v5 didReachEndOfDataForInput:a3];
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  if (a3)
  {
    if (!CMSampleBufferGetDataBuffer(a3))
    {
      uint64_t v12 = -[BWAudioFileSinkNode _handleMarkerBuffer:]((unint64_t)self, a3);
      if (!v12) {
        return;
      }
      uint64_t v13 = v12;
      fig_log_get_emitter();
      goto LABEL_23;
    }
    formatWriter = self->_formatWriter;
    if (!formatWriter) {
      return;
    }
    if (!self->_didBeginFileWriterSession)
    {
      CMSampleBufferGetPresentationTimeStamp(&v20, a3);
      uint64_t v14 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v14) {
        uint64_t v15 = v14;
      }
      else {
        uint64_t v15 = 0;
      }
      v18 = *(uint64_t (**)(OpaqueFigFormatWriter *, CMTime *))(v15 + 56);
      if (!v18)
      {
        uint64_t v13 = 4294954514;
        goto LABEL_22;
      }
      CMTime v21 = v20;
      uint64_t v19 = v18(formatWriter, &v21);
      if (v19)
      {
        uint64_t v13 = v19;
        goto LABEL_22;
      }
      self->_didBeginFileWriterSession = 1;
    }
    uint64_t v7 = -[BWAudioFileSinkNode _applyRecordingLimits]((uint64_t)self);
    if (v7)
    {
      uint64_t v13 = v7;
      fig_log_get_emitter();
      goto LABEL_23;
    }
    v8 = self->_formatWriter;
    uint64_t trackID = self->_trackID;
    uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v10) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 0;
    }
    v16 = *(uint64_t (**)(OpaqueFigFormatWriter *, uint64_t, opaqueCMSampleBuffer *))(v11 + 32);
    if (v16)
    {
      uint64_t v17 = v16(v8, trackID, a3);
      if (!v17)
      {
        -[BWAudioFileSinkNode _updateFilePropertiesForSbuf:]((uint64_t)self, (uint64_t)a3);
        return;
      }
      uint64_t v13 = v17;
    }
    else
    {
      uint64_t v13 = 4294954514;
    }
LABEL_22:
    fig_log_get_emitter();
LABEL_23:
    FigDebugAssert3();
    -[BWAudioFileSinkNode _stopRecordingWithError:]((uint64_t)self, v13);
  }
}

- (uint64_t)_handleMarkerBuffer:(unint64_t)a1
{
  if (!a1) {
    return 0;
  }
  CFTypeRef v4 = CMGetAttachment(target, @"FileWriterAction", 0);
  if (!v4) {
    return 0;
  }
  objc_super v5 = v4;
  if (!CFEqual(v4, @"Start"))
  {
    if (CFEqual(v5, @"Pause"))
    {
      uint64_t v10 = *(void **)(a1 + 176);
      uint64_t v11 = 4;
      uint64_t v12 = 2;
    }
    else
    {
      if (!CFEqual(v5, @"Resume"))
      {
        if (CFEqual(v5, @"Stop")) {
          -[BWAudioFileSinkNode _stopRecordingWithError:](a1, 0);
        }
        return 0;
      }
      uint64_t v10 = *(void **)(a1 + 176);
      uint64_t v11 = 2;
      uint64_t v12 = 4;
    }
    [v10 transitionToState:v11 fromState:v12];
    return 0;
  }
  -[BWAudioFileSinkNode _stopRecordingWithError:](a1, 0);
  CFTypeRef v6 = CMGetAttachment(target, @"RecordingSettings", 0);
  if (v6 && (uint64_t v7 = (void *)v6, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = v7;

    *(void *)(a1 + 216) = v7;
    CMSampleBufferGetPresentationTimeStamp(&v14, (CMSampleBufferRef)target);
    *(CMTime *)(a1 + 224) = v14;
    uint64_t v9 = -[BWAudioFileSinkNode _setupFileWriter](a1);
    if (v9)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      [*(id *)(a1 + 176) transitionToState:2];
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 4294954516;
  }
  return v9;
}

- (uint64_t)_applyRecordingLimits
{
  if (result)
  {
    uint64_t v1 = result;
    if (BWGetFreeDiskSpaceAtPath(*(const char **)(result + 208)) < *(void *)(result + 280))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      return 4294950885;
    }
    else if ([*(id *)(v1 + 216) maxFileSize] >= 1 {
           && (unint64_t v2 = *(void *)(v1 + 272), v2 > [*(id *)(v1 + 216) maxFileSize]))
    }
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      return 4294950884;
    }
    else
    {
      result = *(void *)(v1 + 216);
      if (result)
      {
        [(id)result maxDuration];
        if ((v8 & 1) == 0) {
          return 0;
        }
        uint64_t v3 = *(void **)(v1 + 216);
        if (v3) {
          [v3 maxDuration];
        }
        else {
          memset(&time1, 0, sizeof(time1));
        }
        CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
        if (CMTimeCompare(&time1, &time2)) {
          return 0;
        }
        CFTypeRef v4 = *(void **)(v1 + 216);
        if (v4) {
          [v4 maxDuration];
        }
        else {
          memset(&v5, 0, sizeof(v5));
        }
        CMTime time2 = *(CMTime *)(v1 + 248);
        if (CMTimeCompare(&time2, &v5) >= 1)
        {
          fig_log_get_emitter();
          FigDebugAssert3();
          return 4294950883;
        }
        else
        {
          return 0;
        }
      }
    }
  }
  return result;
}

- (void)_updateFilePropertiesForSbuf:(uint64_t)a1
{
  if (a1)
  {
    unint64_t v2 = *(NSObject **)(a1 + 288);
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __52__BWAudioFileSinkNode__updateFilePropertiesForSbuf___block_invoke;
    v3[3] = &unk_1E5C24F10;
    v3[4] = a1;
    v3[5] = a2;
    dispatch_sync(v2, v3);
  }
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastFileDuration
{
  uint64_t v7 = 0;
  char v8 = &v7;
  uint64_t v9 = 0x3810000000;
  uint64_t v10 = "";
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  propertySyncQueue = self->_propertySyncQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__BWAudioFileSinkNode_lastFileDuration__block_invoke;
  block[3] = &unk_1E5C246B8;
  block[4] = self;
  block[5] = &v7;
  dispatch_sync(propertySyncQueue, block);
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)(v8 + 4);
  _Block_object_dispose(&v7, 8);
  return result;
}

__n128 __39__BWAudioFileSinkNode_lastFileDuration__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(__n128 **)(*(void *)(a1 + 40) + 8);
  unint64_t v2 = (__n128 *)(*(void *)(a1 + 32) + 248);
  unint64_t v3 = *(void *)(*(void *)(a1 + 32) + 264);
  __n128 result = *v2;
  v1[2] = *v2;
  v1[3].n128_u64[0] = v3;
  return result;
}

- (unint64_t)lastFileSize
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  propertySyncQueue = self->_propertySyncQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__BWAudioFileSinkNode_lastFileSize__block_invoke;
  v5[3] = &unk_1E5C246B8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(propertySyncQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __35__BWAudioFileSinkNode_lastFileSize__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 272);
  return result;
}

void *__41__BWAudioFileSinkNode__setupStateMachine__block_invoke(uint64_t a1, uint64_t a2)
{
  __n128 result = (void *)[(id)a2 recordingStatusDelegate];
  if (result)
  {
    uint64_t v4 = *(void *)(a2 + 216);
    long long v5 = *(_OWORD *)(a2 + 224);
    uint64_t v6 = *(void *)(a2 + 240);
    return (void *)[result fileWriter:a2 startedRecordingForSettings:v4 writerPipelineIndex:0 startPTS:&v5];
  }
  return result;
}

uint64_t __41__BWAudioFileSinkNode__setupStateMachine__block_invoke_2(uint64_t a1, id *a2)
{
  uint64_t result = [a2 recordingStatusDelegate];
  if (result)
  {
    uint64_t v4 = (void *)result;
    uint64_t v5 = [a2[27] settingsID];
    return [v4 fileWriter:a2 pausedRecordingForSettingsID:v5];
  }
  return result;
}

uint64_t __41__BWAudioFileSinkNode__setupStateMachine__block_invoke_3(uint64_t a1, id *a2)
{
  uint64_t result = [a2 recordingStatusDelegate];
  if (result)
  {
    uint64_t v4 = (void *)result;
    uint64_t v5 = [a2[27] settingsID];
    return [v4 fileWriter:a2 resumedRecordingForSettingsID:v5];
  }
  return result;
}

void *__41__BWAudioFileSinkNode__setupStateMachine__block_invoke_4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = (void *)[a2 recordingStatusDelegate];
  if (result)
  {
    LOBYTE(v9) = a5 == 0;
    return (void *)[result fileWriter:a2 writerPipelineIndex:0 stoppedRecordingForSettings:*(void *)(*(void *)(a1 + 32) + 216) withError:a5 thumbnailSurface:0 irisMovieInfo:0 debugMetadataSidecarFileURL:0 recordingSucceeded:v9];
  }
  return result;
}

- (uint64_t)_setupFileWriter
{
  v17[1] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  unint64_t v2 = (void *)[*(id *)(a1 + 216) outputURL];
  if (FigFileDoesFileExist())
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 4294950886;
  }
  unint64_t v3 = *(unsigned char **)(a1 + 208);
  if (v3) {
    unsigned char *v3 = 0;
  }
  else {
    *(void *)(a1 + 208) = malloc_type_malloc(0x400uLL, 0xB54B53DCuLL);
  }
  uint64_t v4 = *(NSObject **)(a1 + 288);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__BWAudioFileSinkNode__setupFileWriter__block_invoke;
  block[3] = &unk_1E5C24430;
  block[4] = a1;
  dispatch_sync(v4, block);
  objc_msgSend((id)objc_msgSend(v2, "URLByDeletingLastPathComponent"), "getFileSystemRepresentation:maxLength:", *(void *)(a1 + 208), 1024);
  -[BWAudioFileSinkNode _setupMinFreeDiskSpace](a1);
  uint64_t v5 = -[BWAudioFileSinkNode _applyRecordingLimits](a1);
  if (v5) {
    goto LABEL_32;
  }
  uint64_t v5 = CMByteStreamCreateForFileURL();
  if (v5) {
    goto LABEL_32;
  }
  uint64_t v6 = (void *)[*(id *)(a1 + 216) outputFileType];
  if ([v6 isEqual:@"com.apple.coreaudio-format"])
  {
    uint64_t v7 = (uint64_t *)MEMORY[0x1E4F32C40];
  }
  else if (([v6 isEqual:@"public.aiff-audio"] & 1) != 0 {
         || ([v6 isEqual:@"public.aifc-audio"] & 1) != 0)
  }
  {
    uint64_t v7 = (uint64_t *)MEMORY[0x1E4F32C28];
  }
  else if ([v6 isEqual:@"com.microsoft.waveform-audio"])
  {
    uint64_t v7 = (uint64_t *)MEMORY[0x1E4F32C68];
  }
  else
  {
    if (![v6 isEqual:@"org.3gpp.adaptive-multi-rate-audio"]) {
      goto LABEL_30;
    }
    uint64_t v7 = (uint64_t *)MEMORY[0x1E4F32C30];
  }
  uint64_t v8 = *v7;
  if (!v8)
  {
LABEL_30:
    fig_log_get_emitter();
    FigDebugAssert3();
    return 4294954516;
  }
  uint64_t v16 = *MEMORY[0x1E4F32C18];
  v17[0] = v8;
  [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
  uint64_t v5 = FigAudioFileFormatWriterCreateWithByteStream();
  if (v5 || (CMNotificationCenterGetDefaultLocalCenter(), uint64_t v5 = CMNotificationCenterAddListener(), v5))
  {
LABEL_32:
    uint64_t v13 = v5;
    fig_log_get_emitter();
    goto LABEL_24;
  }
  uint64_t v9 = *(void *)(a1 + 184);
  uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v10) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0;
  }
  uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, void, unint64_t))(v11 + 8);
  if (!v12)
  {
    uint64_t v13 = 4294954514;
LABEL_23:
    fig_log_get_emitter();
LABEL_24:
    FigDebugAssert3();
    return v13;
  }
  uint64_t v13 = v12(v9, 1936684398, 0, a1 + 200);
  if (v13) {
    goto LABEL_23;
  }
  return v13;
}

size_t __52__BWAudioFileSinkNode__updateFilePropertiesForSbuf___block_invoke(uint64_t a1)
{
  memset(&v10, 0, sizeof(v10));
  CMSampleBufferGetDuration(&v10, *(CMSampleBufferRef *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 32) + 248;
  long long v3 = *(_OWORD *)v2;
  lhs.epoch = *(void *)(*(void *)(a1 + 32) + 264);
  *(_OWORD *)&lhs.value = v3;
  CMTime v7 = v10;
  CMTimeAdd(&v9, &lhs, &v7);
  long long v4 = *(_OWORD *)&v9.value;
  *(void *)(v2 + 16) = v9.epoch;
  *(_OWORD *)uint64_t v2 = v4;
  DataBuffer = CMSampleBufferGetDataBuffer(*(CMSampleBufferRef *)(a1 + 40));
  size_t result = CMBlockBufferGetDataLength(DataBuffer);
  *(void *)(*(void *)(a1 + 32) + 272) += result;
  return result;
}

- (unint64_t)_setupMinFreeDiskSpace
{
  if (result)
  {
    unint64_t v1 = result;
    if (_setupMinFreeDiskSpace_onceToken != -1) {
      dispatch_once(&_setupMinFreeDiskSpace_onceToken, &__block_literal_global_38);
    }
    *(void *)(v1 + 280) = _setupMinFreeDiskSpace_sSystemMinFreeDiskSpace;
    size_t result = [*(id *)(v1 + 216) minFreeDiskSpaceLimit];
    if (result > _setupMinFreeDiskSpace_sSystemMinFreeDiskSpace)
    {
      size_t result = [*(id *)(v1 + 216) minFreeDiskSpaceLimit];
      *(void *)(v1 + 280) = result;
    }
  }
  return result;
}

void __45__BWAudioFileSinkNode__setupMinFreeDiskSpace__block_invoke()
{
  v0 = (void *)MGCopyAnswer();
  if (v0)
  {
    id v1 = v0;
    _setupMinFreeDiskSpace_sSystemMinFreeDiskSpace = objc_msgSend((id)objc_msgSend(v0, "objectForKeyedSubscript:", *MEMORY[0x1E4FBA0E0]), "longLongValue");
  }
}

__n128 __39__BWAudioFileSinkNode__setupFileWriter__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32) + 248;
  uint64_t v2 = MEMORY[0x1E4F1FA48];
  __n128 result = *(__n128 *)MEMORY[0x1E4F1FA48];
  *(_OWORD *)uint64_t v1 = *MEMORY[0x1E4F1FA48];
  *(void *)(v1 + 16) = *(void *)(v2 + 16);
  *(void *)(*(void *)(a1 + 32) + 272) = 0;
  return result;
}

- (uint64_t)_teardownFileWriter
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = *(void *)(a1 + 184);
  if (v2)
  {
    if (*(unsigned char *)(a1 + 204))
    {
      uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v3) {
        uint64_t v4 = v3;
      }
      else {
        uint64_t v4 = 0;
      }
      uint64_t v5 = *(unsigned int (**)(uint64_t, long long *))(v4 + 64);
      if (!v5 || (long long v14 = *MEMORY[0x1E4F1F9F8], v15 = *(void *)(MEMORY[0x1E4F1F9F8] + 16), v5(v2, &v14)))
      {
        fig_log_get_emitter();
        FigDebugAssert3();
      }
      *(unsigned char *)(a1 + 204) = 0;
    }
    CMNotificationCenterGetDefaultLocalCenter();
    if (CMNotificationCenterRemoveListener())
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    uint64_t FigBaseObject = FigFormatWriterGetFigBaseObject();
    if (FigBaseObject)
    {
      uint64_t v7 = FigBaseObject;
      uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v8) {
        uint64_t v9 = v8;
      }
      else {
        uint64_t v9 = 0;
      }
      CMTime v10 = *(uint64_t (**)(uint64_t))(v9 + 24);
      if (v10)
      {
        uint64_t v2 = v10(v7);
        if (!v2)
        {
LABEL_23:
          uint64_t v11 = *(const void **)(a1 + 184);
          if (v11)
          {
            CFRelease(v11);
            *(void *)(a1 + 184) = 0;
          }
          uint64_t v12 = *(const void **)(a1 + 192);
          if (v12)
          {
            CFRelease(v12);
            *(void *)(a1 + 192) = 0;
          }
          return v2;
        }
      }
      else
      {
        uint64_t v2 = 4294954514;
      }
    }
    else
    {
      uint64_t v2 = 4294954516;
    }
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_23;
  }
  return v2;
}

@end