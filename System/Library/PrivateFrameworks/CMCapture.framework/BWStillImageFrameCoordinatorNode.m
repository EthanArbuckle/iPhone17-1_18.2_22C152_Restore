@interface BWStillImageFrameCoordinatorNode
+ (void)initialize;
- (BWStillImageFrameCoordinatorNode)initWithNodeConfiguration:(id)a3 inputPortTypes:(id)a4 sensorRawInputPortTypes:(id)a5;
- (id)_handleSampleBuffer:(void *)a3 forInput:;
- (id)_handleZeroShutterLagSampleBuffer:(void *)a3 forInput:;
- (id)inputForPortType:(id)a3;
- (id)nodeSubType;
- (id)nodeType;
- (id)outputForPortType:(id)a3;
- (id)sensorRawInputForPortType:(id)a3;
- (id)sensorRawOutputForPortType:(id)a3;
- (uint64_t)_addMetadataVersionToMutableMetadata:(uint64_t)result;
- (uint64_t)_isCaptureComplete;
- (uint64_t)_setupStillImageCaptureStateWithStillImageSettings:(uint64_t)a1;
- (void)_deliverQueuedMessages;
- (void)_handleMessage:(id)a3 fromInput:(id)a4;
- (void)_resetStillImageCaptureState;
- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)didSelectFormat:(id)a3 forInput:(id)a4;
- (void)handleDroppedSample:(id)a3 forInput:(id)a4;
- (void)handleNodeError:(id)a3 forInput:(id)a4;
- (void)handleStillImagePrewarmWithSettings:(id)a3 forInput:(id)a4;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
@end

@implementation BWStillImageFrameCoordinatorNode

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  id v5 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](self, "outputs"), "objectAtIndexedSubscript:", [a4 index]);
  [v5 setFormat:a3];
}

- (id)nodeType
{
  return @"Coordinator";
}

- (void)_handleMessage:(id)a3 fromInput:(id)a4
{
  if (!self->_holdMessagesUntilAllInputsAreLive) {
    goto LABEL_4;
  }
  if ([(BWNode *)self allInputsHaveReachedState:1])
  {
    -[BWStillImageFrameCoordinatorNode _deliverQueuedMessages]((uint64_t)self);
LABEL_4:
    v8.receiver = self;
    v8.super_class = (Class)BWStillImageFrameCoordinatorNode;
    [(BWNode *)&v8 _handleMessage:a3 fromInput:a4];
    return;
  }
  [(NSMutableArray *)self->_queuedMessages addObject:a3];
  inputsForQueuedMessages = self->_inputsForQueuedMessages;
  [(NSMutableArray *)inputsForQueuedMessages addObject:a4];
}

- (id)outputForPortType:(id)a3
{
  return [(NSDictionary *)self->_portTypeToOutput objectForKeyedSubscript:a3];
}

- (id)sensorRawOutputForPortType:(id)a3
{
  return [(NSDictionary *)self->_portTypeToSensorRawOutput objectForKeyedSubscript:a3];
}

- (id)sensorRawInputForPortType:(id)a3
{
  return [(NSDictionary *)self->_portTypeToSensorRawInput objectForKeyedSubscript:a3];
}

- (id)inputForPortType:(id)a3
{
  return [(NSDictionary *)self->_portTypeToInput objectForKeyedSubscript:a3];
}

