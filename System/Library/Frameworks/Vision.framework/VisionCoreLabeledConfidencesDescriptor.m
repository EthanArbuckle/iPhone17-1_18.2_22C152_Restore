@interface VisionCoreLabeledConfidencesDescriptor
@end

@implementation VisionCoreLabeledConfidencesDescriptor

uint64_t __168__VisionCoreLabeledConfidencesDescriptor_VNInternalAdditions__newClassificationObservationsFromOutputObjects_originatingRequestSpecifier_operationPointsProvider_error___block_invoke(uint64_t a1, uint64_t a2, float a3, uint64_t a4, uint64_t a5)
{
  v8 = [*(id *)(a1 + 32) objectAtIndex:a2];
  v9 = *(void **)(a1 + 40);
  if (v9)
  {
    id v17 = 0;
    int v10 = [v9 getClassificationMetrics:&v17 forClassificationIdentifier:v8 error:a5];
    id v11 = v17;
    if (!v10)
    {
      uint64_t v12 = 0;
      goto LABEL_8;
    }
  }
  else
  {
    id v11 = 0;
  }
  v13 = [VNClassificationObservation alloc];
  *(float *)&double v14 = a3;
  v15 = [(VNClassificationObservation *)v13 initWithOriginatingRequestSpecifier:*(void *)(a1 + 48) identifier:v8 confidence:v11 classificationMetrics:v14];
  if (v15) {
    [*(id *)(a1 + 56) addObject:v15];
  }

  uint64_t v12 = 1;
LABEL_8:

  return v12;
}

@end