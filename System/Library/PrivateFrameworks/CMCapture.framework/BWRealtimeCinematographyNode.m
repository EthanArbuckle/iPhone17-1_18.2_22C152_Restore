@interface BWRealtimeCinematographyNode
+ (void)initialize;
- (BOOL)focusDetectionProviderEnabled;
- (BWNodeOutput)detectedObjectsOutput;
- (BWNodeOutput)movieFileOutput;
- (BWNodeOutput)previewOutput;
- (BWRealtimeCinematographyNode)initWithObjectMetadataIdentifiers:(id)a3 cachedSimulatedAperture:(float)a4 captureDevice:(id)a5 tuningParameters:(id)a6 videoDepthConfiguration:(id)a7 smartStyleLearningEnabled:(BOOL)a8 captureInputEnabled:(BOOL)a9;
- (NSData)globalMetadata;
- (NSString)cinematographyModelVersionString;
- (float)simulatedAperture;
- (id)copyCinematicVideoFocusDetections;
- (id)nodeSubType;
- (id)nodeType;
- (uint64_t)_dropFrame:(uint64_t)result;
- (uint64_t)_findCaptureSampleBuffer:(CMSampleBufferRef *)a3 matchingPreviewSampleBuffer:;
- (uint64_t)_sendDropAndRemoveSampleBuffer:(uint64_t)result fromQueue:(CMSampleBufferRef)sbuf withCaptureID:(void *)a3;
- (uint64_t)_updateAlphaLowLightWithMetadata:(const void *)a3 imageSampleBuffer:;
- (uint64_t)_updateAutoFocus:(double)a3 finalCropRect:(double)a4;
- (uint64_t)_updateFromQueue:(void *)a3 sampleBufferOut:(_DWORD *)a4 captureID:;
- (uint64_t)_updateGlobalMetadata:(uint64_t)result;
- (void)_emitMovieFileDropForPreviousSampleBuffer;
- (void)_emitSampleBufferOnMetadataOutput:(void *)a3 cinematographyFrame:;
- (void)_tryToEmit:(void *)a3 captureBuffer:;
- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)didSelectFormat:(id)a3 forInput:(id)a4;
- (void)handleDroppedSample:(id)a3 forInput:(id)a4;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
- (void)setFocusDetectionProviderEnabled:(BOOL)a3;
- (void)setSimulatedAperture:(float)a3;
@end

@implementation BWRealtimeCinematographyNode

+ (void)initialize
{
}

- (BWRealtimeCinematographyNode)initWithObjectMetadataIdentifiers:(id)a3 cachedSimulatedAperture:(float)a4 captureDevice:(id)a5 tuningParameters:(id)a6 videoDepthConfiguration:(id)a7 smartStyleLearningEnabled:(BOOL)a8 captureInputEnabled:(BOOL)a9
{
  BOOL v10 = a8;
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  v69.receiver = self;
  v69.super_class = (Class)BWRealtimeCinematographyNode;
  v16 = [(BWNode *)&v69 init];
  v17 = v16;
  if (!v16) {
    return v17;
  }
  id v58 = a3;
  id v59 = a5;
  id v60 = a6;
  v16->_captureInputEnabled = a9;
  v18 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v16];
  [(BWNodeInput *)v18 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
  [(BWNodeInput *)v18 setPassthroughMode:1];
  v19 = objc_alloc_init(BWNodeInputMediaConfiguration);
  v20 = objc_alloc_init(BWVideoFormatRequirements);
  [(BWVideoFormatRequirements *)v20 setSupportedPixelFormats:&unk_1EFB02990];
  [(BWNodeInputMediaConfiguration *)v19 setFormatRequirements:v20];
  [(BWNodeInputMediaConfiguration *)v19 setPassthroughMode:1];
  -[BWNodeInputMediaConfiguration setDelayedBufferCount:](v19, "setDelayedBufferCount:", [a7 concurrencyWidth]);
  -[BWNodeInput setDelayedBufferCount:](v18, "setDelayedBufferCount:", [a7 concurrencyWidth]);
  [(BWNodeInput *)v18 setMediaConfiguration:v19 forAttachedMediaKey:@"Depth"];
  [(BWNode *)v17 addInput:v18];
  if (v17->_captureInputEnabled)
  {
    v17->_captureInput = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v17 index:1];
    [(BWNodeInput *)v17->_captureInput setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
    [(BWNodeInput *)v17->_captureInput setPassthroughMode:1];
    v21 = [(BWNodeInput *)v17->_captureInput primaryMediaConfiguration];
    [(BWNodeInputMediaConfiguration *)v21 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
    [(BWNodeInputMediaConfiguration *)v21 setPassthroughMode:1];
    -[BWNodeInput setDelayedBufferCount:](v17->_captureInput, "setDelayedBufferCount:", [a7 concurrencyWidth]);
    [(BWNode *)v17 addInput:v17->_captureInput];
    v17->_videoCaptureSampleBufferQueue = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v17->_previewSampleBufferQueue = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v17->_bufferServicingLock._os_unfair_lock_opaque = 0;
  }
  v22 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v17];
  v17->_previewOutput = v22;
  [(BWNodeOutput *)v22 setPassthroughMode:1];
  [(BWNodeOutput *)v17->_previewOutput setIndexOfInputWhichDrivesThisOutput:0];
  [(BWNode *)v17 addOutput:v17->_previewOutput];

  v23 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v17];
  v17->_movieFileOutput = v23;
  [(BWNodeOutput *)v23 setPassthroughMode:1];
  if (v17->_captureInputEnabled)
  {
    v24 = objc_alloc_init(BWNodeOutputMediaConfiguration);
    v25 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWVideoFormatRequirements *)v25 setSupportedPixelFormats:&unk_1EFB029A8];
    [(BWNodeOutputMediaConfiguration *)v24 setFormatRequirements:v25];
    [(BWNodeOutputMediaConfiguration *)v24 setPassthroughMode:1];
    [(BWNodeOutput *)v17->_movieFileOutput setMediaConfiguration:v24 forAttachedMediaKey:@"Depth"];
    [(BWNodeOutput *)v17->_movieFileOutput setIndexOfInputWhichDrivesThisOutput:1];
    v17->_smartStyleLearningEnabled = v10;
    if (v10)
    {
      v26 = BWAttachedMediaKeysRequiredBySmartStyleRenderingPipelines(1, 0);
      long long v65 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      uint64_t v27 = [v26 countByEnumeratingWithState:&v65 objects:v71 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v66;
        do
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v66 != v29) {
              objc_enumerationMutation(v26);
            }
            uint64_t v31 = *(void *)(*((void *)&v65 + 1) + 8 * i);
            v32 = objc_alloc_init(BWNodeOutputMediaConfiguration);
            [(BWNodeOutputMediaConfiguration *)v32 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
            [(BWNodeOutputMediaConfiguration *)v32 setPassthroughMode:1];
            [(BWNodeOutputMediaConfiguration *)v32 setIndexOfInputWhichDrivesThisOutput:0];
            [(BWNodeOutputMediaConfiguration *)v32 setAttachedMediaKeyOfInputWhichDrivesThisOutput:v31];
            [(BWNodeOutput *)v17->_movieFileOutput setMediaConfiguration:v32 forAttachedMediaKey:v31];
          }
          uint64_t v28 = [v26 countByEnumeratingWithState:&v65 objects:v71 count:16];
        }
        while (v28);
      }
    }
  }
  -[BWNode addOutput:](v17, "addOutput:", v17->_movieFileOutput, a7);
  if (v58)
  {
    v17->_detectedObjectsOutput = [[BWNodeOutput alloc] initWithMediaType:1836016234 node:v17];
    [(BWNodeOutput *)v17->_detectedObjectsOutput setFormat:+[BWMetadataObjectFormat formatWithMetadataIdentifiers:v58]];
    [(BWNode *)v17 addOutput:v17->_detectedObjectsOutput];
  }
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  v33 = (void *)[v59 activePortTypes];
  uint64_t v34 = [v33 countByEnumeratingWithState:&v61 objects:v70 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v62;
    uint64_t v37 = *MEMORY[0x1E4F52DF0];
    uint64_t v38 = *MEMORY[0x1E4F52DE8];
    uint64_t v39 = *MEMORY[0x1E4F52E00];
    while (2)
    {
      for (uint64_t j = 0; j != v35; ++j)
      {
        if (*(void *)v62 != v36) {
          objc_enumerationMutation(v33);
        }
        v41 = *(void **)(*((void *)&v61 + 1) + 8 * j);
        if ([v41 isEqual:v37])
        {
          uint64_t v42 = v37;
          goto LABEL_30;
        }
        if ([v41 isEqual:v38])
        {
          uint64_t v42 = *MEMORY[0x1E4F52DD8];
          goto LABEL_30;
        }
        if ([v41 isEqual:v39])
        {
          uint64_t v42 = v39;
          goto LABEL_30;
        }
      }
      uint64_t v35 = [v33 countByEnumeratingWithState:&v61 objects:v70 count:16];
      uint64_t v42 = 0;
      if (v35) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v42 = 0;
  }
LABEL_30:
  v43 = objc_msgSend((id)objc_msgSend(v59, "sensorIDDictionaryByPortType"), "objectForKeyedSubscript:", v42);
  id v44 = (id)[objc_alloc((Class)getPTCinematographyStreamOptionsClass()) init];
  [v59 defaultAutoFocusTapWindowSize];
  objc_msgSend(v44, "setFixedFocusNormalizedRectSize:");
  objc_msgSend(v44, "setCinematographyParameters:", objc_msgSend(v43, "valueForKeyPath:", @"CinematicVideoParameters.CinematographyParameters"));
  v45 = (PTCinematographyStream *)[objc_alloc((Class)getPTCinematographyStreamClass()) initWithOptions:v44];
  v17->_cinematographyStream = v45;
  [(PTCinematographyStream *)v45 setDelegate:v17];
  v17->_hasAutoFocus = objc_msgSend((id)objc_msgSend(v59, "captureStream"), "hasFocus");
  v17->_captureDevice = (BWFigVideoCaptureDevice *)v59;
  objc_msgSend((id)objc_msgSend(v43, "valueForKeyPath:", @"CinematicVideoParameters.simulatedVideoAperture"), "floatValue");
  float v47 = v46;
  v48 = (void *)[v43 valueForKeyPath:@"CinematicVideoParameters.RenderVersion"];
  if (!v48)
  {
    v17->_globalRenderingMetadataVersion = 2;
LABEL_36:
    v51 = (void *)[objc_alloc((Class)getPTGlobalRenderingMetadataVersion2Class()) initWithMinorVersion:1];
    goto LABEL_37;
  }
  int v49 = [v48 intValue];
  uint64_t v50 = 1;
  if (v49 != 2) {
    uint64_t v50 = 2;
  }
  v17->_globalRenderingMetadataVersion = v50;
  if (v49 != 2) {
    goto LABEL_36;
  }
  v51 = (void *)[objc_alloc((Class)getPTGlobalRenderingMetadataVersion1Class()) initWithMinorVersion:6];
  objc_msgSend((id)objc_msgSend(v43, "valueForKeyPath:", @"CinematicVideoParameters.minimumSimulatedVideoAperture"), "floatValue");
  objc_msgSend(v51, "setMinAperture:");
  objc_msgSend((id)objc_msgSend(v43, "valueForKeyPath:", @"CinematicVideoParameters.maximumSimulatedVideoAperture"), "floatValue");
  objc_msgSend(v51, "setMaxAperture:");
  *(float *)&double v52 = v47;
  [v51 setDefaultAperture:v52];
  [v57 networkBias];
  objc_msgSend(v51, "setNetworkBias:");
LABEL_37:
  v17->_globalRenderingMetadata = (PTGlobalRenderingMetadata *)v51;
  v17->_globalVideoHeaderMetadata = (PTGlobalVideoHeaderMetadataVersion1 *)[objc_alloc((Class)getPTGlobalVideoHeaderMetadataVersion1Class()) initWithMinorVersion:1];
  v17->_globalCinematographyMetadata = (PTGlobalCinematographyMetadataVersion1 *)[objc_alloc((Class)getPTGlobalCinematographyMetadataVersion1Class()) initWithMinorVersion:1];
  if (a4 == 0.0) {
    float v53 = v47;
  }
  else {
    float v53 = a4;
  }
  v17->_simulatedAperture = v53;
  -[PTCinematographyStream setUserAperture:](v17->_cinematographyStream, "setUserAperture:");
  v17->_globalStabilizationMetadata = (PTGlobalStabilizationMetadataVersion1 *)[objc_alloc((Class)getPTGlobalStabilizationMetadataVersion1Class()) initWithMinorVersion:1];
  v17->_globalMetadata = (PTGlobalVideoMetadata *)[objc_alloc((Class)getPTGlobalVideoMetadataClass()) init];
  *(void *)v17->_pastFramesWereBrightEnough = 0x101010101010101;
  *(void *)&v17->_pastFramesWereBrightEnough[8] = 0x101010101010101;
  *(void *)&v17->_pastFramesWereBrightEnough[16] = 0x101010101010101;
  *(void *)&v17->_pastFramesWereBrightEnough[22] = 0x101010101010101;
  v17->_pastFramesWereBrightEnoughPointer = 0;
  v17->_currentStateIsBrightEnough = 1;
  v17->_alphaLowLight = 1.0;
  int v54 = objc_msgSend((id)objc_msgSend(v60, "objectForKeyedSubscript:", @"TooDarkLuxLevelRolloffThreshold"), "intValue");
  if (v54) {
    int v55 = v54;
  }
  else {
    int v55 = 40;
  }
  v17->_luxLevelThreshold = v55;
  v17->_alphaRampFrameCount = 30;
  v17->_autoFocusUpdateFrameDelay = 3;
  v17->_latestFocusDectionTrackID = 0xFFFFFFFF80000000;
  v17->_focusDetections = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v17->_focusDetectionsLock._os_unfair_lock_opaque = 0;
  v17->_focusDetectionProviderEnabled = 0;
  return v17;
}

