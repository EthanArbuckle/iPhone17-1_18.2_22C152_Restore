@interface VN6kBnCOr2mZlSV6yV1dLwB
+ (BOOL)warmUpSession:(id)a3 error:(id *)a4;
+ (Class)configurationClass;
+ (const)dependentRequestCompatibility;
+ (const)revisionAvailability;
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3;
- (VN6Ac6Cyl5O5oK19HboyMBR)inputSignatureprint;
- (VN6kBnCOr2mZlSV6yV1dLwB)initWithImageSignatureprintType:(unint64_t)a3 imageSignatureHashType:(unint64_t)a4;
- (VN6kBnCOr2mZlSV6yV1dLwB)initWithImageSignatureprintType:(unint64_t)a3 imageSignatureHashType:(unint64_t)a4 completionHandler:(id)a5;
- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4;
- (id)description;
- (id)imageSignaturnprintByRunningNeuralHashprintRequest:(id)a3 error:(id *)a4;
- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4;
- (int64_t)dependencyProcessingOrdinality;
- (unint64_t)imageSignatureHashType;
- (unint64_t)imageSignatureprintType;
- (void)applyConfigurationOfRequest:(id)a3;
- (void)setImageSignatureHashType:(unint64_t)a3;
- (void)setImageSignatureprintType:(unint64_t)a3;
- (void)setInputSignatureprint:(id)a3;
@end

@implementation VN6kBnCOr2mZlSV6yV1dLwB

