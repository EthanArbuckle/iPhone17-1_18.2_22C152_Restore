@interface BWStillImageTimeMachineFrameCoordinatorNode
+ (void)initialize;
- (BWStillImageTimeMachineFrameCoordinatorNode)initWithPortTypes:(id)a3;
- (id)_handleSampleBuffer:(id *)result;
- (id)inputForPortType:(id)a3;
- (id)nodeSubType;
- (id)nodeType;
- (id)outputForPortType:(id)a3;
- (uint64_t)_isCaptureComplete;
- (uint64_t)_setupStillImageCaptureStateWithResolvedStillImageCaptureSettings:(uint64_t)result;
- (void)_resetStillImageCaptureState;
- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)didSelectFormat:(id)a3 forInput:(id)a4;
- (void)handleDroppedSample:(id)a3 forInput:(id)a4;
- (void)handleNodeError:(id)a3 forInput:(id)a4;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
@end

@implementation BWStillImageTimeMachineFrameCoordinatorNode

+ (void)initialize
{
}

- (BWStillImageTimeMachineFrameCoordinatorNode)initWithPortTypes:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)BWStillImageTimeMachineFrameCoordinatorNode;
  v4 = [(BWNode *)&v14 init];
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if ([a3 count])
    {
      unint64_t v7 = 0;
      do
      {
        uint64_t v8 = [a3 objectAtIndexedSubscript:v7];
        v9 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v4 index:v7];
        v10 = objc_alloc_init(BWVideoFormatRequirements);
        [(BWNodeInput *)v9 setFormatRequirements:v10];

        [(BWNodeInput *)v9 setPassthroughMode:1];
        [(BWNode *)v4 addInput:v9];
        [v5 setObject:v9 forKeyedSubscript:v8];

        v11 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v4];
        v12 = objc_alloc_init(BWVideoFormatRequirements);
        [(BWNodeOutput *)v11 setFormatRequirements:v12];
        [(BWNodeOutput *)v11 setPassthroughMode:1];
        [(BWNodeOutput *)v11 setIndexOfInputWhichDrivesThisOutput:v7];

        [(BWNode *)v4 addOutput:v11];
        [v6 setObject:v11 forKeyedSubscript:v8];

        ++v7;
      }
      while ([a3 count] > v7);
    }
    v4->_portTypeToInput = (NSDictionary *)[v5 copy];

    v4->_portTypeToOutput = (NSDictionary *)[v6 copy];
  }
  return v4;
}

- (void)dealloc
{
  -[BWStillImageTimeMachineFrameCoordinatorNode _resetStillImageCaptureState]((uint64_t)self);

  v3.receiver = self;
  v3.super_class = (Class)BWStillImageTimeMachineFrameCoordinatorNode;
  [(BWNode *)&v3 dealloc];
}

- (void)_resetStillImageCaptureState
{
  if (a1)
  {

    *(void *)(a1 + 112) = 0;
    *(void *)(a1 + 120) = 0;
  }
}

- (id)inputForPortType:(id)a3
{
  return [(NSDictionary *)self->_portTypeToInput objectForKeyedSubscript:a3];
}

- (id)outputForPortType:(id)a3
{
  return [(NSDictionary *)self->_portTypeToOutput objectForKeyedSubscript:a3];
}

- (id)nodeType
{
  return @"Coordinator";
}

