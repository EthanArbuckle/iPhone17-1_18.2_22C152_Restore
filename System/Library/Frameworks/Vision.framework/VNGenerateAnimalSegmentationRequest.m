@interface VNGenerateAnimalSegmentationRequest
+ (Class)configurationClass;
+ (const)revisionAvailability;
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3;
- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4;
- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4;
- (int64_t)dependencyProcessingOrdinality;
- (int64_t)qualityLevel;
- (unsigned)outputPixelFormat;
- (void)applyConfigurationOfRequest:(id)a3;
- (void)setOutputPixelFormat:(unsigned int)a3;
- (void)setQualityLevel:(int64_t)a3;
@end

@implementation VNGenerateAnimalSegmentationRequest

- (void)setOutputPixelFormat:(unsigned int)a3
{
  v4 = [(VNRequest *)self configuration];
  if (v4) {
    v4[36] = a3;
  }
}

- (unsigned)outputPixelFormat
{
  v2 = [(VNRequest *)self configuration];
  if (v2) {
    unsigned int v3 = v2[36];
  }
  else {
    unsigned int v3 = 0;
  }

  return v3;
}

- (void)setQualityLevel:(int64_t)a3
{
  v4 = [(VNRequest *)self configuration];
  if (v4) {
    v4[19] = a3;
  }
}

- (int64_t)qualityLevel
{
  v2 = [(VNRequest *)self configuration];
  if (v2) {
    int64_t v3 = v2[19];
  }
  else {
    int64_t v3 = 0;
  }

  return v3;
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  v56[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v51 = [v8 imageBufferAndReturnError:a5];
  if (v51)
  {
    v50 = [v8 session];
    uint64_t v9 = [v8 qosClass];
    id v52 = [(VNGenerateAnimalSegmentationRequest *)self newDefaultDetectorOptionsForRequestRevision:a3 session:v50];
    v55 = v51;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v55 count:1];
    [v52 setObject:v10 forKeyedSubscript:@"VNDetectorProcessOption_InputImageBuffers"];

    v11 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[VNGenerateAnimalSegmentationRequest outputPixelFormat](self, "outputPixelFormat"));
    [v52 setObject:v11 forKeyedSubscript:@"VNSegmentationGeneratorProcessOption_OutputPixelFormat"];

    int64_t v12 = [(VNGenerateAnimalSegmentationRequest *)self qualityLevel];
    if (v12)
    {
      if (v12 == 1)
      {
        if (a5)
        {
          id v13 = 0;
          id v14 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Balanced quality level is handled by compound request"];
LABEL_35:
          BOOL v15 = 0;
          goto LABEL_36;
        }
      }
      else if (a5)
      {
        v26 = objc_msgSend(NSNumber, "numberWithInteger:", -[VNGenerateAnimalSegmentationRequest qualityLevel](self, "qualityLevel"));
        id v27 = +[VNError errorForInvalidOption:v26 named:@"qualityLevel"];
      }
      BOOL v15 = 0;
      id v13 = 0;
LABEL_36:

      goto LABEL_37;
    }
    id v45 = v50;
    id v16 = v8;
    id v46 = v52;
    v44 = v16;
    if (!self)
    {
      id v13 = 0;
      goto LABEL_33;
    }
    v49 = objc_alloc_init(VNGenerateAnimalSegmentationRequest);
    [(VNGenerateAnimalSegmentationRequest *)v49 applyConfigurationOfRequest:self];
    [(VNGenerateAnimalSegmentationRequest *)v49 setQualityLevel:1];
    [(VNGenerateAnimalSegmentationRequest *)v49 setOutputPixelFormat:1278226534];
    v17 = [v16 cachedObservationsAcceptedByRequest:v49];
    if (!v17)
    {
      [(VNGenerateAnimalSegmentationRequest *)v49 setOutputPixelFormat:1278226534];
      v28 = [v16 requestPerformerAndReturnError:a5];
      if (!v28
        || (v56[0] = v49,
            [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:1],
            v29 = objc_claimAutoreleasedReturnValue(),
            char v30 = [v28 performDependentRequests:v29 onBehalfOfRequest:self inContext:v16 error:a5],
            v29,
            (v30 & 1) == 0))
      {
        v48 = 0;
        id v13 = 0;
LABEL_31:

        goto LABEL_32;
      }
      uint64_t v31 = [(VNRequest *)v49 results];

      v17 = (void *)v31;
    }
    v48 = v17;
    if (![v17 count])
    {
      id v13 = (id)MEMORY[0x1E4F1CBF0];
LABEL_32:

LABEL_33:
      if (!v13) {
        goto LABEL_35;
      }
      [(VNRequest *)self setResults:v13];
      BOOL v15 = 1;
      goto LABEL_36;
    }

    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __113__VNGenerateAnimalSegmentationRequest__internalPerformAccurateSession_inContext_qosClass_generatorOptions_error___block_invoke;
    v53[3] = &unk_1E5B1F710;
    v19 = (VNGenerateAnimalSegmentationRequest *)v18;
    v54 = v19;
    v49 = v19;
    [v48 enumerateObjectsUsingBlock:v53];
    [v46 setObject:v19 forKeyedSubscript:@"VNGuidedUpsamplingGeneratorOption_LowResImages"];
    [v46 setObject:&unk_1EF7A7868 forKeyedSubscript:@"VNGuidedUpsamplingGeneratorOption_InputPixelFormat"];
    v20 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[VNGenerateAnimalSegmentationRequest outputPixelFormat](self, "outputPixelFormat"));
    [v46 setObject:v20 forKeyedSubscript:@"VNGuidedUpsamplingGeneratorOption_OutputPixelFormat"];

    id v21 = v45;
    v22 = @"VNGuidedUpsamplingGeneratorType";
    id v23 = v46;
    v24 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v23];
    [v24 removeObjectForKey:@"VNSegmentationGeneratorProcessOption_OutputPixelFormat"];
    v25 = [v21 detectorOfType:@"VNGuidedUpsamplingGeneratorType" configuredWithOptions:v24 error:a5];
    if (v25)
    {
      [(VNImageBasedRequest *)self regionOfInterest];
      v47 = objc_msgSend(v25, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v9, v23, self, a5, 0);
    }
    else
    {
      v47 = 0;
    }

    if (v47)
    {
      uint64_t v32 = [v48 count];
      if ([v47 count] == v32)
      {
        id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        if (v32)
        {
          for (uint64_t i = 0; i != v32; ++i)
          {
            v34 = [(VNGenerateAnimalSegmentationRequest *)v49 objectAtIndexedSubscript:i];
            v35 = [VNPixelBufferObservation alloc];
            v36 = [v34 originatingRequestSpecifier];
            v37 = [v34 featureName];
            v38 = [v47 objectAtIndexedSubscript:i];
            v39 = -[VNPixelBufferObservation initWithOriginatingRequestSpecifier:featureName:CVPixelBuffer:](v35, "initWithOriginatingRequestSpecifier:featureName:CVPixelBuffer:", v36, v37, [v38 pixelBuffer]);

            v40 = [v48 objectAtIndexedSubscript:i];
            v41 = objc_msgSend(v40, "vn_cloneObject");

            -[VNDetectedObjectObservation setInstanceSegmentationMask:]((uint64_t)v41, v39);
            [v13 addObject:v41];
          }
        }
        goto LABEL_30;
      }
      if (a5) {
        id v42 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Accurate observations count mismatch"];
      }
    }
    id v13 = 0;