- (id)imageSignaturnprintByRunningNeuralHashprintRequest:(id)a3 error:(id *)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = objc_alloc_init(VNCreateNeuralHashprintRequest);
  [(VNRequest *)v7 setRevision:1];
  v8 = [v6 requestPerformerAndReturnError:a4];
  if (!v8
    || (v19[0] = v7,
        [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1],
        v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = [v8 performDependentRequests:v9 onBehalfOfRequest:self inContext:v6 error:a4],
        v9,
        (v10 & 1) == 0))
  {
LABEL_8:
    v16 = 0;
    goto LABEL_9;
  }
  v11 = [(VNRequest *)v7 results];
  BOOL v12 = [v11 count] == 1;

  if (!v12)
  {
    if (a4)
    {
      +[VNError errorForInvalidArgumentWithLocalizedDescription:@"Internal error creating sceneprint"];
      v16 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  v13 = [(VNRequest *)v7 results];
  v14 = [v13 firstObject];

  v15 = [v14 imageNeuralHashprint];
  v16 = v15;
  if (v15)
  {
    id v17 = v15;
  }
  else if (a4)
  {
    *a4 = +[VNError errorForInvalidArgumentWithLocalizedDescription:@"Internal error while creating image signature print"];
  }

LABEL_9:

  return v16;
}

- (int64_t)dependencyProcessingOrdinality
{
  return VNRequestDependencyProcessingOrdinalityAdjustedForConfiguredRequest(2000, self);
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v9 = [v8 imageBufferAndReturnError:a5];
  if (v9
    && [(VNRequest *)self validateImageBuffer:v9 ofNonZeroWidth:0 andHeight:0 error:a5])
  {
    char v10 = [v8 session];
    id v20 = 0;
    v11 = [(VNRequest *)self applicableDetectorAndOptions:&v20 forRevision:a3 loadedInSession:v10 error:a5];
    id v12 = v20;
    if (!v11)
    {
      BOOL v15 = 0;
LABEL_18:

      goto LABEL_19;
    }
    v13 = [(VN6kBnCOr2mZlSV6yV1dLwB *)self inputSignatureprint];
    if (!v13)
    {
      if ([(VN6kBnCOr2mZlSV6yV1dLwB *)self imageSignatureprintType] != 3)
      {
        v13 = 0;
        goto LABEL_14;
      }
      v13 = [(VN6kBnCOr2mZlSV6yV1dLwB *)self imageSignaturnprintByRunningNeuralHashprintRequest:v8 error:a5];
      if (!v13) {
        goto LABEL_12;
      }
    }
    uint64_t v14 = [v13 imageSignatureprintType];
    if (v14 != [(VN6kBnCOr2mZlSV6yV1dLwB *)self imageSignatureprintType])
    {
      if (a5)
      {
        +[VNError errorForInvalidArgumentWithLocalizedDescription:@"Mismatch in signature print type"];
        BOOL v15 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:

        goto LABEL_18;
      }
LABEL_12:
      BOOL v15 = 0;
      goto LABEL_17;
    }
LABEL_14:
    v21[0] = v9;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    [v12 setObject:v16 forKeyedSubscript:@"VNDetectorProcessOption_InputImageBuffers"];

    [v12 setObject:v13 forKeyedSubscript:@"VNImageSignatureDetectorProcessOption_ImageSignatureprintInput"];
    uint64_t v17 = [v8 qosClass];
    [(VNImageBasedRequest *)self regionOfInterest];
    v18 = objc_msgSend(v11, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v17, v12, self, a5, 0);
    BOOL v15 = v18 != 0;
    if (v18) {
      [(VNRequest *)self setResults:v18];
    }

    goto LABEL_17;
  }
  BOOL v15 = 0;
LABEL_19:

  return v15;
}

- (void)setImageSignatureHashType:(unint64_t)a3
{
  id v4 = [(VNRequest *)self configuration];
  [v4 setImageSignatureHashType:a3];
}

- (unint64_t)imageSignatureHashType
{
  v2 = [(VNRequest *)self configuration];
  unint64_t v3 = [v2 imageSignatureHashType];

  return v3;
}

- (void)setImageSignatureprintType:(unint64_t)a3
{
  id v4 = [(VNRequest *)self configuration];
  [v4 setImageSignatureprintType:a3];
}

- (unint64_t)imageSignatureprintType
{
  v2 = [(VNRequest *)self configuration];
  unint64_t v3 = [v2 imageSignatureprintType];

  return v3;
}

- (void)setInputSignatureprint:(id)a3
{
  id v5 = a3;
  id v4 = [(VNRequest *)self configuration];
  [v4 setInputSignatureprint:v5];
  if (v5) {
    -[VN6kBnCOr2mZlSV6yV1dLwB setImageSignatureprintType:](self, "setImageSignatureprintType:", [v5 imageSignatureprintType]);
  }
}

- (VN6Ac6Cyl5O5oK19HboyMBR)inputSignatureprint
{
  v2 = [(VNRequest *)self configuration];
  unint64_t v3 = [v2 inputSignatureprint];

  return (VN6Ac6Cyl5O5oK19HboyMBR *)v3;
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 imageSignatureprintType];
  if (v5 != [(VN6kBnCOr2mZlSV6yV1dLwB *)self imageSignatureprintType]) {
    goto LABEL_5;
  }
  uint64_t v6 = [v4 imageSignatureHashType];
  if (v6 != [(VN6kBnCOr2mZlSV6yV1dLwB *)self imageSignatureHashType]) {
    goto LABEL_5;
  }
  v7 = [(VN6kBnCOr2mZlSV6yV1dLwB *)self inputSignatureprint];
  id v8 = [v4 inputSignatureprint];
  char v9 = VisionCoreEqualOrNilObjects();

  if (v9)
  {
    v12.receiver = self;
    v12.super_class = (Class)VN6kBnCOr2mZlSV6yV1dLwB;
    BOOL v10 = [(VNImageBasedRequest *)&v12 willAcceptCachedResultsFromRequestWithConfiguration:v4];
  }
  else
  {
LABEL_5:
    BOOL v10 = 0;
  }

  return v10;
}

