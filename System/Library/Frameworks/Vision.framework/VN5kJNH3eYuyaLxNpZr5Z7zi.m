@interface VN5kJNH3eYuyaLxNpZr5Z7zi
+ (BOOL)revision:(unint64_t)a3 mayAcceptResultsProducedByRevision:(unint64_t)a4;
+ (Class)configurationClass;
+ (id)descriptionForPrivateRevision:(unint64_t)a3;
+ (id)knownClassificationsForRevision:(unint64_t)a3 error:(id *)a4;
+ (id)privateRevisionsSet;
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3;
- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4;
- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4;
- (id)supportedIdentifiersAndReturnError:(id *)a3;
- (unint64_t)imageCropAndScaleOption;
- (void)applyConfigurationOfRequest:(id)a3;
- (void)setImageCropAndScaleOption:(unint64_t)a3;
@end

@implementation VN5kJNH3eYuyaLxNpZr5Z7zi

+ (BOOL)revision:(unint64_t)a3 mayAcceptResultsProducedByRevision:(unint64_t)a4
{
  if (a3 != a4) {
    return 0;
  }
  uint64_t v8 = v4;
  uint64_t v9 = v5;
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___VN5kJNH3eYuyaLxNpZr5Z7zi;
  return objc_msgSendSuper2(&v7, sel_revision_mayAcceptResultsProducedByRevision_, a3, a3);
}

+ (id)descriptionForPrivateRevision:(unint64_t)a3
{
  if (a3 - 3737841664u >= 5)
  {
    v5.receiver = a1;
    v5.super_class = (Class)&OBJC_METACLASS___VN5kJNH3eYuyaLxNpZr5Z7zi;
    objc_msgSendSuper2(&v5, sel_descriptionForPrivateRevision_);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E5B1C888[a3 - 3737841664u];
  }

  return v3;
}

+ (id)privateRevisionsSet
{
  if (+[VN5kJNH3eYuyaLxNpZr5Z7zi privateRevisionsSet]::onceToken != -1) {
    dispatch_once(&+[VN5kJNH3eYuyaLxNpZr5Z7zi privateRevisionsSet]::onceToken, &__block_literal_global_5942);
  }
  v2 = (void *)+[VN5kJNH3eYuyaLxNpZr5Z7zi privateRevisionsSet]::ourPrivateRevisions;

  return v2;
}

uint64_t __47__VN5kJNH3eYuyaLxNpZr5Z7zi_privateRevisionsSet__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  +[VN5kJNH3eYuyaLxNpZr5Z7zi privateRevisionsSet]::ourPrivateRevisions = VNRequestPrivateRevisionsSet(0xDECAF002uLL, a2, a3, a4, a5, a6, a7, a8, 3737841667);

  return MEMORY[0x1F41817F8]();
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
  if (a5)
  {
    *a5 = +[VNError errorForUnsupportedRevision:a3 ofRequest:self];
  }
  return 0;
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 imageCropAndScaleOption];
  if (v5 == [(VN5kJNH3eYuyaLxNpZr5Z7zi *)self imageCropAndScaleOption])
  {
    v8.receiver = self;
    v8.super_class = (Class)VN5kJNH3eYuyaLxNpZr5Z7zi;
    BOOL v6 = [(VNImageBasedRequest *)&v8 willAcceptCachedResultsFromRequestWithConfiguration:v4];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)applyConfigurationOfRequest:(id)a3
{
  id v4 = (VN5kJNH3eYuyaLxNpZr5Z7zi *)a3;
  if (self != v4)
  {
    v5.receiver = self;
    v5.super_class = (Class)VN5kJNH3eYuyaLxNpZr5Z7zi;
    [(VNImageBasedRequest *)&v5 applyConfigurationOfRequest:v4];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(VN5kJNH3eYuyaLxNpZr5Z7zi *)self setImageCropAndScaleOption:[(VN5kJNH3eYuyaLxNpZr5Z7zi *)v4 imageCropAndScaleOption]];
    }
  }
}

- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)VN5kJNH3eYuyaLxNpZr5Z7zi;
  id v6 = [(VNRequest *)&v17 newDefaultDetectorOptionsForRequestRevision:a3 session:a4];
  objc_super v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[VN5kJNH3eYuyaLxNpZr5Z7zi imageCropAndScaleOption](self, "imageCropAndScaleOption"));
  [v6 setObject:v7 forKeyedSubscript:@"VNDetectorProcessOption_ImageCropAndScaleOption"];

  objc_super v8 = [(VNRequest *)self frameworkClass];
  if (+[VNCoreSceneUnderstandingDetector handlesRequestClass:v8 revision:a3])
  {
    uint64_t v9 = [(VNCoreSceneUnderstandingDetectorFeatureConfiguration *)[VNCoreSceneUnderstandingDetectorVN5kJNH3eYuyaLxNpZr5Z7ziConfiguration alloc] initWithObservationsRecipient:self];
    v18[0] = v9;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    [v6 setObject:v10 forKeyedSubscript:@"VNCoreSceneUnderstandingDetectorProcessingOption_5kJNH3eYuyaLxNpZr5Z7ziConfigurations"];

    id v11 = v6;
  }
  else
  {
    unint64_t v12 = +[VNImageAnalyzerMultiDetector modelForRequestClass:v8 revision:a3];
    if (v12)
    {
      v13 = [NSNumber numberWithUnsignedInteger:v12];
      [v6 setObject:v13 forKeyedSubscript:@"VNImageAnalyzerMultiDetectorInitializationOption_Model"];

      uint64_t v14 = [(VNImageAnalyzerMultiDetectorAnalysisConfiguration *)[VNImageAnalyzerMultiDetectorVN5kJNH3eYuyaLxNpZr5Z7ziConfiguration alloc] initWithObservationsRecipient:self];
      [v6 setObject:v14 forKeyedSubscript:@"VNImageAnalyzerMultiDetectorOption_VN5kJNH3eYuyaLxNpZr5Z7ziConfiguration"];
    }
    id v15 = v6;
  }

  return v6;
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  objc_super v7 = [(VNRequest *)self frameworkClass];
  if (+[VNCoreSceneUnderstandingDetector handlesRequestClass:v7 revision:a3])
  {
    objc_super v8 = @"VNCoreSceneUnderstandingDetectorType";
LABEL_5:
    uint64_t v9 = v8;
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
    objc_super v8 = 0;
    goto LABEL_5;
  }
  if ([(objc_class *)v6 isSubclassOfClass:objc_opt_class()])
  {
    objc_super v8 = [(objc_class *)v6 allVN5kJNH3eYuyaLxNpZr5Z7ziIdentifiersWithConfigurationOptions:v7 error:a3];
LABEL_5:
    id v9 = v7;
    goto LABEL_13;
  }
  id v10 = objc_alloc_init(VNSession);
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
      objc_super v8 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
LABEL_11:
    objc_super v8 = 0;
    goto LABEL_12;
  }
  objc_super v8 = [v11 allVN5kJNH3eYuyaLxNpZr5Z7ziIdentifiersWithOptions:v9 error:a3];
LABEL_12:

LABEL_13:

  return v8;
}

@end