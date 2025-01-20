@interface BWStillImageMultiCameraDoserNode
+ (void)initialize;
- (BWStillImageMultiCameraDoserNode)initWithPortTypes:(id)a3;
- (id)_outputForNodeInputIndex:(id *)result;
- (id)nodeSubType;
- (id)nodeType;
- (uint64_t)_clearCaptureRequestState;
- (uint64_t)_emitStashedObjectsIfReady;
- (unint64_t)_configureCaptureRequestStateWithRequestedStillImageCaptureSettings:(void *)a3 resolvedStillImageCaptureSettings:;
- (unint64_t)outputIndexForPortType:(id)a3;
- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)didSelectFormat:(id)a3 forInput:(id)a4;
- (void)handleNodeError:(id)a3 forInput:(id)a4;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
@end

@implementation BWStillImageMultiCameraDoserNode

+ (void)initialize
{
}

- (BWStillImageMultiCameraDoserNode)initWithPortTypes:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)BWStillImageMultiCameraDoserNode;
  v4 = [(BWNode *)&v13 init];
  if (v4)
  {
    v4->_portTypes = (NSArray *)[a3 copy];
    v4->_currentSettingsID = -1;
    v4->_inputIndicesForWhichDosingIsPerformed = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v4->_stashedObjectsByInputIndex = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if ([a3 count])
    {
      unint64_t v5 = 0;
      unint64_t v6 = 0;
      do
      {
        id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        [(NSMutableArray *)v4->_stashedObjectsByInputIndex addObject:v7];

        v8 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v4 index:v5];
        v9 = objc_alloc_init(BWVideoFormatRequirements);
        [(BWNodeInput *)v8 setFormatRequirements:v9];

        [(BWNodeInput *)v8 setPassthroughMode:1];
        [(BWNodeInput *)v8 setRetainedBufferCount:1];
        [(BWNode *)v4 addInput:v8];

        v10 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v4];
        v11 = objc_alloc_init(BWVideoFormatRequirements);
        [(BWNodeOutput *)v10 setFormatRequirements:v11];
        [(BWNodeOutput *)v10 setPassthroughMode:1];
        [(BWNodeOutput *)v10 setIndexOfInputWhichDrivesThisOutput:v6];

        [(BWNode *)v4 addOutput:v10];
        unint64_t v5 = (v6 + 1);
        unint64_t v6 = v5;
      }
      while ([a3 count] > v5);
    }
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWStillImageMultiCameraDoserNode;
  [(BWNode *)&v3 dealloc];
}

- (id)nodeType
{
  return @"Synchronizer";
}

- (id)nodeSubType
{
  return @"StillImageMultiCameraDoser";
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  unint64_t v5 = -[BWStillImageMultiCameraDoserNode _outputForNodeInputIndex:]((id *)&self->super.super.isa, [a4 index]);
  [v5 setFormat:a3];
}

- (id)_outputForNodeInputIndex:(id *)result
{
  if (result)
  {
    objc_super v3 = result;
    v4 = (void *)[result outputs];
    uint64_t v5 = objc_msgSend(v3, "outputIndexForPortType:", objc_msgSend(v3[12], "objectAtIndexedSubscript:", a2));
    return (id *)[v4 objectAtIndexedSubscript:v5];
  }
  return result;
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
    unint64_t v6 = [(BWNode *)self outputs];
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
  uint64_t v7 = (void *)CMGetAttachment(a3, @"StillImageSettings", 0);
  if ([v7 settingsID] != self->_currentSettingsID)
  {
    uint64_t v8 = (void *)CMGetAttachment(a3, @"BWStillImageCaptureSettings", 0);
    -[BWStillImageMultiCameraDoserNode _configureCaptureRequestStateWithRequestedStillImageCaptureSettings:resolvedStillImageCaptureSettings:]((unint64_t)self, v7, v8);
  }
  if (-[NSMutableArray containsObject:](self->_inputIndicesForWhichDosingIsPerformed, "containsObject:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a4, "index"))))
  {
    objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_stashedObjectsByInputIndex, "objectAtIndexedSubscript:", objc_msgSend(a4, "index")), "addObject:", a3);
    -[BWStillImageMultiCameraDoserNode _emitStashedObjectsIfReady]((uint64_t)self);
  }
  else
  {
    long long v9 = -[BWStillImageMultiCameraDoserNode _outputForNodeInputIndex:]((id *)&self->super.super.isa, [a4 index]);
    [v9 emitSampleBuffer:a3];
  }
}