- (void)dealloc
{
  previousSampleBuffer = self->_previousSampleBuffer;
  if (previousSampleBuffer) {
    CFRelease(previousSampleBuffer);
  }

  depthFormatDescription = self->_depthFormatDescription;
  if (depthFormatDescription) {
    CFRelease(depthFormatDescription);
  }

  v5.receiver = self;
  v5.super_class = (Class)BWRealtimeCinematographyNode;
  [(BWNode *)&v5 dealloc];
}

- (id)nodeType
{
  return @"Effect";
}

- (id)nodeSubType
{
  return @"CinematographyMetadataProducer";
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  captureInput = self->_captureInput;
  if (captureInput == a4 || !self->_captureInputEnabled)
  {
    [(BWNodeOutput *)self->_movieFileOutput setFormat:a3];
    captureInput = self->_captureInput;
  }
  if (captureInput != a4)
  {
    previewOutput = self->_previewOutput;
    [(BWNodeOutput *)previewOutput setFormat:a3];
  }
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  captureInput = self->_captureInput;
  if (captureInput == a5 || !self->_captureInputEnabled)
  {
    [(BWNodeOutput *)self->_movieFileOutput makeConfiguredFormatLive];
    captureInput = self->_captureInput;
  }
  if (captureInput != a5)
  {
    [(BWNodeOutput *)self->_previewOutput makeConfiguredFormatLive];
    detectedObjectsOutput = self->_detectedObjectsOutput;
    [(BWNodeOutput *)detectedObjectsOutput makeConfiguredFormatLive];
  }
}

- (void)didReachEndOfDataForInput:(id)a3
{
  if (self->_captureInputEnabled)
  {
    unsigned int v4 = atomic_fetch_add_explicit(&self->_numEODMessagesReceived, 1u, memory_order_relaxed) + 1;
    if ([(NSArray *)[(BWNode *)self inputs] count] == v4)
    {
      os_unfair_lock_lock(&self->_bufferServicingLock);
      [(BWNodeOutput *)self->_movieFileOutput markEndOfLiveOutput];
      [(BWNodeOutput *)self->_previewOutput markEndOfLiveOutput];
      [(BWNodeOutput *)self->_detectedObjectsOutput markEndOfLiveOutput];
      os_unfair_lock_unlock(&self->_bufferServicingLock);
      self->_numEODMessagesReceived = 0;
    }
  }
  else
  {
    [(BWNodeOutput *)self->_movieFileOutput markEndOfLiveOutput];
    [(BWNodeOutput *)self->_previewOutput markEndOfLiveOutput];
    detectedObjectsOutput = self->_detectedObjectsOutput;
    [(BWNodeOutput *)detectedObjectsOutput markEndOfLiveOutput];
  }
}

- (void)setSimulatedAperture:(float)a3
{
  self->_simulatedAperture = a3;
  -[PTCinematographyStream setUserAperture:](self->_cinematographyStream, "setUserAperture:");
}

- (float)simulatedAperture
{
  return self->_simulatedAperture;
}

- (uint64_t)_dropFrame:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    [*(id *)(result + 120) emitDroppedSample:a2];
    if (*(void *)(v3 + 296))
    {
      -[BWRealtimeCinematographyNode _emitMovieFileDropForPreviousSampleBuffer](v3);
      unsigned int v4 = *(const void **)(v3 + 296);
      if (v4)
      {
        CFRelease(v4);
        *(void *)(v3 + 296) = 0;
      }
    }
    objc_super v5 = *(void **)(v3 + 112);
    return [v5 emitDroppedSample:a2];
  }
  return result;
}

- (void)_emitMovieFileDropForPreviousSampleBuffer
{
  if (a1)
  {
    memset(&v4, 0, sizeof(v4));
    CMSampleBufferGetPresentationTimeStamp(&v4, *(CMSampleBufferRef *)(a1 + 296));
    CMTime v3 = v4;
    id v2 = +[BWDroppedSample newDroppedSampleWithReason:0x1EFA68060 pts:&v3];
    [*(id *)(a1 + 112) emitDroppedSample:v2];
  }
}

- (void)handleDroppedSample:(id)a3 forInput:(id)a4
{
  if (!self->_captureInputEnabled) {
    -[BWRealtimeCinematographyNode _dropFrame:]((uint64_t)self, (uint64_t)a3);
  }
}

- (uint64_t)_updateAlphaLowLightWithMetadata:(const void *)a3 imageSampleBuffer:
{
  if (!result) {
    return result;
  }
  uint64_t v4 = result;
  int v5 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E4F54068]), "intValue");
  uint64_t v6 = 0;
  int v7 = 0;
  *(unsigned char *)(v4 + 144 + *(int *)(v4 + 176)) = v5 >= *(_DWORD *)(v4 + 188);
  *(_DWORD *)(v4 + 176) = (*(_DWORD *)(v4 + 176) + 1) % 30;
  do
    v7 += *(unsigned __int8 *)(v4 + 144 + v6++);
  while (v6 != 30);
  if (*(unsigned char *)(v4 + 180)) {
    int v8 = 0;
  }
  else {
    int v8 = 10;
  }
  float v9 = (float)(v7 + 10 * *(unsigned __int8 *)(v4 + 180)) / (float)(v8 + 10 * *(unsigned __int8 *)(v4 + 180) + 30);
  if (!*(unsigned char *)(v4 + 180) || (char v10 = 0, v9 >= 0.5))
  {
    if (*(unsigned char *)(v4 + 180) || v9 < 0.5) {
      goto LABEL_13;
    }
    char v10 = 1;
  }
  *(unsigned char *)(v4 + 180) = v10;
