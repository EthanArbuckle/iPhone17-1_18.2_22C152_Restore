@interface BWStillImageBufferRouterNode
+ (void)initialize;
- (BWNodeOutput)HDROutput;
- (BWNodeOutput)SISOutput;
- (BWNodeOutput)bravoTelephotoOutput;
- (BWNodeOutput)defaultOutput;
- (BWNodeOutput)pearlInfraredOutput;
- (BWStillImageBufferRouterNode)initWithInputPortTypes:(id)a3 HDRSupported:(BOOL)a4 SISSupported:(BOOL)a5 GNRSISSupported:(BOOL)a6 LTMHDRSupported:(BOOL)a7 depthDataDeliveryEnabled:(BOOL)a8;
- (id)inputForPortType:(id)a3;
- (id)nodeSubType;
- (id)nodeType;
- (uint64_t)_outputForInput:(void *)a3 resolvedStillImageCaptureSettings:(void *)a4 metadata:;
- (void)_defaultOutputsForInput:(uint64_t)a1;
- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)didSelectFormat:(id)a3 forInput:(id)a4;
- (void)handleNodeError:(id)a3 forInput:(id)a4;
- (void)handleStillImagePrewarmWithSettings:(id)a3 forInput:(id)a4;
- (void)handleStillImageReferenceFrameBracketedCaptureSequenceNumber:(int)a3 forInput:(id)a4;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
@end

@implementation BWStillImageBufferRouterNode

+ (void)initialize
{
}

- (BWStillImageBufferRouterNode)initWithInputPortTypes:(id)a3 HDRSupported:(BOOL)a4 SISSupported:(BOOL)a5 GNRSISSupported:(BOOL)a6 LTMHDRSupported:(BOOL)a7 depthDataDeliveryEnabled:(BOOL)a8
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  v44.receiver = self;
  v44.super_class = (Class)BWStillImageBufferRouterNode;
  v14 = [(BWNode *)&v44 init];
  if (v14)
  {
    v14->_inputPortTypes = (NSArray *)a3;
    int v15 = [a3 containsObject:*MEMORY[0x1E4F52DD8]];
    if (v15) {
      LOBYTE(v15) = [a3 containsObject:*MEMORY[0x1E4F52DF0]];
    }
    v14->_usingBravoDevice = v15;
    int v16 = [a3 containsObject:*MEMORY[0x1E4F52DF8]];
    if (v16) {
      LOBYTE(v16) = [a3 containsObject:*MEMORY[0x1E4F52E00]];
    }
    v14->_usingPearlDevice = v16;
    v14->_HDRSupported = a4;
    v14->_SISSupported = a5;
    v14->_GNRSISSupported = a6;
    v14->_LTMHDRSupported = a7;
    v17 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id obj = a3;
    uint64_t v18 = [a3 countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      int v20 = 0;
      uint64_t v21 = *(void *)v41;
      do
      {
        uint64_t v22 = 0;
        uint64_t v23 = v20;
        do
        {
          if (*(void *)v41 != v21) {
            objc_enumerationMutation(obj);
          }
          v24 = *(void **)(*((void *)&v40 + 1) + 8 * v22);
          v25 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v14 index:v23 + v22];
          v26 = objc_alloc_init(BWVideoFormatRequirements);
          [(BWNodeInput *)v25 setFormatRequirements:v26];

          [(BWNodeInput *)v25 setPassthroughMode:1];
          [(BWNodeInput *)v25 setRetainedBufferCount:0];
          [(BWNodeInput *)v25 setName:BWPortTypeToDisplayString(v24, v27)];
          [(BWNode *)v14 addInput:v25];
          [v17 setObject:v25 forKeyedSubscript:v24];

          ++v22;
        }
        while (v19 != v22);
        uint64_t v19 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
        int v20 = v23 + v22;
      }
      while (v19);
    }
    v14->_portTypeToInput = (NSDictionary *)[v17 copy];
    v28 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v14];
    v29 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWNodeOutput *)v28 setFormatRequirements:v29];

    [(BWNodeOutput *)v28 setPassthroughMode:1];
    [(BWNodeOutput *)v28 setIndexOfInputWhichDrivesThisOutput:0];
    [(BWNodeOutput *)v28 setName:@"Default"];
    [(BWNode *)v14 addOutput:v28];
    v14->_defaultOutput = v28;

    if (v14->_HDRSupported && !v14->_LTMHDRSupported && !a8)
    {
      v30 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v14];
      v31 = objc_alloc_init(BWVideoFormatRequirements);
      [(BWNodeOutput *)v30 setFormatRequirements:v31];

      [(BWNodeOutput *)v30 setPassthroughMode:1];
      [(BWNodeOutput *)v30 setIndexOfInputWhichDrivesThisOutput:0];
      [(BWNodeOutput *)v30 setName:@"Legacy HDR"];
      [(BWNode *)v14 addOutput:v30];
      v14->_HDROutput = v30;
    }
    if (v14->_SISSupported && !v14->_GNRSISSupported)
    {
      v32 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v14];
      v33 = objc_alloc_init(BWVideoFormatRequirements);
      [(BWNodeOutput *)v32 setFormatRequirements:v33];

      [(BWNodeOutput *)v32 setPassthroughMode:1];
      [(BWNodeOutput *)v32 setIndexOfInputWhichDrivesThisOutput:0];
      [(BWNodeOutput *)v32 setName:@"Legacy SIS/OIS"];
      [(BWNode *)v14 addOutput:v32];
      v14->_SISOutput = v32;
    }
    if (v14->_usingBravoDevice)
    {
      v34 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v14];
      v35 = objc_alloc_init(BWVideoFormatRequirements);
      [(BWNodeOutput *)v34 setFormatRequirements:v35];

      [(BWNodeOutput *)v34 setPassthroughMode:1];
      -[BWNodeOutput setIndexOfInputWhichDrivesThisOutput:](v34, "setIndexOfInputWhichDrivesThisOutput:", [obj indexOfObject:*MEMORY[0x1E4F52DF0]]);
      [(BWNodeOutput *)v34 setName:@"Bravo Telephoto"];
      [(BWNode *)v14 addOutput:v34];
      v14->_bravoTelephotoOutput = v34;
    }
    if (v14->_usingPearlDevice)
    {
      v36 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v14];
      v37 = objc_alloc_init(BWVideoFormatRequirements);
      [(BWNodeOutput *)v36 setFormatRequirements:v37];

      [(BWNodeOutput *)v36 setPassthroughMode:1];
      -[BWNodeOutput setIndexOfInputWhichDrivesThisOutput:](v36, "setIndexOfInputWhichDrivesThisOutput:", [obj indexOfObject:*MEMORY[0x1E4F52E00]]);
      [(BWNodeOutput *)v36 setName:@"Pearl IR / Depth"];
      [(BWNode *)v14 addOutput:v36];
      v14->_pearlInfraredOutput = v36;
    }
  }
  return v14;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWStillImageBufferRouterNode;
  [(BWNode *)&v3 dealloc];
}

