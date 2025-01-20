@interface VisionCoreLabeledConfidencesDescriptor(VNInternalAdditions)
- (uint64_t)newClassificationObservationsFromTensorData:()VNInternalAdditions originatingRequestSpecifier:operationPointsProvider:error:;
- (void)newClassificationObservationsFromOutputObjects:()VNInternalAdditions originatingRequestSpecifier:operationPointsProvider:error:;
@end

@implementation VisionCoreLabeledConfidencesDescriptor(VNInternalAdditions)

- (uint64_t)newClassificationObservationsFromTensorData:()VNInternalAdditions originatingRequestSpecifier:operationPointsProvider:error:
{
  v10 = (objc_class *)MEMORY[0x1E4FB3EE0];
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [v10 alloc];
  v15 = [a1 name];
  v16 = objc_msgSend(v14, "initWithNamedObjects:", v15, v13, 0);

  uint64_t v17 = [a1 newClassificationObservationsFromOutputObjects:v16 originatingRequestSpecifier:v12 operationPointsProvider:v11 error:a6];
  return v17;
}

- (void)newClassificationObservationsFromOutputObjects:()VNInternalAdditions originatingRequestSpecifier:operationPointsProvider:error:
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = v12;
  if (v12)
  {
    id v14 = [v12 operationPointsAndReturnError:a6];
    if (!v14)
    {
      a6 = 0;
      goto LABEL_13;
    }
  }
  else
  {
    id v14 = 0;
  }
  v15 = [a1 shape];
  uint64_t v16 = [v15 elementCount];
  uint64_t v17 = [a1 labels];
  if ([v17 count] == v16)
  {
    v18 = [a1 validLabelIndexes];
    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v18, "count"));
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __168__VisionCoreLabeledConfidencesDescriptor_VNInternalAdditions__newClassificationObservationsFromOutputObjects_originatingRequestSpecifier_operationPointsProvider_error___block_invoke;
    aBlock[3] = &unk_1E5B1E368;
    id v26 = v17;
    id v27 = v14;
    id v24 = v11;
    id v28 = v11;
    id v20 = v19;
    id v29 = v20;
    v21 = _Block_copy(aBlock);
    if ([v10 VNEnumerateFloatValuesAtIndexes:v18 asTensor:a1 usingBlock:v21 error:a6]) {
      a6 = v20;
    }
    else {
      a6 = 0;
    }

    id v11 = v24;
  }
  else if (a6)
  {
    v22 = objc_msgSend([NSString alloc], "initWithFormat:", @"Tensor with %lu elements does not align with %lu labels", v16, objc_msgSend(v17, "count"));
    *a6 = +[VNError errorForInternalErrorWithLocalizedDescription:v22];

    a6 = 0;
  }

LABEL_13:
  return a6;
}

@end