LABEL_13:
  float v11 = 1.0 / (double)*(int *)(v4 + 192);
  result = objc_msgSend((id)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F55B38], 0), "BOOLValue");
  if (result)
  {
    *(float *)(v4 + 184) = *(float *)(v4 + 184) - v11;
  }
  else
  {
    float v12 = -v11;
    if (*(unsigned char *)(v4 + 180)) {
      float v12 = v11;
    }
    *(float *)(v4 + 184) = *(float *)(v4 + 184) + v12;
  }
  float v13 = *(float *)(v4 + 184);
  BOOL v14 = v13 <= 0.0;
  float v15 = 1.0;
  BOOL v16 = v13 < 1.0 || v13 <= 0.0;
  if (v13 >= 1.0) {
    BOOL v14 = 1;
  }
  if (v16) {
    float v15 = 0.0;
  }
  if (v14) {
    float v13 = v15;
  }
  *(float *)(v4 + 184) = v13;
  return result;
}

- (uint64_t)_updateFromQueue:(void *)a3 sampleBufferOut:(_DWORD *)a4 captureID:
{
  if (result)
  {
    result = [a2 count];
    if (result)
    {
      int v7 = (const void *)[a2 objectAtIndexedSubscript:0];
      *a3 = v7;
      *a4 = objc_msgSend((id)objc_msgSend((id)CMGetAttachment(v7, (CFStringRef)*MEMORY[0x1E4F53070], 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F542D8]), "intValue");
      return 1;
    }
  }
  return result;
}

- (uint64_t)_sendDropAndRemoveSampleBuffer:(uint64_t)result fromQueue:(CMSampleBufferRef)sbuf withCaptureID:(void *)a3
{
  if (result)
  {
    uint64_t v5 = result;
    memset(&v8, 0, sizeof(v8));
    CMSampleBufferGetPresentationTimeStamp(&v8, sbuf);
    CMTime v7 = v8;
    id v6 = +[BWDroppedSample newDroppedSampleWithReason:0x1EFA68060 pts:&v7];
    -[BWRealtimeCinematographyNode _dropFrame:](v5, (uint64_t)v6);

    return [a3 removeObject:sbuf];
  }
  return result;
}

- (uint64_t)_findCaptureSampleBuffer:(CMSampleBufferRef *)a3 matchingPreviewSampleBuffer:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v5 = result;
    CMSampleBufferRef v20 = 0;
    CMSampleBufferRef sbuf = 0;
    uint64_t v19 = 0;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v6 = *(void *)(result + 328);
    v22[0] = *(void *)(result + 320);
    v22[1] = v6;
    CMTime v7 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v22, 2, 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v23 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          float v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if ((unint64_t)[v12 count] >= 5)
          {
            do
              [v12 removeObjectAtIndex:0];
            while ((unint64_t)[v12 count] > 4);
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v23 count:16];
      }
      while (v9);
    }
    result = -[BWRealtimeCinematographyNode _updateFromQueue:sampleBufferOut:captureID:](v5, *(void **)(v5 + 320), &sbuf, (_DWORD *)&v19 + 1);
    if (result)
    {
      result = -[BWRealtimeCinematographyNode _updateFromQueue:sampleBufferOut:captureID:](v5, *(void **)(v5 + 328), &v20, &v19);
      if (result)
      {
        int v13 = v19;
        while (1)
        {
          int v14 = HIDWORD(v19);
          if (SHIDWORD(v19) >= v13) {
            break;
          }
          -[BWRealtimeCinematographyNode _sendDropAndRemoveSampleBuffer:fromQueue:withCaptureID:](v5, sbuf, *(void **)(v5 + 320));
          if ((-[BWRealtimeCinematographyNode _updateFromQueue:sampleBufferOut:captureID:](v5, *(void **)(v5 + 320), &sbuf, (_DWORD *)&v19 + 1) & 1) == 0)return 0; {
        }
          }
        while (v14 > (int)v19)
        {
          -[BWRealtimeCinematographyNode _sendDropAndRemoveSampleBuffer:fromQueue:withCaptureID:](v5, v20, *(void **)(v5 + 328));
          if ((-[BWRealtimeCinematographyNode _updateFromQueue:sampleBufferOut:captureID:](v5, *(void **)(v5 + 328), &v20, &v19) & 1) == 0)return 0; {
        }
          }
        if (v14 == v19)
        {
          *a2 = sbuf;
          *a3 = v20;
          return 1;
        }
        return 0;
      }
    }
  }
  return result;
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  if (self->_captureInputEnabled)
  {
    p_bufferServicingLock = &self->_bufferServicingLock;
    os_unfair_lock_lock(&self->_bufferServicingLock);
    if (self->_captureInput == a4) {
      uint64_t v9 = &OBJC_IVAR___BWRealtimeCinematographyNode__videoCaptureSampleBufferQueue;
    }
    else {
      uint64_t v9 = &OBJC_IVAR___BWRealtimeCinematographyNode__previewSampleBufferQueue;
    }
    [*(id *)((char *)&self->super.super.isa + *v9) addObject:a3];
    CMAttachmentBearerRef v51 = 0;
    CMAttachmentBearerRef target = 0;
    CFTypeRef cf = 0;
    if (-[BWRealtimeCinematographyNode _findCaptureSampleBuffer:matchingPreviewSampleBuffer:]((uint64_t)self, (CMSampleBufferRef *)&target, (CMSampleBufferRef *)&v51))
    {
      uint64_t v10 = (opaqueCMSampleBuffer *)target;
      CFStringRef v11 = (const __CFString *)*MEMORY[0x1E4F53070];
      float v12 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
      int v13 = (void *)v51;
      int v14 = (void *)CMGetAttachment(v51, v11, 0);
      if ([(BWFigVideoCaptureDevice *)self->_captureDevice depthType] == 3)
      {
        if (self->_captureInputEnabled
          && [(BWFigVideoCaptureStream *)[(BWFigVideoCaptureDevice *)self->_captureDevice masterCaptureStream] videoCaptureDimensions] == 3840)
        {
          long long v15 = (void *)CMGetAttachment(v13, @"TotalZoomFactor", 0);
          *(_OWORD *)int v49 = 0uLL;
          __asm { FMOV            V0.2D, #1.0 }
          *(_OWORD *)&v49[16] = _Q0;
          FigCFDictionaryGetCGRectIfPresent();
          objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E4F54148]), "intValue");
          v21 = [(BWFigVideoCaptureDevice *)self->_captureDevice baseZoomFactorsByPortType];
          objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v21, "objectForKeyedSubscript:", *MEMORY[0x1E4F52DD8]), "floatValue");
          [v15 floatValue];
          uint64_t v22 = *MEMORY[0x1E4F54380];
          objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E4F54380]), "floatValue");
          [v15 floatValue];
          FigCFDictionarySetCGRect();
          ImageBuffer = CMSampleBufferGetImageBuffer(v10);
          CVPixelBufferGetWidth(ImageBuffer);
          CVPixelBufferGetHeight(ImageBuffer);
          FigCFDictionarySetCGRect();
          CMSetAttachment(v10, @"TotalZoomFactor", v15, 1u);
          uint64_t v24 = [v14 objectForKeyedSubscript:v22];
          [v12 setObject:v24 forKeyedSubscript:*MEMORY[0x1E4F55CF8]];
        }
      }
      else
      {
        v25 = (void *)[v14 mutableCopy];
        objc_msgSend(v25, "setObject:forKeyedSubscript:", objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E4F53260]), *MEMORY[0x1E4F53260]);
        CMSetAttachment(v13, v11, v25, 1u);
      }
      CFTypeRef v26 = CMGetAttachment(v13, @"FTCinematicTrackingResult", 0);
      CFTypeRef v27 = CMGetAttachment(v13, @"FusionTrackerInput", 0);
      CFStringRef key = (CFStringRef)CMGetAttachment(v13, @"Inferences", 0);
      CFTypeRef v28 = CMGetAttachment(v13, @"CinematicVideoFocusRequest", 0);
      CMSetAttachment(v10, @"FTCinematicTrackingResult", v26, 1u);
      CMSetAttachment(v10, @"FusionTrackerInput", v27, 1u);
      CMSetAttachment(v10, @"CinematicVideoFocusRequest", v28, 1u);
      CMSetAttachment(v10, @"Inferences", key, 1u);
      memset(v49, 0, 24);
      CMSampleBufferGetPresentationTimeStamp((CMTime *)v49, v10);
      AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(v13, @"Depth");
      if (AttachedMedia)
      {
        v30 = CMSampleBufferGetImageBuffer(AttachedMedia);
        long long v47 = *(_OWORD *)v49;
        uint64_t v48 = *(void *)&v49[16];
        int v31 = BWSampleBufferCreateFromPixelBuffer(v30, (uint64_t)&v47, (CFTypeRef *)&self->_depthFormatDescription, (CMSampleBufferRef *)&cf);
        p_bufferServicingLock = &self->_bufferServicingLock;
        if (v31)
        {
          int v39 = v31;
          fig_log_get_emitter();
          uint64_t v41 = v4;
          LODWORD(v40) = v39;
          FigDebugAssert3();
        }
        else
        {
          BWSampleBufferSetAttachedMedia(v10, @"Depth", (uint64_t)cf);
          if (self->_smartStyleLearningEnabled)
          {
            v32 = BWAttachedMediaKeysRequiredBySmartStyleRenderingPipelines(1, 0);
            long long v43 = 0u;
            long long v44 = 0u;
            long long v45 = 0u;
            long long v46 = 0u;
            uint64_t v33 = [v32 countByEnumeratingWithState:&v43 objects:v53 count:16];
            if (v33)
            {
              uint64_t v34 = v33;
              uint64_t v35 = *(void *)v44;
              do
              {
                for (uint64_t i = 0; i != v34; ++i)
                {
                  if (*(void *)v44 != v35) {
                    objc_enumerationMutation(v32);
                  }
                  uint64_t v37 = *(void *)(*((void *)&v43 + 1) + 8 * i);
                  uint64_t v38 = BWSampleBufferGetAttachedMedia(v13, v37);
                  BWSampleBufferSetAttachedMedia(v10, v37, v38);
                }
                uint64_t v34 = [v32 countByEnumeratingWithState:&v43 objects:v53 count:16];
              }
              while (v34);
            }
          }
        }
      }
      else
      {
        fig_log_get_emitter();
        uint64_t v41 = v4;
        LODWORD(v40) = 0;
        FigDebugAssert3();
        p_bufferServicingLock = &self->_bufferServicingLock;
      }
      -[BWRealtimeCinematographyNode _tryToEmit:captureBuffer:]((uint64_t)self, v13, v10);
      if (cf) {
        CFRelease(cf);
      }
      -[NSMutableArray removeObject:](self->_videoCaptureSampleBufferQueue, "removeObject:", v10, v40, v41);
      [(NSMutableArray *)self->_previewSampleBufferQueue removeObject:v13];
    }
    os_unfair_lock_unlock(p_bufferServicingLock);
  }
  else
  {
    -[BWRealtimeCinematographyNode _tryToEmit:captureBuffer:]((uint64_t)self, a3, a3);
  }
}

