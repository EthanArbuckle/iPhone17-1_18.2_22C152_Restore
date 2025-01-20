@interface VNClassifyJunkImageRequest
+ (BOOL)recordSpecifierModelEquivalenciesInRegistrar:(id)a3 error:(id *)a4;
+ (BOOL)revision:(unint64_t)a3 mayAcceptResultsProducedByRevision:(unint64_t)a4;
+ (Class)configurationClass;
+ (const)revisionAvailability;
+ (id)descriptionForPrivateRevision:(unint64_t)a3;
+ (id)knownClassificationsForRevision:(unint64_t)a3 error:(id *)a4;
+ (id)privateRevisionsSet;
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3;
- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4;
- (id)description;
- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4;
- (id)supportedIdentifiersAndReturnError:(id *)a3;
- (unint64_t)imageCropAndScaleOption;
- (void)applyConfigurationOfRequest:(id)a3;
- (void)setImageCropAndScaleOption:(unint64_t)a3;
@end

@implementation VNClassifyJunkImageRequest

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  if (a5)
  {
    *a5 = +[VNError errorForUnsupportedRevision:a3 ofRequest:self];
  }
  return 0;
}

- (void)applyConfigurationOfRequest:(id)a3
{
  v4 = (VNClassifyJunkImageRequest *)a3;
  if (self != v4)
  {
    v5.receiver = self;
    v5.super_class = (Class)VNClassifyJunkImageRequest;
    [(VNImageBasedRequest *)&v5 applyConfigurationOfRequest:v4];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(VNClassifyJunkImageRequest *)self setImageCropAndScaleOption:[(VNClassifyJunkImageRequest *)v4 imageCropAndScaleOption]];
    }
  }
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(VNClassifyJunkImageRequest *)self imageCropAndScaleOption];
  if (v5 == [v4 imageCropAndScaleOption])
  {
    v8.receiver = self;
    v8.super_class = (Class)VNClassifyJunkImageRequest;
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
  v16[1] = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)VNClassifyJunkImageRequest;
  id v6 = [(VNRequest *)&v15 newDefaultDetectorOptionsForRequestRevision:a3 session:a4];
  if (+[VNCoreSceneUnderstandingDetector handlesRequestClass:[(VNRequest *)self frameworkClass] revision:a3])
  {
    v7 = [(VNCoreSceneUnderstandingDetectorFeatureConfiguration *)[VNCoreSceneUnderstandingDetectorJunkConfiguration alloc] initWithObservationsRecipient:self];
    v16[0] = v7;
    objc_super v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    [v6 setObject:v8 forKeyedSubscript:@"VNCoreSceneUnderstandingDetectorProcessingOption_JunkConfigurations"];

    id v9 = v6;
  }
  else
  {
    unint64_t v10 = +[VNImageAnalyzerMultiDetector modelForRequestClass:[(VNRequest *)self frameworkClass] revision:a3];
    if (v10)
    {
      v11 = [NSNumber numberWithUnsignedInteger:v10];
      [v6 setObject:v11 forKeyedSubscript:@"VNImageAnalyzerMultiDetectorInitializationOption_Model"];

      v12 = [(VNImageAnalyzerMultiDetectorAnalysisConfiguration *)[VNImageAnalyzerMultiDetectorJunkClassificationConfiguration alloc] initWithObservationsRecipient:self];
      [v6 setObject:v12 forKeyedSubscript:@"VNImageAnalyzerMultiDetectorOption_JunkConfiguration"];
    }
    id v13 = v6;
  }

  return v6;
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  v7 = [(VNRequest *)self frameworkClass];
  if (+[VNCoreSceneUnderstandingDetector handlesRequestClass:v7 revision:a3])
  {
    objc_super v8 = @"VNCoreSceneUnderstandingDetectorType";
LABEL_5:
    id v9 = v8;
    goto LABEL_6;
  }
  if (+[VNImageAnalyzerMultiDetector modelForRequestClass:v7 revision:a3])
  {
    objc_super v8 = @"VNImageAnalyzerMultiDetectorType";
    goto LABEL_5;
  }
  if (a4)
  {
    +[VNError errorForUnsupportedRevision:a3 ofRequest:self];
    objc_super v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_super v8 = 0;
  }