- (unint64_t)_configureCaptureRequestStateWithRequestedStillImageCaptureSettings:(void *)a3 resolvedStillImageCaptureSettings:
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v5 = result;
    -[BWStillImageMultiCameraDoserNode _clearCaptureRequestState](result);
    *(void *)(v5 + 104) = [a2 settingsID];
    if ((unint64_t)objc_msgSend((id)objc_msgSend(a3, "captureStreamSettings"), "count") >= 2)
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      uint64_t v6 = objc_msgSend(a3, "captureStreamSettings", 0);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v15;
        while (2)
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v15 != v9) {
              objc_enumerationMutation(v6);
            }
            long long v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
            if ([v11 hasValidFrames])
            {
              uint64_t v12 = [v11 portType];
              if (!v12) {
                return -[BWStillImageMultiCameraDoserNode _clearCaptureRequestState](v5);
              }
              uint64_t v13 = [*(id *)(v5 + 96) indexOfObject:v12];
              if (v13 == 0x7FFFFFFFFFFFFFFFLL) {
                return -[BWStillImageMultiCameraDoserNode _clearCaptureRequestState](v5);
              }
              objc_msgSend(*(id *)(v5 + 112), "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v13));
            }
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
          if (v8) {
            continue;
          }
          break;
        }
      }
    }
    result = [*(id *)(v5 + 112) count];
    if (result <= 1) {
      return [*(id *)(v5 + 112) removeAllObjects];
    }
  }
  return result;
}

- (uint64_t)_emitStashedObjectsIfReady
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v2 = *(void **)(result + 112);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (!v3) {
      goto LABEL_10;
    }
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v22;
    LOBYTE(v6) = 1;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v22 != v5) {
          objc_enumerationMutation(v2);
        }
        int v6 = (objc_msgSend((id)objc_msgSend(*(id *)(v1 + 120), "objectAtIndexedSubscript:", (int)objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v7++), "intValue")), "count") != 0) & v6;
      }
      while (v4 != v7);
      result = [v2 countByEnumeratingWithState:&v21 objects:v26 count:16];
      uint64_t v4 = result;
    }
    while (result);
    if (v6)
    {
LABEL_10:
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      uint64_t v8 = *(void **)(v1 + 112);
      result = [v8 countByEnumeratingWithState:&v17 objects:v25 count:16];
      if (result)
      {
        uint64_t v9 = result;
        uint64_t v10 = *(void *)v18;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v18 != v10) {
              objc_enumerationMutation(v8);
            }
            uint64_t v12 = [*(id *)(*((void *)&v17 + 1) + 8 * v11) intValue];
            uint64_t v13 = (void *)[*(id *)(v1 + 120) objectAtIndexedSubscript:v12];
            id v14 = (id)[v13 firstObject];
            [v13 removeObjectAtIndex:0];
            long long v15 = objc_msgSend((id)objc_msgSend((id)v1, "outputs"), "objectAtIndexedSubscript:", objc_msgSend((id)v1, "outputIndexForPortType:", objc_msgSend(*(id *)(v1 + 96), "objectAtIndexedSubscript:", v12)));
            CFTypeID v16 = CFGetTypeID(v14);
            if (CMSampleBufferGetTypeID() == v16) {
              [v15 emitSampleBuffer:v14];
            }
            else {
              [v15 emitNodeError:v14];
            }

            ++v11;
          }
          while (v9 != v11);
          result = [v8 countByEnumeratingWithState:&v17 objects:v25 count:16];
          uint64_t v9 = result;
        }
        while (result);
      }
    }
  }
  return result;
}

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "stillImageSettings"), "requestedSettings"), "settingsID") != self->_currentSettingsID) {
    -[BWStillImageMultiCameraDoserNode _configureCaptureRequestStateWithRequestedStillImageCaptureSettings:resolvedStillImageCaptureSettings:]((unint64_t)self, objc_msgSend((id)objc_msgSend(a3, "stillImageSettings"), "requestedSettings"), objc_msgSend((id)objc_msgSend(a3, "stillImageSettings"), "captureSettings"));
  }
  if (-[NSMutableArray containsObject:](self->_inputIndicesForWhichDosingIsPerformed, "containsObject:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a4, "index"))))
  {
    objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_stashedObjectsByInputIndex, "objectAtIndexedSubscript:", objc_msgSend(a4, "index")), "addObject:", a3);
    -[BWStillImageMultiCameraDoserNode _emitStashedObjectsIfReady]((uint64_t)self);
  }
  else
  {
    uint64_t v7 = -[BWStillImageMultiCameraDoserNode _outputForNodeInputIndex:]((id *)&self->super.super.isa, [a4 index]);
    [v7 emitNodeError:a3];
  }
}

- (unint64_t)outputIndexForPortType:(id)a3
{
  return [(NSArray *)self->_portTypes indexOfObject:a3];
}

- (uint64_t)_clearCaptureRequestState
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    [*(id *)(result + 112) removeAllObjects];
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    v2 = *(void **)(v1 + 120);
    result = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    if (result)
    {
      uint64_t v3 = result;
      uint64_t v4 = *(void *)v8;
      do
      {
        uint64_t v5 = 0;
        do
        {
          if (*(void *)v8 != v4) {
            objc_enumerationMutation(v2);
          }
          int v6 = *(void **)(*((void *)&v7 + 1) + 8 * v5);
          [v6 count];
          [v6 removeAllObjects];
          ++v5;
        }
        while (v3 != v5);
        result = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
        uint64_t v3 = result;
      }
      while (result);
    }
  }
  return result;
}

@end