- (VN6kBnCOr2mZlSV6yV1dLwB)initWithImageSignatureprintType:(unint64_t)a3 imageSignatureHashType:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a5;
  char v9 = 0;
  if (a3 == 3 && a4 == 1)
  {
    v12.receiver = self;
    v12.super_class = (Class)VN6kBnCOr2mZlSV6yV1dLwB;
    BOOL v10 = [(VNRequest *)&v12 initWithCompletionHandler:v8];
    self = v10;
    if (v10)
    {
      [(VN6kBnCOr2mZlSV6yV1dLwB *)v10 setImageSignatureprintType:3];
      [(VN6kBnCOr2mZlSV6yV1dLwB *)self setImageSignatureHashType:1];
      self = self;
      char v9 = self;
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (VN6kBnCOr2mZlSV6yV1dLwB)initWithImageSignatureprintType:(unint64_t)a3 imageSignatureHashType:(unint64_t)a4
{
  return [(VN6kBnCOr2mZlSV6yV1dLwB *)self initWithImageSignatureprintType:a3 imageSignatureHashType:a4 completionHandler:0];
}

- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)VN6kBnCOr2mZlSV6yV1dLwB;
  id v6 = [(VNRequest *)&v10 newDefaultDetectorOptionsForRequestRevision:a3 session:a4];
  if (a3 == 1)
  {
    v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[VN6kBnCOr2mZlSV6yV1dLwB imageSignatureprintType](self, "imageSignatureprintType"));
    [v6 setObject:v7 forKeyedSubscript:@"VNImageSignatureDetectorInitOption_ImageSignatureprintType"];

    id v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[VN6kBnCOr2mZlSV6yV1dLwB imageSignatureHashType](self, "imageSignatureHashType"));
    [v6 setObject:v8 forKeyedSubscript:@"VNImageSignatureDetectorInitOption_ImageSignatureHashType"];
  }
  return v6;
}

- (void)applyConfigurationOfRequest:(id)a3
{
  id v4 = (VN6kBnCOr2mZlSV6yV1dLwB *)a3;
  if (self != v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)VN6kBnCOr2mZlSV6yV1dLwB;
    [(VNImageBasedRequest *)&v6 applyConfigurationOfRequest:v4];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      [(VN6kBnCOr2mZlSV6yV1dLwB *)self setImageSignatureprintType:[(VN6kBnCOr2mZlSV6yV1dLwB *)v5 imageSignatureprintType]];
      [(VN6kBnCOr2mZlSV6yV1dLwB *)self setImageSignatureHashType:[(VN6kBnCOr2mZlSV6yV1dLwB *)v5 imageSignatureHashType]];
    }
  }
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  id v4 = @"VNImageSignatureDetectorType";
  return @"VNImageSignatureDetectorType";
}

+ (BOOL)warmUpSession:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___VN6kBnCOr2mZlSV6yV1dLwB;
  if (objc_msgSendSuper2(&v10, sel_warmUpSession_error_, v6, a4))
  {
    v7 = [[VN6kBnCOr2mZlSV6yV1dLwB alloc] initWithImageSignatureprintType:3 imageSignatureHashType:1];
    BOOL v8 = [(VNRequest *)v7 warmUpSession:v6 error:a4];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

+ (const)dependentRequestCompatibility
{
  {
    +[VN6kBnCOr2mZlSV6yV1dLwB dependentRequestCompatibility]::ourDependentRequestCompatibilityTable = 1;
    qword_1E963FD90 = objc_opt_class();
    unk_1E963FD98 = xmmword_1A410C100;
    qword_1E963FDA8 = objc_opt_class();
    unk_1E963FDB0 = 1;
    qword_1E963FDC0 = 0;
    unk_1E963FDC8 = 0;
    qword_1E963FDB8 = 0;
  }
  return (const $BB6EA70A2DEABF36E8ECE2B2BD0E2E04 *)&+[VN6kBnCOr2mZlSV6yV1dLwB dependentRequestCompatibility]::ourDependentRequestCompatibilityTable;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = [NSString alloc];
  v7.receiver = self;
  v7.super_class = (Class)VN6kBnCOr2mZlSV6yV1dLwB;
  id v4 = [(VNImageBasedRequest *)&v7 description];
  uint64_t v5 = (void *)[v3 initWithFormat:@"%@ %lu %lu", v4, -[VN6kBnCOr2mZlSV6yV1dLwB imageSignatureprintType](self, "imageSignatureprintType"), -[VN6kBnCOr2mZlSV6yV1dLwB imageSignatureHashType](self, "imageSignatureHashType")];

  return v5;
}

+ (const)revisionAvailability
{
  return (const $1305BF644A263E76A656B24897EDB60D *)&+[VN6kBnCOr2mZlSV6yV1dLwB(Revisioning) revisionAvailability]::ourRevisionAvailability;
}

@end