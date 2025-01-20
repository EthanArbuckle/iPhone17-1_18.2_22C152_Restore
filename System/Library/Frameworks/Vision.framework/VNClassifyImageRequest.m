@interface VNClassifyImageRequest
+ (BOOL)revision:(unint64_t)a3 mayAcceptResultsProducedByRevision:(unint64_t)a4;
+ (Class)configurationClass;
+ (NSArray)knownClassificationsForRevision:(NSUInteger)requestRevision error:(NSError *)error;
+ (const)revisionAvailability;
+ (id)descriptionForPrivateRevision:(unint64_t)a3;
+ (id)privateRevisionsSet;
- (BOOL)defineCustomHierarchy:(id)a3 error:(id *)a4;
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3;
- (NSArray)supportedIdentifiersAndReturnError:(NSError *)error;
- (VNClassificationCustomHierarchy)customHierarchy;
- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4;
- (id)defineCustomHierarchyWithRelationships:(id)a3 error:(id *)a4;
- (id)description;
- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4;
- (unint64_t)imageCropAndScaleOption;
- (unint64_t)maximumHierarchicalObservations;
- (unint64_t)maximumLeafObservations;
- (void)_setCustomHierarchy:(id)a3;
- (void)applyConfigurationOfRequest:(id)a3;
- (void)resolvedRevisionDidChangeFromRevision:(unint64_t)a3;
- (void)setImageCropAndScaleOption:(unint64_t)a3;
- (void)setMaximumHierarchicalObservations:(unint64_t)a3;
- (void)setMaximumLeafObservations:(unint64_t)a3;
@end

@implementation VNClassifyImageRequest

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

- (id)defineCustomHierarchyWithRelationships:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = +[VNClassificationCustomHierarchy customHierarchyForRequest:self error:a4];
  v8 = v7;
  if (v7)
  {
    v9 = [v7 customHierarchyWithAdditionalRelationships:v6 error:a4];

    if (v9 && [(VNClassifyImageRequest *)self defineCustomHierarchy:v9 error:a4])
    {
      id v10 = v9;
      v9 = v10;
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
    v9 = 0;
  }

  return v10;
}

- (BOOL)defineCustomHierarchy:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6)
  {
    [(VNClassifyImageRequest *)self _setCustomHierarchy:0];
    goto LABEL_5;
  }
  unint64_t v7 = [(VNRequest *)self resolvedRevision];
  uint64_t v8 = [v6 requestRevision];
  if (v7 == v8)
  {
    [(VNClassifyImageRequest *)self _setCustomHierarchy:v6];
LABEL_5:
    LOBYTE(a4) = 1;
    goto LABEL_8;
  }
  if (a4)
  {
    v9 = [NSString stringWithFormat:@"the custom hierarchy is for request revision %lu, not %lu", v8, v7];
    *a4 = +[VNError errorForInvalidOperationWithLocalizedDescription:v9];

    LOBYTE(a4) = 0;
  }
LABEL_8:

  return (char)a4;
}

- (VNClassificationCustomHierarchy)customHierarchy
{
  v2 = [(VNRequest *)self configuration];
  unint64_t v3 = [v2 customHierarchy];

  return (VNClassificationCustomHierarchy *)v3;
}

- (void)setMaximumHierarchicalObservations:(unint64_t)a3
{
  id v4 = [(VNRequest *)self configuration];
  [v4 setMaximumHierarchicalObservations:a3];
}

- (unint64_t)maximumHierarchicalObservations
{
  v2 = [(VNRequest *)self configuration];
  unint64_t v3 = [v2 maximumHierarchicalObservations];

  return v3;
}

- (void)setMaximumLeafObservations:(unint64_t)a3
{
  id v4 = [(VNRequest *)self configuration];
  [v4 setMaximumLeafObservations:a3];
}

- (unint64_t)maximumLeafObservations
{
  v2 = [(VNRequest *)self configuration];
  unint64_t v3 = [v2 maximumLeafObservations];

  return v3;
}

- (NSArray)supportedIdentifiersAndReturnError:(NSError *)error
{
  unint64_t v5 = [(VNRequest *)self resolvedRevision];
  id v15 = 0;
  id v6 = [(VNRequest *)self applicableDetectorClassAndOptions:&v15 forRevision:v5 error:error];
  id v7 = v15;
  if (!v6)
  {
    uint64_t v8 = 0;
    goto LABEL_5;
  }
  if ([(objc_class *)v6 isSubclassOfClass:objc_opt_class()])
  {
    uint64_t v8 = [(objc_class *)v6 allClassificationIdentifiersWithConfigurationOptions:v7 error:error];
LABEL_5:
    id v9 = v7;
    goto LABEL_16;
  }
  id v10 = objc_alloc_init(VNSession);
  id v14 = v7;
  v11 = [(VNRequest *)self applicableDetectorAndOptions:&v14 forRevision:v5 loadedInSession:v10 error:error];
  id v9 = v14;

  if (!v11) {
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v12 = [v11 supportedClassificationIdentifiersWithOptions:v9 error:error];
      goto LABEL_11;
    }
    if (error)
    {
      +[VNError errorForUnsupportedRevision:v5 ofRequest:self];
      uint64_t v8 = 0;
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
LABEL_14:
    uint64_t v8 = 0;
    goto LABEL_15;
  }
  uint64_t v12 = [v11 allSceneIdentifiersWithOptions:v9 error:error];
LABEL_11:
  uint64_t v8 = (void *)v12;
LABEL_15:

LABEL_16:

  return (NSArray *)v8;
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if (a3 == 1)
  {
    if (a5)
    {
      id v9 = +[VNError errorForUnsupportedConfigurationOfRequest:self];
LABEL_6:
      *a5 = v9;
    }
  }
  else if (a5)
  {
    id v9 = +[VNError errorForInvalidOperationForRequestClass:objc_opt_class() revision:a3];
    goto LABEL_6;
  }

  return 0;
}