LABEL_6:

  return v8;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VNClassifyJunkImageRequest;
  id v4 = [(VNImageBasedRequest *)&v8 description];
  unint64_t v5 = VNImageCropAndScaleOptionToString([(VNClassifyJunkImageRequest *)self imageCropAndScaleOption]);
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
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
  unint64_t v5 = objc_alloc_init(VNSession);
  id v10 = 0;
  id v6 = [(VNRequest *)self applicableDetectorAndOptions:&v10 forRevision:[(VNRequest *)self resolvedRevision] loadedInSession:v5 error:a3];
  id v7 = v10;
  if (!v6) {
    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v8 = [v6 allJunkIdentifiersForOptions:v7 error:a3];
    goto LABEL_7;
  }
  if (a3)
  {
    +[VNError errorForUnsupportedRevision:[(VNRequest *)self resolvedRevision] ofRequest:self];
    objc_super v8 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_6:
    objc_super v8 = 0;
  }
LABEL_7:

  return v8;
}

+ (const)revisionAvailability
{
  return (const $1305BF644A263E76A656B24897EDB60D *)&+[VNClassifyJunkImageRequest revisionAvailability]::ourRevisionAvailability;
}

+ (BOOL)revision:(unint64_t)a3 mayAcceptResultsProducedByRevision:(unint64_t)a4
{
  if (a3 != a4) {
    return 0;
  }
  uint64_t v8 = v4;
  uint64_t v9 = v5;
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___VNClassifyJunkImageRequest;
  return objc_msgSendSuper2(&v7, sel_revision_mayAcceptResultsProducedByRevision_, a3, a3);
}

+ (id)descriptionForPrivateRevision:(unint64_t)a3
{
  if (a3 - 3737841664u >= 7)
  {
    v5.receiver = a1;
    v5.super_class = (Class)&OBJC_METACLASS___VNClassifyJunkImageRequest;
    objc_msgSendSuper2(&v5, sel_descriptionForPrivateRevision_);
    unint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unint64_t v3 = off_1E5B1C0A8[a3 - 3737841664u];
  }

  return v3;
}

+ (id)privateRevisionsSet
{
  if (+[VNClassifyJunkImageRequest privateRevisionsSet]::onceToken != -1) {
    dispatch_once(&+[VNClassifyJunkImageRequest privateRevisionsSet]::onceToken, &__block_literal_global_1734);
  }
  v2 = (void *)+[VNClassifyJunkImageRequest privateRevisionsSet]::ourPrivateRevisions;

  return v2;
}

uint64_t __49__VNClassifyJunkImageRequest_privateRevisionsSet__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  +[VNClassifyJunkImageRequest privateRevisionsSet]::ourPrivateRevisions = VNRequestPrivateRevisionsSet(0xDECAF002uLL, a2, a3, a4, a5, a6, a7, a8, 3737841669);

  return MEMORY[0x1F41817F8]();
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)recordSpecifierModelEquivalenciesInRegistrar:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (([v6 registerRequestClass:a1 revision:3737841666 equivalencyToRevision:3737841664 error:a4] & 1) != 0&& objc_msgSend(v6, "registerRequestClass:revision:equivalencyToRevision:error:", a1, 3737841666, 1, a4)&& objc_msgSend(v6, "registerRequestClass:revision:equivalencyToRevision:error:", a1, 3737841669, 3737841670,
                       a4))
  {
    char v7 = [v6 registerRequestClass:a1 revision:3737841667 equivalencyToRevision:3737841668 error:a4];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

+ (id)knownClassificationsForRevision:(unint64_t)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = objc_alloc_init((Class)a1);
  if ([v6 setRevision:a3 error:a4])
  {
    char v7 = [v6 supportedIdentifiersAndReturnError:a4];
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
            objc_super v15 = [VNClassificationObservation alloc];
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

@end