- (id)nodeType
{
  return @"Coordinator";
}

- (id)nodeSubType
{
  return @"StillImageBufferRouter";
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!objc_msgSend(a4, "index", a3))
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v6 = [(BWNode *)self outputs];
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
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "setFormat:", objc_msgSend(a4, "format"));
        }
        while (v8 != v10);
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
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
    v6 = [(BWNode *)self outputs];
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
  uint64_t v6 = (void *)CMGetAttachment(a3, @"BWStillImageCaptureSettings", 0);
  uint64_t v7 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  long long v9 = (void *)-[BWStillImageBufferRouterNode _outputForInput:resolvedStillImageCaptureSettings:metadata:]((uint64_t)self, v8, v6, v7);
  if (v9)
  {
    [v9 emitSampleBuffer:a3];
  }
}

- (uint64_t)_outputForInput:(void *)a3 resolvedStillImageCaptureSettings:(void *)a4 metadata:
{
  if (result)
  {
    uint64_t v6 = result;
    uint64_t v7 = (void *)[a4 objectForKeyedSubscript:*MEMORY[0x1E4F54128]];
    uint64_t v8 = (void *)[a3 captureStreamSettingsForPortType:v7];
    if ([v8 validBracketedCaptureSequenceNumbers])
    {
      char v9 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F54138]), "BOOLValue");
      uint64_t v10 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F53D38]), "intValue");
      long long v11 = (v9 & 1) != 0 ? &unk_1EFAFFCA8 : (void *)[NSNumber numberWithInt:v10];
      if (!objc_msgSend((id)objc_msgSend(v8, "validBracketedCaptureSequenceNumbers"), "containsObject:", v11))return 0; {
    }
      }
    __int16 v12 = [a3 captureFlags];
    unsigned int v13 = [a3 captureType];
    result = 0;
    if (v13 <= 0xC)
    {
      if (((1 << v13) & 0x1DC6) != 0)
      {
        int v14 = *(unsigned __int8 *)(v6 + 96);
        goto LABEL_10;
      }
      if (((1 << v13) & 0x30) != 0)
      {
        if (*(unsigned char *)(v6 + 96) && ([v7 isEqualToString:*MEMORY[0x1E4F52DF0]] & 1) != 0) {
          goto LABEL_12;
        }
        if (*(unsigned char *)(v6 + 97) && ([v7 isEqualToString:*MEMORY[0x1E4F52E00]] & 1) != 0) {
          goto LABEL_15;
        }
        uint64_t v16 = 136;
        goto LABEL_22;
      }
      if (v13 == 3)
      {
        int v17 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F54138]), "BOOLValue");
        if ((v12 & 0x400) != 0)
        {
          int v18 = v17;
          uint64_t v19 = (void *)[a4 objectForKeyedSubscript:*MEMORY[0x1E4F53450]];
          if (v19)
          {
            [v19 doubleValue];
            BOOL v21 = v20 == 0.0;
          }
          else
          {
            BOOL v21 = 0;
          }
          if ((v18 | v21) == 1)
          {
            int v22 = [v7 isEqualToString:*MEMORY[0x1E4F52DD8]];
            int v15 = &OBJC_IVAR___BWStillImageBufferRouterNode__bravoTelephotoOutput;
            if (v22) {
              int v15 = &OBJC_IVAR___BWStillImageBufferRouterNode__defaultOutput;
            }
          }
          else
          {
            int v15 = &OBJC_IVAR___BWStillImageBufferRouterNode__HDROutput;
          }
          return *(void *)(v6 + *v15);
        }
        int v14 = *(unsigned __int8 *)(v6 + 96);
        if ((v12 & 0x800) != 0)
        {
LABEL_10:
          if (v14 && ([v7 isEqualToString:*MEMORY[0x1E4F52DF0]] & 1) != 0) {
            goto LABEL_12;
          }
          if (*(unsigned char *)(v6 + 97) && ([v7 isEqualToString:*MEMORY[0x1E4F52E00]] & 1) != 0)
          {
LABEL_15:
            int v15 = &OBJC_IVAR___BWStillImageBufferRouterNode__pearlInfraredOutput;
            return *(void *)(v6 + *v15);
          }
LABEL_23:
          int v15 = &OBJC_IVAR___BWStillImageBufferRouterNode__defaultOutput;
          return *(void *)(v6 + *v15);
        }
        if (!*(unsigned char *)(v6 + 96) || ![v7 isEqualToString:*MEMORY[0x1E4F52DF0]])
        {
          if (*(unsigned char *)(v6 + 97) && ([v7 isEqualToString:*MEMORY[0x1E4F52E00]] & 1) != 0) {
            goto LABEL_15;
          }
          uint64_t v16 = 128;
LABEL_22:
          result = *(void *)(v6 + v16);
          if (result) {
            return result;
          }
          goto LABEL_23;
        }
        result = *(void *)(v6 + 128);
        if (!result)
        {
LABEL_12:
          int v15 = &OBJC_IVAR___BWStillImageBufferRouterNode__bravoTelephotoOutput;
          return *(void *)(v6 + *v15);
        }
      }
    }
  }
  return result;
}