- (BWStillImageFrameCoordinatorNode)initWithNodeConfiguration:(id)a3 inputPortTypes:(id)a4 sensorRawInputPortTypes:(id)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  v49.receiver = self;
  v49.super_class = (Class)BWStillImageFrameCoordinatorNode;
  v7 = [(BWNode *)&v49 init];
  if (v7)
  {
    v7->_nodeConfiguration = (BWStillImageNodeConfiguration *)a3;
    v7->_holdMessagesUntilAllInputsAreLive = 1;
    v7->_queuedMessages = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7->_inputsForQueuedMessages = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    unint64_t v8 = 0x1E4F1C000uLL;
    v9 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    v39 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    uint64_t v10 = [a4 countByEnumeratingWithState:&v45 objects:v51 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      id obj = a4;
      int v12 = 0;
      uint64_t v13 = *(void *)v46;
      do
      {
        uint64_t v14 = 0;
        int v35 = v12;
        uint64_t v15 = v12;
        do
        {
          if (*(void *)v46 != v13) {
            objc_enumerationMutation(obj);
          }
          v16 = *(void **)(*((void *)&v45 + 1) + 8 * v14);
          v17 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v7 index:v15 + v14];
          v18 = objc_alloc_init(BWVideoFormatRequirements);
          [(BWNodeInput *)v17 setFormatRequirements:v18];

          [(BWNodeInput *)v17 setPassthroughMode:1];
          [(BWNodeInput *)v17 setName:BWPortTypeToDisplayString(v16, v19)];
          [(BWNode *)v7 addInput:v17];
          [v9 setObject:v17 forKeyedSubscript:v16];
          v20 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v7];
          v21 = objc_alloc_init(BWVideoFormatRequirements);
          [(BWNodeOutput *)v20 setFormatRequirements:v21];

          [(BWNodeOutput *)v20 setPassthroughMode:1];
          [(BWNodeOutput *)v20 setIndexOfInputWhichDrivesThisOutput:[(BWNodeInput *)v17 index]];
          [(BWNodeOutput *)v20 setName:BWPortTypeToDisplayString(v16, v22)];
          [(BWNode *)v7 addOutput:v20];
          [v39 setObject:v20 forKeyedSubscript:v16];

          ++v14;
        }
        while (v11 != v14);
        uint64_t v11 = [obj countByEnumeratingWithState:&v45 objects:v51 count:16];
        int v12 = v15 + v14;
      }
      while (v11);
      int v23 = v14 + v35;
      unint64_t v8 = 0x1E4F1C000;
    }
    else
    {
      int v23 = 0;
    }
    v7->_portTypeToInput = (NSDictionary *)[v9 copy];
    v7->_portTypeToOutput = (NSDictionary *)[v39 copy];
    v36 = (void *)[*(id *)(v8 + 2656) dictionary];
    id obja = (id)[*(id *)(v8 + 2656) dictionary];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    uint64_t v40 = [a5 countByEnumeratingWithState:&v41 objects:v50 count:16];
    if (v40)
    {
      uint64_t v34 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v40; ++i)
        {
          if (*(void *)v42 != v34) {
            objc_enumerationMutation(a5);
          }
          v25 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          v26 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v7 index:v23 + i];
          v27 = objc_alloc_init(BWVideoFormatRequirements);
          [(BWNodeInput *)v26 setFormatRequirements:v27];

          [(BWNodeInput *)v26 setPassthroughMode:1];
          -[BWNodeInput setName:](v26, "setName:", [NSString stringWithFormat:@"%@:%@", BWPortTypeToDisplayString(v25, v28), @"SensorRaw"]);
          [(BWNode *)v7 addInput:v26];
          [v36 setObject:v26 forKeyedSubscript:v25];
          v29 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v7];
          v30 = objc_alloc_init(BWVideoFormatRequirements);
          [(BWNodeOutput *)v29 setFormatRequirements:v30];

          [(BWNodeOutput *)v29 setPassthroughMode:1];
          [(BWNodeOutput *)v29 setIndexOfInputWhichDrivesThisOutput:[(BWNodeInput *)v26 index]];
          -[BWNodeInput setName:](v26, "setName:", [NSString stringWithFormat:@"%@:%@", BWPortTypeToDisplayString(v25, v31), @"SensorRaw"]);
          [(BWNode *)v7 addOutput:v29];
          [obja setObject:v29 forKeyedSubscript:v25];
        }
        v23 += i;
        uint64_t v40 = [a5 countByEnumeratingWithState:&v41 objects:v50 count:16];
      }
      while (v40);
    }
    v7->_portTypeToSensorRawInput = (NSDictionary *)[v36 copy];
    v7->_portTypeToSensorRawOutput = (NSDictionary *)[obja copy];
  }
  return v7;
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

- (void)dealloc
{
  -[BWStillImageFrameCoordinatorNode _resetStillImageCaptureState]((uint64_t)self);

  v3.receiver = self;
  v3.super_class = (Class)BWStillImageFrameCoordinatorNode;
  [(BWNode *)&v3 dealloc];
}

- (void)_resetStillImageCaptureState
{
  if (a1)
  {

    *(void *)(a1 + 136) = 0;
    *(void *)(a1 + 144) = 0;
  }
}

- (id)nodeSubType
{
  return @"StillImageFrameCoordinator";
}

