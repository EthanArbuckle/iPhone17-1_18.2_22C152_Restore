@interface VNGeneratePersonSegmentationRequest
+ (Class)configurationClass;
+ (const)revisionAvailability;
+ (id)descriptionForPrivateRevision:(unint64_t)a3;
+ (id)privateRevisionsSet;
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (BOOL)useTiling;
- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3;
- (OSType)outputPixelFormat;
- (VNGeneratePersonSegmentationRequest)init;
- (VNGeneratePersonSegmentationRequest)initWithCompletionHandler:(VNRequestCompletionHandler)completionHandler;
- (VNGeneratePersonSegmentationRequestQualityLevel)qualityLevel;
- (float)minimumConfidence;
- (id)_internalPerformRevision:(void *)a3 session:(uint64_t)a4 qosClass:(void *)a5 generatorOptions:(uint64_t)a6 error:;
- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4;
- (id)description;
- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4;
- (id)supportedOutputPixelFormatsAndReturnError:(id *)a3;
- (int64_t)dependencyProcessingOrdinality;
- (uint64_t)keepRawOutputMask;
- (void)applyConfigurationOfRequest:(id)a3;
- (void)setMinimumConfidence:(float)a3;
- (void)setOutputPixelFormat:(OSType)outputPixelFormat;
- (void)setQualityLevel:(VNGeneratePersonSegmentationRequestQualityLevel)qualityLevel;
- (void)setUseTiling:(BOOL)a3;
@end

@implementation VNGeneratePersonSegmentationRequest

- (void).cxx_destruct
{
}

- (id)description
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__VNGeneratePersonSegmentationRequest_description__block_invoke;
  aBlock[3] = &unk_1E5B1DBE8;
  aBlock[4] = self;
  v3 = (void (**)(void *, VNGeneratePersonSegmentationRequestQualityLevel))_Block_copy(aBlock);
  id v4 = [NSString alloc];
  v13.receiver = self;
  v13.super_class = (Class)VNGeneratePersonSegmentationRequest;
  v5 = [(VNStatefulRequest *)&v13 description];
  v6 = v3[2](v3, [(VNGeneratePersonSegmentationRequest *)self qualityLevel]);
  v7 = (void *)[v4 initWithFormat:@"%@ qualityLevel=%@", v5, v6];

  if ([(VNRequest *)self resolvedRevision] >= 0xDECAF000)
  {
    id v8 = [NSString alloc];
    BOOL v9 = [(VNGeneratePersonSegmentationRequest *)self useTiling];
    [(VNGeneratePersonSegmentationRequest *)self minimumConfidence];
    uint64_t v11 = [v8 initWithFormat:@"%@ useTiling=%d minimumConfidence=%f", v7, v9, v10];

    v7 = (void *)v11;
  }

  return v7;
}

uint64_t __50__VNGeneratePersonSegmentationRequest_description__block_invoke(uint64_t a1)
{
  unint64_t v1 = [*(id *)(a1 + 32) qualityLevel];
  if (v1 > 2) {
    return 0;
  }
  else {
    return *((void *)&off_1E5B1DC08 + v1);
  }
}

- (void)setMinimumConfidence:(float)a3
{
  id v5 = [(VNRequest *)self configuration];
  *(float *)&double v4 = a3;
  [v5 setMinimumConfidence:v4];
}

- (float)minimumConfidence
{
  v2 = [(VNRequest *)self configuration];
  [v2 minimumConfidence];
  float v4 = v3;

  return v4;
}

- (void)setUseTiling:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(VNRequest *)self configuration];
  [v4 setUseTiling:v3];
}

- (BOOL)useTiling
{
  v2 = [(VNRequest *)self configuration];
  char v3 = [v2 useTiling];

  return v3;
}

- (void)setOutputPixelFormat:(OSType)outputPixelFormat
{
  uint64_t v3 = *(void *)&outputPixelFormat;
  id v4 = [(VNRequest *)self configuration];
  [v4 setOutputPixelFormat:v3];
}

