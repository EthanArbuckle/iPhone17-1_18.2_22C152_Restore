@interface VNClassifyPotentialLandmarkRequest
+ (BOOL)revision:(unint64_t)a3 mayAcceptResultsProducedByRevision:(unint64_t)a4;
+ (Class)configurationClass;
+ (id)descriptionForPrivateRevision:(unint64_t)a3;
+ (id)knownClassificationsForRevision:(unint64_t)a3 error:(id *)a4;
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3;
- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4;
- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4;
- (id)supportedIdentifiersAndReturnError:(id *)a3;
- (unint64_t)imageCropAndScaleOption;
- (void)setImageCropAndScaleOption:(unint64_t)a3;
@end

@implementation VNClassifyPotentialLandmarkRequest

+ (BOOL)revision:(unint64_t)a3 mayAcceptResultsProducedByRevision:(unint64_t)a4
{
  if (a3 != a4) {
    return 0;
  }
  uint64_t v8 = v4;
  uint64_t v9 = v5;
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___VNClassifyPotentialLandmarkRequest;
  return objc_msgSendSuper2(&v7, sel_revision_mayAcceptResultsProducedByRevision_, a3, a3);
}

+ (id)descriptionForPrivateRevision:(unint64_t)a3
{
  if (a3 == 3737841664)
  {
    uint64_t v5 = @"VNClassifyPotentialLandmarkRequestPrivateRevisionStillCapturePipeline";
  }
  else
  {
    uint64_t v8 = v3;
    uint64_t v9 = v4;
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___VNClassifyPotentialLandmarkRequest;
    objc_msgSendSuper2(&v7, sel_descriptionForPrivateRevision_);
    uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)knownClassificationsForRevision:(unint64_t)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = objc_alloc_init((Class)a1);
  if ([v6 setRevision:a3 error:a4])
  {
    objc_super v7 = [v6 supportedIdentifiersAndReturnError:a4];
    if (v7)
    {
      uint64_t v8 = [v6 specifier];
      uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v10 = v7;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v20 != v12) {
              objc_enumerationMutation(v10);
            }
            uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * i);
            v15 = [VNClassificationObservation alloc];
            LODWORD(v16) = 1.0;
            v17 = -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:](v15, "initWithOriginatingRequestSpecifier:identifier:confidence:", v8, v14, v16, (void)v19);
            [v9 addObject:v17];
          }
          uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v11);
      }
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if (a3 == 1)
  {
    if (a5)
    {
      uint64_t v9 = +[VNError errorForUnsupportedConfigurationOfRequest:self];
LABEL_6:
      *a5 = v9;
    }
  }
  else if (a5)
  {
    uint64_t v9 = +[VNError errorForUnsupportedRevision:a3 ofRequest:self];
    goto LABEL_6;
  }

  return 0;
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(VNClassifyPotentialLandmarkRequest *)self imageCropAndScaleOption];
  if (v5 == [v4 imageCropAndScaleOption])
  {
    v8.receiver = self;
    v8.super_class = (Class)VNClassifyPotentialLandmarkRequest;
    BOOL v6 = [(VNImageBasedRequest *)&v8 willAcceptCachedResultsFromRequestWithConfiguration:v4];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)VNClassifyPotentialLandmarkRequest;
  id v6 = [(VNRequest *)&v12 newDefaultDetectorOptionsForRequestRevision:a3 session:a4];
  objc_super v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[VNClassifyPotentialLandmarkRequest imageCropAndScaleOption](self, "imageCropAndScaleOption"));
  [v6 setObject:v7 forKeyedSubscript:@"VNDetectorProcessOption_ImageCropAndScaleOption"];

  unint64_t v8 = +[VNImageAnalyzerMultiDetector modelForRequestClass:[(VNRequest *)self frameworkClass] revision:a3];
  if (v8)
  {
    uint64_t v9 = [NSNumber numberWithUnsignedInteger:v8];
    [v6 setObject:v9 forKeyedSubscript:@"VNImageAnalyzerMultiDetectorInitializationOption_Model"];

    id v10 = [(VNImageAnalyzerMultiDetectorAnalysisConfiguration *)[VNImageAnalyzerMultiDetectorPotentialLandmarkClassificationConfiguration alloc] initWithObservationsRecipient:self];
    [v6 setObject:v10 forKeyedSubscript:@"VNImageAnalyzerMultiDetectorOption_PotentialLandmarkConfiguration"];
  }
  return v6;
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  if (a3 == 1)
  {
    id v4 = @"VNImageAnalyzerMultiDetectorType";
    unint64_t v5 = @"VNImageAnalyzerMultiDetectorType";
  }
  else if (a4)
  {
    +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:");
    id v4 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = 0;
  }

  return v4;
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
  v8[1] = *MEMORY[0x1E4F143B8];
  unint64_t v4 = [(VNRequest *)self resolvedRevision];
  if (v4 == 1)
  {
    v8[0] = @"VNPotentialLandmarkIdentifier";
    unint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  }
  else if (a3)
  {
    id v6 = +[VNError errorForUnsupportedRevision:v4 ofRequestClass:objc_opt_class()];
    unint64_t v5 = 0;
    *a3 = v6;
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

@end