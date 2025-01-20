@interface VNSceneClassificationRequest
+ (BOOL)revision:(unint64_t)a3 mayAcceptResultsProducedByRevision:(unint64_t)a4;
+ (Class)configurationClass;
+ (NSArray)knownSceneClassifications;
+ (const)dependentRequestCompatibility;
+ (const)revisionAvailability;
+ (id)descriptionForPrivateRevision:(unint64_t)a3;
+ (id)knownSceneClassificationsForRevision:(unint64_t)a3 error:(id *)a4;
+ (id)privateRevisionsSet;
- (BOOL)defineCustomHierarchy:(id)a3 error:(id *)a4;
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3;
- (VNClassificationCustomHierarchy)customHierarchy;
- (VNSceneClassificationRequest)initWithSceneObservation:(id)a3;
- (VNSceneClassificationRequest)initWithSceneObservation:(id)a3 completionHandler:(id)a4;
- (VNSceneObservation)sceneObservation;
- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4;
- (id)defineCustomHierarchyWithRelationships:(id)a3 error:(id *)a4;
- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4;
- (id)supportedIdentifiersAndReturnError:(id *)a3;
- (int64_t)dependencyProcessingOrdinality;
- (unint64_t)maximumHierarchicalObservations;
- (unint64_t)maximumLeafObservations;
- (void)_setCustomHierarchy:(id)a3;
- (void)applyConfigurationOfRequest:(id)a3;
- (void)resolvedRevisionDidChangeFromRevision:(unint64_t)a3;
- (void)setMaximumHierarchicalObservations:(unint64_t)a3;
- (void)setMaximumLeafObservations:(unint64_t)a3;
- (void)setSceneObservation:(id)a3;
@end

@implementation VNSceneClassificationRequest

