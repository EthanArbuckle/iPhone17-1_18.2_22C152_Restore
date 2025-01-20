@interface BWMRCNode
+ (void)initialize;
- (BOOL)_shouldEmitSBufForBarcodeCount:(long long *)a3 originalPTS:;
- (BOOL)lowPowerModeEnabled;
- (BWMRCNode)init;
- (BWMetadataDetectedResultsObserver)detectedResultsObserver;
- (CGRect)rectOfInterest;
- (id)mrcIdentifiers;
- (id)nodeSubType;
- (id)nodeType;
- (uint64_t)_setupSampleBufferProcessor;
- (void)_newSymbologiesArrayFromIdentifiers:(uint64_t)a1;
- (void)_teardownSampleBufferProcessor;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)prepareForCurrentConfigurationToBecomeLive;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
- (void)setDetectedResultsObserver:(id)a3;
- (void)setLowPowerModeEnabled:(BOOL)a3;
- (void)setMrcIdentifiers:(id)a3;
- (void)setRectOfInterest:(CGRect)a3;
@end

@implementation BWMRCNode

- (id)nodeType
{
  return @"Effect";
}

- (void)setRectOfInterest:(CGRect)a3
{
  v10.origin.CGFloat x = 0.0;
  v10.origin.CGFloat y = 0.0;
  v10.size.CGFloat width = 1.0;
  v10.size.CGFloat height = 1.0;
  CGRect v9 = CGRectIntersection(a3, v10);
  CGFloat x = v9.origin.x;
  CGFloat y = v9.origin.y;
  CGFloat width = v9.size.width;
  CGFloat height = v9.size.height;
  if (CGRectIsEmpty(v9))
  {
    CGFloat x = *MEMORY[0x1E4F1DB28];
    CGFloat y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    CGFloat width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    CGFloat height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  os_unfair_lock_lock(&self->_rectOfInterestLock);
  v11.origin.CGFloat x = x;
  v11.origin.CGFloat y = y;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  if (!CGRectEqualToRect(self->_rectOfInterest, v11))
  {
    self->_hasPendingRectOfInterestUpdate = 1;
    self->_rectOfInterest.origin.CGFloat x = x;
    self->_rectOfInterest.origin.CGFloat y = y;
    self->_rectOfInterest.size.CGFloat width = width;
    self->_rectOfInterest.size.CGFloat height = height;
  }
  os_unfair_lock_unlock(&self->_rectOfInterestLock);
}

- (void)setMrcIdentifiers:(id)a3
{
  v5 = (NSArray *)[a3 copy];
  self->_mrcIdentifiers = v5;
  [(BWNodeOutput *)self->super._output setFormat:+[BWMetadataObjectFormat formatWithMetadataIdentifiers:v5]];

  self->_symbologiesArraCGFloat y = (NSArray *)-[BWMRCNode _newSymbologiesArrayFromIdentifiers:]((uint64_t)self, self->_mrcIdentifiers);
}

- (void)setLowPowerModeEnabled:(BOOL)a3
{
  self->_lowPowerModeEnabled = a3;
}

- (void)setDetectedResultsObserver:(id)a3
{
  self->_detectedResultsObserver = (BWMetadataDetectedResultsObserver *)a3;
}

- (void)_newSymbologiesArrayFromIdentifiers:(uint64_t)a1
{
  v46[19] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if (!*(void *)(a1 + 176))
  {
    uint64_t v4 = *MEMORY[0x1E4F943B8];
    uint64_t v5 = *MEMORY[0x1E4F21858];
    v45[0] = *MEMORY[0x1E4F21850];
    v45[1] = v5;
    uint64_t v6 = *MEMORY[0x1E4F943C0];
    v46[0] = v4;
    v46[1] = v6;
    uint64_t v7 = *MEMORY[0x1E4F94440];
    uint64_t v8 = *MEMORY[0x1E4F21830];
    v45[2] = *MEMORY[0x1E4F21880];
    v45[3] = v8;
    uint64_t v9 = *MEMORY[0x1E4F94380];
    v46[2] = v7;
    v46[3] = v9;
    uint64_t v10 = *MEMORY[0x1E4F94388];
    uint64_t v11 = *MEMORY[0x1E4F21840];
    v45[4] = *MEMORY[0x1E4F21838];
    v45[5] = v11;
    uint64_t v12 = *MEMORY[0x1E4F943A0];
    v46[4] = v10;
    v46[5] = v12;
    uint64_t v13 = *MEMORY[0x1E4F94378];
    uint64_t v14 = *MEMORY[0x1E4F21860];
    v45[6] = *MEMORY[0x1E4F21828];
    v45[7] = v14;
    uint64_t v15 = *MEMORY[0x1E4F943E0];
    v46[6] = v13;
    v46[7] = v15;
    uint64_t v16 = *MEMORY[0x1E4F943F0];
    uint64_t v17 = *MEMORY[0x1E4F21848];
    v45[8] = *MEMORY[0x1E4F21868];
    v45[9] = v17;
    uint64_t v18 = *MEMORY[0x1E4F943B0];
    v46[8] = v16;
    v46[9] = v18;
    uint64_t v19 = *MEMORY[0x1E4F94438];
    uint64_t v20 = *MEMORY[0x1E4F21820];
    v45[10] = *MEMORY[0x1E4F21878];
    v45[11] = v20;
    uint64_t v21 = *MEMORY[0x1E4F94368];
    v46[10] = v19;
    v46[11] = v21;
    uint64_t v22 = *MEMORY[0x1E4F94410];
    uint64_t v23 = *MEMORY[0x1E4F55998];
    v45[12] = *MEMORY[0x1E4F21870];
    v45[13] = v23;
    uint64_t v24 = *MEMORY[0x1E4F94370];
    v46[12] = v22;
    v46[13] = v24;
    uint64_t v25 = *MEMORY[0x1E4F943C8];
    uint64_t v26 = *MEMORY[0x1E4F559A8];
    v45[14] = *MEMORY[0x1E4F559A0];
    v45[15] = v26;
    uint64_t v27 = *MEMORY[0x1E4F943D0];
    v46[14] = v25;
    v46[15] = v27;
    uint64_t v28 = *MEMORY[0x1E4F943D8];
    uint64_t v29 = *MEMORY[0x1E4F559C0];
    v45[16] = *MEMORY[0x1E4F559B0];
    v45[17] = v29;
    uint64_t v30 = *MEMORY[0x1E4F94408];
    v46[16] = v28;
    v46[17] = v30;
    v45[18] = *MEMORY[0x1E4F559B8];
    v46[18] = *MEMORY[0x1E4F94400];
    v31 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:19];
    *(void *)(a1 + 176) = v31;
    id v32 = v31;
  }
  v33 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a2, "count"));
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v34 = [a2 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        if (*(void *)v41 != v36) {
          objc_enumerationMutation(a2);
        }
        uint64_t v38 = *(void *)(*((void *)&v40 + 1) + 8 * i);
        if ([*(id *)(a1 + 176) objectForKey:v38]) {
          objc_msgSend(v33, "addObject:", objc_msgSend(*(id *)(a1 + 176), "objectForKeyedSubscript:", v38));
        }
      }
      uint64_t v35 = [a2 countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v35);
  }
  return v33;
}