- (OSType)outputPixelFormat
{
  v2 = [(VNRequest *)self configuration];
  OSType v3 = [v2 outputPixelFormat];

  return v3;
}

- (id)supportedOutputPixelFormatsAndReturnError:(id *)a3
{
  id v8 = 0;
  id v4 = [(VNRequest *)self applicableDetectorClassAndOptions:&v8 forRevision:[(VNRequest *)self resolvedRevision] error:a3];
  id v5 = v8;
  if (v4)
  {
    v6 = [(objc_class *)v4 supportedOutputPixelFormatsForOptions:v5 error:a3];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)setQualityLevel:(VNGeneratePersonSegmentationRequestQualityLevel)qualityLevel
{
  id v4 = [(VNRequest *)self configuration];
  [v4 setQualityLevel:qualityLevel];
}

- (VNGeneratePersonSegmentationRequestQualityLevel)qualityLevel
{
  v2 = [(VNRequest *)self configuration];
  VNGeneratePersonSegmentationRequestQualityLevel v3 = [v2 qualityLevel];

  return v3;
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  v51[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  BOOL v9 = [v8 imageBufferAndReturnError:a5];
  if (v9)
  {
    v45 = [v8 session];
    unsigned int v43 = [v8 qosClass];
    id v44 = [(VNGeneratePersonSegmentationRequest *)self newDefaultDetectorOptionsForRequestRevision:a3 session:v45];
    v46 = v9;
    float v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
    [v44 setObject:v10 forKeyedSubscript:@"VNDetectorProcessOption_InputImageBuffers"];

    VNGeneratePersonSegmentationRequestQualityLevel v11 = [(VNGeneratePersonSegmentationRequest *)self qualityLevel];
    if (v11)
    {
      if (v11 == VNGeneratePersonSegmentationRequestQualityLevelBalanced)
      {
        if (a5)
        {
          v19 = 0;
          id v33 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Balanced quality level is handled by compound request"];
          goto LABEL_37;
        }
      }
      else
      {
        if (v11 == VNGeneratePersonSegmentationRequestQualityLevelFast)
        {
          id v41 = v45;
          id v12 = v9;
          id v13 = v44;
          v38 = v12;
          if (self)
          {
            unint64_t v39 = [v12 width];
            unint64_t v37 = [v12 height];
            [v13 setObject:&unk_1EF7A72B0 forKeyedSubscript:@"VNSegmentationGeneratorProcessOption_QualityLevel"];
            v50 = (void *)VNPersonSegmentationGeneratorFastOutputBlobNameMask;
            v14 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[VNGeneratePersonSegmentationRequest outputPixelFormat](self, "outputPixelFormat"));
            v51[0] = v14;
            v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:&v50 count:1];
            [v13 setObject:v15 forKeyedSubscript:@"VNSegmentationGeneratorProcessOption_OutputPixelFormat"];

            uint64_t v48 = VNPersonSegmentationGeneratorFastOutputBlobNameMask;
            uint64_t v49 = MEMORY[0x1E4F1CC28];
            v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
            [v13 setObject:v16 forKeyedSubscript:@"VNSegmentationGeneratorProcessOption_KeepRawOutputMask"];

            v17 = @"portrait";
            if (v39 > v37) {
              v17 = @"landscape";
            }
            v18 = v17;
            [v13 setObject:v18 forKeyedSubscript:@"VNEspressoModelFileBasedDetectorOption_NetworkConfiguration"];
            if (self->_previousObservations && v39 == self->_previousImageWidth && v37 == self->_previousImageHeight) {
              objc_msgSend(v13, "setObject:forKeyedSubscript:");
            }
            v19 = -[VNGeneratePersonSegmentationRequest _internalPerformRevision:session:qosClass:generatorOptions:error:](self, a3, v41, v43, v13, (uint64_t)a5);
            if (v19)
            {
              objc_storeStrong((id *)&self->_previousObservations, v19);
              self->_previousImageWidth = [v38 width];
              self->_previousImageHeight = [v38 height];
              id v20 = v19;
            }
          }
          else
          {
            v19 = 0;
          }

          goto LABEL_35;
        }
        if (a5)
        {
          v34 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[VNGeneratePersonSegmentationRequest qualityLevel](self, "qualityLevel"));
          id v35 = +[VNError errorForInvalidOption:v34 named:@"qualityLevel"];
        }
      }
      BOOL v21 = 0;
      v19 = 0;
LABEL_38:

      goto LABEL_39;
    }
    id v40 = v45;
    id v22 = v8;
    id v42 = v44;
    if (self)
    {
      v23 = objc_alloc_init(VNGeneratePersonSegmentationRequest);
      [(VNGeneratePersonSegmentationRequest *)v23 applyConfigurationOfRequest:self];
      [(VNGeneratePersonSegmentationRequest *)v23 setQualityLevel:1];
      for (uint64_t i = 0; i != 12; i += 4)
      {
        -[VNGeneratePersonSegmentationRequest setOutputPixelFormat:](v23, "setOutputPixelFormat:", *(unsigned int *)&-[VNGeneratePersonSegmentationRequest _internalPerformAccurateRevision:session:inContext:qosClass:generatorOptions:error:]::pixelFormatTypes[i]);
        v25 = [v22 cachedObservationsAcceptedByRequest:v23];
        if (v25) {
          goto LABEL_26;
        }
      }
      [(VNGeneratePersonSegmentationRequest *)v23 setOutputPixelFormat:1278226534];
      if (v23)
      {
        v26 = [(VNRequest *)v23 configuration];
        [v26 setKeepRawOutputMask:1];
      }
      v25 = [v22 requestPerformerAndReturnError:a5];
      if (v25)
      {
        v51[0] = v23;
        v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:1];
        char v28 = [v25 performDependentRequests:v27 onBehalfOfRequest:self inContext:v22 error:a5];

        if (v28)
        {
          uint64_t v29 = [(VNRequest *)v23 results];

          v25 = (void *)v29;
LABEL_26:
          [v42 setObject:&unk_1EF7A7298 forKeyedSubscript:@"VNSegmentationGeneratorProcessOption_QualityLevel"];
          uint64_t v49 = VNPersonSegmentationGeneratorLearnedMattingOutputBlobNameMask;
          v30 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[VNGeneratePersonSegmentationRequest outputPixelFormat](self, "outputPixelFormat"));
          v50 = v30;
          v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
          [v42 setObject:v31 forKeyedSubscript:@"VNSegmentationGeneratorProcessOption_OutputPixelFormat"];

          uint64_t v47 = VNPersonSegmentationGeneratorLearnedMattingOutputBlobNameMask;
          uint64_t v48 = MEMORY[0x1E4F1CC28];
          v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
          [v42 setObject:v32 forKeyedSubscript:@"VNSegmentationGeneratorProcessOption_KeepRawOutputMask"];

          [v42 setObject:v25 forKeyedSubscript:@"VNSegmentationGeneratorProcessOption_MaskImageObservations"];
          v19 = -[VNGeneratePersonSegmentationRequest _internalPerformRevision:session:qosClass:generatorOptions:error:](self, a3, v40, v43, v42, (uint64_t)a5);
          goto LABEL_33;
        }
      }
      v19 = 0;