- (void)_tryToEmit:(void *)a3 captureBuffer:
{
  uint64_t v184 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  CMTime v7 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  CMSampleBufferRef sampleBufferOut = 0;
  -[BWRealtimeCinematographyNode _updateGlobalMetadata:](a1, a3);
  unint64_t v8 = 0x1E96A8000uLL;
  uint64_t v9 = *(const void **)(a1 + 296);
  if (v9
    && (CFStringRef v10 = (const __CFString *)*MEMORY[0x1E4F53070],
        (CFTypeRef v11 = CMGetAttachment(v9, (CFStringRef)*MEMORY[0x1E4F53070], 0)) != 0))
  {
    float v12 = (void *)v11;
    uint64_t v172 = 0;
    uint64_t v171 = 0;
    __asm { FMOV            V0.2D, #1.0 }
    float64x2_t v141 = _Q0;
    float64x2_t v173 = _Q0;
    FigCFDictionaryGetCGRectIfPresent();
    CMGetAttachment(a2, v10, 0);
    double v169 = 0.0;
    double v168 = 0.0;
    float64x2_t v170 = v141;
    FigCFDictionaryGetCGRectIfPresent();
    -[BWRealtimeCinematographyNode _updateAlphaLowLightWithMetadata:imageSampleBuffer:](a1, v12, a3);
    if (*(void *)(a1 + 400) == 1)
    {
      long long v18 = (void *)[objc_alloc((Class)getPTTimedRenderingMetadataVersion1Class()) initWithMinorVersion:6];
      objc_msgSend(v18, "setAgc:", objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E4F53C08]), "intValue"));
    }
    else
    {
      long long v18 = (void *)[objc_alloc((Class)getPTTimedRenderingMetadataVersion2Class()) initWithMinorVersion:1];
      objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E4F53E98]), "floatValue");
      objc_msgSend(v18, "setFocalLenIn35mmFilm:");
      objc_msgSend(v18, "setConversionGain:", objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E4F53D88]), "intValue"));
      objc_msgSend(v18, "setReadNoise_1x:", objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E4F54170]), "intValue"));
      objc_msgSend(v18, "setReadNoise_8x:", objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E4F54178]), "intValue"));
      objc_msgSend(v18, "setAGC:", objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E4F53C08]), "intValue"));
      objc_msgSend(v18, "setVisCropFactor:", COERCE_DOUBLE(vcvt_f32_f64(vdivq_f64(v141, v173))));
      long long v20 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
      *(_OWORD *)v167 = *MEMORY[0x1E4F1DB28];
      *(_OWORD *)&v167[16] = v20;
      FigCFDictionaryGetCGRectIfPresent();
      [v18 setTotalSensorCropRectSize:*(_OWORD *)&v167[16]];
    }
    LODWORD(v19) = *(_DWORD *)(a1 + 184);
    id value = v18;
    [v18 setAlphaLowLight:v19];
    uint64_t AttachedMedia = BWSampleBufferGetAttachedMedia(*(const void **)(a1 + 296), @"Depth");
    if (AttachedMedia)
    {
      CMSampleBufferRef sbuf = (opaqueCMSampleBuffer *)AttachedMedia;
      v137 = a2;
      *(unsigned char *)(a1 + 284) = 1;
      id v139 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v22 = *MEMORY[0x1E4F53DC8];
      v23 = (void *)[v12 objectForKeyedSubscript:*MEMORY[0x1E4F53DC8]];
      uint64_t v24 = *MEMORY[0x1E4F53DC0];
      uint64_t v25 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F53DC0]];
      id v142 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v26 = *(id *)(a1 + 104);
      if (v23)
      {

        id v26 = v23;
        *(void *)(a1 + 104) = v26;
      }
      if (v26) {
        [v142 setObject:v26 forKeyedSubscript:v22];
      }
      if (v25) {
        [v142 setObject:v25 forKeyedSubscript:v24];
      }
      CFTypeRef v27 = CMGetAttachment(a3, @"FTCinematicTrackingResult", 0);
      v138 = a3;
      if (v27)
      {
        CFTypeRef v28 = (void *)v27;
        uint64_t v29 = (void *)CMGetAttachment(a3, @"CinematicVideoFocusRequest", 0);
        if (v29)
        {
          v30 = v29;
          objc_msgSend(v139, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", BWIsFocusRequestForHardFocus(v29)), 0x1EFA73400);
          objc_msgSend(v139, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", BWIsFocusRequestForHardFocus(v30) ^ 1), 0x1EFA73420);
          objc_msgSend(v139, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", BWIsFocusRequestForFixedPlaneFocus(v30)), 0x1EFA733E0);
          if (BWIsFocusRequestForFixedPlaneFocus(v30))
          {
            int v31 = (void *)[objc_alloc((Class)getFTCinematicTapResponseClass()) init];
            v32 = BWCreateFTCinematicTapRequestFromFocusRequest(v30);
            [v31 setRequest:v32];
            [v31 setWasSuccessful:1];
            [v28 setTapResponse:v31];
          }
        }
        uint64_t v33 = (void *)CMGetAttachment(*(CMAttachmentBearerRef *)(a1 + 296), @"FTCinematicTrackingResult", 0);
        if (v33)
        {
          uint64_t v34 = v33;
          objc_msgSend(v33, "setDetectorDidRun:", objc_msgSend(v28, "detectorDidRun"));
          uint64_t v35 = objc_msgSend((id)objc_msgSend(v28, "tracks"), "mutableCopy");
          v134 = v34;
          if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v34, "tapResponse"), "tappedTrack"), "isTapSpawned"))
          {
            uint64_t v36 = [v35 indexOfObjectPassingTest:&__block_literal_global];
            uint64_t v37 = v34;
            uint64_t v38 = v36;
            int v39 = v37;
            uint64_t v40 = objc_msgSend((id)objc_msgSend(v37, "tapResponse"), "tappedTrack");
            if (v38 == 0x7FFFFFFFFFFFFFFFLL) {
              [v35 addObject:v40];
            }
            else {
              [v35 replaceObjectAtIndex:v38 withObject:v40];
            }
            uint64_t v34 = v39;
          }
          else if (objc_msgSend((id)objc_msgSend(v34, "tapResponse"), "tappedTrack"))
          {
            uint64_t v41 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v34, "tapResponse"), "tappedTrack"), "identifier");
            long long v163 = 0u;
            long long v164 = 0u;
            long long v165 = 0u;
            long long v166 = 0u;
            uint64_t v42 = [v35 countByEnumeratingWithState:&v163 objects:v183 count:16];
            if (v42)
            {
              uint64_t v43 = v42;
              uint64_t v44 = *(void *)v164;
LABEL_27:
              uint64_t v45 = 0;
              while (1)
              {
                if (*(void *)v164 != v44) {
                  objc_enumerationMutation(v35);
                }
                long long v46 = *(void **)(*((void *)&v163 + 1) + 8 * v45);
                if ([v46 identifier] == v41) {
                  break;
                }
                if (v43 == ++v45)
                {
                  uint64_t v43 = [v35 countByEnumeratingWithState:&v163 objects:v183 count:16];
                  if (v43) {
                    goto LABEL_27;
                  }
                  goto LABEL_38;
                }
              }
              if (!v46) {
                goto LABEL_38;
              }
              uint64_t v34 = v134;
              objc_msgSend((id)objc_msgSend(v134, "tapResponse"), "setTappedTrack:", v46);
            }
            else
            {
LABEL_38:
              uint64_t v34 = v134;
              objc_msgSend((id)objc_msgSend(v134, "tapResponse"), "setTappedTrack:", 0);
              objc_msgSend((id)objc_msgSend(v134, "tapResponse"), "setWasSuccessful:", 0);
            }
            a3 = v138;
          }
          else if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v28, "tapResponse"), "tappedTrack"), "isTapSpawned"))
          {
            objc_msgSend(v35, "removeObject:", objc_msgSend((id)objc_msgSend(v28, "tapResponse"), "tappedTrack"));
            uint64_t v47 = objc_msgSend((id)objc_msgSend(v34, "tracks"), "indexOfObjectPassingTest:", &__block_literal_global_73);
            if (v47 != 0x7FFFFFFFFFFFFFFFLL) {
              objc_msgSend(v35, "addObject:", objc_msgSend((id)objc_msgSend(v34, "tracks"), "objectAtIndexedSubscript:", v47));
            }
          }
          if ([v34 tapResponse]) {
            uint64_t v48 = objc_msgSend((id)objc_msgSend(v34, "tapResponse"), "wasSuccessful") ^ 1;
          }
          else {
            uint64_t v48 = 0;
          }
          objc_msgSend(v139, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v48), 0x1EFA73440);
          [v34 setTracks:v35];

          long long v161 = 0u;
          long long v162 = 0u;
          long long v159 = 0u;
          long long v160 = 0u;
          int v49 = (void *)[v34 tracks];
          uint64_t v50 = [v49 countByEnumeratingWithState:&v159 objects:v182 count:16];
          if (v50)
          {
            uint64_t v51 = v50;
            uint64_t v52 = *(void *)v160;
            uint64_t v53 = MEMORY[0x1E4F1CC38];
            do
            {
              for (uint64_t i = 0; i != v51; ++i)
              {
                if (*(void *)v160 != v52) {
                  objc_enumerationMutation(v49);
                }
                int v55 = *(void **)(*((void *)&v159 + 1) + 8 * i);
                [v55 box];
                v185.origin.x = FigCaptureTransformRectToCoordinateSpaceOfRect(v56, v57, v58, v59, v168, v169, v170.f64[0]);
                double width = v185.size.width;
                double height = v185.size.height;
                v187.origin.x = 0.0;
                v187.origin.y = 0.0;
                v187.size.double width = 1.0;
                v187.size.double height = 1.0;
                CGRect v186 = CGRectIntersection(v185, v187);
                double v62 = v186.size.width * v186.size.height;
                if (v186.size.width * v186.size.height <= width * height * 0.5)
                {
                  if (objc_msgSend(v55, "metadata", v62)) {
                    id v63 = (id)objc_msgSend((id)objc_msgSend(v55, "metadata"), "mutableCopy");
                  }
                  else {
                    id v63 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
                  }
                  long long v64 = v63;
                  [v63 setObject:v53 forKeyedSubscript:getPTCinematographyExcludeAsCinematicChoice()];
                  [v55 setMetadata:v64];
                }
              }
              uint64_t v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v159, v182, 16, v62);
            }
            while (v51);
            CFTypeRef v28 = v134;
            a3 = v138;
            unint64_t v8 = 0x1E96A8000;
          }
          else
          {
            CFTypeRef v28 = v34;
          }
        }
        [v142 setObject:v28 forKeyedSubscript:0x1EFA73120];
      }
      AttachedInferenceResult = (void *)BWInferenceGetAttachedInferenceResult(*(const void **)(a1 + *(int *)(v8 + 3160)), 151);
      long long v66 = objc_msgSend((id)CMGetAttachment(a3, @"FusionTrackerInput", 0), "input");
      long long v67 = 0;
      v136 = v12;
      if ([AttachedInferenceResult inferences] && v66)
      {
        uint64_t v68 = objc_msgSend((id)objc_msgSend(AttachedInferenceResult, "inferences"), "objectForKeyedSubscript:", 0x1EFA6A5C0);
        objc_super v69 = (void *)(*(uint64_t (**)(uint64_t, void *))(v68 + 16))(v68, v66);
        if ([v69 count])
        {
          long long v67 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v69, "count"));
          long long v155 = 0u;
          long long v156 = 0u;
          long long v157 = 0u;
          long long v158 = 0u;
          uint64_t v70 = [v69 countByEnumeratingWithState:&v155 objects:v181 count:16];
          if (v70)
          {
            uint64_t v71 = v70;
            uint64_t v72 = *(void *)v156;
            do
            {
              for (uint64_t j = 0; j != v71; ++j)
              {
                if (*(void *)v156 != v72) {
                  objc_enumerationMutation(v69);
                }
                uint64_t v74 = *(void *)(*((void *)&v155 + 1) + 8 * j);
                if (![v67 objectForKeyedSubscript:v74]) {
                  objc_msgSend(v67, "setObject:forKeyedSubscript:", (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", 1), v74);
                }
                objc_msgSend((id)objc_msgSend(v67, "objectForKeyedSubscript:", v74), "addEntriesFromDictionary:", objc_msgSend(v69, "objectForKeyedSubscript:", v74));
              }
              uint64_t v71 = [v69 countByEnumeratingWithState:&v155 objects:v181 count:16];
            }
            while (v71);
            float v12 = v136;
          }
        }
        else
        {
          long long v67 = 0;
        }
        [v66 detectorDidRun];
      }
      if ([v67 count]) {
        [v142 setObject:v67 forKeyedSubscript:@"MLSignals"];
      }

      uint64_t v75 = *MEMORY[0x1E4F53EC8];
      v76 = (void *)[v12 objectForKeyedSubscript:*MEMORY[0x1E4F53EC8]];
      objc_msgSend(v142, "setObject:forKeyedSubscript:", objc_msgSend(v76, "lastObject"), v75);
      [v142 setObject:v76 forKeyedSubscript:@"FocusRegionArray"];
      objc_msgSend(v142, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 280)), @"FocusMode");
      objc_msgSend(v142, "setObject:forKeyedSubscript:", objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E4F53EA8]), *MEMORY[0x1E4F53EA8]);
      objc_msgSend(v142, "setObject:forKeyedSubscript:", objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E4F54218]), *MEMORY[0x1E4F54218]);
      objc_msgSend(v142, "setObject:forKeyedSubscript:", objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E4F54168]), *MEMORY[0x1E4F54168]);
      objc_msgSend(v142, "setObject:forKeyedSubscript:", objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E4F54160]), *MEMORY[0x1E4F54160]);
      CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(sbuf);
      v78 = *(void **)(a1 + 96);
      CMSampleBufferGetPresentationTimeStamp(&v154, sbuf);
      v79 = (void *)[v78 processColorBuffer:0 disparityBuffer:ImageBuffer metadataDictionary:v142 presentationTime:&v154];

      id v80 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v150 = 0u;
      long long v151 = 0u;
      long long v152 = 0u;
      long long v153 = 0u;
      v81 = (void *)[v79 allDetections];
      uint64_t v82 = [v81 countByEnumeratingWithState:&v150 objects:v180 count:16];
      if (v82)
      {
        uint64_t v83 = v82;
        uint64_t v84 = *(void *)v151;
        do
        {
          for (uint64_t k = 0; k != v83; ++k)
          {
            if (*(void *)v151 != v84) {
              objc_enumerationMutation(v81);
            }
            v86 = *(void **)(*((void *)&v150 + 1) + 8 * k);
            if ([v86 detectionType] == 102)
            {
              uint64_t v87 = [v86 trackIdentifier];
              if (v87 != objc_msgSend((id)objc_msgSend(v79, "focusDetection"), "trackIdentifier")) {
                continue;
              }
            }
            [v80 addObject:v86];
          }
          uint64_t v83 = [v81 countByEnumeratingWithState:&v150 objects:v180 count:16];
        }
        while (v83);
      }
      v88 = (void *)[v80 copy];
      [v79 setAllDetections:v88];

      objc_setAssociatedObject(v79, @"CinematicVideoTimedRenderingMetadata", value, (void *)1);
      v178[0] = 0x1EFA73280;
      v89 = NSNumber;
      [v79 aperture];
      v179[0] = objc_msgSend(v89, "numberWithFloat:");
      v178[1] = 0x1EFA732A0;
      LODWORD(v90) = *(_DWORD *)(a1 + 184);
      v179[1] = [NSNumber numberWithFloat:v90];
      v178[2] = 0x1EFA732C0;
      v91 = NSNumber;
      [v79 focusDistance];
      uint64_t v92 = objc_msgSend(v91, "numberWithFloat:");
      v178[3] = 0x1EFA732E0;
      v179[2] = v92;
      v179[3] = v79;
      v93 = (const void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v179 forKeys:v178 count:4];
      CMSetAttachment(a2, @"CinematicVideoCinematographyMetadata", v93, 1u);
      CGSize v94 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
      v149.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
      v149.size = v94;
      FigCFDictionaryGetCGRectIfPresent();
      if (CGRectIsNull(v149)) {
        goto LABEL_99;
      }
      a3 = v138;
      if (!v79) {
        goto LABEL_100;
      }
      v95 = (void *)[v79 copy];
      uint64_t v96 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithArray:copyItems:", objc_msgSend(v95, "allDetections"), 1);
      if (v96)
      {
        v97 = (void *)v96;
        [v95 setAllDetections:v96];
        objc_setAssociatedObject(v95, @"CinematicVideoTimedRenderingMetadata", value, (void *)1);
        int v98 = BWPixelBufferDimensionsFromSampleBuffer(*(opaqueCMSampleBuffer **)(a1 + 296));
        v149.origin.x = FigCaptureMetadataUtilitiesRectNormalizedToRect(v149.origin.x, v149.origin.y, v149.size.width, v149.size.height, 0.0, 0.0, (double)v98);
        v149.origin.y = v99;
        v149.size.double width = v100;
        v149.size.double height = v101;
        long long v145 = 0u;
        long long v146 = 0u;
        long long v147 = 0u;
        long long v148 = 0u;
        v102 = (void *)[v95 allDetections];
        uint64_t v103 = [v102 countByEnumeratingWithState:&v145 objects:v177 count:16];
        if (v103)
        {
          uint64_t v104 = v103;
          uint64_t v105 = *(void *)v146;
          do
          {
            for (uint64_t m = 0; m != v104; ++m)
            {
              if (*(void *)v146 != v105) {
                objc_enumerationMutation(v102);
              }
              v107 = *(void **)(*((void *)&v145 + 1) + 8 * m);
              [v107 rect];
              objc_msgSend(v107, "setRect:", FigCaptureTransformNormalizedRectFromCoordinateSpaceOfNormalizedRect(v108, v109, v110, v111, v149.origin.x, v149.origin.y, v149.size.width));
            }
            uint64_t v104 = [v102 countByEnumeratingWithState:&v145 objects:v177 count:16];
          }
          while (v104);
        }
        v175[0] = 0x1EFA73280;
        v112 = NSNumber;
        [v79 aperture];
        v176[0] = objc_msgSend(v112, "numberWithFloat:");
        v175[1] = 0x1EFA732A0;
        LODWORD(v113) = *(_DWORD *)(a1 + 184);
        v176[1] = [NSNumber numberWithFloat:v113];
        v175[2] = 0x1EFA732C0;
        v114 = NSNumber;
        [v79 focusDistance];
        uint64_t v115 = objc_msgSend(v114, "numberWithFloat:");
        v175[3] = 0x1EFA732E0;
        v176[2] = v115;
        v176[3] = v95;
        v93 = (const void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v176 forKeys:v175 count:4];

        a2 = v137;
LABEL_99:
        a3 = v138;
LABEL_100:
        CMSetAttachment(*(CMAttachmentBearerRef *)(a1 + 296), @"CinematicVideoCinematographyMetadata", v93, 1u);
        if (*(unsigned char *)(a1 + 436) && [v79 focusDetection])
        {
          os_unfair_lock_lock((os_unfair_lock_t)(a1 + 432));
          [*(id *)(a1 + 424) removeAllObjects];
          v116 = [BWDockKitFocusDetection alloc];
          uint64_t v117 = objc_msgSend((id)objc_msgSend(v79, "focusDetection"), "trackIdentifier");
          objc_msgSend((id)objc_msgSend(v79, "focusDetection"), "rect");
          objc_msgSend(*(id *)(a1 + 424), "addObject:", -[BWDockKitFocusDetection initWithIdentifier:rect:](v116, "initWithIdentifier:rect:", v117));
          os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 432));
        }
        -[BWRealtimeCinematographyNode _updateAutoFocus:finalCropRect:](a1, v79, v168, v169, v170.f64[0], v170.f64[1]);
        if ([v79 focusDetection])
        {
          v118 = (void *)[v79 focusDetection];
          unint64_t v119 = [v118 detectionType];
          uint64_t v120 = [v118 trackIdentifier];
          BOOL v121 = v119 && v120 != *(void *)(a1 + 408);
          BOOL v122 = v119 < 0xD && (unint64_t)v121;
          BOOL v123 = v119 > 0x63 && v120 != *(void *)(a1 + 408);
          BOOL v124 = v119 < 0x67 && (unint64_t)v123;
          BOOL v125 = v119 == 102 && (unint64_t)(v120 != *(void *)(a1 + 408));
          BOOL v126 = v119 == 100 && (unint64_t)(v120 != *(void *)(a1 + 408));
          objc_msgSend(v139, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v122), 0x1EFA73460);
          objc_msgSend(v139, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v124), 0x1EFA73480);
          objc_msgSend(v139, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v125), 0x1EFA734A0);
          objc_msgSend(v139, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v126), 0x1EFA734C0);
          if (v120 != *(void *)(a1 + 408)) {
            *(void *)(a1 + 408) = v120;
          }
        }
        if ([v139 count]) {
          CMSetAttachment(a3, @"CinematicVideoMovieFileRecordingStats", v139, 1u);
        }

        BWCMSampleBufferCreateCopyIncludingMetadata((CMSampleBufferRef)a3, &sampleBufferOut);
        int v127 = [*(id *)(a1 + 136) depthType];
        CMTime v7 = (_DWORD *)MEMORY[0x1E4F1EBA8];
        if (v127 != 3
          || (int v128 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 136), "masterCaptureStream"), "videoCaptureDimensions"),
              v129 = (opaqueCMSampleBuffer *)a2,
              v128 != 3840))
        {
          v129 = (opaqueCMSampleBuffer *)a3;
        }
        -[BWRealtimeCinematographyNode _emitSampleBufferOnMetadataOutput:cinematographyFrame:](a1, v129, v79);
        [*(id *)(a1 + 112) emitSampleBuffer:*(void *)(a1 + 296)];
        goto LABEL_130;
      }
      fig_log_get_emitter();
      uint64_t v133 = v3;
      LODWORD(v132) = 0;
      FigDebugAssert3();
      CMTime v7 = (_DWORD *)MEMORY[0x1E4F1EBA8];
    }
    else
    {
      fig_log_get_emitter();
      uint64_t v133 = v3;
      LODWORD(v132) = 0;
      FigDebugAssert3();
    }
  }
  else
  {
    fig_log_get_emitter();
    uint64_t v133 = v3;
    LODWORD(v132) = 0;
    FigDebugAssert3();
    id value = 0;
  }
  BWCMSampleBufferCreateCopyIncludingMetadata((CMSampleBufferRef)a3, &sampleBufferOut);
  if (*(void *)(a1 + 296)) {
    -[BWRealtimeCinematographyNode _emitMovieFileDropForPreviousSampleBuffer](a1);
  }
  if (*(unsigned char *)(a1 + 284))
  {
    memset(v167, 0, 24);
    CMSampleBufferGetPresentationTimeStamp((CMTime *)v167, (CMSampleBufferRef)a2);
    long long v143 = *(_OWORD *)v167;
    uint64_t v144 = *(void *)&v167[16];
    id v131 = +[BWDroppedSample newDroppedSampleWithReason:pts:](BWDroppedSample, "newDroppedSampleWithReason:pts:", 0x1EFA68060, &v143, v132, v133);
    [*(id *)(a1 + 120) emitDroppedSample:v131];

    goto LABEL_131;
  }