- (void)applyConfigurationOfRequest:(id)a3
{
  id v4 = (VNClassifyImageRequest *)a3;
  if (self != v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)VNClassifyImageRequest;
    [(VNImageBasedRequest *)&v6 applyConfigurationOfRequest:v4];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = [(VNClassifyImageRequest *)v4 customHierarchy];
      [(VNClassifyImageRequest *)self _setCustomHierarchy:v5];

      [(VNClassifyImageRequest *)self setMaximumLeafObservations:[(VNClassifyImageRequest *)v4 maximumLeafObservations]];
      [(VNClassifyImageRequest *)self setMaximumHierarchicalObservations:[(VNClassifyImageRequest *)v4 maximumHierarchicalObservations]];
      [(VNClassifyImageRequest *)self setImageCropAndScaleOption:[(VNClassifyImageRequest *)v4 imageCropAndScaleOption]];
    }
  }
}

- (void)resolvedRevisionDidChangeFromRevision:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VNClassifyImageRequest;
  [(VNRequest *)&v7 resolvedRevisionDidChangeFromRevision:a3];
  unint64_t v4 = [(VNRequest *)self resolvedRevision];
  unint64_t v5 = [(VNClassifyImageRequest *)self customHierarchy];
  objc_super v6 = v5;
  if (v5 && [v5 requestRevision] != v4) {
    [(VNClassifyImageRequest *)self _setCustomHierarchy:0];
  }
  if (v4 == 3737841665)
  {
    [(VNClassifyImageRequest *)self setMaximumLeafObservations:0x7FFFFFFFFFFFFFFFLL];
    [(VNClassifyImageRequest *)self setMaximumHierarchicalObservations:0x7FFFFFFFFFFFFFFFLL];
  }
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(VNClassifyImageRequest *)self customHierarchy];
  objc_super v6 = [v4 customHierarchy];
  char v7 = VisionCoreEqualOrNilObjects();

  if ((v7 & 1) != 0
    && (unint64_t v8 = [(VNClassifyImageRequest *)self maximumLeafObservations],
        v8 == [v4 maximumLeafObservations])
    && (unint64_t v9 = [(VNClassifyImageRequest *)self maximumHierarchicalObservations],
        v9 == [v4 maximumHierarchicalObservations]))
  {
    v12.receiver = self;
    v12.super_class = (Class)VNClassifyImageRequest;
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
  v16[1] = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)VNClassifyImageRequest;
  id v6 = [(VNRequest *)&v13 newDefaultDetectorOptionsForRequestRevision:a3 session:a4];
  char v7 = [(VNRequest *)self frameworkClass];
  if (+[VNCoreSceneUnderstandingDetector handlesRequestClass:v7 revision:a3])
  {
    if (a3 == 3737841667)
    {
      unint64_t v8 = [[VNCoreSceneUnderstandingDetectorEntityNetClassificationConfiguration alloc] initWithObservationsRecipient:self];
      v16[0] = v8;
      unint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
      [v6 setObject:v9 forKeyedSubscript:@"VNCoreSceneUnderstandingDetectorProcessingOption_EntityNetClassificationConfigurations"];
    }
    else
    {
      unint64_t v8 = [[VNCoreSceneUnderstandingDetectorImageClassificationConfiguration alloc] initWithObservationsRecipient:self];
      id v15 = v8;
      unint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
      [v6 setObject:v9 forKeyedSubscript:@"VNCoreSceneUnderstandingDetectorProcessingOption_ImageClassificationConfigurations"];
    }
    goto LABEL_11;
  }
  unint64_t v10 = +[VNImageAnalyzerMultiDetector modelForRequestClass:v7 revision:a3];
  if (v10)
  {
    v11 = [NSNumber numberWithUnsignedInteger:v10];
    [v6 setObject:v11 forKeyedSubscript:@"VNImageAnalyzerMultiDetectorInitializationOption_Model"];

    if (a3 != 3737841667)
    {
      unint64_t v8 = [[VNImageAnalyzerMultiDetectorSceneClassificationConfiguration alloc] initWithObservationsRecipient:self];
      id v14 = v8;
      unint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
      [v6 setObject:v9 forKeyedSubscript:@"VNImageAnalyzerMultiDetectorOption_SceneConfigurations"];
LABEL_11:

      goto LABEL_12;
    }
    unint64_t v8 = [[VNImageAnalyzerMultiDetectorEntityNetClassificationConfiguration alloc] initWithObservationsRecipient:self];
    [v6 setObject:v8 forKeyedSubscript:@"VNImageAnalyzerMultiDetectorOption_EntityNetConfiguration"];
LABEL_12:

    return v6;
  }
  if (a3 == 3737841665)
  {
    [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"VNSmartCam5GatingDetectorProcessingOption_ClassificationEnabled"];
    unint64_t v8 = [v6 objectForKeyedSubscript:@"VNDetectorOption_OriginatingRequestSpecifier"];
    [v6 setObject:v8 forKeyedSubscript:@"VNSmartCam5GatingDetectorProcessingOption_ClassificationOriginatingRequestSpecifier"];
    goto LABEL_12;
  }
  return v6;
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  char v7 = [(VNRequest *)self frameworkClass];
  if (+[VNCoreSceneUnderstandingDetector handlesRequestClass:v7 revision:a3])
  {
    unint64_t v8 = @"VNCoreSceneUnderstandingDetectorType";
LABEL_7:
    unint64_t v9 = v8;
    goto LABEL_8;
  }
  if (+[VNImageAnalyzerMultiDetector modelForRequestClass:v7 revision:a3])
  {
    unint64_t v8 = @"VNImageAnalyzerMultiDetectorType";
    goto LABEL_7;
  }
  if (a3 == 3737841665)
  {
    unint64_t v8 = @"VNSmartCam5GatingDetectorType";
    goto LABEL_7;
  }
  if (a4)
  {
    +[VNError errorForUnsupportedRevision:a3 ofRequest:self];
    unint64_t v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unint64_t v8 = 0;
  }