LABEL_33:
    }
    else
    {
      v19 = 0;
    }

LABEL_35:
    if (v19)
    {
      [(VNRequest *)self setResults:v19];
      BOOL v21 = 1;
      goto LABEL_38;
    }
LABEL_37:
    BOOL v21 = 0;
    goto LABEL_38;
  }
  BOOL v21 = 0;
LABEL_39:

  return v21;
}

- (id)_internalPerformRevision:(void *)a3 session:(uint64_t)a4 qosClass:(void *)a5 generatorOptions:(uint64_t)a6 error:
{
  id v11 = a3;
  id v12 = a5;
  id v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v12];
  [v13 removeObjectForKey:@"VNSegmentationGeneratorProcessOption_OutputPixelFormat"];
  [v13 removeObjectForKey:@"VNSegmentationGeneratorProcessOption_KeepRawOutputMask"];
  [v13 removeObjectForKey:@"VNSegmentationGeneratorProcessOption_MaskImageObservations"];
  v14 = [a1 applicableDetectorTypeForRevision:a2 error:a6];
  if (v14)
  {
    v15 = [v11 detectorOfType:v14 configuredWithOptions:v13 error:a6];
    if (v15)
    {
      [a1 regionOfInterest];
      v16 = objc_msgSend(v15, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", a4, v12, a1, a6, 0);
    }
    else
    {
      v16 = 0;
    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (int64_t)dependencyProcessingOrdinality
{
  return VNRequestDependencyProcessingOrdinalityAdjustedForConfiguredRequest(1000, self);
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4 = a3;
  VNGeneratePersonSegmentationRequestQualityLevel v5 = [(VNGeneratePersonSegmentationRequest *)self qualityLevel];
  if (v5 == [v4 qualityLevel]
    && (OSType v6 = [(VNGeneratePersonSegmentationRequest *)self outputPixelFormat],
        v6 == [v4 outputPixelFormat])
    && ([(VNGeneratePersonSegmentationRequest *)self minimumConfidence],
        float v8 = v7,
        [v4 minimumConfidence],
        v8 == v9))
  {
    v12.receiver = self;
    v12.super_class = (Class)VNGeneratePersonSegmentationRequest;
    BOOL v10 = [(VNImageBasedRequest *)&v12 willAcceptCachedResultsFromRequestWithConfiguration:v4];
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)VNGeneratePersonSegmentationRequest;
  id v5 = [(VNRequest *)&v9 newDefaultDetectorOptionsForRequestRevision:a3 session:a4];
  OSType v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[VNGeneratePersonSegmentationRequest qualityLevel](self, "qualityLevel"));
  [v5 setObject:v6 forKeyedSubscript:@"VNSegmentationGeneratorProcessOption_QualityLevel"];

  float v7 = objc_msgSend(NSNumber, "numberWithBool:", -[VNGeneratePersonSegmentationRequest useTiling](self, "useTiling"));
  [v5 setObject:v7 forKeyedSubscript:@"VNSegmentationGeneratorProcessOption_UseTiling"];

  return v5;
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  if (a3 == 3737841665) {
    goto LABEL_12;
  }
  if (a3 != 3737841664)
  {
    if (a3 != 1)
    {
      if (a4)
      {
        +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:");
        float v8 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_21;
      }
      goto LABEL_20;
    }
    VNGeneratePersonSegmentationRequestQualityLevel v6 = [(VNGeneratePersonSegmentationRequest *)self qualityLevel];
    if (v6 == VNGeneratePersonSegmentationRequestQualityLevelFast) {
      goto LABEL_12;
    }
    if (v6 != VNGeneratePersonSegmentationRequestQualityLevelBalanced)
    {
      if (v6)
      {
        if (a4) {
          goto LABEL_19;
        }
        goto LABEL_20;
      }
LABEL_12:
      float v8 = @"VNE5RTSegmentationMultiGeneratorType";
      objc_super v9 = @"VNE5RTSegmentationMultiGeneratorType";
      goto LABEL_21;
    }
    uint64_t v10 = +[VNGenerateSemanticSegmentationCompoundRequest detectorTypeForSemanticSegmentationRequest];
LABEL_17:
    float v8 = (__CFString *)v10;
    goto LABEL_21;
  }
  VNGeneratePersonSegmentationRequestQualityLevel v7 = [(VNGeneratePersonSegmentationRequest *)self qualityLevel];
  switch(v7)
  {
    case VNGeneratePersonSegmentationRequestQualityLevelFast:
      goto LABEL_12;
    case VNGeneratePersonSegmentationRequestQualityLevelBalanced:
      uint64_t v10 = +[VNGenerateSemanticSegmentationCompoundRequest detectorTypeForPersonInstanceRequest];
      goto LABEL_17;
    case VNGeneratePersonSegmentationRequestQualityLevelAccurate:
      goto LABEL_12;
  }
  if (a4)
  {
LABEL_19:
    id v11 = objc_msgSend([NSString alloc], "initWithFormat:", @"Undefined quality level: %lu", -[VNGeneratePersonSegmentationRequest qualityLevel](self, "qualityLevel"));
    *a4 = +[VNError errorForInternalErrorWithLocalizedDescription:v11];
  }
LABEL_20:
  float v8 = 0;
LABEL_21:

  return v8;
}

- (void)applyConfigurationOfRequest:(id)a3
{
  id v4 = (VNGeneratePersonSegmentationRequest *)a3;
  if (self != v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)VNGeneratePersonSegmentationRequest;
    [(VNImageBasedRequest *)&v6 applyConfigurationOfRequest:v4];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      [(VNGeneratePersonSegmentationRequest *)self setQualityLevel:[(VNGeneratePersonSegmentationRequest *)v5 qualityLevel]];
      [(VNGeneratePersonSegmentationRequest *)self setOutputPixelFormat:[(VNGeneratePersonSegmentationRequest *)v5 outputPixelFormat]];
      [(VNGeneratePersonSegmentationRequest *)self setUseTiling:[(VNGeneratePersonSegmentationRequest *)v5 useTiling]];
      [(VNGeneratePersonSegmentationRequest *)v5 minimumConfidence];
      -[VNGeneratePersonSegmentationRequest setMinimumConfidence:](self, "setMinimumConfidence:");
    }
  }
}