- (BWMRCNode)init
{
  v9.receiver = self;
  v9.super_class = (Class)BWMRCNode;
  v2 = [(BWNode *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_createSampleBufferProcessorFunction = mrcn_createSampleBufferProcessor;
    v2->_symbologiesArraCGFloat y = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    CGSize v4 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    v3->_rectOfInterest.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    v3->_rectOfInterest.size = v4;
    v3->_rectOfInterestLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v3];
    [(BWNodeInput *)v5 setIndefinitelyHeldBufferCount:1];
    uint64_t v6 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWNodeInput *)v5 setFormatRequirements:v6];

    [(BWNode *)v3 addInput:v5];
    [(BWFormatRequirements *)[(BWNodeInput *)v3->super._input formatRequirements] setSupportedPixelFormats:&unk_1EFB02D80];
    uint64_t v7 = [[BWNodeOutput alloc] initWithMediaType:1836016234 node:v3];
    [(BWNodeOutput *)v7 setFormat:+[BWMetadataObjectFormat formatWithMetadataIdentifiers:0]];
    [(BWNode *)v3 addOutput:v7];
  }
  return v3;
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  v3.receiver = self;
  v3.super_class = (Class)BWMRCNode;
  [(BWNode *)&v3 prepareForCurrentConfigurationToBecomeLive];
  if (!self->_sampleBufferProcessor)
  {
    if (-[BWMRCNode _setupSampleBufferProcessor]((uint64_t)self))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
  }
}