LABEL_130:
  objc_msgSend(*(id *)(a1 + 120), "emitSampleBuffer:", a2, v132, v133);
LABEL_131:
  v130 = *(const void **)(a1 + 296);
  if (v130) {
    CFRelease(v130);
  }
  *(void *)(a1 + 296) = sampleBufferOut;

  if (*v7 == 1) {
    kdebug_trace();
  }
}

- (uint64_t)_updateGlobalMetadata:(uint64_t)result
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v2 = result;
    if (!*(unsigned char *)(result + 392))
    {
      if ([*(id *)(result + 96) getGlobalMetadata:*(void *)(result + 352)])
      {
        uint64_t v4 = (void *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F53070], 0);
        uint64_t v5 = objc_msgSend((id)objc_msgSend(*(id *)(v2 + 136), "cameraInfoByPortType"), "objectForKeyedSubscript:", objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E4F54128]));
        uint64_t v6 = (void *)[v4 objectForKeyedSubscript:*MEMORY[0x1E4F54210]];
        CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)a2);
        OSType PixelFormatType = CVPixelBufferGetPixelFormatType(ImageBuffer);
        int IsTenBit = FigCapturePixelFormatIsTenBit(PixelFormatType);
        CFStringRef v10 = *(void **)(v2 + 360);
        if (*(void *)(v2 + 400) != 1)
        {
          PTTuningParametersClass = (void *)getPTTuningParametersClass();
          objc_msgSend(v10, "setHwModelID:", objc_msgSend(PTTuningParametersClass, "hwModelIDFromFigModelSpecificName:", FigCaptureGetModelSpecificName()));
          objc_msgSend(v10, "setSensorID:", objc_msgSend(v6, "intValue"));
          goto LABEL_16;
        }
        objc_msgSend(v10, "setSensorID:", objc_msgSend(v6, "intValue"));
        CFTypeRef v11 = (void *)getPTTuningParametersClass();
        objc_msgSend(v10, "setHwModelID:", objc_msgSend(v11, "hwModelIDFromFigModelSpecificName:", FigCaptureGetModelSpecificName()));
        objc_msgSend((id)getPTTuningParametersClass(), "noiseScaleFactorForHwModelID:sensorID:", objc_msgSend(v10, "hwModelID"), objc_msgSend(v10, "sensorID"));
        objc_msgSend(v10, "setNoiseScaleFactor:");
        float v12 = (void *)[v5 objectForKeyedSubscript:*MEMORY[0x1E4F52CA0]];
        if (v12)
        {
          int v13 = v12;
          if ([v12 length] == 48)
          {
            [v13 getBytes:&v37 length:48];
            int32x4_t v14 = vzip1q_s32(v37, v39);
            int32x4_t v15 = vzip2q_s32(v37, v39);
            int32x4_t v16 = vzip2q_s32(v38, (int32x4_t)0);
            objc_msgSend(v10, "setExtrinsicsMatrix:", *(double *)vzip1q_s32(v14, v38).i64, *(double *)vzip2q_s32(v14, vdupq_lane_s32(*(int32x2_t *)v38.i8, 1)).i64, *(double *)vzip1q_s32(v15, v16).i64, *(double *)vzip2q_s32(v15, v16).i64);
            long long v35 = *MEMORY[0x1E4F1DB28];
            long long v36 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
            if (!FigCFDictionaryGetCGRectIfPresent()) {
              goto LABEL_25;
            }
            objc_msgSend(v10, "setSensorCropRect:", v35, v36);
            uint64_t v17 = *MEMORY[0x1E4F53E98];
            if (![v4 objectForKeyedSubscript:*MEMORY[0x1E4F53E98]]) {
              goto LABEL_25;
            }
            objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", v17), "floatValue");
            objc_msgSend(v10, "setFocalLength35mm:");
            uint64_t v18 = *MEMORY[0x1E4F54168];
            if (![v4 objectForKeyedSubscript:*MEMORY[0x1E4F54168]]
              || (uint64_t v19 = *MEMORY[0x1E4F54160], ![v4 objectForKeyedSubscript:*MEMORY[0x1E4F54160]])
              || (objc_msgSend(v10, "setRawSensorSize:", objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", v18), "intValue") | (unint64_t)(objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", v19), "intValue") << 32)), uint64_t v20 = *MEMORY[0x1E4F53D88], !objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E4F53D88]))|| (objc_msgSend(v10, "setConversionGain:", objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", v20), "intValue")), v21 = *MEMORY[0x1E4F54170], !objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E4F54170]))|| (objc_msgSend(v10, "setReadNoise1x:", objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", v21), "intValue")), v22 = *MEMORY[0x1E4F54178], !objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E4F54178])))
            {
LABEL_25:
              fig_log_get_emitter();
              return FigDebugAssert3();
            }
            objc_msgSend(v10, "setReadNoise8x:", objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", v22), "intValue"));
            __asm { FMOV            V0.2D, #1.0 }
            float64x2_t v33 = _Q0;
            float64x2_t v34 = _Q0;
            FigCFDictionaryGetCGRectIfPresent();
            objc_msgSend(v10, "setVisCropFactor:", COERCE_DOUBLE(vcvt_f32_f64(vdivq_f64(v33, v34))));
LABEL_16:
            if (IsTenBit) {
              uint64_t v29 = 10;
            }
            else {
              uint64_t v29 = 8;
            }
            [v10 setSourceColorBitDepth:v29];
            v30 = CMSampleBufferGetImageBuffer((CMSampleBufferRef)a2);
            if (v30)
            {
              int v31 = v30;
              unsigned int Width = CVPixelBufferGetWidth(v30);
              result = [*(id *)(v2 + 368) setOriginalVideoDimensions:Width | ((unint64_t)CVPixelBufferGetHeight(v31) << 32)];
              *(unsigned char *)(v2 + 392) = 1;
              return result;
            }
            goto LABEL_25;
          }
        }
      }
      fig_log_get_emitter();
      return FigDebugAssert3();
    }
  }
  return result;
}