- (void)handleStillImageReferenceFrameBracketedCaptureSequenceNumber:(int)a3 forInput:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = -[BWStillImageBufferRouterNode _defaultOutputsForInput:]((uint64_t)self, a4);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "emitStillImageReferenceFrameBracketedCaptureSequenceNumberMessageWithSequenceNumber:", v4, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_defaultOutputsForInput:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  objc_super v3 = objc_msgSend(*(id *)(a1 + 104), "objectAtIndexedSubscript:", objc_msgSend(a2, "index"));
  uint64_t v4 = (void *)[MEMORY[0x1E4F1CA48] array];
  if (*(unsigned char *)(a1 + 96) && [v3 isEqualToString:*MEMORY[0x1E4F52DF0]])
  {
    uint64_t v5 = 144;
LABEL_8:
    uint64_t v6 = *(void *)(a1 + v5);
LABEL_12:
    [v4 addObject:v6];
    return v4;
  }
  if (*(unsigned char *)(a1 + 97) && [v3 isEqualToString:*MEMORY[0x1E4F52E00]])
  {
    uint64_t v5 = 152;
    goto LABEL_8;
  }
  [v4 addObject:*(void *)(a1 + 120)];
  if (*(void *)(a1 + 128)) {
    objc_msgSend(v4, "addObject:");
  }
  uint64_t v6 = *(void *)(a1 + 136);
  if (v6) {
    goto LABEL_12;
  }
  return v4;
}

- (void)handleStillImagePrewarmWithSettings:(id)a3 forInput:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = -[BWStillImageBufferRouterNode _defaultOutputsForInput:]((uint64_t)self, a4);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "emitStillImagePrewarmMessageWithSettings:", a3, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = -[BWStillImageBufferRouterNode _defaultOutputsForInput:]((uint64_t)self, a4);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "emitNodeError:", a3, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)inputForPortType:(id)a3
{
  return [(NSDictionary *)self->_portTypeToInput objectForKeyedSubscript:a3];
}

- (BWNodeOutput)defaultOutput
{
  return self->_defaultOutput;
}

- (BWNodeOutput)HDROutput
{
  return self->_HDROutput;
}

- (BWNodeOutput)SISOutput
{
  return self->_SISOutput;
}

- (BWNodeOutput)bravoTelephotoOutput
{
  return self->_bravoTelephotoOutput;
}

- (BWNodeOutput)pearlInfraredOutput
{
  return self->_pearlInfraredOutput;
}

@end