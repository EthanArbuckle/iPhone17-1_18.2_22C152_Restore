@interface VNAlignFaceRectangleRequest
+ (Class)configurationClass;
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (BOOL)resultsAreAssignedWithOriginatingRequestSpecifier;
- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3;
- (NSArray)inputFaceObservations;
- (VNAlignFaceRectangleRequest)initWithFaceObservations:(id)a3;
- (VNAlignFaceRectangleRequest)initWithFaceObservations:(id)a3 completionHandler:(id)a4;
- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4;
- (id)newDuplicateInstance;
- (int64_t)dependencyProcessingOrdinality;
@end

@implementation VNAlignFaceRectangleRequest

- (void).cxx_destruct
{
}

- (NSArray)inputFaceObservations
{
  return self->_inputFaceObservations;
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4 = a3;
  v5 = [(VNAlignFaceRectangleRequest *)self inputFaceObservations];
  v6 = [v4 inputFaceObservations];
  char IsSubsetOfFaceObservationsCollection = VNFaceObservationsCollectionIsSubsetOfFaceObservationsCollection(v5, v6);

  if (IsSubsetOfFaceObservationsCollection)
  {
    v10.receiver = self;
    v10.super_class = (Class)VNAlignFaceRectangleRequest;
    BOOL v8 = [(VNRequest *)&v10 willAcceptCachedResultsFromRequestWithConfiguration:v4];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  id v4 = @"VNFaceBoxAlignerType";
  return @"VNFaceBoxAlignerType";
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8 = a4;
  VNValidatedLog(1, @"Processing Align Face Rectangle request\n", v9, v10, v11, v12, v13, v14, v22);
  v15 = [(VNAlignFaceRectangleRequest *)self applicableDetectorTypeForRevision:a3 error:a5];
  if (!v15) {
    goto LABEL_9;
  }
  if (!self->_inputFaceObservations)
  {
    if (a5)
    {
      +[VNError errorWithCode:7 message:@"Input faces not provided to face rectangle aligner"];
      BOOL v20 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
LABEL_9:
    BOOL v20 = 0;
    goto LABEL_12;
  }
  v16 = [v8 session];
  v17 = [v8 imageBufferAndReturnError:a5];
  if (v17)
  {
    id v18 = [(VNRequest *)self newDefaultDetectorOptionsForRequestRevision:a3 session:v16];
    v19 = -[VNRequest processFaceObservations:revision:regionOfInterest:detectorType:detectorOptions:shouldAlignFaceBBox:shouldRunDetectorBlock:context:error:](self, "processFaceObservations:revision:regionOfInterest:detectorType:detectorOptions:shouldAlignFaceBBox:shouldRunDetectorBlock:context:error:", self->_inputFaceObservations, a3, v15, v18, &__block_literal_global_31966, &__block_literal_global_48, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24), v8, a5);
    BOOL v20 = v19 != 0;
    if (v19) {
      [(VNRequest *)self setResults:v19];
    }
  }
  else
  {
    BOOL v20 = 0;
  }

LABEL_12:
  return v20;
}

uint64_t __71__VNAlignFaceRectangleRequest_internalPerformRevision_inContext_error___block_invoke_2()
{
  return 0;
}

uint64_t __71__VNAlignFaceRectangleRequest_internalPerformRevision_inContext_error___block_invoke()
{
  return 1;
}

- (BOOL)resultsAreAssignedWithOriginatingRequestSpecifier
{
  return 0;
}

- (id)newDuplicateInstance
{
  id v3 = objc_alloc((Class)objc_opt_class());
  inputFaceObservations = self->_inputFaceObservations;
  v5 = [(VNRequest *)self completionHandler];
  v6 = (void *)[v3 initWithFaceObservations:inputFaceObservations completionHandler:v5];

  return v6;
}

- (VNAlignFaceRectangleRequest)initWithFaceObservations:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (+[VNValidationUtilities validateRequiredFaceObservations:v6 error:0])
  {
    v12.receiver = self;
    v12.super_class = (Class)VNAlignFaceRectangleRequest;
    id v8 = [(VNRequest *)&v12 initWithCompletionHandler:v7];
    if (v8)
    {
      uint64_t v9 = [v6 copy];
      inputFaceObservations = v8->_inputFaceObservations;
      v8->_inputFaceObservations = (NSArray *)v9;

      self = v8;
      id v8 = self;
    }
    else
    {
      self = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (VNAlignFaceRectangleRequest)initWithFaceObservations:(id)a3
{
  return [(VNAlignFaceRectangleRequest *)self initWithFaceObservations:a3 completionHandler:0];
}

- (int64_t)dependencyProcessingOrdinality
{
  return VNRequestDependencyProcessingOrdinalityAdjustedForConfiguredRequest(3000, self);
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

@end