- (uint64_t)_setupSampleBufferProcessor
{
  if (!a1) {
    return 0;
  }
  uint64_t v32 = 0;
  v2 = *(void (**)(void, void, uint64_t *))(a1 + 96);
  if (!v2)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  v2(*MEMORY[0x1E4F1CF80], 0, &v32);
  uint64_t v3 = v32;
  *(void *)(a1 + 104) = v32;
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(uint64_t (**)(uint64_t, void, uint64_t))(v5 + 8);
  if (!v6)
  {
    uint64_t v11 = 4294954514;
LABEL_11:
    fig_log_get_emitter();
    FigDebugAssert3();
    return v11;
  }
  uint64_t v7 = v6(v3, mrcn_processorOutputReadyCallback, a1);
  if (v7)
  {
    uint64_t v11 = v7;
    goto LABEL_11;
  }
  uint64_t FigBaseObject = FigSampleBufferProcessorGetFigBaseObject();
  uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v12 = *(void (**)(uint64_t, void, void))(v10 + 56);
  if (v12) {
    v12(FigBaseObject, *MEMORY[0x1E4F52C38], *MEMORY[0x1E4F1CFD0]);
  }
  uint64_t v13 = *(void *)(a1 + 112);
  if (v13)
  {
    uint64_t v14 = FigSampleBufferProcessorGetFigBaseObject();
    uint64_t v15 = *(void *)(CMBaseObjectGetVTable() + 8);
    uint64_t v16 = v15 ? v15 : 0;
    uint64_t v17 = *(void (**)(uint64_t, void, uint64_t))(v16 + 56);
    if (v17) {
      v17(v14, *MEMORY[0x1E4F52C50], v13);
    }
  }
  if (!CGRectIsNull(*(CGRect *)(a1 + 136)))
  {
    CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(*(CGRect *)(a1 + 136));
    uint64_t v19 = FigSampleBufferProcessorGetFigBaseObject();
    uint64_t v20 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v20) {
      uint64_t v21 = v20;
    }
    else {
      uint64_t v21 = 0;
    }
    uint64_t v22 = *(void (**)(uint64_t, void, CFDictionaryRef))(v21 + 56);
    if (v22) {
      v22(v19, *MEMORY[0x1E4F52C28], DictionaryRepresentation);
    }
    if (DictionaryRepresentation) {
      CFRelease(DictionaryRepresentation);
    }
  }
  if (*(unsigned char *)(a1 + 173))
  {
    uint64_t v23 = FigSampleBufferProcessorGetFigBaseObject();
    uint64_t v24 = *(void *)(CMBaseObjectGetVTable() + 8);
    uint64_t v25 = v24 ? v24 : 0;
    uint64_t v26 = *(void (**)(uint64_t, void, void))(v25 + 56);
    if (v26) {
      v26(v23, *MEMORY[0x1E4F52C30], MEMORY[0x1E4F1CC38]);
    }
  }
  uint64_t v27 = FigSampleBufferProcessorGetFigBaseObject();
  uint64_t v28 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v28) {
    uint64_t v29 = v28;
  }
  else {
    uint64_t v29 = 0;
  }
  uint64_t v30 = *(uint64_t (**)(uint64_t, void, void))(v29 + 56);
  if (v30) {
    return v30(v27, *MEMORY[0x1E4F52C40], 0);
  }
  else {
    return 4294954514;
  }
}

+ (void)initialize
{
}

- (void)dealloc
{
  sampleBufferProcessor = self->_sampleBufferProcessor;
  if (sampleBufferProcessor)
  {
    uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v4) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
    uint64_t v6 = *(void (**)(OpaqueFigSampleBufferProcessor *, void, void))(v5 + 8);
    if (v6) {
      v6(sampleBufferProcessor, 0, 0);
    }
    uint64_t FigBaseObject = FigSampleBufferProcessorGetFigBaseObject();
    if (FigBaseObject)
    {
      uint64_t v8 = FigBaseObject;
      uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 8);
      uint64_t v10 = v9 ? v9 : 0;
      uint64_t v11 = *(void (**)(uint64_t))(v10 + 24);
      if (v11) {
        v11(v8);
      }
    }
    uint64_t v12 = self->_sampleBufferProcessor;
    if (v12)
    {
      CFRelease(v12);
      self->_sampleBufferProcessor = 0;
    }
  }

  v13.receiver = self;
  v13.super_class = (Class)BWMRCNode;
  [(BWNode *)&v13 dealloc];
}

- (id)nodeSubType
{
  return @"MRCProcessor";
}

- (id)mrcIdentifiers
{
  return self->_mrcIdentifiers;
}

- (CGRect)rectOfInterest
{
  double x = self->_rectOfInterest.origin.x;
  double y = self->_rectOfInterest.origin.y;
  double width = self->_rectOfInterest.size.width;
  double height = self->_rectOfInterest.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)lowPowerModeEnabled
{
  return self->_lowPowerModeEnabled;
}

- (void)didReachEndOfDataForInput:(id)a3
{
  -[BWMRCNode _teardownSampleBufferProcessor]((uint64_t)self);
  v5.receiver = self;
  v5.super_class = (Class)BWMRCNode;
  [(BWNode *)&v5 didReachEndOfDataForInput:a3];
}

