@interface VN1JC7R3k4455fKQz0dY1VhQ
+ (BOOL)revision:(unint64_t)a3 mayAcceptResultsProducedByRevision:(unint64_t)a4;
+ (const)revisionAvailability;
+ (id)descriptionForPrivateRevision:(unint64_t)a3;
+ (id)privateRevisionsSet;
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4;
- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4;
- (id)supportedAdjustmentKeysAndReturnError:(id *)a3;
@end

@implementation VN1JC7R3k4455fKQz0dY1VhQ

+ (BOOL)revision:(unint64_t)a3 mayAcceptResultsProducedByRevision:(unint64_t)a4
{
  if (a3 != a4) {
    return 0;
  }
  uint64_t v8 = v4;
  uint64_t v9 = v5;
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___VN1JC7R3k4455fKQz0dY1VhQ;
  return objc_msgSendSuper2(&v7, sel_revision_mayAcceptResultsProducedByRevision_, a3, a3);
}

+ (id)descriptionForPrivateRevision:(unint64_t)a3
{
  if (a3 == 3737841664)
  {
    uint64_t v5 = @"VN6Ukf2f2QO979ttLvyg0ZAQ";
  }
  else
  {
    uint64_t v8 = v3;
    uint64_t v9 = v4;
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___VN1JC7R3k4455fKQz0dY1VhQ;
    objc_msgSendSuper2(&v7, sel_descriptionForPrivateRevision_);
    uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

+ (id)privateRevisionsSet
{
  if (+[VN1JC7R3k4455fKQz0dY1VhQ privateRevisionsSet]::onceToken != -1) {
    dispatch_once(&+[VN1JC7R3k4455fKQz0dY1VhQ privateRevisionsSet]::onceToken, &__block_literal_global_2112);
  }
  v2 = (void *)+[VN1JC7R3k4455fKQz0dY1VhQ privateRevisionsSet]::ourPrivateRevisions;

  return v2;
}

uint64_t __47__VN1JC7R3k4455fKQz0dY1VhQ_privateRevisionsSet__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  +[VN1JC7R3k4455fKQz0dY1VhQ privateRevisionsSet]::ourPrivateRevisions = VNRequestPrivateRevisionsSet(0xDECAF000uLL, a2, a3, a4, a5, a6, a7, a8, 0);

  return MEMORY[0x1F41817F8]();
}

+ (const)revisionAvailability
{
  return (const $1305BF644A263E76A656B24897EDB60D *)&+[VN1JC7R3k4455fKQz0dY1VhQ revisionAvailability]::ourRevisionAvailability;
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  uint64_t v9 = v8;
  if (a3 == 1)
  {
    if (a5)
    {
      +[VNError errorForUnsupportedRevision:1 ofRequest:self];
      BOOL v10 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    v11 = [v8 session];
    id v20 = 0;
    v12 = [(VNRequest *)self applicableDetectorAndOptions:&v20 forRevision:a3 loadedInSession:v11 error:a5];
    id v13 = v20;
    if (v12)
    {
      uint64_t v14 = [v9 imageBufferAndReturnError:a5];
      v15 = (void *)v14;
      if (v14)
      {
        v21[0] = v14;
        v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
        [v13 setObject:v16 forKeyedSubscript:@"VNDetectorProcessOption_InputImageBuffers"];

        uint64_t v17 = [v9 qosClass];
        [(VNImageBasedRequest *)self regionOfInterest];
        v18 = objc_msgSend(v12, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v17, v13, self, a5, 0);
        BOOL v10 = v18 != 0;
        if (v18) {
          [(VNRequest *)self setResults:v18];
        }
      }
      else
      {
        BOOL v10 = 0;
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  return v10;
}

- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)VN1JC7R3k4455fKQz0dY1VhQ;
  id v6 = [(VNRequest *)&v11 newDefaultDetectorOptionsForRequestRevision:a3 session:a4];
  unint64_t v7 = +[VNImageAnalyzerMultiDetector modelForRequestClass:[(VNRequest *)self frameworkClass] revision:a3];
  if (v7)
  {
    id v8 = [NSNumber numberWithUnsignedInteger:v7];
    [v6 setObject:v8 forKeyedSubscript:@"VNImageAnalyzerMultiDetectorInitializationOption_Model"];

    [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"VNImageAnalyzerMultiDetectorInitializationOption_RequireSliderNet"];
    uint64_t v9 = [(VNImageAnalyzerMultiDetectorAnalysisConfiguration *)[VNImageAnalyzerMultiDetectorVN1JC7R3k4455fKQz0dY1VhQConfiguration alloc] initWithObservationsRecipient:self];
    [v6 setObject:v9 forKeyedSubscript:@"VNImageAnalyzerMultiDetectorOption_VN1JC7R3k4455fKQz0dY1VhQConfiguration"];
  }
  return v6;
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  if (a3 == 3737841664)
  {
    uint64_t v4 = @"VNSliderNetDetectorType";
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    uint64_t v4 = @"VNImageAnalyzerMultiDetectorType";
LABEL_5:
    uint64_t v5 = v4;
    goto LABEL_9;
  }
  if (a4)
  {
    +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:");
    uint64_t v4 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v4 = 0;
  }
LABEL_9:

  return v4;
}

- (id)supportedAdjustmentKeysAndReturnError:(id *)a3
{
  unint64_t v5 = [(VNRequest *)self resolvedRevision];
  id v6 = [(VNRequest *)self applicableDetectorClassAndOptions:0 forRevision:v5 error:a3];
  if (v6)
  {
    unint64_t v7 = v6;
    if ([(objc_class *)v6 isSubclassOfClass:objc_opt_class()])
    {
      id v6 = [(objc_class *)v7 allPhotosAdjustmentKeys];
    }
    else if ([(objc_class *)v7 isSubclassOfClass:objc_opt_class()])
    {
      id v6 = [(objc_class *)v7 supportedAdjustmentKeys];
    }
    else if (a3)
    {
      id v8 = +[VNError errorForUnsupportedRevision:v5 ofRequest:self];
      id v6 = 0;
      *a3 = v8;
    }
    else
    {
      id v6 = 0;
    }
  }

  return v6;
}

@end