@interface VisionCoreNamedObjects(VNInternalAdditions)
- (uint64_t)VNEnumerateFloatValuesAtIndexes:()VNInternalAdditions asTensor:usingBlock:error:;
- (uint64_t)VNGetConfidenceValue:()VNInternalAdditions asTensor:error:;
@end

@implementation VisionCoreNamedObjects(VNInternalAdditions)

- (uint64_t)VNGetConfidenceValue:()VNInternalAdditions asTensor:error:
{
  id v8 = a4;
  v9 = [v8 shape];
  uint64_t v10 = [v9 elementCount];

  if (v10 == 1)
  {
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x2020000000;
    int v19 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __83__VisionCoreNamedObjects_VNInternalAdditions__VNGetConfidenceValue_asTensor_error___block_invoke;
    aBlock[3] = &unk_1E5B1DBC0;
    aBlock[4] = &v16;
    v11 = _Block_copy(aBlock);
    v12 = (void *)[objc_alloc(MEMORY[0x1E4F28D60]) initWithIndex:0];
    a5 = [a1 VNEnumerateFloatValuesAtIndexes:v12 asTensor:v8 usingBlock:v11 error:a5];

    if (a5) {
      *a3 = *((_DWORD *)v17 + 6);
    }

    _Block_object_dispose(&v16, 8);
  }
  else if (a5)
  {
    v13 = (void *)[[NSString alloc] initWithFormat:@"%@ does not provide a single confidence value", v8];
    *(void *)a5 = +[VNError errorForDataUnavailableWithLocalizedDescription:v13];

    a5 = 0;
  }

  return a5;
}

- (uint64_t)VNEnumerateFloatValuesAtIndexes:()VNInternalAdditions asTensor:usingBlock:error:
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = [v11 shape];
  uint64_t v32 = 0;
  if (([v13 getOneDimensionalArrayDimensionIndex:&v32 error:a6] & 1) == 0) {
    goto LABEL_10;
  }
  unint64_t v14 = [v13 elementCount];
  unint64_t v15 = [v10 firstIndex];
  if (v15 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v17 = [v10 lastIndex];
    if (v15 < v14 && v17 < v14)
    {
      uint64_t v18 = [v11 dataType];
      uint64_t v19 = [v13 rank];
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __105__VisionCoreNamedObjects_VNInternalAdditions__VNEnumerateFloatValuesAtIndexes_asTensor_usingBlock_error___block_invoke;
      aBlock[3] = &unk_1E5B1DB98;
      uint64_t v29 = v19;
      id v26 = v10;
      uint64_t v30 = v32;
      id v20 = v11;
      id v27 = v20;
      uint64_t v31 = v18;
      id v28 = v12;
      v21 = _Block_copy(aBlock);
      v22 = [v20 name];
      uint64_t v16 = [a1 accessReadOnlyDataForName:v22 usingBlock:v21 error:a6];

      v23 = v26;
LABEL_9:

      goto LABEL_11;
    }
    if (a6)
    {
      v23 = (void *)[[NSString alloc] initWithFormat:@"Value indexes of %@ are out of bounds of [0..%ld]", v10, v14 - 1];
      +[VNError errorForInvalidArgumentWithLocalizedDescription:v23];
      uint64_t v16 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
LABEL_10:
    uint64_t v16 = 0;
    goto LABEL_11;
  }
  uint64_t v16 = 1;
LABEL_11:

  return v16;
}

@end