+ (id)descriptionForPrivateRevision:(unint64_t)a3
{
  if (a3 == 3737841664)
  {
    v5 = @"VNSceneClassificationRequestPrivateRevisionSceneNetV4";
  }
  else if (a3 == 3737841665)
  {
    v5 = @"VNSceneClassificationRequestPrivateRevisionSceneNetV5";
  }
  else
  {
    uint64_t v8 = v3;
    uint64_t v9 = v4;
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___VNSceneClassificationRequest;
    objc_msgSendSuper2(&v7, sel_descriptionForPrivateRevision_);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

+ (id)privateRevisionsSet
{
  if (+[VNSceneClassificationRequest privateRevisionsSet]::onceToken != -1) {
    dispatch_once(&+[VNSceneClassificationRequest privateRevisionsSet]::onceToken, &__block_literal_global_2442);
  }
  v2 = (void *)+[VNSceneClassificationRequest privateRevisionsSet]::ourPrivateRevisions;

  return v2;
}

uint64_t __51__VNSceneClassificationRequest_privateRevisionsSet__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  +[VNSceneClassificationRequest privateRevisionsSet]::ourPrivateRevisions = VNRequestPrivateRevisionsSet(0xDECAF001uLL, a2, a3, a4, a5, a6, a7, a8, 0);

  return MEMORY[0x1F41817F8]();
}

+ (id)knownSceneClassificationsForRevision:(unint64_t)a3 error:(id *)a4
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

+ (NSArray)knownSceneClassifications
{
  v2 = objc_msgSend(a1, "knownSceneClassificationsForRevision:error:", objc_msgSend(a1, "defaultRevision"), 0);
  uint64_t v3 = v2;
  if (!v2) {
    v2 = (void *)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v4 = v2;

  return v4;
}

+ (const)dependentRequestCompatibility
{
  {
    +[VNSceneClassificationRequest dependentRequestCompatibility]::ourDependentRequestCompatibilityTable = 1;
    qword_1E963FE20 = objc_opt_class();
    unk_1E963FE28 = xmmword_1A40E7700;
    qword_1E963FE38 = objc_opt_class();
    unk_1E963FE40 = 2;
    qword_1E963FE50 = 0;
    unk_1E963FE58 = 0;
    qword_1E963FE48 = 0;
  }
  return (const $BB6EA70A2DEABF36E8ECE2B2BD0E2E04 *)&+[VNSceneClassificationRequest dependentRequestCompatibility]::ourDependentRequestCompatibilityTable;
}

+ (BOOL)revision:(unint64_t)a3 mayAcceptResultsProducedByRevision:(unint64_t)a4
{
  unint64_t v7 = +[VNImageAnalyzerMultiDetector modelForRequestClass:a1 revision:a3];
  if (v7 != +[VNImageAnalyzerMultiDetector modelForRequestClass:a1 revision:a4])return 0; {
  v9.receiver = a1;
  }
  v9.super_class = (Class)&OBJC_METACLASS___VNSceneClassificationRequest;
  return objc_msgSendSuper2(&v9, sel_revision_mayAcceptResultsProducedByRevision_, a3, a4);
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

- (int64_t)dependencyProcessingOrdinality
{
  return VNRequestDependencyProcessingOrdinalityAdjustedForConfiguredRequest(1000, self);
}

- (id)defineCustomHierarchyWithRelationships:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unint64_t v7 = +[VNClassificationCustomHierarchy customHierarchyForRequest:self error:a4];
  uint64_t v8 = v7;
  if (v7)
  {
    objc_super v9 = [v7 customHierarchyWithAdditionalRelationships:v6 error:a4];

    if (v9
      && [(VNSceneClassificationRequest *)self defineCustomHierarchy:v9 error:a4])
    {
      id v10 = v9;
      objc_super v9 = v10;
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
    objc_super v9 = 0;
  }

  return v10;
}

- (BOOL)defineCustomHierarchy:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6)
  {
    [(VNSceneClassificationRequest *)self _setCustomHierarchy:0];
    goto LABEL_5;
  }
  unint64_t v7 = [(VNRequest *)self resolvedRevision];
  uint64_t v8 = [v6 requestRevision];
  if (v7 == v8)
  {
    [(VNSceneClassificationRequest *)self _setCustomHierarchy:v6];
LABEL_5:
    LOBYTE(a4) = 1;
    goto LABEL_8;
  }
  if (a4)
  {
    objc_super v9 = [NSString stringWithFormat:@"the custom hierarchy is for request revision %lu, not %lu", v8, v7];
    *a4 = +[VNError errorForInvalidOperationWithLocalizedDescription:v9];

    LOBYTE(a4) = 0;
  }
LABEL_8:

  return (char)a4;
}

- (VNClassificationCustomHierarchy)customHierarchy
{
  v2 = [(VNRequest *)self configuration];
  uint64_t v3 = [v2 customHierarchy];

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

- (void)setSceneObservation:(id)a3
{
  id v5 = a3;
  id v4 = [(VNRequest *)self configuration];
  [v4 setSceneObservation:v5];
}

- (VNSceneObservation)sceneObservation
{
  v2 = [(VNRequest *)self configuration];
  unint64_t v3 = [v2 sceneObservation];

  return (VNSceneObservation *)v3;
}

- (id)supportedIdentifiersAndReturnError:(id *)a3
{
  unint64_t v5 = [(VNRequest *)self resolvedRevision];
  id v14 = 0;
  id v6 = [(VNRequest *)self applicableDetectorClassAndOptions:&v14 forRevision:v5 error:a3];
  id v7 = v14;
  if (!v6)
  {
    uint64_t v8 = 0;
    goto LABEL_5;
  }
  if ([(objc_class *)v6 isSubclassOfClass:objc_opt_class()])
  {
    uint64_t v8 = [(objc_class *)v6 allClassificationIdentifiersWithConfigurationOptions:v7 error:a3];
LABEL_5:
    id v9 = v7;
    goto LABEL_13;
  }
  id v10 = objc_alloc_init(VNSession);
  id v13 = v7;
  uint64_t v11 = [(VNRequest *)self applicableDetectorAndOptions:&v13 forRevision:v5 loadedInSession:v10 error:a3];
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
      uint64_t v8 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
LABEL_11:
    uint64_t v8 = 0;
    goto LABEL_12;
  }
  uint64_t v8 = [v11 allSceneIdentifiersWithOptions:v9 error:a3];
LABEL_12:

LABEL_13:

  return v8;
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if (a3 == 3737841665 || a3 == 2)
  {
    if (a5)
    {
      id v9 = +[VNError errorForUnsupportedConfigurationOfRequest:self];
LABEL_7:
      *a5 = v9;
    }
  }
  else if (a5)
  {
    id v9 = +[VNError errorForUnsupportedRevision:a3 ofRequest:self];
    goto LABEL_7;
  }

  return 0;
}

- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)VNSceneClassificationRequest;
  id v6 = [(VNRequest *)&v18 newDefaultDetectorOptionsForRequestRevision:a3 session:a4];
  id v7 = [(VNRequest *)self frameworkClass];
  if (+[VNCoreSceneUnderstandingDetector handlesRequestClass:v7 revision:a3])
  {
    id v8 = [[VNCoreSceneUnderstandingDetectorImageClassificationConfiguration alloc] initWithObservationsRecipient:self];
    v20[0] = v8;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    [v6 setObject:v9 forKeyedSubscript:@"VNCoreSceneUnderstandingDetectorProcessingOption_ImageClassificationConfigurations"];

    id v10 = v6;
  }
  else
  {
    unint64_t v11 = +[VNImageAnalyzerMultiDetector modelForRequestClass:v7 revision:a3];
    if (v11)
    {
      uint64_t v12 = [NSNumber numberWithUnsignedInteger:v11];
      [v6 setObject:v12 forKeyedSubscript:@"VNImageAnalyzerMultiDetectorInitializationOption_Model"];

      id v13 = [[VNImageAnalyzerMultiDetectorSceneClassificationConfiguration alloc] initWithObservationsRecipient:self];
      long long v19 = v13;
      id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
      [v6 setObject:v14 forKeyedSubscript:@"VNImageAnalyzerMultiDetectorOption_SceneConfigurations"];

      id v15 = v6;
    }
    else
    {
      id v16 = v6;
    }
  }

  return v6;
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  id v7 = [(VNRequest *)self frameworkClass];
  if (+[VNCoreSceneUnderstandingDetector handlesRequestClass:v7 revision:a3])
  {
    id v8 = @"VNCoreSceneUnderstandingDetectorType";
LABEL_5:
    id v9 = v8;
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

- (void)applyConfigurationOfRequest:(id)a3
{
  id v4 = (VNSceneClassificationRequest *)a3;
  if (self != v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)VNSceneClassificationRequest;
    [(VNImageBasedRequest *)&v7 applyConfigurationOfRequest:v4];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = [(VNSceneClassificationRequest *)v4 sceneObservation];
      [(VNSceneClassificationRequest *)self setSceneObservation:v5];

      id v6 = [(VNSceneClassificationRequest *)v4 customHierarchy];
      [(VNSceneClassificationRequest *)self _setCustomHierarchy:v6];

      [(VNSceneClassificationRequest *)self setMaximumLeafObservations:[(VNSceneClassificationRequest *)v4 maximumLeafObservations]];
      [(VNSceneClassificationRequest *)self setMaximumHierarchicalObservations:[(VNSceneClassificationRequest *)v4 maximumHierarchicalObservations]];
    }
  }
}

