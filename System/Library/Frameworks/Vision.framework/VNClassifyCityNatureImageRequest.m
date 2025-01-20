@interface VNClassifyCityNatureImageRequest
+ (BOOL)revision:(unint64_t)a3 mayAcceptResultsProducedByRevision:(unint64_t)a4;
+ (Class)configurationClass;
+ (const)revisionAvailability;
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4;
- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4;
- (id)supportedIdentifiersAndReturnError:(id *)a3;
- (unint64_t)imageCropAndScaleOption;
- (void)setImageCropAndScaleOption:(unint64_t)a3;
@end

@implementation VNClassifyCityNatureImageRequest

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v9 = [v8 imageBufferAndReturnError:a5];
  if (v9)
  {
    v10 = [v8 session];
    id v18 = 0;
    v11 = [(VNRequest *)self applicableDetectorAndOptions:&v18 forRevision:a3 loadedInSession:v10 error:a5];
    id v12 = v18;
    if (v11)
    {
      v19[0] = v9;
      v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
      [v12 setObject:v13 forKeyedSubscript:@"VNDetectorProcessOption_InputImageBuffers"];

      uint64_t v14 = [v8 qosClass];
      [(VNImageBasedRequest *)self regionOfInterest];
      v15 = objc_msgSend(v11, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v14, v12, self, a5, 0);
      BOOL v16 = v15 != 0;
      if (v15) {
        [(VNRequest *)self setResults:v15];
      }
    }
    else
    {
      BOOL v16 = 0;
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)VNClassifyCityNatureImageRequest;
  id v6 = [(VNRequest *)&v17 newDefaultDetectorOptionsForRequestRevision:a3 session:a4];
  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[VNClassifyCityNatureImageRequest imageCropAndScaleOption](self, "imageCropAndScaleOption"));
  [v6 setObject:v7 forKeyedSubscript:@"VNDetectorProcessOption_ImageCropAndScaleOption"];

  id v8 = [(VNRequest *)self frameworkClass];
  if (+[VNCoreSceneUnderstandingDetector handlesRequestClass:v8 revision:a3])
  {
    v9 = [(VNCoreSceneUnderstandingDetectorFeatureConfiguration *)[VNCoreSceneUnderstandingDetectorCityNatureConfiguration alloc] initWithObservationsRecipient:self];
    v18[0] = v9;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    [v6 setObject:v10 forKeyedSubscript:@"VNCoreSceneUnderstandingDetectorProcessingOption_CityNatureGatingConfigurations"];

    id v11 = v6;
  }
  else
  {
    unint64_t v12 = +[VNImageAnalyzerMultiDetector modelForRequestClass:v8 revision:a3];
    if (v12)
    {
      v13 = [NSNumber numberWithUnsignedInteger:v12];
      [v6 setObject:v13 forKeyedSubscript:@"VNImageAnalyzerMultiDetectorInitializationOption_Model"];

      uint64_t v14 = [(VNImageAnalyzerMultiDetectorAnalysisConfiguration *)[VNImageAnalyzerMultiDetectorCityNatureClassificationConfiguration alloc] initWithObservationsRecipient:self];
      [v6 setObject:v14 forKeyedSubscript:@"VNImageAnalyzerMultiDetectorOption_CityNatureGatingConfiguration"];
    }
    id v15 = v6;
  }

  return v6;
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  v7 = [(VNRequest *)self frameworkClass];
  if (+[VNCoreSceneUnderstandingDetector handlesRequestClass:v7 revision:a3])
  {
    id v8 = @"VNCoreSceneUnderstandingDetectorType";
LABEL_5:
    v9 = v8;
    goto LABEL_6;
  }
  if (+[VNImageAnalyzerMultiDetector modelForRequestClass:v7 revision:a3])
  {
    id v8 = @"VNImageAnalyzerMultiDetectorType";
    goto LABEL_5;
  }
  if (a4)
  {
    +[VNError errorForUnsupportedRevision:a3 ofRequest:self];
    id v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = 0;
  }
LABEL_6:

  return v8;
}

- (void)setImageCropAndScaleOption:(unint64_t)a3
{
  id v4 = [(VNRequest *)self configuration];
  [v4 setImageCropAndScaleOption:a3];
}

- (unint64_t)imageCropAndScaleOption
{
  v2 = [(VNRequest *)self configuration];
  unint64_t v3 = [v2 imageCropAndScaleOption];

  return v3;
}

- (id)supportedIdentifiersAndReturnError:(id *)a3
{
  unint64_t v5 = [(VNRequest *)self resolvedRevision];
  id v14 = 0;
  id v6 = [(VNRequest *)self applicableDetectorClassAndOptions:&v14 forRevision:v5 error:a3];
  id v7 = v14;
  if (!v6)
  {
    id v8 = 0;
    goto LABEL_5;
  }
  if ([(objc_class *)v6 isSubclassOfClass:objc_opt_class()])
  {
    id v8 = [(objc_class *)v6 allCityNatureIdentifiersWithConfigurationOptions:v7 error:a3];
LABEL_5:
    id v9 = v7;
    goto LABEL_13;
  }
  v10 = objc_alloc_init(VNSession);
  id v13 = v7;
  id v11 = [(VNRequest *)self applicableDetectorAndOptions:&v13 forRevision:v5 loadedInSession:v10 error:a3];
  id v9 = v13;

  if (!v11) {
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a3)
    {
      +[VNError errorForUnsupportedRevision:v5 ofRequest:self];
      id v8 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
LABEL_11:
    id v8 = 0;
    goto LABEL_12;
  }
  id v8 = [v11 allCityNatureIdentifiersWithOptions:v9 error:a3];
LABEL_12:

LABEL_13:

  return v8;
}

+ (BOOL)revision:(unint64_t)a3 mayAcceptResultsProducedByRevision:(unint64_t)a4
{
  if (a3 != a4) {
    return 0;
  }
  uint64_t v8 = v4;
  uint64_t v9 = v5;
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___VNClassifyCityNatureImageRequest;
  return objc_msgSendSuper2(&v7, sel_revision_mayAcceptResultsProducedByRevision_, a3, a3);
}

+ (const)revisionAvailability
{
  return (const $1305BF644A263E76A656B24897EDB60D *)&+[VNClassifyCityNatureImageRequest revisionAvailability]::ourRevisionAvailability;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

@end