uint64_t __57__BWRealtimeCinematographyNode__tryToEmit_captureBuffer___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isTapSpawned];
}

uint64_t __57__BWRealtimeCinematographyNode__tryToEmit_captureBuffer___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isTapSpawned];
}

- (uint64_t)_updateAutoFocus:(double)a3 finalCropRect:(double)a4
{
  if (result)
  {
    uint64_t v6 = result;
    if (*(unsigned char *)(result + 200))
    {
      *(_DWORD *)(result + 204) = (*(_DWORD *)(result + 204) + 1) % *(_DWORD *)(result + 208);
      if (!*(_DWORD *)(result + 204))
      {
        objc_msgSend((id)objc_msgSend(a2, "focusDetection"), "rect");
        double v13 = v12;
        double v15 = v14;
        double v17 = v16;
        double v19 = v18;
        result = objc_msgSend((id)objc_msgSend(a2, "focusDetection"), "detectionType");
        int v21 = *(_DWORD *)(v6 + 280);
        if (v21 != 1 && result == 100)
        {
          [*(id *)(v6 + 136) defaultContinuousAutoFocusWindowSize];
          double v23 = 0.5 - v22 * 0.5;
          [*(id *)(v6 + 136) defaultContinuousAutoFocusWindowSize];
          double v25 = 0.5 - v24 * 0.5;
          [*(id *)(v6 + 136) defaultContinuousAutoFocusWindowSize];
          double v27 = v26;
          [*(id *)(v6 + 136) defaultContinuousAutoFocusWindowSize];
          int v28 = 1;
          LODWORD(v29) = 1.0;
          result = objc_msgSend(*(id *)(v6 + 136), "setFocusModeAutoWithRect:restrictToRect:continuous:smooth:rangeRestrictionNear:rangeRestrictionFar:isFocusRectInOverscanSpace:", 0, 1, 0, 0, v23, v25, v27, v30, v29, 0.0);
LABEL_7:
          *(_DWORD *)(v6 + 280) = v28;
          return result;
        }
        if (result == 101)
        {
          v33.origin.x = v13;
          v33.origin.y = v15;
          v33.size.double width = v17;
          v33.size.double height = v19;
          result = CGRectEqualToRect(v33, *(CGRect *)(v6 + 216));
          if ((result & 1) == 0)
          {
            *(double *)(v6 + 216) = v13;
            *(double *)(v6 + 224) = v15;
            *(double *)(v6 + 232) = v17;
            *(double *)(v6 + 240) = v19;
            *(double *)(v6 + 248) = a3;
            *(double *)(v6 + 256) = a4;
            *(double *)(v6 + 264) = a5;
            *(double *)(v6 + 272) = a6;
            LODWORD(v31) = 1.0;
            result = objc_msgSend(*(id *)(v6 + 136), "setFocusModeAutoWithRect:restrictToRect:continuous:smooth:rangeRestrictionNear:rangeRestrictionFar:isFocusRectInOverscanSpace:", 0, 0, 0, 1, v13, v15, v17, v19, v31, 0.0);
            int v28 = 2;
            goto LABEL_7;
          }
        }
        else if ((unint64_t)(result - 102) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v32 = *(void **)(v6 + 136);
          if (v21 == 3)
          {
            result = objc_msgSend(v32, "setContinuousAutoFocusRect:isFocusRectInOverscanSpace:", 1, v13, v15, v17, v19);
          }
          else
          {
            LODWORD(v20) = 1.0;
            result = objc_msgSend(v32, "setFocusModeAutoWithRect:restrictToRect:continuous:smooth:rangeRestrictionNear:rangeRestrictionFar:isFocusRectInOverscanSpace:", 1, 1, 0, 1, v13, v15, v17, v19, v20, 0.0);
          }
          int v28 = 3;
          goto LABEL_7;
        }
      }
    }
  }
  return result;
}