- (void)resolvedRevisionDidChangeFromRevision:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VNSceneClassificationRequest;
  [(VNRequest *)&v7 resolvedRevisionDidChangeFromRevision:a3];
  id v4 = [(VNSceneClassificationRequest *)self customHierarchy];
  unint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 requestRevision];
    if (v6 != [(VNRequest *)self resolvedRevision]) {
      [(VNSceneClassificationRequest *)self _setCustomHierarchy:0];
    }
  }
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(VNSceneClassificationRequest *)self customHierarchy];
  uint64_t v6 = [v4 customHierarchy];
  char v7 = VisionCoreEqualOrNilObjects();

  if ((v7 & 1) != 0
    && (unint64_t v8 = [(VNSceneClassificationRequest *)self maximumLeafObservations],
        v8 == [v4 maximumLeafObservations])
    && (unint64_t v9 = [(VNSceneClassificationRequest *)self maximumHierarchicalObservations],
        v9 == [v4 maximumHierarchicalObservations])
    && ((uint64_t v10 = [v4 resolvedRevision], v10 == 2) || v10 == 3737841665)
    && ([v4 sceneObservation], unint64_t v11 = objc_claimAutoreleasedReturnValue(), v11, !v11)
    && (unint64_t v12 = -[VNRequest detectionLevel](self, "detectionLevel"), v12 == [v4 detectionLevel]))
  {
    v15.receiver = self;
    v15.super_class = (Class)VNSceneClassificationRequest;
    BOOL v13 = [(VNImageBasedRequest *)&v15 willAcceptCachedResultsFromRequestWithConfiguration:v4];
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (void)_setCustomHierarchy:(id)a3
{
  id v5 = a3;
  id v4 = [(VNRequest *)self configuration];
  [v4 setCustomHierarchy:v5];
}

- (VNSceneClassificationRequest)initWithSceneObservation:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(VNRequest *)self initWithCompletionHandler:v7];
  unint64_t v9 = v8;
  if (v8)
  {
    [(VNSceneClassificationRequest *)v8 setSceneObservation:v6];
    -[VNRequest setRevision:](v9, "setRevision:", [v6 requestRevision]);
    uint64_t v10 = v9;
  }

  return v9;
}

- (VNSceneClassificationRequest)initWithSceneObservation:(id)a3
{
  return [(VNSceneClassificationRequest *)self initWithSceneObservation:a3 completionHandler:0];
}

+ (const)revisionAvailability
{
  return (const $1305BF644A263E76A656B24897EDB60D *)&+[VNSceneClassificationRequest(Revisioning) revisionAvailability]::ourRevisionAvailability;
}

@end