- (void)_deliverQueuedMessages
{
  if (a1)
  {
    if ([*(id *)(a1 + 160) count])
    {
      unint64_t v2 = 0;
      do
      {
        uint64_t v3 = [*(id *)(a1 + 160) objectAtIndexedSubscript:v2];
        uint64_t v4 = [*(id *)(a1 + 168) objectAtIndexedSubscript:v2];
        v5.receiver = (id)a1;
        v5.super_class = (Class)BWStillImageFrameCoordinatorNode;
        objc_msgSendSuper2(&v5, sel__handleMessage_fromInput_, v3, v4);
        ++v2;
      }
      while (v2 < [*(id *)(a1 + 160) count]);
    }
    [*(id *)(a1 + 160) removeAllObjects];

    *(void *)(a1 + 160) = 0;
    [*(id *)(a1 + 168) removeAllObjects];

    *(void *)(a1 + 168) = 0;
    *(unsigned char *)(a1 + 152) = 0;
  }
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (-[BWNode allInputsHaveReachedState:](self, "allInputsHaveReachedState:", 1, a4, a5))
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v6 = [(BWNode *)self outputs];
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (![v11 liveFormat]) {
            [v11 makeConfiguredFormatLive];
          }
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

- (void)didReachEndOfDataForInput:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (dword_1E96B6AE8)
  {
    int v20 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (-[BWNode allInputsHaveReachedState:](self, "allInputsHaveReachedState:", 0, v11, v13))
  {
    if (dword_1E96B6AE8)
    {
      int v20 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      objc_super v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v6 = [(BWNode *)self outputs];
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v15 + 1) + 8 * i) markEndOfLiveOutput];
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
      }
      while (v8);
    }
  }
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  if (a3)
  {
    uint64_t v7 = (void *)CMGetAttachment(a3, @"StillSettings", 0);
    if (v7)
    {
      uint64_t v8 = v7;
      if (!self->_currentStillImageSettings) {
        goto LABEL_7;
      }
      uint64_t v9 = [v7 settingsID];
      if (v9 != [(BWStillImageSettings *)self->_currentStillImageSettings settingsID]) {
        -[BWStillImageFrameCoordinatorNode _resetStillImageCaptureState]((uint64_t)self);
      }
      currentStillImageSettings = self->_currentStillImageSettings;
      if (!currentStillImageSettings)
      {
LABEL_7:
        -[BWStillImageFrameCoordinatorNode _setupStillImageCaptureStateWithStillImageSettings:]((uint64_t)self, v8);
        currentStillImageSettings = self->_currentStillImageSettings;
      }
      if ((-[BWStillImageCaptureSettings captureFlags](-[BWStillImageSettings captureSettings](currentStillImageSettings, "captureSettings"), "captureFlags") & 0x2000) != 0)-[BWStillImageFrameCoordinatorNode _handleZeroShutterLagSampleBuffer:forInput:]((id *)&self->super.super.isa, a3, a4); {
      else
      }
        -[BWStillImageFrameCoordinatorNode _handleSampleBuffer:forInput:]((id *)&self->super.super.isa, a3, a4);
      if ((objc_msgSend((id)objc_msgSend(v8, "captureSettings"), "captureFlags") & 4) == 0)
      {
        CMRemoveAttachment(a3, (CFStringRef)*MEMORY[0x1E4F530E0]);
        CMRemoveAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53100]);
      }
    }
    else
    {
      id v11 = +[BWNodeError newError:4294954516 sourceNode:self stillImageSettings:0 metadata:CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0)];
      objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[BWNode outputs](self, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(a4, "index")), "emitNodeError:", v11);
    }
  }
  if (self->_currentStillImageSettings
    && -[BWStillImageFrameCoordinatorNode _isCaptureComplete]((uint64_t)self))
  {
    -[BWStillImageFrameCoordinatorNode _resetStillImageCaptureState]((uint64_t)self);
  }
}

- (uint64_t)_setupStillImageCaptureStateWithStillImageSettings:(uint64_t)a1
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    *(void *)(a1 + 144) = a2;

    *(void *)(a1 + 136) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v3 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 144), "captureSettings", 0), "captureStreamSettings");
    uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v13;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v13 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * v7);
          uint64_t v9 = objc_alloc_init(BWStillImageCaptureStreamFrameCounters);
          v9->expectedTimeMachineFrames = [v8 expectedTimeMachineFrameCaptureCount];
          if ([v8 adaptiveBracketingParameters]) {
            int v10 = 0x7FFFFFFF;
          }
          else {
            int v10 = [v8 expectedFrameCaptureCount];
          }
          v9->expectedFrames = v10;
          objc_msgSend(*(id *)(a1 + 136), "setObject:forKeyedSubscript:", v9, objc_msgSend(v8, "portType"));
          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v5);
    }
  }
  return 0;
}