- (void)_emitSampleBufferOnMetadataOutput:(void *)a3 cinematographyFrame:
{
  target[16] = *(CMAttachmentBearerRef *)MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v5 = a1;
    memset(&sampleTimingArray.presentationTimeStamp, 0, 48);
    *(_OWORD *)&sampleTimingArray.duration.id value = *MEMORY[0x1E4F1F9F8];
    sampleTimingArray.duration.epoch = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    CMSampleBufferGetPresentationTimeStamp(&sampleTimingArray.presentationTimeStamp, sbuf);
    sampleTimingArray.decodeTimeStamp = sampleTimingArray.duration;
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F53070];
    CMTime v7 = objc_msgSend((id)CMGetAttachment(sbuf, (CFStringRef)*MEMORY[0x1E4F53070], 0), "mutableCopy");
    unint64_t v8 = v7;
    if (a3)
    {
      uint64_t v68 = *MEMORY[0x1E4F53DC8];
      uint64_t v9 = objc_msgSend(v7, "objectForKeyedSubscript:");
      if (v9)
      {
        CFStringRef v10 = (void *)v9;
        uint64_t v82 = a3;
        CFStringRef v65 = v6;
        long long v66 = v8;
        __asm { FMOV            V0.2D, #1.0 }
        double v84 = *(double *)&_Q0;
        FigCFDictionaryGetCGRectIfPresent();
        uint64_t v67 = v5;
        double v16 = *(double *)(v5 + 248);
        double v17 = *(double *)(v5 + 256);
        double v18 = *(double *)(v5 + 264);
        id v80 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        long long v98 = 0u;
        long long v99 = 0u;
        long long v100 = 0u;
        long long v101 = 0u;
        obuint64_t j = v10;
        uint64_t v19 = [v10 countByEnumeratingWithState:&v98 objects:target count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v99;
          uint64_t v22 = *MEMORY[0x1E4F54348];
          uint64_t v23 = *MEMORY[0x1E4F53900];
          uint64_t v24 = *MEMORY[0x1E4F538F8];
          do
          {
            for (uint64_t i = 0; i != v20; ++i)
            {
              if (*(void *)v99 != v21) {
                objc_enumerationMutation(obj);
              }
              uint64_t v26 = *(void *)(*((void *)&v98 + 1) + 8 * i);
              v108[0] = v22;
              double v27 = NSNumber;
              [a3 time];
              v109[0] = [v27 numberWithLongLong:v97];
              v108[1] = v23;
              int v28 = NSNumber;
              [a3 time];
              v109[1] = [v28 numberWithLongLong:v96];
              v108[2] = v24;
              v109[2] = [MEMORY[0x1E4F1CA48] array];
              objc_msgSend(v80, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v109, v108, 3), v26);
            }
            uint64_t v20 = [obj countByEnumeratingWithState:&v98 objects:target count:16];
          }
          while (v20);
        }
        long long v94 = 0u;
        long long v95 = 0u;
        long long v92 = 0u;
        long long v93 = 0u;
        double v29 = a3;
        id v75 = (id)[a3 allDetections];
        double v30 = obj;
        uint64_t v79 = [v75 countByEnumeratingWithState:&v92 objects:v107 count:16];
        if (v79)
        {
          uint64_t v78 = *(void *)v93;
          uint64_t v76 = *MEMORY[0x1E4F538F8];
          uint64_t v31 = *MEMORY[0x1E4F53888];
          uint64_t v83 = *MEMORY[0x1E4F53E70];
          uint64_t v74 = *MEMORY[0x1E4F538E8];
          uint64_t v73 = *MEMORY[0x1E4F54180];
          uint64_t v70 = *MEMORY[0x1E4F52D48];
          uint64_t v69 = *MEMORY[0x1E4F52D40];
          uint64_t v72 = *MEMORY[0x1E4F54348];
          uint64_t v71 = *MEMORY[0x1E4F53900];
          do
          {
            for (uint64_t j = 0; j != v79; ++j)
            {
              if (*(void *)v93 != v78) {
                objc_enumerationMutation(v75);
              }
              CGRect v33 = *(void **)(*((void *)&v92 + 1) + 8 * j);
              uint64_t v34 = [v33 detectionType];
              long long v35 = (uint64_t *)MEMORY[0x1E4F538C8];
              switch(v34)
              {
                case 1:
                  goto LABEL_25;
                case 2:
                  long long v35 = (uint64_t *)MEMORY[0x1E4F538E0];
                  goto LABEL_25;
                case 3:
                  long long v35 = (uint64_t *)MEMORY[0x1E4F538C0];
                  goto LABEL_25;
                case 4:
                  long long v35 = (uint64_t *)MEMORY[0x1E4F538A0];
                  goto LABEL_25;
                case 5:
                  long long v35 = (uint64_t *)MEMORY[0x1E4F538B0];
                  goto LABEL_25;
                case 6:
                case 7:
                case 8:
                  continue;
                case 9:
                  long long v35 = (uint64_t *)MEMORY[0x1E4F538A8];
                  goto LABEL_25;
                case 10:
                  long long v35 = (uint64_t *)MEMORY[0x1E4F538B8];
                  goto LABEL_25;
                case 11:
                  goto LABEL_19;
                default:
                  if ((unint64_t)(v34 - 101) >= 2) {
                    continue;
                  }
LABEL_19:
                  long long v35 = (uint64_t *)MEMORY[0x1E4F538E8];
LABEL_25:
                  uint64_t v36 = *v35;
                  if (!*v35) {
                    continue;
                  }
                  uint64_t v81 = *v35;
                  if (![v30 objectForKeyedSubscript:*v35]) {
                    goto LABEL_39;
                  }
                  long long v90 = 0u;
                  long long v91 = 0u;
                  long long v88 = 0u;
                  long long v89 = 0u;
                  int32x4_t v37 = objc_msgSend((id)objc_msgSend(v30, "objectForKeyedSubscript:", v36), "objectForKeyedSubscript:", v76);
                  uint64_t v38 = [v37 countByEnumeratingWithState:&v88 objects:v106 count:16];
                  if (!v38) {
                    goto LABEL_39;
                  }
                  uint64_t v39 = v38;
                  uint64_t v40 = *(void *)v89;
                  break;
              }
LABEL_29:
              uint64_t v41 = 0;
              while (1)
              {
                if (*(void *)v89 != v40) {
                  objc_enumerationMutation(v37);
                }
                uint64_t v42 = *(void **)(*((void *)&v88 + 1) + 8 * v41);
                uint64_t v43 = (void *)[v42 objectForKeyedSubscript:v31];
                if (v43 || (uint64_t v43 = (void *)[v42 objectForKeyedSubscript:v83]) != 0)
                {
                  uint64_t v44 = [v33 trackIdentifier];
                  if (v44 == [v43 unsignedIntegerValue]) {
                    break;
                  }
                }
                if (v39 == ++v41)
                {
                  uint64_t v39 = [v37 countByEnumeratingWithState:&v88 objects:v106 count:16];
                  uint64_t v36 = v81;
                  double v29 = v82;
                  double v30 = obj;
                  if (v39) {
                    goto LABEL_29;
                  }
                  goto LABEL_39;
                }
              }
              uint64_t v45 = (void *)[v42 mutableCopy];
              uint64_t v36 = v81;
              double v29 = v82;
              double v30 = obj;
              if (v45) {
                goto LABEL_43;
              }
LABEL_39:
              if (v36 != v74) {
                continue;
              }
              [v33 rect];
              CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v111);
              id v47 = objc_alloc(MEMORY[0x1E4F1CA60]);
              v104[0] = v31;
              uint64_t v48 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v33, "trackIdentifier"));
              v104[1] = v73;
              v105[0] = v48;
              v105[1] = DictionaryRepresentation;
              uint64_t v45 = objc_msgSend(v47, "initWithDictionary:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v105, v104, 2));
              if (DictionaryRepresentation) {
                CFRelease(DictionaryRepresentation);
              }
              uint64_t v36 = v81;
LABEL_43:
              if ([v29 focusDetection])
              {
                uint64_t v49 = [v33 trackIdentifier];
                _ZF = v49 == objc_msgSend((id)objc_msgSend(v29, "focusDetection"), "trackIdentifier");
                uint64_t v36 = v81;
                if (_ZF)
                {
                  objc_msgSend(v45, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v29, "isFocusStrong")), v70);
                  uint64_t v50 = NSNumber;
                  BOOL v51 = objc_msgSend((id)objc_msgSend(v29, "focusDetection"), "detectionType") == 101;
                  uint64_t v52 = v50;
                  uint64_t v36 = v81;
                  objc_msgSend(v45, "setObject:forKeyedSubscript:", objc_msgSend(v52, "numberWithInt:", v51), v69);
                  if (objc_msgSend((id)objc_msgSend(v29, "focusDetection"), "detectionType") == 101)
                  {
                    [v33 rect];
                    double v57 = FigCaptureTransformRectToCoordinateSpaceOfRect(v53, v54, v55, v56, v16, v17, v18);
                    v112.origin.x = FigCaptureTransformNormalizedRectFromCoordinateSpaceOfNormalizedRect(v57, v58, v59, v60, 0.0, 0.0, v84);
                    [v45 setObject:CGRectCreateDictionaryRepresentation(v112) forKeyedSubscript:v73];
                  }
                }
              }
              long long v61 = v80;
              if (![v80 objectForKeyedSubscript:v36])
              {
                v102[0] = v72;
                double v62 = NSNumber;
                [v29 time];
                v103[0] = [v62 numberWithLongLong:v87];
                v102[1] = v71;
                id v63 = NSNumber;
                [v29 time];
                long long v64 = v63;
                long long v61 = v80;
                v103[1] = [v64 numberWithLongLong:v86];
                v102[2] = v76;
                v103[2] = [MEMORY[0x1E4F1CA48] array];
                objc_msgSend(v80, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v103, v102, 3), v36);
              }
              objc_msgSend((id)objc_msgSend((id)objc_msgSend(v61, "objectForKeyedSubscript:", v36), "objectForKeyedSubscript:", v76), "addObject:", v45);
            }
            uint64_t v79 = [v75 countByEnumeratingWithState:&v92 objects:v107 count:16];
          }
          while (v79);
        }
        unint64_t v8 = v66;
        [v66 setObject:v80 forKeyedSubscript:v68];

        uint64_t v5 = v67;
        CFStringRef v6 = v65;
      }
      [v8 setObject:0 forKeyedSubscript:*MEMORY[0x1E4F53DC0]];
    }
    target[0] = 0;
    if (!CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 1u, 0, 0, 0, 0, 1, &sampleTimingArray, 0, 0, (CMSampleBufferRef *)target)&& target[0])
    {
      CMSetAttachment(target[0], v6, v8, 1u);
      [*(id *)(v5 + 128) emitSampleBuffer:target[0]];
    }

    if (target[0]) {
      CFRelease(target[0]);
    }
  }
}