LABEL_30:

    v28 = v54;
    goto LABEL_31;
  }
  BOOL v15 = 0;
LABEL_37:

  return v15;
}

void __113__VNGenerateAnimalSegmentationRequest__internalPerformAccurateSession_inContext_qosClass_generatorOptions_error___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 instanceSegmentationMask];
  objc_msgSend(v2, "addObject:");
}

- (int64_t)dependencyProcessingOrdinality
{
  return VNRequestDependencyProcessingOrdinalityAdjustedForConfiguredRequest(1000, self);
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  v4 = a3;
  int64_t v5 = [(VNGenerateAnimalSegmentationRequest *)self qualityLevel];
  if (v4) {
    uint64_t v6 = v4[19];
  }
  else {
    uint64_t v6 = 0;
  }
  if (v5 == v6
    && ((unsigned int v7 = [(VNGenerateAnimalSegmentationRequest *)self outputPixelFormat], !v4)
      ? (int v8 = 0)
      : (int v8 = *((_DWORD *)v4 + 36)),
        v7 == v8))
  {
    v11.receiver = self;
    v11.super_class = (Class)VNGenerateAnimalSegmentationRequest;
    BOOL v9 = [(VNImageBasedRequest *)&v11 willAcceptCachedResultsFromRequestWithConfiguration:v4];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)VNGenerateAnimalSegmentationRequest;
  id v5 = [(VNRequest *)&v8 newDefaultDetectorOptionsForRequestRevision:a3 session:a4];
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[VNGenerateAnimalSegmentationRequest qualityLevel](self, "qualityLevel"));
  [v5 setObject:v6 forKeyedSubscript:@"VNSegmentationGeneratorProcessOption_QualityLevel"];

  return v5;
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  if (a3 == 1)
  {
    int64_t v6 = [(VNGenerateAnimalSegmentationRequest *)self qualityLevel];
    if (v6 == 1)
    {
      unsigned int v7 = @"VNE5RTSegmentationMultiGeneratorType";
      goto LABEL_8;
    }
    if (!v6)
    {
      unsigned int v7 = @"VNGuidedUpsamplingGeneratorType";
LABEL_8:
      objc_super v8 = v7;
      goto LABEL_12;
    }
    if (a4)
    {
      BOOL v9 = objc_msgSend(NSNumber, "numberWithInteger:", -[VNGenerateAnimalSegmentationRequest qualityLevel](self, "qualityLevel"));
      *a4 = +[VNError errorForInvalidOption:v9 named:@"qualityLevel"];
    }
  }
  else if (a4)
  {
    +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:");
    unsigned int v7 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  unsigned int v7 = 0;
LABEL_12:

  return v7;
}

- (void)applyConfigurationOfRequest:(id)a3
{
  v4 = (VNGenerateAnimalSegmentationRequest *)a3;
  if (self != v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)VNGenerateAnimalSegmentationRequest;
    [(VNImageBasedRequest *)&v6 applyConfigurationOfRequest:v4];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      [(VNGenerateAnimalSegmentationRequest *)self setQualityLevel:[(VNGenerateAnimalSegmentationRequest *)v5 qualityLevel]];
      [(VNGenerateAnimalSegmentationRequest *)self setOutputPixelFormat:[(VNGenerateAnimalSegmentationRequest *)v5 outputPixelFormat]];
    }
  }
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (const)revisionAvailability
{
  return (const $1305BF644A263E76A656B24897EDB60D *)&+[VNGenerateAnimalSegmentationRequest revisionAvailability]::revisionAvailability;
}

@end