- (VNGeneratePersonSegmentationRequest)initWithCompletionHandler:(VNRequestCompletionHandler)completionHandler
{
  long long v4 = *MEMORY[0x1E4F1FA48];
  uint64_t v5 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  return [(VNStatefulRequest *)self initWithFrameAnalysisSpacing:&v4 completionHandler:completionHandler];
}

- (VNGeneratePersonSegmentationRequest)init
{
  return [(VNGeneratePersonSegmentationRequest *)self initWithCompletionHandler:0];
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)descriptionForPrivateRevision:(unint64_t)a3
{
  if (a3 == 3737841664)
  {
    uint64_t v5 = @"VNGeneratePersonSegmentationRequestPrivateRevisionInstanceBased4People";
  }
  else if (a3 == 3737841665)
  {
    uint64_t v5 = @"VNGeneratePersonSegmentationRequestPrivateRevisionSemanticV6";
  }
  else
  {
    uint64_t v8 = v3;
    uint64_t v9 = v4;
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___VNGeneratePersonSegmentationRequest;
    objc_msgSendSuper2(&v7, sel_descriptionForPrivateRevision_);
    uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

+ (id)privateRevisionsSet
{
  if (+[VNGeneratePersonSegmentationRequest(Revisioning) privateRevisionsSet]::onceToken != -1) {
    dispatch_once(&+[VNGeneratePersonSegmentationRequest(Revisioning) privateRevisionsSet]::onceToken, &__block_literal_global_18629);
  }
  v2 = (void *)+[VNGeneratePersonSegmentationRequest(Revisioning) privateRevisionsSet]::privateRevisions;

  return v2;
}

void __71__VNGeneratePersonSegmentationRequest_Revisioning__privateRevisionsSet__block_invoke()
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  [v2 addIndex:3737841664];
  [v2 addIndex:3737841665];
  uint64_t v0 = [v2 copy];
  unint64_t v1 = (void *)+[VNGeneratePersonSegmentationRequest(Revisioning) privateRevisionsSet]::privateRevisions;
  +[VNGeneratePersonSegmentationRequest(Revisioning) privateRevisionsSet]::privateRevisions = v0;
}

+ (const)revisionAvailability
{
  return (const $1305BF644A263E76A656B24897EDB60D *)&+[VNGeneratePersonSegmentationRequest(Revisioning) revisionAvailability]::revisionAvailability;
}

- (uint64_t)keepRawOutputMask
{
  if (!a1) {
    return 0;
  }
  unint64_t v1 = [a1 configuration];
  uint64_t v2 = [v1 keepRawOutputMask];

  return v2;
}

@end