- (NSData)globalMetadata
{
  [(PTGlobalVideoMetadata *)self->_globalMetadata setMetadata:self->_globalCinematographyMetadata ofType:4];
  [(PTGlobalVideoMetadata *)self->_globalMetadata setMetadata:self->_globalRenderingMetadata ofType:2];
  [(PTGlobalVideoMetadata *)self->_globalMetadata setMetadata:self->_globalStabilizationMetadata ofType:3];
  [(PTGlobalVideoMetadata *)self->_globalMetadata setMetadata:self->_globalVideoHeaderMetadata ofType:1];
  unsigned int v3 = [(PTGlobalVideoMetadata *)self->_globalMetadata sizeOfSerializedObjectWithOptions:0];
  uint64_t v4 = (NSData *)[MEMORY[0x1E4F1CA58] dataWithLength:v3];
  [(PTGlobalVideoMetadata *)self->_globalMetadata writeToData:v4 withOptions:0];
  return v4;
}

- (BWNodeOutput)detectedObjectsOutput
{
  return self->_detectedObjectsOutput;
}

- (NSString)cinematographyModelVersionString
{
  return (NSString *)[(PTCinematographyStream *)self->_cinematographyStream modelVersionString];
}

- (id)copyCinematicVideoFocusDetections
{
  p_focusDetectionsLocuint64_t k = &self->_focusDetectionsLock;
  os_unfair_lock_lock(&self->_focusDetectionsLock);
  uint64_t v4 = (void *)[(NSMutableArray *)self->_focusDetections copy];
  os_unfair_lock_unlock(p_focusDetectionsLock);
  return v4;
}

- (void)setFocusDetectionProviderEnabled:(BOOL)a3
{
  p_focusDetectionsLocuint64_t k = &self->_focusDetectionsLock;
  os_unfair_lock_lock(&self->_focusDetectionsLock);
  self->_focusDetectionProviderEnabled = a3;
  os_unfair_lock_unlock(p_focusDetectionsLock);
}

- (BOOL)focusDetectionProviderEnabled
{
  return self->_focusDetectionProviderEnabled;
}

- (BWNodeOutput)previewOutput
{
  return self->_previewOutput;
}

- (BWNodeOutput)movieFileOutput
{
  return self->_movieFileOutput;
}

@end