- (id)_handleZeroShutterLagSampleBuffer:(void *)a3 forInput:
{
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    uint64_t v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F54128]];
    uint64_t v8 = (_DWORD *)[v5[17] objectForKeyedSubscript:v7];
    uint64_t v9 = objc_msgSend((id)objc_msgSend(v5[18], "captureSettings"), "captureStreamSettingsForPortType:", v7);
    if (!v8) {
      goto LABEL_9;
    }
    if ((int)v8[4] < 1) {
      goto LABEL_9;
    }
    int v10 = (void *)v9;
    ++v8[3];
    -[BWStillImageFrameCoordinatorNode _addMetadataVersionToMutableMetadata:]((uint64_t)v5, v6);
    if ((int)v8[4] < 1) {
      goto LABEL_9;
    }
    char v11 = objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E4F54138]), "BOOLValue");
    uint64_t v12 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F53D38]];
    result = (id *)[v10 isFrameCapturedForProcessing:target];
    int v13 = (int)result;
    if ((v11 & 1) == 0 && !v12)
    {
      [v5[15] objectForKeyedSubscript:v7];
      result = (id *)[v10 captureFlags];
      ++v8[5];
    }
    if (v13)
    {
LABEL_9:
      long long v14 = objc_msgSend((id)objc_msgSend(v5, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(a3, "index"));
      return (id *)[v14 emitSampleBuffer:target];
    }
  }
  return result;
}

- (id)_handleSampleBuffer:(void *)a3 forInput:
{
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    uint64_t v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F54128]];
    uint64_t v8 = [v5[17] objectForKeyedSubscript:v7];
    uint64_t v9 = objc_msgSend((id)objc_msgSend(v5[18], "captureSettings"), "captureStreamSettingsForPortType:", v7);
    -[BWStillImageFrameCoordinatorNode _addMetadataVersionToMutableMetadata:]((uint64_t)v5, v6);
    if (!v8) {
      goto LABEL_6;
    }
    int v10 = [v9 isFrameCapturedForProcessing:target];
    ++*(_DWORD *)(v8 + 12);
    result = (id *)BWIsLastAdaptiveBracketingFrame(target);
    if (result) {
      *(_DWORD *)(v8 + 8) = *(_DWORD *)(v8 + 12);
    }
    if (v10)
    {
LABEL_6:
      char v11 = objc_msgSend((id)objc_msgSend(v5, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(a3, "index"));
      return (id *)[v11 emitSampleBuffer:target];
    }
  }
  return result;
}

- (uint64_t)_isCaptureComplete
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    long long v8 = 0u;
    long long v9 = 0u;
    long long v6 = 0u;
    long long v7 = 0u;
    v1 = objc_msgSend(*(id *)(result + 136), "allValues", 0);
    uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    if (v2)
    {
      uint64_t v3 = v2;
      uint64_t v4 = *(void *)v7;
      while (2)
      {
        uint64_t v5 = 0;
        do
        {
          if (*(void *)v7 != v4) {
            objc_enumerationMutation(v1);
          }
          if (*(_DWORD *)(*(void *)(*((void *)&v6 + 1) + 8 * v5) + 12) != *(_DWORD *)(*(void *)(*((void *)&v6 + 1) + 8 * v5)
                                                                                           + 8))
            return 0;
          ++v5;
        }
        while (v3 != v5);
        uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
        if (v3) {
          continue;
        }
        break;
      }
    }
    return 1;
  }
  return result;
}

- (void)handleStillImagePrewarmWithSettings:(id)a3 forInput:(id)a4
{
  id v5 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](self, "outputs"), "objectAtIndexedSubscript:", [a4 index]);
  [v5 emitStillImagePrewarmMessageWithSettings:a3];
}

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
  id v5 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](self, "outputs"), "objectAtIndexedSubscript:", [a4 index]);
  [v5 emitNodeError:a3];
}

- (void)handleDroppedSample:(id)a3 forInput:(id)a4
{
  id v5 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](self, "outputs"), "objectAtIndexedSubscript:", [a4 index]);
  [v5 emitDroppedSample:a3];
}

- (uint64_t)_addMetadataVersionToMutableMetadata:(uint64_t)result
{
  if (result)
  {
    unsigned int v3 = [*(id *)(result + 96) stillImageProcessingMode];
    if (v3 >= 2)
    {
      if (v3 == 2) {
        uint64_t v4 = (__CFString *)[NSString stringWithFormat:@"Reprocessing%@", @"CameraCaptureStillImageMetadataVersion"];
      }
      else {
        uint64_t v4 = 0;
      }
    }
    else
    {
      uint64_t v4 = @"CameraCaptureStillImageMetadataVersion";
    }
    return [a2 setObject:&unk_1EFAFF5B8 forKeyedSubscript:v4];
  }
  return result;
}

@end