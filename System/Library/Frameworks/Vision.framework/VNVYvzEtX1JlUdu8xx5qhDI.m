@interface VNVYvzEtX1JlUdu8xx5qhDI
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
- (void)setImageCropAndScaleOption:(unint64_t)a3;
@end

@implementation VNVYvzEtX1JlUdu8xx5qhDI

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
  if (v5 == [(VNVYvzEtX1JlUdu8xx5qhDI *)self imageCropAndScaleOption])
  {
    v8.receiver = self;
    v8.super_class = (Class)VNVYvzEtX1JlUdu8xx5qhDI;
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
  v12.super_class = (Class)VNVYvzEtX1JlUdu8xx5qhDI;
  id v6 = [(VNRequest *)&v12 newDefaultDetectorOptionsForRequestRevision:a3 session:a4];
  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[VNVYvzEtX1JlUdu8xx5qhDI imageCropAndScaleOption](self, "imageCropAndScaleOption"));
  [v6 setObject:v7 forKeyedSubscript:@"VNDetectorProcessOption_ImageCropAndScaleOption"];

  unint64_t v8 = +[VNImageAnalyzerMultiDetector modelForRequestClass:[(VNRequest *)self frameworkClass] revision:a3];
  if (v8)
  {
    v9 = [NSNumber numberWithUnsignedInteger:v8];
    [v6 setObject:v9 forKeyedSubscript:@"VNImageAnalyzerMultiDetectorInitializationOption_Model"];

    v10 = [(VNImageAnalyzerMultiDetectorAnalysisConfiguration *)[VNImageAnalyzerMultiDetectorVNVYvzEtX1JlUdu8xx5qhDIConfiguration alloc] initWithObservationsRecipient:self];
    [v6 setObject:v10 forKeyedSubscript:@"VNImageAnalyzerMultiDetectorOption_VNVYvzEtX1JlUdu8xx5qhDIConfiguration"];
  }
  return v6;
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  if (a3 == 3737841665 || a3 == 1)
  {
    uint64_t v5 = @"VNImageAnalyzerMultiDetectorType";
    id v6 = @"VNImageAnalyzerMultiDetectorType";
  }
  else if (a4)
  {
    +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:");
    uint64_t v5 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
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
  v9[11] = *MEMORY[0x1E4F143B8];
  unint64_t v5 = [(VNRequest *)self resolvedRevision];
  if (v5 == 3737841665 || v5 == 1)
  {
    v9[0] = @"VN62b042cc67e0a7d589ecdb58232fe23d";
    v9[1] = @"VN9bdc36cda32be948a5089e37392596ec";
    v9[2] = @"VN81aedeb999c79d74e79af7f1c922cf97";
    v9[3] = @"VN9f5b8e9dc1b3c824d79372f87b072ee3";
    v9[4] = @"VNbe5c67b06e95370f5a7b67b13e73637c";
    v9[5] = @"VN220a6626eb3cb51295a4e250ad9da319";
    v9[6] = @"VN0af6454e97767772ce64a19ddaf61f0c";
    v9[7] = @"VNeeab04670e53ebeb25150a31963a1aa6";
    v9[8] = @"VNa0c07362d05e1dafb35b96d20d5ce42d";
    v9[9] = @"VN79a8f83d9d55eb4eb2c9695902c47b53";
    v9[10] = @"VNacdca02f0900c2cb198193f3eec7b6c9";
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:11];
  }
  else if (a3)
  {
    id v7 = +[VNError errorForUnsupportedRevision:v5 ofRequest:self];
    id v6 = 0;
    *a3 = v7;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (BOOL)revision:(unint64_t)a3 mayAcceptResultsProducedByRevision:(unint64_t)a4
{
  if (a3 != a4) {
    return 0;
  }
  uint64_t v8 = v4;
  uint64_t v9 = v5;
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___VNVYvzEtX1JlUdu8xx5qhDI;
  return objc_msgSendSuper2(&v7, sel_revision_mayAcceptResultsProducedByRevision_, a3, a3);
}

+ (id)descriptionForPrivateRevision:(unint64_t)a3
{
  if (a3 == 3737841664)
  {
    uint64_t v5 = @"VNJ4fWm08v8TFm5lmRVji9G";
  }
  else if (a3 == 3737841665)
  {
    uint64_t v5 = @"VNBcvG8BSEpHsJWme0UsCjT";
  }
  else
  {
    uint64_t v8 = v3;
    uint64_t v9 = v4;
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___VNVYvzEtX1JlUdu8xx5qhDI;
    objc_msgSendSuper2(&v7, sel_descriptionForPrivateRevision_);
    uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

+ (id)privateRevisionsSet
{
  if (+[VNVYvzEtX1JlUdu8xx5qhDI privateRevisionsSet]::onceToken != -1) {
    dispatch_once(&+[VNVYvzEtX1JlUdu8xx5qhDI privateRevisionsSet]::onceToken, &__block_literal_global_6974);
  }
  v2 = (void *)+[VNVYvzEtX1JlUdu8xx5qhDI privateRevisionsSet]::ourPrivateRevisions;

  return v2;
}

uint64_t __46__VNVYvzEtX1JlUdu8xx5qhDI_privateRevisionsSet__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  +[VNVYvzEtX1JlUdu8xx5qhDI privateRevisionsSet]::ourPrivateRevisions = VNRequestPrivateRevisionsSet(0xDECAF001uLL, a2, a3, a4, a5, a6, a7, a8, 0);

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

@end