- (id)nodeSubType
{
  return @"StillImageFrameCoordinator";
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  id v5 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](self, "outputs"), "objectAtIndexedSubscript:", [a4 index]);
  [v5 setFormat:a3];
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (-[BWNode allInputsHaveReachedState:](self, "allInputsHaveReachedState:", 1, a4, a5))
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = [(BWNode *)self outputs];
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * v10++) makeConfiguredFormatLive];
        }
        while (v8 != v10);
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void)didReachEndOfDataForInput:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([(BWNode *)self allInputsHaveReachedState:0])
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    v4 = [(BWNode *)self outputs];
    uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v9 + 1) + 8 * v8++) markEndOfLiveOutput];
        }
        while (v6 != v8);
        uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  if (a3)
  {
    uint64_t v6 = (void *)CMGetAttachment(a3, @"BWStillImageCaptureSettings", 0);
    if (v6)
    {
      uint64_t v7 = v6;
      if (self->_currentResolvedStillImageCaptureSettings)
      {
        uint64_t v8 = [v6 settingsID];
        if (v8 != -[BWStillImageCaptureSettings settingsID](self->_currentResolvedStillImageCaptureSettings, "settingsID"))-[BWStillImageTimeMachineFrameCoordinatorNode _resetStillImageCaptureState]((uint64_t)self); {
        currentResolvedStillImageCaptureSettings = self->_currentResolvedStillImageCaptureSettings;
        }
        if (currentResolvedStillImageCaptureSettings) {
          goto LABEL_9;
        }
      }
      uint64_t v10 = -[BWStillImageTimeMachineFrameCoordinatorNode _setupStillImageCaptureStateWithResolvedStillImageCaptureSettings:]((uint64_t)self, v7);
      if (!v10)
      {
        currentResolvedStillImageCaptureSettings = self->_currentResolvedStillImageCaptureSettings;
LABEL_9:
        if (([(BWStillImageCaptureSettings *)currentResolvedStillImageCaptureSettings captureFlags] & 0x2000) != 0) {
          -[BWStillImageTimeMachineFrameCoordinatorNode _handleSampleBuffer:]((id *)&self->super.super.isa, a3);
        }
        else {
          [(BWNodeOutput *)self->super._output emitSampleBuffer:a3];
        }
        goto LABEL_12;
      }
      uint64_t v11 = v10;
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      uint64_t v11 = 4294954516;
    }
    CFTypeRef v12 = CMGetAttachment(a3, @"StillSettings", 0);
    id v13 = +[BWNodeError newError:v11 sourceNode:self stillImageSettings:v12 metadata:CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0)];
    [(BWNodeOutput *)self->super._output emitNodeError:v13];
  }
LABEL_12:
  if (self->_currentResolvedStillImageCaptureSettings
    && -[BWStillImageTimeMachineFrameCoordinatorNode _isCaptureComplete]((uint64_t)self))
  {
    -[BWStillImageTimeMachineFrameCoordinatorNode _resetStillImageCaptureState]((uint64_t)self);
  }
}

- (uint64_t)_setupStillImageCaptureStateWithResolvedStillImageCaptureSettings:(uint64_t)result
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    if (([a2 captureFlags] & 0x2000) != 0)
    {
      if ([a2 captureType] == 5
        || [a2 captureType] == 4
        || [a2 captureType] == 1)
      {
        *(void *)(v3 + 120) = a2;

        *(void *)(v3 + 112) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        long long v10 = 0u;
        long long v11 = 0u;
        long long v12 = 0u;
        long long v13 = 0u;
        v4 = objc_msgSend(*(id *)(v3 + 120), "captureStreamSettings", 0);
        result = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (result)
        {
          uint64_t v5 = result;
          uint64_t v6 = *(void *)v11;
          do
          {
            uint64_t v7 = 0;
            do
            {
              if (*(void *)v11 != v6) {
                objc_enumerationMutation(v4);
              }
              uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * v7);
              long long v9 = objc_alloc_init(BWStillImageCaptureStreamFrameCounts);
              v9->expectedTimeMachineFrames = [v8 expectedTimeMachineFrameCaptureCount];
              v9->expectedFrames = [v8 expectedFrameCaptureCount];
              objc_msgSend(*(id *)(v3 + 112), "setObject:forKeyedSubscript:", v9, objc_msgSend(v8, "portType"));
              ++v7;
            }
            while (v5 != v7);
            result = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
            uint64_t v5 = result;
          }
          while (result);
        }
      }
      else
      {
        return 4294954516;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)_handleSampleBuffer:(id *)result
{
  if (!result) {
    return result;
  }
  uint64_t v3 = result;
  v4 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  uint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F54128]];
  uint64_t v6 = (_DWORD *)[v3[14] objectForKeyedSubscript:v5];
  uint64_t v7 = [v3[15] captureStreamSettingsForPortType:v5];
  if (v6)
  {
    if ((int)v6[4] >= 1)
    {
      uint64_t v8 = (void *)v7;
      ++v6[3];
      if ((objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E4F54138]), "BOOLValue") & 1) == 0
        && (int)v6[4] >= 1)
      {
        uint64_t v9 = *MEMORY[0x1E4F53D38];
        uint64_t v10 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F53D38]];
        if (v10)
        {
          long long v11 = (void *)v10;
          int v12 = [v8 timeMachineFrameCount];
          uint64_t v13 = [v11 intValue] + v12;
LABEL_9:
          objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", v13), v9);
          goto LABEL_10;
        }
        uint64_t v13 = (v6[5] + 1);
        v6[5] = v13;
        if ([v3[15] captureType] != 1) {
          goto LABEL_9;
        }
      }
    }
  }
LABEL_10:
  uint64_t v14 = (void *)[v3[13] objectForKeyedSubscript:v5];
  return (id *)[v14 emitSampleBuffer:target];
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
    v1 = objc_msgSend(*(id *)(result + 112), "allValues", 0);
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

@end