- (void)_teardownSampleBufferProcessor
{
  if (a1)
  {
    uint64_t v2 = *(void *)(a1 + 104);
    if (v2)
    {
      uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v3) {
        uint64_t v4 = v3;
      }
      else {
        uint64_t v4 = 0;
      }
      objc_super v5 = *(void (**)(uint64_t))(v4 + 24);
      if (v5) {
        v5(v2);
      }
      uint64_t v6 = *(const void **)(a1 + 104);
      if (v6)
      {
        CFRelease(v6);
        *(void *)(a1 + 104) = 0;
      }
    }
  }
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t v6 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53000], 0);
  uint64_t v7 = v6;
  if (v6) {
    dispatch_group_enter(v6);
  }
  uint64_t v8 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53120], 0);
  if (!v8
    || ([v8 BOOLValue] & 1) != 0
    || ((uint64_t v9 = FigSampleBufferProcessorGetFigBaseObject(), (v10 = *(void *)(CMBaseObjectGetVTable() + 8)) == 0)
      ? (uint64_t v11 = 0)
      : (uint64_t v11 = v10),
        (uint64_t v12 = *(unsigned int (**)(uint64_t, void, void))(v11 + 56)) != 0
     && !v12(v9, *MEMORY[0x1E4F52C48], 0)))
  {
    os_unfair_lock_lock(&self->_rectOfInterestLock);
    BOOL hasPendingRectOfInterestUpdate = self->_hasPendingRectOfInterestUpdate;
    CGFloat x = self->_rectOfInterest.origin.x;
    CGFloat y = self->_rectOfInterest.origin.y;
    CGFloat width = self->_rectOfInterest.size.width;
    CGFloat height = self->_rectOfInterest.size.height;
    self->_BOOL hasPendingRectOfInterestUpdate = 0;
    os_unfair_lock_unlock(&self->_rectOfInterestLock);
    v29.origin.CGFloat x = x;
    v29.origin.CGFloat y = y;
    v29.size.CGFloat width = width;
    v29.size.CGFloat height = height;
    IsEmptCGFloat y = CGRectIsEmpty(v29);
    if (hasPendingRectOfInterestUpdate)
    {
      v30.origin.CGFloat x = x;
      v30.origin.CGFloat y = y;
      v30.size.CGFloat width = width;
      v30.size.CGFloat height = height;
      if (!CGRectIsNull(v30))
      {
        v31.origin.CGFloat x = x;
        v31.origin.CGFloat y = y;
        v31.size.CGFloat width = width;
        v31.size.CGFloat height = height;
        CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v31);
        uint64_t FigBaseObject = FigSampleBufferProcessorGetFigBaseObject();
        uint64_t v21 = *(void *)(CMBaseObjectGetVTable() + 8);
        if (v21) {
          uint64_t v22 = v21;
        }
        else {
          uint64_t v22 = 0;
        }
        uint64_t v23 = *(void (**)(uint64_t, void, CFDictionaryRef))(v22 + 56);
        if (v23) {
          v23(FigBaseObject, *MEMORY[0x1E4F52C28], DictionaryRepresentation);
        }
        if (DictionaryRepresentation) {
          CFRelease(DictionaryRepresentation);
        }
      }
    }
    if (!IsEmpty)
    {
      sampleBufferProcessor = self->_sampleBufferProcessor;
      uint64_t v25 = *(void *)(CMBaseObjectGetVTable() + 16);
      uint64_t v26 = v25 ? v25 : 0;
      uint64_t v27 = *(void (**)(OpaqueFigSampleBufferProcessor *, opaqueCMSampleBuffer *))(v26 + 16);
      if (v27) {
        v27(sampleBufferProcessor, a3);
      }
    }
  }
  if (v7)
  {
    dispatch_group_leave(v7);
  }
}

- (BOOL)_shouldEmitSBufForBarcodeCount:(long long *)a3 originalPTS:
{
  if (!a1) {
    return 0;
  }
  uint64_t v4 = a2;
  if (!a2) {
    uint64_t v4 = *(void *)(a1 + 128);
  }
  BOOL v5 = v4 > 0;
  *(void *)(a1 + 128) = a2;
  uint64_t v6 = *(void **)(a1 + 184);
  long long v8 = *a3;
  uint64_t v9 = *((void *)a3 + 2);
  [v6 node:a1 didEmitCodesCount:a2 emittedIdentifiers:0 originalPTS:&v8];
  return v5;
}

- (BWMetadataDetectedResultsObserver)detectedResultsObserver
{
  return self->_detectedResultsObserver;
}

@end