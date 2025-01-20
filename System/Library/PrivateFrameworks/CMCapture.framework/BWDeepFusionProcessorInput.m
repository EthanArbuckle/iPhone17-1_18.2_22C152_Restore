@interface BWDeepFusionProcessorInput
+ (id)inputForOnlyApplyingSemanticStyleWithSettings:(id)a3 portType:(id)a4;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)evZeroReferenceFramePTS;
- (BOOL)onlyApplyingSemanticStyle;
- (BOOL)processInferenceInputImage;
- (BOOL)processQuadraForEnhancedResolutionInferenceInputImage;
- (BOOL)processSmartStyleRenderingInput;
- (BWDeepFusionProcessorInput)initWithSettings:(id)a3 portType:(id)a4 processInferenceInputImage:(BOOL)a5 processQuadraForEnhancedResolutionInferenceInputImage:(BOOL)a6 processSmartStyleRenderingInput:(BOOL)a7;
- (BWDeepFusionProcessorInputDelegate)delegate;
- (NSArray)inputBuffers;
- (NSArray)providedInferenceAttachedMedia;
- (NSDictionary)evZeroReferenceFrameAttachments;
- (id)description;
- (int)fusionMode;
- (void)addBuffer:(__CVBuffer *)a3 metadata:(id)a4 bufferType:(unint64_t)a5 captureFrameFlags:(unint64_t)a6;
- (void)addBuffer:(__CVBuffer *)a3 metadata:(id)a4 bufferType:(unint64_t)a5 captureFrameFlags:(unint64_t)a6 lscGainMap:(__CVBuffer *)a7 lscGainMapParameters:(id)a8;
- (void)allInferencesDelivered;
- (void)beginProcessingCachedBuffersIfWaiting;
- (void)dealloc;
- (void)releaseInputPixelBuffers;
- (void)setDelegate:(id)a3;
- (void)setEvZeroReferenceFrameAttachments:(id)a3;
- (void)setEvZeroReferenceFramePTS:(id *)a3;
- (void)setFusionMode:(int)a3;
- (void)setProvidedInferenceAttachedMedia:(id)a3;
@end

@implementation BWDeepFusionProcessorInput

- (BWDeepFusionProcessorInput)initWithSettings:(id)a3 portType:(id)a4 processInferenceInputImage:(BOOL)a5 processQuadraForEnhancedResolutionInferenceInputImage:(BOOL)a6 processSmartStyleRenderingInput:(BOOL)a7
{
  v12.receiver = self;
  v12.super_class = (Class)BWDeepFusionProcessorInput;
  v10 = [(BWStillImageProcessorControllerInput *)&v12 initWithSettings:a3 portType:a4];
  if (v10)
  {
    v10->_inputBuffers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v10->_processInferenceInputImage = a5;
    v10->_processQuadraForEnhancedResolutionInferenceInputImage = a6;
    v10->_processSmartStyleRenderingInput = a7;
  }
  return v10;
}

+ (id)inputForOnlyApplyingSemanticStyleWithSettings:(id)a3 portType:(id)a4
{
  v4 = [[BWDeepFusionProcessorInput alloc] initWithSettings:a3 portType:a4 processInferenceInputImage:0 processQuadraForEnhancedResolutionInferenceInputImage:0 processSmartStyleRenderingInput:0];
  if (v4) {
    v4->_onlyApplyingSemanticStyle = 1;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWDeepFusionProcessorInput;
  [(BWStillImageProcessorControllerInput *)&v3 dealloc];
}

- (void)addBuffer:(__CVBuffer *)a3 metadata:(id)a4 bufferType:(unint64_t)a5 captureFrameFlags:(unint64_t)a6
{
}

- (void)addBuffer:(__CVBuffer *)a3 metadata:(id)a4 bufferType:(unint64_t)a5 captureFrameFlags:(unint64_t)a6 lscGainMap:(__CVBuffer *)a7 lscGainMapParameters:(id)a8
{
  if (a3)
  {
    if (a5 != 24)
    {
      inputBuffers = self->_inputBuffers;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __110__BWDeepFusionProcessorInput_addBuffer_metadata_bufferType_captureFrameFlags_lscGainMap_lscGainMapParameters___block_invoke;
      v18[3] = &__block_descriptor_40_e40_B32__0__BWDeepFusionInputBuffer_8Q16_B24l;
      v18[4] = a5;
      v16 = (void *)[(NSMutableArray *)inputBuffers indexesOfObjectsPassingTest:v18];
      [(NSMutableArray *)self->_inputBuffers removeObjectsAtIndexes:v16];
      [v16 count];
    }
    v17 = [[BWDeepFusionInputBuffer alloc] initWithBuffer:a3 type:a5 captureFrameFlags:a6 metadata:a4 lscGainMap:a7 lscGainMapParameters:a8];
    [(NSMutableArray *)self->_inputBuffers addObject:v17];

    [(BWDeepFusionProcessorInputDelegate *)self->_delegate input:self addInputBuffer:v17];
  }
  else
  {
    FigDebugAssert3();
  }
}

BOOL __110__BWDeepFusionProcessorInput_addBuffer_metadata_bufferType_captureFrameFlags_lscGainMap_lscGainMapParameters___block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == *(void *)(a1 + 32);
}