LABEL_8:

  return v8;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v9.receiver = self;
  v9.super_class = (Class)VNClassifyImageRequest;
  id v4 = [(VNImageBasedRequest *)&v9 description];
  unint64_t v5 = VNImageCropAndScaleOptionToString([(VNClassifyImageRequest *)self imageCropAndScaleOption]);
  [v3 appendFormat:@"%@ %@", v4, v5];

  uint64_t v6 = [(VNClassifyImageRequest *)self customHierarchy];
  char v7 = (void *)v6;
  if (v6) {
    [v3 appendFormat:@" %@", v6];
  }

  return v3;
}

- (void)_setCustomHierarchy:(id)a3
{
  id v5 = a3;
  id v4 = [(VNRequest *)self configuration];
  [v4 setCustomHierarchy:v5];
}

+ (const)revisionAvailability
{
  return (const $1305BF644A263E76A656B24897EDB60D *)&+[VNClassifyImageRequest revisionAvailability]::ourRevisionAvailability;
}

+ (NSArray)knownClassificationsForRevision:(NSUInteger)requestRevision error:(NSError *)error
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = objc_alloc_init((Class)a1);
  if ([v6 setRevision:requestRevision error:error])
  {
    char v7 = [v6 supportedIdentifiersAndReturnError:error];
    if (v7)
    {
      unint64_t v8 = [v6 specifier];
      objc_super v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
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
            id v15 = [VNClassificationObservation alloc];
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
      objc_super v9 = 0;
    }
  }
  else
  {
    objc_super v9 = 0;
  }

  return (NSArray *)v9;
}

+ (id)descriptionForPrivateRevision:(unint64_t)a3
{
  if (a3 - 3737841664u >= 4)
  {
    v5.receiver = a1;
    v5.super_class = (Class)&OBJC_METACLASS___VNClassifyImageRequest;
    objc_msgSendSuper2(&v5, sel_descriptionForPrivateRevision_);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5B1CDD8[a3 - 3737841664u];
  }

  return v3;
}

+ (id)privateRevisionsSet
{
  if (+[VNClassifyImageRequest privateRevisionsSet]::onceToken != -1) {
    dispatch_once(&+[VNClassifyImageRequest privateRevisionsSet]::onceToken, &__block_literal_global_9352);
  }
  v2 = (void *)+[VNClassifyImageRequest privateRevisionsSet]::ourPrivateRevisions;

  return v2;
}

uint64_t __45__VNClassifyImageRequest_privateRevisionsSet__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  +[VNClassifyImageRequest privateRevisionsSet]::ourPrivateRevisions = VNRequestPrivateRevisionsSet(0xDECAF001uLL, a2, a3, a4, a5, a6, a7, a8, 3737841666);

  return MEMORY[0x1F41817F8]();
}

+ (BOOL)revision:(unint64_t)a3 mayAcceptResultsProducedByRevision:(unint64_t)a4
{
  unint64_t v7 = +[VNImageAnalyzerMultiDetector modelForRequestClass:a1 revision:a3];
  if (v7 != +[VNImageAnalyzerMultiDetector modelForRequestClass:a1 revision:a4])return 0; {
  v9.receiver = a1;
  }
  v9.super_class = (Class)&OBJC_METACLASS___VNClassifyImageRequest;
  return objc_msgSendSuper2(&v9, sel_revision_mayAcceptResultsProducedByRevision_, a3, a4);
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

@end