- (void)allInferencesDelivered
{
  self->_allInferencesDelivered = 1;
  [(BWDeepFusionProcessorInputDelegate *)self->_delegate addInferencesForInput:self];
}

- (void)beginProcessingCachedBuffersIfWaiting
{
}

- (void)releaseInputPixelBuffers
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  inputBuffers = self->_inputBuffers;
  uint64_t v3 = [(NSMutableArray *)inputBuffers countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(inputBuffers);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * i) releasePixelBuffers];
      }
      uint64_t v4 = [(NSMutableArray *)inputBuffers countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)description
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v16 = self;
  inputBuffers = self->_inputBuffers;
  uint64_t v5 = [(NSMutableArray *)inputBuffers countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(inputBuffers);
        }
        long long v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([v10 type] == 24 || objc_msgSend(v10, "type") == 23 || objc_msgSend(v10, "type") == 25) {
          uint64_t v7 = (v7 + 1);
        }
        switch([v10 type])
        {
          case 8:
            v11 = v3;
            uint64_t v12 = @"SynthRef";
            break;
          case 9:
            v11 = v3;
            uint64_t v12 = @"SynthRefFusMap";
            break;
          case 10:
            v11 = v3;
            uint64_t v12 = @"SynthLong";
            break;
          case 11:
            v11 = v3;
            uint64_t v12 = @"SynthLongFusMap";
            break;
          case 12:
            v11 = v3;
            uint64_t v12 = @"LongFusMap";
            break;
          case 13:
            v11 = v3;
            uint64_t v12 = @"DeepFusion";
            break;
          case 19:
            v11 = v3;
            uint64_t v12 = @"GainMap";
            break;
          case 22:
            v11 = v3;
            uint64_t v12 = @"Long";
            break;
          case 23:
            v11 = v3;
            uint64_t v12 = @"RefEV0";
            break;
          case 24:
            v11 = v3;
            uint64_t v12 = @"EV0";
            break;
          case 25:
            v11 = v3;
            uint64_t v12 = @"QuadraEV0";
            break;
          case 27:
            v11 = v3;
            uint64_t v12 = @"EV-";
            break;
          default:
            uint64_t v12 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"Unknown (%llu)", objc_msgSend(v10, "type"));
            v11 = v3;
            break;
        }
        [v11 addObject:v12];
      }
      uint64_t v6 = [(NSMutableArray *)inputBuffers countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
  }
  [v3 sortUsingSelector:sel_compare_];
  v13 = NSString;
  uint64_t v14 = objc_opt_class();
  return (id)[v13 stringWithFormat:@"<%@ %p>: captureID:%lld, captureType=%@ %@ : Buffer types: %@, evZeroCount:%d processInferenceInputImage:%d, onlyApplyingSemanticStyle:%d", v14, v16, -[BWStillImageCaptureSettings settingsID](-[BWStillImageProcessorControllerInput captureSettings](v16, "captureSettings"), "settingsID"), BWPhotoEncoderStringFromEncodingScheme(-[BWStillImageCaptureSettings captureType](-[BWStillImageProcessorControllerInput captureSettings](v16, "captureSettings"), "captureType")), -[BWStillImageCaptureStreamSettings portType](-[BWStillImageProcessorControllerInput captureStreamSettings](v16, "captureStreamSettings"), "portType"), objc_msgSend(v3, "componentsJoinedByString:", @", "), v7, -[BWDeepFusionProcessorInput processInferenceInputImage](v16, "processInferenceInputImage"), -[BWDeepFusionProcessorInput onlyApplyingSemanticStyle](v16, "onlyApplyingSemanticStyle")];
}

- (NSArray)inputBuffers
{
  return &self->_inputBuffers->super;
}

- (BWDeepFusionProcessorInputDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (int)fusionMode
{
  return self->_fusionMode;
}

- (void)setFusionMode:(int)a3
{
  self->_fusionMode = a3;
}

- (NSDictionary)evZeroReferenceFrameAttachments
{
  return self->_evZeroReferenceFrameAttachments;
}

- (void)setEvZeroReferenceFrameAttachments:(id)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)evZeroReferenceFramePTS
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 56);
  return self;
}

- (void)setEvZeroReferenceFramePTS:(id *)a3
{
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->_evZeroReferenceFramePTS.value = *(_OWORD *)&a3->var0;
  self->_evZeroReferenceFramePTS.epoch = var3;
}

- (NSArray)providedInferenceAttachedMedia
{
  return self->_providedInferenceAttachedMedia;
}

- (void)setProvidedInferenceAttachedMedia:(id)a3
{
}

- (BOOL)processInferenceInputImage
{
  return self->_processInferenceInputImage;
}

- (BOOL)processQuadraForEnhancedResolutionInferenceInputImage
{
  return self->_processQuadraForEnhancedResolutionInferenceInputImage;
}

- (BOOL)onlyApplyingSemanticStyle
{
  return self->_onlyApplyingSemanticStyle;
}

- (BOOL)processSmartStyleRenderingInput
{
  return self->_processSmartStyleRenderingInput;
}

@end